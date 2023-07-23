import 'package:starlinex_courier/app/source/app_data_source.dart';
import '../../network/api/api_response.dart';
import '../../network/api/api_urls.dart';
import '../../network/api/models/register_model.dart';
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
        "device_type":request.deviceType,
        "fcm_token":request.fcmToken,
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
  Future<ApiResponse<RegisterModel>> resetPassword(LoginRegisterRequest request) async {
    try {
      var json={
        "otp":request.otp,
        "id":request.userId,
        "password":request.password,
      };
      var response = await networkApiProvider.postApiResponse(
          ApiUrls.resetPassword,json
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

}