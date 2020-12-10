class Photos{

	
	final List photos;

	Photos({this.photos});
	
	factory Photos.fromJson(Map<String,dynamic> json){
		return Photos(
			photos: json['photos']
		);
	}

}


class Photo{
	final String message;
	final Map<String,dynamic> details;

	Photo({this.message,this.details});

	factory Photo.fromJson(Map<String,dynamic> json){
		return Photo(
			message: json['message'],
			details: json['photo']
		);
	}

}