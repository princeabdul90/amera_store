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
import 'package:sign_up/sign_up.dart';
import 'package:sign_up/src/sign_up_cubit.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
    required this.onTapSignIn,
    required this.onTapSignUp,
    required this.userRepository,
  }) : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(
        userRepository: userRepository,
      ),
      child: SignUpView(
        onTapSignIn: onTapSignIn,
        onTapSignUp: onTapSignUp,
      ),
    );
  }
}

@visibleForTesting
class SignUpView extends StatelessWidget {
  const SignUpView(
      {Key? key, required this.onTapSignIn, required this.onTapSignUp})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _releaseFocus(context),
      child: Scaffold(
        backgroundColor: AppColorStyles.greyPrimary,
        body: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: _SignUpForm(
              onTapSignIn: onTapSignIn,
              onTapSignUp: onTapSignUp,
            ),
          ),
        ),
      ),
    );
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({
    Key? key,
    required this.onTapSignIn,
    required this.onTapSignUp,
  }) : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmationFocusNode = FocusNode();

  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _setUpEmailFieldFocusListener();
    _setUpPasswordFieldFocusListener();
    _setUpPasswordConfirmationFieldFocusListener();
  }

  void _setUpEmailFieldFocusListener() {
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        final cubit = context.read<SignUpCubit>();
        cubit.onEmailUnfocused();
      }
    });
  }

  void _setUpPasswordFieldFocusListener() {
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        final cubit = context.read<SignUpCubit>();
        cubit.onPasswordUnfocused();
      }
    });
  }

  void _setUpPasswordConfirmationFieldFocusListener() {
    _passwordConfirmationFocusNode.addListener(() {
      if (!_passwordConfirmationFocusNode.hasFocus) {
        final cubit = context.read<SignUpCubit>();
        cubit.onPasswordConfirmationUnfocused();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (oldState, newState) =>
          oldState.submissionStatus != newState.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          widget.onTapSignUp();
        }

        if (state.submissionStatus == SubmissionStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const GenericErrorSnackBar(),
            );
        }
      },
      builder: (context, state) {
        final l10n = SignUpLocalizations.of(context);
        final cubit = context.read<SignUpCubit>();
        final emailError = state.email.invalid ? state.email.error : null;
        final passwordError =
            state.password.invalid ? state.password.error : null;
        final passwordConfirmationError = state.passwordConfirmation.invalid
            ? state.passwordConfirmation.error
            : null;
        final isSubmissionInProgress =
            state.submissionStatus == SubmissionStatus.inProgress;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Gap(Spacing.getHeight(50)),
            Text(
              l10n.appBarTitle,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            Gap(Spacing.getHeight(40)),
            CircleImage(
              radius: 45,
              child: Icon(
                FluentIcons.person_20_filled,
                size: 50,
                color: AppColorStyles.graySecondary,
              ),
            ),
            Gap(Spacing.getHeight(20)),
            TextField(
              textInputAction: TextInputAction.next,
              decoration: fieldStyle.copyWith(
                labelText: l10n.fullnameTextFieldLabel,
                prefixIcon: Icon(
                  FluentIcons.person_16_regular,
                  color: AppColorStyles.grayDarkColor,
                ),
              ),
            ),
            Gap(Spacing.getHeight(10)),
            TextField(
              focusNode: _emailFocusNode,
              onChanged: cubit.onEmailChanged,
              autocorrect: false,
              enabled: !isSubmissionInProgress,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: fieldStyle.copyWith(
                labelText: l10n.emailTextFieldLabel,
                prefixIcon: Icon(
                  FluentIcons.mention_16_regular,
                  color: AppColorStyles.grayDarkColor,
                ),
                errorText: emailError == null
                    ? null
                    : (emailError == EmailValidatorError.empty
                        ? l10n.emailTextFieldEmptyErrorMessage
                        : (emailError == EmailValidatorError.alreadyRegistered
                            ? l10n.emailTextFieldAlreadyRegisteredErrorMessage
                            : l10n.emailTextFieldInvalidErrorMessage)),
              ),
            ),
            Gap(Spacing.getHeight(10)),
            TextField(
              focusNode: _passwordFocusNode,
              onChanged: cubit.onPasswordChanged,
              enabled: !isSubmissionInProgress,
              obscureText: passwordVisible,
              textInputAction: TextInputAction.next,
              decoration: fieldStyle.copyWith(
                labelText: l10n.passwordTextFieldLabel,
                prefixIcon: Icon(
                  FluentIcons.password_16_regular,
                  color: AppColorStyles.grayDarkColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible
                        ? FluentIcons.eye_off_16_regular
                        : FluentIcons.eye_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
                errorText: passwordError == null
                    ? null
                    : (passwordError == PasswordValidationError.empty
                        ? l10n.passwordTextFieldEmptyErrorMessage
                        : l10n.passwordTextFieldInvalidErrorMessage),
              ),
            ),
            Gap(Spacing.getHeight(10)),
            TextField(
              focusNode: _passwordConfirmationFocusNode,
              onChanged: cubit.onPasswordConfirmationChanged,
              onEditingComplete: cubit.onSubmit,
              enabled: !isSubmissionInProgress,
              obscureText: passwordVisible,
              textInputAction: TextInputAction.next,
              decoration: fieldStyle.copyWith(
                labelText: l10n.passwordConfirmationTextFieldLabel,
                prefixIcon: Icon(
                  FluentIcons.password_16_regular,
                  color: AppColorStyles.grayDarkColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible
                        ? FluentIcons.eye_off_16_regular
                        : FluentIcons.eye_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
                errorText: passwordConfirmationError == null
                    ? null
                    : (passwordConfirmationError ==
                            PasswordConfirmationValidationError.empty
                        ? l10n.passwordConfirmationTextFieldEmptyErrorMessage
                        : l10n
                            .passwordConfirmationTextFieldInvalidErrorMessage),
              ),
            ),
            Gap(Spacing.getHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(l10n.signInOpeningText),
                TextButton(
                    onPressed:
                        isSubmissionInProgress ? null : widget.onTapSignIn,
                    child: Text(l10n.signInButtonLabel))
              ],
            ),
            Gap(Spacing.getHeight(10)),
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
        );
      },
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmationFocusNode.dispose();
    super.dispose();
  }
}
