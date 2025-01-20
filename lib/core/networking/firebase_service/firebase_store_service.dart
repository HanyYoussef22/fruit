import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit/core/database/data_base_service.dart';
class FirebaseStoreService implements DataBaseService
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createData(String path, Map<String, dynamic> data) {
    // TODO: implement createData
    throw UnimplementedError();
  }


}