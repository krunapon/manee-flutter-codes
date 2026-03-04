import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/preferences_state.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<PreferencesState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: prefs.language,
              items: [
                'English',
                'Thai',
              ].map((l) => DropdownMenuItem(value: l, child: Text(l))).toList(),
              onChanged: (value) => prefs.setLanguage(value!),
            ),
            const SizedBox(height: 20),
            Text(
              'Text Size',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: prefs.textSize,
              items: [
                'Small',
                'Medium',
                'Large',
              ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (value) => prefs.setTextSize(value!),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Notifications',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Switch(
                  value: prefs.notifications,
                  onChanged: prefs.toggleNotifications,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                ),
                child: const Text('View Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
