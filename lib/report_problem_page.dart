import 'package:flutter/material.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController issueController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/report.png',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Report an Issue",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PTSerif',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Help us improve by reporting issues",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'PTSerif',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: issueController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Describe your issue",
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.report_problem),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (issueController.text.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Issue Submitted"),
                              content: const Text("Thank you for reporting this issue."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                          issueController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text("Submit", style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
