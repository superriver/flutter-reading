import 'package:flutter_reading/model/banner_entity.dart';

bannerEntityFromJson(BannerEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => BannerData().fromJson(v)).toList();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	return data;
}

Map<String, dynamic> bannerEntityToJson(BannerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['status'] = entity.status;
	return data;
}

bannerDataFromJson(BannerData data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	return data;
}

Map<String, dynamic> bannerDataToJson(BannerData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['title'] = entity.title;
	data['url'] = entity.url;
	return data;
}