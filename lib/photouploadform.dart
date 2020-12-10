import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PhotoUploadForm extends StatefulWidget{

	_PhotoUploadFormState createState() => _PhotoUploadFormState();
}

class _PhotoUploadFormState extends State<PhotoUploadForm>{
	final _formKey = GlobalKey<FormState>();
	final _descController  = TextEditingController();
	String photoPath;
	_pickPhotos(){


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
						SizedBox(height:20),
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
					Navigator.pop(context);
				}
			)

		);
	}
}