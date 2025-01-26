import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit/core/database/data_base_service.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';

class FirebaseStoreService implements DataBaseService
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Future<void> addData({required String path, required Map<String, dynamic> data , String? docId }) async{
    if (docId != null)
      {
        await _firestore.collection(path).doc(docId).set(data);
      }
    else{
      await _firestore.collection(path).add(data);
    }

  }

  @override
  Future<Map<String,dynamic>> getData({required String path, required String docId}) async {
    var user= await _firestore.collection(path).doc(docId).get();
    return user.data() as Map<String, dynamic> ;
  }

  @override
  Future<bool> checkIfDataExist({required String path, required String docId}) async{
    var data = await _firestore.collection(path).doc(docId).get();
    return data.exists;

  }



}