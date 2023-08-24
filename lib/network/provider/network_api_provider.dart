import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:http/http.dart' as http;
import 'package:starlinex_courier/network/api/requests/airway_info_request.dart';
import '../../app/utils/app_preference.dart';
import '../../app/utils/app_strings.dart';
import '../api/api_exceptions.dart';
import '../api/api_urls.dart';
import 'base_api_provider.dart';

class NetworkApiProvider extends BaseApiProvider{

  @override
  Future getApiResponse(String url) async {
    String token=AppPreference.getString(AppStrings.authToken) ?? '';
    print('AUTHTOKEN==>$token');
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse('${ApiUrls.baseUrl}$url'),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future postApiResponse(String url, data) async {
    String token=AppPreference.getString(AppStrings.authToken) ?? '';
    print('AUTHTOKEN==>$token');
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse('${ApiUrls.baseUrl}$url'),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
          body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future assetApiResponse(String url,AirwayInfoRequest airwayInfoRequest) async {
    String token=AppPreference.getString(AppStrings.authToken) ?? '';
    print('AUTHTOKEN==>$token');
    try {
      var headers= {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      };
      final request = http.MultipartRequest('POST',Uri.parse('${ApiUrls.baseUrl}$url'));
      request.headers.addAll(headers);
      var docsPath=airwayInfoRequest.docs ?? [];
      if(docsPath.isNotEmpty){
        for (var element in docsPath) {
          request.files.add(http.MultipartFile('doc',
              File(element).readAsBytes().asStream(), File(element).lengthSync(),
              filename: element.split("/").last));
        }
      }
      if (kDebugMode) {
        log('JSONDATA====>${jsonEncode(airwayInfoRequest.json)}');
      }
      request.fields['airWay']=jsonEncode(airwayInfoRequest.json);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      return jsonDecode(responseString);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        log(responseJson.toString());
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error Occurred while communicating with server with status code : ${response.body.toString()} ');
    }
  }


}