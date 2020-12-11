import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'services/photosservice.dart';
class PhotoUploadForm extends StatefulWidget{

	_PhotoUploadFormState createState() => _PhotoUploadFormState();
}

class _PhotoUploadFormState extends State<PhotoUploadForm>{
	final _formKey = GlobalKey<FormState>();
	final _descController  = TextEditingController();
	String _photoPath;
	String _photoName;
	@override
	initState(){
		super.initState();
	}
	_pickPhotos() async{
		FilePickerResult result = await FilePicker.platform.pickFiles(
			type: FileType.image
		);

		if(result != null) {
		   PlatformFile file = result.files.first;
		   setState((){
		   		_photoPath   = file.path;
		   		_photoName = file.name;
		   	});
		}

	}
	@override
	dispose(){
		_descController.dispose();
		super.dispose();
	}
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text('Add New photo')
			),
			body:Form(
				key: _formKey,
				child: Column(
					children: [
						TextFormField(
							controller: _descController,
							decoration: InputDecoration(
								labelText : 'Enter description'
							),
							maxLines: null,
    						keyboardType: TextInputType.multiline
						),
						(_photoName != null)?Text('${_photoName}'):SizedBox(height:20),
						ElevatedButton(
							child : Text('Choose a photo'),
							onPressed : _pickPhotos
						)


					]
				)
			),
			floatingActionButton: FloatingActionButton(
				child : Icon(Icons.save),
				onPressed: (){
					addPhoto(_descController.text,_photoPath);
					Navigator.pop(context);
				}
			)

		);
	}
}