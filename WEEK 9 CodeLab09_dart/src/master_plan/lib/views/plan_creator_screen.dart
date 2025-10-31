import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import './plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Langkah 11: Method build utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans Rifda')),
      body: Column(children: [
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ]),
    );
  }

  // Langkah 12: Widget untuk TextField
  Widget _buildListCreator() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Theme.of(context).cardColor,
          elevation: 10,
          child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                  labelText: 'Add a plan',
                  contentPadding: EdgeInsets.all(20)),
              onEditingComplete: addPlan),
        ));
  }

  // Langkah 13: Logika untuk menambah Rencana baru
  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);

    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Langkah 14: Widget untuk menampilkan daftar Rencana (VERSI DIPERBAIKI)
  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ValueListenableBuilder<List<Plan>>(
      valueListenable: planNotifier,
      builder: (context, plans, child) {

        if (plans.isEmpty) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.note, size: 100, color: Colors.grey),
                Text('Anda belum memiliki rencana apapun.',
                    style: Theme.of(context).textTheme.headlineSmall)
              ]);
        }

        return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return ListTile(
                  title: Text(plan.name),
                  subtitle: Text(plan.completenessMessage),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PlanScreen(plan: plan)));
                  });
            });
      },
    );
  }
}