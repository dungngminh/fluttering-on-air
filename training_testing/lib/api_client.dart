import 'package:http/http.dart';

class ApiClient {
  final Client client;

  ApiClient(this.client);

  Future<String> getData() async {
    try {
      final url = Uri.parse('');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Not 200");
      }
    } catch (e) {
      throw Exception("Some errors happend");
    }
  }
}
