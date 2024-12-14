import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Analytics",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Profile Views Section
            _ProfileViewsSection(),

            const SizedBox(height: 20),
            // Contact Clicks Section
            _ContactClicksSection(),

            const SizedBox(height: 20),
            // Growth Section
            _GrowthSection(),
          ],
        ),
      ),
    );
  }
}

class _ProfileViewsSection extends StatelessWidget {
  const _ProfileViewsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Profile Views",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2.2k",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  "TODAY VIEWS",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Text(
              "6.2% views\nvs last day",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Bar Graph
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: true)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const days = [
                        "Mon",
                        "Tue",
                        "Wed",
                        "Thu",
                        "Fri",
                        "Sat",
                        "Sun"
                      ];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(days[value.toInt() % 7]),
                      );
                    },
                    interval: 1,
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              barGroups: _barGroups(),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _barGroups() {
    return List.generate(
      7,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: [2.5, 2.8, 3.2, 2.7, 2.1, 2.6, 3.0][index], // Example heights
            color: index == 6 ? Colors.red : Colors.black,
            width: 16,
            borderRadius: BorderRadius.circular(6),
          )
        ],
      ),
    );
  }
}

class _ContactClicksSection extends StatelessWidget {
  const _ContactClicksSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact clicks",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 20,
                  backgroundColor: Colors.black,
                  color: Colors.red,
                ),
              ),
              Column(
                children: const [
                  Text(
                    "3986k",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "VIEWS",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const Positioned(
                top: 40,
                right: 40,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Text(
                    "23%",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GrowthSection extends StatelessWidget {
  const _GrowthSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Growth",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _TimePeriodButton(label: "WEEK", selected: false),
            _TimePeriodButton(label: "MONTH", selected: true),
            _TimePeriodButton(label: "YEAR", selected: false),
          ],
        ),
        const SizedBox(height: 10),
        // Line Chart
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                _lineChartBarData(Colors.black, [1.2, 2.8, 1.6, 2.0, 3.2]),
                _lineChartBarData(Colors.red, [1.8, 1.9, 1.5, 3.0, 4.2]),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Liked",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFC55536),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Views",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  LineChartBarData _lineChartBarData(Color color, List<double> values) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      spots: values
          .asMap()
          .entries
          .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
          .toList(),
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}

class _TimePeriodButton extends StatelessWidget {
  final String label;
  final bool selected;

  const _TimePeriodButton({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.red : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
