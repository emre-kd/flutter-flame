import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Central Buttons
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _menuButton(context, "New Game", Colors.green, () {
                  // TODO: Navigate to Game Screen
                }),
                const SizedBox(height: 20),
                _menuButton(context, "Load Game", Colors.blue, () {
                  // TODO: Load game logic
                }),
                const SizedBox(height: 20),
                _menuButton(context, "Settings", Colors.orange, () {
                  // TODO: Navigate to Settings Screen
                }),
              ],
            ),
          ),

          // Top-right: Account icon
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
                // TODO: Google Play Auth
              },
            ),
          ),

          // Bottom-right: Settings icon
          Positioned(
            bottom: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                // TODO: Settings
              },
            ),
          ),

          // Bottom-left: Leaderboard icon
          Positioned(
            bottom: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.leaderboard, color: Colors.white),
              onPressed: () {
                // TODO: Leaderboard
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(BuildContext context, String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
