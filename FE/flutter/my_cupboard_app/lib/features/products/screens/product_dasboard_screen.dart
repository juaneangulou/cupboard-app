import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_cupboard_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:my_cupboard_app/features/shared/widgets/side_menu.dart';
import 'package:my_cupboard_app/features/user/domain/entities/user-info.dart';

class ProductDashboardScreen extends StatelessWidget {
  ProductDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(
          scaffoldKey:
              scaffoldKey), // Asegúrate de que SideMenu esté definido correctamente
      appBar: AppBar(
        title: const Text('My Vaccine App - Home'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Icon(
              Icons.production_quantity_limits_rounded,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 80),
            DependentsGridView(), // Se elimina el Expanded alrededor del DependentsGridView
          ],
        ),
      ),
    );
  }
}

class DependentsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 1;
        // Se ajusta el tamaño del GridView
        return SizedBox(
          // Se proporciona una altura al GridView
          height: 600, // Ajusta esta altura según tus necesidades
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3,
            ),
            itemCount: 1, // Ajusta este valor según tus necesidades
            itemBuilder: (context, index) {
              return DependentsCard();
            },
          ),
        );
      },
    );
  }
}

class DependentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.group, size: 30),
                SizedBox(width: 8),
                Consumer(
                  builder: (context, ref, child) {
                    final userInfo = ref.watch(authProvider).userInfo;
                    
                    return Text('You have ${userInfo?.dependents?.length??0} dependents',   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
                  },
                ),                
              ],
            ),
            ElevatedButton(
              onPressed: () {
                    context.go('/dependents-view');

              },
              child: Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}
