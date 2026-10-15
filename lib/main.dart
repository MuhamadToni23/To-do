import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTasks(),
    );
  }
}

class MyTasks extends StatefulWidget {
  const MyTasks({super.key});

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  List<String> titles = ['Task #1', 'Task #2', 'Task #3'];

  List<String> descriptions = [
    'Item #1, Item #2,',
    'Task #2 Description:',
    'Task #3 Description:',
  ];

  final blue = const Color(0xFFADD8E6);
  final green = const Color(0xFFA8D1A5);

  void addTask() {
    if (titleController.text.trim().isNotEmpty) {
      setState(() {
        titles.add(titleController.text.trim());
        descriptions.add(descController.text.trim());

        titleController.clear();
        descController.clear();
      });
    }
  }

  // @override
  // void dispose() {
  //   titleController.dispose();
  //   descController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 125,
              color: blue,
              child: const Center(
                child: Text(
                  'My Tasks',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      filled: true,
                      fillColor: green,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: descController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      filled: true,
                      fillColor: green,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: addTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.check_circle_outline, size: 20),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Text(
                                titles[index],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          width: double.infinity,
                          height: 2,
                          color: const Color(0xFFB7DDE5),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          descriptions[index],
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              height: 60,
              color: blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'My Tasks',
                        applicationVersion: '1.0.0',
                      );
                    },
                    icon: const Icon(Icons.info_outline),
                  ),

                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Menu Share dipilih')),
                      );
                    },
                    icon: const Icon(Icons.share_outlined),
                  ),

                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('My Tasks')));
                    },
                    icon: const Icon(Icons.center_focus_strong),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        titles.sort();
                        descriptions.sort();
                      });
                    },
                    icon: const Icon(Icons.sort),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
