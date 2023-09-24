// const domain =  "http://localhost:6001";
const domain = "http://127.0.0.1:6001";


const endPoints = {
  'createSupplier' : 'supplier/createSupplier',
  'fetchSupplier' : 'supplier/fetchSupplier',
  
  'createSales' : 'finance/createSales',
  'fetchSales' : 'finance/fetchSales',




};


String getEndPoint(name) =>  "$domain/api/${endPoints[name]}";