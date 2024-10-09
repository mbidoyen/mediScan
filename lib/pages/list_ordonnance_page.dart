import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mediscan/pages/ordonnance_page.dart';

class ListOrdonnancePage extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      "orderNumber": "Ordonnance n°3",
      "visitDate": "Visite du 07/10/2024",
      "doctor": "Votre Medecin : Monsieur Sapin",
      "treatmentEndDate": "Date de fin de traitement: 20/10/2024"
    },
    {
      "orderNumber": "Ordonnance n°2",
      "visitDate": "Visite du 07/10/2024",
      "doctor": "Votre Medecin : Monsieur Sapin",
      "treatmentEndDate": "Date de fin de traitement: 20/10/2024"
    },
    {
      "orderNumber": "Ordonnance n°2",
      "visitDate": "Visite du 07/10/2024",
      "doctor": "Votre Medecin : Monsieur Sapin",
      "treatmentEndDate": "Date de fin de traitement: 20/10/2024"
    },
  ];

  Future<void> _pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      final File imageFile = File(photo.path);
      final List<int> imageBytes = await imageFile.readAsBytes();
      final String base64Image = base64Encode(imageBytes);

      // Envoyer l'image à l'API
      await _sendImageToApi(base64Image);
    }
  }

  Future<void> _sendImageToApi(String base64Image) async {
    final String apiUrl = 'http://your-api-endpoint.com/upload'; // Remplacez par l'URL de votre API
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map<String, dynamic> body = {
      'image': base64Image,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Image envoyée avec succès');
    } else {
      print('Erreur lors de l\'envoi de l\'image: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediscan'),
        backgroundColor: Color(0xFF75C6FF),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: _pickImageFromCamera,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'En cours',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...orders.map((order) => OrderCard(order, context)),
          const SizedBox(height: 20),
          const Text(
            'Terminé',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...orders.map((order) => OrderCard(order, context)).toList(),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Map<String, String> order;
  final BuildContext context;

  OrderCard(this.order, this.context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrdonnancePage(order),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order['orderNumber']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(order['visitDate']!),
              SizedBox(height: 4),
              Text(order['doctor']!),
              SizedBox(height: 4),
              Text(order['treatmentEndDate']!),
            ],
          ),
        ),
      ),
    );
  }
}
