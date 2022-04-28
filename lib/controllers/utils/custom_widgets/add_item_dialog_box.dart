import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice/controllers/utils/app_buttons.dart';
import 'package:invoice/controllers/utils/app_nonstatic_methods.dart';
import 'package:invoice/controllers/utils/app_nonstatic_properties.dart';
import 'package:invoice/models/item_model.dart';

import '../app_static_properties.dart';
import '../form_controllers.dart';

class AddItemsAlertDialog extends StatefulWidget {
  const AddItemsAlertDialog({Key? key}) : super(key: key);

  @override
  State<AddItemsAlertDialog> createState() => _AddItemsAlertDialogState();
}

class _AddItemsAlertDialogState extends State<AddItemsAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade100,
      scrollable: true,
      title: Container(
        height: 30.sp,
        alignment: Alignment.center,
        child: Text(
          'Items Added: ${AppStaticProperties.listOfItems.length}',
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            fontSize: 10.sp,
          ),
        ),
      ),
      content: SizedBox(
        height: 250.sp,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter item\'s name.';
                        }
                        return null;
                      },
                      style: GoogleFonts.montserrat(
                        color: Colors.lightGreen,
                      ),
                      cursorColor: Colors.lightGreen,
                      controller: FormControllers.itemNameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the quantity.';
                        }
                        return null;
                      },
                      style: GoogleFonts.montserrat(
                        color: Colors.lightGreen,
                      ),
                      cursorColor: Colors.lightGreen,
                      controller: FormControllers.itemQuantityController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                        hintStyle: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the price.';
                        }
                        return null;
                      },
                      style: GoogleFonts.montserrat(
                        color: Colors.lightGreen,
                      ),
                      cursorColor: Colors.lightGreen,
                      controller: FormControllers.itemPriceController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        hintStyle: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){
                          AppStaticProperties.listOfItems.add(
                            ItemModel(
                                serialNumber: AppNonStaticProperties().itemSerialNumber,
                                itemName: FormControllers.itemNameController.text.trim(),
                                quantity: int.parse(FormControllers.itemQuantityController.text.trim()),
                                price: int.parse(FormControllers.itemPriceController.text.trim()),
                            ),
                          );

                          FormControllers.itemNameController.clear();
                          FormControllers.itemQuantityController.clear();
                          FormControllers.itemPriceController.clear();
                          setState(() => AppStaticProperties.listOfItems);
                          AppNonStaticMethods().incrementItemSerialNumber();
                        },
                        child: AppButtons.alertDialogButton(onTopText: 'Add'),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 7,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: AppButtons.alertDialogButton(onTopText: 'Done'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // actions: [],
    );
  }
}
