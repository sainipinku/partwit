class LoginModel {
  bool status = false;
  String message = "";
  String token = "";
  bool rememberDevice = false;
  int role = 0;
  UserInfo? userInfo;

  LoginModel(
        this.status,
        this.message,
        this.token,
        this.rememberDevice,
        this.role,
        this.userInfo);

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status']==null?false:json['status'];
    message = json['message']==null?'':json['message'];
    token = json['token']==null?'':json['token'];
    rememberDevice = json['remember_device']==false?'':json['remember_device'];
    role = json['role']==null?0:json['role'];
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['remember_device'] = this.rememberDevice;
    data['role'] = this.role;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int id = 0;
  String name = "";
  String email = "";
  String emailVerifiedAt = "";
  int deviceId =0;
  String phone ="";
  String profileImage ="";
  String bannerImage ="";
  int customerId =0;
  String isEmailVerified ="";
  int notificationStatus =0;
  int isEnable =0;
  String lat ="";
  String lng ="";
  String createdAt ="";
  String updatedAt ="";
  String deletedAt ="";
  String profilePic ="";

  UserInfo(this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.deviceId,
        this.phone,
        this.profileImage,
        this.bannerImage,
        this.customerId,
        this.isEmailVerified,
        this.notificationStatus,
        this.isEnable,
        this.lat,
        this.lng,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.profilePic);

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id']==null?0:json['id'];
    name = json['name']==null?'':json['name'];
    email = json['email']==null?'':json['email'];
    emailVerifiedAt = json['email_verified_at']==null?'':json['email_verified_at'];
    deviceId = json['device_id']==null?0:json['device_id'];
    phone = json['phone']==null?'':json['phone'];
    profileImage = json['profile_image']==null?'':json['profile_image'];
    bannerImage = json['banner_image']==null?'':json['banner_image'];
    customerId = json['customer_id']==null?0:json['customer_id'];
    isEmailVerified = json['isEmailVerified']==null?'':json['isEmailVerified'];
    notificationStatus = json['notification_status']==null?0:json['notification_status'];
    isEnable = json['is_enable']==null?0:json['is_enable'];
    lat = json['lat']==null?'':json['lat'];
    lng = json['lng']==null?'':json['lng'];
    createdAt = json['created_at']==null?'':json['created_at'];
    updatedAt = json['updated_at']==null?'':json['updated_at'];
    deletedAt = json['deleted_at']==null?'':json['deleted_at'];
    profilePic = json['profile_pic']==null?'':json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['device_id'] = this.deviceId;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
    data['banner_image'] = this.bannerImage;
    data['customer_id'] = this.customerId;
    data['isEmailVerified'] = this.isEmailVerified;
    data['notification_status'] = this.notificationStatus;
    data['is_enable'] = this.isEnable;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}