import 'package:get/get.dart';
import 'package:get_x_template/app/data/model/user.dart';
import 'package:get_x_template/app/data/repository/api_repository.dart';
import 'package:get_x_template/app/data/repository/api_repository_impl.dart';

class HomeController extends GetxController {
  ApiRepository apiRepository;
  RxList<User> users;
  RxBool isLoaded = false.obs;

  static HomeController get to => Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    apiRepository = Get.find<ApiRepositoryImpl>();
    getUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

 void getUsers()async{
    final result = await apiRepository.getRequest();
    if(result!= null){
      users = result.obs;
      isLoaded.toggle();
      print("loaded");
    }else{
      print("No data recieved");
    }
 }

}
