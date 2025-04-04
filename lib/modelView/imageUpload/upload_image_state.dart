part of 'upload_image_cubit.dart';

@immutable
sealed class UploadImageState {}

final class UploadImageInitial extends UploadImageState {}

final class PickingImage extends UploadImageState {}

class ImagePicked extends UploadImageState {}

class UploadImageError extends UploadImageState {
  final String message;

  UploadImageError(this.message);
}

final class NewPosition extends UploadImageState {}
