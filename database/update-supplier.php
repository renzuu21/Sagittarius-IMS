<?php 

$supplier_name = isset($_POST['supplier_name']) ? $_POST['supplier_name'] : '';
$supplier_location = isset($_POST['supplier_location']) ? $_POST['supplier_location'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';

$supplier_id = $_POST['sid'];


// Update the product record
try {
	$sql = "UPDATE suppliers 
				SET 
				supplier_name = ?, supplier_location = ?, email = ?
				WHERE id=?";

	include('connection.php');
	$stmt = $conn->prepare($sql);
	$stmt->execute([$supplier_name, $supplier_location, $email, $supplier_id]);

	// Delete the old values.
	$sql = "DELETE FROM productsuppliers WHERE supplier=?";
	$stmt = $conn->prepare($sql);
	$stmt->execute([$supplier_id]);

	// Loop through the suppliers and add record
	// Get suppliers.
	$products = isset($_POST['products']) ? $_POST['products'] : [];
	foreach($products as $product){
		$supplier_data = [
			'supplier_id' => $supplier_id,
			'product_id' => $product,
			'updated_at' => date('Y-m-d H:i:s'),
			'created_at' => date('Y-m-d H:i:s')
		];


		$sql = "INSERT INTO productsuppliers			
					(supplier, product, updated_at, created_at) 
				VALUES 
					(:supplier_id, :product_id, :updated_at, :created_at)";
		$stmt = $conn->prepare($sql);
		$stmt->execute($supplier_data);
	}

	$response = [
		'success' => true,
		'message' => "<strong>$supplier_name</strong> successfully updated to the system."
	];
	
} catch (\Exception $e) {
	$response = [
		'success' => false,
		'message' => "Error processing your request"
	];
}


echo json_encode($response);
