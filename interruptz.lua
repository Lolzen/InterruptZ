--//		InterruptZ		//--

local eF = CreateFrame("Frame", "eventFrame", UIParent)
eF:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

function eF.COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17)
	if arg5 == UnitName("Player") and IsInGroup("player") then
		if string.find(arg2, "_INTERRUPT") then
			SendChatMessage("Unterbrochen: "..GetSpellLink(arg15).." von "..arg9, "PARTY", nil)
		end
	end
end

eF:SetScript("OnEvent", function(self, event, ...)  
	if(self[event]) then
		self[event](self, event, ...)
	else
		print("InterruptZ debug: "..event)
	end 
end)