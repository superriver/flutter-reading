import 'package:flutter_reading/model/article_entity.dart';

articleEntityFromJson(ArticleEntity data, Map<String, dynamic> json) {
	if (json['category'] != null) {
		data.category = json['category'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => ArticleData().fromJson(v)).toList();
	}
	if (json['hot'] != null) {
		data.hot = json['hot'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['total_counts'] != null) {
		data.total_counts = json['total_counts'] is String
				? int.tryParse(json['total_counts'])
				: json['total_counts'].toInt();
	}
	return data;
}

Map<String, dynamic> articleEntityToJson(ArticleEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['category'] = entity.category;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['hot'] = entity.hot;
	data['status'] = entity.status;
	data['total_counts'] = entity.total_counts;
	return data;
}

articleDataFromJson(ArticleData data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.id = json['_id'].toString();
	}
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['category'] != null) {
		data.category = json['category'].toString();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['images'] != null) {
		data.images = (json['images'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['likeCounts'] != null) {
		data.likeCounts = json['likeCounts'] is String
				? int.tryParse(json['likeCounts'])
				: json['likeCounts'].toInt();
	}
	if (json['publishedAt'] != null) {
		data.publishedAt = json['publishedAt'].toString();
	}
	if (json['stars'] != null) {
		data.stars = json['stars'] is String
				? int.tryParse(json['stars'])
				: json['stars'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['views'] != null) {
		data.views = json['views'] is String
				? int.tryParse(json['views'])
				: json['views'].toInt();
	}
	return data;
}

Map<String, dynamic> articleDataToJson(ArticleData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.id;
	data['author'] = entity.author;
	data['category'] = entity.category;
	data['createdAt'] = entity.createdAt;
	data['desc'] = entity.desc;
	data['images'] = entity.images;
	data['likeCounts'] = entity.likeCounts;
	data['publishedAt'] = entity.publishedAt;
	data['stars'] = entity.stars;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	data['views'] = entity.views;
	return data;
}

articleDetailModelFromJson(ArticleDetailModel data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['data'] != null) {
		data.data = ArticleDetailData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> articleDetailModelToJson(ArticleDetailModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['data'] = entity.data?.toJson();
	return data;
}

articleDetailDataFromJson(ArticleDetailData data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.id = json['_id'].toString();
	}
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['markdown'] != null) {
		data.markdown = json['markdown'].toString();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['images'] != null) {
		data.images = (json['images'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	return data;
}

Map<String, dynamic> articleDetailDataToJson(ArticleDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.id;
	data['author'] = entity.author;
	data['desc'] = entity.desc;
	data['markdown'] = entity.markdown;
	data['createdAt'] = entity.createdAt;
	data['content'] = entity.content;
	data['title'] = entity.title;
	data['images'] = entity.images;
	return data;
}