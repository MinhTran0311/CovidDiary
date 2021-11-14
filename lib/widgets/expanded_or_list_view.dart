import 'package:flutter/cupertino.dart';

/// If the child widget is too big, it will act as a SingleChildListView
/// else, it will act as a Container that expands to maximum size.
class ExpandedOrListView extends StatelessWidget {
  const ExpandedOrListView({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight,
              minWidth: constraint.maxWidth,
            ),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
