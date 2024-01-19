import 'package:digitalsobolgroup/feature/main/profile/ui/bloc/names_bloc/names_bloc.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/pages/edit_names_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamesFieldsProfileWidget extends StatefulWidget {
  const NamesFieldsProfileWidget({super.key});

  @override
  State<NamesFieldsProfileWidget> createState() =>
      _NamesFieldsProfileWidgetState();
}

class _NamesFieldsProfileWidgetState extends State<NamesFieldsProfileWidget> {
  String? name;
  String? female;

  @override
  void initState() {
    BlocProvider.of<NamesProfileBloc>(context).add(GetFemaleEvent());

    BlocProvider.of<NamesProfileBloc>(context).add(GetNameEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NamesProfileBloc, NamesProfileState>(
      listener: (context, state) {
        if (state is GetNameLoaded) {
          setState(() {
            name = state.name;
          });
        }
        if (state is GetFemamleLoaded) {
          setState(() {
            female = state.female;
          });
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditNamesProfilePageWidget(
                        titleAppbar: 'Имя',
                        text: name,
                      ),
                    ),
                  );
                  BlocProvider.of<NamesProfileBloc>(context)
                      .add(GetNameEvent());
                },
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(253, 253, 253, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13),
                    ),
                  ),
                  width: double.infinity,
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Имя',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Row(
                          children: [
                            Text(
                              name != null ? name! : 'Настроить',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.shadow,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).colorScheme.shadow,
                              size: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 2,
                color: Theme.of(context).colorScheme.shadow,
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditNamesProfilePageWidget(
                        titleAppbar: 'Фамилия',
                        text: female,
                      ),
                    ),
                  );
                  BlocProvider.of<NamesProfileBloc>(context)
                      .add(GetFemaleEvent());
                },
                padding: EdgeInsets.zero,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(253, 253, 253, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Фамилия',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text(
                              female != null ? female! : 'Настроить',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).colorScheme.shadow,
                              size: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 2,
                color: Theme.of(context).colorScheme.shadow,
              ),
            ],
          ),
        );
      },
    );
  }
}
