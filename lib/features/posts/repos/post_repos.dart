import 'dart:convert';
import 'dart:math';

import 'package:news_app/features/posts/models/post_model_data.dart';
import 'package:http/http.dart' as http;

class SportsRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response =
          await client.get(Uri.https('newsdata.io', '/api/1/latest', {
        'country': 'ee',
        'category': 'sports',
        'apikey': 'pub_50535cfe5bac00cb00d2b9592bdbe32c60fc1'
      }));

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> results = jsonResponse['results'] as List<dynamic>;

      for (var result in results) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }
}

class WorldRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response =
          await client.get(Uri.https('newsdata.io', '/api/1/latest', {
        'country': 'ee',
        'category': 'world',
        'apikey': 'pub_50535cfe5bac00cb00d2b9592bdbe32c60fc1'
      }));

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> results = jsonResponse['results'] as List<dynamic>;

      for (var result in results) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }
}

class BusinessRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response =
          await client.get(Uri.https('newsdata.io', '/api/1/latest', {
        'country': 'ee',
        'category': 'business',
        'apikey': 'pub_50535cfe5bac00cb00d2b9592bdbe32c60fc1'
      }));

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> results = jsonResponse['results'] as List<dynamic>;

      for (var result in results) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }
}

class HealthRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response =
          await client.get(Uri.https('newsdata.io', '/api/1/latest', {
        'country': 'ee',
        'category': 'health',
        'apikey': 'pub_50535cfe5bac00cb00d2b9592bdbe32c60fc1'
      }));

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> results = jsonResponse['results'] as List<dynamic>;

      for (var result in results) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }
}

class EnvironmentRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response =
          await client.get(Uri.https('newsdata.io', '/api/1/latest', {
        'country': 'ee',
        'category': 'environment',
        'apikey': 'pub_50535cfe5bac00cb00d2b9592bdbe32c60fc1'
      }));

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> results = jsonResponse['results'] as List<dynamic>;

      for (var result in results) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }
}