import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';
import 'success_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'addListener of ChangeNotifier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? searchTerm;
  late final AppProvider appProv;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appProv = context.read<AppProvider>();
    appProv.addListener(appListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    appProv.removeListener(appListener);
    super.dispose();
  }

  void appListener() {
    if (appProv.state == AppState.success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SuccessPage();
          },
        ),
      );
    } else if (appProv.state == AppState.error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Something wrong'),
          );
        },
      );
    }
  }

  void submit() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
    final form = formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context.read<AppProvider>().getResult(context, searchTerm!);
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppProvider>().state;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Search!!!!!'),
                      prefixIcon: Icon(Icons.search),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Search term required!';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      searchTerm = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text(
                      appState == AppState.loading
                          ? 'Loading...'
                          : 'Get Result',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    onPressed: appState == AppState.loading ? null : submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
