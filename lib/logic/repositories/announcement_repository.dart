import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/constants/collection_names.dart';
import 'package:tobeto_app/models/announcements_model.dart';
import 'package:tobeto_app/utils/firebase_firestore_exception.dart';

class AnnouncementRepository {
  late List<AnnouncementModel> educations;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<AnnouncementModel>> getAnnouncements(
      List<String> userAnnouncementList) async {
    List<AnnouncementModel> announcements = [];
    try {
      if (userAnnouncementList.isEmpty) {
        return []; // Boş liste olduğunda exception kısmına düşmemesi için
      }
      // Firestore dan kullanıcının duyularını ilk eklenen duyuruya göre listele
      final querySnapshot = await _firebaseFirestore
          .collection(Collections.ANNOUNCEMENTS)
          .where(FieldPath.documentId, whereIn: userAnnouncementList)
          .get();
      // Modele göre listeye aktar
      announcements = querySnapshot.docs.map((doc) {
        return AnnouncementModel.fromFirestore(doc);
      }).toList();

      return announcements;
    } catch (error) {
      if (error is FirebaseException) {
        String errorMessage =
            FirestoreExceptionHelper.handleException(error.code);
        throw Exception(errorMessage);
      }
      throw Exception(error);
    }
  }
}
