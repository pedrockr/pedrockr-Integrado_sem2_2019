<?php
include '../conn.php';
    
    $ata_nome = $_POST['ata_nome'];
    //$ata_data_e_hora = $_POST['ata_data_e_hora'];
    $ata_pauta = $_POST['ata_pauta'];
    $ata_relatorio = $_POST['ata_relatorio'];
    $ata_status = $_POST['ata_status'];
    $ata_id = $_POST['ata_id'];
    $ata_data = $_POST['ata_data'];
    $ata_hora = $_POST['ata_hora'];
    
    $sql = "UPDATE atas_de_reunioes SET `ata_nome`='".$ata_nome."', `ata_data_e_hora`='".$ata_data." ".$ata_hora."', `ata_pauta`='".$ata_pauta."', `ata_relatorio`='".$ata_relatorio."', `ata_status`='".$ata_status."' WHERE ata_id =".$ata_id;
    
    
    $connect->query($sql);