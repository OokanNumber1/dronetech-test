import 'package:dronetech/drone/model/drone.dart';
import 'package:dronetech/drone/viewmodel/drone_vm.dart';
import 'package:flutter/material.dart';

class AddDroneDialog extends StatefulWidget {
  const AddDroneDialog({Key? key}) : super(key: key);

  @override
  State<AddDroneDialog> createState() => _AddDroneDialogState();
}

class _AddDroneDialogState extends State<AddDroneDialog> {
  final formKey = GlobalKey<FormState>();
  //Variables instead of TextEditingController to get input
  String idTag = '';
  String weight = '';
  String manufacturer = '';
  String dateAcquired = '';
  String isServiced = '';
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'DRONE DETAILS FORM',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    //input is only saved to appropriate variable if its valid(not empty here)
                    onSaved: (newValue) => idTag = newValue!,
                    validator: (value) =>
                        value!.isEmpty ? 'Field can not be empty' : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter Drone ID Tag',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onSaved: (newValue) => weight = newValue!,
                    validator: (value) =>
                        value!.isEmpty ? 'Field can not be empty' : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter Drone Weight',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onSaved: (newValue) => isServiced = newValue!,
                    validator: (value) =>
                        value!.isEmpty ? 'Field can not be empty' : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter Drone Service Status',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onSaved: (newValue) => manufacturer = newValue!,
                    validator: (value) =>
                        value!.isEmpty ? 'Field can not be empty' : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter Drone Manufacturer',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onSaved: (newValue) => dateAcquired = newValue!,
                    validator: (value) =>
                        value!.isEmpty ? 'Field can not be empty' : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter Drone Acquired Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      //validating the inputs of the form
                      if (formKey.currentState!.validate()) {
                        //save the inputs to their respective variables if they are valid
                        formKey.currentState!.save();
                        //add the input to firestore fields
                        DroneViewmodel().addDrone(Drone(
                          idTag: idTag,
                          weight: weight,
                          manufacturer: manufacturer,
                          dateAcquired: dateAcquired,
                          isServiced: isServiced,
                        ));
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Drone Successfully Added'),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    child: const Text('Add Drone'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
