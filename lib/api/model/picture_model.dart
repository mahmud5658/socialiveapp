class PictureModel {
  bool? success;
  String? message;
  List<PictureDataModel>? pictureModelList;

  PictureModel({this.success, this.message, this.pictureModelList});

  PictureModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      pictureModelList = <PictureDataModel>[];
      json['data'].forEach((v) {
        pictureModelList!.add(PictureDataModel.fromJson(v));
      });
    }
  }
}

class PictureDataModel {
  String? sId;
  int? rating;
  String? comment;
  String? reviewDate;
  String? picture;
  bool? isDelete;
  int? iV;

  PictureDataModel(
      {this.sId,
        this.rating,
        this.comment,
        this.reviewDate,
        this.picture,
        this.isDelete,
        this.iV});

  PictureDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rating = json['rating'];
    comment = json['comment'];
    reviewDate = json['reviewDate'];
    picture = json['picture'];
    isDelete = json['isDelete'];
    iV = json['__v'];
  }
}