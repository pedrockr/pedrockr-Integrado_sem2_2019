<?php    
    include '../conn.php';
    
    $ata_id = $_GET['id'];
    
    $sql = "SELECT a.participante_id, a.participante_ata_id, b.usuario_nome, b.usuario_id FROM participantes_das_reunioes a
            LEFT JOIN usuarios b on a.participante_usuario_id = b.usuario_id
            WHERE a.participante_ata_id =".$ata_id;
            
    $result = $connect->query($sql);
    $registros = array();
    
    while($row = $result->fetch_assoc()){
        $registros[] = $row;
    }

    echo json_encode($registros);
