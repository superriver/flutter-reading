import 'package:flutter_reading/generated/json/base/json_convert_content.dart';
import 'package:flutter_reading/generated/json/base/json_field.dart';

class GirlEntity with JsonConvert<GirlEntity> {
	String category;
	List<GirlData> data;
	String hot;
	int status;
	int total_counts;
}

class GirlData with JsonConvert<GirlData> {
	@JSONField(name: "_id")
	String sId;
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
