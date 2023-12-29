import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/ProductCardItem.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_categories.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/services/get_categoryProducts.dart';

class StoreAppView extends StatelessWidget {
   StoreAppView({Key? key}) : super(key: key);

  static String id = "StoreAppView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
        title: const Text("New Trend", style: TextStyle(color: Colors.black),),
        actions: [
         Padding(
           padding: const EdgeInsets.only(
               right: 8.0),
           child: IconButton(
               onPressed: (){},
               icon: const Icon(Icons.shopping_cart, color: Colors.black,),),
         )

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 70.0),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapshot)
          {
            if(snapshot.hasData)
              {
                List<ProductModel> productsList = snapshot.data!;
                return GridView.builder(
                  itemCount: productsList.length,
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 80

                    ),
                    itemBuilder: (context, index)
                    {
                      return ProductCardItem(model: productsList[index],);
                    });
              }

            else
              {
                return const Center(child: CircularProgressIndicator());
              }
          },

        )

      )
    );
  }
}
