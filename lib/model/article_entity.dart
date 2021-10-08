import 'package:flutter_reading/generated/json/base/json_convert_content.dart';
import 'package:flutter_reading/generated/json/base/json_field.dart';

class ArticleEntity with JsonConvert<ArticleEntity> {
	String category;
	List<ArticleData> data;
	String hot;
	int status;
	int total_counts;
}

class ArticleData with JsonConvert<ArticleData> {
	@JSONField(name: "_id")
	String id;
	String author;
	String category;
	String createdAt;
	String desc;
	List<String> images;
	int likeCounts;
	String publishedAt;
	int stars;
	String title;
	String type;
	String url;
	int views;
}
class ArticleDetailModel with JsonConvert<ArticleDetailModel> {
	int status;
	ArticleDetailData data;

}

class ArticleDetailData  with JsonConvert<ArticleDetailData> {
	@JSONField(name: "_id")
	String id;
	String author;
	String desc;
	String markdown;
	String createdAt;
	String content;
	String title;
	List<String> images;
}
