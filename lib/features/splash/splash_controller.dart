import 'package:riverpod/riverpod.dart';

final splashProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(),
);

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false) {
    _load();
  }

  Future<void> _load() async {
    await Future.delayed(const Duration(seconds: 3));
    state = true; // loading complete
  }
}
