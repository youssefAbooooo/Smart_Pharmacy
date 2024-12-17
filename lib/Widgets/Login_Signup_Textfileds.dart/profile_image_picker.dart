import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileImagePicker extends StatefulWidget {
  final Function(File?) onImageSelected;

  const ProfileImagePicker({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _profileImage;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
        widget.onImageSelected(_profileImage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Stack(
            alignment: Alignment.center, // Center the icon over the image
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  border: Border.all(color: primaryColor, width: 2),
                  color: whiteColor,
                ),
                child: _profileImage != null
                    ? ClipOval(
                        // Circular cropping for the image
                        child: Image.file(
                          _profileImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(
                        Icons.person, // Default icon if no image is selected
                        color: primaryColor,
                        size: 60,
                      ),
              ),
              Positioned(
                bottom: 0, // Align the plus icon at the bottom
                right: 0,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: blackColor, // Plus icon background color
                  ),
                  child: const Icon(
                    Icons.add, // Plus icon
                    color: whiteColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
