import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stopwatch/stopwatch.dart';
import 'package:stopwatch/timer_painter.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
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
      home: const StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_TimerPanel(), _ControlButtons()],
        ),
      ),
    );
  }
}

class _TimerPanel extends ConsumerWidget {
  const _TimerPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration =
        ref.watch(stopwatchProvider.select((state) => state.duration));

    final minutesDigit = duration.inMinutes % 10;
    final secondsDigits = [
      (duration.inSeconds % 60) ~/ 10,
      duration.inSeconds % 10,
    ];
    final millisecondsDigits = [
      (duration.inMilliseconds % 1000) ~/ 100,
      (duration.inMilliseconds % 100) ~/ 10
    ];

    return Container(
      color: Theme.of(context).focusColor,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(flex: 1618, child: DigitWidget(digit: minutesDigit)),
            const ColonWidget(
              activated: true,
            ),
            ...List.generate(
                2,
                (index) => Expanded(
                    flex: 1618,
                    child: DigitWidget(digit: secondsDigits[index]))),
            ...List.generate(
                2,
                (index) => Expanded(
                      flex: 1000,
                      child: DigitWidget(digit: millisecondsDigits[index]),
                    ))
          ],
        ),
      ),
    );
  }
}

class _ControlButtons extends ConsumerWidget {
  const _ControlButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      ElevatedButton(
          onPressed: () {
            ref.read(stopwatchProvider.notifier).reset();
          },
          child: const Text("Reset")),
      const VerticalDivider(),
      ElevatedButton(
          onPressed: () {
            final onRunning =
                ref.read(stopwatchProvider.select((state) => state.onRunning));

            final stopwatch = ref.read(stopwatchProvider.notifier);

            if (onRunning) {
              stopwatch.stop();
            } else {
              stopwatch.start();
            }
          },
          child: const IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Start"),
                Divider(
                  height: 2,
                ),
                Text("Stop")
              ],
            ),
          ))
    ]);
  }
}
