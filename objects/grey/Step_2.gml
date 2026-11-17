var moved = point_distance(x, y, xprevious, yprevious) > 0.1;

if (moved)
{
    sprite_index = Sp_greyhoduli;

    if (x > xprevious) image_xscale = -1;
    else if (x < xprevious) image_xscale = 1;
}
else
{
    sprite_index = Sp_grey;
}

// Застрял в патруле (например, в тупике у allobhodgrey): выбрать другую точку
if (state == "patrol" && wander_wait <= 0 && !moved)
{
    target_x = random_range(32, room_width - 32);
    target_y = random_range(32, room_height - 32);
}