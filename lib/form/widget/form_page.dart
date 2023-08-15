import 'package:flutter/material.dart';
import 'package:untitled/gen/assets.gen.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/theme_data.dart';
import 'package:untitled/widget/elevated_button.dart';
import 'package:untitled/widget/textfield_with_title.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _addressNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _firstAddressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _addressNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _firstAddressController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Assets.images.logo.image(height: 64, width: 176),
              const SizedBox(height: 14),
              ColoredBox(
                color: AppColors.primaryRed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_backspace_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 14, 14),
                      child: Text(
                        'Add New Ship From Address',
                        style: Theme.of(context).h16.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Address Name',
                        controller: _addressNameController,
                        isRequired: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColorMain),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              TextFieldWithTitle(
                                text: 'First Name',
                                controller: _firstNameController,
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 14),
                              TextFieldWithTitle(
                                text: 'Last Name',
                                controller: _lastNameController,
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: AppColors.borderColorMain,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: AppColors.borderColorMain,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              TextFieldWithTitle(
                                text: 'Company Name',
                                controller: _companyNameController,
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Address 1',
                        controller: _firstAddressController,
                        isRequired: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Country',
                        controller: _countryController,
                        isRequired: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: CityInfo(
                        cityController: _cityController,
                        stateController: _stateController,
                        zipController: _zipController,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Phone',
                        controller: _phoneController,
                        isRequired: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: TextFieldWithTitle(
                        text: 'Email',
                        controller: _emailController,
                        isRequired: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: CustomTextButton(
                        onPressed: () {},
                        text: 'Create address',
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityInfo extends StatelessWidget {
  const CityInfo({
    required this.cityController,
    required this.stateController,
    required this.zipController,
    super.key,
  });

  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 128,
          child: TextFieldWithTitle(
            text: 'City',
            controller: cityController,
            isRequired: true,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 80,
          child: TextFieldWithTitle(
            text: 'State',
            controller: stateController,
            isRequired: true,
            maxLength: 2,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 80,
          child: TextFieldWithTitle(
            maxLength: 2,
            keyboardType: TextInputType.number,
            text: 'Zip',
            controller: zipController,
            isRequired: true,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
