Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F365D143965
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 10:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgAUJWZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 04:22:25 -0500
Received: from mail-eopbgr00114.outbound.protection.outlook.com ([40.107.0.114]:63811
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725789AbgAUJWZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 04:22:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F63ZKAIRkvr2Vqr/UURmxyYHHiYyh9N5LHMeMbUotHJ59tG6W+tI9Zi1fgVVhtd3EAi8ZG40GGSs43vfN9AIWRwFmQtqKp2h7ideQhF6ReLB9qn5buOAGsJ+ULpV/FJpxRLBOYV6uGvPwer790PSMPCseOXU14Tb8no2Mr9uc7k0f0RdQXXNGKcff9XGRhP2cTv38OzkINmG8XBtebBlKfdTwfYWSgaZc/gRj5VCDueRAkHcbC2kzb5/OX+5mPgBvRWucIaKp2H7P33QWLhKQ7+N+eGWpue9sSNf3uLDwtOmdnGoBh/ChgjEjKPSiw68TJg8f17CQMMG9F7LceVj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl4kpbTh/h4iFwpyUIe3vec2Ypl0vAs1UiA1k5HtMEE=;
 b=Sau41N3et4zMLE/fQEPeq+NCOFDZPwtATDjKy5X52f/AqTEUIKogYSPsxC6hLL+yyIACx4lNSiQiRR3C0b5VN12D2erZthUQd0wW787C3pNTT3rgDJvXFOTab5NYI8CiSZkwpdCU72q63rU4/HsSdV0j0N8ctpqaHp5DNdi6WPtDXE+D1RxkirMIh/cGiUBe64ivQyMzY/BAKLgoDk/lJRguklCJ7SkHVg+yjT83s9AwH7VBzdb8p0LOCZuBUNkxZC06ScyT8BXFBX8wtMzOx6MNFuYdc/R4+drDma9ju9/iXorWTzWpKstkiz/vIxE+9MJfUpheTkQ3eP79086Zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl4kpbTh/h4iFwpyUIe3vec2Ypl0vAs1UiA1k5HtMEE=;
 b=Tbh9T/oV7VXfHf8yWpnBw0XgT1Ued0Y+hZdW15gg7qeknIo4C2FcC06Mfos2NldGH1OYT4dN8wwoOF+gUxHcJ8LAeRy9UBPhpyWBkqSXbIo2zWit50Yvjp2qUYID7dVgKHMWgdpZ8MuT1Ye4vZzcZHy39NoSmzAm/39PT1n3Dnc=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3529.eurprd02.prod.outlook.com (52.134.66.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Tue, 21 Jan 2020 09:22:18 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 09:22:18 +0000
Received: from [192.168.13.3] (213.112.138.4) by AM5PR0102CA0011.eurprd01.prod.exchangelabs.com (2603:10a6:206::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend Transport; Tue, 21 Jan 2020 09:22:18 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 4/5] i2c: core: add simple caching to the 'alias'
 scanning
Thread-Topic: [RFC PATCH 4/5] i2c: core: add simple caching to the 'alias'
 scanning
Thread-Index: AQHVv/WAdHqHOdjU9kKSYojKERCOCaf0+KAA
Date:   Tue, 21 Jan 2020 09:22:18 +0000
Message-ID: <89241480-6c8b-55a2-ea82-3b1245f15aeb@axentia.se>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191231161400.1688-5-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: AM5PR0102CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:206::24) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0b0e08-1d5c-4f60-49c4-08d79e53698a
x-ms-traffictypediagnostic: DB3PR0202MB3529:
x-microsoft-antispam-prvs: <DB3PR0202MB3529AD0385BE54E5094030B2BC0D0@DB3PR0202MB3529.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(376002)(396003)(39830400003)(136003)(189003)(199004)(8936002)(81156014)(86362001)(81166006)(66946007)(66476007)(66446008)(64756008)(4326008)(66556008)(8676002)(31686004)(5660300002)(36756003)(31696002)(6486002)(54906003)(2906002)(71200400001)(956004)(2616005)(316002)(52116002)(16576012)(110136005)(186003)(16526019)(508600001)(53546011)(4001150100001)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3529;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4leqg3RxE+V0cFtBckSGAVsMPpXT9ine8oLd+h+sykW8OjGMRu8Ipt9X4a14CtBxnJHRzm2Ow7uKcEppy+wCSmWg6s/DvZ2uxR8pzxf7y252ZpahMpZwNXP0xtv26lFxd37q8VI+Dr0dFM7wKla5Y06XGamVzLVrsxAtcA9haPdsjlCQ7RMVbTN/kAAjcLBO5L0WLj1LiOcuI2iUzCLCrZqx+cBGjj2yDOaLi04FU9d89W5l3Qg8WPmmNyIrr36ubRTxEv1sZn49Sfh2CLe4rFQ4tIiH4ZteSh3xQdT8xjunKDLzKTZMQRSGh4PDtK3JRADS280WIpWdPKQhAsHUZRw7kUCcJ9C4x+LcreciKCRA3CWOo88SOfWBshPayf1KwLtLQburET8Tqxd+xeFoZwe2hoXqVeAZChBkNfmC4UAIYbp3V8ueN2Mzw0jNFHvG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <787E90771E44314FBB86039EF2127451@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0b0e08-1d5c-4f60-49c4-08d79e53698a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 09:22:18.7898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tn/XPJ5s4TA5qF1YXhgnRJNhnELCvNmg9b2NdZxWmBtZO4kML8NnweA5MPlSokv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3529
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMi0zMSAxNzoxMywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBBZGQgc29tZSBzaW1w
bGUgY2FjaGluZyBvZiB0aGUgbGFzdCB1c2VkIGFsaWFzIHRvIHNraXAgc29tZSB1bm5lZWRlZA0K
PiBzY2FubmluZyBvZiB0aGUgSTJDIGJ1cy4gV2hlbiBmcmVlaW5nIHRoZSBkZXZpY2UsIHRoZSBj
YWNoZSB3aWxsIGJlIHNldA0KPiBiYWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBT
YW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2kyYy9pMmMtY29yZS1iYXNlLmMgfCAxNSArKysrKysrKysrKysrKy0NCj4gIGluY2x1ZGUvbGlu
dXgvaTJjLmggICAgICAgICB8ICAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9pMmMt
Y29yZS1iYXNlLmMgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gaW5kZXggNWEwMTBl
N2U2OThmLi4wY2M0YTVjNDlhMTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3Jl
LWJhc2UuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gQEAgLTgzMCw2
ICs4MzAsOCBAQCBFWFBPUlRfU1lNQk9MX0dQTChpMmNfbmV3X2RldmljZSk7DQo+ICAgKi8NCj4g
IHZvaWQgaTJjX3VucmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+
ICB7DQo+ICsJc3RydWN0IGkyY19hZGFwdGVyICphZGFwID0gY2xpZW50LT5hZGFwdGVyOw0KPiAr
DQo+ICAJaWYgKElTX0VSUl9PUl9OVUxMKGNsaWVudCkpDQo+ICAJCXJldHVybjsNCj4gIA0KPiBA
QCAtODQwLDYgKzg0MiwxNCBAQCB2b2lkIGkyY191bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQ0KPiAgDQo+ICAJaWYgKEFDUElfQ09NUEFOSU9OKCZjbGllbnQtPmRl
dikpDQo+ICAJCWFjcGlfZGV2aWNlX2NsZWFyX2VudW1lcmF0ZWQoQUNQSV9DT01QQU5JT04oJmNs
aWVudC0+ZGV2KSk7DQo+ICsNCj4gKwlpMmNfbG9ja19idXMoYWRhcCwgSTJDX0xPQ0tfU0VHTUVO
VCk7DQo+ICsNCj4gKwlpZiAoY2xpZW50LT5mbGFncyAmIEkyQ19DTElFTlRfQUxJQVMgJiYgY2xp
ZW50LT5hZGRyIDwgYWRhcC0+YWxpYXNfaWR4KQ0KPiArCQlhZGFwLT5hbGlhc19pZHggPSBjbGll
bnQtPmFkZHI7DQo+ICsNCj4gKwlpMmNfdW5sb2NrX2J1cyhhZGFwLCBJMkNfTE9DS19TRUdNRU5U
KTsNCj4gKw0KPiAgCWRldmljZV91bnJlZ2lzdGVyKCZjbGllbnQtPmRldik7DQo+ICB9DQo+ICBF
WFBPUlRfU1lNQk9MX0dQTChpMmNfdW5yZWdpc3Rlcl9kZXZpY2UpOw0KPiBAQCAtMTI5Nyw2ICsx
MzA3LDcgQEAgc3RhdGljIGludCBpMmNfcmVnaXN0ZXJfYWRhcHRlcihzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmFkYXApDQo+ICAJCWFkYXAtPmxvY2tfb3BzID0gJmkyY19hZGFwdGVyX2xvY2tfb3BzOw0K
PiAgDQo+ICAJYWRhcC0+bG9ja2VkX2ZsYWdzID0gMDsNCj4gKwlhZGFwLT5hbGlhc19pZHggPSAw
eDA4OwkvKiBmaXJzdCB2YWxpZCBJMkMgYWRkcmVzcyAqLw0KPiAgCXJ0X211dGV4X2luaXQoJmFk
YXAtPmJ1c19sb2NrKTsNCj4gIAlydF9tdXRleF9pbml0KCZhZGFwLT5tdXhfbG9jayk7DQo+ICAJ
bXV0ZXhfaW5pdCgmYWRhcC0+dXNlcnNwYWNlX2NsaWVudHNfbG9jayk7DQo+IEBAIC0yMjQ5LDEw
ICsyMjYwLDEyIEBAIHN0cnVjdCBpMmNfY2xpZW50ICppMmNfbmV3X2FsaWFzX2RldmljZShzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmFkYXApDQo+ICANCj4gIAlpMmNfbG9ja19idXMoYWRhcCwgSTJDX0xP
Q0tfU0VHTUVOVCk7DQo+ICANCj4gLQlmb3IgKGFkZHIgPSAweDA4OyBhZGRyIDwgMHg3ODsgYWRk
cisrKSB7DQo+ICsJZm9yIChhZGRyID0gYWRhcC0+YWxpYXNfaWR4OyBhZGRyIDwgMHg3ODsgYWRk
cisrKSB7DQo+ICAJCXJldCA9IGkyY19zY2FuX2Zvcl9jbGllbnQoYWRhcCwgYWRkciwgaTJjX3Vu
bG9ja2VkX3JlYWRfYnl0ZV9wcm9iZSk7DQo+ICAJCWlmIChyZXQgPT0gLUVOT0RFVikgew0KPiAg
CQkJYWxpYXMgPSBpMmNfbmV3X2R1bW15X2RldmljZShhZGFwLCBhZGRyKTsNCj4gKwkJCWFsaWFz
LT5mbGFncyB8PSBJMkNfQ0xJRU5UX0FMSUFTOw0KPiArCQkJYWRhcC0+YWxpYXNfaWR4ID0gYWRk
ciArIDE7DQo+ICAJCQlkZXZfZGJnKCZhZGFwLT5kZXYsICJGb3VuZCBhbGlhczogMHgleFxuIiwg
YWRkcik7DQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9pMmMuaCBiL2luY2x1ZGUvbGludXgvaTJjLmgNCj4gaW5kZXggNTgzY2EyYWVjMDIyLi42NDI3
YzJkYjVlZTAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaTJjLmgNCj4gKysrIGIvaW5j
bHVkZS9saW51eC9pMmMuaA0KPiBAQCAtMzA5LDYgKzMwOSw3IEBAIHN0cnVjdCBpMmNfZHJpdmVy
IHsNCj4gIHN0cnVjdCBpMmNfY2xpZW50IHsNCj4gIAl1bnNpZ25lZCBzaG9ydCBmbGFnczsJCS8q
IGRpdi4sIHNlZSBiZWxvdwkJKi8NCj4gICNkZWZpbmUgSTJDX0NMSUVOVF9QRUMJCTB4MDQJLyog
VXNlIFBhY2tldCBFcnJvciBDaGVja2luZyAqLw0KPiArI2RlZmluZSBJMkNfQ0xJRU5UX0FMSUFT
CTB4MDgJLyogY2xpZW50IGlzIGFuIGFsaWFzICovDQo+ICAjZGVmaW5lIEkyQ19DTElFTlRfVEVO
CQkweDEwCS8qIHdlIGhhdmUgYSB0ZW4gYml0IGNoaXAgYWRkcmVzcyAqLw0KPiAgCQkJCQkvKiBN
dXN0IGVxdWFsIEkyQ19NX1RFTiBiZWxvdyAqLw0KPiAgI2RlZmluZSBJMkNfQ0xJRU5UX1NMQVZF
CTB4MjAJLyogd2UgYXJlIHRoZSBzbGF2ZSAqLw0KPiBAQCAtNzE1LDYgKzcxNiw3IEBAIHN0cnVj
dCBpMmNfYWRhcHRlciB7DQo+ICAJY29uc3Qgc3RydWN0IGkyY19hZGFwdGVyX3F1aXJrcyAqcXVp
cmtzOw0KPiAgDQo+ICAJc3RydWN0IGlycV9kb21haW4gKmhvc3Rfbm90aWZ5X2RvbWFpbjsNCj4g
Kwl1MTYgYWxpYXNfaWR4Ow0KPiAgfTsNCj4gICNkZWZpbmUgdG9faTJjX2FkYXB0ZXIoZCkgY29u
dGFpbmVyX29mKGQsIHN0cnVjdCBpMmNfYWRhcHRlciwgZGV2KQ0KPiAgDQo+IA0KDQpJZiB5b3Ug
aGF2ZSBhIHNpdHVhdGlvbiB3aGVyZSBhIGRyaXZlciBmb3IgYSBkZXZpY2Ugd2l0aCByZXByb2dy
YW1tYWJsZQ0KSTJDIGFkZHJlc3MgaXMsIHNheSwgYnVpbHQgYXMgYSBtb2R1bGUgYW5kIGlzIHJl
bG9hZGVkIHJlcGVhdGVkbHkgZm9yIHNvbWUNCnJlYXNvbiwgYW5kIGFsc28gaGF2ZSB0aGUgc2l0
dWF0aW9uIHRoYXQgdGhlIGRldmljZSBrZWVwcyByZXNwb25kaW5nIHRvDQp0aGUgbGFzdCB1c2Vk
IGFkZHJlc3MgZXZlbiBhZnRlciB1bmxvYWRpbmcgdGhlIGRyaXZlci4gVGhlbiBJIHRoaW5rIHlv
dQ0KaGF2ZSBhIHByb2JsZW0sIGJlY2F1c2UgYXMgSSByZWFkIHRoZSBjb2RlIHRoZSBhbGlhcyBh
ZGRyZXNzIHdpbGwgaW5jcmVhc2UNCndpdGggZXZlcnkgcmVsb2FkLCBhbmQgZXZlbnR1YWxseSBo
aXQgdGhlIDB4Nzggcm9vZi4NCg0KTm8/DQoNCkNoZWVycywNClBldGVyDQo=
