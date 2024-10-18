<?php
require_once('../../config.php');
if (isset($_GET['id']) && $_GET['id'] > 0) {
	$qry = $conn->query("SELECT * from `expense` where id = '{$_GET['id']}' ");
	if ($qry->num_rows > 0) {
		foreach ($qry->fetch_assoc() as $k => $v) {
			$$k = $v;
		}
	}
}
?>
<?php
// Assuming you have already established the database connection in the 'config.php' file
require_once('../../config.php');

// Initialize the variable
$item = '';

if (isset($_GET['id']) && $_GET['id'] > 0) {
	$id = $_GET['id'];

	// Fetch the product data from the database
	$qry = $conn->query("SELECT * from `products_list` where id = '$id'");
	if ($qry->num_rows > 0) {
		$product = $qry->fetch_assoc();

		// Extract the product details
		$item = $product['id']; // Assuming the product ID is stored in the 'id' column
		// Add other product details if required
		// Example: $productName = $product['name'];
	}
}
?>

<style>
	img#cimg {
		height: 15vh;
		width: 15vh;
		object-fit: scale-down;
		object-position: center center;
	}
</style>
<div class="container-fluid">
	<form action="" id="expense-form">
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="item" class="control-label">Product Name</label>
			<select name="item" id="item" class="form-control rounded-0" value=" <?php echo $item ?>">
				<option desable selected></option>

				<?php
				// Fetch products from the database
				$sql = "SELECT id, name , cost FROM products_list";
				$result = mysqli_query($conn, $sql);

				// Loop through the result set
				while ($row = mysqli_fetch_assoc($result)) {
					$productId = $row['id'];
					$productName = $row['name'];
					$selected = $item == $productId ? 'selected' : '';

					// Generate the option for each product
					echo '<option value="' . $productName . '" ' . $selected . '>' . $productName . '</option>';
				}

				// Close the database connection (if you are using mysqli_)

				?>

			</select>
		</div>

		<div class="form-group">
			<label for="expense_date" class="control-label">Order Date</label>
			<input type="date" name="expense_date" id="expense_date" class="form-control rounded-0" value="<?php echo isset($expense_date) ? $expense_date : ''; ?>">
		</div>
		<div class="form-group">
			<label for="dispatch_date" class="control-label">Dispatch Date</label>
			<input type="date" name="dispatch_date" id="dispatch_date" class="form-control rounded-0" value="<?php echo isset($dispatch_date) ? $dispatch_date : ''; ?>">
		</div>
		<div class="form-group">
			<label for="pre_job" class="control-label">Previously Ready Job</label>
			<select name="pre_job" id="pre_job" value="<?php echo isset($pre_job) ? $pre_job : ''; ?>">
				<option value="no">NO</option>
				<option value="old job">OLD JOB</option>
			</select>
		</div>
		<div class="form-group">
			<label for="order_by" class="control-label">Oredr Taken By</label>
			<input type="text" name="order_by" id="order_by" class="form-control rounded-0" value="<?php echo isset($order_by) ? $order_by : ''; ?>">
		</div>
		<div class="form-group">
			<label for="docket" class="control-label">Docket No.</label>
			<input type="text" name="docket" id="docket" class="form-control rounded-0" value="<?php echo isset($docket) ? $docket : ''; ?>">
		</div>
		<div class="form-group">
			<label for="details" class="control-label">Dispatch Through</label>
			<input type="text" name="details" id="details" class="form-control form no-resize" value=" <?php echo isset($details) ? $details : ''; ?>">
		</div>
		<div class="form-group">
			<label for="price" class="control-label">Material Cost</label>&nbsp;&nbsp; <a href="<?php echo base_url ?>admin/?page=sales" target="_blank">+</a>
			<input name="price" id="price" class="form-control rounded-0" value="<?php echo isset($price) ? $price : ''; ?>">
		</div>
		<div class="form-group">
			<label for="labour" class="control-label">Labour Cost</label> &nbsp;&nbsp; <a href="<?php echo base_url ?>admin/?page=purchase_order_man" target="_blank">+</a>
			<input name="labour" id="labour" onchange="calculateTotal()" class="form-control rounded-0" value="<?php echo isset($labour) ? $labour : ''; ?>">
		</div>
		<div class="form-group">
			<label for="transpotation" class="control-label">Transpotation Cost</label>
			<input name="transpotation" id="transpotation" class="form-control rounded-0" onchange="calculateTotal()" value="<?php echo isset($transpotation) ? $transpotation : ''; ?>">
		</div>
		<div class="form-group">
			<label for="Misc" class="control-label">Misc. Cost</label>
			<input name="misc" id="misc" class="form-control rounded-0" onchange="calculateTotal()" value=" <?php echo isset($misc) ? $misc : ''; ?>" required>
		</div>
		<div class="form-group">
			<label for="epf" class="control-label">EPF / ASIC</label>
			<input name="epf" id="epf" class="form-control rounded-0" onchange="calculateTotal()" value=" <?php echo isset($epf) ? $epf : ''; ?>" required>
		</div>
		<div class="form-group">
			<label for="over" class="control-label">Over All inv. Cost</label>
			<input name="overal" id="overal" class="form-control rounded-0" value="<?php echo isset($overal) ? $overal : ''; ?>">
		</div>
		<div class="form-group">
			<label for="sell_cost" class="control-label">Selling Cost</label>
			<input name="sell_cost" id="sell_cost" class="form-control rounded-0" onchange="calculateTotal()" value="<?php echo isset($sell_cost) ? $sell_cost : ''; ?>">
		</div>
		<div class="form-group">
			<label for="pl" class="control-label">Net Gain/Profit Amount</label>
			<input name="pl" id="pl" class="form-control rounded-0" value="<?php echo isset($pl) ? $pl : ''; ?>">
		</div>

	</form>
