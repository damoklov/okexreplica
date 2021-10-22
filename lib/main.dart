import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'Pro';
  String dropdownCurrency = 'USD';
  int _selectedIndex = 0;
  final List<Map> _scrollableRowData = [
    {'id': 1, 'name': 'Favorites', 'isSelected': false},
    {'id': 2, 'name': 'Top', 'isSelected': false},
    {'id': 3, 'name': 'New crypto', 'isSelected': false},
    {'id': 4, 'name': '24h ranking', 'isSelected': false},
    {'id': 5, 'name': 'Turnover ranking', 'isSelected': false},
  ];
  final List<Map> _scrollableFeedData = [
    {'id': 1, 'name': 'Announcements', 'isSelected': false},
    {'id': 2, 'name': 'Latest news', 'isSelected': false},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_outlined),
        backgroundColor: Colors.black87,
        title: Container(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.6
              : MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.6
              : MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.05,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          DropdownButton(
              value: dropdownValue,
              underline: const SizedBox(),
              alignment: Alignment.center,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 8,
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Lite', 'Pro', 'DeFi']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'OKEx',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2),
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert_circle),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Assets',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[900],
        showUnselectedLabels: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue[900],
              ),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              'Est. total net value',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.remove_red_eye,
                                  color: Colors.grey[500])),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: const Text('3500.00',
                                style: TextStyle(fontSize: 26)),
                            padding: const EdgeInsets.only(right: 8),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 8),
                            child: DropdownButton(
                                value: dropdownCurrency,
                                underline: const SizedBox(),
                                alignment: Alignment.center,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 20,
                                elevation: 8,
                                style: const TextStyle(color: Colors.white),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownCurrency = newValue!;
                                  });
                                },
                                items: <String>[
                                  'USD',
                                  'USDT',
                                  'BTC'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_right_outlined,
                  size: 20,
                  color: Colors.grey[500],
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[900],
                    ),
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.credit_card),
                      ),
                      Text(
                        'Buy crypto',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[900],
                    ),
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.wallet_giftcard),
                      ),
                      Text(
                        'Deposit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_right_outlined),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[900],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Earn free Bitcoin',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue[900],
                              ),
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Go', style: TextStyle(fontSize: 20)),
                                    Icon(Icons.arrow_right_outlined)
                                  ]))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Icon(
                        Icons.money_outlined,
                        size: 60,
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.swap_vert_circle, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Spot',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.document_scanner_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Futures',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.document_scanner_rounded, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Perpetual',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.dock_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Options',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.whatshot_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Learn',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.send_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Send',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.document_scanner_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Earn/DeFi',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.support_agent_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Support',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.card_giftcard, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'Rewards',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: const [
                            Icon(Icons.more_horiz_outlined, size: 32)
                          ]),
                          Row(
                            children: const [
                              Text(
                                'More',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[900],
              ),
              child: SizedBox(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _scrollableRowData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: GestureDetector(
                        child: Text(
                          _scrollableRowData[index]['name'],
                          style: TextStyle(
                              fontSize: 18,
                              color: _scrollableRowData[index]['isSelected'] ==
                                      true
                                  ? Colors.blue
                                  : Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            _scrollableRowData
                                .forEach((i) => i['isSelected'] = false);
                            _scrollableRowData[index]['isSelected'] =
                                !_scrollableRowData[index]['isSelected'];
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[900],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Asset',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              )),
                        ),
                        Row(
                          children: const [
                            Text('BTC / USDT', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Vol. 18,554,321',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ))
                          ],
                        ),
                        Row(
                          children: const [
                            Text('CRO / USDT', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Vol. 30,553,123',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ))
                          ],
                        ),
                        Row(
                          children: const [
                            Text('XRP / USDT', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Vol. 44,810,994',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ))
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Last price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              )),
                        ),
                        Row(
                          children: const [
                            Text('41309.49', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('\$41309.5',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ))
                          ],
                        ),
                        Row(
                          children: const [
                            Text('0.1488.53', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('\$0.15',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ))
                          ],
                        ),
                        Row(
                          children: const [
                            Text('0.923', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('\$0.92',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ))
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Last 24h',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              )),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(11),
                              child: const Text('+4.20%'),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green[500],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(11),
                              child: const Text('-7.23%'),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red[500],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(11),
                              child: const Text('+1.85%'),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green[500],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text('Get crypto instantly',
                                    style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Buy and sell with local currencies',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500])),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Icon(
                          Icons.monetization_on,
                          size: 40,
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[900],
              ),
              child: SizedBox(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _scrollableFeedData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: GestureDetector(
                        child: Text(
                          _scrollableFeedData[index]['name'],
                          style: TextStyle(
                              fontSize: 18,
                              color: _scrollableFeedData[index]['isSelected'] ==
                                      true
                                  ? Colors.white
                                  : Colors.grey[500]),
                        ),
                        onTap: () {
                          setState(() {
                            _scrollableFeedData
                                .forEach((i) => i['isSelected'] = false);
                            _scrollableFeedData[index]['isSelected'] =
                                !_scrollableFeedData[index]['isSelected'];
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[900],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Flexible(
                          child: Text(
                              'OKEx will list Celestial\'s native asset, CELT, for spot trading',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2021-09-29 12:00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ))
                      ],
                    ),
                    Row(
                      children: const [
                        Flexible(
                          child: Text(
                              'OKEx will launch CHE staking and Flash deals with the twelfth phase of subscriptions coming soon',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2021-09-29 09:40',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ))
                      ],
                    ),
                    Row(
                      children: const [
                        Flexible(
                          child: Text(
                              'OKEx will list Kollect\'s native asset, KOL, for spot trading',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2021-09-28 10:00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
