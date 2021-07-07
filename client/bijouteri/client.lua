TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

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

local lockpickPrefix = "~r~Crochetage: ~s~"
--local lockpick = {lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."[           ]",lockpickPrefix.."~g~Crochetage terminé.",lockpickPrefix.."~g~Crochetage terminé.",lockpickPrefix.."~g~Crochetage terminé."}
local lockpick = {lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."Début du crochetage...",lockpickPrefix.."[           ]",lockpickPrefix.."[>          ]",lockpickPrefix.."[>          ]",lockpickPrefix.."[>          ]",lockpickPrefix.."[>          ]",lockpickPrefix.."[->         ]", lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]", lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[->         ]",lockpickPrefix.."[-->        ]",lockpickPrefix.."[--->       ]",lockpickPrefix.."[---->      ]",lockpickPrefix.."[----->     ]",lockpickPrefix.."[----->     ]",lockpickPrefix.."[------>    ]",lockpickPrefix.."[------->   ]",lockpickPrefix.."[------->   ]",lockpickPrefix.."[------->   ]",lockpickPrefix.."[------->   ]",lockpickPrefix.."[------->   ]",lockpickPrefix.."[------->   ]", lockpickPrefix.."[------->   ]",lockpickPrefix.."[------->   ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[-------->  ]",lockpickPrefix.."[---------> ]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."[---------->]",lockpickPrefix.."~g~Crochetage terminé.",lockpickPrefix.."~g~Crochetage terminé.",lockpickPrefix.."~g~Crochetage terminé."}

local menuDescByHouseState = {
    [true] = {title = "Braqué la bijouterie", desc = "Appuyez pour commencer le braquage!", style = {RightLabel = "→→"}},
    [false] = { title = "Repassez plus tard", desc = "Cette bijouterie a été récemment vandalisée, repassez plus tard..", style = {} },
}

Citizen.CreateThread(function()
        while ESX == nil do
                TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(10)
        end
end)

-- Police vars
local robbingBlip = {}
animazione = false


