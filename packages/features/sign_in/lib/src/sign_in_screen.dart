/*
* Developer: Abubakar Abdullahi
* Date: 07/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:gap/gap.dart';
import 'package:sign_in/src/l10n/sign_in_localizations.dart';
import 'package:sign_in/src/sign_in_cubit.dart';
import 'package:user_repository/user_repository.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
    required this.userRepository,
    required this.onTapSignIn,
    this.onTapSignUp,
    this.onTapForgotPassword,
  }) : super(key: key);

  final VoidCallback? onTapSignUp;
  final VoidCallback? onTapForgotPassword;
  final VoidCallback onTapSignIn;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(
        userRepository: userRepository,
      ),
      child: SignInView(
        onTapSignIn: onTapSignIn,
        onTapSignUp: onTapSignUp,
        onTapForgotPassword: onTapForgotPassword,
      ),
    );
  }
}

@visibleForTesting
class SignInView extends StatelessWidget {
  const SignInView(
      {Key? key,
      required this.onTapSignIn,
      this.onTapSignUp,
      this.onTapForgotPassword})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback? onTapSignUp;
  final VoidCallback? onTapForgotPassword;

  @override
  Widget build(BuildContext context) {
    final l10n = SignInLocalizations.of(context);
    return GestureDetector(
      onTap: () => _releaseFocus(context),
      child: Scaffold(
        backgroundColor: AppColorStyles.greyPrimary,
        body: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: _SignInForm(
            onTapSignIn: onTapSignIn,
            onTapSignUp: onTapSignUp,
            onTapForgotPassword: onTapForgotPassword,
          ),
        ),
      ),
    );
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
}

class _SignInForm extends StatefulWidget {
  const _SignInForm(
      {required this.onTapSignIn,
      this.onTapSignUp,
      this.onTapForgotPassword,
      Key? key})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback? onTapSignUp;
  final VoidCallback? onTapForgotPassword;

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SignInCubit>();
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        cubit.onEmailUnfocused();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        cubit.onPasswordUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = SignInLocalizations.of(context);
    return BlocConsumer<SignInCubit, SignInState>(
      listenWhen: (oldState, newState) =>
          oldState.submissionStatus != newState.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          widget.onTapSignIn();
          return;
        }

        final hasSubmissionError = (state.submissionStatus ==
                SubmissionStatus.genericError ||
            state.submissionStatus == SubmissionStatus.invalidCredentialsError);
        if (hasSubmissionError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              state.submissionStatus == SubmissionStatus.invalidCredentialsError
                  ? SnackBar(
                      content: Text(l10n.invalidCredentialsErrorMessage),
                    )
                  : const GenericErrorSnackBar(),
            );
        }
      },
      builder: (context, state) {
        final emailError = state.email.invalid ? state.email.error : null;
        final passwordError =
            state.password.invalid ? state.password.error : null;
        final isSubmissionInProgress =
            state.submissionStatus == SubmissionStatus.inProgress;

        final cubit = context.read<SignInCubit>();

        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(Spacing.getHeight(150)),
              Text(
                l10n.appBarTitle,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              Gap(Spacing.getHeight(50)),
              TextField(
                focusNode: _emailFocusNode,
                onChanged: cubit.onEmailChanged,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: fieldStyle.copyWith(
                  labelText: l10n.emailTextFieldLabel,
                  enabled: !isSubmissionInProgress,
                  errorText: emailError == null
                      ? null
                      : (emailError == EmailValidatorError.empty
                          ? l10n.emailTextFieldEmptyErrorMessage
                          : l10n.emailTextFieldInvalidErrorMessage),
                  prefixIcon: Icon(
                    FluentIcons.mention_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
              ),
              Gap(Spacing.getHeight(10)),
              TextField(
                focusNode: _passwordFocusNode,
                onChanged: cubit.onPasswordChanged,
                obscureText: passwordVisible,
                textInputAction: TextInputAction.next,
                decoration: fieldStyle.copyWith(
                  labelText: l10n.passwordTextFieldLabel,
                  enabled: !isSubmissionInProgress,
                  errorText: passwordError == null
                      ? null
                      : (passwordError == PasswordValidationError.empty
                          ? l10n.passwordTextFieldEmptyErrorMessage
                          : l10n.passwordTextFieldInvalidErrorMessage),
                  prefixIcon: Icon(
                    FluentIcons.password_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                  suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon:  Icon(
                    passwordVisible
                        ? FluentIcons.eye_off_16_regular
                        : FluentIcons.eye_16_regular,
                      color: AppColorStyles.grayDarkColor,
                    ),
                  )
                ),
              ),
              TextButton(
                onPressed:
                    isSubmissionInProgress ? null : widget.onTapForgotPassword,
                child: Text(l10n.forgotMyPasswordButtonLabel),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(l10n.signUpOpeningText),
                  TextButton(
                      onPressed:
                          isSubmissionInProgress ? null : widget.onTapSignUp,
                      child: Text(l10n.signUpButtonLabel))
                ],
              ),
              Gap(Spacing.getHeight(5)),
              isSubmissionInProgress
                  ? CustomButton.inProgress(
                      width: 0.70,
                      height: 45,
                      color: AppColorStyles.accentIndigoColor,
                      loadingColor: Colors.white,
                    )
                  : CustomButton(
                      width: 0.70,
                      height: 45,
                      color: AppColorStyles.accentIndigoColor,
                      onPressed: cubit.onSubmit,
                      child: Text(
                        l10n.signUpButtonLabel,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColorStyles.whiteColor,
                        ),
                      ),
                    ),
              Gap(Spacing.getHeight(10)),
            ],
          ),
        );
      },
    );
  }
}
