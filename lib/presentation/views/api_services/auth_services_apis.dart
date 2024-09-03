import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../model/api_model/login_model.dart';
import '../../../model/api_model/register_user_model.dart';
import '../../../model/api_model/user_model.dart';
import '../configs/backend_configs.dart';
import '../configs/end_poinst.dart';
import '../error_model/error_model.dart';

class AuthServicesApis {
  //Register
  Future<Either<ErrorModel, RegisterResponseModel>> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    http.Response response = await http.post(
        Uri.parse('https://todo-nu-plum-19.vercel.app/users/register'),
        body: {"name": name, "email": email, "password": password});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(jsonDecode(response.body)));
    } else if (response.statusCode == 400) {
      return Left(
          ErrorModel(success: false, message: "Email or password is invalid"));
    } else if (response.statusCode == 401) {
      return Left(ErrorModel(success: false,
          message: "Sorry! You are not allowed to perform this operation"));
    } else if (response.statusCode == 404) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! Your requested data does not exist."));
    } else if (response.statusCode == 500) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! We are unable to connect our servers."));
    }else {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! Something went wrong. Please try again later."));
    }
  }
  //Login
  Future<Either<ErrorModel, LoginResponseModel>> loginUser(
      {required String email, required String password}) async {
    http.Response response = await http.post(
        Uri.parse(BackendConfigs.kBaseUrl + EndPoints.kLogin),
        body: jsonEncode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'});
    log(response.request!.url.toString());
    log(response.reasonPhrase.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(LoginResponseModel.fromJson(jsonDecode(response.body)));
    } else if (response.statusCode == 400) {
      return Left(
          ErrorModel(success: false, message: "Email or Password is invalid."));
    } else if (response.statusCode == 401) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! You are not allowed to perform this operation"));
    } else if (response.statusCode == 404) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! Your requested data does not exist."));
    } else if (response.statusCode == 500) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! We are unable to connect our servers."));
    } else {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! Something went wrong. Please try again later."));
    }
  }
  //Get User Data
  Future<Either<ErrorModel, UserModel>> getUserProfile({required String token}) async {
    log(token);
    http.Response response = await http.get(
        Uri.parse(BackendConfigs.kBaseUrl + EndPoints.kGetProfile),
        headers: {'Authorization': token});

    if (response.statusCode == 200 || response.statusCode == 201) {
      // return UserModel.fromJson(jsonDecode(response.body));
      return Right(UserModel.fromJson(jsonDecode(response.body)));
    }  else if (response.statusCode == 400) {
      return Left(
          ErrorModel(success: false, message: "Email or Password is invalid."));
    } else if (response.statusCode == 401) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! You are not allowed to perform this operation."));
    } else if (response.statusCode == 404) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! Your requested data does not exist."));
    } else if (response.statusCode == 500) {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! We are unable to connect our servers."));
    } else {
      return Left(ErrorModel(
          success: false,
          message: "Sorry! Something went wrong. Please try again later."));
    }
  }

}
