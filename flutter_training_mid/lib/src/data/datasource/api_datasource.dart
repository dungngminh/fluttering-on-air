import 'package:flutter_training_mid/src/utils/app_utils.dart';
import 'package:http/http.dart';

class Apidatasource {
  final Client http;

  Apidatasource(this.http);

  Future<String> getMethod() async {
    try {
      const String url =
          "https://raw.githubusercontent.com/DevTides/DogsApi/master/dogs.json?fbclid=IwAR1J8V0aEe9JQf0FxkMP_NWRjK0Qg9AAwzZWg6Hh4g-yeesSCKPLBgbh-_g";
      final Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        AppUtils.logger("200", location: runtimeType);
        return response.body;
      } else {
        AppUtils.logger("NOT OK", location: runtimeType);
        throw Exception();
      }
    } catch (e) {
      AppUtils.logger(e, location: runtimeType);
      rethrow;
    }
  }
}
