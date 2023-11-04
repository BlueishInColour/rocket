import 'package:http/http.dart' as http;

class Url {
  const Url();

  //base url
  final String baseUrl = 'http://localhost:8080';

  //simple return uri instead of string
  Uri uri(String url) {
    return Uri.parse(url);
  }

  Uri pingUrl() {
    return uri(baseUrl);
  }

//for blog page
  Uri blogUploadPost() {
    return uri('$baseUrl/blog/upload');
  }

  Uri blogLikePost(String articleId) {
    return uri('$baseUrl/blog/like/$articleId');
  }

  Uri blogSeePost(String articleId) {
    return uri('$baseUrl/blog/like/$articleId');
  }

  Uri blogRePost(String articleId) {
    return uri('$baseUrl/blog/repost/$articleId');
  }

  //for shorts page

  Uri shortsLikePost(String id) {
    return uri('$baseUrl/db/shorts/like');
  }

  Uri shortsDislikePost(String id) {
    return uri('$baseUrl/db/shorts/like0$id');
  }

  //for shop page

  Uri shopLikeGoods(String goodsId) {
    return uri('$baseUrl/shop/like/$goodsId ');
  }

  Uri shopPreorderGoods(String goodsId) {
    return uri('$baseUrl/shop/preorder/$goodsId ');
  }

  Uri shopResellGoods(String goodsId) {
    return uri('$baseUrl/shop/resell/$goodsId ');
  }

  Uri shopCartGoods(String goodsId) {
    return uri('$baseUrl/shop/cart/$goodsId ');
  }
}
