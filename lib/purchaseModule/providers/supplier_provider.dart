import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';
import 'package:inventory_app/services/http_service.dart';


class SupplierProvider with ChangeNotifier {
  

List<SupplierModel> _suppliers = [];

List<SupplierModel>  get suppliers => [..._suppliers];


createSupplier({required Map<String,String> body})async{
  final responseData  =  await  HttpService.postRequest(getEndPoint('createSupplier'), json.encode(body));
  if(responseData!=null){
    _suppliers.insert(0, SupplierModel.fromJson(responseData['result']));
    notifyListeners();
  }
  print(responseData);
}


fetchSuppliers()async{

  final responseData  =  await  HttpService.getRequest(getEndPoint('fetchSupplier'));
  if(responseData!=null){
    _suppliers = [];
    responseData['result'].forEach((data)=>_suppliers.add(SupplierModel.fromJson(data)));
    notifyListeners();
  }
}

  





}
