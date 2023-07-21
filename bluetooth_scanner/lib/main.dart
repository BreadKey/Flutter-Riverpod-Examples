import 'package:bluetooth_scanner/bluetooth_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permission = ref.watch(isBluetoothAvailableProvider);
    return Material(
      child: permission.when(
          data: (_) {
            return const ScanPage();
          },
          error: (e, stackTrace) {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.refresh(isBluetoothAvailableProvider);
                  },
                  child: Text("Retry permission")),
            );
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

class ScanPage extends ConsumerWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(bluetoothScannerProvider.select((state) => state.enabled));
    final isScanning =
        ref.watch(bluetoothScannerProvider.select((state) => state.isScanning));

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: enabled
                  ? () async {
                      final scanner = ref.read(bluetoothScannerProvider.notifier);
                      if (isScanning) {
                        return scanner.stopScan();
                      } else {
                        return scanner.startScan();
                      }
                    }
                  : null,
              child: Text(isScanning ? "Stop Scan" : "Start Scan"))
        ],
      ),
      body: const ScanResultListView(),
    );
  }
}

class ScanResultListView extends ConsumerWidget {
  const ScanResultListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results =
        ref.watch(bluetoothScannerProvider.select((state) => state.scanResults));

    return ListView.builder(
      itemBuilder: (context, index) {
        final result = results[index];
        return Card(
            key: ValueKey(result.device.remoteId.str),
            child: ListTile(
              title: Text(result.device.remoteId.str),
              subtitle: Text(result.device.localName),
              trailing: Text("${result.rssi}"),
            ));
      },
      itemCount: results.length,
    );
  }
}
