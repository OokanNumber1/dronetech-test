import 'package:flutter/material.dart';

class DroneCardInfo extends StatelessWidget {
  const DroneCardInfo({
    Key? key,
    required this.idTag,
    required this.weight,
    required this.manufacturer,
    required this.dateAcquired,
    required this.isServiced,
  }) : super(key: key);

  final String idTag;
  final String weight;
  final String manufacturer;
  final String dateAcquired;
  final String isServiced;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.16,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('idTag: $idTag',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Weight: $weight'),
                Text('Serviced: $isServiced')
              ]),
              const SizedBox(height: 8),
              Text('Manufacturer: $manufacturer'),
              const SizedBox(height: 8),
              Text('Acquired on: $dateAcquired')
            ],
          ),
        ),
      ),
    );
  }
}
