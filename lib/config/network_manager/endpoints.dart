class Endpoints {
  Endpoints._();

  // static const String baseURL = 'http://3.16.27.40:3001/api';
  static const String baseURL = 'https://savethemessage.com/api';
  static const int receiveTimeout = 30;
  static const int connectionTimeout = 30;
  static const String signUpUrl = "/auth/signup";
  static const String loginUrl = "/auth/login";
  static const String logOutUrl = "/auth/logout";
  static const String forgotPasswordUrl = "/auth/reset-password";
  static const String addPeopleUrl = "/people/create";
  static const String getAllPeopleUrl = "/people/";
  static const String getAllPhotosUrl = "/media/images";
  static const String getAllVideosUrl = "/media/videos";
  static const String getAllVoicesUrl = "/media/audio";
  static const String getAllMessagesUrl = "/media/texts";
  static const String mediaUrl = "/media";
  static const String filters = "/filters";
}
