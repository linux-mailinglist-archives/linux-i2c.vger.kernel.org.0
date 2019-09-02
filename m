Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF21A543E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbfIBKon (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:44:43 -0400
Received: from mail-eopbgr30093.outbound.protection.outlook.com ([40.107.3.93]:53733
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729805AbfIBKon (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 06:44:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr4/vLjCOXAVt+vsTmFnJk2l1IJ2XmBcJJm0RXeC1Ivr/wY5azbZkOI66QKg74bHwS1Dtc65LkCkUVjOqeS1G5JqIz4SO7Pu6R47I1ZUpJAgwfE2SHCtVf/dOvDJ4457gGew7B3t6aZbiWYy5sTMkqmw+9ItOTe67KdmWLyn6He2M34qH7C3rA/hvwg7UIpLYedA1/bDoT2X2lkGY8zHRIi+6nKSkM9UMgSkiYALtexEfVDI5lLRAh34LoXZK77SgZG72mqXDvfU+NFf04BlLOOHfoNYVuhna2Fd/nmFONWTewVmw2+LbdK/0Rs9PTOfKeJjHHOUMn1Nh0Y6PJuYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjcgeCccopkLIYkE3Vz/2o6S+cAJUVa3vGAZnqppsDE=;
 b=Nw4+Q9D2JA6EYA3qmW9XIr/hr7crzLiCjSiKC33pxCD7yusHfAWOfgDTcMyQTHmgNBNaiFIKGFa0F9m96ZbApWYseW0En3cWrissoysdYANcg5KPrWxIT5qatGMJ1u/CVfwn7RN0lszmlpIARGFceZQVfgoTQBDut1BV/P+rPQR2t3zDTN52S6wyakERhPkLbGAb/hSxu37mzd0kzEBUhcvbiX4DSZv76+OHVhk8sr+ArQpOfvJcW279gMY56qcKaj+WZqdVotmWk2mbEftyKFRoZayQIowcD/wvljafWh12KGbPJOA5MvSp+jvF/TJRU+kNg0kvAjXcr7WNt1H5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjcgeCccopkLIYkE3Vz/2o6S+cAJUVa3vGAZnqppsDE=;
 b=CvN1p/TfsAev1SG3kFBtp89uZVooLmh6S1wLBxvSkl2C9eGRqs/OECjTSCjz2rckOje1tfSQ8aZVtvJ74UOp+7B5LuOkTTwz4fxWT0OPy3C47acjxEC2R51lcRqB44kMW7UqHta4Ne+jZTXVj6gld/Yhc/FyRE+tMXJZg1B1DhE=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3322.eurprd02.prod.outlook.com (52.134.66.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 10:44:24 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09%7]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:44:24 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "pierre-yves.mordret@st.com" <pierre-yves.mordret@st.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Topic: [PATCH v4 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Index: AQHVYXbgQNi7wM4M0k26eRDJy0qMmKcYM9GA
Date:   Mon, 2 Sep 2019 10:44:23 +0000
Message-ID: <47d618da-263f-199c-3cc6-35e8f8c6015d@axentia.se>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-2-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1567418773-2427-2-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a0c883a-e295-4524-9846-08d72f9284e3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3322;
x-ms-traffictypediagnostic: DB3PR0202MB3322:
x-microsoft-antispam-prvs: <DB3PR0202MB3322F8949921980EF6F7BCA9BCBE0@DB3PR0202MB3322.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(39830400003)(396003)(136003)(366004)(199004)(189003)(7416002)(508600001)(86362001)(2501003)(14454004)(71190400001)(2616005)(11346002)(2201001)(486006)(31696002)(446003)(6436002)(36756003)(229853002)(102836004)(476003)(305945005)(7736002)(256004)(71200400001)(2906002)(65806001)(6506007)(53546011)(65956001)(66066001)(14444005)(386003)(6512007)(3846002)(316002)(53936002)(52116002)(66446008)(8676002)(6246003)(64756008)(66556008)(66476007)(81156014)(58126008)(81166006)(31686004)(4326008)(26005)(8936002)(66946007)(76176011)(110136005)(99286004)(5660300002)(186003)(25786009)(6116002)(6486002)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3322;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qWchiUQCpgrOcfnr7mkhWgtGbhwcpbjo2qfOXSjqO3EepeWY9P4OkrnchnrBJXiQ4MnqJvdtQRQ8FbhRrNr/pj0GNq2chRTSg87U/cwUJHoe+7dZvHvErapvwUNCHlm+WbczndtTxG/+EY43f9wGmy+90th/18W1h1lROjfYAYxnmLWXXQz8de4SqB2VJQrnx44Orcgo5YIfBFLelI1C93ygO44zUJxUU5QYu9KF3lo6y02CcElamvq98aV85H/ArVJUpSmuPdIUDQBtQsUIgwkiMJYhYScnRcKTlGKVXruC6/oj7kt7E0AzH0WlfK/4NnmsbFp/zywU1rbcwNjp0P+Hf3qjvk3B71COp5agQ6WNVJdE6J56j1Aw7x6uQDUb14s+BoiJ6uNAxMTPKhnORfJshxlBoDphwiiXYZMRqxc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A70DBC8FDE72D94789EC5E96294C2FF8@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0c883a-e295-4524-9846-08d72f9284e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:44:24.0671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3Bnt387iAhyCz6g/l8eEDIx2oO0y7XcZ3P1fuwAPdEiKrnPVALqY5pgv7Ve2RFN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0wMiAxMjoxMSwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBBZGQgY29tcGF0aWJsZSBmb3IgbmV3IE1pY3JvY2hpcCBTb0MsIHNhbTl4NjANCj4gDQo+IFJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5
OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0KPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQgfCAzICsr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJj
LWF0OTEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5
MS50eHQNCj4gaW5kZXggYjdjZWMxNy4uMjIxMGY0MyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCj4gQEAgLTMsNyAr
Myw4IEBAIEkyQyBmb3IgQXRtZWwgcGxhdGZvcm1zDQo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzIDoN
Cj4gIC0gY29tcGF0aWJsZSA6IE11c3QgYmUgImF0bWVsLGF0OTFybTkyMDAtaTJjIiwgImF0bWVs
LGF0OTFzYW05MjYxLWkyYyIsDQo+ICAgICAgICJhdG1lbCxhdDkxc2FtOTI2MC1pMmMiLCAiYXRt
ZWwsYXQ5MXNhbTlnMjAtaTJjIiwgImF0bWVsLGF0OTFzYW05ZzEwLWkyYyIsDQo+IC0gICAgICJh
dG1lbCxhdDkxc2FtOXg1LWkyYyIsICJhdG1lbCxzYW1hNWQ0LWkyYyIgb3IgImF0bWVsLHNhbWE1
ZDItaTJjIg0KPiArICAgICAiYXRtZWwsYXQ5MXNhbTl4NS1pMmMiLCAiYXRtZWwsc2FtYTVkNC1p
MmMiLCAiYXRtZWwsc2FtYTVkMi1pMmMiIG9yDQo+ICsgICAgICJtaWNyb2NoaXAsc2FtOXg2MC1p
MmMiDQoNCklJVUMsIHRoaXMgbGlzdCBzaG91bGQgaWRlYWxseSBiZSByZWZvcm1hdHRlZCB3aXRo
IG9uZSBjb21wYXRpYmxlIHBlciBsaW5lLg0KDQpTaWRlIG5vdGU7IHVuZm9ydHVuYXRlIG5hbWlu
ZyB3aXRoIFNBTTl4NjAsIHdoZW4gdGhlcmUgaXMgYSBwcmVleGlzdGluZyA5MjYwDQpmaXR0aW5n
IHRoZSAid2lsZGNhcmQiIChBRkFJQ1QsIGl0J3Mgbm90IGEgd2lsZGNhcmQgaW4gdGhpcyBjYXNl
LCBidXQgaXQgc3VyZQ0KbG9va3MgbGlrZSBvbmUpLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICAt
IHJlZzogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIG9mIHRoZSBjb250cm9sbGVyIGFuZCBsZW5ndGgg
b2YgbWVtb3J5IG1hcHBlZA0KPiAgICAgICByZWdpb24uDQo+ICAtIGludGVycnVwdHM6IGludGVy
cnVwdCBudW1iZXIgdG8gdGhlIGNwdS4NCj4gDQoNCg==
