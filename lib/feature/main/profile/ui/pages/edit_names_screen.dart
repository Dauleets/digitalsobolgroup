import 'package:digitalsobolgroup/common/styles/constants_theme/size.dart';
import 'package:digitalsobolgroup/common/utils/show_custom_snack_bar.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/bloc/names_bloc/names_bloc.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/widgets/names_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNamesProfilePageWidget extends StatefulWidget {
  final String titleAppbar;
  final String? text;

  const EditNamesProfilePageWidget({
    super.key,
    required this.titleAppbar,
    this.text,
  });

  @override
  State<EditNamesProfilePageWidget> createState() =>
      _EditNamesProfilePageWidgetState();
}

class _EditNamesProfilePageWidgetState
    extends State<EditNamesProfilePageWidget> {
  bool contr1 = false;
  late TextEditingController _controller;
  late GlobalKey<FormState> _editNamesInProfiletKey;

  @override
  void initState() {
    _editNamesInProfiletKey = GlobalKey<FormState>();
    _controller = TextEditingController();
    if (widget.text != null) {
      _controller.text = widget.text!;
    }
    _controller.addListener(_updateControllerState);
    super.initState();
  }

  void _updateControllerState() {
    setState(() {
      contr1 = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: Text(
          'Ваше ${widget.titleAppbar}',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        leadingWidth: 130,
        leading: InkWell(
          onTap: () => _handleSignInButtonPressed(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              Flexible(
                child: Text(
                  'Аккаунт',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeConfig.paddingHoriontal,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Form(
                key: _editNamesInProfiletKey,
                child: NamesFieldWidget(
                  controller: _controller,
                  titleHint: 'Ваше ${widget.titleAppbar}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignInButtonPressed(BuildContext context) {
    if (_editNamesInProfiletKey.currentState!.validate()) {
      if (_controller.text.isEmpty) {
        showCustomSnackBar(context, 'Пожалуйста, заполните все поля!');
      } else {
        if (widget.titleAppbar == 'Имя') {
          BlocProvider.of<NamesProfileBloc>(context)
              .add(SaveNameEvent(name: _controller.text));
          BlocProvider.of<NamesProfileBloc>(context).add(GetNameEvent());
        } else if (widget.titleAppbar == 'Фамилия') {
          BlocProvider.of<NamesProfileBloc>(context)
              .add(SaveFemaleEvent(female: _controller.text));
          BlocProvider.of<NamesProfileBloc>(context).add(GetFemaleEvent());
        }

        Navigator.pop(context);
      }
    } else {
      showCustomSnackBar(context, 'Пожалуйста, заполните все поля!');
    }
  }
}
