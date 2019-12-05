<?php
include '../conn.php';

    $ata_id = $_GET['ata_id'];
    
    $sql = "UPDATE atas_de_reunioes SET `ata_status`='c' WHERE ata_id =".$ata_id;
    $connect->query($sql);