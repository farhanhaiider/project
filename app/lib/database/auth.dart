// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';

// class Auth {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   User? currUser = FirebaseAuth.instance.currentUser; 






//   Stream<User?> userChangeStream = FirebaseAuth.instance.authStateChanges();

//   Add functions here:

//   static void attachAuthStateChangeListener() {
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user != null) {
//         LocalUser.fromAuthUser(user);
//       }
//     });
//   }


  // User? isUserLoggedIn() {
  //   if (currUser == null) {
  //     return null;
  //   }
  //   return currUser;
  // }


  // Future<User?> signInWithEmailAndPass(String email, String pass) async {
  //   User? returnValue;

  //   await auth.signInWithEmailAndPassword(
  //     email: email, password: pass
  //   )
  //   .then((credential) {
  //     if (credential.user != null) {
  //       returnValue = credential.user;
  //     }
  //   })
  //   .onError((error, _) {
  //     printError("signInWithEmailAndPass(): $error");
  //     returnValue = null;
  //   });

  //   return returnValue;
  // }


  // Future<User?> createUser(String email, String pass, String name) async {
  //   User? user;

  //   await auth.createUserWithEmailAndPassword(
  //     email: email, password: pass
  //   )
  //   .then((credential) async {
  //     if (credential.user != null) {
  //       user = credential.user;
  //       await credential.user!.updateDisplayName(name)
  //       .then((_) {
  //         LocalUser.name = name;
  //       })
  //       .onError((error, _) {
  //         printError("$error [auth.dart/createUser()]");
  //         LocalUser.name = "$error";
  //       });
  //     }
  //   })
  //   .onError((error, _) {
  //     printError("$error [auth.dart/createUser()]");
  //     user = null;
  //   });

  //   return user;
  // }


  // Future<void> signOut() async {
  //   AttnRecord.recordsList = [];
  //   await auth.signOut();
  // }

// }