import 'dart:async';
import 'package:digitalsobolgroup/common/styles/constants_theme/colors.dart';
import 'package:digitalsobolgroup/common/styles/constants_theme/size.dart';
import 'package:digitalsobolgroup/feature/main/home/ui/home.dart';
import 'package:digitalsobolgroup/feature/registration/ui/widgets/screen_number.dart';
import 'package:digitalsobolgroup/feature/registration/ui/widgets/titles_resigtration.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegistrationSecond extends StatefulWidget {
  final String phoneText;
  const RegistrationSecond({super.key, required this.phoneText});

  @override
  State<RegistrationSecond> createState() => _RegistrationSecondState();
}

class _RegistrationSecondState extends State<RegistrationSecond> {
  bool contr1 = false;
  bool isFocused = false;
  int timerSeconds = 60;
  bool isTimerRunning = false;

  late Timer _timer;

  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  late GlobalKey<FormState> _registrationSecondKey;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        setState(() {
          timerSeconds--;
        });
      } else {
        _timer.cancel();
        setState(() {
          isTimerRunning = false;
        });
      }
    });
  }

  @override
  void initState() {
    _registrationSecondKey = GlobalKey<FormState>();

    super.initState();
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
              const ScreenNumberWidgets(number: 2),
              TitlesRegistrationWidget(
                  title1: 'Подтверждение',
                  title2:
                      'Введите код, который мы отправили\nв SMS на ${widget.phoneText}'),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  key: _registrationSecondKey,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 5,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 28, fontWeight: FontWeight.w400),
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      errorBorderColor: AppColors.mainColorGrey,
                      disabledColor: AppColors.mainColorGrey,
                      inactiveColor: AppColors.mainColorGrey,
                      activeColor: AppColors.mainColorGrey,
                      selectedColor: AppColors.mainColorGrey,
                      inactiveFillColor: AppColors.mainColorGrey,
                      selectedFillColor: AppColors.mainColorGrey,
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    inputFormatters: [maskFormatter],
                    onChanged: (value) {},
                    onCompleted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePageWidget()),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: isTimerRunning
                    ? null
                    : () {
                        setState(() {
                          timerSeconds = 60;
                          isTimerRunning = true;
                        });
                        startTimer();
                      },
                child: Text(
                  isTimerRunning
                      ? '$timerSeconds сек до повтора отправки кода'
                      : 'Отправить код еще раз',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: isTimerRunning
                            ? Theme.of(context).textTheme.titleMedium!.color
                            : Theme.of(context).colorScheme.secondary,
                        letterSpacing: -0.24,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '#####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void dispose() {
    super.dispose();
  }
}
