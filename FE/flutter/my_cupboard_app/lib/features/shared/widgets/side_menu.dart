import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_cupboard_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:my_cupboard_app/features/shared/widgets/custom_filled_button.dart';

class SideMenu extends ConsumerStatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;
    

    return NavigationDrawer(
      elevation: 1,
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {

        setState(() {
          navDrawerIndex = value;
        });

        // final menuItem = appMenuItems[value];
        // context.push( menuItem.link );
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
          child: Text('Saludos', style: textStyles.titleMedium ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 10),
          child:  Consumer(
                builder: (context, ref, child) {
                  final userInfo = ref.watch(authProvider).userInfo;
                  String fullName =
                      '${userInfo?.firstName ?? ''} ${userInfo?.lastName ?? ''}'
                          .trim();
                  return Text(fullName.isNotEmpty ? fullName : 'No name');
                },
              ),
        ),

        const NavigationDrawerDestination(
            icon: Icon( Icons.home_outlined ), 
            label: Text( 'Home' ),
                         
        ),

        const NavigationDrawerDestination(
            icon: Icon( Icons.person_outline ), 
            label: Text( 'My Dependents' ),
                         
        ),


        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Otras opciones'),
        ),

        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomFilledButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout('');
            },
            text: 'Cerrar sesión'
          ),
        ),

      ]
    );
  }
}