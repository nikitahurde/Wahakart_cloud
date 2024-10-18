<?php
if (isset($_GET['id'])) {
    $qry = $conn->query("SELECT * FROM sales_list where id = '{$_GET['id']}'");
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
        <h4 class="card-title"><?php echo isset($id) ? "Sale Details - " . $sales_code : 'Create New Product' ?></h4>
    </div>
    <div class="card-body">
        <form action="" id="sale-form">
            <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label text-info">Sale Code</label>
                        <input type="text" class="form-control form-control-sm rounded-0" value="<?php echo isset($sales_code) ? $sales_code : '' ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="product" class="control-label text-info">Product Name</label>
                        <?php
                        $product_arr = array();
                        $cost_arr = array();
                        $product = $conn->query("SELECT * FROM `products_list` where status = 1 order by `name` asc");
                        while ($row = $product->fetch_assoc()) :
                            $product_arr[$row['id']] = $row;
                            $cost_arr[$row['id']] = $row['cost'];
                        endwhile;
                        ?>
                        <!-- <div class="col-md-3"> -->
                        <div class="form-group">

                            <select id="products_id" class="custom-select select2" name="client" required>
                                <option disabled selected></option>
                                <?php foreach ($product_arr as $k => $v) : ?>
                                    <option value="<?php echo $v['name'] ?>"> <?php echo $v['name'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <hr>
                    <fieldset>
                        <legend class="text-info">Product Create</legend>
                        <div class="row justify-content-center align-items-end">
                            <?php
                            $item_arr = array();
                            $cost_arr = array();
                            $item = $conn->query("SELECT i.*, s.categories_name AS categories, i.cost FROM `item_list` i INNER JOIN categories s ON i.categories_id = s.id ORDER BY `name` DESC");


                            while ($row = $item->fetch_assoc()) {
                                $in = $conn->query("SELECT SUM(quantity) as total FROM stock_list where item_id = '{$row['id']}' and type = 1")->fetch_array()['total'];
                                $out = $conn->query("SELECT SUM(quantity) as total FROM stock_list where item_id = '{$row['id']}' and type = 2")->fetch_array()['total'];

                                $item_arr[$row['id']] = array('name' => $row['name'], 'quantity' => $in - $out);
                                $cost_arr[$row['id']] = $row['cost'];
                            }
                            ?>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="item_id" class="control-label">Material Name</label>
                                    <select id="item_id" class="custom-select select2" onchange="updateMaterialCost()">
                                        <option disabled selected></option>
                                        <?php foreach ($item_arr as $k => $v) : ?>
                                            <option value="<?php echo $k ?>"><?php echo $v['name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>

                            <div hidden class="col-md-4">
                                <div class="form-group">
                                    <label for="material_cost" class="control-label">Material Cost</label>
                                    <select id="material_cost" class="custom-select">
                                        <option disabled selected></option>
                                        <?php foreach ($cost_arr as $k => $cost) : ?>
                                            <option value="<?php echo $k ?>"><?php echo $cost ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>



                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="available" class="control-label">Available Qty</label>
                                    <select id="available" class="custom-select " readonly>
                                        <option disabled selected></option>
                                        <?php foreach ($item_arr as $k => $v) : ?>
                                            <option value="<?php echo $k ?>" data-item-id="<?php echo $k ?>" data-available-qty="<?php echo $v['quantity'] ?>" class="available-option"> <?php echo $v['quantity'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="qty" class="control-label">Qty</label>
                                    <input type="number" step="any" class="form-control rounded-0" id="qty">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="unit" class="control-label">Unit</label>
                                    <select id="unit" onchange="cal_remaining_qty()" class="custom-select">
                                        <option></option>
                                        <option value="kg">KG</option>
                                        <option value="ltr">Ltr</option>
                                        <option value="pcs">Pcs</option>

                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="rem" class="control-label">Remaining</label>
                                    <input type="number" step="any" class="form-control rounded-0" id="rem" readonly>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="cost" class="control-label">Price</label>

                                    <input type="number" class="form-control rounded-0" id="cost">
                                </div>
                            </div>

                            <div class="col-md-2 text-center">
                                <div class="form-group">
                                    <button type="button" class="btn btn-flat btn-sm btn-primary" id="add_to_list">Add to List</button>
                                </div>
                            </div>
                    </fieldset>
                    <hr>
                    <table class="table table-striped table-bordered" id="list">
                        <colgroup>
                            <col width="5%">
                            <col width="30%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="15%">


                        </colgroup>
                        <thead>
                            <tr class="text-light bg-navy">
                                <th class="text-center py-1 px-2"></th>
                                <th class="text-center py-1 px-2">Material Name</th>
                                <th class="text-center py-1 px-2">Available</th>
                                <th class="text-center py-1 px-2">Qty</th>
                                <th class="text-center py-1 px-2">Remaining</th>
                                <th class="text-center py-1 px-2">Unit</th>
                                <th class="text-center py-1 px-2">Cost</th>
                                <th class="text-center py-1 px-2">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $total = 0;
                            if (isset($id)) :
                                $qry = $conn->query("SELECT s.*,i.name,i.description FROM `stock_list` s inner join item_list i on s.item_id = i.id where s.id in ({$stock_ids})");
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
                                        <!-- <td class="py-1 px-2 text-center available">
                                            <?php echo $row['available']; ?> <br>

                                        </td> -->
                                        <td class="py-1 px-2 text-center available">
                                            <?php
                                            // Ensure $row['quantity'] is numeric (e.g., a float or integer)
                                            $available = floatval($row['available']);

                                            // Use number_format with explicit locale (e.g., English - United States)
                                            $formattedQuantity = number_format($available, 2, '.', ',');

                                            echo $formattedQuantity;
                                            ?>
                                        </td>
                                        <td class="py-1 px-2 text-center quantity">
                                            <?php
                                            // Ensure $row['quantity'] is numeric (e.g., a float or integer)
                                            $quantity = floatval($row['quantity']);

                                            // Use number_format with explicit locale (e.g., English - United States)
                                            $formattedQuantity = number_format($quantity, 2, '.', ',');

                                            echo $formattedQuantity;
                                            ?>
                                        </td>

                                        <!-- <td class="py-1 px-2 text-center qty">
                                            <span class="visible"><?php echo number_format($row['quantity']); ?></span>
                                            <input type="hidden" name="item_id[]" value="<?php echo $row['item_id']; ?>">
                                            <input type="hidden" name="unit[]" value="<?php echo $row['unit']; ?>">
                                            <input type="hidden" name="qty[]" value="<?php echo $row['quantity']; ?>">
                                            <input type="hidden" name="price[]" value="<?php echo $row['price']; ?>">
                                            <input type="hidden" name="total[]" value="<?php echo $row['total']; ?>">
                                        </td> -->

                                        <td class="py-1 px-2 text-center rem">
                                            <?php echo $row['rem']; ?>
                                        </td>
                                        <td class="py-1 px-2 text-center unit">
                                            <?php echo $row['unit']; ?>
                                        </td>

                                        <td class="py-1 px-2 text-center cost">
                                            <?php echo number_format($row['price']); ?>
                                        </td>
                                        <td class="py-1 px-2 text-center total">
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
                                <th hidden class="text-center py-1 px-2 tax"><?php echo isset($tax) ? number_format($tax) : 0 ?></th>
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
        <button class="btn btn-flat btn-primary" type="submit" form="sale-form">Save</button>
        <a class="btn btn-flat btn-dark" href="<?php echo base_url . '/admin?page=sales' ?>">Cancel</a>
    </div>
</div>
<table id="clone_list" class="d-none">
    <tr>
        <td class="py-1 px-2 text-center">

        </td>
        <td class="py-1 px-2 text-center item"></td>
        <td class="py-1 px-2 text-center available"></td>
        <td class="py-1 px-2 text-center text-center qty">
            <span class="visible"></span>
            <input type="hidden" name="item_id[]">
            <input type="hidden" name="unit[]">
            <input type="hidden" name="available[]">
            <input type="hidden" name="qty[]">
            <input type="hidden" name="rem[]">
            <input type="hidden" name="price[]">
            <input type="hidden" name="total[]">
        </td>
        <td class="py-1 px-2 text-center rem"></td>
        <td class="py-1 px-2 text-center unit"></td>
        <td class="py-1 px-2 text-center cost"></td>
        <td class="py-1 px-2 text-center total"></td>
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
        $('#add_to_list').click(function() {
            var item = $('#item_id').val()
            var available = $('#available').val()
            var qty = $('#qty').val() > 0 ? $('#qty').val() : 0;
            var rem = $('#rem').val()
            var unit = $('#unit').val()
            var price = $('#cost').val();
            var total = parseFloat(qty) * parseFloat(price)
            // console.log(supplier,item)
            var item_name = items[item].name || 'N/A';
            var item_description = items[item].description || 'N/A';
            var tr = $('#clone_list tr').clone()
            if (item == '' || qty == '' || unit == '' || price == '') {
                alert_toast('Form Item textfields are required.', 'warning');
                return false;
            }
            if ($('table#list tbody').find('tr[data-id="' + item + '"]').length > 0) {
                alert_toast('Item is already exists on the list.', 'error');
                return false;
            }
            tr.find('[name="item_id[]"]').val(item)
            tr.find('[name="available[]"]').val(available)
            tr.find('[name="unit[]"]').val(unit)
            tr.find('[name="qty[]"]').val(qty)
            tr.find('[name="rem[]"]').val(rem)
            tr.find('[name="price[]"]').val(price)
            tr.find('[name="total[]"]').val(total)
            tr.attr('data-id', item)
            tr.find('.item').html(item_name)
            tr.find('.available').html(available)
            tr.find('.qty .visible').text(qty)
            tr.find('.rem').text(rem)
            tr.find('.unit').text(unit)
            tr.find('.cost').text(parseFloat(price).toLocaleString('en-US'))
            tr.find('.total').text(parseFloat(total).toLocaleString('en-US'))
            $('table#list tbody').append(tr)
            calc()
            $('#item_id').val('').trigger('change')
            $('#available').val('')
            $('#rem').val('')
            $('#cost').val('')
            $('#qty').val('')
            $('#unit').val('')
            tr.find('.rem_row').click(function() {
                rem($(this))
            })

            $('[name="discount_perc"],[name="tax_perc"]').on('input', function() {
                calc()
            })
            $('#supplier_id').attr('readonly', 'readonly')
        })
        $('#sale-form').submit(function(e) {
            e.preventDefault();
            var _this = $(this)
            $('.err-msg').remove();
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=save_sale",
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
                        location.replace(_base_url_ + "admin/?page=sales/view_sale&id=" + resp.id);
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
            $('#supplier_id').trigger('change')
            $('#supplier_id').attr('readonly', 'readonly')
            $('table#list tbody tr .rem_row').click(function() {
                rem($(this))
            })
        }
    })

    function rem(_this) {
        _this.closest('tr').remove()
        calc()
        if ($('table#list tbody tr').length <= 0)
            $('#supplier_id').removeAttr('readonly')

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

<script>
    $(document).ready(function() {
        // Listen for changes in the item_id select element
        $('#item_id').change(function() {
            // Retrieve the selected item_id
            var selectedItemId = $(this).val();
            // Update the available select element with the corresponding available quantity
            $('#available option').each(function() {
                if ($(this).data('item-id') == selectedItemId) {
                    var availableQty = $(this).data('available-qty');
                    $(this).prop('disabled', false).prop('selected', true).val(availableQty);
                } else {
                    $(this).prop('disabled', true).prop('selected', false);
                }
            });
        });
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Get references to the `available` and `available_copy` elements
    var availableSelect = document.getElementById('available');
    var availableCopyInput = document.getElementById('available_copy');

    // Add an onchange event listener to the `available` select element
    availableSelect.onchange = function() {
        // Get the selected option's value
        var selectedOptionValue = availableSelect.value;

        // Set the `available_copy` input element's value to the selected option's value
        availableCopyInput.value = selectedOptionValue;
    };
</script>
<script>
    function cal_remaining_qty() {
        var selected_available_option = document.getElementById("available").options[document.getElementById("available").selectedIndex];
        var available_qty = parseFloat(selected_available_option.getAttribute("data-available-qty"));
        var req_qty = parseFloat(document.getElementById("qty").value);
        var total = available_qty - req_qty;
        document.getElementById("rem").value = total;
    }
</script>

<script>
    function updateMaterialCost() {
        var materialNameSelect = document.getElementById("item_id");
        var materialCostSelect = document.getElementById("material_cost");
        var priceInput = document.getElementById("cost");

        var selectedMaterialIndex = materialNameSelect.selectedIndex;
        var selectedMaterialValue = materialNameSelect.options[selectedMaterialIndex].value;

        // Fetch the corresponding material cost based on the selected material name
        var materialCost = <?php echo json_encode($cost_arr); ?>[selectedMaterialValue];

        // Update the Material Cost select box
        materialCostSelect.innerHTML = '';
        var option = document.createElement("option");
        option.value = selectedMaterialValue;
        option.text = materialCost;
        materialCostSelect.appendChild(option);

        // Update the Price input field
        priceInput.value = materialCost;
    }
</script>