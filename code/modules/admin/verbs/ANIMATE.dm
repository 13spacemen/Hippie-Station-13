/client/proc/animate_goddamn_anything()
	set category = "Debug"
	set name = "Spin any Atom"
	if(!check_rights(R_DEBUG))
		usr << "<span class='danger'><font size='30'>FUCK YOU</font></span>"
		playsound(src,'sound/misc/no.ogg',200,1)
		return

	var/start = null
	var/spinning_thing = null
	start = input(src, "what are we gonna spin today", "YOU SPIN ME RIGHT ROUND") in list("objects", "mobs", "turfs", "everything")
	if(start == "objects")
		var/confirm = null
		confirm = input(src, "are you fucking sure you want to spin all objects", "SPIN GODDAMN EVERYTHING") in list("yeah", "nope")
		if(confirm == "nope")
			return
		else
			for(var/obj/O in world)
				spinning_thing = O
	if(start == "mobs")
		var/confirm = null
		confirm = input(src, "are you fucking sure you want to spin every mob", "SPIN GODDAMN EVERYTHING") in list("yeah", "nope")
		if(confirm == "nope")
			return
		else
			for(var/mob/M in world)
				spinning_thing = M
	if(start == "turfs")
		var/confirm = null
		confirm = input(src, "are you fucking sure you want to spin all the turfs", "SPIN GODDAMN EVERYTHING") in list("yeah", "nope")
		if(confirm == "nope")
			return
		else
			for(var/turf/T in world)
				spinning_thing = T
	if(start == "everything")
		var/confirm = null
		confirm = input(src, "are you fucking sure you want to spin everything", "SPIN GODDAMN EVERYTHING") in list("yeah", "nope")
		if(confirm == "nope")
			return
		else
			for(var/atom/A in world)
				spinning_thing = A

	var/loopnumb = input(src, "how long to loop for? -1 for infinity", "touch badmin get dizzy") as num

	//start a endless spin
	src << "begin spin"
	animate("[spinning_thing]", transform = turn(matrix(), 360), time = 60, loop = "[loopnumb]")
	src << "the spin has begun"