<!--< ?php
	include('dashboard-bckend.php');

?>-->

<?php
	// Start the session.
	session_start();
	if(!isset($_SESSION['user'])) header('location: login.php');

	$user = $_SESSION['user'];

	// Get graph data - purchase order by status
	include('database/po_status_pie_graph.php');

	// Get graph data - supplier product count
	include('database/supplier_product_bar_graph.php');


	// Get line graph data - delivery history per day
	include('database/delivery_history.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Dashboard - Inventory Management System</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script src="https://use.fontawesome.com/0c7a3095b5.js"></script>
</head>
<body>
	<div id="dashboardMainContainer">
		<?php include('partials/app-sidebar.php') ?>
		<div class="dasboard_content_container" id="dasboard_content_container">
			<?php include('partials/app-topnav.php') ?>
			<div class="dashboard_content">
					<div class ="row widgetMainRow">
						<div class ="col-4">
							<div class ="widgetContainer widgetSale">
								<p class ="widgetValue"> $32,000.00 </p>
								<p class ="widgetHeader"> Sale Amount </p>
                            </div>
						</div> 
                       <div class ="col-4">
					  		<div class ="widgetContainer widgetQtySold">
								<p class ="widgetValue"> 473 </p>
								<p class ="widgetHeader"> Tanks Sold </p>
                            </div>						
						</div> 
						<div class ="col-4">
							<div class ="widgetContainer widgetOrder">
								<p class ="widgetValue"> 85 </p>
								<p class ="widgetHeader"> Total Orders </p>
                            </div>						
						</div> 
					</div>
					<div class ="row widgetSubRow">
						<div class="col-md-4 widgetSecond">
							<p class="header">Last 5 Orders</p>
							<table class="table">
								<tr>
									<th>Order #</th>
									<th>Total Amount</th>
									<th>Date</th>
								</tr>
								<tr>
									<td>54</td>
									<td>P8,454.00</td>
									<td>July 13, 2024 10:22 PM</td>
								</tr>
								<tr>
									<td>71</td>
									<td>P456.00</td>
									<td>July 13, 2024 10:22 PM</td>
								</tr>
								<tr>
									<td>13</td>
									<td>P6,686.00</td>
									<td>July 13, 2024 10:22 PM</td>
								</tr>
								<tr>
									<td>67</td>
									<td>P535.00</td>
									<td>July 13, 2024 10:22 PM</td>
								</tr>
								<tr>
									<td>81</td>
									<td>P4,293.00</td>
									<td>July 13, 2024 10:22 PM</td>
								</tr>
							</table>
						</div>
						<div class="col-md-8 widgetSecond">
							<p class="header">Daily Sales</p>
							<div class="alignRight">
								<button class="btn btn-sm btn-default" id="daterange">
									<p class="selectRange">Select Range</p>
								</button>
							</div>
							<figure class="highcharts-figure">
								<div id="containerLastOrders"></div>
								<p class="highcharts-description">
									Here is the chart of sales per day.
								</p>
							</figure>
						</div>
					</div>
				<div class="dashboard_content_main">
					<div class="col50">
						<figure class="highcharts-figure">
						    <div id="container"></div>
						    <p class="highcharts-description">
						        Here is the breakdown of the purchase orders by status.
						    </p>
						</figure>						
					</div>			
					<div class="col50">
						<figure class="highcharts-figure">
						    <div id="containerBarChart"></div>
						    <p class="highcharts-description">
						        Here is the breakdown of the purchase orders by status.
						    </p>
						</figure>						
					</div>			
				</div>
					<div id="deliveryHistory"></div>
			</div>
		</div>
	</div>

<script src="js/script.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script>
	function toDateRange(){
		$('#daterange').daterangepicker();
	}
	function visualize(){
		Highcharts.chart('containerLastOrders',{
			chart: {
				type: 'spline'
			},
			title: {
				text: 'Sales'
			},
			xAxis: {
				categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				accessibility: {
					description: 'Months of the Year'
				}
			},
			yAxis: {
				title: {
					text: 'Sales Amount'
				},
				labels: {
					format: 'P{value}'
				}
			},
			tooltip: {
				crosshairs: true, 
				shared: true
			},
			plotOptions: {
				spline: {
					marker: {
						radius: 4, 
						lineColor: '#666666',
						lineWidth: 1
					}
				}
			},
			series: [{
				name: 'Daily Sales',
				marker: {
					symbol: 'square'
				},
				data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 22.8, 17.5, 12.1, 7.6]
			}]
		});
	}

	visualize();
	toDateRange();
</script>

<script>
	var graphData = <?= json_encode($results) ?>;

	Highcharts.chart('container', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: 'Purchase Orders By Status',
	        align: 'left'
	    },
	    tooltip: {
          	pointFormatter: function(){
		        var point = this,
		            series = point.series;

		        return `<b>${point.name}</b>: ${point.y}`
		    }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.y}'
	            }
	        }
	    },
	    series: [{
	        name: 'Status',
	        colorByPoint: true,
	        data: graphData
	    }]
	});




	var barGraphData = <?= json_encode($bar_chart_data) ?>;
	var barGraphCategories = <?= json_encode($categories) ?>;

	Highcharts.chart('containerBarChart', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: 'Product Count Assigned To Supplier'
	    },
	    xAxis: {
	        categories: barGraphCategories,
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Product Count'
	        }
	    },
	    tooltip: {
          	pointFormatter: function(){
		        var point = this,
		            series = point.series;

		        return `<b>${point.category}</b>: ${point.y}`
		    }
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [{
	        name: 'Suppliers',
	        data: barGraphData
	    }]
	});

	var lineCategories = <?= json_encode($line_categories) ?>;
	var lineData = <?= json_encode($line_data) ?>;

	Highcharts.chart('deliveryHistory', {
	  chart: {
	  	type: 'spline'
	  },
	  title: {
	    text: 'Delivery History Per Day',
	    align: 'left'
	  },

	  yAxis: {
	    title: {
	      text: 'Product Delivered'
	    }
	  },

	  xAxis: {
	  	categories: lineCategories
	  },

	  legend: {
	    layout: 'vertical',
	    align: 'right',
	    verticalAlign: 'middle'
	  },

	  plotOptions: {
	    series: {
	      label: {
	        connectorAllowed: false
	      },
	    }
	  },

	  series: [{
	    name: 'Product Delivered',
	    data: lineData
	  }],

	  responsive: {
	    rules: [{
	      condition: {
	        maxWidth: 500
	      },
	      chartOptions: {
	        legend: {
	          layout: 'horizontal',
	          align: 'center',
	          verticalAlign: 'bottom'
	        }
	      }
	    }]
	  }
	});

</script>

</body>
</html>