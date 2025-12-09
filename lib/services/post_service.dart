
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task2/model/posts_model.dart';

class PostService{
   static const String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

   Future <List<Posts>> fetchPosts() async{
    final url = Uri.parse(_baseUrl);

    final response = await http.get(url);

    if(response.statusCode == 200){
      /// success- show data
      final List<dynamic> data = jsonDecode(response.body);

      final List<Posts> posts = data.map((value)=> Posts.fromJson(value)).toList();

      return posts;
    }
    else{
      ///Failed -show Error
    throw Exception('Failed to load data: ${response.statusCode}');
    }
   }
}