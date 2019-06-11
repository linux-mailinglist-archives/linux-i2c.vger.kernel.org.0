Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB9EF3C4CC
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 09:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403989AbfFKHUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 03:20:01 -0400
Received: from mail-eopbgr20123.outbound.protection.outlook.com ([40.107.2.123]:54342
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403936AbfFKHUB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 03:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9YJ9o9/e/n7BsANmflWXcQdJ0kdwV2aiX2gLSNcMas=;
 b=JYKb+8aehXo4KFg1bRAwIsRxTS98O5YCYE1m3QuyCFTWN8lXsJvZGyUY/3Q3xzcnE2WTm8e18cV5ONWk1JU6/7aiB4YNvCjoO7XHqVSy6gcizKslnvT/1/XEMTwl8+pkJlm86ix0NyafuqxSADSXC5gsGJpGEFsrTDc9wX0tBpw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3449.eurprd02.prod.outlook.com (52.134.70.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 07:19:57 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 07:19:57 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
Thread-Topic: [PATCH v2] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
Thread-Index: AQHVGJtnq4cuQVsuR06AZyFSKIv5y6aWGuuA
Date:   Tue, 11 Jun 2019 07:19:57 +0000
Message-ID: <61e02555-781b-c178-6d57-5ab483b609ae@axentia.se>
References: <20190601165931.17226-1-linus.walleij@linaro.org>
In-Reply-To: <20190601165931.17226-1-linus.walleij@linaro.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a5d1201-c1a6-4458-5f90-08d6ee3d3559
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3449;
x-ms-traffictypediagnostic: DB3PR0202MB3449:
x-microsoft-antispam-prvs: <DB3PR0202MB3449B8A7EFDEC29DEBD323E3BCED0@DB3PR0202MB3449.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39830400003)(376002)(366004)(136003)(396003)(189003)(199004)(36756003)(305945005)(508600001)(4326008)(25786009)(66476007)(31686004)(66556008)(99286004)(52116002)(64756008)(66446008)(74482002)(73956011)(76176011)(14454004)(66946007)(58126008)(2906002)(81156014)(65826007)(110136005)(54906003)(81166006)(8676002)(8936002)(53936002)(3846002)(6246003)(71190400001)(476003)(446003)(68736007)(11346002)(5660300002)(65956001)(2501003)(6116002)(2616005)(65806001)(229853002)(7736002)(4744005)(486006)(86362001)(6436002)(64126003)(256004)(66066001)(26005)(31696002)(53546011)(102836004)(316002)(386003)(6506007)(186003)(6512007)(6486002)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3449;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hTrRWr0AQHJWmBIuBNRf2AQRJF9V7tNr4PyqPYrR4mum69T6MNV8w+lIE6NiYtPwGvw6p+5+xTAjNKIvEWnp8Mpm2B6LqQUmH0p1DIIoSpH+P2wJf3gZG+P4JKxeBi4dmN6VMMgQnJ4th2M4hEWv24qLOpm1cYh80sBFjNAX+O7y3raxUcuXjbImVxizcivZ1ZU/Szl9DDVWTW7uUSOimD+TiYRsfusCNYJHdOZ6JY83F/aXnFtSjEVhBy+e38ee6jCt5NeRwqi16WN4uTUp8WnEyo1Ophr3mxNddostpCB/DSbr7lxgKlEvKRlUkg3S8+N0lDn5y/oq75rYIgcj+KmNVrT0XeKgC5EER24SQyTukhZEZdM/pF16WhaMdX3kzWM1NoexsHk7KIv+3Lf5Yu6guYs+jtbe6Re1prtbX2w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DE66B170D61EA42865F23DC3B804EFD@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5d1201-c1a6-4458-5f90-08d6ee3d3559
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 07:19:57.7677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3449
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0wMSAxODo1OSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gSW5zdGVhZCBvZiBj
b21wbGV4IGNvZGUgcGlja2luZyBHUElPcyBvdXQgb2YgdGhlIGRldmljZSB0cmVlDQo+IGFuZCBr
ZWVwaW5nIHRyYWNrIG9mIHBvbGFyaXR5IGZvciBlYWNoIEdQSU8gbGluZSwgdXNlIGRlc2NyaXB0
b3JzDQo+IGFuZCBwdWxsIHBvbGFyaXR5IGhhbmRsaW5nIGludG8gdGhlIGdwaW9saWIuDQo+IA0K
PiBXZSBsb29rIGZvciAib3VyLWNsYWltIiBhbmQgInRoZWlyLWNsYWltIiBzaW5jZSB0aGUgZ3Bp
b2xpYg0KPiBjb2RlIHdpbGwgdHJ5IGUuZy4gIm91ci1jbGFpbS1ncGlvcyIgYW5kICJvdXItY2xh
aW0tZ3BpbyIgaW4NCj4gdHVybiB0byBsb2NhdGUgdGhlc2UgR1BJTyBsaW5lcyBmcm9tIHRoZSBk
ZXZpY2UgdHJlZS4NCj4gDQo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+DQo+IENjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+DQo+
IENjOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+IFNpZ25lZC1vZmYt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCg0KVGhhbmtzLCBw
YXRjaCBhcHBsaWVkIHRvIGkyYy1tdXgvZm9yLW5leHQNCg0KVGhlIERUIGJpbmRpbmdzIHNob3Vs
ZCBwcm9iYWJseSBiZSB1cGRhdGVkIHRvIHNwZWNpZnkgb3VyLWNsYWltLWdwaW9zDQppbnN0ZWFk
IG9mIG91ci1jbGFpbS1ncGlvLiBDdXJpb3VzbHkgZW5vdWdoLCB0aGUgYmluZGluZ3MgYWxyZWFk
eQ0Kc3BlY2lmaWVzIHRoZWlyLWNsYWltLWdwaW9zLCBldmVuIGlmIHRoZSBkcml2ZXIgbmV2ZXIg
ZGlkIHN1cHBvcnQNCnRoYXQuIFRoYXQgaXMsIHVudGlsIHRoaXMgcGF0Y2guDQoNCkNoZWVycywN
ClBldGVyDQo=
