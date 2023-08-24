import 'package:get/get.dart';
import 'package:starlinex_courier/ui/add_awb_screen.dart';
import 'package:starlinex_courier/ui/add_shipment_item_screen.dart';
import 'package:starlinex_courier/ui/add_special_service_screen.dart';
import 'package:starlinex_courier/ui/add_weight_screen.dart';
import 'package:starlinex_courier/ui/booking_details_screen.dart';
import 'package:starlinex_courier/ui/booking_history_screen.dart';
import 'package:starlinex_courier/ui/home_screen.dart';
import 'package:starlinex_courier/ui/login_screen.dart';
import 'package:starlinex_courier/ui/otp_verification_screen.dart';
import 'package:starlinex_courier/ui/receiver_details_screen.dart';
import 'package:starlinex_courier/ui/register_screen.dart';
import 'package:starlinex_courier/ui/reset_password_screen.dart';
import 'package:starlinex_courier/ui/shipment_invoice_items_screen.dart';
import 'package:starlinex_courier/ui/shipment_invoice_screen.dart';
import 'package:starlinex_courier/ui/shipper_details_screen.dart';
import 'package:starlinex_courier/ui/special_service_screen.dart';
import 'package:starlinex_courier/ui/splash_screen.dart';
import 'package:starlinex_courier/ui/weight_details_screen.dart';


class AppRoutes{
  static String splash='/splash';
  static String login='/login';
  static String register='/register';
  static String otpVerify='/otpVerify';
  static String resetPassword='/resetPassword';
  static String home='/home';
  static String addAwb='/addAwb';
  static String shipperDetails='/shipperDetails';
  static String receiverDetails='/receiverDetails';
  static String weightDetails='/weightDetails';
  static String addWeight='/addWeight';
  static String specialService='/specialService';
  static String shipmentInvoice='/shipmentInvoice';
  static String shipmentInvoiceItems='/shipmentInvoiceItems';
  static String addShipmentItem='/addShipmentItem';
  static String addSpecialServiceScreen='/addSpecialServiceScreen';
  static String bookingHistory='/bookingHistory';
  static String bookingDetails='/bookingDetails';
}

final getPages=[
  GetPage(name: AppRoutes.splash,page:()=>const SplashScreen()),
  GetPage(name: AppRoutes.login,page:()=>const LoginScreen()),
  GetPage(name: AppRoutes.register,page:()=>const RegisterScreen()),
  GetPage(name: AppRoutes.otpVerify,page:()=>const OtpVerificationScreen()),
  GetPage(name: AppRoutes.resetPassword,page:()=>const ResetPasswordScreen()),
  GetPage(name: AppRoutes.home,page:()=>const HomeScreen()),
  GetPage(name: AppRoutes.addAwb,page:()=>const AddAwbScreen()),
  GetPage(name: AppRoutes.shipperDetails,page:()=>const ShipperDetailsScreen()),
  GetPage(name: AppRoutes.receiverDetails,page:()=>const ReceiverDetailsScreen()),
  GetPage(name: AppRoutes.weightDetails,page:()=>const WeightDetailsScreen()),
  GetPage(name: AppRoutes.specialService,page:()=>const SpecialServiceScreen()),
  GetPage(name: AppRoutes.shipmentInvoice,page:()=>const ShipmentInvoiceScreen()),
  GetPage(name: AppRoutes.shipmentInvoiceItems,page:()=>const ShipmentInvoiceItemsScreen()),
  GetPage(name: AppRoutes.addWeight,page:()=>const AddWeightScreen()),
  GetPage(name: AppRoutes.addShipmentItem,page:()=>const AddShipmentItemScreen()),
  GetPage(name: AppRoutes.addSpecialServiceScreen,page:()=>const AddSpecialServiceScreen()),
  GetPage(name: AppRoutes.bookingHistory,page:()=>const BookingHistoryScreen()),
  GetPage(name: AppRoutes.bookingDetails,page:()=>const BookingDetailsScreen())
];