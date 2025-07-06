import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ViewResultsPage extends StatelessWidget {
  const ViewResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movies = [
      'Mean Girls',
      'Inside Out 2',
      'Garfield Movie',
    ];

    final List<int> votes = [70, 50, 30];

    final int totalVotes = votes.reduce((a, b) => a + b);

    final List<Color> colors = [
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voting Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Voting Results',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'PTSerif',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total votes: $totalVotes',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'PTSerif',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceEvenly,
                  maxY: (votes.reduce((a, b) => a > b ? a : b)).toDouble() + 10,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        getTitlesWidget: (value, meta) {
                          return Text('${value.toInt()}');
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(movies.length, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: votes[index].toDouble(),
                          color: colors[index],
                          width: 28,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Legend with vote count and percentage
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(movies.length, (index) {
                double percent = (votes[index] / totalVotes) * 100;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: colors[index],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${movies[index]} - ${votes[index]} votes (${percent.toStringAsFixed(1)}%)',
                        style: const TextStyle(fontSize: 16, fontFamily: 'PTSerif'),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
