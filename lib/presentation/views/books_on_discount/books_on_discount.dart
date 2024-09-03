import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:auraq_bulk_calculator/presentation/views/dashboard/dashboard.dart';
import 'package:auraq_bulk_calculator/presentation/views/input_screen/input_screen.dart';
import 'package:auraq_bulk_calculator/services/calculator_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../book_store/discounted_books.dart';
import '../book_store/published_books.dart';
import '../book_store/under_process_books.dart';
import '../get_input/get_input.dart';

class BooksOnDiscount extends StatefulWidget{
  final int currentIndex;
  BooksOnDiscount({this.currentIndex = 0});
  @override
  State<BooksOnDiscount> createState() => _GetInputState();
}

class _GetInputState extends State<BooksOnDiscount> {
  @override
  final TextEditingController discountController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Available Books',
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1A15)),
      ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
        }, icon: Icon(Icons.arrow_back, color: Color(0xff1E1A15),)),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                controller: searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                    prefixIcon: Icon(Icons.search, size: 20,
                      color: Colors.grey,),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey)

                ),
              ),
            ),
          ),
          Expanded(
              child: _getBody(context)),
        ],
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return StreamProvider.value(value: CalculatorServices().getAllIncompleteTasks(FirebaseAuth.instance.currentUser!.uid.toString()), initialData: [BulkModel()],
      builder: (context, child){
        List<BulkModel> taskList = context.watch<List<BulkModel>>();
        List<BulkModel> filteredTaskList = taskList.where((task) {
          return task.bookName!.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
        if (filteredTaskList.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/notfounbd.png", width: 80, height: 80,)),
              SizedBox(height: 10,),
              Center(
                child: Text('No book found', style: TextStyle(fontSize: 18, color: Colors.black,
                    fontWeight: FontWeight.w600
                )),
              ),
            ],
          );
        }
        return ListView.builder(
            itemCount: filteredTaskList.length,
            itemBuilder: (context, i){
              BulkModel task = filteredTaskList[i];

              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 7,
                    right: 7,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              width: 150,
                              height: 164,
                              imageUrl:task.productImage.toString(),
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
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  task.bookName == "" ? "Auraq Book" :
                                  task.bookName.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Total Cost',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  taskList[i].onDiscount! ? "Rs " + NumberFormat("#,##0").format(taskList[i].profittot! * (1 -
                                  taskList[i].discount! / 100)) + " PKR" :
                             "Rs " +    NumberFormat("#,##0").format(taskList[i].profittot!) + " PKR",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Per Copy Cost',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  task.onDiscount! ?"Rs " +NumberFormat("#,##0").format(task.percopycost! * (1 -
                                      task.discount! / 100)) + " PKR" :
                                 "Rs " + NumberFormat("#,##0").format(task.percopycost!) + " PKR",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  'Grand Total Cost',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                Text(
                                  task.onDiscount!
                                      ? "Rs "+ NumberFormat("#,##0").format(task.grandtotalcost! *
                                      (1 -
                                          task.discount! /
                                              100)) +
                                      " PKR"
                                      : "Rs " + NumberFormat("#,##0").format(task.grandtotalcost!) +
                                      " PKR",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InputScreen(
                                              model: task,
                                              isUpdateMode: true)));
                                },
                                child: Image.asset(
                                  'assets/images/editlogo.png',
                                  width: 30,
                                  height: 45,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              IconButton(
                                  onPressed: () {
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
                                                      'Are you sure you want to delete this book?',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color: Color(0xff1E1A15)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 38),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                color: Color(
                                                                    0xff979797)),
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            CalculatorServices()
                                                                .deleteTask(
                                                                task
                                                                    .docId
                                                                    .toString());
                                                          },
                                                          child: Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                color: Color(
                                                                    0xffEA4235)),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  icon: Image.asset(
                                    'assets/images/deletelogoicon.png',
                                    width: 30,
                                    height: 45,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 150,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  {
                                    await showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Center(
                                              child: TextField(
                                                controller: discountController,
                                                keyboardType:
                                                TextInputType.number,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 10),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  hintText:
                                                  'How much discount do you want(in percentage %)?',
                                                  hintStyle: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 38),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              color:
                                                              Colors.grey),
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          int discountValue =
                                                          int.parse(
                                                              discountController
                                                                  .text);
                                                          if (discountValue >=
                                                              0 &&
                                                              discountValue <
                                                                  100) {
                                                            setState(() {
                                                              task
                                                                  .setDiscount(
                                                                  discountValue
                                                                      .toDouble());
                                                              CalculatorServices().markTaskAsCompleted(
                                                                  task
                                                                      .docId
                                                                      .toString(),
                                                                  discountValue
                                                                      .toDouble());
                                                            });
                                                          } else {
                                                            ScaffoldMessenger
                                                                .of(context)
                                                                .showSnackBar(
                                                                SnackBar(
                                                                    content:
                                                                    Text('Enter a valid discount')));
                                                          }
                                                        },
                                                        child: Text(
                                                          'Discount',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              color:
                                                              Colors.green),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                  if (int.parse(discountController.text) >=
                                      100 ||
                                      int.parse(discountController.text) < 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                            Text('Enter valid discount')));
                                  } else {
                                    if (task.onDiscount == false) {
                                      try {
                                        // await ProdcutServices().enableDiscount(
                                        //     productList[i].docId.toString());
                                        await CalculatorServices().markTaskAsCompleted(
                                            task.docId.toString(),
                                            double.parse(
                                                discountController.text));
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text(
                                                'Something went wrong')));
                                      }
                                    }
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Enable Discount',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.green,
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                              )),
                          Container(
                            width: 60,
                            child: CupertinoSwitch(
                                value: task.onDiscount!,
                                onChanged: (val) {
                                  int discountValue =
                                  int.parse(discountController.text);
                                  if (filteredTaskList[i].onDiscount == false) {
                                    CalculatorServices().markTaskAsCompleted(
                                        task.docId.toString(),
                                        discountValue.toDouble());
                                  }
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}