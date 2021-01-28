
surface.CreateFont ( "HudFont", {
	font = "Arial",
	size = ScrW() *.01, ScrH() * .02,
	weight = 500
})

surface.CreateFont ( "Ammo", {
	font = "Arial",
	size = ScrW() *.03, ScrH() * .04,
	weight = 500,
	antialias = true,
	shadow = true,
	outline = true
})

surface.CreateFont ( "Weapon", {
	font = "Arial",
	size = ScrW() *.02, ScrH() * .03,
	weight = 500,
	antialias = true,
	shadow = true,
	outline = true
})

surface.CreateFont ( "Name", {
	font = "Arial",
	size = ScrW() *.02, ScrH() * .02,
	weight = 500,
	antialias = true,
	shadow = true,
	outline = true
})





		
hook.Add( "HUDPaint", "Hud", function()

		-- health --

	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local boxW = ScrW() * .1
	local boxH = ScrH() * .02

	if ply:Alive() == -1 then return end
	
	if ply:InVehicle() then return end

	surface.SetDrawColor(0,0,0,100)
	surface.DrawRect(ScrW() / 2 - boxW / 2,ScrH() - boxH * 1, boxW, boxH)

	surface.SetDrawColor(255,0,0,255)
	surface.DrawRect(ScrW() / 2 - boxW / 2,ScrH() - boxH * 1, boxW * (hp / maxhp), boxH)

	surface.SetFont( "HudFont" )
	surface.SetTextColor( 255, 255, 255, 200 )
	surface.SetTextPos( ScrW() / 1.99 - boxW / 2,ScrH() - boxH * 1, boxW, boxH )
	surface.DrawText( hp )

		-- armor --

	local arm = ply:Armor()
	local maxarm = ply:GetMaxArmor()
	local boxW = ScrW() * .1
	local boxH = ScrH() * .02

	surface.SetDrawColor(0,0,0,100)
	surface.DrawRect(ScrW() / 2 - boxW / 2,ScrH() - boxH * 2.5, boxW, boxH)

	surface.SetDrawColor(0,100,255,255)
	surface.DrawRect(ScrW() / 2 - boxW / 2,ScrH() - boxH * 2.5, boxW * (arm / maxarm), boxH)
	
	surface.SetFont( "HudFont" )
	surface.SetTextColor( 255, 255, 255, 200 )
	surface.SetTextPos( ScrW() / 1.99 - boxW / 2,ScrH() - boxH * 2.5, boxW, boxH )
	surface.DrawText( arm )

		-- stamina --
			
	local stamina = ply:Health()
	local maxstamina = ply:GetMaxHealth()

	surface.SetDrawColor(0,0,0,100)
	surface.DrawRect(ScrW() / 2 - boxW / 2,ScrH() - boxH * 4, boxW, boxH)

	surface.SetDrawColor(205,205,0,205)
	surface.DrawRect(ScrW() / 2 - boxW / 2,ScrH() - boxH * 4, boxW, boxH)
	
	surface.SetFont( "HudFont" )
	surface.SetTextColor( 255, 255, 255, 200 )
	surface.SetTextPos( ScrW() / 1.99 - boxW / 2,ScrH() - boxH * 4, boxW, boxH )
	surface.DrawText( "Stamina" )

		--CharInfo--

	local NameVar = ply:GetName()
	local Clone_idVar = ply:GetClassID()
	local UserGroupVar = ply:GetUserGroup()
	local boxW = ScrW() * .2
	local boxH = ScrH() * .08

	surface.SetDrawColor(0,0,0,100)
	surface.DrawRect(ScrW() / 1 - boxW / 1,ScrH() - boxH * 6, boxW, boxH)

	surface.SetFont( "Name" )
	surface.SetTextColor( 255, 255, 255, 200 )
	surface.SetTextPos(ScrW() / .99 - boxW / 1,ScrH() - boxH * 5.7, boxW, boxH)
	surface.DrawText( NameVar )

	surface.SetTextPos(ScrW() / .9 - boxW / 1,ScrH() - boxH * 5.7, boxW, boxH)
	surface.DrawText( Clone_idVar )

	surface.SetTextPos(ScrW() / .99 - boxW / 1,ScrH() - boxH * 6.4, boxW, boxH)
	surface.DrawText( UserGroupVar )

		-- ammo --
		
	local WepVar = ply:GetActiveWeapon()
	local ClipVar = ply:GetActiveWeapon():Clip1() 
	local AmmoVar = ply:GetAmmoCount( ply:GetActiveWeapon():GetPrimaryAmmoType() )
	local NameVar = ply:GetActiveWeapon():GetPrintName()

	if ClipVar == -1 then return end

	surface.SetDrawColor(0,0,0,100)
	surface.DrawRect(ScrW() / 1 - boxW / 1,ScrH() - boxH * 1, boxW, boxH)
			
	surface.SetFont( "Ammo" )
	surface.SetTextColor( 255, 255, 255, 200 )
	surface.SetTextPos( ScrW() / .985 - boxW / 1,ScrH() - boxH * .8, boxW, boxH)
	surface.DrawText( ClipVar )

	surface.SetTextPos( ScrW() / .905 - boxW / 1,ScrH() - boxH * .8, boxW, boxH)
	surface.DrawText( AmmoVar )

	surface.SetFont( "Weapon" )
	surface.SetTextPos( ScrW() / .985 - boxW / 1,ScrH() - boxH * 1.4, boxW, boxH)
	surface.DrawText( NameVar )

end)	

		--Hide Default Hud--

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true

}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end
end )

