import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/destination_model.dart';

class DestinationService {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  // Note: fetch destinations
  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      // Note: Get destinations from firestore
      QuerySnapshot result = await _destinationReference.get();

      // Note: Convert to list of DestinationModel
      List<DestinationModel> destinations = result.docs.map(
        (e) {
          return DestinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      // Note: Return destinations
      return destinations;
    } catch (e) {
      rethrow;
    }
  }
}
