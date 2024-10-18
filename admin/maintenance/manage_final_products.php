<?php
require_once('../../config.php');
if (isset($_GET['id']) && $_GET['id'] > 0) {
	$qry = $conn->query("SELECT * from `products_list` where id = '{$_GET['id']}' ");
	if ($qry->num_rows > 0) {
		foreach ($qry->fetch_assoc() as $k => $v) {
			$$k = $v;
		}
	}
}
?>
<div class="container-fluid">
	<form action="" id="item-form">
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="image" class="control-label">Product Image</label><br>
			<img src="<?php echo isset($profile) ? $profile : ''; ?>" width='150px' height='150px' style="border-radius:15px; margin-left:8rem;" class="border border-warning" alt="img">
		</div>
		<div class="form-group">
			<label for="name" class="control-label">Name</label>
			<input type="text" name="name" id="name" class="form-control rounded-0" value="<?php echo isset($name) ? $name : ''; ?>">
		</div>
		<div class="form-group">
			<label for="description" class="control-label">Description</label>
			<textarea name="description" id="description" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($description) ? $description : ''; ?></textarea>
		</div>
		<div hidden class="form-group">
			<label for="description" class="control-label">QTY</label>
			<textarea name="prod_qty" id="prod_qty" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($prod_qty) ? $prod_qty : ''; ?></textarea>
		</div>
		<div class="form-group">
			<label for="cost" class="control-label">Sale Price</label>
			<input type="number" name="cost" id="cost" step="any" class="form-control rounded-0 text-end" value="<?php echo isset($cost) ? $cost : ''; ?>">
		</div>
		<div hidden class="form-group">
			<label for="categories_id" class="control-label">Categories</label>
			<select name="categories_id" id="categories_id" class="custom-select select2">
				<option <?php echo !isset($categories_id) ? 'selected' : '' ?> disabled></option>
				<?php
				$categories = $conn->query("SELECT * FROM `categories` where categories_status = 1 order by `categories_name` asc");
				while ($row = $categories->fetch_assoc()) :
				?>
					<option value="<?php echo $row['id'] ?>" <?php echo isset($categories_id) && $categories_id == $row['id'] ? "selected" : "" ?>><?php echo $row['categories_name'] ?></option>
				<?php endwhile; ?>
			</select>
		</div>
		<div hidden class="form-group">
			<label for="brands_id" class="control-label">Brand</label>
			<select name="brands_id" id="brands_id" class="custom-select select2">
				<option <?php echo !isset($brands_id) ? 'selected' : '' ?> disabled></option>
				<?php
				$brands = $conn->query("SELECT * FROM `brands` where brands_status = 1 order by `brands_name` asc");
				while ($row = $brands->fetch_assoc()) :
				?>
					<option value="<?php echo $row['id'] ?>" <?php echo isset($brands_id) && $brands_id == $row['id'] ? "selected" : "" ?>><?php echo $row['brands_name'] ?></option>
				<?php endwhile; ?>
			</select>
		</div>
		<div class="form-group">
			<label for="status" class="control-label">Status</label>
			<select name="status" id="status" class="custom-select selevt">
				<option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
				<option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
			</select>
		</div>
	</form>
</div>
<script>
	$(document).ready(function() {
		$('.select2').select2({
			placeholder: "Please Select here",
			width: "relative"
		})
		$('#item-form').submit(function(e) {
			e.preventDefault();
			var _this = $(this)
			$('.err-msg').remove();
			start_loader();
			$.ajax({
				url: _base_url_ + "classes/Master.php?f=save_products",
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