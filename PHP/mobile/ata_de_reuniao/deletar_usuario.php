<?php

include '../conn.php';

$participante_id = $_GET['id'];
$sql = "DELETE FROM participantes_das_reunioes WHERE participante_id =".$participante_id;
$connect->query($sql);