// import "dart:async";
// import "package:attendance/POJOs/record.dart";
// import "package:attendance/POJOs/user.dart";
// import "package:attendance/constants.dart";
// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:firebase_core/firebase_core.dart";
// import "package:attendance/firebase_options.dart";

// class FirebaseDatabase {
//   static final FirebaseFirestore _db = FirebaseFirestore.instance;

//   static Future<Object?> firebaseInit() async {
//     Object? error;
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     )
//     .then((_) => error = null)
//     .onError((err, _) {
//       error = err;
//     });

//     return error;
//   }

  // Add functions below

  // static Future<Object?> addRecord(Map<String, dynamic> record) async {
  //   Object? error;

  //   await _db
  //     .collection("records")
  //     .doc()
  //     .set(record)
  //     .onError((err, _) {
  //       error = err;
  //     });
    
  //   return error;
  // }

  // static Future<List<AttnRecord>> getUserRecords(String uid) async {
  //   List<AttnRecord> records = [];

  //   await _db
  //     .collection("records")
  //     .where("uid", isEqualTo: uid)
  //     .orderBy("dateAdded", descending: true)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isEmpty) {
  //         records = [AttnRecord("0", "0", "0", DateTime.now(), -1, "0")];
  //       }
  //       for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in querySnapshot.docs) {
  //         AttnRecord rec = AttnRecord.mapToRecord(docSnapshot.data());
  //         rec.docId = docSnapshot.id;
  //         records.add(rec);
  //       }
  //     })
  //     .onError((err, _) {
  //       printError("${err.toString()} [firestore_db.dart/getUserRecords()]");
  //     });

  //   return records;
  // }

  // static Future<List<AttnRecord>> getRecords() async {
  //   List<AttnRecord> records = [];

  //   await _db
  //     .collection("records")
  //     .orderBy("dateAdded", descending: true)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isEmpty) {
  //         records = [AttnRecord("0", "0", "0", DateTime.now(), -1, "0")];
  //       }
  //       for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in querySnapshot.docs) {
  //         AttnRecord rec = AttnRecord.mapToRecord(docSnapshot.data());
  //         rec.docId = docSnapshot.id;
  //         records.add(rec);
  //       }
  //     })
  //     .onError((err, _) {
  //       printError("${err.toString()} [firestore_db.dart/getRecords()]");
  //     });

  //   return records;
  // }

  // static Future<bool?> isAttendanceMarkedForDate(DateTime date, String uid) async {
  //   bool? attendanceMarked = false;
  //   DateTime startOfDay = DateTime(date.year, date.month, date.day);
  //   DateTime endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

  //   await _db
  //     .collection("records")
  //     .where("uid", isEqualTo: uid)
  //     .where("dateAdded", isGreaterThanOrEqualTo: startOfDay)
  //     .where("dateAdded", isLessThanOrEqualTo: endOfDay)
  //     .limit(1)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isNotEmpty) {
  //         attendanceMarked = true;
  //       }
  //     })
  //     .onError((err, _) {
  //       attendanceMarked = null;
  //       printInfo("OK");
  //       printError("${err.toString()} [firestore_db.dart/isAttendanceMarkedForDate()]");
  //     });
    
  //   return attendanceMarked;
  // }

  // // TODO: untested
  // static Future<List<Map<String, dynamic>>> getRecordsFromTo(DateTime from, DateTime to) async {
  //   List<Map<String, dynamic>> records = [];

  //   await _db
  //     .collection("records")
  //     .where("dateAdded", isGreaterThanOrEqualTo: from)
  //     .where("dateAdded", isLessThanOrEqualTo: to)
  //     .orderBy("dateAdded")
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isEmpty) {
  //         records = [{"0": "No data for selected dates in database"}];
  //       }
  //       for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in querySnapshot.docs) {
  //         records.add(docSnapshot.data());
  //       }
  //     })
  //     .onError((err, _) {
  //       printError("getRecordsFromTo(): ${err.toString()}");
  //     });
    
  //   return records;
  // }

  // static Future<Object?> updateAttendance(String attendance, AttnRecord record) async {
  //   Object? error;

  //   await _db
  //     .collection("records")
  //     .doc(record.docId)
  //     .update({
  //       "attendance": attendance
  //     })
  //     .onError((err, _) {
  //       error = err;
  //       printError("${err.toString()} [firestore_db.dart/updateAttendance()]");
  //     });
  //   return error;
  // }

  // static Future<Object?> deleteRecord(AttnRecord record) async {
  //   Object? error;

  //   await _db
  //     .collection("records")
  //     .doc(record.docId)
  //     .delete()
  //     .onError((err, _) {
  //       error = err;
  //       printError("${err.toString()} [firestore_db.dart/deleteRecord()]");
  //     });

  //   return error;
  // }


  // static Future<int?> getRidForNewUser(String name) async {
  //   int? rid;

  //   await _db
  //     .collection("users")
  //     .where("name", isEqualTo: name)
  //     .orderBy("rid", descending: true)
  //     .limit(1)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isEmpty) {
  //         rid = 0;
  //       }
  //       else {
  //         rid = querySnapshot.docs[0].data()["rid"] + 1;
  //       }
  //     })
  //     .onError((err, _) {
  //       rid = null;
  //       printError("${err.toString()} [firestore_db.dart/getRidForNewUser()]");
  //     });

  //   return rid;
  // }


  // static Future<Object?> createUserData() async {
  //   Object? error;

  //   await _db
  //     .collection("users")
  //     .doc(LocalUser.uid)
  //     .set({
  //       "name": LocalUser.name,
  //       "rid": LocalUser.rid
  //     })
  //     .onError((err, _) {
  //       error = err;
  //       printError("${err.toString()} [firestore_db.dart/setUserData()]");
  //     });

  //   return error;
  // }


  // static Future<int?> getRidForUser(String uid) async {
  //   int? rid;

  //   await _db
  //     .collection("users")
  //     .doc(uid)
  //     .get()
  //     .then((DocumentSnapshot<Map<String, dynamic>> docSnapshot) {
  //       if (docSnapshot.exists && docSnapshot.data() != null) {
  //         rid = docSnapshot.data()!["rid"];
  //       } else {
  //         rid = -1;
  //       }
  //     })
  //     .onError((err, _) {
  //       rid = null;
  //       printError("${err.toString()} [firestore_db.dart/getRidForNewUser()]");
  //     });

  //   return rid;
  // }


  // static Future<bool?> isValidRecordAddition(String name, int rid, DateTime date) async {
  //   bool? isValid;
  //   DateTime startOfDay = DateTime(date.year, date.month, date.day);
  //   DateTime endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

  //   await _db
  //     .collection("records")
  //     .where("name", isEqualTo: name)
  //     .where("rid", isEqualTo: rid)
  //     .where("dateAdded", isGreaterThanOrEqualTo: startOfDay)
  //     .where("dateAdded", isLessThanOrEqualTo: endOfDay)
  //     .limit(1)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isEmpty) {
  //         isValid = true;
  //       } else {
  //         isValid = false;
  //       }
  //     })
  //     .onError((err, _) {
  //       isValid = null;
  //       printError("${err.toString()} [firestore_db.dart/getRidForNewUser()]");
  //     });

  //   return isValid;
  // }


  // static Future<String?> getUidForUser(String name, int rid) async {
  //   String? uid;

  //   await _db
  //     .collection("users")
  //     .where("name", isEqualTo: name)
  //     .where("rid", isEqualTo: rid)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       if (querySnapshot.docs.isNotEmpty) {
  //         uid = querySnapshot.docs[0].id;
  //       } else {
  //         uid = StringsConst.userDoesNotExistInDB;
  //       }
  //     })
  //     .onError((err, _) {
  //       uid = null;
  //       printError("${err.toString()} [firestore_db.dart/getUidForUser()]");
  //     });

  //   return uid;
  // }


  // static Future<List<AttnRecord>?> getPendingLeaveRecords() async {
  //   List<AttnRecord>? records = [];

  //   await _db
  //     .collection("records")
  //     .where("attendance", isEqualTo: "PL")
  //     .orderBy("dateAdded", descending: true)
  //     .get()
  //     .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
  //       for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in querySnapshot.docs) {
  //         AttnRecord rec = AttnRecord.mapToRecord(docSnapshot.data());
  //         rec.docId = docSnapshot.id;
  //         records!.add(rec);
  //       }
  //     })
  //     .onError((err, _) {
  //       records = null;
  //       printError("${err.toString()} [firestore_db.dart/getPendingLeaveRecords()]");
  //     });

  //   return records;
  // }

  // static Future<Object?> updateLeaveStatus(bool reqAccepted, AttnRecord record) async {
  //   Object? error;
  //   String attendance = (reqAccepted) ? "L" : "A";

  //   await _db
  //     .collection("records")
  //     .doc(record.docId)
  //     .update({
  //       "attendance": attendance
  //     })
  //     .onError((err, _) {
  //       error = err;
  //       printError("${err.toString()} [firestore_db.dart/updateAttendance()]");
  //     });
  //   return error;
  // }


// }