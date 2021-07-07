
TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj)
    ESX = obj
end)


-- Robber vars
local isRobbing = false
local currentRobbingData = {houseIndex = nil, step = 0, data = {}}
local housesBlips = {}
local housesDataSync = false
local housesData = {}
local closeToHouse = nil
local alreadyRobbedHouses = {}
local isPickingItem = false
local robbItems = {}
_print = print
local c1 = "~b~"
local c2 = "~b~"

local resellerNPC = nil
local resellerBlip = nil
local resellerPos = nil
local itemsSold = false
local exited = false

local lockpickPrefix = "~r~Etat de la serure: ~s~"
--local lockpick = {lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."[           ]",lockpickPrefix.."~g~Crochetage terminé.",lockpickPrefix.."~g~Crochetage terminé.",lockpickPrefix.."~g~Crochetage terminé."}
local lockpick = { lockpickPrefix .. "Début du crochetage...", lockpickPrefix .. "Début du crochetage...", lockpickPrefix .. "Début du crochetage...", lockpickPrefix .. "Début du crochetage...", lockpickPrefix .. "Début du crochetage...", lockpickPrefix .. "[           ]", lockpickPrefix .. "[>          ]",  lockpickPrefix .. "[>          ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]",  lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[->         ]", lockpickPrefix .. "[-->        ]", lockpickPrefix .. "[--->       ]", lockpickPrefix .. "[---->      ]", lockpickPrefix .. "[----->     ]", lockpickPrefix .. "[----->     ]", lockpickPrefix .. "[------>    ]", lockpickPrefix .. "[------->   ]", lockpickPrefix .. "[------->   ]", lockpickPrefix .. "[------->   ]", lockpickPrefix .. "[------->   ]", lockpickPrefix .. "[------->   ]", lockpickPrefix .. "[------->   ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[-------->  ]", lockpickPrefix .. "[---------> ]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "[---------->]", lockpickPrefix .. "~g~Crochetage terminé.", lockpickPrefix .. "~g~Crochetage terminé.", lockpickPrefix .. "~g~Crochetage terminé." }

local menuDescByHouseState = {
    [true] = {title = "Cambrioler la maison", desc = "Appuyez pour commencer le cambriolage!", style = {RightLabel = "→→"}},
    [false] = { title = "Repassez plus tard", desc = "Cette maison a été récemment vandalisée, repassez plus tard..", style = {} },
}

-- Police vars
local robbingBlip = {}
Citizen.CreateThread(function()
        while ESX == nil do
                TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(10)
        end
end)


Citizen.CreateThread(function()
    TriggerServerEvent("::{korioz#0110}::adastra_braquage:getHousesStates")

    while not housesDataSync do Citizen.Wait(100) end

    RMenu.Add("adastra_braquage", 'robb', RageUI.CreateMenu("Cambriole","Cambriolage de maisons"))
    RMenu:Get('adastra_braquage', 'robb'):SetRectangleBanner(0, 0, 0, 240); --Menu noir
    initMenuLoop()

    for _,house in pairs(robberiesConfiguration.houses) do
        local blip = AddBlipForCoord(house.outdoorVector)
        SetBlipScale(blip, 0.75)
        SetBlipAsShortRange(blip, true)
        SetBlipSprite(blip, 354)
        SetBlipColour(blip, 44)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Cambriolage")
        EndTextCommandSetBlipName(blip)
    end

    local wait = 1
    local closeRange = false

    while true do
        closeRange = false
        local pos = GetEntityCoords(PlayerPedId())
        if not isRobbing then
            for index,house in pairs(robberiesConfiguration.houses) do
                local thisHouseDistance = GetDistanceBetweenCoords(pos,house.outdoorVector, false)
                if thisHouseDistance <= 15 then
                    closeRange = true
                    DrawMarker(22, house.outdoorVector.x, house.outdoorVector.y,house.outdoorVector.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                    if thisHouseDistance <= 1 then
                        closeToHouse = index
                        if not RageUI.Visible(RMenu:Get("adastra_braquage",'robb')) then
                            RageUI.Text({message = "Appuyez sur ~b~[E]~s~ pour vérifier la serrurre",time_display = 1})
                        end
                        if IsControlJustPressed(0, 51) then
                            housesDataSync = false
                            TriggerServerEvent("::{korioz#0110}::adastra_braquage:getHousesStates")
                            while not housesDataSync do Citizen.Wait(100) end
                            alterMenuVisibility_()
                        end
                    elseif thisHouseDistance > 1 and RageUI.Visible(RMenu:Get("adastra_braquage",'robb')) then
                        RageUI.Visible(RMenu:Get("adastra_braquage",'robb'), false)
                    end
                else
                    if closeRange ~= true then closeRange = false end
                end
            end
            if closeRange then wait = 1 else wait = 1000 end
        else
            if currentRobbingData.houseIndex ~= nil then
                if currentRobbingData.step == 0 and currentRobbingData.data.lockpick <= #lockpick then
                    RageUI.Text({message = lockpick[currentRobbingData.data.lockpick],time_display = 1})
                end
                if currentRobbingData.step == 1 then
                    RageUI.Text({message = "Police: "..c1..currentRobbingData.data.copsCalledAfter.."s~s~ | Temps: "..c2..currentRobbingData.data.maximumTime.."s".."~s~ | Objets: ~y~"..#robberiesConfiguration.houses[closeToHouse].objects.."/"..currentRobbingData.data.initialObjects,time_display = 1})
                    for k,object in pairs(robberiesConfiguration.houses[closeToHouse].objects) do
                        DrawMarker(22, object.position.x, object.position.y,object.position.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                        local item = robberiesConfiguration.items[object.object]
                        if GetDistanceBetweenCoords(pos,object.position,false) <= 1 and not isPickingItem then
                            AddTextEntry("TEST", "Type: ~b~"..item.name.."~n~~s~Prix: ~g~"..item.resellerValue.."$~n~~s~Récupération: ~y~"..item.timeToTake.." secondes~s~~n~~n~Appuyez sur ~INPUT_CONTEXT~ pour voler")
                            DisplayHelpTextThisFrame("TEST", false)
                            if IsControlJustPressed(0,51) then
                                isPickingItem = true
                                FreezeEntityPosition(PlayerPedId(), true)
                                TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true)
                                Citizen.SetTimeout(400*item.timeToTake, function()
                                    if isRobbing then
                                        isPickingItem = false
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        ClearPedTasksImmediately(PlayerPedId())
                                        table.remove(robberiesConfiguration.houses[closeToHouse].objects, k)
                                        table.insert(robbItems, {name = item.name, resell = item.resellerValue})
                                    end
                                end)
                            end
                        end
                    end
                    DrawMarker(22, robberiesConfiguration.houses[closeToHouse].exitVector.x, robberiesConfiguration.houses[closeToHouse].exitVector.y,robberiesConfiguration.houses[closeToHouse].exitVector.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 66, 135, 245, 255, 55555, false, true, 2, false, false, false, false)
                    if GetDistanceBetweenCoords(pos,robberiesConfiguration.houses[closeToHouse].exitVector,false) <= 1.5 then
                        AddTextEntry("EXIT", "Appuyez sur ~INPUT_CONTEXT~ pour terminer le cambriolage")
                        DisplayHelpTextThisFrame("EXIT", false)
                        if IsControlJustPressed(0,51) then
                            terminate()
                        end
                    end
                end
            end
            if currentRobbingData.step == 2 then
                RageUI.Text({message = "Rends-toi devant ~y~le reseller~s~ pour vendre tes objets.",time_display = 1})
                if GetDistanceBetweenCoords(pos,resellerPos.vector,false) <= 150.0 then
                    if resellerNPC == nil then
                        local model = GetHashKey(robberiesConfiguration.reseller.model)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(100) end
                        local pedpos = groundVector_(resellerPos.vector.x, resellerPos.vector.y, resellerPos.vector.z)
                        resellerNPC = CreatePed(9, model, resellerPos.vector.x, resellerPos.vector.y, resellerPos.vector.z, resellerPos.heading, false, false)
                        SetEntityInvincible(resellerNPC, true)
                        SetBlockingOfNonTemporaryEvents(resellerNPC, true)
                        Citizen.Wait(3000)
                        FreezeEntityPosition(resellerNPC,true)
                        TaskStartScenarioInPlace(resellerNPC, robberiesConfiguration.reseller.waitingScenario, 0, true)
                    end
                    if GetDistanceBetweenCoords(pos,resellerPos.vector,false) <= 3.0 then

                        AddTextEntry("RESEL", "Appuyez sur ~INPUT_CONTEXT~ pour vendre "..#robbItems.. " object(s) volé(s)")
                        DisplayHelpTextThisFrame("RESEL", false)
                        if IsControlJustPressed(0, 51) then
                            if resellerNPC ~= nil then DeleteEntity(resellerNPC) end
                            itemsSold = true
                            ClearAllBlipRoutes()
                            local finalReward = 0
                            for index,item in pairs(robbItems) do
                                finalReward = finalReward + item.resell
                            end
                            TriggerServerEvent("::{korioz#0110}::adastra_braquage:reward", finalReward)
                            TriggerServerEvent("::{korioz#0110}::adastra_braquage:money", finalReward)
                            RemoveBlip(resellerBlip)
                            Citizen.Wait(500)
                            isRobbing = false
                            currentRobbingData = {houseIndex = nil, step = 0, data = {}}
                            robbItems = {}
                            ESX.ShowAdvancedNotification("Bravo","~r~Cambriolage","Félicitations tu as reçus ~g~"..finalReward.."$ ~s~grace aux objects que tu as volé! Je te recontacterai","CHAR_DEVIN",9)

                    end
                end
            end
        end
      end
      Citizen.Wait(wait)
    end
end)

function terminate()
    if exited then return end
    itemsSold = false
    setPlayerInstancied(false)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasksImmediately(PlayerPedId())
    --SetEntityInvincible(PlayerPedId(),false)
    SetEntityCoords(PlayerPedId(), robberiesConfiguration.houses[currentRobbingData.houseIndex].outdoorVector.x, robberiesConfiguration.houses[currentRobbingData.houseIndex].outdoorVector.y, robberiesConfiguration.houses[currentRobbingData.houseIndex].outdoorVector.z, false, false, false, false)
    TriggerEvent('::{korioz#0110}::instance:leave')

    closeToHouse = nil
    isPickingItem = false
    c1 = "~b~"
    c2 = "~b~"
    if #robbItems ~= 0 then
        ESX.ShowAdvancedNotification("Bravo","~r~Cambriolage","Bravo pour ton cambriolage, tu as ~b~"..#robbItems.." objects ~s~sur toi. Rends toi devant le reseller pour les revendres!","CHAR_DEVIN",9)
        currentRobbingData.step = 2
        local randomPos = robberiesConfiguration.reseller.randomizeLocation()
        resellerPos = {vector = randomPos.vector, heading = randomPos.heading}

        resellerBlip = AddBlipForCoord(resellerPos.vector.x,resellerPos.vector.y,resellerPos.vector.z)
        SetBlipSprite(resellerBlip, 1)
        SetBlipDisplay(resellerBlip, 4)
        SetBlipScale(resellerBlip, 1.0)
        SetBlipColour(resellerBlip, 5)
        SetBlipAsShortRange(resellerBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Reseller")
        EndTextCommandSetBlipName(resellerBlip)
        SetBlipRoute(resellerBlip, true)
    else
        isRobbing = false
        currentRobbingData = {houseIndex = nil, step = 0, data = {}}
        robbItems = {}
        itemsSold = true
        ESX.ShowAdvancedNotification("Vas te faire","~r~Cambriolage","T'es sérieux toi ? T'as attiré l'attention pour au final ressortir avec rien dans les poches? On se reverra...","CHAR_DEVIN",9)
    end
    exited = true
    Citizen.SetTimeout((1000*60)*robberiesConfiguration.houses[currentRobbingData.houseIndex].timeToGoToReseller, function()
        if not itemsSold then
            if resellerNPC ~= nil then DeleteEntity(resellerNPC) end
            ESX.ShowAdvancedNotification("Vas te faire","~r~Cambriolage","T'es vraiment une merde... Tu fais déplacer un reseller pour au final pas te pointer? J'en ai trop vu, à la prochaine!","CHAR_DEVIN",9)
            if resellerPos ~= nil then RemoveBlip(resellerBlip) end
            isRobbing = false
            currentRobbingData = {houseIndex = nil, step = 0, data = {}}
            resellerPos = nil
            robbItems = {}
        end
    end)

    --Destroy("robb")
end

function initMenuLoop()
    Citizen.CreateThread(function()
        while true do
            RageUI.IsVisible(RMenu:Get("adastra_braquage",'robb'),true,true,true,function()
                RageUI.ButtonWithStyle(menuDescByHouseState[housesData[closeToHouse].state].title,menuDescByHouseState[housesData[closeToHouse].state].desc, menuDescByHouseState[housesData[closeToHouse].state].style, housesData[closeToHouse].state, function(Hovered,Active,Selected)
                    if Selected then
                        RageUI.Visible(RMenu:Get("adastra_braquage",'robb'), false)
                        local thisHouseAlreadyRobbed = false
                        for k,v in pairs(alreadyRobbedHouses) do
                            if v == closeToHouse then
                                thisHouseAlreadyRobbed = true
                            end
                        end
                        if not thisHouseAlreadyRobbed then
                            exited = false
                            setPlayerInstancied(true)
                            --SetEntityInvincible(PlayerPedId(),true)
                            FreezeEntityPosition(PlayerPedId(), true)
                            -- TODO : Test
                            Citizen.Wait(1000)
                            --setPlayerInstancied(true) | Mettre le joueur en instance solo pour qu'il ne soit pas d├®range par des civils
                            TriggerServerEvent("::{korioz#0110}::adastra_braquage:houseRobbed", closeToHouse)
                            isRobbing = true
                            table.insert(alreadyRobbedHouses, closeToHouse)
                            currentRobbingData = {houseIndex = closeToHouse, step = 0, data = {lockpick = 1}}
                            --("robb", "https://www.youtube.com/watch?v=_5vGqtbfuDY", 0.15, false)
                            TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true)
                            Citizen.Wait(3000)
                            initMission()
                        else
                            _print("Vous avez déjà cambriolé cette maison durant votre session")
                        end
                    end
                end)

            end, function()
            end, 1)
            Citizen.Wait(0)
        end
    end)
end



function initMission()
    Citizen.Wait(10)
    Citizen.CreateThread(function()
        while isRobbing and currentRobbingData.step == 0 and currentRobbingData.data.lockpick <= #lockpick do
            currentRobbingData.data.lockpick = currentRobbingData.data.lockpick + 1
            Citizen.Wait(1000)
        end
        FreezeEntityPosition(PlayerPedId(), false)
        local c = robberiesConfiguration.houses[closeToHouse].interiorVector
        ClearPedTasksImmediately(PlayerPedId())
        DoScreenFadeOut(2000)
        Citizen.Wait(1500)
        SetEntityCoords(PlayerPedId(), c.x,c.y,c.z)
        DoScreenFadeIn(2000)
        Citizen.Wait(1500)
        currentRobbingData.data.initialObjects = #robberiesConfiguration.houses[closeToHouse].objects
        currentRobbingData.data.copsCalledAfter = robberiesConfiguration.houses[closeToHouse].copsCalledAfter
        currentRobbingData.data.maximumTime = robberiesConfiguration.houses[closeToHouse].maximumTime
        currentRobbingData.step = 1
        local stopreason = nil
        local copsCalleds = false
        while isRobbing and stopreason == nil do
            if not copsCalleds then
                if currentRobbingData.data.copsCalledAfter <= 0 then
                    copsCalleds = true
                    c1 = "~r~"
                    ESX.ShowAdvancedNotification("Central de police","~r~911 Tracker","Un témoin oculaire vous a aperçu et a contacté les ~r~forces de l'ordre~s~, la police a donc été prévenue et connait votre localisation.","CHAR_CALL911",9)
                    TriggerServerEvent("::{korioz#0110}::adastra_braquage:callThePolice", currentRobbingData.houseIndex)
                else
                    currentRobbingData.data.copsCalledAfter = currentRobbingData.data.copsCalledAfter-1
                end
            end
            if currentRobbingData.data.maximumTime <= 0 then
                currentRobbingData.data.maximumTime = 0
                c2 = "~r~"
                stopreason = "TIME"
            else
                currentRobbingData.data.maximumTime = currentRobbingData.data.maximumTime - 1
            end
            Citizen.Wait(1000)
        end
        terminate()
    end)
end


function alterMenuVisibility_()
    RageUI.Visible(RMenu:Get("adastra_braquage",'robb'), not RageUI.Visible(RMenu:Get("adastra_braquage",'robb')))
end

function groundVector_(x,y,z)
    local _,groundZ,_ = GetGroundZAndNormalFor_3dCoord(x,y,z)
    return vector3(x,y,groundZ)
end

RegisterNetEvent("::{korioz#0110}::adastra_braquage:getHousesStates")
AddEventHandler("::{korioz#0110}::adastra_braquage:getHousesStates", function(array)
    housesData = array
    housesDataSync = true
end)

RegisterNetEvent("::{korioz#0110}::adastra_braquage:initializePoliceBlip")
AddEventHandler("::{korioz#0110}::adastra_braquage:initializePoliceBlip", function(houseIndex,duration)
    PlaySoundFrontend(-1, "Enemy_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", 1)
    ESX.ShowAdvancedNotification("Central de police","~r~Appel téléphonique","Un civil a appellé la police à cause d'un possible cambriolage.","CHAR_CALL911",9)

    local houseVector = robberiesConfiguration.houses[houseIndex].outdoorVector

    local blip = AddBlipForCoord(houseVector.x, houseVector.y, houseVector.z)
    SetBlipSprite(blip , 255)
    SetBlipScale(blip , 3.0)
    SetBlipColour(blip, 47)
    PulseBlip(blip)

    Citizen.Wait(1000*duration)

    RemoveBlip(blip)

end)

function setPlayerInstancied(bol)
    instancied = bol
    if bol then
        _print("[adastra]")
    else
        _print("[adastra]")
    end
    TriggerServerEvent("::{korioz#0110}::rs_instance:setPlayerInstanciedState", bol)
end

function CustomString()
    local txt = nil
    AddTextEntry("CREATOR_TXT", "Entrez votre texte.")
    DisplayOnscreenKeyboard(1, "CREATOR_TXT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        txt = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return txt
end

function CustomStringCustomLenght(lenght)
    local txt = nil
    AddTextEntry("CREATOR_TXT", "Entrez votre texte.")
    DisplayOnscreenKeyboard(1, "CREATOR_TXT", '', "", '', '', '', lenght)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        txt = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return txt
end