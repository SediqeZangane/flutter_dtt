import 'package:dio/dio.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';

class DioClient {
  Dio _dio = Dio();

  Future<List<HouseModel>> getHouse() async {
    const url = 'https://intern.d-tt.nl/api/house';
    Response<List<Map<String, dynamic>>> response =
        await _dio.get<List<Map<String, dynamic>>>(url,
            options: Options(
              headers: {"Access-Key": "98bww4ezuzfePCYFxJEWyszbUXc7dxRx"},
            ));
    return response.data?.map((e) => HouseModel.fromJson(e)).toList() ?? [];
  }
}
