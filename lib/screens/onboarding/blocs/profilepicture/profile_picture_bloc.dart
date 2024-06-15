import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreamfarm/screens/onboarding/data/repository/profile_picture_repository.dart';
import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_picture_event.dart';
part 'profile_picture_state.dart';

class ProfilePictureBloc
    extends Bloc<ProfilePictureEvent, ProfilePictureState> {
  String _imgUrl = "";
  ProfilePictureRepository profilePictureRepository =
      ProfilePictureRepository();

  ProfilePictureBloc() : super(ProfilePictureInitial()) {
    on<ProfilePictureInitialEvent>(profilePictureInitialEvent);
    on<ExistingAvatarClicked>(existingAvatarClicked);
    on<ImageUploadButtonClickedEvent>(imageUploadButtonClickedEvent);
    on<ContinueButtonClicked>(continueButtonClicked);
  }

  FutureOr<void> profilePictureInitialEvent(
      ProfilePictureInitialEvent event, Emitter<ProfilePictureState> emit) {
    emit(ProfilePictureInitialState());
  }

  String get imgUrl => _imgUrl;

  FutureOr<void> existingAvatarClicked(
      ExistingAvatarClicked event, Emitter<ProfilePictureState> emit) {
    _imgUrl = event.url;
    emit(ProfilePictureSelectedState(url: event.url));
  }

  Future<FutureOr<void>> imageUploadButtonClickedEvent(
      ImageUploadButtonClickedEvent event,
      Emitter<ProfilePictureState> emit) async {
    emit(ProfilePictureUploadingState());
    try {
      _imgUrl = await profilePictureRepository.getImageLink(event.imageSource);
      emit(ProfilePictureSelectedState(url: _imgUrl));
    } on CustomException catch (e) {
      emit(ProfilePictureUploadErrorState(message: e.message));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> continueButtonClicked(
      ContinueButtonClicked event, Emitter<ProfilePictureState> emit) {
    emit(NavigateToHomeScreen());
  }
}
