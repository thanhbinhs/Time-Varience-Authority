import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,

    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithApple() async {
    final appleProvider = AppleAuthProvider();

    UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(appleProvider);
    // Keep the authorization code returned from Apple platforms
    String? authCode = userCredential.additionalUserInfo?.authorizationCode;
    // Revoke Apple auth token
    return await FirebaseAuth.instance.revokeTokenWithAuthorizationCode(authCode!);
  }

}
