<?php
	session_start();
	if(!isset($_SESSION['user'])) header('location: login.php');

	$user = $_SESSION['user'];

    include('product.php');
    $products = getProducts($conn);

?>

<!DOCTYPE html>
<html>
<head>
	<title>Point of Sales</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script src="https://use.fontawesome.com/0c7a3095b5.js"></script>
</head>
<body>
	<div id="dashboardMainContainer">
		<?php include('partials/app-sidebar.php') ?>
		<div class="dasboard_content_container" id="dasboard_content_container">
			<?php include('partials/app-topnav.php') ?>
			<div class="dashboard_content">
				<div class="dashboard_content_main">
                <div class="row">
                            <div class="column column-7">                                
                                <!--<div class="searchInputContainer">
                                    <input type="text" placeholder="Search Product...">
                                </div> -->
                                <div class="searchResultContainer">
                                    <div class="row">
                                    <?php foreach($products as $product){ ?>
                                        <div class="col-4 productColContainer" data-pid="<?= $product['id'] ?>">
                                            <div class="productResultContainer">
                                            <img src="uploads\products\<?= $product['img'] ?>" class="productImage" alt="">
                                            <div class="productInfoContainer">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <p class="productName"><?= $product['product_name'] ?></p>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p class="productPrice">P<?= $product['price'] ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div> 
                            </div>
                            <div class="column column-5 posOrderContainer">
                                <div class="pos_header">
                                    <p class="logo">LPG</p>
                                    <p class="timeAndDate">XXX XX, XXXX    XX:XX:XX XX</p>
                                </div>
                                <div class="pos_items_container">
                                    <div class="pos_items">
                                        <p class="itemNoData">No data</p>
                                    </div>
                                    <div class="item_total_container">
                                        <p class="item_total">
                                            <span class="item_total--label">TOTAL</span>
                                            <span class="item_total--value">P0.00</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="checkoutBtnContainer">
                                    <a href="javascript:void(0)" class="checkoutBtn">CHECKOUT</a>
                                </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
    
    <script>
            let productsJson = <?= json_encode($products) ?>;
            var products = {};

            productsJson.forEach((product) =>{
                products[product.id] = {
                    name: product.product_name,
                    stock: product.stock,
                    price: product.price
                }
            });

            console.log(products);

        </script>

<script src="js\pos.js?v=<?= time() ?>"> </script>
<?php include('partials\app-scripts.php'); ?>
</body>
</html>