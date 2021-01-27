
surface.CreateFont ( "HudFont", {
	font = "Arial",
	size = 25,
	weight = 500
})
		
		--HP + Arm--	

	hook.Add( "HUDPaint", "Hud", function()

		local scrw,scrh = ScrW(), ScrH()
		local ply = LocalPlayer()
		local hp = ply:Health()
		local maxhp = ply:GetMaxHealth()
		local boxW = scrw * .1
		local boxH = scrh * .02
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(scrw / 2 - boxW / 2,scrh - boxH * 1.1, boxW, boxH)
			surface.SetDrawColor(255,0,0,255)
			surface.DrawRect(scrw / 2 - boxW / 2,scrh - boxH * 1.1, boxW * (hp / maxhp), boxH)
				surface.SetFont( "HudFont" )
				surface.SetTextColor( 255, 255, 255, 200 )
				surface.SetTextPos( scrw / 1.99 - boxW / 2,scrh - boxH * 1.2, boxW, boxH )
				surface.DrawText( hp )


		local arm = ply:Armor()
		local maxarm = ply:GetMaxArmor()
		local boxW = scrw * .1
		local boxH = scrh * .02
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(scrw / 2 - boxW / 2,scrh - boxH * 2.5, boxW, boxH)
			surface.SetDrawColor(0,100,255,255)
			surface.DrawRect(scrw / 2 - boxW / 2,scrh - boxH * 2.5, boxW * (arm / maxarm), boxH)	
				surface.SetFont( "HudFont" )
				surface.SetTextColor( 255, 255, 255, 200 )
				surface.SetTextPos( scrw / 1.99 - boxW / 2,scrh - boxH * 2.535, boxW, boxH )
				surface.DrawText( arm )
			

			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(scrw / 2 - boxW / 2,scrh - boxH * 3.9, boxW, boxH)
			surface.SetDrawColor(205,205,0,205)
			surface.DrawRect(scrw / 2 - boxW / 2,scrh - boxH * 3.9, boxW, boxH)	
				surface.SetFont( "HudFont" )
				surface.SetTextColor( 255, 255, 255, 200 )
				surface.SetTextPos( scrw / 1.99 - boxW / 2,scrh - boxH * 4, boxW, boxH )
				surface.DrawText( "Stamina" )



	end)

		--Ammo--


	



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
