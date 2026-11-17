// Стартовая позиция ("своё место")
home_x = x;
home_y = y;

// Настройки
walk_speed  = 1;
chase_speed = 4;
view_range  = 600;
chase_time_max = 40 * game_get_speed(gamespeed_fps);

state = "patrol";   // "patrol", "chase", "return"
chase_timer = 0;
ignore_timer = 0;   // пауза, когда simba не замечается
hit_wall = false;   // флаг: коснулся allwallgrey

target_x = x;
target_y = y;
wander_wait = 0;

mask_index = Sp_grey;  // одна маска для обоих спрайтов

// Шаг к точке:
// - allobhodgrey огибает
// - allwallgrey не пускает и ставит флаг hit_wall
move_step = function(_tx, _ty, _spd)
{
    var dist = point_distance(x, y, _tx, _ty);
    if (dist < 1) return;

    var s = min(_spd, dist);
    var ox = x;
    var oy = y;
    var inside = place_meeting(x, y, allwallgrey); // если уже внутри, даём выйти

    // обход allobhodgrey
    mp_potential_step_object(_tx, _ty, s, allobhodgrey);

    // проверка стены
    if (!inside && place_meeting(x, y, allwallgrey))
    {
        hit_wall = true;
        var nx = x;
        var ny = y;

        // пробуем скользить вдоль стены по каждой оси отдельно
        x = nx; y = oy;
        if (place_meeting(x, y, allwallgrey) || place_meeting(x, y, allobhodgrey))
        {
            x = ox; y = ny;
            if (place_meeting(x, y, allwallgrey) || place_meeting(x, y, allobhodgrey))
            {
                x = ox; y = oy;
            }
        }
    }
};