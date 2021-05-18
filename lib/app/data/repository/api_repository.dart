
import 'package:get_x_template/app/data/model/user.dart';

abstract class ApiRepository{
  Future<List<User>> getRequest();
  Future<User> postRequest(Map<String,dynamic> map);
  Future<User> updateRequest(String id,Map<String,dynamic> map);
  Future<void> deleteRequest(String id);
}