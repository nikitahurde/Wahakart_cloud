<style>
	.red {
		background-color: red;
	}
</style>

<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Stocks</h3>
		<!-- <div class="card-tools">
			<a href="<?php echo base_url ?>admin/?page=purchase_order/manage_po" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Create New</a>
		</div> -->
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<div class="container-fluid">
				<table class="table table-bordered table-stripped">
					<colgroup>
						<col width="5%">
						<col width="20%">
						<col width="20%">
						<col width="40%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>Item Name</th>
							<th>Categories</th>
							<th>Price</th>
							<th>Available Stocks</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$i = 1;
						$qry = $conn->query("SELECT i.*,s.categories_name as categories FROM `products_list` i inner join categories s on i.categories_id = s.id order by `name` desc");
						while ($row = $qry->fetch_assoc()) :
							$in = $conn->query("SELECT SUM(quantity) as total FROM stock_list_prod where item_id = '{$row['id']}' and type = 1")->fetch_array()['total'];
							$out = $conn->query("SELECT SUM(quantity) as total FROM stock_list_prod where item_id = '{$row['id']}' and type = 2")->fetch_array()['total'];
							$row['available'] = $in - $out;
							$alt = $row['available'];
						?>
							<tr>
								<td class="text-center"><?php echo $i++; ?></td>
								<td><?php echo $row['name'] ?></td>
								<td><?php echo $row['categories'] ?></td>
								<td><?php echo $row['cost'] ?></td>
								<?php if ($row['available'] < 10) : ?>
									<td class="text-center red">
										<span><?php echo number_format($row['available']) ?></span>
									</td>
								<?php else : ?>
									<td class="text-center">
										<?php echo number_format($row['available']) ?>
									</td>
								<?php endif; ?>

							</tr>
						<?php endwhile; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.delete_data').click(function() {
			_conf("Are you sure to delete this Received Orders permanently?", "delete_receiving_prod", [$(this).attr('data-id')])
		})
		$('.view_details').click(function() {
			uni_modal("Receiving Details", "receiving_prod/view_receiving_prod.php?id=" + $(this).attr('data-id'), 'mid-large')
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable();
	})

	function delete_receiving($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_receiving_prod",
			method: "POST",
			data: {
				id: $id
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured.", 'error');
				end_loader();
			},
			success: function(resp) {
				if (typeof resp == 'object' && resp.status == 'success') {
					location.reload();
				} else {
					alert_toast("An error occured.", 'error');
					end_loader();
				}
			}
		})
	}
</script>