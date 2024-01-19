import 'package:digitalsobolgroup/common/styles/constants_theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SiginInPhoneFieldWidget extends StatefulWidget {
  const SiginInPhoneFieldWidget({
    Key? key,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final String? errorText;

  @override
  State<SiginInPhoneFieldWidget> createState() =>
      _SiginInPhoneFieldWidgetState();
}

class _SiginInPhoneFieldWidgetState extends State<SiginInPhoneFieldWidget> {
  bool isFocused = false;
  final borderColor = const Color.fromRGBO(217, 217, 217, 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            'Номер телефона',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.38,
                  color: isFocused
                      ? AppColors
                          .resigtrationwBackground // Скрываем hint при фокусировке
                      : AppColors.textColorDarker,
                ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textColorDarker,
              ),
          decoration: InputDecoration(
            prefix: const Text('+7 '),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            prefixStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.textColorDarker,
                ),
            hintText: '+7',
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                  color: isFocused
                      ? AppColors
                          .resigtrationwBackground // Скрываем hint при фокусировке
                      : AppColors.textColorDarker,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: Theme.of(context)
                  .inputDecorationTheme
                  .focusedBorder!
                  .borderSide
                  .copyWith(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: Theme.of(context)
                  .inputDecorationTheme
                  .enabledBorder!
                  .borderSide
                  .copyWith(color: borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: Theme.of(context)
                  .inputDecorationTheme
                  .errorBorder!
                  .borderSide,
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: Theme.of(context)
                  .inputDecorationTheme
                  .focusedErrorBorder!
                  .borderSide
                  .copyWith(color: borderColor),
            ),
            errorText: widget.errorText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Введите номер телефона';
            } else if (value.length < 8) {
              return 'Номер телефона должен содержать не менее 10 цифр';
            }
            return null;
          },
          inputFormatters: [maskFormatter],
          enableInteractiveSelection: false,
          onTap: () {
            setState(() {
              isFocused = true;
            });
          },
          onFieldSubmitted: (value) {
            setState(() {
              isFocused = false;
            });
          },
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                isFocused = false;
              });
            }
          },
        )
      ],
    );
  }
}

var maskFormatter = MaskTextInputFormatter(
  mask: '(###) ###-##-##',
  filter: {"#": RegExp(r'[0-9]')},
);
