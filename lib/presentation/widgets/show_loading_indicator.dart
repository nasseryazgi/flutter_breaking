import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/colors.dart';

class ShowLoadingIndicator extends StatelessWidget {
  const ShowLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }
}
