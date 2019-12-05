<?php

include '../conn.php';

    $ata_id = $_GET['ata_id'];
    $participante_id = $_GET['participante_id'];
    
    $sql = "INSERT INTO participantes_das_reunioes (participante_ata_id, participante_usuario_id)
    values(".$ata_id.",".$participante_id.")";
    $connect->query($sql);