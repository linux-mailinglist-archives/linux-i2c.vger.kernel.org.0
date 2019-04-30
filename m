Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F194B10021
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 21:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfD3TNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 15:13:45 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com ([40.107.8.132]:52899
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727001AbfD3TNp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 15:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QqRj1V5av7P3AlvxFAacQssN5BATxgXVvsCJtbvmcc=;
 b=IEfcu/ch4bnpI/SyrQ+l49dUtS0EPiG4Ze/nMpS4UWRluMPw1UhN9IKuYfrJbKo68KNS9vAGRneQlys2qdK52RfDRomGVCDgqPvjs6kXtey/4Zh6dvgMLlTYLF0yaBS6QI1jYZP0he0i+ty6ADXzfLFMRQj1+PfliiLbsjPrW2U=
Received: from AM0PR02MB4563.eurprd02.prod.outlook.com (20.178.17.97) by
 AM0PR02MB3730.eurprd02.prod.outlook.com (52.134.87.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Tue, 30 Apr 2019 19:13:41 +0000
Received: from AM0PR02MB4563.eurprd02.prod.outlook.com
 ([fe80::e80e:1cbb:5e37:b8c7]) by AM0PR02MB4563.eurprd02.prod.outlook.com
 ([fe80::e80e:1cbb:5e37:b8c7%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 19:13:41 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PULL REQUEST] i2c-mux for 4.20-rc1
Thread-Topic: [PULL REQUEST] i2c-mux for 4.20-rc1
Thread-Index: AQHU/4jS1ZF1Z8BJ/0u/CfFOW80ing==
Date:   Tue, 30 Apr 2019 19:13:41 +0000
Message-ID: <3a139b00-0749-e8bf-08f2-857e68f7a828@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::31)
 To AM0PR02MB4563.eurprd02.prod.outlook.com (2603:10a6:208:ec::33)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac134deb-8d8d-4bf5-25a7-08d6cd9ff4c2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:AM0PR02MB3730;
x-ms-traffictypediagnostic: AM0PR02MB3730:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR02MB373039F0F8756FF0BF37BB99BC3A0@AM0PR02MB3730.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(39830400003)(346002)(366004)(189003)(199004)(66066001)(65956001)(65806001)(8936002)(6486002)(97736004)(110136005)(68736007)(66946007)(64126003)(66446008)(66556008)(66476007)(99286004)(64756008)(73956011)(3846002)(31686004)(6116002)(102836004)(2906002)(305945005)(316002)(71190400001)(25786009)(81166006)(71200400001)(7736002)(26005)(8676002)(81156014)(6512007)(476003)(6306002)(53936002)(2616005)(966005)(52116002)(31696002)(6436002)(186003)(58126008)(74482002)(65826007)(2501003)(6506007)(36756003)(86362001)(486006)(14454004)(508600001)(14444005)(5660300002)(256004)(386003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB3730;H:AM0PR02MB4563.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JSBG65JO4qSib7DCvEgZIT7Hemr3pJdi2hEtl5gqwziHi8qnWMZ5Vw+AMzFocEz2SIO4JI745EByKLVs+OJfOAkMW6nLMEa4oJ4dQx/q25VjdPLD207agH/RD3PFqGGrLxv9lcCETnr2pVUAqOvsX6snuReuRphXGb/OcPzzSOjkPaO6OrEh2MtpuWx+44YzkdSNeZsusA8gtiGtg+AQLbJDEx9kTkeRqONa9hBX4t2QT4fkle0SzOKbVkH+Xq8qYLhhprPX7vP6KrhG234MJOlpyG6RrPpPlwCDqnb1ohPSDUuA8UQ7YpoKwnXgQkjmKPSMKRrLDNONUrGsugwYhDKglzvbDSk0DXsQ+3QJ7zsW74PJ3vQNnrPrkhGwlYqp35b47Ccg0NipUfcF/8EycFDPYG3M3x5fmv38dqJ+UVE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF3D8971FB976341AE3E3D0EBADCA898@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ac134deb-8d8d-4bf5-25a7-08d6cd9ff4c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 19:13:41.2204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3730
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KQXMgdXN1YWwsIG5vdCBtdWNoIHRoaXMgdGltZSBhcm91bmQgZWl0aGVy
LiBUaGlzIGhhcyBiZWVuIGluIC1uZXh0DQpzaW5jZSBiZWdpbm5pbmcgb2YgbGFzdCB3ZWVrLCBz
byBzaG91bGQgYmUgcXVpdGUgc2FmZSB0byBwdWxsLg0KDQpNYWlubHkgc29tZSBwY2E5NTR4IHdv
cmssIGkuZS4gcmVtb3ZhbCBvZiB1bnVzZWQgcGxhdGZvcm0gZGF0YSBzdXBwb3J0DQphbmQgYWRk
ZWQgc3VwcG9ydCBmb3Igc3lzZnMgaW50ZXJmYWNlIGZvciBtYW5pcHVsYXRpbmcvZXhhbWluaW5n
IHRoZQ0KaWRsZSBzdGF0ZS4gQW5kIHRoZW4gYSBtZWNoYW5pY2FsIGNvY2NpLXN0eWxlIHBhdGNo
Lg0KDQpJIGhvcGUgeW91IGdldCBiZXR0ZXIhDQoNCkNoZWVycywNClBldGVyDQoNClRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNzlhM2FhYTdiODJlMzEwNmJlOTc4NDJkZWRmZDg0
MjkyNDg4OTZlNjoNCg0KICBMaW51eCA1LjEtcmMzICgyMDE5LTAzLTMxIDE0OjM5OjI5IC0wNzAw
KQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBnaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczov
L2dpdGh1Yi5jb20vcGVkYS1yL2kyYy1tdXguZ2l0IGkyYy1tdXgvZm9yLW5leHQNCg0KZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGQ1OTg0ZDJhMzEyMTQ0YmVkY2NmMzJhZWEyMjk4Zjhk
ZjA1YmI2MTc6DQoNCiAgaTJjOiBtdXg6IGRlbXV4LXBpbmN0cmw6IHVzZSBzdHJ1Y3Rfc2l6ZSgp
IGluIGRldm1fa3phbGxvYygpICgyMDE5LTA0LTIxIDIzOjQ1OjA4ICswMjAwKQ0KDQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQpHdXN0YXZvIEEuIFIuIFNpbHZhICgxKToNCiAgICAgIGkyYzogbXV4OiBkZW11eC1waW5jdHJs
OiB1c2Ugc3RydWN0X3NpemUoKSBpbiBkZXZtX2t6YWxsb2MoKQ0KDQpSb2JlcnQgU2hlYXJtYW4g
KDMpOg0KICAgICAgaTJjOiBtdXg6IHBjYTk1NHg6IHJlbW92ZSBzdXBwb3J0IGZvciB1bnVzZWQg
cGxhdGZvcm0gZGF0YQ0KICAgICAgaTJjOiBtdXg6IHBjYTk1NDE6IHJlbW92ZSBzdXBwb3J0IGZv
ciB1bnVzZWQgcGxhdGZvcm0gZGF0YQ0KICAgICAgaTJjOiBtdXg6IHBjYTk1NHg6IGFsbG93IG1h
bmFnZW1lbnQgb2YgZGV2aWNlIGlkbGUgc3RhdGUgdmlhIHN5c2ZzDQoNCiAuLi4vQUJJL3Rlc3Rp
bmcvc3lzZnMtYnVzLWkyYy1kZXZpY2VzLXBjYTk1NHggICAgICB8ICAyMCArKysrDQogZHJpdmVy
cy9pMmMvbXV4ZXMvaTJjLWRlbXV4LXBpbmN0cmwuYyAgICAgICAgICAgICAgfCAgIDQgKy0NCiBk
cml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NDEuYyAgICAgICAgICAgICAgICB8ICAgOCAr
LQ0KIGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5jICAgICAgICAgICAgICAgIHwg
MTA2ICsrKysrKysrKysrKysrKy0tLS0tLQ0KIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9w
Y2E5NTR4LmggICAgICAgICAgICAgIHwgIDQ4IC0tLS0tLS0tLS0NCiA1IGZpbGVzIGNoYW5nZWQs
IDEwMiBpbnNlcnRpb25zKCspLCA4NCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaTJjLWRldmljZXMtcGNhOTU0eA0K
IGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvcGNhOTU0eC5o
DQo=
