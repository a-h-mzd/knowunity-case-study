import 'package:flutter/cupertino.dart';
import 'package:knowunity/common/flutter_gen/fonts.gen.dart';

class TodoSliverNavigationBar extends StatelessWidget {
  final String title;

  const TodoSliverNavigationBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      stretch: true,
      alwaysShowMiddle: false,
      middle: Text(
        title,
        style: const TextStyle(
          fontFamily: FontFamily.sFProRounded,
        ),
      ),
      largeTitle: Text(
        title,
        style: const TextStyle(
          color: CupertinoColors.activeOrange,
          fontFamily: FontFamily.sFProRounded,
        ),
      ),
    );
  }
}
