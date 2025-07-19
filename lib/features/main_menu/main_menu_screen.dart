import 'package:flutter/material.dart';
import 'package:flutter_game/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

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

          // Top-right: Account icon or avatar
          Positioned(
            top: 16,
            right: 16,
            child: user != null
                ? _accountMenu(context, ref, user.photoUrl)
                : IconButton(
                    icon: const Icon(Icons.account_circle, color: Colors.white, size: 32),
                    onPressed: () {
                      ref.read(authStateProvider.notifier).signIn();
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

  Widget _accountMenu(BuildContext context, WidgetRef ref, String? photoUrl) {
    return PopupMenuButton<String>(
      icon: CircleAvatar(
        backgroundImage: photoUrl != null && photoUrl.isNotEmpty
            ? NetworkImage(photoUrl)
            : null,
        backgroundColor: Colors.grey[800],
        child: photoUrl == null || photoUrl.isEmpty ? const Icon(Icons.person) : null,
      ),
      color: Colors.grey[900],
      onSelected: (value) {
        if (value == 'logout') {
          ref.read(authStateProvider.notifier).signOut();
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text("Sign Out", style: TextStyle(color: Colors.white)),
        ),
      ],
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
