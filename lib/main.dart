import 'package:digitalsobolgroup/feature/main/profile/ui/bloc/names_bloc/names_bloc.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/bloc/photo_bloc/photo_bloc.dart';
import 'package:digitalsobolgroup/feature/registration/ui/pages/registration_first/registration_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/styles/theme.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<PhotoProfileBloc>()),
        BlocProvider(create: (context) => di.sl<NamesProfileBloc>()),
      ],
      child: MaterialApp(
        title: 'Digital Sobol Group',
        theme: Styles.themeData(context),
        debugShowCheckedModeBanner: false,
        home: const RegistrationFirst(),
      ),
    );
  }
}
