import 'dart:io';
import 'dart:math';

import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:auraq_bulk_calculator/presentation/views/get_input/get_input.dart';
import 'package:auraq_bulk_calculator/services/calculator_services.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../upload_file_services/upload_file_services.dart';

class InputScreen extends StatefulWidget {
  final BulkModel model;
  final bool isUpdateMode;

  const InputScreen(
      {super.key, required this.model, required this.isUpdateMode});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController pageController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController copyController = TextEditingController();

  TextEditingController bindingController = TextEditingController();

  TextEditingController profitController = TextEditingController();
  bool isLoading = false;
  File? selectedFile;

  @override
  void initState() {
    if (widget.isUpdateMode == true) {
      pageController =
          TextEditingController(text: widget.model.pages.toString());
      copyController =
          TextEditingController(text: widget.model.copies.toString());
      bindingController =
          TextEditingController(text: widget.model.binding.toString());
      profitController =
          TextEditingController(text: widget.model.profit.toString());
      nameController = TextEditingController(text: widget.model.bookName.toString());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.isUpdateMode ? 'Input Screen' : 'Input Screen',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xff1E1A15)),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GetInput()));
          }, icon: Icon(Icons.arrow_back, color: Color(0xff1E1A15),)),
        ),
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          if (widget.isUpdateMode == true)
            InkWell(
                onTap: () {
                  getImage();
                },
                child: selectedFile == null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: 150,
                    height: 150,
                    imageUrl: widget.model.productImage.toString(),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.asset('assets/images/logo_two-removebg-preview.png',
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                    errorWidget: (context, url, error) => Image.asset('assets/images/logo_two-removebg-preview.png',
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                    // widget.model.productImage.toString()
                  ),
                ) : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    selectedFile!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
            )
          else
            InkWell(
              onTap: () {
                getImage();
              },
              child: selectedFile == null
                  ? Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                       border: Border.all(color: Colors.white,
                       width: 1),
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
                  selectedFile!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(height: 30,),
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

                        Icons.book,
                        color: Colors.grey,
                      )),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: 48,
              child: TextField(
                controller: pageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  hintText: 'No of Pages',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Container(
                      width: 24,
                      height: 24,
                      child: Icon(
                        // Icons.pages_outlined,
                        Icons.menu_book,
                        color: Colors.grey,
                      )

                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
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
                controller: copyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  hintText: 'No of Copies',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Container(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.library_books,
                        color: Colors.grey,
                      )),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
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
                controller: bindingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  hintText: 'Binding Cost',
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
          SizedBox(height: 30,),
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
                controller: profitController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  hintText: 'Profit (in percentage %)',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Container(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.trending_up,
                        color: Colors.grey,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
         SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (pageController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Pages can not be empty')));
                      return;
                    }
                    if (copyController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copies can not be empty')));
                      return;
                    }
                    if (bindingController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Binding can not be empty')));
                      return;
                    }
                    if (profitController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profit can not be empty')));
                      return;
                    }
                    try {
                      isLoading = true;
                      setState(() {});
                      var oc = copyController.text;
                      var ioc = double.parse(oc);
                      var vioc = ioc + 30;
                      //Price One
                      var p1 = pageController.text;
                      var ppp = double.parse(p1);
                      var pioc = ppp / 4;
                      var pp2 = pioc * 300;
                      //Price Two
                      var p2 = pageController.text;
                      var qqq = double.parse(p2);
                      var qioc = qqq / 4;
                      var qq2 = qioc * 400;
                      //Price Three
                      var p3 = pageController.text;
                      var rrr = double.parse(p3);
                      var oc1 = copyController.text;
                      var ioc1 = double.parse(oc1);
                      var vioc1 = ioc1 + 30;
                      var no_of_sheets = (rrr / 32);
                      var no_f_sheetsone = no_of_sheets * vioc1;
                      var no_of_sheetstwo = no_f_sheetsone / 500;
                      var paper_price = no_of_sheetstwo * 7500;
                      //Price Four
                      var binding_cost = bindingController.text;
                      var bc = double.parse(binding_cost);
                      var binding_price = bc * vioc;
                      //Price Five
                      var cover_cost = 25000.0;
                      //Price Folding
                      var folding = qqq / 8;
                      var foldingcost = folding * vioc * 0.85;
                      //Price Six
                      var admin_cost = pp2 +
                          qq2 +
                          paper_price +
                          binding_price +
                          cover_cost +
                          foldingcost;
                      var admin_price = admin_cost * 0.05;
                      //Price Seven
                      var profittotal = pp2 +
                          qq2 +
                          paper_price +
                          binding_price +
                          cover_cost +
                          admin_price +
                          foldingcost;
                      var profit_value = profittotal * 0.4;
                      //Total Cost
                      var total_price = profittotal;
                      //Grand Total Cost
                      var grand_total = total_price + profit_value;
                      //Per copy cost
                      var per_copy = grand_total / ioc;
                      if (widget.isUpdateMode) {
                        await UploadFileServices().getUrl(context, selectedFile).then((value) async{
                          await CalculatorServices().updateTask(BulkModel(
                            pages: double.parse(pageController.text),
                            copies: vioc,
                            priceone: pp2,
                            pricetwo: qq2,
                            pricethree: paper_price,
                            pricefour: binding_price,
                            pricefive: cover_cost,
                            pricesix: admin_price,
                            priceseven: profit_value,
                            productImage: value == "" ? widget.model.productImage : value,
                            totalcost: total_price,
                            grandtotalcost: grand_total,
                            percopycost: per_copy,
                            profittot: profittotal,
                            foldingprice: foldingcost,
                            binding: double.parse(bindingController.text),
                            bookName: nameController.text.toString(),
                            profit: double.parse(profitController.text),
                            docId: widget.model.docId.toString(),
                            userID: FirebaseAuth.instance.currentUser!.uid.toString(),
                          ));
                        })
                       .
                        then((value) {
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
                        'Calculation has been updated successfully!',
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
                    padding: const EdgeInsets.only(top: 38),
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
                    GetInput()));
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
                         await UploadFileServices().getUrl(context, selectedFile).then((value) async{
                           await CalculatorServices().createNewTask(BulkModel(
                             pages: double.parse(pageController.text),
                             bookName: nameController.text.toString(),
                             productImage: value,
                             createdAt: DateTime.now().millisecondsSinceEpoch,
                             // copies: double.parse(vioc.toString()),
                             //  priceone: double.parse(pp2.toString()),
                             copies: vioc,
                             priceone: pp2,
                             pricetwo: qq2,
                             pricethree: paper_price,
                             pricefour: binding_price,
                             pricefive: cover_cost,
                             pricesix: admin_price,
                             priceseven: profit_value,
                             totalcost: total_price,
                             profittot: profittotal,
                             grandtotalcost: grand_total,
                             percopycost: per_copy,
                             foldingprice: foldingcost,
                             binding: double.parse(bindingController.text),
                             profit: double.parse(profitController.text),
                             onDiscount: false,
                             userID: FirebaseAuth.instance.currentUser!.uid.toString(),
                           )) ;
                         })
                             .then((value) {
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
                                              'Calculation has been completed successfully!',
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
                                          padding: const EdgeInsets.only(top: 38),
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
                                                                GetInput()));
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
          SizedBox(height: 30,)
        ],
      ),
    );
  }
  getImage() {
    ImagePicker _imagePicker = ImagePicker();
    _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      selectedFile = File(value!.path);
      setState(() {});
    });
  }

}
