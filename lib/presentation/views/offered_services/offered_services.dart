import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:auraq_bulk_calculator/model/model_class.dart';
import 'package:auraq_bulk_calculator/presentation/views/dashboard/dashboard.dart';
import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/offered_services/offered_services_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bottom_navigation_bar/bottom_navigation_bar.dart';

class OfferedServices extends StatefulWidget {
  final BulkModel model;

  const OfferedServices({super.key, required this.model});

  @override
  State<OfferedServices> createState() => _OfferedServicesState();
}

class _OfferedServicesState extends State<OfferedServices> {
  List<ModelClass> servicesList = [
    ModelClass(
        image: 'assets/images/editimg-removebg-preview.png',
        name: 'EDITING',
        description:
            'We provide editing services that can match the Author’s requirement in effective way. Auraq has experienced editors on board especially for English and Urdu.'),
    ModelClass(
        image: 'assets/images/designingimg-removebg-preview.png',
        name: 'DESIGNING',
        description:
            'Without an asthmatically pleasing design, no one can convince reader to read a book. Our creative design team helps author to design the book inside as well as cover title.'),
    ModelClass(
        image: 'assets/images/printing-removebg-preview (1).png',
        name: 'PRINTING',
        description:
            'Auraq provides the quality printing with imported paper and strong binding of the books which looks amazing when someone holds in his hand. We have a complete '
            'in-house digital printing and binding setup with offset printing services as well.'),
    ModelClass(
        image: 'assets/images/marketing-removebg-preview.png',
        name: 'MARKETING',
        description:
            'Without a better and smart marketing plan, book cannot reach to its actual potential. Auraq help author to market his book well in the market, both online and offline.'),
    ModelClass(
        image: 'assets/images/selling-removebg-preview.png',
        name: 'SELLING',
        description:
            'We have made book selling process better and easier for a customer. Books can be sold through online and offline including local bookstore and book fairs as well.'),
    ModelClass(
        image: 'assets/images/royaltyimg.png',
        name: 'ROYALTIES',
        description:
            'Auraq believes in uplifting the authors financially through good royalties. We are one the highest and regular royalty payers in the market with the transparent system.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Offered Services',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              size: 26,
              color: Colors.black,
            )),
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: servicesList.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      if (i == 0)
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Image.asset(
                                                            'assets/images/logo_two-removebg-preview.png',
                                                            width: 110,
                                                            height: 110,
                              ),
                            )),

                      OfferedServicesWidgets(modelClass: servicesList[i]),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Copied to clipboard")),
    );
  }
}
