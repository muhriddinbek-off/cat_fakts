import 'dart:convert';

import 'package:cat_fakts/models/core/cat_info/cat_info.dart';
import 'package:cat_fakts/models/core/cats_random/cats_random.dart';
import 'package:cat_fakts/models/data/provider/cats_provider.dart';

class CatsRepository {
  final CatsProvider catsProvider;
  CatsRepository(this.catsProvider);
  Future<List<CatsFakts>> getRandom() async {
    final data = await catsProvider.getCatsRandom();
    try {
      final fakts = jsonDecode(data);
      List<CatsFakts> catsFaktsData = [];
      fakts.forEach((e) {
        catsFaktsData.add(CatsFakts.fromJson(e));
      });
      return catsFaktsData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CatsDetail> getCatInfo(String id) async {
    final data = await catsProvider.getDetail(id);
    try {
      Map<String, dynamic> info = jsonDecode(data);

      return CatsDetail.fromJson(info);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
