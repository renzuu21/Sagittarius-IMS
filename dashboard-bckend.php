<?php 
    include('database/connection.php');

    function getSales($date){
        
    $conn = $GLOBALS['conn'];

    $stmt = $conn->prepare("SELECT * FROM products");
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $rows;
    }
?>