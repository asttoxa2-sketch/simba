show_debug_message("клик: " + object_get_name(object_index));
// Пока Симба стоит на пчёлке, повторный запуск диалога блокируется
global.pchelka_block = true;
global.pchelka_cooldown = 120;
room_goto(rancho);
