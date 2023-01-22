part of foodapp_services;

abstract class AuthService {
  Future<Users> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Users> login({
    required String email,
    required String password,
  });

  Future<Users> signInWithGoogle();
  Future<void> logOut();
}

class AuthServiceImplementation implements AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email',
    ],
  );

  @override
  Future<Users> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;

      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .set({"name": name, "email": email, "password": password});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return Users();
  }

  @override
  Future<Users> signInWithGoogle() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      final googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );

      final _authResult = await auth.signInWithCredential(credential);

      final _user = _authResult.user;

      if (_user != null) {
        Logger().i(_user);
        assert(!_user.isAnonymous, 'User must not be anonymous');

        return Future.value(
          Users(
            email: _user.providerData[0].email,
            name: _user.displayName,
          ),
        );
      } else {
        return throw Exception('An error occured');
      }
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Users> login({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    await auth.signOut();
  }
}
