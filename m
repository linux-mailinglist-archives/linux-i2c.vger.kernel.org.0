Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B545274A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbfFYI5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:57:19 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com ([40.107.1.131]:26166
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730741AbfFYI5S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 04:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7W4pWfQLLwhZzFUgoWVbp0ghDBuAUqH8FPhvUf0OmU=;
 b=X3t2KO4I0Rb1sezU5In0OfLmderfoAI399pMIAD7e9jhD3iEEoj3QwY/LjNqIpLdQAemTcFFw+F1aZYg5k5qOVPyNF4kEkQIXmMAqv29ik2u5AosYJSpCqljQQIJwywFuRVvG4zt2yNsAv91Kvtdl/2NLyDxvkBKiRxnsfZsqds=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3276.eurprd02.prod.outlook.com (52.134.70.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:57:14 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153%3]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 08:57:14 +0000
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
Subject: Re: [PATCH v2 3/9] dt-bindings: i2c: at91: add binding for
 enable-dig-filtr
Thread-Topic: [PATCH v2 3/9] dt-bindings: i2c: at91: add binding for
 enable-dig-filtr
Thread-Index: AQHVKyy4Gtu+NY4pbEyagA7mJFNWFKasEZeA
Date:   Tue, 25 Jun 2019 08:57:14 +0000
Message-ID: <d6f9cae4-0281-e1da-3c7d-69600f7562cd@axentia.se>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-4-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1561449642-26956-4-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0701CA0049.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::17) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a72224d4-5e33-4571-3780-08d6f94b1e19
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3276;
x-ms-traffictypediagnostic: DB3PR0202MB3276:
x-microsoft-antispam-prvs: <DB3PR0202MB3276FC4D7DC987DCDDACD96EBCE30@DB3PR0202MB3276.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39830400003)(376002)(366004)(346002)(136003)(189003)(199004)(229853002)(476003)(2616005)(73956011)(6246003)(66946007)(64756008)(81156014)(66476007)(25786009)(8936002)(66556008)(81166006)(6512007)(99286004)(11346002)(6116002)(3846002)(8676002)(66446008)(7416002)(6436002)(14454004)(53936002)(66066001)(65806001)(65956001)(6486002)(5660300002)(7736002)(76176011)(446003)(58126008)(256004)(74482002)(26005)(102836004)(6506007)(53546011)(186003)(110136005)(386003)(71200400001)(86362001)(64126003)(31686004)(71190400001)(31696002)(68736007)(486006)(2201001)(508600001)(65826007)(36756003)(2906002)(2501003)(52116002)(316002)(305945005)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3276;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PTSOkWc9cjVHzuZkxLz3NZsgtGl/0ZTLiMY95xaKX4QZEQ1ffLzt2zeldHnNXBCatESpfPNxMuv1+t47p2bSnK6OsUlUF0Au3FI6oBZYT/3GYW3dTxWxX7FEDiYUFKwSeX4H+Af4S3D9ZgDgDt2qQ/7PxXOKjmjIQVThTLsnXXW5HnUJ5k6wQuwTfHKMeM1BJEdZh35rGRnpidUYRWcn/gBGsKKXmPw/gvY0jzNEd8guwTsqMoGG7o6xkNDc65/7Bv2cUnikgJrkZo5Ez8K8OdozDjoTwpcz2fkVERvXdKseGC7eDJ5aixK2Rp9eU0VyslCNvcgpp/E59uH2cCUBGOcGHP92MLOymMC1T+9ugLt2dmjhsnz1h+zkpMSxBviLyRk7jchE0TumPoYFv3SEop7HTQu4VGoqYvNO5xTbQNw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <011A95CE47B3734FB0FAAF2F46BA808C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a72224d4-5e33-4571-3780-08d6f94b1e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:57:14.5024
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

T24gMjAxOS0wNi0yNSAxMDowNCwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBBZGQgYmluZGluZyBzcGVjaWZpY2F0b2luIGZvciBkaWdpdGFsIGZpbHRlciBpbnNpZGUgdGhl
IGkyYyBjb250cm9sbGVyDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdl
bi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvaTJjLWF0OTEudHh0DQo+IGluZGV4IDIyMTBmNDMuLjgyNjg1OTUgMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0
OTEudHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJj
LWF0OTEudHh0DQo+IEBAIC0yMCw2ICsyMCw5IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ICAg
IGNhcGFibGUgSTJDIGNvbnRyb2xsZXJzLg0KPiAgLSBpMmMtc2RhLWhvbGQtdGltZS1uczogVFdE
IGhvbGQgdGltZSwgb25seSBhdmFpbGFibGUgZm9yICJhdG1lbCxzYW1hNWQ0LWkyYyINCj4gICAg
YW5kICJhdG1lbCxzYW1hNWQyLWkyYyIuDQo+ICstIGVuYWJsZS1kaWctZmlsdDogRW5hYmxlIHRo
ZSBidWlsdC1pbiBkaWdpdGFsIGZpbHRlciBvbiB0aGUgaTJjIGxpbmVzLA0KPiArICBzcGVjaWZp
Y2FsbHkgcmVxdWlyZWQgZGVwZW5kaW5nIG9uIHRoZSBoYXJkd2FyZSBQQ0IvYm9hcmQgYW5kIGlm
IHRoZQ0KPiArICB2ZXJzaW9uIG9mIHRoZSBjb250cm9sbGVyIGluY2x1ZGVzIGl0Lg0KPiAgLSBD
aGlsZCBub2RlcyBjb25mb3JtaW5nIHRvIGkyYyBidXMgYmluZGluZw0KPiAgDQo+ICBFeGFtcGxl
cyA6DQo+IEBAIC01Niw2ICs1OSw3IEBAIGkyYzA6IGkyY0BmODAzNDYwMCB7DQo+ICAJY2xvY2tz
ID0gPCZmbHgwPjsNCj4gIAlhdG1lbCxmaWZvLXNpemUgPSA8MTY+Ow0KPiAgCWkyYy1zZGEtaG9s
ZC10aW1lLW5zID0gPDMzNj47DQo+ICsJZW5hYmxlLWRpZy1maWx0Ow0KDQpUaGlzIHNwZWxsaW5n
IGRvZXMgbm90IG1hdGNoIHRoZSBzcGVsbGluZyBpbiB0aGUgc3ViamVjdC4gQnV0IHBsZWFzZSBz
ZWUNCm15IGNvbW1lbnQgb24gcGF0Y2ggNi85Li4uDQoNCkNoZWVycywNClBldGVyDQoNCj4gIA0K
PiAgCXdtODczMTogd204NzMxQDFhIHsNCj4gIAkJY29tcGF0aWJsZSA9ICJ3bTg3MzEiOw0KPiAN
Cg0K
