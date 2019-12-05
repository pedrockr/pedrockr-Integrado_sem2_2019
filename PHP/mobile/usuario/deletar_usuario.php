<?php
include '../conn.php';

    $usuario_id = $_GET['usuario_id'];
    
    $sql = "UPDATE usuarios SET `usuario_status`='C' WHERE usuario_id =".$usuario_id;
    $connect->query($sql);