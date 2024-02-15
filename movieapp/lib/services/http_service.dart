import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/model/app_config.dart';

class HttpService{
  final Dio dio=Dio();
  final GetIt getIt=GetIt.instance;

  String? _base_url;
  String? _api_key;
  
  HttpService(){
    AppConfig _config=getIt.get<AppConfig>();
    _base_url=_config.BASE_API_URL;
    _api_key=_config.API_KEY;
  }

  // ignore: body_might_complete_normally_nullable
  Future<Response?> get(String _path,{Map<String,dynamic>? query})async {
    try {
      String _url="$_base_url$_path";
      Map<String, dynamic> _query={"apikey":_api_key,"language":"en-US"};
      if(query!=null){
        _query.addAll(query);
      }
      return await  dio.get(_url,queryParameters:_query,options: Options(validateStatus: (_) => true,contentType: Headers.jsonContentType,responseType: ResponseType.json));
    }on DioException catch (e) {
      print("unable to show ");
      print("DioError:$e");
    }
  }
}