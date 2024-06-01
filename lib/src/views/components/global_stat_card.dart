import 'package:flutter/material.dart';
import '../../utils/consts.dart';

class GlobalStatCard extends StatelessWidget {
  const GlobalStatCard({
    Key? key,
    required this.title,
    required this.iconData,
    required this.number,
    this.color,
  }) : super(key: key);

  final String title, number;
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height / 7,
      // width: Get.width / 5,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(width: 1, color: Consts.col1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            title: Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: color ?? Consts.col1,
                fontSize: 24,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: color ?? Consts.col1,
              foregroundColor: Colors.white,
              child: Icon(iconData, size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FittedBox(
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: color?? Consts.col1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ProgressLine(percentage: 80, color: color ?? Consts.col1)
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = Colors.blue,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
