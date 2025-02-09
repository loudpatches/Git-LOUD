-- Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
--

-- This is the user-side session specific top-level lua initialization
-- file.  It is loaded into a fresh lua state when a new session is
-- initialized.

LOG("*DEBUG Mohodata SessionInit ")

InitialRegistration = true

-- start loading UI side --
doscript '/lua/userInit.lua'

-- Add UI-only mods to the list of mods to use
for i,m in ipairs(import('/lua/mods.lua').GetUiMods()) do
    table.insert(__active_mods, m)
end

LOG("*DEBUG Active mods in session: "..repr(__active_mods) )

doscript '/lua/UserSync.lua'


LOG("*DEBUG Mohodata SessionInit Complete ")
