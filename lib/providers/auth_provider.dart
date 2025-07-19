import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignInProvider = Provider((ref) => GoogleSignIn());

final authStateProvider = StateNotifierProvider<AuthController, GoogleSignInAccount?>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<GoogleSignInAccount?> {
  final Ref ref;

  AuthController(this.ref) : super(null);

  Future<void> signIn() async {
    try {
      final user = await ref.read(googleSignInProvider).signIn();
      state = user;
    } catch (e) {
      print("Sign in error: $e");
    }
  }

  Future<void> signOut() async {
    await ref.read(googleSignInProvider).signOut();
    state = null;
  }
}
