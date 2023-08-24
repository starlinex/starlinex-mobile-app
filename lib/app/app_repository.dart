import 'package:starlinex_courier/app/source/app_data_source.dart';
import 'package:starlinex_courier/network/api/api_response.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';
import 'package:starlinex_courier/network/api/models/register_model.dart';
import 'package:starlinex_courier/network/api/models/reset_password_model.dart';
import 'package:starlinex_courier/network/api/models/service_list_model.dart';
import 'package:starlinex_courier/network/api/models/shipment_item_model.dart';
import 'package:starlinex_courier/network/api/models/store_airway_info_model.dart';
import 'package:starlinex_courier/network/api/requests/airway_info_request.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';
import 'package:starlinex_courier/network/api/requests/login_register_request.dart';

class AppRepository extends AppDataSource{

  AppDataSource appDataSource;
  AppRepository({required this.appDataSource});

  @override
  Future<ApiResponse<RegisterModel>> emailLogin(LoginRegisterRequest request) {
    return appDataSource.emailLogin(request);
  }

  @override
  Future<ApiResponse<RegisterModel>> register(LoginRegisterRequest request) {
    return appDataSource.register(request);
  }

  @override
  Future<ApiResponse<RegisterModel>> verifyOtp(LoginRegisterRequest request) {
    return appDataSource.verifyOtp(request);
  }

  @override
  Future<ApiResponse<ResetPasswordModel>> resetPassword(LoginRegisterRequest request) {
    return appDataSource.resetPassword(request);
  }

  @override
  Future<ApiResponse<RegisterModel>> forgotPassword(LoginRegisterRequest request) {
    return appDataSource.forgotPassword(request);
  }

  @override
  Future<ApiResponse<ServiceListModel>> getServices() {
    return appDataSource.getServices();
  }

  @override
  Future<ApiResponse<ShipmentItemModel>> searchShipmentItem(CommonRequest request) {
    return appDataSource.searchShipmentItem(request);
  }

  @override
  Future<ApiResponse<ResetPasswordModel>> storeAirwayInfo(AirwayInfoRequest request) {
    return appDataSource.storeAirwayInfo(request);
  }

  @override
  Future<ApiResponse<BookingHistoryModel>> bookingHistory(CommonRequest request) {
    return appDataSource.bookingHistory(request);
  }

}