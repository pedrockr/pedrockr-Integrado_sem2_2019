<?php
include '../conn.php';
    
    $sql = "select usuario_id,usuario_nome, usuario_cpf, usuario_matricula, usuario_nivel, usuario_status, usuario_email, usuario_senha from usuarios";
    $result = $connect->query($sql);
    $registros = array();
    
    while($row = $result->fetch_assoc()){
	if($row['usuario_status'] == 'A'){
	$registros[] = $row;
	}
        
    }

    echo json_encode($registros);

?>