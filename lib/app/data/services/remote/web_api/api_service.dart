import 'package:dio/dio.dart';
import 'package:get_x_template/app/data/model/user.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/users")
abstract class ApiService{

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create(){
    final client = Dio();
    client.interceptors.add(PrettyDioLogger());
    
    return ApiService(client);
  }

  @GET("")
  Future<List<User>> getRequest();

  @POST("")
  Future<User> postRequest(@Body() User user,);

  @PATCH("/{id}")
  Future<User> updateRequest(@Path() String id, @Body() User user);

  @DELETE("/{id}")
  Future<void> deleteTask(@Path() String id);
}