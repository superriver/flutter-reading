
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseProvider with ChangeNotifier{
   RefreshController refreshController = RefreshController();
}