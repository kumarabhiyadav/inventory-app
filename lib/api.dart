// const domain = "http://192.168.0.100:6001";
// const domain = "http://127.0.0.1:6001";

const domain = "https://inventory-api-khnq.onrender.com";

const endPoints = {
  'createSupplier': 'supplier/createSupplier',
  'fetchSupplier': 'supplier/fetchSupplier',
  'createSales': 'finance/createSales',
  'fetchSales': 'finance/fetchSales',
  'createCategory': 'inventory/createCategory',
  'createProduct': 'inventory/createProduct',
  'createSubProduct': 'inventory/createSubProduct',
  'fetchCategories': 'inventory/fetchCategories',
  'fetchProducts': 'inventory/fetchProducts',
  'fetchSubProducts': 'inventory/fetchSubProducts',
  'deleteCategory': 'inventory/deleteCategory',
  'deleteProduct': 'inventory/deleteProduct',
  'deleteSubproduct': 'inventory/deleteSubproduct',
  'searchSubProducts': 'inventory/searchSubProducts',
  'createPurchase': 'inventory/createPurchase',
  'fetchPurchase': 'inventory/fetchPurchase',
  'deletePurchase': 'inventory/deletePurchase',
  'fetchSubProductPurchase': 'inventory/fetchSubProductPurchase',
  'getProductByQR': 'inventory/getProductByQR',
  'sellProductQR': 'inventory/sellProductQR',
  'getInventoryDetails': 'inventory/getInventoryDetails'
};

String getEndPoint(name) => "$domain/api/${endPoints[name]}";

String getEndPointWithQuery({required name, required query}) =>
    "$domain/api/${endPoints[name]}$query";

bool showRate = false;
