import 'package:flutter/material.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/dashboard_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/viewmodel_provider.dart';

class DashboardView extends StatefulWidget {
  final Map<String, WidgetBuilder>? appRoutes;
  DashboardView(this.appRoutes, {super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DashboardViewModel>(
      viewModelBuilder: () => DashboardViewModel(context),
      builder: (context, vm, child) {
        vm.getReminders();
        return Material(
          child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.orange],
            ),
          ),
          child: SingleChildScrollView(
            child: Column (
              children: <Widget>[
                Expanded(child: SizedBox(height: 40, width: 300)),
                _contentControls(vm),
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget _contentControls(DashboardViewModel viewModel) {
    return Column(
      children: <Widget>[
        GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppConstants.layout.crossAxisCount,
                crossAxisSpacing: AppConstants.dimensions.crossAxisSpacing,
                mainAxisSpacing: AppConstants.dimensions.mainAxisSpacing,
              ),
          children: <Widget>[
            _reminders(viewModel),
            FlutterLogo(),
            FlutterLogo(),
            FlutterLogo(),
          ],
        ),
      ],
    );
  }

  Widget _reminders(DashboardViewModel viewmodel)  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_month_rounded),
              iconSize: AppConstants.dimensions.iconSize,
              onPressed: null,
            ),
            Padding(
              padding: EdgeInsets.all(AppConstants.dimensions.rowPadding),
              child: Text(
                AppConstants.reminderText.remindersToday(viewmodel.getReminderCount()),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
