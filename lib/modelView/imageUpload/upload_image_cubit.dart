import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  Offset position = Offset.zero;

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  /// Pick an image from the gallery
  Future<void> pickImage() async {
    emit(PickingImage()); // Emit loading state

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        selectedImage = File(image.path);
        emit(ImagePicked());
      } else {
        emit(
            UploadImageInitial()); // Reset to initial state if no image is picked
      }
    } catch (e) {
      emit(UploadImageError("Failed to pick an image: $e"));
    }
  }

  void updatePosition(Offset newPosition) {
    position = newPosition;
    emit(NewPosition());
  }
}