Citizen.CreateThread(function()
    TriggerServerEvent("::{korioz#0110}::adastra_braquage:getHousesStates")

    while not housesDataSync do Citizen.Wait(100) end

    RMenu.Add("adastra_bijouteri", 'robb', RageUI.CreateMenu("Braquage","Braquer la bijouterie"))
    RMenu:Get("adastra_bijouteri", 'robb'):SetRectangleBanner(0, 0, 0, 240); --Menu noir
    initMenuLoope()

    for _,house in pairs(bijouterie.houses) do
        local blip = AddBlipForCoord(house.outdoorVector)
        SetBlipSprite(blip, 439)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Braquage de bijouterie")
        EndTextCommandSetBlipName(blip)
    end

    local wait = 1
    local closeRange = false

    while true do
        closeRange = false
        local pos = GetEntityCoords(PlayerPedId())
        if not isRobbing then
            for index,house in pairs(bijouterie.houses) do
                local thisHouseDistance = GetDistanceBetweenCoords(pos,house.outdoorVector, false)
                if thisHouseDistance <= 15 then
                    closeRange = true
                    DrawMarker(22, house.outdoorVector.x, house.outdoorVector.y,house.outdoorVector.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                    if thisHouseDistance <= 1 then
                        closeToHouse = index
                        if not RageUI.Visible(RMenu:Get("adastra_bijouteri",'robb')) then
                            RageUI.Text({message = "Appuyez sur ~b~[E]~s~ pour braqué",time_display = 1})
                        end
                        if IsControlJustPressed(0, 51) then
                            if IsPedArmed(PlayerPedId(), 4) then
                                housesDataSync = false
                                TriggerServerEvent("::{korioz#0110}::adastra_braquage:getHousesStates")
                                while not housesDataSync do Citizen.Wait(100) end
                                alterMenuVisibilitys_()
                            else
                                ESX.ShowAdvancedNotification("Vas te faire","~r~Braquage","T'es vraiment une merde... Tu essaye de braqué sans armes ? Vas y casse toi j'ai pas le temps de rigoler avec toi !","CHAR_DEVIN",9)
                            end
                        end
                    elseif thisHouseDistance > 1 and RageUI.Visible(RMenu:Get("adastra_bijouteri",'robb')) then
                        RageUI.Visible(RMenu:Get("adastra_bijouteri",'robb'), false)
                    end
                else
                    if closeRange ~= true then closeRange = false end
                end
            end
            if closeRange then wait = 1 else wait = 1000 end
        else
            if currentRobbingData.houseIndex ~= nil then
                --if currentRobbingData.step == 0 and currentRobbingData.data.lockpick <= #lockpick then
                --    RageUI.Text({message = lockpick[currentRobbingData.data.lockpick],time_display = 1})
                --end
                if currentRobbingData.step == 1 then
                    RageUI.Text({message = "Police: "..c1..currentRobbingData.data.copsCalledAfter.."s~s~ | Temps: "..c2..currentRobbingData.data.maximumTime.."s".."~s~ | Objets: ~y~"..#bijouterie.houses[closeToHouse].objects.."/"..currentRobbingData.data.initialObjects,time_display = 1})
                    for k,object in pairs(bijouterie.houses[closeToHouse].objects) do
                        DrawMarker(22, object.position.x, object.position.y,object.position.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                        local item = bijouterie.items[object.object]
                        if GetDistanceBetweenCoords(pos,object.position,false) <= 1 and not isPickingItem then
                            AddTextEntry("TEST", "Type: ~b~"..item.name.."~n~~s~Prix: ~g~"..item.resellerValue.."$~n~~s~Récupération: ~y~"..item.timeToTake.." secondes~s~~n~~n~Appuyez sur ~INPUT_CONTEXT~ pour voler")
                            DisplayHelpTextThisFrame("TEST", false)
                            if IsControlJustPressed(0,51) then
                                animazione = true

                                isPickingItem = true
                                FreezeEntityPosition(PlayerPedId(), true)
                                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                                    RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                                Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")

                                loadAnimDict( "missheist_jewel" )
                                TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                                Citizen.SetTimeout(1000*item.timeToTake, function()
                                    if isRobbing then
                                        isPickingItem = false
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        ClearPedTasksImmediately(PlayerPedId())
                                        PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

                                        table.remove(bijouterie.houses[closeToHouse].objects, k)
                                        table.insert(robbItems, {name = item.name, resell = item.resellerValue})
                                        animazione = false
                                    end
                                end)
                            end
                        end
                    end
                    DrawMarker(22, bijouterie.houses[closeToHouse].exitVector.x, bijouterie.houses[closeToHouse].exitVector.y,bijouterie.houses[closeToHouse].exitVector.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 66, 135, 245, 255, 55555, false, true, 2, false, false, false, false)
                    if GetDistanceBetweenCoords(pos,bijouterie.houses[closeToHouse].exitVector,false) <= 1.5 then
                        AddTextEntry("EXIT", "Appuyez sur ~INPUT_CONTEXT~ pour terminer le braquage de bijouterie")
                        DisplayHelpTextThisFrame("EXIT", false)
                        if IsControlJustPressed(0,51) then
                            terminatee()
                        end
                    end
                end
            end
            if currentRobbingData.step == 2 then
                RageUI.Text({message = "Rends-toi devant ~y~le reseller~s~ pour vendre tes objets.",time_display = 1})
                if GetDistanceBetweenCoords(pos,resellerPos.vector,false) <= 150.0 then
                    if resellerNPC == nil then
                        local model = GetHashKey(bijouterie.reseller.model)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(100) end
                        local pedpos = groundVector_(resellerPos.vector.x, resellerPos.vector.y, resellerPos.vector.z)
                        resellerNPC = CreatePed(9, model, resellerPos.vector.x, resellerPos.vector.y, resellerPos.vector.z, resellerPos.heading, false, false)
                        SetEntityInvincible(resellerNPC, true)
                        SetBlockingOfNonTemporaryEvents(resellerNPC, true)
                        Citizen.Wait(3000)
                        FreezeEntityPosition(resellerNPC,true)
                        TaskStartScenarioInPlace(resellerNPC, bijouterie.reseller.waitingScenario, 0, true)
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
                            TriggerServerEvent("::{korioz#0110}::adastra_bijouterie:reward", finalReward)
                            TriggerServerEvent("::{korioz#0110}::adastra_bijouterie:money", finalReward)
                            RemoveBlip(resellerBlip)
                            Citizen.Wait(500)
                            isRobbing = false
                            currentRobbingData = {houseIndex = nil, step = 0, data = {}}
                            robbItems = {}
                            ESX.ShowAdvancedNotification("Bravo","~r~Bijouterie","Félicitations tu as recus ~g~"..finalReward.."$ ~s~grâce aux objects que tu as volé! Je te recontacterai","CHAR_DEVIN",9)

                    end
                end
            end
        end
      end
      Citizen.Wait(wait)
    end
end)

function terminatee()
    if exited then return end
    itemsSold = false
    setPlayerInstancied(false)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasksImmediately(PlayerPedId())
    --SetEntityInvincible(PlayerPedId(),false)
    SetEntityCoords(PlayerPedId(), bijouterie.houses[currentRobbingData.houseIndex].outdoorVector.x, bijouterie.houses[currentRobbingData.houseIndex].outdoorVector.y, bijouterie.houses[currentRobbingData.houseIndex].outdoorVector.z, false, false, false, false)
    closeToHouse = nil
    isPickingItem = false
    c1 = "~b~"
    c2 = "~b~"
    if #robbItems ~= 0 then
        ESX.ShowAdvancedNotification("Bravo","~r~Bijouterie","Bravo pour ton vol, tu as ~b~"..#robbItems.." objects ~s~sur toi. Rends toi devant le reseller pour les revendres!","CHAR_DEVIN",9)
        currentRobbingData.step = 2
        local randomPos = bijouterie.reseller.randomizeLocation()
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
    Citizen.SetTimeout((1000*60)*bijouterie.houses[currentRobbingData.houseIndex].timeToGoToReseller, function()
        if not itemsSold then
            if resellerNPC ~= nil then DeleteEntity(resellerNPC) end
            ESX.ShowAdvancedNotification("Vas te faire","~r~Cambriolage","T'es vraiment une merde... Tu fais déplacer un reseller pour au final pas te pointer? J'en ai trop vu, ├á la prochaine!","CHAR_DEVIN",9)
            if resellerPos ~= nil then RemoveBlip(resellerBlip) end
            isRobbing = false
            currentRobbingData = {houseIndex = nil, step = 0, data = {}}
            resellerPos = nil
            robbItems = {}
        end
    end)

    --Destroy("robb")
end

function initMenuLoope()
    Citizen.CreateThread(function()
        while true do
            RageUI.IsVisible(RMenu:Get("adastra_bijouteri",'robb'),true,true,true,function()
                RageUI.ButtonWithStyle(menuDescByHouseState[housesData[closeToHouse].state].title,menuDescByHouseState[housesData[closeToHouse].state].desc, menuDescByHouseState[housesData[closeToHouse].state].style, housesData[closeToHouse].state, function(Hovered,Active,Selected)
                    if Selected then
                        RageUI.Visible(RMenu:Get("adastra_bijouteri",'robb'), false)
                        local thisHouseAlreadyRobbed = false
                        for k,v in pairs(alreadyRobbedHouses) do
                            if v == closeToHouse then
                                thisHouseAlreadyRobbed = true
                            end
                        end
                        if not thisHouseAlreadyRobbed then
                            exited = false
                            Citizen.Wait(1000)
                            TriggerServerEvent("::{korioz#0110}::adastra_bijouterie:houseRobbed", closeToHouse)
                            isRobbing = true
                            table.insert(alreadyRobbedHouses, closeToHouse)
                            currentRobbingData = {houseIndex = closeToHouse, step = 0, data = {lockpick = 1}}
                            --("robb", "https://www.youtube.com/watch?v=_5vGqtbfuDY", 0.15, false)
                            Citizen.Wait(3000)
                            initMissions()
                        else
                            _print("Vous avez déja cambriolé cette maison durant votre session")
                        end
                    end
                end)

            end, function()
            end, 1)
            Citizen.Wait(0)
        end
    end)
end



function initMissions()
    Citizen.Wait(10)
    Citizen.CreateThread(function()
        --while isRobbing and currentRobbingData.step == 0 and currentRobbingData.data.lockpick <= #lockpick do
        --    currentRobbingData.data.lockpick = currentRobbingData.data.lockpick + 1
        --    Citizen.Wait(1000)
        --end
        --FreezeEntityPosition(PlayerPedId(), false)
        --local c = bijouterie.houses[closeToHouse].interiorVector
        --ClearPedTasksImmediately(PlayerPedId())
        --DoScreenFadeOut(2000)
        --Citizen.Wait(1500)
        --SetEntityCoords(PlayerPedId(), c.x,c.y,c.z)
        --DoScreenFadeIn(2000)
        --Citizen.Wait(1500)
        currentRobbingData.data.initialObjects = #bijouterie.houses[closeToHouse].objects
        currentRobbingData.data.copsCalledAfter = bijouterie.houses[closeToHouse].copsCalledAfter
        currentRobbingData.data.maximumTime = bijouterie.houses[closeToHouse].maximumTime
        currentRobbingData.step = 1
        local stopreason = nil
        local copsCalleds = false
        while isRobbing and stopreason == nil do
            if not copsCalleds then
                if currentRobbingData.data.copsCalledAfter <= 0 then
                    copsCalleds = true
                    c1 = "~r~"
                    ESX.ShowAdvancedNotification("Central de police","~r~911 Tracker","Un témoin oculaire vous a apercu et a contacté les ~r~forces de l'ordre~s~, la police a donc été prévenue et connait votre localisation.","CHAR_CALL911",9)
                    TriggerServerEvent("::{korioz#0110}::adastra_bijouterie:callThePolice", currentRobbingData.houseIndex)
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
        terminatee()
    end)
end


function alterMenuVisibilitys_()
    RageUI.Visible(RMenu:Get("adastra_bijouteri",'robb'), not RageUI.Visible(RMenu:Get("adastra_bijouteri",'robb')))
end

function DrawAdvancedNotification_(sender, subject, msg, textureDict, iconType)
    SetAudioFlag("LoadMPData", 1)
    PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 1)
        AddTextEntry('AutoEventAdvNotif', msg)
        BeginTextCommandThefeedPost('AutoEventAdvNotif')
        EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
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

RegisterNetEvent("::{korioz#0110}::adastra_braquage:initializePoliceBlipx")
AddEventHandler("::{korioz#0110}::adastra_braquage:initializePoliceBlipx", function(houseIndex,duration)
    PlaySoundFrontend(-1, "Enemy_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", 1)
    ESX.ShowAdvancedNotification("Central de police","~r~Appel téléphonique","Un civil a appellé la police ├á cause d'un possible cambriolage.","CHAR_CALL911",9)

    local houseVector = bijouterie.houses[houseIndex].outdoorVector

    local blip = AddBlipForCoord(houseVector.x, houseVector.y, houseVector.z)
        SetBlipSprite(blip , 161)
        SetBlipScale(blip , 3.0)
        SetBlipColour(blip, 47)
    PulseBlip(blip)

    Citizen.Wait(1000*duration)

    RemoveBlip(blip)

end)

function setPlayerInstancied(bol)
    instancied = bol
    if bol then
        _print("[Adastra]")
    else
        _print("[Adastra]")
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

Citizen.CreateThread(function()

        while true do
                Wait(1)
                if animazione == true then
                        if not IsEntityPlayingAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 3) then
                                TaskPlayAnim(PlayerPedId(), 'missheist_jewel', 'smash_case', 8.0, 8.0, -1, 17, 1, false, false, false)
                        end
                end
        end
end)
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end