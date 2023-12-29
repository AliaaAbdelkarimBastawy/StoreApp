import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/services/update_product_Service.dart';
import 'package:store_app/views/StoreAppView.dart';
import 'package:store_app/views/UpdateProductView.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: false
        ),
    routes: {
      StoreAppView.id :(context) => StoreAppView(),
      UpdateProductView.id :(context) =>  UpdateProductView(),

    },
    debugShowCheckedModeBanner: false,
    initialRoute: StoreAppView.id,
  ));
}

