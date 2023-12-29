import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/UpdateProductView.dart';

class ProductCardItem extends StatelessWidget {
  ProductModel model;
  ProductCardItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateProductView.id,
            arguments: model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration:BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  )]
            ),
            child: Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset("assets/images/pants.png", height: 50,width: 50,),
                    Text(model.title,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16),),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r"$"'${model.price}'),
                        const Icon(Icons.favorite, color: Colors.red,),
                      ],)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -65,
            child: Image.network(model.image,
              height: 100,width: 80,),
          ),
        ],),
    );
  }
}
