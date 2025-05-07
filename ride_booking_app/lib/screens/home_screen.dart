import 'package:flutter/material.dart';
import 'package:ride_booking_app/widgets/custom_textfield.dart';
import 'ride_info_screen.dart';
import 'package:provider/provider.dart';
import '../theme/theme_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Zappio Home'),
        centerTitle: true,
        actions: [
          Switch(
            value: themeNotifier.themeMode == ThemeMode.dark,
            onChanged: (val) => themeNotifier.toggleTheme(),
            activeColor: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book Your Ride',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              label: 'Pickup Location',
              controller: pickupController,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Drop Location',
              controller: dropController,
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RideInfoScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Book Ride'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
