import 'package:digitalsobolgroup/feature/main/home/ui/my_projects.dart';
import 'package:digitalsobolgroup/feature/main/profile/ui/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _currentIndex == 0 ? 20 : 45,
        title: _currentIndex == 0
            ? const Text('')
            : Text(
                'Аккаунт',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
              ),
        leadingWidth: 130,
        leading: _currentIndex == 0
            ? null
            : InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
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
                        'Мой аккаунт',
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
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          MyProjectsScreenWidget(),
          MyProfileScreenWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Мои проекты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Мой аккаунт',
          ),
        ],
      ),
    );
  }
}
