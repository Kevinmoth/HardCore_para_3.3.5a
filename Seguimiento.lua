local frame = CreateFrame("Frame")

-- une al jugador a un canal global de seguimiento(puede usarse para agregar verificaciones)
local function UnirseAlCanalDeSeguimiento()
    JoinChannelByName("canaldeseguimiento", nil, ChatFrame1:GetID()) -- Cambia "canaldeseguimiento" al nombre que desees para tu canal.
end

-- Fse envia un mensaje al canal de siguimiento cuando el jugador inicie sesión.
local function EnviarMensajeDeInicioDeSesion()
    SendChatMessage("¡Addon Hardcore activado!", "CHANNEL", nil, GetChannelName("canaldeseguimiento")) -- Cambia "canaldeseguimiento" al nombre de tu canal.
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_DEAD")

frame:SetScript("OnEvent", function(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
    if event == "PLAYER_LOGIN" then
        UnirseAlCanalDeSeguimiento()
        EnviarMensajeDeInicioDeSesion()
    elseif event == "PLAYER_DEAD" then
        local playerName = UnitName("player")
        SendChatMessage("¡" .. playerName .. " ha muerto!", "GUILD")
    end
end)
