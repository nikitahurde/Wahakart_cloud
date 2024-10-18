<?php
$qry = $conn->query("SELECT * FROM receiving_list_prod where id = '{$_GET['id']}'");
if ($qry->num_rows > 0) {
    foreach ($qry->fetch_array() as $k => $v) {
        $$k = $v;
    }
    if ($from_order == 1) {
        $po_qry = $conn->query("SELECT p.*,s.categories_name as categories FROM `purchase_order_list_prod` p inner join `categories` s on p.categories_id = s.id where p.id= '{$form_id}' ");
        if ($po_qry->num_rows > 0) {
            foreach ($po_qry->fetch_array() as $k => $v) {
                if (!isset($$k))
                    $$k = $v;
            }
        }
    } else {
        $qry = $conn->query("SELECT b.*,s.categories_name as categories,p.po_code FROM back_order_list_prod b inner join categories s on b.categories_id = s.id inner join purchase_order_list_prod p on b.po_id = p.id  where b.id = '{$form_id}'");
        if ($qry->num_rows > 0) {
            foreach ($qry->fetch_array() as $k => $v) {
                if ($k == 'id')
                    $k = 'bo_id';
                if (!isset($$k))
                    $$k = $v;
            }
        }
    }
}
?>
<div class="card card-outline card-primary">
    <div class="card-header">
        <h4 class="card-title">Received Order Details - <?php echo $po_code ?></h4>
    </div>
    <div class="card-body" id="print_out">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <label class="control-label text-info">FROM P.O. Code</label>
                    <div><?php echo isset($po_code) ? $po_code : '' ?></div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="categories_id" class="control-label text-info">Brand</label>
                        <div><?php echo isset($categories) ? $categories : '' ?></div>
                    </div>
                </div>
                <?php if (isset($bo_id)) : ?>
                    <div class="col-md-6">
                        <label class="control-label text-info">FROM B.O. Code</label>
                        <div><?php echo isset($bo_code) ? $bo_code : '' ?></div>
                    </div>
                <?php endif; ?>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label class="control-label text-info">MFC No</label>
                    <div><?php echo isset($barcode_no) ? $barcode_no : '' ?></div>
                </div>
                <div hidden class="col-md-6">
                    <div class="form-group">
                        <label for="volume" class="control-label text-info">Volume</label>
                        <div><?php echo isset($volume) ? $volume : '' ?></div>
                    </div>
                </div>
            </div>
            <h4 class="text-info">Products</h4>
            <table class="table table-striped table-bordered" id="list">
                <colgroup>
                    <col width="30%">
                    <col width="10%">
                    <col width="10%">
                    <col width="25%">
                    <col width="25%">
                </colgroup>
                <thead>
                    <tr class="text-light bg-navy">
                        <th class="text-center py-1 px-2">Product</th>
                        <th class="text-center py-1 px-2">Qty</th>
                        <th class="text-center py-1 px-2">Unit</th>
                        <th class="text-center py-1 px-2">Cost</th>
                        <th class="text-center py-1 px-2">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $total = 0;
                    $qry = $conn->query("SELECT s.*,i.name,i.description FROM `stock_list_prod` s inner join products_list i on s.item_id = i.id where s.id in ({$stock_ids})");
                    while ($row = $qry->fetch_assoc()) :
                        $total += $row['total']
                    ?>
                        <tr>
                            <td class="py-1 px-2 text-center">
                                <?php echo $row['name'] ?> <br>

                            </td>
                            <td class="py-1 px-2 text-center"><?php echo number_format($row['quantity'], 2) ?></td>
                            <td class="py-1 px-2 text-center"><?php echo ($row['unit']) ?></td>

                            <td class="py-1 px-2 text-right"><?php echo number_format($row['price']) ?></td>
                            <td class="py-1 px-2 text-right"><?php echo number_format($row['total']) ?></td>
                        </tr>

                    <?php endwhile; ?>

                </tbody>
                <tfoot>
                    <tr hidden>
                        <th class="text-right py-1 px-2" colspan="4">Sub Total</th>
                        <th class="text-right py-1 px-2 sub-total"><?php echo number_format($total, 2)  ?></th>
                    </tr>
                    <tr hidden>
                        <th class="text-right py-1 px-2" colspan="4">Discount <?php echo isset($discount_perc) ? $discount_perc : 0 ?>%</th>
                        <th class="text-right py-1 px-2 discount"><?php echo isset($discount) ? number_format($discount, 2) : 0 ?></th>
                    </tr>
                    <tr hidden>
                        <th class="text-right py-1 px-2" colspan="4">Tax <?php echo isset($tax_perc) ? $tax_perc : 0 ?>%</th>
                        <th class="text-right py-1 px-2 tax"><?php echo isset($tax) ? number_format($tax, 2) : 0 ?></th>
                    </tr>
                    <tr>
                        <th class="text-right py-1 px-2" colspan="4">Total</th>
                        <th class="text-right py-1 px-2 grand-total"><?php echo isset($amount) ? number_format($amount, 2) : 0 ?></th>
                    </tr>
                </tfoot>
            </table>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="remarks" class="text-info control-label">Remarks</label>
                        <p><?php echo isset($remarks) ? $remarks : '' ?></p>
                    </div>
                </div>
                <?php if ($status > 0) : ?>
                    <div class="col-md-6">
                        <span class="text-info"><?php echo ($status == 2) ? "RECEIVED" : "PARTIALLY RECEIVED" ?></span>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="card-footer py-1 text-center">
        <button class="btn btn-flat btn-success" type="button" id="print">Print</button>
        <a class="btn btn-flat btn-primary" href="<?php echo base_url . '/admin?page=receiving_prod/manage_receiving_prod&id=' . (isset($id) ? $id : '') ?>">Edit</a>
        <a class="btn btn-flat btn-dark" href="<?php echo base_url . '/admin?page=receiving_prod' ?>">Back To List</a>
    </div>
