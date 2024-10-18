<?php
if (isset($_GET['id'])) {
    $qry = $conn->query("SELECT p.*,s.categories_name as categories FROM purchase_order_list_man p inner join categories_man s on p.categories_id = s.id  where p.id = '{$_GET['id']}'");
    if ($qry->num_rows > 0) {
        foreach ($qry->fetch_array() as $k => $v) {
            $$k = $v;
        }
    }
}
?>
<style>
    select[readonly].select2-hidden-accessible+.select2-container {
        pointer-events: none;
        touch-action: none;
        background: #eee;
        box-shadow: none;
    }

    select[readonly].select2-hidden-accessible+.select2-container .select2-selection {
        background: #eee;
        box-shadow: none;
    }
</style>
<div class="card card-outline card-primary">
    <div class="card-header">
        <h4 class="card-title"><?php echo isset($id) ? "Purchase Order Details - " . $po_code : 'Create New Purchase Order' ?></h4>
    </div>
    <div class="card-body">
        <form action="" id="po-form">
            <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <label class="control-label text-info">P.O. Code</label>
                        <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo isset($po_code) ? $po_code : '' ?>" readonly>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="supplier" class="control-label">Product</label>
                            <select name="supplier" id="supplier" class="custom-select select2">
                                <option <?php echo !isset($id) ? 'selected' : '' ?> disabled></option>
                                <?php
                                $supplier = $conn->query("SELECT * FROM `products_list` where status = 1 order by `name` asc");
                                while ($row = $supplier->fetch_assoc()) :
                                ?>
                                    <option value="<?php echo $row['name'] ?>" <?php echo isset($id) && $id == $row['name'] ? "selected" : "" ?>><?php echo $row['name'] ?></option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="categories_id" class="control-label text-info">Select Brand</label>
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
                    </div>
                </div>
                <hr>
                <fieldset>
                    <legend class="text-info">Material Form</legend>
                    <div class="row " style="align-items:left;">
                        <?php
                        $item_arr = array();
                        $cost_arr = array();
                        $item = $conn->query("SELECT * FROM `item_list_man` WHERE status = 1 ORDER BY `name` ASC");
                        while ($row = $item->fetch_assoc()) {
                            $item_arr[$row['categories_id']][$row['id']] = $row;
                            $cost_arr[$row['id']] = $row['cost'];
                        }
                        ?>

                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="item_id" class="control-label">Employee Name</label>
                                <select id="item_id" class="custom-select" onchange="updateTempPrice()">
                                    <option disabled selected></option>
                                    <?php foreach ($item_arr as $categories) {
                                        foreach ($categories as $item) { ?>
                                            <option value="<?php echo $item['id']; ?>"><?php echo $item['name']; ?></option>
                                    <?php }
                                    } ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="aaaa" class="control-label">Date</label>
                                <input type="date" name="aaaa" id="aaaa" class="form-control">
                            </div>
                        </div>
                        <div hidden class="col-md-5">
                            <div class="form-group">
                                <label for="expiry_date"> Date</label>
                                <input type="date" name="expiry_date" id="expiry_date" class="form-control">
                            </div>
                        </div>

                        <div hidden class="col-md-5">
                            <div class="form-group">
                                <label for="barcode_no">Barcode No</label>
                                <input type="text" name="barcode_no" id="barcode_no" class="form-control" value="<?php echo isset($barcode_no) ? $barcode_no : '' ?>">
                            </div>
                        </div>
                        <div hidden class="col-md-5">
                            <div class="form-group">
                                <label for="volume" class="control-label">Work</label>
                                <select name="volume" id="volume" class="form-control">
                                    <option value="#">Select Work...</option>
                                    <option value="molding">molding</option>
                                    <option value="ghisai">ghisai</option>
                                    <option value="mudwork">mudwork</option>
                                    <option value="ghisai+mudwork">ghisai+mudwork</option>
                                    <option value="painting">painting</option>
                                    <option value="murtikar">murtikar</option>
                                    <option value="painting+murtikar">painting+murtikar</option>
                                    <option value="fabrication">fabrication</option>
                                    <option value="bowling">bowling</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="unit" class="control-label">Work</label>
                                <select name="unit" id="unit" class="form-control">
                                    <option value="#">Select Work...</option>
                                    <option value="molding">molding</option>
                                    <option value="ghisai">ghisai</option>
                                    <option value="mudwork">mudwork</option>
                                    <option value="ghisai+mudwork">ghisai+mudwork</option>
                                    <option value="painting">painting</option>
                                    <option value="murtikar">murtikar</option>
                                    <option value="painting+murtikar">painting+murtikar</option>
                                    <option value="fabrication">fabrication</option>
                                    <option value="bowling">bowling</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="time" class="control-label">Time</label>
                                <select name="time" id="time" class="form-control">

                                    <option>Select Time</option>
                                    <option value="fullday">Fullday</option>
                                    <option value="halfday">Halfday</option>
                                    <option value="2h">2H</option>
                                    <option value="1h">1H</option>


                                </select>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="tempprice" class="control-label">Daily Sallary</label>
                                <input type="number" class="form-control rounded-0" id="tempprice" readonly>
                            </div>
                        </div>
                        <!-- <div class="col-md-5">
                            <div class="form-group">
                                <label for="tempprice" class="control-label">TempPrice</label>
                                <input type="number" class="form-control rounded-0" id="tempprice">
                            </div>
                        </div> -->
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="price" class="control-label">Sallary</label>
                                <input type="number" class="form-control rounded-0" id="price">
                            </div>
                        </div>
                        <div hidden class="col-md-5">
                            <div class="form-group">
                                <label for="qty" class="control-label">Qty</label>
                                <input type="number" step="any" class="form-control rounded-0" id="qty">
                            </div>
                        </div>


                        <div class="col-md-5 text-center" style="margin-top:36px;">
                            <div class="form-group">
                                <button type="button" class="btn btn-flat btn-sm btn-primary" id="add_to_list">Add to List</button>
                            </div>
                        </div>


                </fieldset>
                <hr>
                <table class="table table-striped table-bordered" id="list">
                    <colgroup>
                        <col width="5%">
                        <col width="10%">

                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr class="text-light bg-navy">
                            <th class="text-center py-1 px-2"></th>
                            <th class="text-center py-1 px-2">Employee Name</th>
                            <th class="text-center py-1 px-2">Work</th>
                            <th class="text-center py-1 px-2">Time</th>
                            <th class="text-center py-1 px-2">Date</th>
                            <th class="text-center py-1 px-2">Sallary</th>
                            <th class="text-center py-1 px-2">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $total = 0;
                        if (isset($id)) :
                            $qry = $conn->query("SELECT p.*,i.name,i.description,i.cost FROM `po_items_man` p inner join item_list_man i on p.item_id = i.id where p.po_id = '{$id}'");
                            while ($row = $qry->fetch_assoc()) :
                                $total += $row['total']
                        ?>
                                <tr>
                                    <td class="py-1 px-2 text-center">
                                        <button class="btn btn-outline-danger btn-sm rem_row" type="button"><i class="fa fa-times"></i></button>
                                    </td>
                                    <td class="py-1 px-2 text-center item">
                                        <?php echo $row['name']; ?> <br>

                                    </td>


                                    <td class="py-1 px-2 text-center unit">
                                        <?php echo $row['unit']; ?>
                                    </td>
                                    <td class="py-1 px-2 text-center time">
                                        <?php echo $row['time']; ?>
                                    </td>
                                    <td class="py-1 px-2 text-center aaaa">
                                        <?php echo date('d-m-Y', strtotime($row['aaaa'])); ?>

                                    </td>

                                    <td hidden class="py-1 px-2 text-center qty">
                                        <span class="visible"><?php echo number_format($row['quantity']); ?></span>
                                        <input type="hidden" name="item_id[]" value="<?php echo $row['item_id']; ?>">
                                        <input type="hidden" name="unit[]" value="<?php echo $row['unit']; ?>">
                                        <input type="hidden" name="aaaa[]" value="<?php echo $row['aaaa']; ?>">
                                        <input type="hidden" name="qty[]" value="<?php echo $row['quantity']; ?>">
                                        <input type="hidden" name="price[]" value="<?php echo $row['price']; ?>">
                                        <input type="hidden" name="total[]" value="<?php echo $row['total']; ?>">
                                    </td>

                                    <td class="py-1 px-2 text-right cost">
                                        <?php echo number_format($row['price']); ?>
                                    </td>
                                    <td class="py-1 px-2 text-right total">
                                        <?php echo number_format($row['total']); ?>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </tbody>
                    <tfoot>
                        <tr hidden>
                            <th class="text-right py-1 px-2" colspan="5">Sub Total</th>
                            <th class="text-right py-1 px-2 sub-total">0</th>
                        </tr>
                        <tr hidden>
                            <th class="text-right py-1 px-2" colspan="5">Discount <input style="width:40px !important" name="discount_perc" class='' type="number" min="0" max="100" value="<?php echo isset($discount_perc) ? $discount_perc : 0 ?>">%
                                <input type="hidden" name="discount" value="<?php echo isset($discount) ? $discount : 0 ?>">
                            </th>
                            <th class="text-right py-1 px-2 discount"><?php echo isset($discount) ? number_format($discount) : 0 ?></th>
                        </tr>
                        <tr hidden>
                            <th class="text-right py-1 px-2" colspan="5">Tax <input style="width:40px !important" name="tax_perc" class='' type="number" min="0" max="100" value="<?php echo isset($tax_perc) ? $tax_perc : 0 ?>">%
                                <input type="hidden" name="tax" value="<?php echo isset($discount) ? $discount : 0 ?>">
                            </th>
                            <th class="text-right py-1 px-2 tax"><?php echo isset($tax) ? number_format($tax) : 0 ?></th>
                        </tr>
                        <tr>
                            <th class="text-right py-1 px-2" colspan="5">Total
                                <input type="hidden" name="amount" value="<?php echo isset($discount) ? $discount : 0 ?>">
                            </th>
                            <th class="text-right py-1 px-2 grand-total">0</th>
                        </tr>
                    </tfoot>
                </table>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="remarks" class="text-info control-label">Remarks</label>
                            <textarea name="remarks" id="remarks" rows="3" class="form-control rounded-0"><?php echo isset($remarks) ? $remarks : '' ?></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="card-footer py-1 text-center">
        <button class="btn btn-flat btn-primary" type="submit" form="po-form">Save</button>
        <a class="btn btn-flat btn-dark" href="<?php echo base_url . '/admin?page=purchase_order_man' ?>">Cancel</a>
    </div>
