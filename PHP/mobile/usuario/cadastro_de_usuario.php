<?php

    include '../conn.php';

    $usuario_nome = $_POST['usuario_nome'];
    $usuario_cpf = $_POST['usuario_cpf'];
    $usuario_email = $_POST['usuario_email'];
    $usuario_matricula = $_POST['usuario_matricula'];
    $usuario_senha = $_POST['usuario_senha'];
    $usuario_nivel = $_POST['usuario_nivel'];
    $usuario_status = "A";
    
    $sql = ("INSERT INTO usuarios(usuario_nome, usuario_cpf, usuario_email,usuario_matricula, usuario_senha, usuario_nivel, usuario_status ) VALUES(
        '".$usuario_nome."',
        '".$usuario_cpf."',
        '".$usuario_email."',
	'".$usuario_matricula."',
        '".$usuario_senha."',
        '".$usuario_nivel."',
        '".$usuario_status."'
        )");   
    $connect->query($sql);
    print ($sql);
