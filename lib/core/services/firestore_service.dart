import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylish_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
      return;
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  }) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docId,
  }) {
    return firestore
        .collection(path)
        .doc(docId)
        .get()
        .then((doc) => doc.exists);
  }
}
