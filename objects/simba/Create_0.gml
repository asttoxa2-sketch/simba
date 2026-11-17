// Create Event игрока
held_item = -1;   // -1 = ничего не подобрано, 0 = предмет1, 1 = предмет2
fire_cooldown = 0;
bam=0;
is_dead = false;
cveti=0
if (!variable_global_exists("pchelka_block")) global.pchelka_block = false;
if (!variable_global_exists("pchelka_cooldown")) global.pchelka_cooldown = 0;
