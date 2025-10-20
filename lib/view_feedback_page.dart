import 'package:flutter/material.dart';
import 'feedback_page.dart';

class ViewFeedbackPage extends StatelessWidget {
  const ViewFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedbacks = FeedbackBackend.getAllFeedbacks();

    return Scaffold(
      appBar: AppBar(title: const Text('All Feedbacks')),
      body: feedbacks.isEmpty
          ? const Center(
              child: Text(
                'No feedbacks yet.',
                style: TextStyle(fontFamily: 'PTSerif', fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: feedbacks.length,
              separatorBuilder: (_, __) => const Divider(height: 20),
              itemBuilder: (context, index) {
                final item = feedbacks[index];
                final date = (item['timestamp'] as DateTime).toLocal();

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              i < (item['rating'] as double).round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['feedback'],
                          style: const TextStyle(fontFamily: 'PTSerif'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
