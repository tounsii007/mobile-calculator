import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/calculator_provider.dart';
import '../widgets/display_widget.dart';
import '../widgets/keypad_widget.dart';
import '../widgets/memory_widget.dart';
import 'history_screen.dart';
import 'scientific_mode_screen.dart';
import 'settings_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  void _handleButton(BuildContext context, String value) {
    final p = context.read<CalculatorProvider>();
    switch (value) {
      case '=':
        p.calculate();
        break;
      case 'C':
        p.clear();
        break;
      case '⌫':
        p.backspace();
        break;
      case '+/-':
        p.toggleSign();
        break;
      case '%':
        p.percentage();
        break;
      default:
        p.input(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalculatorProvider>();
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.calculatorTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: l10n.historyTooltip,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    HistoryScreen(calculations: provider.history.toList()),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.science),
            tooltip: l10n.scientificTooltip,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScientificModeScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: l10n.settingsTooltip,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DisplayWidget(
                  currentInput: provider.expression.isEmpty
                      ? provider.result
                      : provider.expression,
                  previousOperations:
                      provider.expression.isEmpty ? '' : provider.result,
                ),
              ),
            ),
            const MemoryWidget(),
            Expanded(
              flex: 3,
              child: KeypadWidget(
                onButtonPressed: (value) => _handleButton(context, value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}