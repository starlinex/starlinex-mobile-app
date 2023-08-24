import 'package:get/get.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';
import '../app/app_repository.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../network/api/api_response.dart';
import '../network/provider/service_locator.dart';

enum BookingListStatus{loading,loaded,error,empty}

class BookingHistoryController extends GetxController {

  var mLoading = false.obs;
  ApiResponse<BookingHistoryModel>? data;
  var bookingStatus=BookingListStatus.loading;


  Future<ApiResponse<BookingHistoryModel>?> getBookingHistory() async {
    String userId=AppPreference.getString(AppStrings.userId).toString();
    var request = CommonRequest(userId: userId);
    var response = await locator<AppRepository>().bookingHistory(request);
    if (response.isSuccess()) {
      data= ApiResponse.success(response.data());
      if(data?.data()!=null && data!.data().response!.isNotEmpty){
        bookingStatus=BookingListStatus.loaded;
      }else{
        bookingStatus=BookingListStatus.empty;
      }
    } else {
      data= ApiResponse.error(response.error());
      bookingStatus=BookingListStatus.error;
    }
    update();
    return null;
  }

}
