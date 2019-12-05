<?php
include '../conn.php';
    
    $sql = "select usuario_id, usuario_nome from usuarios";
    $result = $connect->query($sql);
    $registros = array();
    
    while($row = $result->fetch_assoc()){
        $registros[] = $row;
    }

    echo json_encode($registros);

?>