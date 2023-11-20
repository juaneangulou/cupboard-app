import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cupboard_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:my_cupboard_app/features/dependent/domain/entities/dependent.dart';
import 'package:my_cupboard_app/features/dependent/domain/repositories/dependent_repository.dart';
import 'package:my_cupboard_app/features/dependent/infrastructure/repositories/dependent_repository_impl.dart';
import 'package:my_cupboard_app/features/shared/infrastructure/services/key_value_storage_service_impl.dart';
import 'package:my_cupboard_app/features/shared/widgets/side_menu.dart';

class DependentsListScreen extends ConsumerWidget {
  final DependentRepositoryImpl repository = DependentRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  final token = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey), //
      appBar: AppBar(
        title: Text('Dependents'),
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showAddDialog(context),
          ),
        ],
      ),
      body: FutureBuilder<List<Dependent?>>(
        future: repository.GetDependent(
            ref.watch(authProvider).userInfo?.userId ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No dependents found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Dependent? dependent = snapshot.data![index];
                if (dependent != null) {
                  return DependentDetailCard(dependent: dependent);
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          }
        },
      ),
      // body: Text('DependentsListScreen'),
    );
  }
}

class DependentDetailCard extends StatelessWidget {
  final Dependent dependent;

  DependentDetailCard({required this.dependent});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(dependent.name),
        subtitle: Text('DOB: ${dependent.dateOfBirth}'),
         trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Acción para actualizar
                // Por ejemplo: Navigator.pushNamed(context, '/edit-dependent', arguments: dependent);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Acción para eliminar
                // Puedes mostrar un diálogo de confirmación aquí antes de proceder
              },
            ),
            IconButton(
              icon: Icon(Icons.medical_services),
              onPressed: () {
                // Acción para ver vacunas
                // Por ejemplo: Navigator.pushNamed(context, '/dependent-vaccines', arguments: dependent);
              },
            ),
          ],
        ),
      ),
    );
  }
}
void showAddDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Agregar Nuevo Elemento'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              // Otros campos del formulario
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Guardar'),
            onPressed: () {
              // Lógica para guardar la información
            },
          ),
        ],
      );
    },
  );
}
