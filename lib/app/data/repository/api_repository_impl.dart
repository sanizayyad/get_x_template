import 'package:get/get.dart';
import 'package:get_x_template/app/data/model/user.dart';
import 'package:get_x_template/app/data/repository/api_repository.dart';
import 'package:get_x_template/app/data/services/remote/web_api/api_service.dart';

class ApiRepositoryImpl implements ApiRepository{
  ApiService _apiService;

  ApiRepositoryImpl(){
    _apiService = Get.put(ApiService.create());
  }

  @override
  Future<void> deleteRequest(String id) {
    // TODO: implement deleteRequest
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getRequest() async {
    List<User> users;
    try {
      users = await _apiService.getRequest();
    }  catch (e) {
      // TODO
      print(e.toString());
    }
    return users;
  }

  @override
  Future<User> postRequest(Map<String, dynamic> map) {
    // TODO: implement postRequest
    throw UnimplementedError();
  }

  @override
  Future<User> updateRequest(String id, Map<String, dynamic> map) {
    // TODO: implement updateRequest
    throw UnimplementedError();
  }


}