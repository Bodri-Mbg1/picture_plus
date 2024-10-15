import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:picture_plus/widgets/photos.dart';

Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    // Analysez la réponse JSON
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
  } else {
    throw Exception('Erreur lors du chargement des photos');
  }
}
