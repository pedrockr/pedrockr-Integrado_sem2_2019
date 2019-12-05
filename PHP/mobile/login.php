<?php

include 'conn.php';

$email = $_POST['usuario_email'];
$senha = $_POST['usuario_senha'];

$sql = "SELECT usuario_nome, usuario_nivel, usuario_status FROM usuarios
WHERE usuario_email ='".$email."' AND usuario_senha ='".$senha."'";

$registros = array();
$result = $connect->query($sql);
    
while($row = $result->fetch_assoc()){
    $registros[] = $row;
}

echo json_encode($registros);
