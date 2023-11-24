import 'package:basics_of_flutter_30days/models/cart.dart';
import 'package:basics_of_flutter_30days/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.center.make()
      ),
      body: Column(
        children: [
           _CartList().p32().expand(),
           const Divider(),
           const _CartTotal(),

        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart =CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        children: [

          "\$${_cart.totalPrice}".text.xl5.color(context.theme.primaryColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:"Buying not supported yet.".text.make()
                    ));
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(context.theme.canvasColor)
              ),
              child:"Buy".text.color(Colors.black54).make()
          ).w32(context),
        ],
      ),
    );
  }
}
class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart =CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}