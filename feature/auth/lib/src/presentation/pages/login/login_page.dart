import 'package:auth/auth.dart';
import 'package:auth/src/presentation/pages/login/cubit/login_cubit.dart';
import 'package:auth/src/presentation/pages/login/widget/input_email_field.dart';
import 'package:auth/src/presentation/pages/login/widget/input_password_field.dart';
import 'package:auth/src/presentation/pages/login/widget/welcome_widget.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: const LoginUI(),
    );
  }
}

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late FocusNode _focusNodeEmail;
  late FocusNode _focusNodePassword;

  @override
  void initState() {
    super.initState();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes to avoid memory leaks
    emailController.dispose();
    _focusNodeEmail.dispose();
    passwordController.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage<LoginCubit, LoginState>(
      customLoading: const BaseLoadingAnimation(
        color: AppColors.neutral50,
      ),
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (prev, current) => prev.status != current.status,
        builder: (context, state) {
          return BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              emailController.text = state.email;
              passwordController.text = state.password;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .background,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              extendBodyBehindAppBar: true,
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //welcome
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 33),
                          child: WelcomeWidget(),
                        ),

                        //input field
                        BlocSelector<LoginCubit, LoginState, String>(
                          selector: (state) {
                            return state.errorEmailValidation;
                          },
                          builder: (context, state) {
                            return InputEmailField(
                              controller: emailController,
                              focusNode: _focusNodeEmail,
                              alert: state,
                              onChanged: (email) {
                                context
                                    .read<LoginCubit>()
                                    .onEmailChanged(email);
                              },
                            );
                          },
                        ).margin(bottom: 10),
                        BlocSelector<LoginCubit, LoginState, String>(
                          selector: (state) {
                            return state.errorPasswordValidation;
                          },
                          builder: (context, state) {
                            return InputPasswordField(
                              controller: passwordController,
                              focusNode: _focusNodePassword,
                              alert: state,
                              onChanged: (password) {
                                context
                                    .read<LoginCubit>()
                                    .onPasswordChanged(password);
                              },
                            );
                          },
                        ).margin(bottom: 20),
                        SizedBox(
                          width: context.screenHeight,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().onLoginClicked(() =>
                                  di<AuthNavigationRepository>()
                                      .goToHomePage(context));
                            },
                            child: const Text('Login'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
