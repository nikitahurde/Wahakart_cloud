<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Expenses</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span> Add expense</a>
		</div>
	</div>
	<div class="card-body" style="
    font-size: 12px;
">
		<div class="container-fluid">
			<div class="container-fluid">
				<table class="table table-bordered table-stripped">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="8%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">

					</colgroup>
					<thead>
						<tr>
							<th>ID</th>
							<th>Product</th>
							<th>Order Date</th>
							<th>Dispatch Date</th>
							<th>Previously Ready Job</th>
							<th>Order Taken By</th>
							<th>Docket No</th>
							<th>Shipping Through</th>
							<th>Material Cost</th>
							<th>Labour Cost</th>
							<th>Transportation Cost</th>
							<th>Misc. Cost</th>
							<th>EPF /ASIC</th>
							<th>All Investment Cost</th>
							<th>Selling Cost</th>
							<th>Net Profit & Loss</th>


							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php $i = 1;
						$qry = $conn->query("SELECT * from `expense`");
						while ($row = $qry->fetch_assoc()) : ?>
							<tr>
								<td><?php echo $row['id']; ?></td>
								<td><?php echo $row['item'] ?></td>
								<td><?php echo $row['expense_date'] ?></td>
								<td><?php echo $row['dispatch_date'] ?></td>
								<td><?php echo $row['pre_job'] ?></td>
								<td><?php echo $row['order_by'] ?></td>
								<td><?php echo $row['docket'] ?></td>
								<td><?php echo $row['details'] ?></td>
								<td><?php echo $row['price'] ?></td>
								<td><?php echo $row['labour'] ?></td>
								<td><?php echo $row['transpotation'] ?></td>
								<td><?php echo $row['misc'] ?></td>
								<td><?php echo $row['epf'] ?></td>
								<td><?php echo $row['overal'] ?></td>
								<td><?php echo $row['sell_cost'] ?></td>
								<td><?php echo $row['pl'] ?></td>

								<td align="center">
									<button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
										Action
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<div class="dropdown-menu" role="menu">
										<a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> Print</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
									</div>
								</td>

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
			_conf("Are you sure to delete this Expense permanently?", "delete_category", [$(this).attr('data-id')])
		})
		$('#create_new').click(function() {
			uni_modal("<i class='fa fa-plus'></i> Add New Expense", "expense/manage_expense.php", "mid-large")
		})
		$('.edit_data').click(function() {
			uni_modal("<i class='fa fa-edit'></i> Edit categories Detials", "expense/manage_expense.php?id=" + $(this).attr('data-id'), "mid-large")
		})
		$('.view_data').click(function() {
			uni_modal("<i class='fa fa-truck-loading'></i> Expense Details", "expense/view_expense.php?id=" + $(this).attr('data-id'), "")
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable();
	})

	function delete_category($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_expense",
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