<?php
// Establish database connection
$dsn = "mysql:host=localhost;dbname=u432726438_wineshop";
$username = "u432726438_wineshop";
$password = "Kstar@2022";
$conn = new PDO($dsn, $username, $password);

// Construct SQL query
$sql = "SELECT `name` FROM supplier_list";

// Execute query and fetch data
$stmt = $conn->query($sql);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Create HTML select element with options
// Step 1: Create HTML select element with options
$select = "<select name='myselect'>";
foreach ($data as $item) {
    $select .= "<option value='{$item['name']}'>{$item['name']}</option>";
}
$select .= "</select>";

?>
<form method="post">
  <?php echo $select;?>
  <button type="submit" name="submit" class="btn btn-primary">Search</button>
</form>
<?php

// Step 2: Connect to database
$host = 'localhost';
$user = 'u432726438_wineshop';
$pass = 'Kstar@2022';
$dbname = 'u432726438_wineshop';
$conn = mysqli_connect($host, $user, $pass, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
?>
<table class="table table-bordered table-stripped">
                    
                    <thead>
                        <tr>
                            <th>PO Code</th>
                            <th>Date Created</th>
                            <th>Total Amount</th>
                            
                        </tr>
                    </thead>
                    <tbody>


<?php
$selected_value = '';

// Step 3: Retrieve data based on the selected value
if (isset($_POST['submit'])) :
   
  $selected_value = $_POST['myselect'];
    
  $sql = "SELECT * FROM purchase_order_list WHERE supplier = '$selected_value'";
  $result = mysqli_query($conn, $sql);
  $total=0;
  // Step 4: Add selected row in HTML table
  while($row = mysqli_fetch_assoc($result)):
         
    ?>
    <tr>
                                <td class="text-center"><?php echo ($row['po_code']) ?></td>
                                <td><?php echo date("Y-m-d",strtotime($row['date_created'])) ?></td>
                                <td><?php echo ($row['amount'])?></td>
                                
                            </tr>
                            <?php
      // Accumulate total
      
      $total += $row['amount'];
  
    ?>
                           
                    </tbody>
                  
                    
                    <?php endwhile; ?>
                   <tfoot>
                        <tr>
                            <th class="text-right py-1 px-2" colspan="2"> Total</th>
                            <th class=" py-1 px-2 sub-total"><?php echo $total?></th>
                        </tr>
                   </tfoot>
                   
                        <?php endif; ?>
                </table>
   <?php
  


?>

<form action="" method="post">
    <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                      <label for="supplier">supplier Name:</label>
                      <input class="form-control" value="<?php echo ($selected_value)?>" id="supplier" name="supplier">
                    </div>
                </div>
               <div class="col-md-5">
                    <div class="form-group">
                      <label for="paid_amount">Paid Amount:</label>
                      <input class="form-control" type="text" id="paid_amount" name="paid_amount">
                      </div>
                </div>
                 <div class="col-md-5">
                    <div class="form-group">
                      <label for="balance_amount">Paid Amount:</label>
                      <input class="form-control" type="text" id="balance_amount" name="balance_amount">
                      </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                      <label for="date">Payment Date:</label>
                      <input class="form-control" type="date" id="date" name="date">
                    </div>
                </div>
                 <div class="col-md-2">
                    <div class="form-group pt-3" style="margin-top:-30px;margin-left:30px;">  
                      <input type="submit"  value="Submit" class="btn btn-primary">
                      </div>
                </div>
    </div>
</form>

<?php
if (isset($_POST['supplier']) && isset($_POST['paid_amount']) && isset($_POST['date'])) {
$supplier = $_POST['supplier'];
$paid_amt = $_POST['paid_amount'];
$payment_date = $_POST['date'];
$balance_amt = $_POST['balance_amount'];

// Insert data into database
$sql = "INSERT INTO `supplier_payment` (supplier, paid_amount, balance_amount, `date`) VALUES ( '$supplier','$paid_amt','$balance_amt',$payment_date')";
if (mysqli_query($conn, $sql)) {
 
} else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
}
?>
<table class="table table-bordered table-stripped">
                    
                    <thead>
                        <tr>
                            <th>SR No</th>
                            <th>Date Created</th>
                            <th>Paid Amount</th>
                            <th>Balance Amount</th>
                        </tr>
                    </thead>
                    <tbody>

<?php
if (isset($_POST['submit'])) :
   
  $selected_value = $_POST['myselect'];
    
  $sql = "SELECT * FROM supplier_payment WHERE supplier = '$selected_value'";
  $result = mysqli_query($conn, $sql);
  $total=0;
  // Step 4: Add selected row in HTML table
  while($row = mysqli_fetch_assoc($result)):
         
    ?>
    <tr>
                                <td class="text-center"><?php echo ($row['id']) ?></td>
                                <td><?php echo date("Y-m-d",strtotime($row['date'])) ?></td>
                                <td><?php echo ($row['paid_amount'])?></td>
                                 <td><?php echo ($row['balance_amount'])?></td>
                                
                            </tr>
                            <?php
      // Accumulate total
      
      $total += $row['amount'];
  
    ?>
                           
                    </tbody>
                  
                    
                    <?php endwhile; ?>
                   <tfoot>
                        <tr>
                            <th class="text-right py-1 px-2" colspan="2"></th>
                            <th class="text-right py-1 px-2"></th>
                            <th class=" py-1 px-2 sub-total"><?php echo $total?></th>
                        </tr>
                   </tfoot>
                   
                        <?php endif; ?>
                </table>
   <?php
  



// Step 5: Close database connection
mysqli_close($conn);
?>