
local CLandUnit = import('/lua/defaultunits.lua').MobileUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFElectronBolterWeapon = CybranWeaponsFile.CDFElectronBolterWeapon
local CDFMissileMesonWeapon = CybranWeaponsFile.CDFMissileMesonWeapon
local CANTorpedoLauncherWeapon = CybranWeaponsFile.CANTorpedoLauncherWeapon

URL0203 = Class(CLandUnit) {

    Weapons = {
        Bolter = Class(CDFElectronBolterWeapon) {},
        Rocket = Class(CDFMissileMesonWeapon) {},
        Torpedo = Class(CANTorpedoLauncherWeapon) {},
    },
    
    OnStopBeingBuilt = function(self, builder, layer)
        CLandUnit.OnStopBeingBuilt(self,builder,layer)
        # If created with F2 on land, then play the transform anim.
        if(self:GetCurrentLayer() == 'Land') then
			# Enable Land weapons
	        self:SetWeaponEnabledByLabel('Rocket', true)
	        self:SetWeaponEnabledByLabel('Bolter', true)
			# Disable Torpedo
	        self:SetWeaponEnabledByLabel('Torpedo', false)
        elseif (self:GetCurrentLayer() == 'Seabed') then
			# Disable Land Weapons
	        self:SetWeaponEnabledByLabel('Rocket', false)
	        self:SetWeaponEnabledByLabel('Bolter', false)
			# Enable Torpedo
	        self:SetWeaponEnabledByLabel('Torpedo', true)
        end
       self.WeaponsEnabled = true
    end,

	OnLayerChange = function(self, new, old)
		CLandUnit.OnLayerChange(self, new, old)
		if self.WeaponsEnabled then
			if( new == 'Land' ) then
				# Enable Land weapons
				self:SetWeaponEnabledByLabel('Rocket', true)
				self:SetWeaponEnabledByLabel('Bolter', true)
				# Disable Torpedo
				self:SetWeaponEnabledByLabel('Torpedo', false)
			elseif ( new == 'Seabed' ) then
				# Disable Land Weapons
				self:SetWeaponEnabledByLabel('Rocket', false)
				self:SetWeaponEnabledByLabel('Bolter', false)
				# Enable Torpedo
				self:SetWeaponEnabledByLabel('Torpedo', true)
			end
		end
	end,
}
TypeClass = URL0203