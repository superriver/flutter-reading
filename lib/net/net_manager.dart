import 'package:dio/dio.dart';
import 'package:flutter_reading/generated/json/base/json_convert_content.dart';
import 'package:flutter_reading/net/paser.dart';

typedef RequestSuccess = void Function(dynamic result);
typedef RequestFailure = void Function(int code, String desc);
typedef ParseResult = dynamic Function(Map<String,dynamic> json);

class NetManager {
  factory NetManager.getInstance() => _instance;

  NetManager._(){
    _initDio();
  }
  _initDio(){
    _dio = Dio(BaseOptions(
      connectTimeout: _defaultConnectTimeout,
      receiveTimeout: _defaultReceiveTimeout,
      headers: {
        "Content-Type":_contentType,
        "Accept":_accept
      },
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json
    ));
    // (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseResponse
  }

  static final _instance = NetManager._();
  Dio _dio; // 使用默认配置
  int _defaultConnectTimeout = 30*1000;
  int _defaultReceiveTimeout = 30*1000;
  String _contentType = "application/json";
  String _accept = "application/json";

  void post<T>(String path, Function onRequestSuccess,{params,ParseResult parseResult})  async{
    Response response = await _dio.post(path,queryParameters: params);
    T data = JsonConvert.fromJsonAsT<T>(response.data);
    onRequestSuccess(data);
  }

  void get<T>(String path, Function onRequestSuccess,{params,ParseResult parseResult}) async{
    Response response = await _dio.get(path,queryParameters: params);
    T data = JsonConvert.fromJsonAsT<T>(response.data);
    onRequestSuccess(data);
  }

  //   parseResponse(Response response){
  //
  // }
}

// abstract class ResultStateListener<T>{
//   void onSuccess(T data);
//
//   /// 响应成功，但是出错的情况
//   ///
//   /// @param code    错误码
//   /// @param message 错误信息
//    void onError(int code, String message);
//   /// 请求失败的情况
//   ///
//   /// @param message 失败信息
//    void onFailure(String message) ;
// }