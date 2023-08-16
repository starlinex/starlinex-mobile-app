import 'package:starlinex_courier/network/api/models/service_list_model.dart';
import 'package:starlinex_courier/network/api/models/shipment_item_model.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';

import '../../network/api/api_response.dart';
import '../../network/api/models/register_model.dart';
import '../../network/api/requests/login_register_request.dart';

abstract class AppDataSource{

  Future<ApiResponse<RegisterModel>> emailLogin(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> register(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> verifyOtp(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> resetPassword(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> forgotPassword(LoginRegisterRequest request);

  Future<ApiResponse<ServiceListModel>> getServices();

  Future<ApiResponse<ShipmentItemModel>> searchShipmentItem(CommonRequest request);

}