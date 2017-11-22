local CATEGORY_NAME = "_Kyle_1"

------------------------------ Fuck Up -----------------------------
function ulx.fuckup( calling_ply, target_plys )
	for i=1, #target_plys do
		local v = target_plys[ i ]
        if not v:Alive() then
            ULib.tsayError( calling_ply, v:Nick() .. " is dead and cannot be fucked!", true )
        else
            if v:InVehicle() then
                local vehicle = v:GetParent()
                v:ExitVehicle()
            end
            local ragdoll = ents.Create( "prop_ragdoll" )
            ragdoll:Spawn()
            v:SetParent( ragdoll )
            v:SendLua("chat.Open(1)")
            ragdoll:Remove()
        end
	end
end
local fuckup = ulx.command( CATEGORY_NAME, "ulx fuckup", ulx.fuckup, "!fuckup" )
fuckup:addParam{ type=ULib.cmds.PlayersArg }
fuckup:addParam{ type=ULib.cmds.BoolArg, invisible=true }
fuckup:defaultAccess( ULib.ACCESS_ADMIN )
fuckup:help( "fucks up target(s)." )