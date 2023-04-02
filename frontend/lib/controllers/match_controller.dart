import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/tag_model.dart';
import 'package:frontend/models/user_model.dart';

abstract class IMatchController {
  Future<List<User>> getMatches(List<Tag> tags);
}

class MatchController implements IMatchController {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.134.109:8081',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
  ));

  @override
  Future<List<User>> getMatches(List<Tag> tags) async {
    final fakeRes = await Future.delayed(
        Duration(seconds: 3),
        () => [
              User(
                'username1',
                'email',
                'Very loong bio idk..asdasdasd',
                23,
                'Blagoevgrad',
                'Bulgaria',
                'female',
                RelationshipStatus.available,
                [Tag(1, 'sport')],
              )
            ]);
    return fakeRes;
  }
}
