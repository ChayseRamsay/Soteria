/obj/item/weapon/gun/energy/hos
	name = "X-01 Multiphase Energy Gun"
	desc = "This is a modern recreation of the captain's antique laser gun. This gun has several unique firemodes, but lacks the ability to recharge over time."
	icon_state = "hoslaser"
	item_state = null	//so the human update icon uses the icon_state instead.
	force = 10
	fire_sound = 'sound/weapons/Taser.ogg'
	origin_tech = "combat=3;magnets=2"
	charge_cost = 2000
	projectile_type = "/obj/item/projectile/energy/electrode"
	cell_type = "/obj/item/weapon/cell/high"
	fire_delay = 10
	modifystate = "hoslaser_stun"

	var/mode = 2

	attack_self(mob/living/user as mob)
		switch(mode)
			if(2)
				mode = 0
				charge_cost = 1000
				fire_sound = 'sound/weapons/Laser.ogg'
				user << "\red [src.name] is now set to kill."
				projectile_type = "/obj/item/projectile/beam"
				modifystate = "hoslaser_kill"
				fire_delay = 0
			if(0)
				mode = 1
				charge_cost = 500
				fire_sound = 'sound/weapons/taser2.ogg'
				user << "\red [src.name] is now set to disable."
				projectile_type = "/obj/item/projectile/beam/stun"
				modifystate = "hoslaser_disable"
				fire_delay = 0
			if(1)
				mode = 2
				charge_cost = 2000
				fire_sound = 'sound/weapons/taser.ogg'
				user << "\red [src.name] is now set to stun."
				projectile_type = "/obj/item/projectile/energy/electrode"
				modifystate = "hoslaser_stun"
				fire_delay = 10
		update_icon()
		if(user.l_hand == src)
			user.update_inv_l_hand()
		else
			user.update_inv_r_hand()