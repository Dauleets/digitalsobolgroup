import 'package:digitalsobolgroup/common/styles/constants_theme/colors.dart';

import 'package:flutter/material.dart';

class NamesFieldWidget extends StatefulWidget {
  const NamesFieldWidget({
    Key? key,
    required this.controller,
    this.errorText,
    required this.titleHint,
  }) : super(key: key);

  final TextEditingController controller;
  final String titleHint;
  final String? errorText;

  @override
  State<NamesFieldWidget> createState() => _NamesFieldWidgetState();
}

class _NamesFieldWidgetState extends State<NamesFieldWidget> {
  bool isFocused = false;
  final borderColor = const Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textColorDarker,
          ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hintText: widget.titleHint,
        hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.32,
              color: Theme.of(context).colorScheme.shadow,
            ),
        filled: true,
        fillColor: const Color.fromRGBO(253, 253, 253, 1),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        errorText: widget.errorText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      controller: widget.controller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Введите ${widget.titleHint}';
        }
        return null;
      },
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
    );
  }
}
