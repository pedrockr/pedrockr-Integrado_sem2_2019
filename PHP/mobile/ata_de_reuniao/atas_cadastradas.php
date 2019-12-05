<?php
include '../conn.php';
    
    $query = "SELECT * FROM atas_de_reunioes";

    $result = $connect->query($query);
    $parent = array() ;
    $parent1 = array() ;

	while($row = $result->fetch_assoc()){
	    $data = explode(" ",$row['ata_data_e_hora']);
	    if($row['ata_status'] != 'c'){
	        $parent[] = array(
	            "data"=>$data[0],
	            "hora"=>$data[1],
	            "ata_id"=>$row['ata_id'],
		        "ata_nome"=>$row['ata_nome'],
		        "ata_data_e_hora"=>$row['ata_data_e_hora'],
		        "ata_pauta"=>$row['ata_pauta'],
		        "ata_relatorio"=>$row['ata_relatorio'],
		        "ata_status"=>$row['ata_status'],
		        "usuario" => getUsuario($row['ata_id']), 
		    );
	    }
	}

     echo  json_encode($parent);

function getUsuario($id){
    
    include '../conn.php';
    
    $parent1 = array();
    
	$query1 = "SELECT b.participante_ata_id, b.participante_usuario_id, a.usuario_nome 
                from usuarios a 
    		    LEFT JOIN participantes_das_reunioes b on b.participante_usuario_id = a.usuario_id 
    		    WHERE b.participante_ata_id = '$id'";
    
    $result1 = $connect->query($query1);
        while($row1 = $result1->fetch_assoc()){
        $parent1[] = array(
            "participante_ata_id"=>$row1['participante_ata_id'],
            "participante_usuario_id"=>$row1['participante_usuario_id'],
            "usuario_nome"=>$row1['usuario_nome'],
        );          
    

    }	
    
    		
    return $parent1;
}