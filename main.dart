import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main()
{
  runApp(new SimpleCalc());
}
class SimpleCalc extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    
    return new SimpleCalci();
  }

}
class SimpleCalci extends State
{
  var ans=0, num1=0,num2=0;
  final TextEditingController firstNumber=TextEditingController(text:"");
    final TextEditingController secondNumber=TextEditingController(text:"");
    bool checkNumber()
    {
      try {
        num1=int.parse(firstNumber.text);
        num2=int.parse(secondNumber.text);
        return true;
        
      }on FormatException catch(e)  {
        Scaffold.of(context).showSnackBar(SnackBar(
          content:Text("Invalid Number"),
       
        )
        );
        setState(() {
          ans=0;
        });
        return false;
      } 
    }
    void add()
    {
      if (checkNumber())
       {
         setState(() {
           ans=num1+num2;
         });
        
      }
    }

    void subtract()
    {
      if (checkNumber())
       {
         setState(() {
           ans=num1-num2;
         });
        
      }
    }

    void multiply()
    {
      if (checkNumber())
       {
         setState(() {
           ans=num1*num2;
         });
        
      }
    }

    void division()
    {
      if (checkNumber())
       {
         setState(() {
           try {
             ans=num1~/num2;
           }on IntegerDivisionByZeroException catch (e) {
             ans=0;
           }
           
         });
        
      }
    }

    void clear()
    {
      if (checkNumber())
       {
         setState(() {
           firstNumber.text="";
            secondNumber.text="";
           ans=0;
         });
        
      }
    }


  @override
  Widget build(BuildContext context) 
  {
    
    return new MaterialApp(
      home:new Scaffold(
        appBar: new AppBar(
       title:new Text("A Basic Calculator"),
       backgroundColor:Colors.blueAccent,
     ),

     body: new Center(
       child: Container(
       padding:const EdgeInsets.all(15.0),
       child: Column(
         children: <Widget>[
           TextField(
            keyboardType:TextInputType.number,
            decoration:new  InputDecoration(
              border:new OutlineInputBorder(),
              hintText:'Enter First Number',
            ),
            controller:firstNumber,
           ),
           SizedBox(
             height:20,
           ),

           TextField(
            keyboardType:TextInputType.number,
            decoration:new InputDecoration(
              border:new OutlineInputBorder(),
              hintText:'Enter Second Number',
            ),
            controller:secondNumber,
           ),
           SizedBox(
             height:20,
           ),
          Text(
            "Result:$ans",
            style: new TextStyle(
              fontSize: 15.0,
              
            ),
          ),
          SizedBox(
             height:20,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               RaisedButton(
                 child: Text(
                   "+",
                   style: new TextStyle(
                     fontSize:15.0,
                     fontWeight:FontWeight.bold,
                   ),
                 ),
                 onPressed: add,
                 ),

                RaisedButton(
                 child: Text(
                   "-",
                   style: new TextStyle(
                     fontSize:15.0,
                     fontWeight:FontWeight.bold,
                   ),
                 ),
                 onPressed: subtract,
                 ), 
             ],
           ),

            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               RaisedButton(
                 child: Text(
                   "*",
                   style: new TextStyle(
                     fontSize:15.0,
                     fontWeight:FontWeight.bold,
                   ),
                 ),
                 onPressed: multiply,
                 ),

                RaisedButton(
                 child: Text(
                   "/",
                   style: new TextStyle(
                     fontSize:15.0,
                     fontWeight:FontWeight.bold,
                   ),
                 ),
                 onPressed: division,
                 ), 
             ],
           ),

            Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             MaterialButton(
                child: Text("clear",
                 style: new TextStyle(
                 fontSize:15.0,
                 fontWeight:FontWeight.bold,
                 ),
                 ),
                  color: Colors.greenAccent,
                  onPressed: clear,
                ),
               ],
              ),  
            ],
            ),
          ) ,
          ),
          floatingActionButton: new FloatingActionButton(onPressed: ()
          {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          tooltip: "close the app",
          child: new Icon(
            Icons.close 
          ),
          ),
          
        ),
    );
    
  }
  
}
  
