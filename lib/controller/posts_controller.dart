
import 'package:task2/model/posts_model.dart';
import 'package:task2/services/post_service.dart';

 class PostController{
 final PostService service = PostService();

 Future <List<Posts>> getPosts(){
   return service.fetchPosts();
 }
 }