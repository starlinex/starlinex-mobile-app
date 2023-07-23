import 'package:get_it/get_it.dart';
import '../../app/app_repository.dart';
import '../../app/source/remote_data_source.dart';

final locator=GetIt.instance;


void initServiceLocator(){
  locator.registerSingleton(AppRepository(appDataSource: RemoteDataSource()));
}