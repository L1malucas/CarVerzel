// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/Services/admin_request.dart';
import '../Models/car_model.dart';
import '../utils/constants.dart';

String adminToken = LoginService.jwtAdminToken!;

class CarrosApi {
  static const baseUrl = '${Constants.apiAzure}/carros';

  static Future<CarModel> fetchCarro(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    print(baseUrl);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final carModel = CarModel.fromJson(jsonData);
      print(
          '{$carModel.id} ${carModel.marca} ${carModel.modelo}${carModel.preco}');
      return carModel;
    } else {
      throw Exception('Failed to fetch carro');
    }
  }

  static Future<List<CarModel>> getTodosCarros() async {
    final response = await http.get(Uri.parse(baseUrl));
    print(baseUrl);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch carros');
    }
  }

  static Future<CarModel> postCarro(String token, CarModel carro) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $adminToken',
      },
      body: jsonEncode(carro.toJson()),
    );

    if (response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      return CarModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to create carro');
    }
  }

  static Future<void> putCarro(String token, int id, CarModel carro) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $adminToken',
      },
      body: jsonEncode(carro.toJson()),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update carro');
    }
  }

  static Future<void> deleteCarro(String token, int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $adminToken',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete carro');
    }
  }
}
