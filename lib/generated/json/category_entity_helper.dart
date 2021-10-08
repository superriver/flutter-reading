import 'package:flutter_reading/model/category_entity.dart';

categoryEntityFromJson(CategoryEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => CategoryData().fromJson(v)).toList();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	return data;
}

Map<String, dynamic> categoryEntityToJson(CategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['status'] = entity.status;
	return data;
}

categoryDataFromJson(CategoryData data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id'].toString();
	}
	if (json['coverImageUrl'] != null) {
		data.coverImageUrl = json['coverImageUrl'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	return data;
}

Map<String, dynamic> categoryDataToJson(CategoryData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['coverImageUrl'] = entity.coverImageUrl;
	data['desc'] = entity.desc;
	data['title'] = entity.title;
	data['type'] = entity.type;
	return data;
}