import 'package:flutter/widgets.dart';
import 'package:minhascontas/styles/colors.theme.dart';

class PaymentDisplayer extends StatelessWidget {
  const PaymentDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppThemeColors.whiteColor,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conta de Luz",
                style: TextStyle(
                  color: AppThemeColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text("Mensal, todos os dias 20"),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: AppThemeColors.paidStatusColor,
                    borderRadius: BorderRadius.circular(360)
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                child: Text("Pago", style: TextStyle(color: AppThemeColors.whiteColor, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          Text("R\$ 50,00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
        ],
      ),
    );
  }
}
