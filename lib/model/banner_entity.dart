import 'package:flutter_reading/generated/json/base/json_convert_content.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	List<BannerData> data;
	int status;
}

class BannerData with JsonConvert<BannerData> {
	String image;
	String title;
	String url;
}
