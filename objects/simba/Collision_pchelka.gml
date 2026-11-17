// Не срабатываем во время блокировки/паузы после экрана пчёл
if (global.pchelka_block || global.pchelka_cooldown > 0) exit;

room_goto(pchelkamonologe1);
