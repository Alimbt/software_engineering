import 'package:flutter/material.dart';

class HorizontalChart extends StatelessWidget {
  final List<ChartItem> items;

  const HorizontalChart({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) => ChartRow(item: item)).toList(),
      ),
    );
  }
}

class ChartItem {
  final String label;
  final double percentage;

  ChartItem({required this.label, required this.percentage});
}

class ChartRow extends StatelessWidget {
  final ChartItem item;

  const ChartRow({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // نام
          SizedBox(
            width: 80,
            child: Text(
              item.label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          // خط افقی
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                 double availableWidth = constraints.maxWidth;
                return Stack(
                  children: [
                    Container(
                      height: 4,
                      color: Colors.black54,
                       width: availableWidth * (item.percentage / 100),
                    ),
                  ],
                );
              },
            ),
          ),

          // درصد
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "${item.percentage}%",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}