show_debug_message("клик: " + object_get_name(object_index));
// Пока Симба стоит на пчёлке, повторный запуск диалога блокируется
global.pchelka_block = true;
room_goto(rancho);
