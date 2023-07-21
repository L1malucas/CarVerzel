// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../Services/admin_request.dart';
import '../Widgets/fixed_spacer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameFormController = TextEditingController();
  final _passwordFormController = TextEditingController();
  String? userToken;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(color: Colors.grey.shade800),
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Acesso de Administrador',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      FixedSpacer.vSmaller(),
                      const Text(
                        'Necessário acesso para incluir, editar e excluir carros',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      FixedSpacer.vNormal(),
                      Center(
                        child: SizedBox(
                          child: DataTable(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              columnSpacing:
                                  (MediaQuery.of(context).size.width / 10) *
                                      0.5,
                              columns: const [
                                DataColumn(
                                  label: Text('Name'),
                                ),
                                DataColumn(
                                  label: Text('Password'),
                                ),
                                DataColumn(
                                  label: Text('Role'),
                                ),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('batman')),
                                  DataCell(Text('wayne')),
                                  DataCell(Text('admin')),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                FixedSpacer.vBiggest(),
                SizedBox(
                  width: width * 0.9,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _userNameFormController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            hintText: "Digite seu nome",
                            border: const OutlineInputBorder(),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        FixedSpacer.vNormal(),
                        TextFormField(
                          controller: _passwordFormController,
                          keyboardType: TextInputType.name,
                          // obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Digite sua senha",
                            border: const OutlineInputBorder(),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        FixedSpacer.vNormal(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minHeight: 60, minWidth: 200),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(24.0),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                            onPressed: () {
                              _handleLogin();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
   
    if (_formKey.currentState!.validate()) {
      final username = _userNameFormController.text;
      final password = _passwordFormController.text;
      print(
          'usernamecontroller: ${_userNameFormController.text} \n usernamecontroller: ${_passwordFormController.text}');
      try {
        
        final loginData = await LoginService.loginUser(username, password);
        final token = loginData['token'];
        final role = loginData['role'];

        print('Token: $token');
        print("\n");
        print('Role: $role');
        print("\n");
      } catch (e) {
        print('Error: $e');
        print('$e  ');
      }
    }
  }
}
