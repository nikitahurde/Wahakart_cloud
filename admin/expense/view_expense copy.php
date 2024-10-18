<?php require_once('./../../config.php') ?>
<?php
$qry = $conn->query("SELECT * FROM `expense` where  id = '{$_GET['id']}' ");
if ($qry->num_rows > 0) {
    foreach ($qry->fetch_assoc() as $k => $v) {
        $$k = $v;
    }
}
?>
<style>
    #uni_modal .modal-footer {
        display: none;
    }
</style>
<div class="container-fluid" id="print_out">
    <div id='transaction-printable-details' class='position-relative'>
        <div class="row">
            <fieldset class="w-100">
                <div class="col-12">

                    <dl>
                        <dt class="text-info">Product:</dt>
                        <dd class="pl-3"><?php echo $item ?></dd>
                        <dt class="text-info">Order Date:</dt>
                        <dd class="pl-3"><?php echo isset($expense_date) ? $expense_date : '' ?></dd>
                        <dt class="text-info">Dispatch Date:</dt>
                        <dd class="pl-3"><?php echo isset($dispatch_date) ? $dispatch_date : '' ?></dd>
                        <dt class="text-info">Previously Ready Job:</dt>
                        <dd class="pl-3"><?php echo isset($pre_job) ? $pre_job : '' ?></dd>
                        <dt class="text-info">Order Taken By:</dt>
                        <dd class="pl-3"><?php echo isset($order_by) ? $order_by : '' ?></dd>
                        <dt class="text-info">Docket No:</dt>
                        <dd class="pl-3"><?php echo isset($docket) ? $docket : '' ?></dd>
                        <dt class="text-info">Dispatch Through:</dt>
                        <dd class="pl-3"><?php echo isset($details) ? $details : '' ?></dd>
                        <dt class="text-info">Material Cost:</dt>
                        <dd class="pl-3"><?php echo isset($price) ? $price : '' ?></dd>
                        <dt class="text-info">Labour Cost:</dt>
                        <dd class="pl-3"><?php echo isset($labour) ? $labour : '' ?></dd>
                        <dt class="text-info">Transportation Cost:</dt>
                        <dd class="pl-3"><?php echo isset($transpotation) ? $transpotation : '' ?></dd>
                        <dt class="text-info">Misc. Cost:</dt>
                        <dd class="pl-3"><?php echo isset($misc) ? $misc : '' ?></dd>
                        <dt class="text-info">Over All Investment Cost</dt>
                        <dd class="pl-3"><?php echo isset($overal) ? $overal : '' ?></dd>
                        <dt class="text-info">Selling Cost of Product</dt>
                        <dd class="pl-3"><?php echo isset($sell_cost) ? $sell_cost : '' ?></dd>
                        <dt class="text-info">Net Gain/Profit Amount</dt>
                        <dd class="pl-3"><?php echo isset($pl) ? $pl : '' ?></dd>
                        <dt class="text-info">Amount:</dt>
                        <dd class="pl-3"><?php echo isset($price) ? $price : '' ?></dd>

                    </dl>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<div class="form-group">
    <div class="col-12">
        <div class="d-flex justify-content-end align-items-center">
            <button class="btn btn-dark btn-flat" type="button" id="cancel" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>


<script>
    $(function() {
        $('.table td,.table th').addClass('py-1 px-2 align-middle')
    })
</script>