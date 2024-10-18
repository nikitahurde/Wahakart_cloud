<?php 	
include 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$categoriesName = $_POST['categoriesName'];
  $categoriesStatus = $_POST['categoriesStatus']; 

	$sql = "INSERT INTO categories (categories_name, categories_active, categories_status) 
	VALUES ('$categoriesName', '$categoriesStatus', 1)";

	$connect->close();


 
} // /if $_POST