import '../helper/api.dart';
import 'package:store_app/constants.dart';

class GetAllCategoriesService
{
  //Don't put List<String>
  //The return is always [list<dynamic> || Map<String, dynamic>

  Future<List<dynamic>> getAllCategories() async
  {
    List<dynamic> data = await Api().get(url:'$kBaseUrl/products/categories');
    return data;
  }
}

