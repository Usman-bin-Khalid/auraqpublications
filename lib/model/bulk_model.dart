// To parse this JSON data, do
//
//     final bulkModel = bulkModelFromJson(jsonString);

import 'dart:convert';

BulkModel bulkModelFromJson(String str) => BulkModel.fromJson(json.decode(str));



class BulkModel {
  final String? docId;
  final String? productImage;
  final String? bookName;
  final String? userID;
  final String? authorName;
  final int? paperType;
  final int? createdAt;
  final double? pages;
  final double? quantity;
  final double? priceone;
  final double? pricetwo;
  final double? pricethree;
  final double? pricefour;
  final double? pricefive;
  final double? pricesix;
  final double? priceseven;
  final double? totalcost;
  final double? grandtotalcost;
  final double? percopycost;
  final double? foldingprice;
  final double? copies;
  final double? binding;
  final double? profit;
  final double? profittot;
  bool? onDiscount;
  double? discount;

  BulkModel({
    this.docId,
    this.paperType,
    this.createdAt,
    this.productImage,
    this.quantity,
    this.authorName,
    this.bookName,
    this.userID,
    this.pages,
    this.priceone,
    this.pricetwo,
    this.pricethree,
    this.pricefour,
    this.pricefive,
    this.pricesix,
    this.priceseven,
    this.totalcost,
    this.grandtotalcost,
    this.percopycost,
    this.foldingprice,
    this.copies,
    this.binding,
    this.profit,
    this.profittot,
    this.onDiscount = false,
    this.discount = 0.0,
  });

  factory BulkModel.fromJson(Map<String, dynamic> json) => BulkModel(
    docId: json["docId"],
    quantity: json["quantity"],
    createdAt: json["createdAt"],
    productImage: json["productImage"],
    authorName: json["authorName"],
    paperType: json["paperType"],
    bookName: json["bookName"],
    userID: json["userID"],
    pages: json["pages"],
    priceone: json["priceone"],
    pricetwo: json["pricetwo"],
    pricethree: json["pricethree"],
    pricefour: json["pricefour"],
    pricefive: json["pricefive"],
    pricesix: json["pricesix"],
    priceseven: json["priceseven"],
    totalcost: json["totalcost"],
    grandtotalcost: json["grandtotalcost"],
    profittot: json["profittot"],
    percopycost: json["percopycost"],
    foldingprice: json["foldingprice"],
    copies: json["copies"],
    binding: json["binding"],
    profit: json["profit"]?.toDouble(),
    onDiscount: json["onDiscount"],
    discount: json["discount"]?.toDouble(),
  );

  Map<String, dynamic> toJson(String bulkId) => {
    "docId": bulkId,
    "productImage": productImage,
    "quantity": quantity,
    "createdAt": createdAt,
    "paperType": paperType,
    "authorName": authorName,
    "bookName": bookName,
    "pages": pages,
    "userID": userID,
    "priceone": priceone,
    "pricetwo": pricetwo,
    "pricethree": pricethree,
    "pricefour": pricefour,
    "pricefive": pricefive,
    "pricesix": pricesix,
    "priceseven": priceseven,
    "totalcost": totalcost,
    "grandtotalcost": grandtotalcost,
    "foldingprice": foldingprice,
    "percopycost": percopycost,
    "profittot": profittot,
    "copies": copies,
    "binding": binding,
    "profit": profit,
    "onDiscount": onDiscount,
    "discount": discount,
  };
  void setDiscount(double discountValue) {
    onDiscount = true;
    discount = discountValue;
  }
}
