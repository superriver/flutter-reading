import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final bool isConsumer;
  final Function(T) onModelReady;

  BaseView({Key key, this.model, this.builder, this.child, this.onModelReady, this.isConsumer = true,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState<T>();
  }
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => model,
      child:  Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      )
    );
  }
}
