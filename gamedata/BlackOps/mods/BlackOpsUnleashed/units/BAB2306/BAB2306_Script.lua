local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local MiniPhasonLaser = import('/mods/BlackOpsUnleashed/lua/BlackOpsweapons.lua').MiniPhasonLaser

BAB2306 = Class(AStructureUnit) {

    Weapons = {
		MainGun = Class(MiniPhasonLaser){},
    },
	
	OnStopBeingBuilt = function(self,builder,layer)
	
        AStructureUnit.OnStopBeingBuilt(self,builder,layer)
		
		if not self.SpinManip then 
            self.SpinManip = CreateRotator(self, 'Rotator', 'y', nil, 50, 50, 50)
            self.Trash:Add(self.SpinManip)
        end

		self.SpinManip:SetTargetSpeed(320)

    end,
	
}

TypeClass = BAB2306