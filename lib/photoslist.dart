import 'package:flutter/material.dart';
import 'services/config.dart';
import 'services/photosservice.dart';
import 'jsonmodels/photos.dart';
import 'photouploadform.dart';
class PhotosList extends StatefulWidget {
	
	_PhotosListState createState() => _PhotosListState();
}


class _PhotosListState extends State<PhotosList>{

	Future<Photos> _photosFuture;

	@override
	initState(){
		super.initState();
		_photosFuture =  getPhotos();

	}

	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text('Photos'),
			),
			body: FutureBuilder<Photos>(
				future : _photosFuture,
				builder: (context,snapshot){
					if(snapshot.hasError){
						return Text('An error occured');
					}
					else if(snapshot.hasData){
						
						if(snapshot.data.photos.length == 0)
							return Center(
								child : Text('No photos available')	
							);
						return ListView.builder(
							itemCount : snapshot.data.photos.length,
							itemBuilder: (context,index){
								var photo = snapshot.data.photos[index];
								return Card(
									child: ListTile(
										leading:Image.network('${ASSETS_URL}/${photo['path']}'),
										title: Text('${photo['description']}')
									)
								);
							}
						);
					}

					return Center(
						child: CircularProgressIndicator()
					);

				}
			),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: (){
					Navigator.push(context,MaterialPageRoute(builder: (context) => PhotoUploadForm()));
				}
			)

		);
	}
}
