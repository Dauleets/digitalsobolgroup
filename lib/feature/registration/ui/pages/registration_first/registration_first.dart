import 'package:digitalsobolgroup/common/components/main_button.dart';
import 'package:digitalsobolgroup/common/components/phone_field_widget.dart';
import 'package:digitalsobolgroup/common/styles/constants_theme/colors.dart';
import 'package:digitalsobolgroup/common/styles/constants_theme/size.dart';
import 'package:digitalsobolgroup/common/utils/show_custom_snack_bar.dart';
import 'package:digitalsobolgroup/feature/registration/ui/pages/registration_second/registration_second.dart';
import 'package:digitalsobolgroup/feature/registration/ui/widgets/screen_number.dart';
import 'package:digitalsobolgroup/feature/registration/ui/widgets/titles_resigtration.dart';
import 'package:flutter/material.dart';

class RegistrationFirst extends StatefulWidget {
  const RegistrationFirst({super.key});

  @override
  State<RegistrationFirst> createState() => _RegistrationFirstState();
}

class _RegistrationFirstState extends State<RegistrationFirst> {
  bool contr1 = false;
  late TextEditingController _phoneController;
  late GlobalKey<FormState> _registrationFirstKey;

  @override
  void initState() {
    _registrationFirstKey = GlobalKey<FormState>();
    _phoneController = TextEditingController();

    _phoneController.addListener(_updateControllerState);
    super.initState();
  }

  void _updateControllerState() {
    setState(() {
      contr1 = _phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.resigtrationwBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeConfig.paddingHoriontal,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const ScreenNumberWidgets(number: 1),
              const TitlesRegistrationWidget(
                  title1: 'Регистрация',
                  title2: 'Введите номер телефона\nдля регистрации'),
              Form(
                key: _registrationFirstKey,
                child: SiginInPhoneFieldWidget(
                  controller: _phoneController,
                ),
              ),
              const SizedBox(height: 80),
              _phoneController.text.length >= 15
                  ? MainButton(
                      widget: Text(
                        'Отправить смс-код',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24),
                      ),
                      onPressed: () => _handleSignInButtonPressed(context),
                      active: contr1,
                    )
                  : DisableMainButton(
                      widget: Text(
                        'Отправить смс-код',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24),
                      ),
                    ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.07,
                      ),
                  children: [
                    const TextSpan(
                      text:
                          'Нажимая на данную кнопку, вы даете\nсогласие на обработку ',
                      style: TextStyle(color: AppColors.buttonColor),
                    ),
                    TextSpan(
                      text: 'персональных данных',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignInButtonPressed(BuildContext context) {
    if (_registrationFirstKey.currentState!.validate()) {
      if (_phoneController.text.isEmpty) {
        showCustomSnackBar(context, 'Пожалуйста, заполните все поля!');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegistrationSecond(
                    phoneText: '+7${_phoneController.text}',
                  )),
        );
      }
    } else {
      showCustomSnackBar(context, 'Пожалуйста, заполните все поля!');
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
