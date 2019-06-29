Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535DC5A945
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 08:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfF2Gbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 02:31:50 -0400
Received: from mail-eopbgr150100.outbound.protection.outlook.com ([40.107.15.100]:28844
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726708AbfF2Gbu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 02:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37SUjS7m2lmhNc2Adry54CaxcVIZrf2Rekl3nxTmdwU=;
 b=Brv9HcytOqf5Sl59lC7Rve9wRO41jgBtIKc+twBo6sfRoF1lmI7mIGp7dpR3CqdeGrl7lJ7RNTUQ5qf9xLkgmMQJhGnm5ugtN/6mrMg6NCUWY9I0RAULG/3w+sZYRtNz/+Dfnv/IzLFLw4JIBYSELwODcxfEYaELBvJMXj6i/Co=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3290.eurprd02.prod.outlook.com (52.134.70.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Sat, 29 Jun 2019 06:31:45 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153%3]) with mapi id 15.20.2008.014; Sat, 29 Jun 2019
 06:31:45 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PULL REQUEST] i2c-mux for 5.3-rc1
Thread-Topic: [PULL REQUEST] i2c-mux for 5.3-rc1
Thread-Index: AQHVLkRSlxgFiC6U/EyL0EYDbF8ggg==
Date:   Sat, 29 Jun 2019 06:31:44 +0000
Message-ID: <c1769ae2-8e44-c54e-e8cb-dcca5d3b0a2a@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::17)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ed942bf-3c33-4cfb-dfc1-08d6fc5b749c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3290;
x-ms-traffictypediagnostic: DB3PR0202MB3290:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0202MB3290C4E0298D81933CE80C3ABCFF0@DB3PR0202MB3290.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0083A7F08A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(39830400003)(376002)(136003)(366004)(52314003)(199004)(189003)(966005)(66476007)(66556008)(66446008)(64756008)(66946007)(66066001)(65956001)(65806001)(8676002)(53936002)(81156014)(6306002)(58126008)(81166006)(25786009)(316002)(14454004)(476003)(486006)(2616005)(6512007)(110136005)(71200400001)(73956011)(64126003)(71190400001)(99286004)(36756003)(256004)(86362001)(31696002)(6506007)(386003)(102836004)(5660300002)(26005)(2501003)(65826007)(186003)(52116002)(6436002)(31686004)(6486002)(305945005)(7736002)(6116002)(3846002)(74482002)(8936002)(508600001)(68736007)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3290;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LvzUsOyWA9TYBj0HDTcJ/X8jTpO64KmMCs9jsSx+frN7FplLYxs1FKbmVwjAb1yWcQt04Qg+nA2D20b0ULi1ckppxr36HUXnQN7EwNDoJNdHFOwLT0g7Yx1Nj1zAfyocTT8lDeLoMUYdM76gwXRR80tztHNRBgp5se4bqcNPdR8g11jHuWO5NHHIN2on754JgtdHD1ioRe5UDWOPZOfCqYjhS9yL4W1I4JUvfnhZrCNZhKFgkcHYNcF5EIDbXuicRuiafa/GAIAfb2n9abUHujU6IjtNRzAwrPArQUpvyfqso8t/qHdt9AD9ULGfMOmBJdQXipyKjjy8TGFNvcRKYhK6phrb/tloIz7KGrg1qMdTSDSiU/BsjEoglK0nrIsDTvKkpC3JGG/VbjzNW1cQhCJEE+AWMr9emXfLiqJJ430=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D6FE4ECC6977343B55405B2C57138AE@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed942bf-3c33-4cfb-dfc1-08d6fc5b749c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2019 06:31:44.9694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3290
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KSSByZWFsaXplIHRoYXQgdGhlcmUgYXJlIGNoYW5nZXMgaW4gZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1pODAxLmMgdGhhdCBzdHJpY3RseQ0Kc3BlYWtpbmcgZG9uJ3QgYmVs
b25nIGhlcmUsIGJ1dCBJIGhvcGUgeW91IGRvbid0IG1pbmQuIFRoZXNlIGNoYW5nZXMgYXJlIGFs
bA0KYWJvdXQgdGhlIGludGVyYWN0aW9uIHdpdGggdGhlIGkyYy1tdXgtZ3BpbyBjb2RlLCBhbmQg
SSBkaWQgYSB0ZXN0LW1lcmdlIGEgZmV3DQpkYXlzIGFnbyB3L28gY29uZmxpY3RzLg0KDQpBbnl3
YXksIHRoZSBHUElPLXdvcmsgZnJvbSBMaW51cyBXYWxsZWlqICh3aXRoIGhlbHAgZnJvbSBTZXJn
ZSBTZW1pbikgaW4gdGhlDQppMmMtbXV4LWdwaW8gYW5kIGkyYy1hcmItZ3Bpby1jaGFsbGVuZ2Ug
ZHJpdmVycyBpcyB0aGUgbWFpbiBmZWF0dXJlLg0KDQpQbGVhc2UgcHVsbC4NCg0KQ2hlZXJzLA0K
UGV0ZXINCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjZDZjODRkOGYwY2Rj
OTExZGY0MzViYjA3NWJhMjJjZTNjNjA1YjA3Og0KDQogIExpbnV4IDUuMi1yYzIgKDIwMTktMDUt
MjYgMTY6NDk6MTkgLTA3MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5
IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wZWRhLXIvaTJjLW11eC5naXQgaTJjLW11eC9m
b3ItbmV4dA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMDVhZjA3NjU3MDdmYzEz
NjQzM2FiMzgwZDVkNjI3YWZlM2I4ZGRhOToNCg0KICBpMmM6IG11eDogZGVtdXgtcGluY3RybDog
dXNlIHByb3BlciBlbWFpbCBhZGRyZXNzIGZvciBBQkkgcmVxdWVzdHMgKDIwMTktMDYtMjIgMDc6
MzU6MjQgKzAyMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkd1c3Rhdm8gQS4gUi4gU2lsdmEgKDIpOg0KICAgICAg
aTJjOiBtdXg6IFVzZSBzdHJ1Y3Rfc2l6ZSgpIGluIGRldm1fa3phbGxvYygpDQogICAgICBpMmM6
IG11eDogcGluY3RybDogdXNlIGZsZXhpYmxlLWFycmF5IG1lbWJlciBhbmQgc3RydWN0X3NpemUo
KSBoZWxwZXINCg0KTGludXMgV2FsbGVpaiAoMik6DQogICAgICBpMmM6IG11eDogYXJiLWdwaW86
IFJld3JpdGUgdG8gdXNlIEdQSU8gZGVzY3JpcHRvcnMNCiAgICAgIGkyYzogbXV4L2k4MDE6IFN3
aXRjaCB0byB1c2UgZGVzY3JpcHRvciBwYXNzaW5nDQoNCldvbGZyYW0gU2FuZyAoMik6DQogICAg
ICBpMmM6IG11eDogYWRkIHN5c2ZzIGhlYWRlcg0KICAgICAgaTJjOiBtdXg6IGRlbXV4LXBpbmN0
cmw6IHVzZSBwcm9wZXIgZW1haWwgYWRkcmVzcyBmb3IgQUJJIHJlcXVlc3RzDQoNCiAuLi4vQUJJ
L3Rlc3Rpbmcvc3lzZnMtcGxhdGZvcm0taTJjLWRlbXV4LXBpbmN0cmwgICB8ICAgNCArLQ0KIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaTgwMS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDM3ICsr
KysrLS0NCiBkcml2ZXJzL2kyYy9pMmMtbXV4LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQ0KIGRyaXZlcnMvaTJjL211eGVzL2kyYy1hcmItZ3Bpby1jaGFsbGVuZ2UuYyAg
ICAgICAgIHwgIDc5ICsrKysrLS0tLS0tLS0tDQogZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1n
cGlvLmMgICAgICAgICAgICAgICAgICAgfCAxMTYgKysrKysrLS0tLS0tLS0tLS0tLS0tDQogZHJp
dmVycy9pMmMvbXV4ZXMvaTJjLW11eC1waW5jdHJsLmMgICAgICAgICAgICAgICAgfCAgIDUgKy0N
CiBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvaTJjLW11eC1ncGlvLmggICAgICAgICB8ICAg
NyAtLQ0KIDcgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMTU5IGRlbGV0aW9ucygt
KQ0K
