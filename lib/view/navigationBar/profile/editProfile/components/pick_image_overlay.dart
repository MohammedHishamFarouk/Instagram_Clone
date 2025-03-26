import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/imageUpload/upload_image_cubit.dart';

class PickImageOverlay extends StatelessWidget {
  final Widget child;

  const PickImageOverlay({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (state is ImagePicked)
              BlocBuilder<UploadImageCubit, UploadImageState>(
                builder: (context, state) {
                  return Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: FileImage(
                            context.watch<UploadImageCubit>().selectedImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            if (state is PickingImage || state is ImagePicked)
              // Overlay with hole
              Positioned.fill(
                child: BlocBuilder<UploadImageCubit, UploadImageState>(
                  buildWhen: (previous, current) => current is NewPosition,
                  builder: (context, state) {
                    return CustomPaint(
                      painter: _HolePainter(
                        position: context.watch<UploadImageCubit>().position,
                      ),
                    );
                  },
                ),
              ),
            FilledButton(
              onPressed: () => context.read<UploadImageCubit>().pickImage(),
              child: const Text('press'),
            ),
          ],
        );
      },
    );
  }
}

// Custom Painter to cut a hole
class _HolePainter extends CustomPainter {
  final Offset position;

  _HolePainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.8);
    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Define the hole area
    final holeRect = Rect.fromCircle(
      center: position == Offset.zero
          ? Offset(size.width / 2, size.height / 2)
          : position,
      radius: 100,
    );
    path.addOval(holeRect);
    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
