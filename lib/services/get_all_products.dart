import 'package:store_app/constants.dart';
import '../helper/api.dart';
import '../models/product_model.dart';

class GetAllProductsService
{
  Future<List<ProductModel>> getAllProducts () async {

    List<dynamic> data = await Api().get(url:'$kBaseUrl/products');

    print(data.length);
    List<ProductModel> productsList = [];

    int? i;
    try{

      for(i=0; i!<20; i++)
      {
        productsList.add(ProductModel.fromJson(data[i]));
        print(data[i]);
      }
    }
   catch(e)
    {
      print(i);
      print(e.toString());
    }
        print('Aliaa');
        return productsList;
  }
}