</div>
<table id="clone_list" class="d-none">
    <tr>
        <td class="py-1 px-2 text-center">
            <button class="btn btn-outline-danger btn-sm rem_row" type="button"><i class="fa fa-times"></i></button>
        </td>
        <td class="py-1 px-2 text-center item">
        </td>
        <td class="py-1 px-2 text-center qty">
            <span class="visible"></span>
            <input type="hidden" name="item_id[]">
            <input type="hidden" name="unit[]">
            <input type="hidden" name="qty[]">
            <input type="hidden" name="price[]">
            <input type="hidden" name="total[]">
        </td>
        <td class="py-1 px-2 text-center unit">
        </td>

        <td class="py-1 px-2 text-right cost">
        </td>
        <td class="py-1 px-2 text-right total">
        </td>
    </tr>
</table>
<script>
    $(function() {
        $('#print').click(function() {
            start_loader()
            var _el = $('<div>')
            var _head = $('head').clone()
            _head.find('title').text("Received Order Details - Print View")
            var p = $('#print_out').clone()
            p.find('tr.text-light').removeClass("text-light bg-navy")
            _el.append(_head)
            _el.append('<div class="d-flex justify-content-center">' +
                '<div class="col-1 text-right">' +
                '<img src="<?php echo validate_image($_settings->info('logo')) ?>" width="65px" height="65px" />' +
                '</div>' +
                '<div class="col-10">' +
                '<h4 class="text-center"><?php echo $_settings->info('name') ?></h4>' +
                '<h4 class="text-center">Received Order</h4>' +
                '</div>' +
                '<div class="col-1 text-right">' +
                '</div>' +
                '</div><hr/>')
            _el.append(p.html())
            var nw = window.open("", "", "width=1200,height=900,left=250,location=no,titlebar=yes")
            nw.document.write(_el.html())
            nw.document.close()
            setTimeout(() => {
                nw.print()
                setTimeout(() => {
                    nw.close()
                    end_loader()
                }, 200);
            }, 500);
        })
    })
</script>