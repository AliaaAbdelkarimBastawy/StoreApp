import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/components/CustomBtn.dart';
import 'package:store_app/components/CustomTxtFormFieldWidget.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_Service.dart';
import 'package:store_app/services/update_product_Service.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({Key? key,}) : super(key: key);

  static String id= 'UpdateProductView';

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  TextEditingController productNameController = TextEditingController();

   TextEditingController productDescriptionController = TextEditingController();

   TextEditingController productImageController = TextEditingController();

   TextEditingController productPriceController = TextEditingController();
   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Update Product',
            style: TextStyle(color: Colors.black),),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              CustomTxtFormFieldWidget(
                  hintTxt: 'Product Name',
                  controller: productNameController, keyboardType: TextInputType.text,),
              const SizedBox(height: 16,),
              CustomTxtFormFieldWidget(
                  hintTxt: 'Product Description',
                  controller: productDescriptionController, keyboardType: TextInputType.text,),
              const SizedBox(height: 16,),
              CustomTxtFormFieldWidget(
                  hintTxt: 'Product Price',
                  controller: productPriceController, keyboardType: TextInputType.number,),
              const SizedBox(height: 16,),
              CustomTxtFormFieldWidget(
                  hintTxt: 'Product Image',
                  controller: productImageController,
                keyboardType: TextInputType.text,),
              const SizedBox(height: 50,),
              CustomBtn(btnTxt: 'Update', onTap: () async{
                isLoading = true;
                setState(() {
                });
                await updateProductMethod(productModel);

                try
                {
                  print('Success Update!');
                }
                catch(e) {
                  print('Failed Update! ${e.toString()}');
                }

                isLoading = false;
                setState(() {});}
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(ProductModel productModel) async{
     await UpdateProductService().updateProduct(
        id: productModel.id,
        title: (productNameController.text == '') ? productModel.title : productNameController.text ,
        price: (productPriceController.text == '') ? productModel.price.toString(): productPriceController.text,
        description: (productDescriptionController.text == '') ? productModel.description : productDescriptionController.text,
         image: (productImageController.text == '') ? productModel.image : productImageController.text,
         category: productModel.category);
  }
}
