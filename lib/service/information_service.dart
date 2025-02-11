import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tomacare/domain/entities/information.dart';
import 'package:tomacare/presentation/misc/constant/app_constant.dart';
import 'package:tomacare/service/save_auth.dart';

class InformationService {
  final SaveAuth saveService = SaveAuth();

  Future<List<Information>> getInformationAll() async {
    final String? token = await saveService.getToken();
    final url = Uri.parse('$baseurl/information');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    };
    final response = await http.get(url, headers: headers);

    if (response.statusCode == HttpStatus.ok) {
      final List data = jsonDecode(response.body);
      final List<Information> informations =
          data.map((json) => Information.fromJson(json)).toList();
      return informations;
    } else {
      throw Exception(jsonDecode(response.body));
    }
  }

  Future<Information> getInformation(int index) async {
    final String? token = await saveService.getToken();
    final url = Uri.parse('$baseurl/information/$index');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      final data = Information.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception();
    }
  }
}
