part of 'profile_picture_bloc.dart';

@immutable
class ProfilePictureState {}

class ProfilePictureInitial extends ProfilePictureState {}

class ProfilePictureActionState extends ProfilePictureState {}

class ProfilePictureInitialState extends ProfilePictureState {}

class ProfilePictureUploadingState extends ProfilePictureActionState {}

class ProfilePictureUploadErrorState extends ProfilePictureActionState {
  String message;
  ProfilePictureUploadErrorState({required this.message});
}

class ProfilePictureSelectedState extends ProfilePictureActionState {
  String url;
  ProfilePictureSelectedState({required this.url});
}

class NavigateToHomeScreen extends ProfilePictureActionState {}
