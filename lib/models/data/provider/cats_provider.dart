import 'package:http/http.dart' as http;

class CatsProvider {
  Future<String> getCatsRandom() async {
    Uri uri = Uri.parse('https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=20');
    try {
      http.Response response = await http.get(uri);
      return response.body;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getDetail(String id) async {
    Uri uri = Uri.parse('https://cat-fact.herokuapp.com/facts/$id');
    try {
      http.Response response = await http.get(uri);
      return response.body;
    } catch (e) {
      return e.toString();
    }
  }
}
