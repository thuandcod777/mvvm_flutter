import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback onDisponse;

  const BaseView(
      {Key key,
      @required this.viewModel,
      @required this.onPageBuilder,
      this.onModelReady,
      this.onDisponse})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDisponse != null) widget.onDisponse();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
