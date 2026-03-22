import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> calculations;

  const HistoryScreen({Key? key, required this.calculations}) : super(key: key);

  List<String> _splitEntry(String entry) {
    final separatorIndex = entry.lastIndexOf(' = ');
    if (separatorIndex == -1) return [entry, ''];
    final expression = entry.substring(0, separatorIndex).trim();
    final result = entry.substring(separatorIndex + 3).trim();
    return [expression, result];
  }

  @override
  Widget build(BuildContext context) {
    final entries = calculations.reversed.toList();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.calculationHistoryTitle),
      ),
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.orange.shade50,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    l10n.historyItems(entries.length),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if (entries.isEmpty)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.92),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.history_toggle_off, size: 52, color: Colors.blueAccent),
                            const SizedBox(height: 10),
                            Text(
                              l10n.noHistoryYet,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              l10n.historyWillAppear,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: entries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final parts = _splitEntry(entries[index]);
                        final expression = parts[0];
                        final result = parts[1];
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.94),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                expression,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (result.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(
                                  '= $result',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}