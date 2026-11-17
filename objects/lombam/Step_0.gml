// Step Event снаряда
image_angle = direction; // спрайт поворачивается по направлению полёта



// Уничтожение за пределами комнаты (опционально)
if (x < 0 || x > room_width || y < 0 || y > room_height) {
   instance_create_layer(x, y, "Instances", lom)
   instance_destroy()
}
// Уничтожение при столкновении со стеной
if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), wall1)) {
    instance_create_layer(x, y, "Instances", lom)
instance_destroy()}
if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), wall2)) {
    instance_create_layer(x, y, "Instances", lom)
instance_destroy()}
if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), sofa)) {
    instance_create_layer(x, y, "Instances", lom)
instance_destroy()}