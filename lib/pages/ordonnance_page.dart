import 'package:flutter/material.dart';

class OrdonnancePage extends StatelessWidget {
  final Map<String, String> order;

  OrdonnancePage(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Médiscan'),
        backgroundColor: Color(0xFF75C6FF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatientInfoCard(),
            const SizedBox(height: 20),
            OrderDetailsCard(order: order),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PatientInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informations du Patient',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Nom : Darrousez',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Prénom : Baptiste',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Sexe : Masculin',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Âge : 21',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Poids : 65.0 kg',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Taille : 180 cm',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informations du Médecin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Nom : Sapin',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Prénom : Jean',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Spécialité : Médecin Généraliste',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Téléphone : 0628163027',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Courriel : Jean.sapin@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

class OrderDetailsCard extends StatelessWidget {
  final Map<String, String> order;

  OrderDetailsCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Détails de l\'Ordonnance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Médicament : Doliprane 1000mg 3/j matin - midi - soir',
              style: TextStyle(fontSize: 16),
            ),
            // Ajoutez d'autres détails de l'ordonnance ici
          ],
        ),
      ),
    );
  }
}
