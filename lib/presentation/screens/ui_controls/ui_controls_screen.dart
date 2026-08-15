import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({super.key});

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, ship, bicycle }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
        title: const Text('Developer Mode'),
        subtitle: const Text('Controla si el modo desarrollador está activo'),
        value: isDeveloperMode,
        onChanged: (value) => setState(() {
          isDeveloperMode = !isDeveloperMode;
        }),
      ),
      ExpansionTile(
          title: const Text('Vehículos'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Transportation by car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('Transportation by plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('Ship'),
              subtitle: const Text('Transportation by ship'),
              value: Transportation.ship,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.ship;
              }),
            ),
            RadioListTile(
              title: const Text('Bicycle'),
              subtitle: const Text('Transportation by bicycle'),
              value: Transportation.bicycle,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.bicycle;
              }),
            ),
          ]),
      CheckboxListTile(
        title: const Text('Desayuno'),
        value: wantsBreakfast,
        onChanged: (value) => setState(() {
          wantsBreakfast = !wantsBreakfast;
        }),
      ),
      CheckboxListTile(
        title: const Text('Almuerzo'),
        value: wantsLunch,
        onChanged: (value) => setState(() {
          wantsLunch = !wantsLunch;
        }),
      ),
      CheckboxListTile(
        title: const Text('Cena'),
        value: wantsDinner,
        onChanged: (value) => setState(() {
          wantsDinner = !wantsDinner;
        }),
      ),
    ]);
  }
}
