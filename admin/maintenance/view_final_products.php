<?php require_once('./../../config.php') ?>
<?php
$qry = $conn->query("SELECT i.*,s.categories_name as categories FROM `products_list` i inner join categories s on i.categories_id = s.id where  i.id = '{$_GET['id']}' ");
if ($qry->num_rows > 0) {
    foreach ($qry->fetch_assoc() as $k => $v) {
        $$k = $v;
    }
}
$qry2 = $conn->query("SELECT i.*,s.brands_name as brands FROM `products_list` i inner join brands s on i.brands_id = s.id where  i.id = '{$_GET['id']}' ");
if ($qry2->num_rows > 0) {
    foreach ($qry2->fetch_assoc() as $k => $v) {
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
                        <dt class="text-info">Product Name:</dt>
                        <dd class="pl-3"><?php echo $name ?></dd>
                        <dt class="text-info">Description:</dt>
                        <dd class="pl-3"><?php echo isset($description) ? $description : '' ?></dd>
                        <dt class="text-info">Sale Price:</dt>
                        <dd class="pl-3"><?php echo isset($cost) ? number_format($cost, 2) : '' ?></dd>
                        <dt hidden class="text-info">Categories:</dt>
                        <dd hidden class="pl-3"><?php echo isset($categories) ? $categories : '' ?></dd>
                        <dt hidden class="text-info">Brands:</dt>
                        <dd hidden class="pl-3"><?php echo isset($brands) ? $brands : '' ?></dd>
                        <dt hidden class="text-info">QTY:</dt>
                        <dd hidden class="pl-3"><?php echo isset($prod_qty) ? $prod_qty : '' ?></dd>
                        <dt class="text-info">Status:</dt>
                        <dd class="pl-3">
                            <?php if ($status == 1) : ?>
                                <span class="badge badge-success rounded-pill">Active</span>
                            <?php else : ?>
                                <span class="badge badge-danger rounded-pill">Inactive</span>
                            <?php endif; ?>
                        </dd>
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