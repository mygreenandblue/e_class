// ignore_for_file: use_build_context_synchronously

import 'package:eclass/feature/login/cubit/auth_cubit.dart';
import 'package:eclass/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<void> validateAndSubmit() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState?.validate() ?? false) {
      final username = phoneController.text;
      final password = passwordController.text;
      await context.read<AuthCubit>().login(username, password);
      if (context.read<AuthCubit>().state.isAuthenticated) {
        context.go(AppRouter.homePath);
      }
    } else {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Đăng nhập thất bại. Có lỗi xảy ra, vui lòng thử lại!',
                ),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildPhoneField(),
                      const SizedBox(height: 20),
                      _buildPasswordField(),
                      const SizedBox(height: 30),
                      _buildLoginButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/logos/logo.png'),
            ),
            SizedBox(height: 10),
            Text(
              'CREATIVE READER\'S\nPUBLICATION',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: phoneController,
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        labelText: 'Số điện thoại',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Số điện thoại không được để trống';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (!FocusScope.of(context).hasFocus) {
          _formKey.currentState?.validate();
        }
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: togglePasswordVisibility,
        ),
        labelText: 'Mật khẩu',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Mật khẩu không được để trống';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (_) => validateAndSubmit(),
      onChanged: (value) {
        if (!FocusScope.of(context).hasFocus) {
          _formKey.currentState?.validate();
        }
      },
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: validateAndSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D47A1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text(
              'Đăng nhập',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
    );
  }
}
