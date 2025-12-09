import 'package:flutter/material.dart';
import 'package:task2/controller/posts_controller.dart';
import '../model/posts_model.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  late final PostController _controller ;
  late Future<List<Posts>> _postsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PostController();
    _postsList = _controller.getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Posts', style: TextStyle(fontSize: 15)),
      ),
      body: FutureBuilder<List<Posts>>(
          future: _postsList,
          builder: (context, snapshot){
            ///Loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          ///Error
          else if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'),);
          }
          ///Data
          else if(snapshot.hasData){
            final posts = snapshot.data ?? [];
            if(posts.isEmpty){
              return const Center(child: Text('No posts available'),);
            }
            else{
              return ListView.separated(
                  itemBuilder: (context,index){
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  leading: CircleAvatar(child: Text(post.id.toString(),)),
                );},
                  separatorBuilder: (context, index) => const Divider(height: 1,),
                  itemCount: posts.length);
            }
            }
          else{
            return const Center(child: Text('No data available'),);
          }
          }

    )


    );
  }
}