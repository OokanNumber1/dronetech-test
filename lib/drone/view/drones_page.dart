import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dronetech/drone/view/add_drone_dialog.dart';
import 'package:dronetech/drone/view/widget/drone_card_info.dart';
import 'package:dronetech/drone/viewmodel/drone_vm.dart';
import 'package:flutter/material.dart';

class DronesPage extends StatefulWidget {
  const DronesPage({Key? key}) : super(key: key);

  @override
  State<DronesPage> createState() => _DronesPageState();
}

class _DronesPageState extends State<DronesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DroneTECH Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: StreamBuilder(
            stream: DroneViewmodel().droneStream(),
            builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Error Occured',
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: LinearProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return DroneCardInfo(
                      idTag: data['idTag'],
                      weight: data['weight'],
                      manufacturer: data['manufacturer'],
                      dateAcquired: data['dateAcquired'],
                      isServiced: data['isServiced']);
                }).toList(),
              );
            })),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.72,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: const AddDroneDialog(),
                  ),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


