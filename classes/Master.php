<?php
require_once('../config.php');
class Master extends DBConnection
{
	private $settings;
	public function __construct()
	{
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct()
	{
		parent::__destruct();
	}
	function capture_err()
	{
		if (!$this->conn->error)
			return false;
		else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
			return json_encode($resp);
			exit;
		}
	}
	function save_supplier()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `supplier_list` where `name` = '{$name}' " . (!empty($id) ? " and id != {$id} " : "") . " ")->num_rows;
		if ($this->capture_err())
			return $this->capture_err();
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "supplier Name already exist.";
			return json_encode($resp);
			exit;
		}
		if (empty($id)) {
			$sql = "INSERT INTO `supplier_list` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `supplier_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id)) {
				$res['msg'] = "New Supplier successfully saved.";
				$id = $this->conn->insert_id;
			} else {
				$res['msg'] = "Supplier successfully updated.";
			}
			$this->settings->set_flashdata('success', $res['msg']);
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_employee()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `employee_list` where `name` = '{$name}' " . (!empty($id) ? " and id != {$id} " : "") . " ")->num_rows;
		if ($this->capture_err())
			return $this->capture_err();
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "supplier Name already exist.";
			return json_encode($resp);
			exit;
		}
		if (empty($id)) {
			$sql = "INSERT INTO `employee_list` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `employee_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id)) {
				$res['msg'] = "New Supplier successfully saved.";
				$id = $this->conn->insert_id;
			} else {
				$res['msg'] = "Supplier successfully updated.";
			}
			$this->settings->set_flashdata('success', $res['msg']);
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_expense()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `expense` where `item` = '{$item}' " . (!empty($id) ? " and id != {$id} " : "") . " ")->num_rows;
		if ($this->capture_err())
			return $this->capture_err();
		// if ($check > 0) {
		// 	$resp['status'] = 'failed';
		// 	$resp['msg'] = "expense Name already exist.";
		// 	return json_encode($resp);
		// 	exit;
		// }
		if (empty($id)) {
			$sql = "INSERT INTO `expense` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `expense` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id)) {
				$res['msg'] = "New Expense successfully saved.";
				$id = $this->conn->insert_id;
			} else {
				$res['msg'] = "Expense successfully updated.";
			}
			$this->settings->set_flashdata('success', $res['msg']);
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_categories()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}

		if (empty($id)) {
			$sql = "INSERT INTO `categories` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `categories` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id)) {
				$res['msg'] = "New categories successfully saved.";
				$id = $this->conn->insert_id;
			} else {
				$res['msg'] = "categories successfully updated.";
			}
			$this->settings->set_flashdata('success', $res['msg']);
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_categories_man()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}

		if (empty($id)) {
			$sql = "INSERT INTO `categories_man` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `categories_man` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id)) {
				$res['msg'] = "New Employee type successfully saved.";
				$id = $this->conn->insert_id;
			} else {
				$res['msg'] = "Employee type successfully updated.";
			}
			$this->settings->set_flashdata('success', $res['msg']);
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_brands()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}

		if (empty($id)) {
			$sql = "INSERT INTO `brands` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `brands` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id)) {
				$res['msg'] = "New brands successfully saved.";
				$id = $this->conn->insert_id;
			} else {
				$res['msg'] = "brands successfully updated.";
			}
			$this->settings->set_flashdata('success', $res['msg']);
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function delete_supplier()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `supplier_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Supplier successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_employee()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `employee_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "employee successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_expense()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `expense` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Expense successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_brands()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `brands` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "brands successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_item()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `item_list` where `name` = '{$name}' and `categories_id` = '{$categories_id}' " . (!empty($id) ? " and id != {$id} " : "") . " ")->num_rows;
		if ($this->capture_err())
			return $this->capture_err();
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Item already exists under selected supplier.";
			return json_encode($resp);
			exit;
		}
		if (empty($id)) {
			$sql = "INSERT INTO `item_list` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `item_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$this->settings->set_flashdata('success', "New Item successfully saved.");
			else
				$this->settings->set_flashdata('success', "Item successfully updated.");
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_products()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `products_list` where `name` = '{$name}' and `categories_id` = '{$categories_id}' " . (!empty($id) ? " and id != {$id} " : "") . " ")->num_rows;
		if ($this->capture_err())
			return $this->capture_err();
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Item already exists under selected supplier.";
			return json_encode($resp);
			exit;
		}
		if (empty($id)) {
			$sql = "INSERT INTO `products_list` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `products_list` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$this->settings->set_flashdata('success', "New products successfully saved.");
			else
				$this->settings->set_flashdata('success', "products successfully updated.");
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}
	function save_item_man()
	{
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id'))) {
				$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `item_list_man` where `name` = '{$name}' and `categories_id` = '{$categories_id}' " . (!empty($id) ? " and id != {$id} " : "") . " ")->num_rows;
		if ($this->capture_err())
			return $this->capture_err();
		if ($check > 0) {
			$resp['status'] = 'failed';
			$resp['msg'] = "Item already exists under selected supplier.";
			return json_encode($resp);
			exit;
		}
		if (empty($id)) {
			$sql = "INSERT INTO `item_list_man` set {$data} ";
			$save = $this->conn->query($sql);
		} else {
			$sql = "UPDATE `item_list_man` set {$data} where id = '{$id}' ";
			$save = $this->conn->query($sql);
		}
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$this->settings->set_flashdata('success', "New Employee successfully saved.");
			else
				$this->settings->set_flashdata('success', "Employee successfully updated.");
		} else {
			$resp['status'] = 'failed';
			$resp['err'] = $this->conn->error . "[{$sql}]";
		}
		return json_encode($resp);
	}

	function delete_item()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `item_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Item  successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_product()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `products_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Product  successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_item_man()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `item_list_man` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Employee  successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_po()
	{
		if (empty($_POST['id'])) {
			$prefix = "PO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `purchase_order_list` where po_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['po_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `purchase_order_list` set {$data}";
		} else {
			$sql = "UPDATE `purchase_order_list` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$po_id = $this->conn->insert_id;
			else
				$po_id = $id;
			$resp['id'] = $po_id;
			$data = "";
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$data .= "('{$po_id}','{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}')";
			}
			if (!empty($data)) {
				$this->conn->query("DELETE FROM `po_items` where po_id = '{$po_id}'");
				$save = $this->conn->query("INSERT INTO `po_items` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}");
				if (!$save) {
					$resp['status'] = 'failed';
					if (empty($id)) {
						$this->conn->query("DELETE FROM `purchase_order_list` where id '{$po_id}'");
					}
					$resp['msg'] = 'PO has failed to save. Error: ' . $this->conn->error;
					$resp['sql'] = "INSERT INTO `po_items` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}";
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Purchase Order was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " Purchase Order's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function save_po_pack()
	{
		if (empty($_POST['id'])) {
			$prefix = "PO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `purchase_order_list_pack` where po_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['po_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `purchase_order_list_pack` set {$data}";
		} else {
			$sql = "UPDATE `purchase_order_list_pack` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$po_id = $this->conn->insert_id;
			else
				$po_id = $id;
			$resp['id'] = $po_id;
			$data = "";
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$data .= "('{$po_id}','{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}')";
			}
			if (!empty($data)) {
				$this->conn->query("DELETE FROM `po_items_pack` where po_id = '{$po_id}'");
				$save = $this->conn->query("INSERT INTO `po_items_pack` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}");
				if (!$save) {
					$resp['status'] = 'failed';
					if (empty($id)) {
						$this->conn->query("DELETE FROM `purchase_order_list_pack` where id '{$po_id}'");
					}
					$resp['msg'] = 'PO has failed to save. Error: ' . $this->conn->error;
					$resp['sql'] = "INSERT INTO `po_items_pack` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}";
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New packing Record was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " packing Record Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function save_po_man()
	{
		if (empty($_POST['id'])) {
			$prefix = "PO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `purchase_order_list_man` where po_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['po_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `purchase_order_list_man` set {$data}";
		} else {
			$sql = "UPDATE `purchase_order_list_man` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$po_id = $this->conn->insert_id;
			else
				$po_id = $id;
			$resp['id'] = $po_id;
			$data = "";
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$data .= "('{$po_id}','{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}','{$time[$k]}','{$aaaa[$k]}')";
			}
			if (!empty($data)) {
				$this->conn->query("DELETE FROM `po_items_man` where po_id = '{$po_id}'");
				$save = $this->conn->query("INSERT INTO `po_items_man` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total` ,`time`,`aaaa`) VALUES {$data}");
				if (!$save) {
					$resp['status'] = 'failed';
					if (empty($id)) {
						$this->conn->query("DELETE FROM `purchase_order_list_man` where id '{$po_id}'");
					}
					$resp['msg'] = 'PO has failed to save. Error: ' . $this->conn->error;
					$resp['sql'] = "INSERT INTO `po_items_man` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`,`time`,`aaaa`) VALUES {$data}";
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Purchase Order was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " Purchase Order's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function save_pro()
	{
		if (empty($_POST['id'])) {
			$prefix = "PO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `purchase_order_list_prod` where po_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['po_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `purchase_order_list_prod` set {$data}";
		} else {
			$sql = "UPDATE `purchase_order_list_prod` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$po_id = $this->conn->insert_id;
			else
				$po_id = $id;
			$resp['id'] = $po_id;
			$data = "";
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$data .= "('{$po_id}','{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}')";
			}
			if (!empty($data)) {
				$this->conn->query("DELETE FROM `po_items_prod` where po_id = '{$po_id}'");
				$save = $this->conn->query("INSERT INTO `po_items_prod` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}");
				if (!$save) {
					$resp['status'] = 'failed';
					if (empty($id)) {
						$this->conn->query("DELETE FROM `purchase_order_list_prod` where id '{$po_id}'");
					}
					$resp['msg'] = 'PO has failed to save. Error: ' . $this->conn->error;
					$resp['sql'] = "INSERT INTO `po_items_prod` (`po_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}";
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Purchase Order was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " Purchase Order's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function delete_pro()
	{
		extract($_POST);
		$bo = $this->conn->query("SELECT * FROM back_order_list_prod where po_id = '{$id}'");
		$del = $this->conn->query("DELETE FROM `purchase_order_list_prod` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "product order's Details Successfully deleted.");
			if ($bo->num_rows > 0) {
				$bo_res = $bo->fetch_all(MYSQLI_ASSOC);
				$r_ids = array_column($bo_res, 'receiving_id');
				$bo_ids = array_column($bo_res, 'id');
			}
			$qry = $this->conn->query("SELECT * FROM receiving_list_prod where (form_id='{$id}' and from_order = '1') " . (isset($r_ids) && count($r_ids) > 0 ? "OR id in (" . (implode(',', $r_ids)) . ") OR (form_id in (" . (implode(',', $bo_ids)) . ") and from_order = '2') " : "") . " ");
			while ($row = $qry->fetch_assoc()) {
				$this->conn->query("DELETE FROM `stock_list_prod` where id in ({$row['stock_ids']}) ");
				// echo "DELETE FROM `stock_list` where id in ({$row['stock_ids']}) </br>";
			}
			$this->conn->query("DELETE FROM receiving_list_prod where (form_id='{$id}' and from_order = '1') " . (isset($r_ids) && count($r_ids) > 0 ? "OR id in (" . (implode(',', $r_ids)) . ") OR (form_id in (" . (implode(',', $bo_ids)) . ") and from_order = '2') " : "") . " ");
			// echo "DELETE FROM receiving_list where (form_id='{$id}' and from_order = '1') ".(isset($r_ids) && count($r_ids) > 0 ? "OR id in (".(implode(',',$r_ids)).") OR (form_id in (".(implode(',',$bo_ids)).") and from_order = '2') " : "" )."  </br>";
			// exit;
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_po()
	{
		extract($_POST);
		$bo = $this->conn->query("SELECT * FROM back_order_list where po_id = '{$id}'");
		$del = $this->conn->query("DELETE FROM `purchase_order_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "po's Details Successfully deleted.");
			if ($bo->num_rows > 0) {
				$bo_res = $bo->fetch_all(MYSQLI_ASSOC);
				$r_ids = array_column($bo_res, 'receiving_id');
				$bo_ids = array_column($bo_res, 'id');
			}
			$qry = $this->conn->query("SELECT * FROM receiving_list where (form_id='{$id}' and from_order = '1') " . (isset($r_ids) && count($r_ids) > 0 ? "OR id in (" . (implode(',', $r_ids)) . ") OR (form_id in (" . (implode(',', $bo_ids)) . ") and from_order = '2') " : "") . " ");
			while ($row = $qry->fetch_assoc()) {
				$this->conn->query("DELETE FROM `stock_list` where id in ({$row['stock_ids']}) ");
				// echo "DELETE FROM `stock_list` where id in ({$row['stock_ids']}) </br>";
			}
			$this->conn->query("DELETE FROM receiving_list where (form_id='{$id}' and from_order = '1') " . (isset($r_ids) && count($r_ids) > 0 ? "OR id in (" . (implode(',', $r_ids)) . ") OR (form_id in (" . (implode(',', $bo_ids)) . ") and from_order = '2') " : "") . " ");
			// echo "DELETE FROM receiving_list where (form_id='{$id}' and from_order = '1') ".(isset($r_ids) && count($r_ids) > 0 ? "OR id in (".(implode(',',$r_ids)).") OR (form_id in (".(implode(',',$bo_ids)).") and from_order = '2') " : "" )."  </br>";
			// exit;
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_categories()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `categories` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "categories successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_categories_man()
	{
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `categories_man` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Employee type successfully deleted.");
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_receiving()
	{
		if (empty($_POST['id'])) {
			$prefix = "BO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `back_order_list` where bo_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['bo_code'] = $prefix . "-" . $code;
		} else {
			$get = $this->conn->query("SELECT * FROM back_order_list where receiving_id = '{$_POST['id']}' ");
			if ($get->num_rows > 0) {
				$res = $get->fetch_array();
				$bo_id = $res['id'];
				$_POST['bo_code'] = $res['bo_code'];
			} else {

				$prefix = "BO";
				$code = sprintf("%'.04d", 1);
				while (true) {
					$check_code = $this->conn->query("SELECT * FROM `back_order_list` where bo_code ='" . $prefix . '-' . $code . "' ")->num_rows;
					if ($check_code > 0) {
						$code = sprintf("%'.04d", $code + 1);
					} else {
						break;
					}
				}
				$_POST['bo_code'] = $prefix . "-" . $code;
			}
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id', 'bo_code', 'categories_id', 'po_id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `receiving_list` set {$data}";
		} else {
			$sql = "UPDATE `receiving_list` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$r_id = $this->conn->insert_id;
			else
				$r_id = $id;
			$resp['id'] = $r_id;
			if (!empty($id)) {
				$stock_ids = $this->conn->query("SELECT stock_ids FROM `receiving_list` where id = '{$id}'")->fetch_array()['stock_ids'];
				$this->conn->query("DELETE FROM `stock_list` where id in ({$stock_ids})");
			}
			$stock_ids = array();
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$sql = "INSERT INTO stock_list (`item_id`,`quantity`,`price`,`unit`,`total`,`type`) VALUES ('{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}','1')";
				$this->conn->query($sql);
				$stock_ids[] = $this->conn->insert_id;
				if ($qty[$k] < $oqty[$k]) {
					$bo_ids[] = $k;
				}
			}
			if (count($stock_ids) > 0) {
				$stock_ids = implode(',', $stock_ids);
				$this->conn->query("UPDATE `receiving_list` set stock_ids = '{$stock_ids}' where id = '{$r_id}'");
			}
			if (isset($bo_ids)) {
				$this->conn->query("UPDATE `purchase_order_list` set status = 1 where id = '{$po_id}'");
				if ($from_order == 2) {
					$this->conn->query("UPDATE `back_order_list` set status = 1 where id = '{$form_id}'");
				}
				if (!isset($bo_id)) {
					$sql = "INSERT INTO `back_order_list` set 
							bo_code = '{$bo_code}',	
							receiving_id = '{$r_id}',	
							po_id = '{$po_id}',	
							categories_id = '{$categories_id}',	
							discount_perc = '{$discount_perc}',	
							tax_perc = '{$tax_perc}'
						";
				} else {
					$sql = "UPDATE `back_order_list` set 
							receiving_id = '{$r_id}',	
							po_id = '{$form_id}',	
							categories_id = '{$categories_id}',	
							discount_perc = '{$discount_perc}',	
							tax_perc = '{$tax_perc}',
							where bo_id = '{$bo_id}'
						";
				}
				$bo_save = $this->conn->query($sql);
				if (!isset($bo_id))
					$bo_id = $this->conn->insert_id;
				$stotal = 0;
				$data = "";
				foreach ($item_id as $k => $v) {
					if (!in_array($k, $bo_ids))
						continue;
					$total = ($oqty[$k] - $qty[$k]) * $price[$k];
					$stotal += $total;
					if (!empty($data)) $data .= ", ";
					$data .= " ('{$bo_id}','{$v}','" . ($oqty[$k] - $qty[$k]) . "','{$price[$k]}','{$unit[$k]}','{$total}') ";
				}
				$this->conn->query("DELETE FROM `bo_items` where bo_id='{$bo_id}'");
				$save_bo_items = $this->conn->query("INSERT INTO `bo_items` (`bo_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}");
				if ($save_bo_items) {
					$discount = $stotal * ($discount_perc / 100);
					$stotal -= $discount;
					$tax = $stotal * ($tax_perc / 100);
					$stotal += $tax;
					$amount = $stotal;
					$this->conn->query("UPDATE back_order_list set amount = '{$amount}', discount='{$discount}', tax = '{$tax}' where id = '{$bo_id}'");
				}
			} else {
				$this->conn->query("UPDATE `purchase_order_list` set status = 2 where id = '{$po_id}'");
				if ($from_order == 2) {
					$this->conn->query("UPDATE `back_order_list` set status = 2 where id = '{$form_id}'");
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Stock was Successfully received.");
			} else {
				$this->settings->set_flashdata('success', " Received Stock's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function save_receiving_prod()
	{
		if (empty($_POST['id'])) {
			$prefix = "BO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `back_order_list_prod` where bo_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['bo_code'] = $prefix . "-" . $code;
		} else {
			$get = $this->conn->query("SELECT * FROM back_order_list_prod where receiving_id = '{$_POST['id']}' ");
			if ($get->num_rows > 0) {
				$res = $get->fetch_array();
				$bo_id = $res['id'];
				$_POST['bo_code'] = $res['bo_code'];
			} else {

				$prefix = "BO";
				$code = sprintf("%'.04d", 1);
				while (true) {
					$check_code = $this->conn->query("SELECT * FROM `back_order_list_prod` where bo_code ='" . $prefix . '-' . $code . "' ")->num_rows;
					if ($check_code > 0) {
						$code = sprintf("%'.04d", $code + 1);
					} else {
						break;
					}
				}
				$_POST['bo_code'] = $prefix . "-" . $code;
			}
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id', 'bo_code', 'categories_id', 'po_id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `receiving_list_prod` set {$data}";
		} else {
			$sql = "UPDATE `receiving_list_prod` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$r_id = $this->conn->insert_id;
			else
				$r_id = $id;
			$resp['id'] = $r_id;
			if (!empty($id)) {
				$stock_ids = $this->conn->query("SELECT stock_ids FROM `receiving_list_prod` where id = '{$id}'")->fetch_array()['stock_ids'];
				$this->conn->query("DELETE FROM `stock_list_prod` where id in ({$stock_ids})");
			}
			$stock_ids = array();
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$sql = "INSERT INTO stock_list_prod (`item_id`,`quantity`,`price`,`unit`,`total`,`type`) VALUES ('{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}','1')";
				$this->conn->query($sql);
				$stock_ids[] = $this->conn->insert_id;
				if ($qty[$k] < $oqty[$k]) {
					$bo_ids[] = $k;
				}
			}
			if (count($stock_ids) > 0) {
				$stock_ids = implode(',', $stock_ids);
				$this->conn->query("UPDATE `receiving_list_prod` set stock_ids = '{$stock_ids}' where id = '{$r_id}'");
			}
			if (isset($bo_ids)) {
				$this->conn->query("UPDATE `purchase_order_list_prod` set status = 1 where id = '{$po_id}'");
				if ($from_order == 2) {
					$this->conn->query("UPDATE `back_order_list_prod` set status = 1 where id = '{$form_id}'");
				}
				if (!isset($bo_id)) {
					$sql = "INSERT INTO `back_order_list_prod` set 
							bo_code = '{$bo_code}',	
							receiving_id = '{$r_id}',	
							po_id = '{$po_id}',	
							categories_id = '{$categories_id}',	
							discount_perc = '{$discount_perc}',	
							tax_perc = '{$tax_perc}'
						";
				} else {
					$sql = "UPDATE `back_order_list_prod` set 
							receiving_id = '{$r_id}',	
							po_id = '{$form_id}',	
							categories_id = '{$categories_id}',	
							discount_perc = '{$discount_perc}',	
							tax_perc = '{$tax_perc}',
							where bo_id = '{$bo_id}'
						";
				}
				$bo_save = $this->conn->query($sql);
				if (!isset($bo_id))
					$bo_id = $this->conn->insert_id;
				$stotal = 0;
				$data = "";
				foreach ($item_id as $k => $v) {
					if (!in_array($k, $bo_ids))
						continue;
					$total = ($oqty[$k] - $qty[$k]) * $price[$k];
					$stotal += $total;
					if (!empty($data)) $data .= ", ";
					$data .= " ('{$bo_id}','{$v}','" . ($oqty[$k] - $qty[$k]) . "','{$price[$k]}','{$unit[$k]}','{$total}') ";
				}
				$this->conn->query("DELETE FROM `bo_items_prod` where bo_id='{$bo_id}'");
				$save_bo_items = $this->conn->query("INSERT INTO `bo_items_prod` (`bo_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}");
				if ($save_bo_items) {
					$discount = $stotal * ($discount_perc / 100);
					$stotal -= $discount;
					$tax = $stotal * ($tax_perc / 100);
					$stotal += $tax;
					$amount = $stotal;
					$this->conn->query("UPDATE back_order_list_prod set amount = '{$amount}', discount='{$discount}', tax = '{$tax}' where id = '{$bo_id}'");
				}
			} else {
				$this->conn->query("UPDATE `purchase_order_list_prod` set status = 2 where id = '{$po_id}'");
				if ($from_order == 2) {
					$this->conn->query("UPDATE `back_order_list_prod` set status = 2 where id = '{$form_id}'");
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Stock was Successfully received.");
			} else {
				$this->settings->set_flashdata('success', " Received Stock's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function save_receiving_man()
	{
		if (empty($_POST['id'])) {
			$prefix = "BO";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `back_order_list_man` where bo_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['bo_code'] = $prefix . "-" . $code;
		} else {
			$get = $this->conn->query("SELECT * FROM back_order_list_man where receiving_id = '{$_POST['id']}' ");
			if ($get->num_rows > 0) {
				$res = $get->fetch_array();
				$bo_id = $res['id'];
				$_POST['bo_code'] = $res['bo_code'];
			} else {

				$prefix = "BO";
				$code = sprintf("%'.04d", 1);
				while (true) {
					$check_code = $this->conn->query("SELECT * FROM `back_order_list_man` where bo_code ='" . $prefix . '-' . $code . "' ")->num_rows;
					if ($check_code > 0) {
						$code = sprintf("%'.04d", $code + 1);
					} else {
						break;
					}
				}
				$_POST['bo_code'] = $prefix . "-" . $code;
			}
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id', 'bo_code', 'categories_id', 'po_id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `receiving_list_man` set {$data}";
		} else {
			$sql = "UPDATE `receiving_list_man` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$r_id = $this->conn->insert_id;
			else
				$r_id = $id;
			$resp['id'] = $r_id;
			if (!empty($id)) {
				$stock_ids = $this->conn->query("SELECT stock_ids FROM `receiving_list_man` where id = '{$id}'")->fetch_array()['stock_ids'];
				$this->conn->query("DELETE FROM `stock_list_man` where id in ({$stock_ids})");
			}
			$stock_ids = array();
			foreach ($item_id as $k => $v) {
				if (!empty($data)) $data .= ", ";
				$sql = "INSERT INTO stock_list_man (`item_id`,`quantity`,`price`,`unit`,`total`,`type`) VALUES ('{$v}','{$qty[$k]}','{$price[$k]}','{$unit[$k]}','{$total[$k]}','1')";
				$this->conn->query($sql);
				$stock_ids[] = $this->conn->insert_id;
				if ($qty[$k] < $oqty[$k]) {
					$bo_ids[] = $k;
				}
			}
			if (count($stock_ids) > 0) {
				$stock_ids = implode(',', $stock_ids);
				$this->conn->query("UPDATE `receiving_list_man` set stock_ids = '{$stock_ids}' where id = '{$r_id}'");
			}
			if (isset($bo_ids)) {
				$this->conn->query("UPDATE `purchase_order_list_man` set status = 1 where id = '{$po_id}'");
				if ($from_order == 2) {
					$this->conn->query("UPDATE `back_order_list_man` set status = 1 where id = '{$form_id}'");
				}
				if (!isset($bo_id)) {
					$sql = "INSERT INTO `back_order_list_man` set 
							bo_code = '{$bo_code}',	
							receiving_id = '{$r_id}',	
							po_id = '{$po_id}',	
							categories_id = '{$categories_id}',	
							discount_perc = '{$discount_perc}',	
							tax_perc = '{$tax_perc}'
						";
				} else {
					$sql = "UPDATE `back_order_list_man` set 
							receiving_id = '{$r_id}',	
							po_id = '{$form_id}',	
							categories_id = '{$categories_id}',	
							discount_perc = '{$discount_perc}',	
							tax_perc = '{$tax_perc}',
							where bo_id = '{$bo_id}'
						";
				}
				$bo_save = $this->conn->query($sql);
				if (!isset($bo_id))
					$bo_id = $this->conn->insert_id;
				$stotal = 0;
				$data = "";
				foreach ($item_id as $k => $v) {
					if (!in_array($k, $bo_ids))
						continue;
					$total = ($oqty[$k] - $qty[$k]) * $price[$k];
					$stotal += $total;
					if (!empty($data)) $data .= ", ";
					$data .= " ('{$bo_id}','{$v}','" . ($oqty[$k] - $qty[$k]) . "','{$price[$k]}','{$unit[$k]}','{$total}') ";
				}
				$this->conn->query("DELETE FROM `bo_items_man` where bo_id='{$bo_id}'");
				$save_bo_items = $this->conn->query("INSERT INTO `bo_items_man` (`bo_id`,`item_id`,`quantity`,`price`,`unit`,`total`) VALUES {$data}");
				if ($save_bo_items) {
					$discount = $stotal * ($discount_perc / 100);
					$stotal -= $discount;
					$tax = $stotal * ($tax_perc / 100);
					$stotal += $tax;
					$amount = $stotal;
					$this->conn->query("UPDATE back_order_list_man set amount = '{$amount}', discount='{$discount}', tax = '{$tax}' where id = '{$bo_id}'");
				}
			} else {
				$this->conn->query("UPDATE `purchase_order_list_man` set status = 2 where id = '{$po_id}'");
				if ($from_order == 2) {
					$this->conn->query("UPDATE `back_order_list_man` set status = 2 where id = '{$form_id}'");
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Stock was Successfully received.");
			} else {
				$this->settings->set_flashdata('success', " Received Stock's Details Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function delete_receiving()
	{
		extract($_POST);
		$qry = $this->conn->query("SELECT * from  receiving_list where id='{$id}' ");
		if ($qry->num_rows > 0) {
			$res = $qry->fetch_array();
			$ids = $res['stock_ids'];
		}
		if (isset($ids) && !empty($ids))
			$this->conn->query("DELETE FROM stock_list where id in ($ids) ");
		$del = $this->conn->query("DELETE FROM receiving_list where id='{$id}' ");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Received Order's Details Successfully deleted.");

			if (isset($res)) {
				if ($res['from_order'] == 1) {
					$this->conn->query("UPDATE purchase_order_list set status = 0 where id = '{$res['form_id']}' ");
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_receiving_man()
	{
		extract($_POST);
		$qry = $this->conn->query("SELECT * from  receiving_list_man where id='{$id}' ");
		if ($qry->num_rows > 0) {
			$res = $qry->fetch_array();
			$ids = $res['stock_ids'];
		}
		if (isset($ids) && !empty($ids))
			$this->conn->query("DELETE FROM stock_list_man where id in ($ids) ");
		$del = $this->conn->query("DELETE FROM receiving_list_man where id='{$id}' ");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Received Order's Details Successfully deleted.");

			if (isset($res)) {
				if ($res['from_order'] == 1) {
					$this->conn->query("UPDATE purchase_order_list_man set status = 0 where id = '{$res['form_id']}' ");
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_bo()
	{
		extract($_POST);
		$bo = $this->conn->query("SELECT * FROM `back_order_list` where id = '{$id}'");
		if ($bo->num_rows > 0)
			$bo_res = $bo->fetch_array();
		$del = $this->conn->query("DELETE FROM `back_order_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "po's Details Successfully deleted.");
			$qry = $this->conn->query("SELECT `stock_ids` from  receiving_list where form_id='{$id}' and from_order = '2' ");
			if ($qry->num_rows > 0) {
				$res = $qry->fetch_array();
				$ids = $res['stock_ids'];
				$this->conn->query("DELETE FROM stock_list where id in ($ids) ");

				$this->conn->query("DELETE FROM receiving_list where form_id='{$id}' and from_order = '2' ");
			}
			if (isset($bo_res)) {
				$check = $this->conn->query("SELECT * FROM `receiving_list` where from_order = 1 and form_id = '{$bo_res['po_id']}' ");
				if ($check->num_rows > 0) {
					$this->conn->query("UPDATE `purchase_order_list` set status = 1 where id = '{$bo_res['po_id']}' ");
				} else {
					$this->conn->query("UPDATE `purchase_order_list` set status = 0 where id = '{$bo_res['po_id']}' ");
				}
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_return()
	{
		if (empty($_POST['id'])) {
			$prefix = "R";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `return_list` where return_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['return_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `return_list` set {$data}";
		} else {
			$sql = "UPDATE `return_list` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$return_id = $this->conn->insert_id;
			else
				$return_id = $id;
			$resp['id'] = $return_id;
			$data = "";
			$sids = array();
			$get = $this->conn->query("SELECT * FROM `return_list` where id = '{$return_id}'");
			if ($get->num_rows > 0) {
				$res = $get->fetch_array();
				if (!empty($res['stock_ids'])) {
					$this->conn->query("DELETE FROM `stock_list` where id in ({$res['stock_ids']}) ");
				}
			}
			foreach ($item_id as $k => $v) {
				$sql = "INSERT INTO `stock_list` set item_id='{$v}', `quantity` = '{$qty[$k]}', `unit` = '{$unit[$k]}', `price` = '{$price[$k]}', `total` = '{$total[$k]}', `type` = 2 ";
				$save = $this->conn->query($sql);
				if ($save) {
					$sids[] = $this->conn->insert_id;
				}
			}
			$sids = implode(',', $sids);
			$this->conn->query("UPDATE `return_list` set stock_ids = '{$sids}' where id = '{$return_id}'");
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Returned Item Record was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " Returned Item Record's Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function delete_return()
	{
		extract($_POST);
		$get = $this->conn->query("SELECT * FROM return_list where id = '{$id}'");
		if ($get->num_rows > 0) {
			$res = $get->fetch_array();
		}
		$del = $this->conn->query("DELETE FROM `return_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Returned Item Record's Successfully deleted.");
			if (isset($res)) {
				$this->conn->query("DELETE FROM `stock_list` where id in ({$res['stock_ids']})");
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_sale()
	{
		if (empty($_POST['id'])) {
			$prefix = "SALE";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `sales_list` where sales_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['sales_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `sales_list` set {$data}";
		} else {
			$sql = "UPDATE `sales_list` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$sale_id = $this->conn->insert_id;
			else
				$sale_id = $id;
			$resp['id'] = $sale_id;
			$data = "";
			$sids = array();
			$get = $this->conn->query("SELECT * FROM `sales_list` where id = '{$sale_id}'");
			if ($get->num_rows > 0) {
				$res = $get->fetch_array();
				if (!empty($res['stock_ids'])) {
					$this->conn->query("DELETE FROM `stock_list` where id in ({$res['stock_ids']}) ");
				}
			}
			foreach ($item_id as $k => $v) {
				$sql = "INSERT INTO `stock_list` set item_id='{$v}', `quantity` = '{$qty[$k]}', `unit` = '{$unit[$k]}', `price` = '{$price[$k]}', `available` = '{$available[$k]}',`total` = '{$total[$k]}',`rem` = '{$rem[$k]}', `type` = 2 ";
				$save = $this->conn->query($sql);
				if ($save) {
					$sids[] = $this->conn->insert_id;
				}
			}
			$sids = implode(',', $sids);
			$this->conn->query("UPDATE `sales_list` set stock_ids = '{$sids}' where id = '{$sale_id}'");
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Sales Record was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " Sales Record's Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function save_sale_prod()
	{
		if (empty($_POST['id'])) {
			$prefix = "SALE";
			$code = sprintf("%'.04d", 1);
			while (true) {
				$check_code = $this->conn->query("SELECT * FROM `sales_list_prod` where sales_code ='" . $prefix . '-' . $code . "' ")->num_rows;
				if ($check_code > 0) {
					$code = sprintf("%'.04d", $code + 1);
				} else {
					break;
				}
			}
			$_POST['sales_code'] = $prefix . "-" . $code;
		}
		extract($_POST);
		$data = "";
		foreach ($_POST as $k => $v) {
			if (!in_array($k, array('id')) && !is_array($_POST[$k])) {
				if (!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if (!empty($data)) $data .= ", ";
				$data .= " `{$k}` = '{$v}' ";
			}
		}
		if (empty($id)) {
			$sql = "INSERT INTO `sales_list_prod` set {$data}";
		} else {
			$sql = "UPDATE `sales_list_prod` set {$data} where id = '{$id}'";
		}
		$save = $this->conn->query($sql);
		if ($save) {
			$resp['status'] = 'success';
			if (empty($id))
				$sale_id = $this->conn->insert_id;
			else
				$sale_id = $id;
			$resp['id'] = $sale_id;
			$data = "";
			$sids = array();
			$get = $this->conn->query("SELECT * FROM `sales_list_prod` where id = '{$sale_id}'");
			if ($get->num_rows > 0) {
				$res = $get->fetch_array();
				if (!empty($res['stock_ids'])) {
					$this->conn->query("DELETE FROM `stock_list_prod` where id in ({$res['stock_ids']}) ");
				}
			}
			foreach ($item_id as $k => $v) {
				$sql = "INSERT INTO `stock_list_prod` set item_id='{$v}', `quantity` = '{$qty[$k]}', `unit` = '{$unit[$k]}', `price` = '{$price[$k]}', `total` = '{$total[$k]}', `type` = 2 ";
				$save = $this->conn->query($sql);
				if ($save) {
					$sids[] = $this->conn->insert_id;
				}
			}
			$sids = implode(',', $sids);
			$this->conn->query("UPDATE `sales_list_prod` set stock_ids = '{$sids}' where id = '{$sale_id}'");
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'An error occured. Error: ' . $this->conn->error;
		}
		if ($resp['status'] == 'success') {
			if (empty($id)) {
				$this->settings->set_flashdata('success', " New Sales Record was Successfully created.");
			} else {
				$this->settings->set_flashdata('success', " Sales Record's Successfully updated.");
			}
		}

		return json_encode($resp);
	}
	function delete_sale()
	{
		extract($_POST);
		$get = $this->conn->query("SELECT * FROM sales_list where id = '{$id}'");
		if ($get->num_rows > 0) {
			$res = $get->fetch_array();
		}
		$del = $this->conn->query("DELETE FROM `sales_list` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Sales Record's Successfully deleted.");
			if (isset($res)) {
				$this->conn->query("DELETE FROM `stock_list` where id in ({$res['stock_ids']})");
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function delete_sale_prod()
	{
		extract($_POST);
		$get = $this->conn->query("SELECT * FROM sales_list_prod where id = '{$id}'");
		if ($get->num_rows > 0) {
			$res = $get->fetch_array();
		}
		$del = $this->conn->query("DELETE FROM `sales_list_prod` where id = '{$id}'");
		if ($del) {
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success', "Sales Record's Successfully deleted.");
			if (isset($res)) {
				$this->conn->query("DELETE FROM `stock_list_prod` where id in ({$res['stock_ids']})");
			}
		} else {
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
}

$Master = new Master();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'save_supplier':
		echo $Master->save_supplier();
		break;
	case 'save_employee':
		echo $Master->save_employee();
		break;
	case 'delete_supplier':
		echo $Master->delete_supplier();
		break;
	case 'delete_employee':
		echo $Master->delete_employee();
		break;
	case 'save_expense':
		echo $Master->save_expense();
		break;
	case 'delete_expense':
		echo $Master->delete_expense();
		break;
	case 'save_categories':
		echo $Master->save_categories();
		break;
	case 'delete_categories':
		echo $Master->delete_categories();
		break;
	case 'save_categories_man':
		echo $Master->save_categories_man();
		break;
	case 'delete_categories_man':
		echo $Master->delete_categories_man();
		break;
	case 'save_brands':
		echo $Master->save_brands();
		break;
	case 'delete_brands':
		echo $Master->delete_brands();
		break;
	case 'save_item':
		echo $Master->save_item();
		break;
	case 'save_item_man':
		echo $Master->save_item_man();
		break;
	case 'save_products':
		echo $Master->save_products();
		break;
	case 'delete_item':
		echo $Master->delete_item();
		break;
	case 'delete_product':
		echo $Master->delete_product();
		break;
	case 'delete_item_man':
		echo $Master->delete_item_man();
		break;
	case 'get_item':
		echo $Master->get_item();
		break;
	case 'save_po':
		echo $Master->save_po();
		break;
	case 'save_po_pack':
		echo $Master->save_po_pack();
		break;
	case 'save_po_man':
		echo $Master->save_po_man();
		break;
	case 'save_pro':
		echo $Master->save_pro();
		break;
	case 'delete_po':
		echo $Master->delete_po();
		break;
	case 'delete_pro':
		echo $Master->delete_pro();
		break;
	case 'save_receiving':
		echo $Master->save_receiving();
		break;
	case 'save_receiving_man':
		echo $Master->save_receiving_man();
		break;
	case 'save_receiving_prod':
		echo $Master->save_receiving_prod();
		break;
	case 'delete_receiving':
		echo $Master->delete_receiving();
		break;
	case 'save_return':
		echo $Master->save_return();
		break;
	case 'delete_return':
		echo $Master->delete_return();
		break;
	case 'save_sale':
		echo $Master->save_sale();
		break;
	case 'save_sale_prod':
		echo $Master->save_sale_prod();
		break;
	case 'delete_sale':
		echo $Master->delete_sale();
		break;
	case 'delete_sale_prod':
		echo $Master->delete_sale_prod();
		break;
	default:
		// echo $sysset->index();
		break;
}
