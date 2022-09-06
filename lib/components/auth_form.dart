import 'package:chat_two/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final Function(AuthFormData) onSubmit;

  const AuthForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    widget.onSubmit(_formData);

    if (isValid == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login cadastrado com sucesso!',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 247, 220, 102),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (_formData.isSignup)
                    TextFormField(
                      key: const ValueKey('name'),
                      initialValue: _formData.name,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: (nome) {
                        if (nome == null || nome.trim().length < 6) {
                          return "O campo precisa ter pelomenos 6 caracteres.";
                        }
                        return null;
                      },
                      onChanged: (value) => _formData.name = value,
                    ),
                  TextFormField(
                    key: const ValueKey('email'),
                    initialValue: _formData.email,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    validator: (email) {
                      if (email == null ||
                          !email.contains('@') ||
                          !email.contains('.com')) {
                        return "O e-mail digitado não é válido!";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _formData.email = value;
                    },
                  ),
                  TextFormField(
                    onChanged: (value) => _formData.password = value,
                    key: const ValueKey('password'),
                    initialValue: _formData.password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value == null || value.length < 5) {
                        return "A senha deve ter ao menos 6 caracteres";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[900],
                      minimumSize: const Size(350, 35),
                      elevation: 10,
                    ),
                    onPressed: () {
                      _submit();
                    },
                  ),
                  TextButton(
                    child: Text(
                      _formData.isLogin
                          ? 'Não possui conta?'
                          : 'Já possui conta?',
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _formData.toggleAuthMode();
                        },
                      );
                    },
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
