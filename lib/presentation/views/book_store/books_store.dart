import 'dart:io';
import 'dart:math';

import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:auraq_bulk_calculator/presentation/views/book_store/published_books.dart';
import 'package:auraq_bulk_calculator/presentation/views/get_input/get_input.dart';
import 'package:auraq_bulk_calculator/presentation/views/upload_file_services/upload_image_bookcollection.dart';
import 'package:auraq_bulk_calculator/services/calculator_services.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../upload_file_services/upload_file_services.dart';

class BooksStore extends StatefulWidget {
  final BulkModel model;
  final bool isUpdateMode;

  const BooksStore(
      {super.key, required this.model, required this.isUpdateMode});

  @override
  State<BooksStore> createState() => _InputScreenState();
}

class _InputScreenState extends State<BooksStore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  bool isLoading = false;
  File? selectedFilebook;
  int? selectedCategory;

  @override
  void initState() {
    if (widget.isUpdateMode == true) {
      nameController =
          TextEditingController(text: widget.model.bookName.toString());
      authorNameController =
          TextEditingController(text: widget.model.authorName.toString());
      priceController =
          TextEditingController(text: widget.model.grandtotalcost.toString());
      // quantityController =
      //     TextEditingController(text: widget.model.quantity.toString());
      selectedCategory = widget.model.paperType!.toInt();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation : 0,
          title: Text(
            widget.isUpdateMode ? 'Input Screen' : 'Input Screen',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xff1E1A15)),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PublishedBooks()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 80,
            ),
            if (widget.isUpdateMode == true)
              InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: selectedFilebook == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            width: 150,
                            height: 150,
                            imageUrl: widget.model.productImage.toString(),
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Image.asset(
                              'assets/images/logo_two-removebg-preview.png',
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/logo_two-removebg-preview.png',
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            selectedFilebook!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ))
            else
              InkWell(
                onTap: () {
                  getImage();
                },
                child: selectedFilebook == null
                    ? Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                color: Colors.white,
                                size: 38,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Upload Image',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          selectedFilebook!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                height: 48,
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    hintText: 'Book Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Container(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.menu_book,
                          color: Colors.grey,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                height: 48,
                child: TextField(
                  controller: authorNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    hintText: "Author's Name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Container(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    hintText: 'Price (in PKR)',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Container(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.grey,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 28),
            //   child: Container(
            //     width: double.infinity,
            //     height: 48,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: TextField(
            //       controller: quantityController,
            //       keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         contentPadding:
            //         EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            //         hintText: 'Available Quantity',
            //         hintStyle: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           color: Colors.grey,
            //           fontSize: 14,
            //         ),
            //         prefixIcon: Container(
            //             width: 24,
            //             height: 24,
            //             child: Icon(
            //               Icons.format_list_numbered,
            //               color: Colors.grey,
            //             )),
            //
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonFormField<int>(
                  value: selectedCategory,
                  hint: Text(
                    'Published Quantity',
                    style: TextStyle(),
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items:
                      <int>[30, 50, 100, 300, 500, 1000].map((int valuetype) {
                    return DropdownMenuItem<int>(
                      value: valuetype,
                      child: Text(valuetype.toString()),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Book name can not be empty')));
                      return;
                    }
                    if (authorNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Author's name can not be empty")));
                      return;
                    }
                    if (priceController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Price can not be empty')));
                      return;
                    }
                    // if (quantityController.text.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('Quantity can not be empty')));
                    //   return;
                    // }
                    if (selectedCategory == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Published quantity can not be empty')));
                      return;
                    }
                    try {
                      isLoading = true;
                      setState(() {});

                      if (widget.isUpdateMode) {
                        await UploadFileServicesbookCollection()
                            .getUrl(context, selectedFilebook)
                            .then((value) async {
                          await CalculatorServices().updateTaskAnyOne(BulkModel(
                            docId: widget.model.docId.toString(),
                            bookName: nameController.text.toString(),
                            authorName: authorNameController.text.toString(),
                            // quantity: double.parse(
                            //     quantityController.text.toString()),
                            productImage:
                                value == "" ? widget.model.productImage : value,
                            grandtotalcost: double.parse(priceController.text),
                            paperType: int.parse(selectedCategory.toString()),
                            userID: FirebaseAuth.instance.currentUser!.uid
                                .toString(),
                          ));
                        }).then((value) {
                          isLoading = false;
                          setState(() {});
                          {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return Container(
                                    child: AlertDialog(
                                      title: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset("assets/images/logo_two-removebg-preview.png",
                                              width: 70,
                                              height: 70,),
                                            SizedBox(height: 8,),
                                            Text(
                                              'Book has been updated successfully!',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff1E1A15)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 38),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PublishedBooks()));
                                                  },
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        });
                      } else {
                        isLoading = true;
                        setState(() {});
                        await UploadFileServicesbookCollection()
                            .getUrl(context, selectedFilebook)
                            .then((value) async {
                          await CalculatorServices()
                              .createNewTaskAnyOne(BulkModel(
                            docId: widget.model.docId.toString(),
                            bookName: nameController.text.toString(),
                            authorName: authorNameController.text.toString(),
                            productImage: value,
                            // quantity: double.parse(
                            //     quantityController.text.toString()),
                            grandtotalcost:
                                double.parse(priceController.text.toString()),
                            userID: FirebaseAuth.instance.currentUser!.uid
                                .toString(),
                            onDiscount: false,
                            createdAt: DateTime.now().millisecondsSinceEpoch,
                            paperType: int.parse(selectedCategory.toString()),
                          ));
                        }).then((value) {
                          isLoading = false;
                          setState(() {});

                          {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return Container(
                                    child: AlertDialog(
                                      title: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset("assets/images/logo_two-removebg-preview.png",
                                              width: 70,
                                              height: 70,),
                                            SizedBox(height: 8,),
                                            Text(
                                              'Book has been added successfully!',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff1E1A15)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 38),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PublishedBooks()));
                                                  },
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        });
                      }
                    } catch (e) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff6a11cb),
                        Color(0xff2575fc),
                      ], begin: Alignment.topLeft, end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.isUpdateMode == true
                                ? Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.update,
                                    color: Colors.white,
                                  ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              widget.isUpdateMode == true
                                  ? 'Edit Query'
                                  : 'Submit Query',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    maximumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
        SizedBox(),
      ],
    ));
  }

  getImage() {
    ImagePicker _imagePicker = ImagePicker();
    _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      selectedFilebook = File(value!.path);
      setState(() {});
    });
  }
}
