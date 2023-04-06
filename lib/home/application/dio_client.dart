import 'package:dio/dio.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<List<HouseModel>> getHouse() async {
    const url = 'https://intern.d-tt.nl/api/house';
    Response<List<dynamic>> response =
        await _dio.get<List<dynamic>>(url,
            options: Options(
              headers: {"Access-Key": "98bww4ezuzfePCYFxJEWyszbUXc7dxRx"},
            ));
    return response.data?.map((e) => HouseModel.fromJson(e)).toList() ?? [];
  }
}
