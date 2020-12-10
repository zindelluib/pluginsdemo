import 'config.dart';
import '../jsonmodels/photos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Photos> getPhotos() async{
	var res  = await http.get('${API_URL}/photos');
	if(res.statusCode == 200)
		return Photos.fromJson(jsonDecode(res.body));
	else
		throw Exception('Error getting photos');

}


Future<Photo> addPhoto(String description,String file) async{
	var req  = http.MultipartRequest('POST', Uri.parse('${API_URL}/photos'));
	req.fields['description']   = description;
	req.files.add(
		await http.MultipartFile.fromPath(
	      'photo',
	      file
	    )
	);

	var res   = await req.send();
	print('${res.statusCode}');
	if(res.statusCode == 201)
		res.stream.transform(utf8.decoder).listen((value) {
	        print(value);
	        return Photo.fromJson(jsonDecode(value));
	    });
	else
		throw Exception('Error adding photo');
}