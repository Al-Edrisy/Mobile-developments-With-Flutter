import '../models/post.dart';
import 'api_client.dart';

class PostService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Post>> fetchPosts() async {
    final List<dynamic> data = await _apiClient.get('/posts');
    return data.map((json) => Post.fromJson(json)).toList();
  }

  Future<Post> fetchPost(int id) async {
    final Map<String, dynamic> data = await _apiClient.get('/posts/$id');
    return Post.fromJson(data);
  }
}
