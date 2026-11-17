// ОТЛАДКА: печатаем один раз при входе Симбы в комнату
if (!variable_instance_exists(id, "dbg_room") || dbg_room != room) {
    dbg_room = room;
    show_debug_message("вошли в комнату: " + room_get_name(room) + ", block=" + string(global.pchelka_block));
}

// Снимаем блокировку, когда Симба отошёл от пчёлки
if (global.pchelka_block && !place_meeting(x, y, pchelka2)) global.pchelka_block = false;

if (is_dead) {
    if (sprite_index != Sp_plakSimba) {
        sprite_index = Sp_plakSimba;
        image_index  = 0;
        image_speed  = 3;   // если у плача есть анимация; иначе 0
    }
    exit;   // <-- выходим из Step Event, остальной код не выполняется
}
var move_left  = keyboard_check(ord("A"));
var move_right = keyboard_check(ord("D"));
var move_up    = keyboard_check(ord("W"));
var move_down  = keyboard_check(ord("S"));
var moving = move_left || move_right || move_up || move_down;

// --- Движение по горизонтали + поворот ---
if (move_left) {
    x -= 3;
    image_xscale = 1;
}
if (move_right) {
    x += 3;
    image_xscale = -1;
}

// --- Движение по вертикали ---
if (move_up)   y -= 3;
if (move_down) y += 3;

// --- Смена спрайта (анимация ходьбы) ---
if (moving) {
    if (sprite_index != Sp_simbahoduli) {
        sprite_index = Sp_simbahoduli;
        image_index  = 0;
    }
} else {
    if (sprite_index != Sp_simba) {
        sprite_index = Sp_simba;
        image_index  = 0;
    }
}




if (fire_cooldown > 0) fire_cooldown--;

if (keyboard_check_pressed(ord("E")) && held_item != -1 && fire_cooldown == 0) {
    var dir = (image_xscale == -1) ? 0 : 180;   // проверьте знак!

    var bullet = instance_create_layer(x, y, "Instances", held_item);
    bullet.direction = dir;
    bullet.speed = 8;
	
	 held_item = -1; 

    fire_cooldown = 15;
}