</div>
<table id="clone_list" class="d-none">
    <tr>
        <td class="py-1 px-2 text-center">
            <button class="btn btn-outline-danger btn-sm rem_row" type="button"><i class="fa fa-times"></i></button>
        </td>
        <td class="py-1 px-2 text-center item">
        </td>

        <td class="py-1 px-2 text-center unit">
        </td>
        <td class="py-1 px-2 text-center time">
        </td>
        <td class="py-1 px-2 text-center aaaa">
        </td>
        <td hidden class="py-1 px-2 text-center qty">
            <span class="visible"></span>
            <input type="hidden" name="item_id[]">
            <input type="hidden" name="unit[]">
            <input type="hidden" name="aaaa[]">
            <input type="hidden" name="qty[]">
            <input type="hidden" name="time[]">
            <input type="hidden" name="price[]">
            <input type="hidden" name="total[]">
        </td>


        <td class="py-1 px-2 text-right cost">
        </td>
        <td class="py-1 px-2 text-right total">
        </td>
    </tr>
</table>
<script>
    var items = $.parseJSON('<?php echo json_encode($item_arr) ?>')
    var costs = $.parseJSON('<?php echo json_encode($cost_arr) ?>')

    $(function() {
        $('.select2').select2({
            placeholder: "Please select here",
            width: 'resolve',
        })
        $('#item_id').select2({
            placeholder: "Please select Brand type first",
            width: 'resolve',
        })

        $('#categories_id').change(function() {
            var categories_id = $(this).val()
            $('#item_id').select2('destroy')
            if (!!items[categories_id]) {
                $('#item_id').html('')
                var list_item = new Promise(resolve => {
                    Object.keys(items[categories_id]).map(function(k) {
                        var row = items[categories_id][k]
                        var opt = $('<option>')
                        opt.attr('value', row.id)
                        opt.text(row.name)
                        $('#item_id').append(opt)
                    })
                    resolve()
                })
                list_item.then(function() {
                    $('#item_id').select2({
                        placeholder: "Please select Employee here",
                        width: 'resolve',
                    })
                })
            } else {
                list_item.then(function() {
                    $('#item_id').select2({
                        placeholder: "No Employee Listed yet",
                        width: 'resolve',
                    })
                })
            }

        })

        $('#add_to_list').click(function() {
            var categories = $('#categories_id').val();
            var item = $('#item_id').val();
            var expiry_date = $('#expiry_date').val();
            var qty = $('#qty').val() > 0 ? $('#qty').val() : 1;
            var unit = $('#unit').val();
            var time = $('#time').val();
            var aaaa = $('#aaaa').val();
            var price = $('#price').val();
            var total = parseFloat(qty) * parseFloat(price);

            var item_name = items[categories][item].name || 'N/A';
            var item_description = items[categories][item].description || 'N/A';

            var tr = $('#clone_list tr').clone();

            if (item == '' || unit == '') {
                alert_toast('Form Item textfields are required.', 'warning');
                return false;
            }

            tr.find('[name="item_id[]"]').val(item);

            // Format the expiry date as dd/mm/yyyy
            var expiryDateObject = new Date(aaaa);
            var formattedExpiryDate =
                ("0" + expiryDateObject.getDate()).slice(-2) +
                "/" +
                ("0" + (expiryDateObject.getMonth() + 1)).slice(-2) +
                "/" +
                expiryDateObject.getFullYear();



            tr.find('[name="unit[]"]').val(unit);
            tr.find('[name="time[]"]').val(time);
            tr.find('[name="aaaa[]"]').val(aaaa);
            tr.find('[name="qty[]"]').val(qty);
            tr.find('[name="price[]"]').val(price);
            tr.find('[name="total[]"]').val(total);
            tr.attr('data-id', item);

            tr.find('.qty .visible').text(qty);
            tr.find('.unit').text(unit);

            tr.find('.time').text(time);
            tr.find('.aaaa').text(aaaa);
            tr.find('.item').html(item_name);
            tr.find('.cost').text(parseFloat(price).toLocaleString('en-US'));
            tr.find('.total').text(parseFloat(total).toLocaleString('en-US'))
            $('table#list tbody').append(tr)
            calc()
            $('#item_id').val('').trigger('change')
            $('#qty').val('')
            $('#unit').val('')
            $('#time').val('')
            $('#price').val('')
            tr.find('.rem_row').click(function() {
                rem($(this))
            })

            $('[name="discount_perc"],[name="tax_perc"]').on('input', function() {
                calc()
            })
            // $('#categories_id').attr('readonly', 'readonly')
        })
        $('#po-form').submit(function(e) {
            e.preventDefault();
            var _this = $(this)
            $('.err-msg').remove();
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=save_po_man",
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
                    if (resp.status == 'success') {
                        location.replace(_base_url_ + "admin/?page=purchase_order_man/view_po_man&id=" + resp.id);
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
                    $('html,body').animate({
                        scrollTop: 0
                    }, 'fast')
                }
            })
        })

        if ('<?php echo isset($id) && $id > 0 ?>' == 1) {
            calc()
            $('#categories_id').trigger('change')
            // $('#categories_id').attr('readonly', 'readonly')
            $('table#list tbody tr .rem_row').click(function() {
                rem($(this))
            })
        }
    })

    function rem(_this) {
        _this.closest('tr').remove()
        calc()
        if ($('table#list tbody tr').length <= 0)
            $('#categories_id')

    }

    function calc() {
        var sub_total = 0;
        var grand_total = 0;
        var discount = 0;
        var tax = 0;
        $('table#list tbody input[name="total[]"]').each(function() {
            sub_total += parseFloat($(this).val())

        })
        $('table#list tfoot .sub-total').text(parseFloat(sub_total).toLocaleString('en-US', {
            style: 'decimal',
            maximumFractionDigit: 2
        }))
        var discount = sub_total * (parseFloat($('[name="discount_perc"]').val()) / 100)
        sub_total = sub_total - discount;
        var tax = sub_total * (parseFloat($('[name="tax_perc"]').val()) / 100)
        grand_total = sub_total + tax
        $('.discount').text(parseFloat(discount).toLocaleString('en-US', {
            style: 'decimal',
            maximumFractionDigit: 2
        }))
        $('[name="discount"]').val(parseFloat(discount))
        $('.tax').text(parseFloat(tax).toLocaleString('en-US', {
            style: 'decimal',
            maximumFractionDigit: 2
        }))
        $('[name="tax"]').val(parseFloat(tax))
        $('table#list tfoot .grand-total').text(parseFloat(grand_total).toLocaleString('en-US', {
            style: 'decimal',
            maximumFractionDigit: 2
        }))
        $('[name="amount"]').val(parseFloat(grand_total))

    }
