import 'package:dio/dio.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';

class DioClient {
  Dio _dio = Dio();

  Future<void> getHouse() async {
    const url = 'https://intern.d-tt.nl/api/house';
    Response response = await _dio.get(url,
        options: Options(
          headers: {"Access-Key": "98bww4ezuzfePCYFxJEWyszbUXc7dxRx"},
        ));
    print(response.data);
  }
}
