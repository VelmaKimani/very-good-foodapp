part of foodapp_services;

abstract class AuthService {
  Future<Users> signUp({required Users users});
  Future<Users?> signInWithGoogle();
  Future<Users> login({required String email, required String password});
  Future<void> logOut();
}

class AuthServiceImplementation implements AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  final firebaseAuth = FoodAppConfig.instance!.values.firebaseUrl;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<Users> signUp({required Users users}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: users.email!, password: users.password!);

      user = userCredential.user;

      FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
        "name": users.name,
        "email": users.email,
        "password": users.password
      });

      return Users(
        name: users.name,
        email: users.email,
        password: users.password,
      );
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Users> signInWithGoogle() async {
    try {
      final _googleSignInAccount = await googleSignIn.signIn();
      final _googleSignInAuthentication =
          await _googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: _googleSignInAuthentication?.idToken,
        accessToken: _googleSignInAuthentication?.accessToken,
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
  /* @override
  Future<Users> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
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
            email: _user.email,
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
  } */

  @override
  Future<Users> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    final resp = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Logger().i(resp);
    return Users(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      Logger().e(e);
    }
  }
}
