import 'package:store_app/constants.dart';
import '../helper/api.dart';
import '../models/product_model.dart';

class AddProductService
{
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category
  }) async
  {
    dynamic data = await Api().post(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category
        },
        token: null);

    return ProductModel.fromJson(data);
  }
}