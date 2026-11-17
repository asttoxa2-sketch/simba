speed = 0;
if (ignore_timer > 0) ignore_timer--;

var s = instance_nearest(x, y, simba);
var sees_simba = (s != noone && ignore_timer <= 0 && point_distance(x, y, s.x, s.y) <= view_range);

hit_wall = false;

switch (state)
{
    // ---------- ПРОГУЛКА ПО КАРТЕ ----------
    case "patrol":
        if (sees_simba)
        {
            state = "chase";
            chase_timer = chase_time_max;
            break;
        }

        if (wander_wait > 0)
        {
            wander_wait--;
        }
        else
        {
            if (point_distance(x, y, target_x, target_y) > walk_speed)
            {
                move_step(target_x, target_y, walk_speed);
            }
            else
            {
                target_x = random_range(32, room_width - 32);
                target_y = random_range(32, room_height - 32);
                wander_wait = irandom_range(30, 120);
            }
        }
        break;

    // ---------- ПОГОНЯ ЗА SIMBA ----------
    case "chase":
        chase_timer--;

        if (s == noone || chase_timer <= 0)
        {
            state = "return";
            ignore_timer = 180;
            break;
        }

        move_step(s.x, s.y, chase_speed);

        if (point_distance(x, y, s.x, s.y) < 12)
        {
            state = "return";
            ignore_timer = 180;
        }
        break;

    // ---------- ВОЗВРАТ НА СВОЁ МЕСТО ----------
    case "return":
        if (sees_simba)
        {
            state = "chase";
            chase_timer = chase_time_max;
            break;
        }

        if (point_distance(x, y, home_x, home_y) > walk_speed * 1.5)
        {
            move_step(home_x, home_y, walk_speed * 1.5);
        }
        else
        {
            x = home_x;
            y = home_y;
            state = "patrol";
            wander_wait = 60;
        }
        break;
}

// Столкнулся с allwallgrey в патруле или погоне -> идёт домой
if (hit_wall && state != "return")
{
    state = "return";
    ignore_timer = 180; // 3 сек не замечает simba, чтобы сразу не вернуться в погоню
}