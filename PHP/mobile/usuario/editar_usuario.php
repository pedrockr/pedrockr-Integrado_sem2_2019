<?php
include '../conn.php';

    $usuario_id = $_GET['usuario_id'];
    $usuario_nivel = $_GET['usuario_nivel'];
    
    $sql = "UPDATE usuarios SET usuario_nivel ='".$usuario_nivel."' WHERE usuario_id =".$usuario_id;
    $connect->query($sql);