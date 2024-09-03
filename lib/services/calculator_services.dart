import 'dart:async';
import 'dart:math';

import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalculatorServices {
  //Get all tasks
  Stream<List<BulkModel>> getAllTasks(String userID) {
    return FirebaseFirestore.instance
        .collection('bulkCollection')
        .where('userID', isEqualTo: userID)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => BulkModel.fromJson(e.data())).toList());
  }

  //Access for Anyone
  Stream<List<BulkModel>> getAllTasksforAnyone(String userID) {
    return FirebaseFirestore.instance
        .collection('bookCollection')
        .where('userID', isEqualTo: userID)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((bookList) => bookList.docs
            .map((singleBook) => BulkModel.fromJson(singleBook.data()))
            .toList());
  }

  //Create new task
  Future createNewTask(BulkModel model) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('bulkCollection').doc();
    return await FirebaseFirestore.instance
        .collection('bulkCollection')
        .doc(docRef.id.toString())
        .set(model.toJson(docRef.id));
  }

  //Create New Task
  Future createNewTaskAnyOne(BulkModel model) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('bookCollection').doc();
    return await FirebaseFirestore.instance
        .collection('bookCollection')
        .doc(docRef.id.toString())
        .set(model.toJson(docRef.id));
  }

  //Update Task
  Future updateTask(BulkModel model) async {
    return await FirebaseFirestore.instance
        .collection('bulkCollection')
        .doc(model.docId)
        .update({
      'pages': model.pages,
      'binding': model.binding,
      'copies': model.copies,
      'profit': model.profit,
      'profittot': model.profittot,
      'grandtotalcost': model.grandtotalcost,
      'percopycost': model.percopycost,
      'bookName': model.bookName,
      'productImage': model.productImage,
      'authorName': model.authorName,
      'quantity': model.quantity,
    });
  }

  //Update Task for Book Collection
  Future updateTaskAnyOne(BulkModel model) async {
    return await FirebaseFirestore.instance
        .collection('bookCollection')
        .doc(model.docId)
        .update({
      'pages': model.pages,
      'binding': model.binding,
      'copies': model.copies,
      'profit': model.profit,
      'profittot': model.profittot,
      'grandtotalcost': model.grandtotalcost,
      'percopycost': model.percopycost,
      'bookName': model.bookName,
      'productImage': model.productImage,
      'authorName': model.authorName,
      'quantity': model.quantity,
      'paperType': model.paperType,
    });
  }

  //Delete Task
  Future deleteTask(String bulkId) async {
    return await FirebaseFirestore.instance
        .collection('bulkCollection')
        .doc(bulkId)
        .delete();
  }

  //Delete Task AnyOne
  Future deleteTaskAnyOne(String bulkId) async {
    return await FirebaseFirestore.instance
        .collection('bookCollection')
        .doc(bulkId)
        .delete();
  }

  //Mark Task as completed
  Future markTaskAsCompleted(String bulkId, double discount) async {
    return await FirebaseFirestore.instance
        .collection('bulkCollection')
        .doc(bulkId)
        .update({'onDiscount': true, 'discount': discount});
  }

  //Mark task as completed anyone
  Future markTaskAsCompletedAnyOne(String bulkId, double discount) async {
    return await FirebaseFirestore.instance
        .collection('bookCollection')
        .doc(bulkId)
        .update({'onDiscount': true, 'discount': discount});
  }

  //Get all completed tasks
  Stream<List<BulkModel>> getAllCompletedTasks(String userID) {
    return FirebaseFirestore.instance
        .collection('bulkCollection')
        .where('onDiscount', isEqualTo: true)
        .where('userID', isEqualTo: userID)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((taskList) => taskList.docs
            .map((singleList) => BulkModel.fromJson(singleList.data()))
            .toList());
  }

  Stream<List<BulkModel>> getAllCompletedTasksforAnyone(String userID) {
    return FirebaseFirestore.instance
        .collection('bookCollection')
        .where('userID', isEqualTo: userID)
        .where('onDiscount', isEqualTo: true)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((bookList) => bookList.docs
            .map((singleBook) => BulkModel.fromJson(singleBook.data()))
            .toList());
  }

  //Get All Incomplete Tasks
  Stream<List<BulkModel>> getAllIncompleteTasks(String userID) {
    return FirebaseFirestore.instance
        .collection('bulkCollection')
        .where('onDiscount', isEqualTo: false)
        .where('userID', isEqualTo: userID)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((taskList) => taskList.docs
            .map((singleList) => BulkModel.fromJson(singleList.data()))
            .toList());
  }

  Stream<List<BulkModel>> getAllInCompletedTasksforAnyone(String userID) {
    return FirebaseFirestore.instance
        .collection('bookCollection')
        .where('userID', isEqualTo: userID)
        // .orderBy('createdAt', descending: true)
        .where('onDiscount', isEqualTo: false)
        .snapshots()
        .map((bookList) => bookList.docs
            .map((singleBook) => BulkModel.fromJson(singleBook.data()))
            .toList());
  }
}
