local frame = CreateFrame("Frame")

local channelName = "canaldeseguimiento"

local function UnirseAlCanalDeSeguimiento()
    JoinChannelByName(channelName, nil, ChatFrame1:GetID())
end

local function EnviarMensaje(mensaje, canal)
    SendChatMessage(mensaje, "CHANNEL", nil, GetChannelName(canal))
end

local function EnviarMensajeDeInicioDeSesion()
    EnviarMensaje("¡Addon Hardcore activado!", channelName)
end

local function EnviarMensajeDeMuerte()
    local playerName = UnitName("player")
    SendChatMessage("¡" .. playerName .. " ha muerto!", "GUILD")
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_DEAD")

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        UnirseAlCanalDeSeguimiento()
        EnviarMensajeDeInicioDeSesion()
    elseif event == "PLAYER_DEAD" then
        EnviarMensajeDeMuerte()
    end
end)
