
import 'package:starlinex_courier/network/api/requests/airway_info_request.dart';

abstract class BaseApiProvider {
  Future<dynamic> getApiResponse(String url);
  Future<dynamic> postApiResponse(String url, dynamic data);
  Future<dynamic> assetApiResponse(String url, AirwayInfoRequest request);
}
