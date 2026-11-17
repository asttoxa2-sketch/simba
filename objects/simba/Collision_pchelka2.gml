// Не срабатываем, пока Симба не отошёл от пчёлки после диалога
if (global.pchelka_block) exit;

if (cveti <= 9) {
	room_goto(pchelkamonologeneprines);
}
else {
	room_goto(pchelkamonologe4);
}
