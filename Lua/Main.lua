qpotions_updateInterval = 1.0
qpotions_sinceLastUpdate = 1.0

SLASH_QPOTIONS1 = "/qpotions"
SlashCmdList["QPOTIONS"] = function(msg, editbox)
    if msg == "show" then
        QPotions_MainFrame:Show()
    elseif msg == "hide" then
        QPotions_MainFrame:Hide()
    elseif msg == "amount" then
        printPlants()
    end
end

-- check alchemy pot
-- check reagents for it
-- how many need
-- -oil
-- -flask
-- -prepot
-- check cooking
-- check reagents

function onload(self)
    print(GetAddOnMetadata("QPotions", "Title"))
end

function onupdate(self, elapsed)
    qpotions_sinceLastUpdate = qpotions_sinceLastUpdate + elapsed
    if (qpotions_sinceLastUpdate > qpotions_updateInterval) then
        -- CODE
        updatePlants()

        qpotions_sinceLastUpdate = 0
    end
end

function updatePlants()
    local mapID = C_Map.GetBestMapForUnit("player")

    local position = C_Map.GetPlayerMapPosition(mapID, "player")

    position.x = math.floor(position.x * 10000) / 100
    position.y = math.floor(position.y * 10000) / 100

    QPotions_MainFrame_xCoorNum:SetText(position.x)
    QPotions_MainFrame_yCoorNum:SetText(position.y)
    QPotions_MainFrame_azimuthNum:SetText("zzz")
end

function printPlants()
    local Nightshade = GetItemCount("Nightshade", true)
    local DeathBlossom = GetItemCount("Death Blossom", true)
    local RisingGlory = GetItemCount("Rising Glory", true)
    local Marrowroot = GetItemCount("Marrowroot", true)
    local VigilsTorch = GetItemCount("Vigil's Torch", true)
    local Widowbloom = GetItemCount("Widowbloom", true)
    local tr = GetItemCount("Tenebrous Ribs", true)
    local ccm = GetItemCount("Creeping Crawler Meat", true)

    print(
        string.format("Death Blossom (%s) \n", DeathBlossom) ..
            string.format("Nightshade (%s) \n", Nightshade) ..
                string.format("Rising Glory (%s) \n", RisingGlory) ..
                    string.format("Marrowroot (%s) \n", Marrowroot) ..
                        string.format("Vigil's Torch (%s) \n", VigilsTorch) ..
                            string.format("Widowbloom (%s)", Widowbloom)
    )
end
