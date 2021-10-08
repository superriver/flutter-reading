import 'package:flutter_reading/generated/json/base/json_convert_content.dart';
import 'package:flutter_reading/generated/json/base/json_field.dart';

class CategoryEntity with JsonConvert<CategoryEntity> {
	List<CategoryData> data;
	int status;
}

class CategoryData with JsonConvert<CategoryData> {
	@JSONField(name: "_id")
	String sId;
	String coverImageUrl;
	String desc;
	String title;
	String type;
}
