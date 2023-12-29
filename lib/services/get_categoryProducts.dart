import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class GetCategoryProductsService
{
  Future<List<ProductModel>> getCategoryProducts (String categoryName) async
  {
    // http.Response response =
    // await http.get(Uri.parse('$kBaseUrl/products/category/:$categoryName'));
    //The 2 points : are related to the postman

    List<dynamic> data =
        await Api().get(url:'https://fakestoreapi.com/products/category/$categoryName');

       List<ProductModel> productsList = [];
       for(int i=0; i<data.length; i++)
       {
         productsList.add(ProductModel.fromJson(data[i]));
       }

       return productsList;
  }
}