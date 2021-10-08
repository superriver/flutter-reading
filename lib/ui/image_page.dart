
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reading/model/girl_entity.dart';
import 'package:flutter_reading/provider/girl_provider.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/ui/widget/base_view.dart';
import 'package:flutter_reading/ui/widget/girls_grid_view.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_refresher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
class ImagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ImagePageState();
  }

}
class _ImagePageState extends State<ImagePage> with AutomaticKeepAliveClientMixin{
   GirlProvider provider;


  @override
  void initState() {
    provider = GirlProvider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseView(
        model: provider,
        onModelReady: (GirlProvider model) {
          model.onRefresh();
        },
        builder: (context, GirlProvider model, child) {
          if (ObjectUtil.isEmptyList(model.girlList)) {
            return Container();
          }
          return Container(
            margin:  EdgeInsets.only(right: transSize(15), left: transSize(15)),
            child:  CustomRefresher(
              enablePullUp: true,
              onRefresh: (){
                model.onRefresh();
                model.refreshController.refreshCompleted();
              },
              onLoading: (){
                model.onLoadMore();
                model.refreshController.loadComplete();
              },
              controller:  model.refreshController,
              child: WaterfallFlow.builder(
                itemBuilder: (context, index) {
                  GirlData data = model.girlList[index];
                  return GirlItemView(data);
                },
                itemCount: model.girlList.length, gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
              ),
            ),
          );
        }
    );
  }

  @override
  bool get wantKeepAlive => true;

}