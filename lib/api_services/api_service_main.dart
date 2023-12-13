import 'dart:developer';

import 'package:asm_gegadyne/utils/toast_notify.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  // static const BASE = 'https://api.seeltechnologies.com/api'; //For live server
  static const BASE =
      'http://192.168.100.45:4000/api/'; //For development server

  static const LOGIN = BASE + '/users/login';
  static const FETCH_ASSET_BYID = BASE + '/';
  static getData(raw) async {
    print("raw response ===> $raw");

    try {
      // Map<String, dynamic> json = raw;

      final success = raw['success'];
      // final code = json['code'];
      final String msg = raw['msg'];

      if (msg != "" && msg.isNotEmpty && msg != "Success") toast(msg);
      return raw['data'];
    } catch (e) {
      // toast("oops something went wrong!");
      print('api parse error:' + e.toString());
    }
  }

  static postForm(url, data, {auth = false, put = false}) async {
    print("api url ===> $url");
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    Dio.Response response;
    var dio = Dio.Dio();
    var formData = Dio.FormData.fromMap(data);
    print("token ===> $token");

    dio.options.headers = {'authorization': 'Bearer $token'};

    //print("dio header ===> ${dio.options.headers}");
    try {
      //print("form data ===> $formData");
      if (put) {
        response = await dio.put(
          url,
          data: formData,
        );
        //print("response form ===> $response");
      } else {
        response = await dio.post(
          url,
          data: formData,
        );
        //print("response form ===> $response");
      }
    } on Dio.DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        response = Dio.Response(
            requestOptions: Dio.RequestOptions(path: url),
            data: {'status': false, 'message': e.message});
        // Something happened in setting up or sending the request that triggered an Error
        print(e.message);
      }
    }
    return getData(response.data);
  }

  static post(url, data, {auth = true, put = false}) async {
    print("url ====> $url");
    print("request data ====> $data");

    // print("auth token ---> ${authc.token.value}");
    Dio.Response response;
    var dio = Dio.Dio();
    if (auth) {
      var prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      dio.options.headers = {'authorization': 'Bearer $token'};
    }

    //print("dio header ===> ${dio.options.headers}");
    try {
      if (put) {
        response = await dio.put(url, data: data);
      } else {
        response = await dio.post(url, data: data);
        print("response in post function ==> $response");
      }
    } on Dio.DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        response = Dio.Response(
            requestOptions: Dio.RequestOptions(path: url),
            data: {'status': false, 'message': e.message});
        // Something happened in setting up or sending the request that triggered an Error
        print('api error: ${e.message}');
      }
    }
    return getData(response.data);
  }

  static get(url, data, {auth = true}) async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);
    Dio.Response response;
    var dio = Dio.Dio();
    if (auth) {
      dio.options.headers = {
        "Authorization": "Bearer $token",

        // "Authorization":
        //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlTmFtZSI6IlNQIiwicG9ydGFscyI6WyJXRUJTSVRFIl0sInJvbGVJZCI6NCwiZW50aXR5SWQiOiI2MzIyZGQ5YTEwYWRlYWFjZmRkMmU2ZjEiLCJpbnRlbnRzIjpbIkFVVEgiXSwiaWF0IjoxNjY0MjY2NDk4LCJleHAiOjE2NjY4NTg0OTgsImF1ZCI6IkpNUiBXRUIiLCJpc3MiOiJKTVIiLCJzdWIiOiJBVVRIIFNFUlZJQ0UifQ.zMfkraCir7HBa36KdHMyz-L2VRiyGldgNjdTnnhfyoE",
        'Accept-Language': 'en'
      };
    } else {
      dio.options.headers = {'Accept-Language': 'en'};
    }

    try {
      if (data == null) {
        log("$url ::: $data");

        response = await dio.get(url);
        print("response in get function =====> $response");
      } else {
        log("$url ::: $data");
        response = await dio.get(url, queryParameters: data);
      }
    } on Dio.DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        response = Dio.Response(
            requestOptions: Dio.RequestOptions(path: url),
            data: {'status': false, 'message': e.message});
        // Something happened in setting up or sending the request that triggered an Error
        print(e.message);
      }
    }

    return getData(response.data);
  }

  // static delete(url, data, {auth = true}) async {
  //   LoginController authc = Get.find();
  //   Dio.Response response;
  //   var dio = Dio.Dio();
  //   if (auth) {
  //     dio.options.headers = {
  //       'Authorization': 'bearer ' + authc.token.value,
  //       'Accept-Language': 'en'
  //     };
  //   } else {
  //     dio.options.headers = {'Accept-Language': 'en'};
  //   }

  //   try {
  //     response = await dio.delete(url, data: data);
  //   } on Dio.DioError catch (e) {
  //     if (e.response != null) {
  //       response = e.response!;
  //     } else {
  //       response = Dio.Response(
  //           requestOptions: Dio.RequestOptions(path: url),
  //           data: {'status': false, 'message': e.message});
  //       // Something happened in setting up or sending the request that triggered an Error
  //       print(e.message);
  //     }
  //   }
  //   return getData(response.data);
  // }
}
