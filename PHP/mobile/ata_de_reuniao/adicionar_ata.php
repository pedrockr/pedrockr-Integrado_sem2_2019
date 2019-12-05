<?php

include '../conn.php';

    $ata_nome = $_POST['ata_nome'];
    $ata_data_e_hora = $_POST['ata_data_e_hora'];
    $ata_pauta = $_POST['ata_pauta'];
    $ata_relatorio = $_POST['ata_relatorio'];
    $ata_status = "A";
    $usuarios = $_POST['usuarios'];
    $ata_data = $_POST['ata_data'];
    $ata_hora = $_POST['ata_hora'];
    //$data = $ata_data." ".$ata_hora;
    //$data = '2019-11-16 06:00:00';
    $dirs = explode(',', $usuarios);
    var_dump($dirs);

    $sql = ("INSERT INTO atas_de_reunioes(ata_nome, ata_data_e_hora, ata_pauta, ata_relatorio, ata_status) VALUES(
        '".$ata_nome."',
        '".$ata_data." ".$ata_hora."',
        '".$ata_pauta."',
        '".$ata_relatorio."',
        '".$ata_status."'
        )"); 
  
    $connect->query($sql);
    //print ($sql);
        
    $ataID = mysqli_insert_id($connect);
    
    if(is_array($dirs)){
        foreach($dirs as $dados){
            
            $query = $connect->query("SELECT usuario_id FROM usuarios WHERE usuario_nome = '".$dados."'");
            $usuario_id = $query->fetch_row()[0];
             print($usuario_id);
            
            $connect->query("insert into participantes_das_reunioes(participante_ata_id, participante_usuario_id) values (".$ataID.",".$usuario_id.")");
            echo("usuario:".$dados.", ata id:".$ataID);
        }
    }else{
	echo("sem usuario");
	}
?>