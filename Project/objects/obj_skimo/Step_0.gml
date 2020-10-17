if (live_call()) { return live_result; }

energy -= 1;
image_blend = c_white;

if (energy <= 0)
{
    sprite_index = spr_skimo_frozen;
    move_towards_point(targ_x, targ_y, 0);
    image_blend = c_blue;
}
else if (energy < 60*2)
{
    sprite_index = spr_skimo_cold;
    move_towards_point(targ_x, targ_y, 0);
}
else
{
    sprite_index = spr_skimo;
    
    if (targ_x == -1)
    {
        targ_x = irandom_range(0, room_width);
        targ_y = irandom_range(0, room_height);
        
        if (targ_x < x)
            image_xscale = init_sca;
        else
            image_xscale = -init_sca;
    }
    else
    {
        move_towards_point(targ_x, targ_y, spd);
    }
    
    if (distance_to_point(targ_x, targ_y) < spd*2)
        targ_x = -1;
}

dept = -y;
