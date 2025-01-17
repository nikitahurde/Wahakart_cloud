</style>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4 sidebar-no-expand">
  <!-- Brand Logo -->
  <a href="<?php echo base_url ?>admin" class="brand-link bg-primary text-sm">
    <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="Store Logo" class="brand-image img-circle elevation-3 bg-black" style="width: 1.8rem;height: 1.8rem;max-height: unset">
    <span class="brand-text font-weight-light"><?php echo $_settings->info('short_name') ?></span>
  </a>
  <!-- Sidebar -->
  <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-transition os-host-scrollbar-horizontal-hidden">
    <div class="os-resize-observer-host observed">
      <div class="os-resize-observer" style="left: 0px; right: auto;"></div>
    </div>
    <div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;">
      <div class="os-resize-observer"></div>
    </div>
    <div class="os-content-glue" style="margin: 0px -8px; width: 249px; height: 646px;"></div>
    <div class="os-padding">
      <div class="os-viewport os-viewport-native-scrollbars-invisible" style="overflow-y: scroll;">
        <div class="os-content" style="padding: 0px 8px; height: 100%; width: 100%;">
          <!-- Sidebar user panel (optional) -->
          <div class="clearfix"></div>
          <!-- Sidebar Menu -->
          <nav class="mt-4">
            <ul class="nav nav-pills nav-sidebar flex-column text-sm nav-compact nav-flat nav-child-indent nav-collapse-hide-child" data-widget="treeview" role="menu" data-accordion="false">
              <li class="nav-item dropdown">
                <a href="./" class="nav-link nav-home">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Dashboard
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=purchase_order" class="nav-link nav-purchase_order">
                  <i class="nav-icon fas fa-th-list"></i>
                  <p>
                    Material Purchase
                  </p>
                </a>
              </li>

              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=sales" class="nav-link nav-sales">
                  <i class="nav-icon fas fa-file-invoice-dollar"></i>
                  <p>
                    Material Inventory
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=purchase_order_prod" class="nav-link nav-purchase_order_prod">
                  <i class="nav-icon fas fa-th-list"></i>
                  <p>
                    Products Entry
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=purchase_order_man" class="nav-link nav-purchase_order_prod_man">
                  <i class="nav-icon fas fa-th-list"></i>
                  <p>
                    Manpower
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=purchase_order_pack" class="nav-link nav-purchase_order_pack">
                  <i class="nav-icon fas fa-th-list"></i>
                  <p>
                    Product Packaging
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=sales_prod" class="nav-link nav-sales_prod">
                  <i class="nav-icon fas fa-file-invoice-dollar"></i>
                  <p>
                    Products Sales
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=stocks" class="nav-link nav-stocks">
                  <i class="nav-icon fas fa-table"></i>
                  <p>
                    Material Stocks
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=stocks_prod" class="nav-link nav-stocks_prod">
                  <i class="nav-icon fas fa-table"></i>
                  <p>
                    Products Stocks
                  </p>
                </a>
              </li>
              <li hidden class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=receiving" class="nav-link nav-receiving">
                  <i class="nav-icon fas fa-boxes"></i>
                  <p>
                    Receiving
                  </p>
                </a>
              </li>
              <li hidden class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=receiving_man" class="nav-link nav-receiving_man">
                  <i class="nav-icon fas fa-boxes"></i>
                  <p>
                    Receiving_manpower
                  </p>
                </a>
              </li>
              <li hidden class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=receiving_prod" class="nav-link nav-receiving_prod">
                  <i class="nav-icon fas fa-boxes"></i>
                  <p>
                    Receiving_products
                  </p>
                </a>
              </li>
              <!-- <li class="nav-item">
                      <a href="<?php echo base_url ?>admin/?page=back_order" class="nav-link nav-back_order">
                        <i class="nav-icon fas fa-exchange-alt"></i>
                        <p>
                          Back Order
                        </p>
                      </a>
                    </li> -->
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=return" class="nav-link nav-return">
                  <i class="nav-icon fas fa-undo"></i>
                  <p>
                    Purchase Return List
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=purchase_order/po_expiry" class="nav-link nav-purchase_order_po_expiry">
                  <i class="nav-icon fas fa-th-list"></i>
                  <p>
                    Stock Expiry
                  </p>
                </a>
              </li>



              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=expense" class="nav-link nav-expense">
                  <i class="nav-icon  fas fa-wallet"></i>
                  <p>
                    Expense List
                  </p>
                </a>
              </li>
              <li class="nav-header">REPORTS</li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=reports/purchase" class="nav-link nav-reports_purchase">
                  <i class="nav-icon  fas fa-file"></i>
                  <p>
                    Purchase Reports
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=reports/sale" class="nav-link nav-reports_sale">
                  <i class="nav-icon  fas fa-file"></i>
                  <p>
                    Sales Reports
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=reports/supplier_ladger" class="nav-link nav-supplier_ladger">
                  <i class="nav-icon  fas fa-file"></i>
                  <p>
                    Supplier Ladger
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=reports/expense" class="nav-link nav-reports_expense">
                  <i class="nav-icon  fas fa-file"></i>
                  <p>
                    Expense Reports
                  </p>
                </a>
              </li>
              <?php if ($_settings->userdata('type') == 1) : ?>
                <li class="nav-header">MAINTENANCE</li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/supplier" class="nav-link nav-maintenance_supplier">
                    <i class="nav-icon fas fa-truck-loading"></i>
                    <p>
                      Supplier List
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/employee" class="nav-link nav-maintenance_employee">
                    <i class="nav-icon fas fa-truck-loading"></i>
                    <p>
                      Employee List
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/item" class="nav-link nav-maintenance_item">
                    <i class="nav-icon fas fa-boxes"></i>
                    <p>
                      Material List
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/products" class="nav-link nav-maintenance_product">
                    <i class="nav-icon fas fa-boxes"></i>
                    <p>
                      Product List
                    </p>
                  </a>
                </li>
                <li hidden class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/categories" class="nav-link nav-maintenance_categories">
                    <i class="nav-icon fa fa-list-alt" aria-hidden="true"></i>
                    <p>
                      Categories
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/categories_man" class="nav-link nav-maintenance_categories_man">
                    <i class="nav-icon fa fa-list-alt" aria-hidden="true"></i>
                    <p>
                      Employee type
                    </p>
                  </a>
                </li>
                <li hidden class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=maintenance/brands" class="nav-link nav-maintenance_brands">
                    <i class="nav-icon fas fa-tag"></i>
                    <p>
                      Brands
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=user/list" class="nav-link nav-user_list">
                    <i class="nav-icon fas fa-users"></i>
                    <p>
                      User List
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=system_info" class="nav-link nav-system_info">
                    <i class="nav-icon fas fa-cogs"></i>
                    <p>
                      Settings
                    </p>
                  </a>
                </li>
              <?php endif; ?>

            </ul>
          </nav>
          <!-- /.sidebar-menu -->
        </div>
      </div>
    </div>
    <div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
      <div class="os-scrollbar-track">
        <div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);"></div>
      </div>
    </div>
    <div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden">
      <div class="os-scrollbar-track">
        <div class="os-scrollbar-handle" style="height: 55.017%; transform: translate(0px, 0px);"></div>
      </div>
    </div>
    <div class="os-scrollbar-corner"></div>
  </div>
  <!-- /.sidebar -->
</aside>
<script>
  var page;
  $(document).ready(function() {
    page = '<?php echo isset($_GET['page']) ? $_GET['page'] : 'home' ?>';
    page = page.replace(/\//gi, '_');

    if ($('.nav-link.nav-' + page).length > 0) {
      $('.nav-link.nav-' + page).addClass('active')
      if ($('.nav-link.nav-' + page).hasClass('tree-item') == true) {
        $('.nav-link.nav-' + page).closest('.nav-treeview').siblings('a').addClass('active')
        $('.nav-link.nav-' + page).closest('.nav-treeview').parent().addClass('menu-open')
      }
      if ($('.nav-link.nav-' + page).hasClass('nav-is-tree') == true) {
        $('.nav-link.nav-' + page).parent().addClass('menu-open')
      }

    }

    $('#receive-nav').click(function() {
      $('#uni_modal').on('shown.bs.modal', function() {
        $('#find-transaction [name="tracking_code"]').focus();
      })
      uni_modal("Enter Tracking Number", "transaction/find_transaction.php");
    })
  })
</script>