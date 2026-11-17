instance_destroy(other);

// 2. Создать открытую дверь на позиции закрытой двери
instance_create_layer(x-80, y-10, "Instances", opendoor);

// 3. Удалить закрытую дверь (себя)
instance_destroy();