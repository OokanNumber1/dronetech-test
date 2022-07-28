import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dronetech/src/model/drone.dart';

//viewmodel to serve as mediator between the view and firestore
class DroneViewmodel {
  final droneCollection = FirebaseFirestore.instance.collection('drones');

  Stream<QuerySnapshot> droneStream() {
    return droneCollection.snapshots();
  }

  Future<void> addDrone(Drone drone) {
    return droneCollection
        .add({
          'idTag': drone.idTag,
          'weight': drone.weight,
          'manufacturer': drone.manufacturer,
          'dateAcquired': drone.dateAcquired,
          'isServiced': drone.isServiced,
        })
        .then((value) =>(){})
        .catchError((err) =>throw Exception(err));
  }
}
