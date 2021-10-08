import 'package:common_utils/common_utils.dart';
import 'package:flutter_reading/model/girl_entity.dart';
import 'package:flutter_reading/repository/reading_repository.dart';

import 'base_provider.dart';

class GirlProvider extends BaseProvider {
  List<GirlData> girlList;

  int pageNum = 1;

  int totalRecord = 0;

  GirlProvider();

  onRefresh() {
    ReadingRepository.getImageList<GirlEntity>((result) {
      girlList = result?.data;
      notifyListeners();
    }, type: "Girl", pageNum: 1);
  }

  onLoadMore() {
    pageNum++;
    ReadingRepository.getImageList<GirlEntity>((GirlEntity result) {
      totalRecord = result.total_counts;
      if (girlList.length >= totalRecord) {
        if (!ObjectUtil.isEmptyList(girlList)) {
          refreshController.loadNoData();
        }
      }
      if (!ObjectUtil.isEmptyList(result?.data)) {
        girlList.addAll(result?.data);
        notifyListeners();
      }
    }, type: "Girl", pageNum: pageNum);
  }
}
