import 'package:flutter/material.dart';
import '../../main.dart'; // Import main.dart to access isDarkMode ValueNotifier

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode, // Listen to the ValueNotifier for theme changes, specifying the type explicitly
      builder: (context, isDark, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Status Page'),
            backgroundColor: isDark ? Colors.grey[850] : Colors.blue, // Use a dark grey for dark theme for better aesthetics
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Uptime 99%',
                  style: TextStyle(fontSize: 25, color: isDark ? Colors.red : Colors.green), // Adjust text color based on theme, red for dark, green for light
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: 0.99,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(isDark ? Colors.red : Colors.green), // Adjust progress bar color based on theme
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
            ],
            onTap: (index) {
              // Handle navigation to respective pages when tapping on items
              if (index == 0) {
                // Navigate to Settings Page
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsPage())); // Use pushReplacement to avoid stacking
              } else if (index == 1) {
                // Navigate back to Home Page
                Navigator.pop(context); // Ensure we're popping to avoid unnecessary stack buildup
              }
            },
          ),
        );
      },
    );
  }
}