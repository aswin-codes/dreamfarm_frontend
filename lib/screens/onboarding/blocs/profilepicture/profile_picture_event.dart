part of 'profile_picture_bloc.dart';

@immutable
class ProfilePictureEvent {}

class ProfilePictureInitialEvent extends ProfilePictureEvent {}

class ImageUploadButtonClickedEvent extends ProfilePictureEvent {
  ImageSource imageSource;
  ImageUploadButtonClickedEvent({required this.imageSource});
}

class ExistingAvatarClicked extends ProfilePictureEvent {
  String url;
  ExistingAvatarClicked({required this.url});
}

class ContinueButtonClicked extends ProfilePictureEvent {}