</div>
<script>
	$(document).ready(function() {
		$('#expense-form').submit(function(e) {
			e.preventDefault();
			var _this = $(this)
			$('.err-msg').remove();
			start_loader();
			$.ajax({
				url: _base_url_ + "classes/Master.php?f=save_expense",
				data: new FormData($(this)[0]),
				cache: false,
				contentType: false,
				processData: false,
				method: 'POST',
				type: 'POST',
				dataType: 'json',
				error: err => {
					console.log(err)
					alert_toast("An error occured", 'error');
					end_loader();
				},
				success: function(resp) {
					if (typeof resp == 'object' && resp.status == 'success') {
						location.reload();
					} else if (resp.status == 'failed' && !!resp.msg) {
						var el = $('<div>')
						el.addClass("alert alert-danger err-msg").text(resp.msg)
						_this.prepend(el)
						el.show('slow')
						end_loader()
					} else {
						alert_toast("An error occured", 'error');
						end_loader();
						console.log(resp)
					}
				}
			})
		})
	})
</script>

<script>
	function calculateTotal() {
		let a = parseFloat(document.getElementById("price").value);
		let b = parseFloat(document.getElementById("labour").value);
		let c = parseFloat(document.getElementById("transpotation").value) || 0;
		let cc = (a + b) * 0.10;
		let d = cc;
		document.getElementById("misc").value = d;


		// let w = parseFloat(document.getElementById("price").value) || 0;
		let x = parseFloat(document.getElementById("labour").value) || 0;

		// let z = parseFloat(document.getElementById("misc").value) || 0;

		// Validate and provide defaults if any value is NaN
		// if (isNaN(w)) w = 0;
		if (isNaN(x)) x = 0;

		// if (isNaN(z)) z = 0;

		let rr = x * (15.2 / 5);




		// Assign the calculated value to the "epf" input field
		document.getElementById("epf").value = rr;

		let cal = a + b + c + d + rr;
		document.getElementById("overal").value = cal;
		// let d = parseFloat(document.getElementById("misc").value);
		// let e = parseFloat(document.getElementById("overal").value);
		let f = parseFloat(document.getElementById("sell_cost").value);

		let total = f - cal;
		// let gtotal = f - total;
		document.getElementById("pl").value = total;
	}
</script>