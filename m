Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C028C5273C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfFYIz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:55:59 -0400
Received: from mail-eopbgr10098.outbound.protection.outlook.com ([40.107.1.98]:8229
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731075AbfFYIz6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 04:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVBfw4FpZxA3ulXfIcTeYrg035ssQsljb1ybKsRpAXE=;
 b=MXHqgWixyYYEB371MAJg07FcSiFCw4ZAHVtS8KGRk6u9e7p08CJqv2uRSuA9tz9XbAk5gdu4kgmXLML34t3978/B50ZyI/XL0erlq2IuxkMpm/5afF0jjsJ1A1UgA4TH7LzA1DhxGcE98bLoWgbz7kyCrhGUVIzajorCF7ICgnk=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3276.eurprd02.prod.outlook.com (52.134.70.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:55:53 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153%3]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 08:55:53 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Thread-Topic: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Thread-Index: AQHVKyzC4r37a1Y+/0WA1Icg3nKpa6asETkA
Date:   Tue, 25 Jun 2019 08:55:53 +0000
Message-ID: <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0373.eurprd05.prod.outlook.com
 (2603:10a6:7:94::32) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44d866fc-a538-4492-b1b6-08d6f94aedfa
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3276;
x-ms-traffictypediagnostic: DB3PR0202MB3276:
x-microsoft-antispam-prvs: <DB3PR0202MB3276C4C2028428DC154DF6B1BCE30@DB3PR0202MB3276.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39830400003)(376002)(366004)(346002)(136003)(189003)(199004)(229853002)(476003)(2616005)(73956011)(6246003)(66946007)(64756008)(81156014)(66476007)(25786009)(8936002)(66556008)(81166006)(6512007)(99286004)(11346002)(6116002)(3846002)(8676002)(66446008)(7416002)(6436002)(14454004)(53936002)(66066001)(65806001)(65956001)(6486002)(5660300002)(7736002)(76176011)(446003)(58126008)(256004)(74482002)(26005)(102836004)(6506007)(53546011)(186003)(110136005)(386003)(71200400001)(86362001)(64126003)(31686004)(71190400001)(31696002)(68736007)(486006)(2201001)(508600001)(65826007)(36756003)(2906002)(2501003)(52116002)(316002)(305945005)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3276;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r8Yd/ep9rJWZ5EKFc03ek3d9o+3rR60qaNnYxRbXiFDr2dpTzpaxRJxvCaRyXtYevQ2ndMjNaJxZb448JJWKRCPIWVl3LZw+k5aZiBQc4wSv6JpoCW4WwkgcHpa1RIk10cH/mxNH4qwRjqhsvT5/JwZNtNRmTuOzWU/fRu0TN8xFq3wbzpwLNUKS9YZm6QXKLxKz3TOAaantLyIMiSh3JUQkswPPne74QXfZoGN+l9Eppnl0xL/1I9ZsU6v4cywTwxk6GVn7a+LYSVwXN7To/g3H8sm9U1Fkm/HwB/BlPWPmtteGh7W1xUhHD8ZAGfqJhDqrO2oKx6r9iliV6814v7ziX5ZnOEcfj3L6eQL/AQFSOure43qyvtDf7FI4ZeVus12wQt2+fezpPCUQPI9dyPueQftaXG+CJW0LbmLNo3Q=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1181221CAD0DF84EA05524BA6EC34C79@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d866fc-a538-4492-b1b6-08d6f94aedfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:55:53.7688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3276
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0yNSAxMDowNSwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBBZGQgYmluZGluZyBzcGVjaWZpY2F0aW9uIGZvciBhbmFsb2dpYyBmaWx0ZXIgaW5zaWRlIHRo
ZSBpMmMgY29udHJvbGxlcg0KDQpzL2FuYWxvZ2ljL3RoZSBhbmFsb2cvDQoNCj4gU2lnbmVkLW9m
Zi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPiAtLS0N
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0OTEudHh0IHwg
NCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KPiBp
bmRleCA4MjY4NTk1Li4yMGQzMzRjIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KPiBAQCAtMjMsNiArMjMsOSBAQCBP
cHRpb25hbCBwcm9wZXJ0aWVzOg0KPiAgLSBlbmFibGUtZGlnLWZpbHQ6IEVuYWJsZSB0aGUgYnVp
bHQtaW4gZGlnaXRhbCBmaWx0ZXIgb24gdGhlIGkyYyBsaW5lcywNCj4gICAgc3BlY2lmaWNhbGx5
IHJlcXVpcmVkIGRlcGVuZGluZyBvbiB0aGUgaGFyZHdhcmUgUENCL2JvYXJkIGFuZCBpZiB0aGUN
Cj4gICAgdmVyc2lvbiBvZiB0aGUgY29udHJvbGxlciBpbmNsdWRlcyBpdC4NCj4gKy0gZW5hYmxl
LWFuYS1maWx0OiBFbmFibGUgdGhlIGJ1aWx0LWluIGFuYWxvZ2ljIGZpbHRlciBvbiB0aGUgaTJj
IGxpbmVzLA0KPiArICBzcGVjaWZpY2FsbHkgcmVxdWlyZWQgZGVwZW5kaW5nIG9uIHRoZSBoYXJk
d2FyZSBQQ0IvYm9hcmQgYW5kIGlmIHRoZQ0KPiArICB2ZXJzaW9uIG9mIHRoZSBjb250cm9sbGVy
IGluY2x1ZGVzIGl0Lg0KPiAgLSBDaGlsZCBub2RlcyBjb25mb3JtaW5nIHRvIGkyYyBidXMgYmlu
ZGluZw0KPiAgDQo+ICBFeGFtcGxlcyA6DQo+IEBAIC02MCw2ICs2Myw3IEBAIGkyYzA6IGkyY0Bm
ODAzNDYwMCB7DQo+ICAJYXRtZWwsZmlmby1zaXplID0gPDE2PjsNCj4gIAlpMmMtc2RhLWhvbGQt
dGltZS1ucyA9IDwzMzY+Ow0KPiAgCWVuYWJsZS1kaWctZmlsdDsNCj4gKwllbmFibGUtYW5hLWZp
bHQ7DQoNClBlcmhhcHMNCg0KCW1pY3JvY2hpcCxkaWdpdGFsLWZpbHRlcjsNCgltaWNyb2NoaXAs
YW5hbG9nLWZpbHRlcjsNCg0KPw0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICANCj4gIAl3bTg3MzE6
IHdtODczMUAxYSB7DQo+ICAJCWNvbXBhdGlibGUgPSAid204NzMxIjsNCj4gDQoNCg==
