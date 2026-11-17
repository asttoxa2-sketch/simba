// Step Event obj_item
if (place_meeting(x, y, simba)) {
    simba.held_item = item_type; // запоминаем тип предмета
    instance_destroy();               // предмет исчезает
}