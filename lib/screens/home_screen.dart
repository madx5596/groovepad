import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sample_provider.dart';
import '../widgets/sample_cell.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroovePad'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2a2a2a),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              _showClearDialog(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<SampleProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return SampleCell(
                          index: index,
                          sample: provider.samples[index],
                          onTap: () => provider.playSample(index),
                          onLongPress: () => provider.removeSample(index),
                          onAdd: () => provider.loadSample(index),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => provider.stopSample(),
                        icon: const Icon(Icons.stop),
                        label: const Text('Стоп'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showClearDialog(context);
                        },
                        icon: const Icon(Icons.clear_all),
                        label: const Text('Очистить всё'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showClearDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Очистить всё?'),
          content: const Text(
              'Это удалит все загруженные семплы. Вы уверены?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                context.read<SampleProvider>().clearAllSamples();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Удалить',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
