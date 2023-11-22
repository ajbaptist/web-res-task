import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:task/src/utils/styles.dart';

class SideContainer extends StatelessWidget {
  const SideContainer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Styles.bgColor, Styles.bgColor2, Styles.bgColor3])),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GoFinance',
              style: Styles.styleWhite
                  .copyWith(fontSize: 18.spMin, fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            Text(
              'The most popular peer to peer lending at SEA',
              style: Styles.styleWhite,
            ),
            const Gap(15),
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Styles.bgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(25))),
                child: Text(
                  'Read more',
                  style: Styles.styleWhite,
                ))
          ],
        ),
      ),
    );
  }
}
