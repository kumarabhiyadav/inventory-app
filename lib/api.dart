// const domain =  "http://localhost:6001";
const domain = "http://127.0.0.1:6001";


const endPoints = {
  'createSupplier' : 'supplier/createSupplier',
  'fetchSupplier' : 'supplier/fetchSupplier',
  
  'createSales' : 'finance/createSales',
  'fetchSales' : 'finance/fetchSales',

  'createCategory' : 'inventory/createCategory',
  'createProduct' : 'inventory/createProduct',
  'createSubproduct' : 'inventory/createSubproduct',

  'fetchCategories' : 'inventory/fetchCategories',
  'fetchProducts' : 'inventory/fetchProducts',
  'fetchSubProducts' : 'inventory/fetchSubProducts',




  

};


String getEndPoint(name) =>  "$domain/api/${endPoints[name]}";