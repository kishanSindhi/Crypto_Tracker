import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String uri;

  NetworkHelper({required this.uri});

  Future<dynamic> getDataFromAPI() async {
    http.Response response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      return response.statusCode;
    }
  }
}