</script>
<!-- <script>
    // Get references to the select element and input element
    var unitSelect = document.getElementById("unit");
    var priceInput = document.getElementById("tempprice");

    // Listen for changes in the select element
    unitSelect.addEventListener("change", function() {
        // Get the selected value from the dropdown
        var selectedValue = unitSelect.value;

        // Set the price based on the selected value
        if (selectedValue === "molding") {
            priceInput.value = 800;
        } else if (selectedValue === "ghisai") {
            priceInput.value = 500;
        } else if (selectedValue === "mudwork") {
            priceInput.value = 300;
        } else if (selectedValue === "painting") {
            priceInput.value = 700;
        } else if (selectedValue === "murtikar") {
            priceInput.value = 400;
        } else if (selectedValue === "fabrication") {
            priceInput.value = 250;
        } else if (selectedValue === "bowling") {
            priceInput.value = 900;
        } else {
            // Reset the price to an empty value if no matching option is selected
            priceInput.value = "";
        }
    });
</script> -->
<script>
    document.getElementById('time').addEventListener('change', function() {
        var timeSelect = document.getElementById('time');
        var temppriceInput = document.getElementById('tempprice');
        var priceInput = document.getElementById('price');

        if (timeSelect.value === 'halfday') {
            var tempPriceValue = parseFloat(temppriceInput.value);
            if (!isNaN(tempPriceValue)) {
                var newPrice = tempPriceValue / 2;
                priceInput.value = newPrice.toFixed(2);
            } else {
                priceInput.value = '';
            }
        } else if (timeSelect.value === 'fullday') {
            var tempPriceValue = parseFloat(temppriceInput.value);
            if (!isNaN(tempPriceValue)) {
                var newPrice = tempPriceValue;
                priceInput.value = newPrice.toFixed(2);
            } else {
                priceInput.value = '';
            }
        } else if (timeSelect.value === '2h') {
            var tempPriceValue = parseFloat(temppriceInput.value);
            if (!isNaN(tempPriceValue)) {
                var newPrice = tempPriceValue / 8 * 2;
                priceInput.value = newPrice.toFixed(2);
            } else {
                priceInput.value = '';
            }
        } else if (timeSelect.value === '1h') {
            var tempPriceValue = parseFloat(temppriceInput.value);
            if (!isNaN(tempPriceValue)) {
                var newPrice = tempPriceValue / 8;
                priceInput.value = newPrice.toFixed(2);
            } else {
                priceInput.value = '';
            }
        }
    });
</script>
<script>
    function updateTempPrice() {
        var selectedItemId = document.getElementById('item_id').value;
        var temppriceInput = document.getElementById('tempprice');

        // Check if the selected item ID exists in the cost array
        if (Object.keys(<?php echo json_encode($cost_arr); ?>).includes(selectedItemId)) {
            var tempprice = <?php echo json_encode($cost_arr); ?>[selectedItemId];
            temppriceInput.value = tempprice;
        } else {
            temppriceInput.value = '';
        }
    }
</script>