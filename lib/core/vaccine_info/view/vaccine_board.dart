import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/vaccine_info/model/vaccine.dart';
import 'package:src/core/vaccine_info/view/vaccine_detail.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/input_field/text_form_field.dart';
import 'package:src/widgets/panel.dart';

class VaccineBoard extends StatefulWidget {
  const VaccineBoard({Key? key}) : super(key: key);

  @override
  State<VaccineBoard> createState() => _VaccineBoardState();
}

class _VaccineBoardState extends State<VaccineBoard> {
  late TextEditingController _searchController;
  late List<Vaccine> _displayed_vaccines_List;

  @override
  void initState() {
    super.initState();
    _searchController = new TextEditingController();
    _searchController.addListener(() {
      _searchListener(_searchController.text);
    });
    _displayed_vaccines_List = new List<Vaccine>.from(vaccines);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        appBar:
            AppBarCustom(title: S.current.vaccine_info_title, context: context),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildSearchBar(context),
        SizedBox(height: 10.h),
        _displayed_vaccines_List.length > 0
            ? _buildVaccineList(context)
            : _buildBlankList(context),
        SizedBox(height: 10.h),
        //_buildAchievement(context)
      ]),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextFormFieldWidget(
      context: context,
      label: '',
      hintText: S.current.vaccine_info_search_place_holder,
      controller: _searchController,
      prefix: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset('assets/svg/icon/search.svg',
            width: 24.w, height: 24.h),
      ),

      // validator: Validators.required(
      //     errorMessage: S.current.error_empty_input),
    );
  }

  void _searchListener(text) {
    //_displayed_vaccines_List = new List<Vaccine>.from(vaccines);
    if (text == '') {
      _displayed_vaccines_List = new List<Vaccine>.from(vaccines);
    } else {
      _displayed_vaccines_List.forEach((vaccine) {
        if (!vaccine.name.toLowerCase().contains(text.toLowerCase()))
          _displayed_vaccines_List.remove(vaccine);
      });
    }
    this.setState(() {});
  }

  Widget _buildVaccineList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _displayed_vaccines_List.length,
      itemBuilder: (context, index) {
        return Container(
          height: 104.h,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
              color: getCustomColor().white,
              borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            splashColor: getCustomColor().gray,
            splashFactory: InkSplash.splashFactory,
            onTap: () {
              navigateTo(
                  VaccineDetailPage(vaccine: _displayed_vaccines_List[index]),
                  context);
            },
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _displayed_vaccines_List[index].name.toString(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: getCustomColor().black),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Wrap(
                        children: renderFlag(
                            context, _displayed_vaccines_List[index].country!),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset('assets/svg/icon/rightArrow.svg',
                      width: 30.w, height: 30.h),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBlankList(BuildContext context) {
    return Container(
      height: 104.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: getCustomColor().white,
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
          splashColor: getCustomColor().gray,
          splashFactory: InkSplash.splashFactory,
          onTap: () {},
          child: Center(
            child: Text(
              S.current.vaccine_info_cant_find_info,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w700, color: getCustomColor().black),
            ),
          )),
    );
  }

  List<Widget> renderFlag(BuildContext context, List<Country> countryList) {
    List<Widget> list = [];
    countryList.forEach((country) {
      list.add(new Image.asset(
        country.imgUrl!,
        width: 50.w,
        height: 25.h,
      ));
    });
    return list;
  }
}
