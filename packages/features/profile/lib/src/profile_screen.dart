/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:profile/src/profile_bloc.dart';
import 'package:profile/src/profile_cubit.dart';
import 'package:user_repository/user_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    this.onTapCart,
    this.onTapOrder,
    this.onTapWishlist,
    this.onTapEdit,
    this.onTapPasswordChange,
    this.onTapLogout,
    required this.userRepository,
  }) : super(key: key);

  final VoidCallback? onTapCart;
  final VoidCallback? onTapOrder;
  final VoidCallback? onTapWishlist;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapPasswordChange;
  final VoidCallback? onTapLogout;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) =>
          ProfileCubit(
            userRepository: userRepository,
          ),

      child: ProfileView(
        onTapCart: onTapCart,
        onTapOrder: onTapOrder,
        onTapWishlist: onTapWishlist,
        onTapEdit: onTapEdit,
        onTapPasswordChange: onTapPasswordChange,
        onTapLogout: onTapLogout,
      ),
    );
  }
}

@visibleForTesting
class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
    this.onTapCart,
    this.onTapOrder,
    this.onTapWishlist,
    this.onTapEdit,
    this.onTapPasswordChange,
    this.onTapLogout,
  }) : super(key: key);

  final VoidCallback? onTapCart;
  final VoidCallback? onTapOrder;
  final VoidCallback? onTapWishlist;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapPasswordChange;
  final VoidCallback? onTapLogout;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final size = Spacing.getSize(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutOut) {
          widget.onTapLogout!();
        }
      },
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
       final user = state is ProfileSuccessful ? state.user : null;
        //final isLogoutInProgress = state is ProfileInProgress;

        return Scaffold(
          backgroundColor: AppColorStyles.greyPrimary,
          body: Stack(
            children: [
              Container(
                height: Spacing.getHeight(210),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.brown],
                    )),
              ),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    expandedHeight: Spacing.getHeight(140),
                    centerTitle: true,
                    pinned: true,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        return FlexibleSpaceBar(
                          title: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: constraints.biggest.height <= 120 ? 1 : 0,
                            child: Text(
                              "Account",
                              style: TextStyle(
                                  color: AppColorStyles.grayDarkColor),
                            ),
                          ),
                          background: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.brown],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Spacing.getHeight(30),
                                  top: Spacing.getHeight(20)),
                              child: Row(
                                children: [
                                  const CircleImage(
                                    image: AssetImage(
                                        "assets/images/inapp/guest.jpg"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Spacing.getHeight(25)),
                                    child: Text(
                                      "Guest",
                                      style: TextStyle(
                                          color: AppColorStyles.grayDarkColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          height: Spacing.getHeight(80),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(Spacing.getHeight(50))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Spacing.getHeight(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.25,
                                  height: Spacing.getHeight(60),
                                  decoration: BoxDecoration(
                                    color: AppColorStyles.graySecondary,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            Spacing.getHeight(30)),
                                        bottomLeft: Radius.circular(
                                            Spacing.getHeight(30))),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: widget.onTapCart,
                                      child: Text(
                                        "Cart",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColorStyles.primaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.30,
                                  height: Spacing.getHeight(60),
                                  decoration: BoxDecoration(
                                    color: AppColorStyles.primaryColor,
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: widget.onTapOrder,
                                      child: Text(
                                        "Orders",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                            AppColorStyles.grayDarkColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.25,
                                  height: Spacing.getHeight(60),
                                  decoration: BoxDecoration(
                                    color: AppColorStyles.graySecondary,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: widget.onTapWishlist,
                                      child: Text(
                                        "Wishlist",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColorStyles.primaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: AppColorStyles.greyPrimary,
                          child: Column(
                            children: [
                              SizedBox(
                                height: Spacing.getHeight(150),
                                child: const Image(
                                  image: AssetImage(
                                      "assets/images/inapp/logo.jpg"),
                                ),
                              ),
                              const SubTitleHeader(
                                title: "Account Info",
                                fontsize: 20,
                              ),
                              state is ProfileSuccessful
                              ? _AccountInfo(customer: state.user)
                              : const InfoPanel(
                                firstLeadingTile:
                                Icon(FluentIcons.mention_20_regular),
                                firstTitleTile: Text("Email Address"),
                                firstSubtitleTile: Text("demoinfo@amerastore.com"),
                                secondLeadingTile:
                                Icon(FluentIcons.call_20_regular),
                                secondTitleTile: Text("Phone Number"),
                                secondSubtitleTile: Text("0976-465-xxxx"),
                                thirdLeadingTile:
                                Icon(FluentIcons.location_20_regular),
                                thirdTitleTile: Text("Address"),
                                thirdSubtitleTile: Text(
                                    "234 Wellington St. Mango Ave. Cebu City. Ph. 6000"),
                              ),

                              const SubTitleHeader(
                                title: "Account Setting",
                                fontsize: 20,
                              ),
                              InfoPanel(
                                titleHeight: 200,
                                firstLeadingTile:
                                const Icon(FluentIcons.edit_20_regular),
                                firstTitleTile: const Text("Edit Profile"),
                                firstOnTap: widget.onTapEdit,
                                secondLeadingTile: const Icon(
                                    FluentIcons.key_reset_20_regular),
                                secondTitleTile: const Text("Change Password"),
                                secondOnTap: widget.onTapPasswordChange,

                                thirdLeadingTile:
                                const Icon(FluentIcons.power_20_regular),
                                thirdTitleTile: const Text("Logout"),
                                thirdOnTap: () {
                                  cubit.logoutUser();
                                  print("Tapped on logout");
                                },
                              ),
                              const Gap(50),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AccountInfo extends StatelessWidget {
  const _AccountInfo({Key? key, required this.customer}) : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return  InfoPanel(
      firstLeadingTile:
      const Icon(FluentIcons.mention_20_regular),
      firstTitleTile: const Text("Email Address"),
      firstSubtitleTile: Text(customer.email!),
      secondLeadingTile:
      const Icon(FluentIcons.call_20_regular),
      secondTitleTile: const Text("Phone Number"),
      secondSubtitleTile: const Text("0976-465-xxxx"),
      thirdLeadingTile:
      const Icon(FluentIcons.location_20_regular),
      thirdTitleTile: const Text("Address"),
      thirdSubtitleTile: const Text(
          "234 Wellington St. Mango Ave. Cebu City. Ph. 6000"),
    );
  }
}

