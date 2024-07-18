<?php
include('database\connection.php');
$action = isset ($_GET['action']) ? $_GET['action'] : '';

if($action === 'checkout') saveProducts();

function getProducts(){
    $conn = $GLOBALS['conn'];

    $stmt = $conn->prepare("SELECT * FROM products");
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $rows;
}

function saveProducts(){
    try{
    $conn = $GLOBALS['conn_pos'];

    $data = $_POST['data'];
    $customer = $_POST['customer'];


    $sql = "INSERT INTO
                        customers(first_name, last_name, address, contact, date_created, date_updated)
                    VALUE
                        (:first_name, :last_name, :address, :contact, :date_created, :date_updated)";
    $db_arr = [
        'first_name' => $customer['firstName'],
        'last_name' => $customer['lastName'],
        'address' => $customer['address'],
        'contact' => $customer['contact'],
        'date_created'=> date('Y-m-d H:i:s'),
        'date_updated'=> date('Y-m-d H:i:s')
        
    ];
    $stmt = $conn->prepare($sql);
    $stmt->execute($db_arr);
    $customer_id = $conn->lastInsertId();

    $sql = "INSERT INTO
            sales(customer_id, user_id, total_amount, amount_tendered, change_amt, date_created, date_updated)
        VALUE
            (:customer_id, :user_id, :total_amount, :amount_tendered, :change_amt, :date_created, :date_updated)";

            $total_amount = $_POST['totalAmt'];
            $change_amt = $_POST['change'];
            $tenderedAmt = $_POST['tenderedAmt'];
            $user_id = 41;



        $db_arr = [
        'customer_id' => $customer_id,
        'user_id' => $user_id, 
        'total_amount' => $total_amount, 
        'amount_tendered' => $tenderedAmt, 
        'change_amt' => $change_amt, 
        'date_created' => date('Y-m-d H:i:s'),
        'date_updated' => date('Y-m-d H:i:s')
        ];
        $stmt = $conn->prepare($sql);
        $stmt->execute($db_arr);
        $sales_id = $conn->lastInsertId();


    foreach($data as $product_id => $order_item){

                $sql = "INSERT INTO
                sales_item(sales_id, product_id, quantity, unit_price, sub_total, date_created, date_updated)
            VALUE
                (:sales_id, :product_id, :quantity, :unit_price, :sub_total, :date_created, :date_updated)";

            $db_arr = [
                'sales_id' => $sales_id,
                'product_id' => $product_id,
                'quantity' => $order_item['orderQty'], 
                'unit_price' => $order_item['price'], 
                'sub_total' => $order_item['amount'], 
                'date_created' => date('Y-m-d H:i:s'), 
                'date_updated' => date('Y-m-d H:i:s')
            ];
            $stmt = $conn->prepare($sql);
            $stmt->execute($db_arr);
            
            $inv_conn = $GLOBALS['conn'];
            $stmt = $conn->prepare("
                    SELECT products.stock FROM products
                        where id = $product_id
            ");
            $stmt->execute();
            $product = $stmt->fetch(PDO::FETCH_ASSOC);
            $cur_stock = (int) $product['stock'];
            
            
            $new_stock = $cur_stock - (int) $order_item['orderQty'];

                $sql = "UPDATE products
                                SET 
                                stock=?
                                WHERE id=?";

                $stmt = $inv_conn->prepare($sql);
                $stmt->execute([$new_stock, $product_id]);

    }

        echo json_encode([
            'success' => true,
            'id' => $sales_id,
            'message' => 'Order successfully checkout!',
            'products' => getProducts()
    ]);

    }catch (Exception $e){
        echo json_encode([
            'success' => false,
            'message' => $e->getMessage()
    ]);
        
    }
    

}