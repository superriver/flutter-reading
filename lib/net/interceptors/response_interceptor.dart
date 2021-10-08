
import 'package:dio/dio.dart';
import 'package:flutter_reading/net/my_converter.dart';
import 'package:flutter_reading/net/net_result.dart';

class ResponseInterceptors<T> extends InterceptorsWrapper{

  @override
  Future<T> onResponse(Response response) {
    // RequestOptions options = response.request;
    // MyConverter converter = MyConverter();
    var value;
    // T data;
    try{
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value = new NetResult(response.data, "操作成功", 200);
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        value = new NetResult(response.data, "操作成功", 200);
      }

       // data = converter.convert(response.data);
    }catch(e){
      value = new NetResult(response.data, "操作成失败", response.statusCode,);
    }
    return value;
  }

}