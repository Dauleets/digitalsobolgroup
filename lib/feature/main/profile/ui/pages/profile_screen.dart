import 'dart:io';

import 'package:aezakmi/common/utils/show_custom_snack_bar.dart';
import 'package:aezakmi/feature/main/profile/ui/bloc/photo_bloc/photo_bloc.dart';
import 'package:aezakmi/feature/main/profile/ui/pages/names_fields_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreenWidget extends StatefulWidget {
  const MyProfileScreenWidget({
    super.key,
  });

  @override
  State<MyProfileScreenWidget> createState() => _MyProfileScreenWidgetState();
}

class _MyProfileScreenWidgetState extends State<MyProfileScreenWidget> {
  late bool isCamera;
  File? _imageFile;
  @override
  void initState() {
    BlocProvider.of<PhotoProfileBloc>(context).add(GetAvatarEvent());
    super.initState();
  }

  Future<void> _deleteImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Подтверждение',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Text('Хотите удалить фото аватара?',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          actions: [
            TextButton(
              onPressed: () {
                BlocProvider.of<PhotoProfileBloc>(context)
                    .add(const SaveAvatarEvent(
                  path: null,
                ));
                setState(() {
                  _imageFile = null;
                  BlocProvider.of<PhotoProfileBloc>(context)
                      .add(GetAvatarEvent());
                });

                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'Удалить',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Отменить',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPhotoFullScreen(BuildContext context) async {
    if (_imageFile != null) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    '${_imageFile?.path}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> _pickPhoto() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(13))),
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 43,
                    child: Center(
                      child: Text(
                        'Выберите фото',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(125, 125, 125, 1)),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          'Камера',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Закрываем диалоговое окно
                      _pickImage(
                          ImageSource.camera); // Выбираем изображение с камеры
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          'Галерея Фото',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                  if (_imageFile != null)
                    Column(
                      children: [
                        Divider(
                          height: 1,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: _deleteImage,
                          child: SizedBox(
                            height: 60,
                            child: Center(
                              child: Text(
                                'Удалить Фото',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(13))),
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      'Закрыть',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Закрываем диалоговое окно
                  _pickImage(
                      ImageSource.camera); // Выбираем изображение с камеры
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'Подтверждение',
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
            content: Text('Хотите сохранить выбранную фотографию?',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            actions: [
              TextButton(
                onPressed: () {
                  if (kDebugMode) {
                    print(_imageFile!.path);
                  }
                  BlocProvider.of<PhotoProfileBloc>(context)
                      .add(SaveAvatarEvent(
                    path: _imageFile!.path,
                  ));

                  Navigator.pop(context);
                },
                child: Text('Да',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ),
              TextButton(
                onPressed: () {
                  // context.read<ProfileBloc>().add(ProfileDeleteAvatar());

                  Navigator.pop(context);
                  setState(() {
                    _imageFile = null;
                  });
                },
                child: Text('Оменить',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.error)),
              ),
            ],
          );
        },
      );
    } else {
      showCustomSnackBar(context, 'Вы не выбрали фотографию');
      // The user canceled the file selection
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotoProfileBloc, PhotoProfileState>(
      listener: (context, state) {
        if (state is GetAvatarLoaded) {
          setState(() {
            _imageFile = File(state.avatar);
          });
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Stack(
                children: [
                  _imageFile == null
                      ? CircleAvatar(
                          radius: 42.7,
                          backgroundColor:
                              const Color.fromRGBO(227, 227, 227, 1),
                          child: SvgPicture.asset(
                            'assets/images/person.svg',
                            width: 60,
                            fit: BoxFit.cover,
                          ))
                      : GestureDetector(
                          onTap: () => _showPhotoFullScreen(context),
                          child: SizedBox(
                            height: 85,
                            width: 85,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : null,
                              child: _imageFile != null
                                  ? null
                                  : const Placeholder(
                                      fallbackHeight: 85,
                                      fallbackWidth: 85,
                                    ),
                            ),
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    right: -15,
                    child: IconButton(
                      onPressed: _pickPhoto,
                      icon: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Icon(
                          Icons.more_horiz,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: Text(
              'apollo@gmail.com',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: const Color.fromRGBO(125, 125, 125, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            )),
            const SizedBox(height: 40),
            const NamesFieldsProfileWidget(),
          ],
        );
      },
    );
  }
}
