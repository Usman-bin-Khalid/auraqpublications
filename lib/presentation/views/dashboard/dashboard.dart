
import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:auraq_bulk_calculator/presentation/views/available_books/available_books.dart';
import 'package:auraq_bulk_calculator/presentation/views/books_on_discount/books_on_discount.dart';
import 'package:auraq_bulk_calculator/presentation/views/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:auraq_bulk_calculator/presentation/views/get_input/get_input.dart';
import 'package:auraq_bulk_calculator/presentation/views/input_screen/input_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/offered_services/offered_services.dart';
import 'package:auraq_bulk_calculator/services/calculator_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('BULK CALCULATOR', style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1A15))),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
          NavigationScreen()));
        }, icon: Icon(Icons.arrow_back, color: Color(0xff1E1A15),)),
      ),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return StreamProvider.value(
      value: CalculatorServices()
          .getAllTasks(FirebaseAuth.instance.currentUser!.uid.toString()),
      initialData: [BulkModel()],
      builder: (context, child) {
        List<BulkModel> getAllTasksList = context.watch<List<BulkModel>>();
        return StreamProvider.value(
          value: CalculatorServices().getAllCompletedTasks(
              FirebaseAuth.instance.currentUser!.uid.toString()),
          initialData: [BulkModel()],
          builder: (context, child) {
            List<BulkModel> completeTaskList = context.watch<List<BulkModel>>();
            return StreamProvider.value(
              value: CalculatorServices().getAllIncompleteTasks(
                  FirebaseAuth.instance.currentUser!.uid.toString()),
              initialData: [BulkModel()],
              builder: (context, child) {
                List<BulkModel> incompleteTaskList =
                    context.watch<List<BulkModel>>();

                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Container(

                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(

                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(8),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Welcome to Auraq Bulk Calculator ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF)),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Auraq Publications is one of the Pakistan’s well-functioning publishing house. Our aim is to facilitate writers in getting their words out there. We believe that any writer can become an author as long as they have proper help and support from an established publishing organization. ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFFFFFF)),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            )),
                        SizedBox(height: 20,),

                        Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 0.5, color: Colors.black),
                                shape: BoxShape.circle,
                                // border: Border.all(
                                //     color: Colors.black,
                                //     width: 0.5
                                // )
                            ),
                            child: Image.asset(
                              'assets/images/logo_two-removebg-preview.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                height: 74,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 6),
                                        child: Text(
                                          'Total Books : ${getAllTasksList.length.toString()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                              GetInput()
                                          ));
                                        },
                                        child: Text('Check',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffFFFFFF)),
                                            textAlign: TextAlign.center),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                height: 74,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 6),
                                        child: Text(
                                          'Available Books : ${incompleteTaskList.length.toString()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                              BooksOnDiscount()
                                          ));
                                        },
                                        child: Text('Check',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffFFFFFF)),
                                            textAlign: TextAlign.center),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                height: 74,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 6),
                                        child: Text(
                                          'Books on discount : ${completeTaskList.length.toString()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      child: ElevatedButton(

                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                              AvailableBooks()
                                          ));
                                        },
                                        child: Text('Check',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffFFFFFF)),
                                            textAlign: TextAlign.center),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                height: 74,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 6),
                                        child: Text(
                                          'Add New Book    ',
                                          // ': ${discountProductsList.length.toString()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                           InputScreen(model: BulkModel(), isUpdateMode: false)
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            Text('a',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                                                color: Color(0xff622CEA)
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text('Add',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffFFFFFF)),
                                                textAlign: TextAlign.center),
                                            Text('k', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                                              color: Color(0xff622CEA),
                                            ),
                                              textAlign: TextAlign.center,)
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                            backgroundColor: Color(0xff622CEA),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),



                            SizedBox(height: 5,),
                          ],
                        ),


                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
   copiedToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied to clipboard')));
  }
}
