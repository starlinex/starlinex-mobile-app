import 'package:starlinex_courier/app/source/app_data_source.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';
import 'package:starlinex_courier/network/api/models/service_list_model.dart';
import 'package:starlinex_courier/network/api/models/shipment_item_model.dart';
import 'package:starlinex_courier/network/api/models/store_airway_info_model.dart';
import 'package:starlinex_courier/network/api/requests/airway_info_request.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';
import '../../network/api/api_response.dart';
import '../../network/api/api_urls.dart';
import '../../network/api/models/register_model.dart';
import '../../network/api/models/reset_password_model.dart';
import '../../network/api/requests/login_register_request.dart';
import '../../network/provider/network_api_provider.dart';

class RemoteDataSource extends AppDataSource{

  NetworkApiProvider networkApiProvider=NetworkApiProvider();

  @override
  Future<ApiResponse<RegisterModel>> emailLogin(LoginRegisterRequest request) async {
    try {
      var json={
        "email":request.email,
        "password":request.password,
      };
      var response = await networkApiProvider.postApiResponse(
          ApiUrls.login,json
      );
      final model = RegisterModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<RegisterModel>> register(LoginRegisterRequest request) async {
    try {
      var json={
        "name":request.name,
        "email":request.email,
        "phone":request.phone,
        "password":request.password,
      };
      var response = await networkApiProvider.postApiResponse(
          ApiUrls.register,json
      );
      final model = RegisterModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<RegisterModel>> verifyOtp(LoginRegisterRequest request) async {
    try {
      var json={
        "id":request.userId,
        "otp":request.otp,
      };
      var response = await networkApiProvider.postApiResponse(
          ApiUrls.verifyOtp,json
      );
      final model = RegisterModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<ResetPasswordModel>> resetPassword(LoginRegisterRequest request) async {
    try {
      var json={
        "otp":request.otp,
        "id":request.userId,
        "password":request.password,
      };
      var response = await networkApiProvider.postApiResponse(
          ApiUrls.resetPassword,json
      );
      final model = ResetPasswordModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<RegisterModel>> forgotPassword(LoginRegisterRequest request) async {
    try {
      var json={
        "email":request.email,
      };
      var response = await networkApiProvider.postApiResponse(
          ApiUrls.forgetPassword,json
      );
      final model = RegisterModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<ServiceListModel>> getServices() async {
    try {
      var response = await networkApiProvider.getApiResponse(
          ApiUrls.services
      );
      final model = ServiceListModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<ShipmentItemModel>> searchShipmentItem(CommonRequest request) async {
    try {
      var response = await networkApiProvider.getApiResponse(
          '${ApiUrls.searchShipmentItem}=${request.search}');
      final model = ShipmentItemModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<ResetPasswordModel>> storeAirwayInfo(AirwayInfoRequest request) async {
    try {
      print('nfdnfi');
      var response = await networkApiProvider.assetApiResponse(
          ApiUrls.storeAirwayInfo,request);
      final model = ResetPasswordModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<BookingHistoryModel>> bookingHistory(CommonRequest request) async {
    try {
      var response = await networkApiProvider.getApiResponse(
          '${ApiUrls.bookingHistory}/${request.userId}');
      final model = BookingHistoryModel.fromJson(response);
      if (model.responseCode == 200) {
        return ApiResponse.success(model);
      } else {
        return ApiResponse.error(model.message ?? 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

}