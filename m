Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75020B4D03
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 13:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfIQLhj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 07:37:39 -0400
Received: from mail-eopbgr20098.outbound.protection.outlook.com ([40.107.2.98]:47362
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726230AbfIQLhj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 07:37:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQAbmqwpcnCgfHj6WsNzA8URaW6hsSfJjeHZjg35u9ZybBPgzj+02CRlfJabfqZmspF3SsBJM+It1nXGGwsapYxS7oiL+fHGz16NFx3xzFAfhqgYVLU65M7DhdHlEjglo1K/ZsxDRCUGPX98gIFRq8awBBxmdnroBUTlQWS/10n+ZEtjkod4SNIkV7Sg6HGUecjZ+RF+YDGmthEQM+FNuUE3Akcr9GrHaslwLuCu2IqskJZNhb4uza/XKgVNd4E2FILNfsNXKvPpULMSS1M7AkSPVpaXGxkwGV+u8Lo9WSX5nL7j7RjjoMC3YECmbgFjjWt22n9qa6PoeGb+tk5tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vLomRqAI/qHAODT6nCaBD9HxpmVBD0+MX48p8EVEZ8=;
 b=CmFVe4DQFweoF1ykPhs0JmDq4A6pAlGJ+0VuBkzAwOmVTTNpT1jhVpzUguI8f0jNdkDB8U2vREo+2Tzxqdu3q5SFEKBT+fqXSdKN78Sm2VYZu03XZd5PCzJnpslv7RonBEwMneEvDthaWWY4cOORuHyM7NG6q15d55FCHS9pQZJvAo50FeLoe3ST1sHHsX9bBgJizCWvN8664O9oj5n/9G6ojD7ijsMFuXW421QeBMSmtlQrAqF5moXXcgIkEP5kz4y4t6CifTJY7h51F0Jgt0pfFRBHDNSGZKqPbq+KRDJdx3CCfRMoNxFccSDEQNA+9WOeYIMgngbXiwLsrTK+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vLomRqAI/qHAODT6nCaBD9HxpmVBD0+MX48p8EVEZ8=;
 b=DqWd/dD6Xs5Zz66A/d82I3oQfjcnaoSvh52qzkW8TekRY68bOxCMeYWUbGYr9f1FhsOmyGXYuqCGduDRqz605LDce8gIXAK8OanPfvXWfG7QbxdODh/nSGCIbBrrfYdq3G4OF+sj5utVGVNvp4BLJgOnKudah867+1VpJvd31FQ=
Received: from VI1PR0702MB3533.eurprd07.prod.outlook.com (52.134.5.25) by
 VI1PR0702MB3840.eurprd07.prod.outlook.com (52.134.7.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.17; Tue, 17 Sep 2019 11:37:35 +0000
Received: from VI1PR0702MB3533.eurprd07.prod.outlook.com
 ([fe80::20c2:5554:cf8d:3d46]) by VI1PR0702MB3533.eurprd07.prod.outlook.com
 ([fe80::20c2:5554:cf8d:3d46%4]) with mapi id 15.20.2284.009; Tue, 17 Sep 2019
 11:37:34 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     Jean Delvare <jdelvare@suse.de>,
        "Xu, Lingyan (NSB - CN/Hangzhou)" <lingyan.xu@nokia-sbell.com>
CC:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Topic: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Index: AQHVYf2CtQ6bNeFFV0qdOS3acGbEtQ==
Date:   Tue, 17 Sep 2019 11:37:34 +0000
Message-ID: <435ec740-dbfd-8c00-2472-35a49d273822@nokia.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
 <20190828155822.7cb13a7b@endymion>
 <a6cd1872effd46c7ba088f28402b32b8@nokia-sbell.com>
 <20190905145716.137e155a@endymion>
In-Reply-To: <20190905145716.137e155a@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.167]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To VI1PR0702MB3533.eurprd07.prod.outlook.com (2603:10a6:803:a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d426d347-c45d-43f1-0b81-08d73b636ec7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR0702MB3840;
x-ms-traffictypediagnostic: VI1PR0702MB3840:
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0702MB38400852D0D58DED6220D36F888F0@VI1PR0702MB3840.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(189003)(199004)(186003)(2616005)(66946007)(229853002)(66446008)(64756008)(66556008)(6486002)(6512007)(6436002)(486006)(6246003)(76176011)(102836004)(26005)(25786009)(386003)(53546011)(4326008)(6506007)(31686004)(52116002)(2906002)(446003)(11346002)(476003)(8936002)(14454004)(99286004)(71200400001)(7736002)(71190400001)(305945005)(316002)(66476007)(31696002)(86362001)(478600001)(36756003)(81166006)(14444005)(256004)(5660300002)(3846002)(54906003)(65806001)(66066001)(58126008)(65956001)(110136005)(6116002)(8676002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0702MB3840;H:VI1PR0702MB3533.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZevXHPjgXvvMQ263JTYRrojcyZj71GrXwEg7ICo8NR5h8j3baQ0ZpQN0mcMNKR4lefUmXzYC3Ope/5oi+8uq0I3FIV9zfZ34+SFyVubNe4PEtLx6S46v4kGp6uspx/SzdAmn7UL6WBIE5uIFw+SlYtwR5CrtfEl2uWmLnkjVqT2M/6EtNARh6fdFJ5h3sl4rtb3QpbjBxyLSp7mpqW3BlaA9XijyeNys5akWozH0+NwawNJDj/k9t/Q36mLvtxN2pPGHqcWTJGBH6+moBz4j+fGo+FoEiH2sMXNkEEtWlHVAiLHddxrstBnJKIQab/Sdz9S9PTFKvFGYhNpoQqfSD03Fm2nx3XhbptG0IjwvihjW/ramkHOySmPMR3/RLDw12JVhQNjPl0JC9Bdes6fJav996oqD1RSBhFRkl4JsQdk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5B35A8687AC5B46A2DD67D59AEDC4BB@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d426d347-c45d-43f1-0b81-08d73b636ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 11:37:34.5483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3nrqAO4NgAYMm1R8TsiPq78U37DFm+x/34oGaj8hk7wXhHP67Ybph1Vf5AE3ShrUjw238L3T25o4+fWB0Xgfy+X3lsSsFyFTD0M9z7WgR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0702MB3840
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gSmVhbiwNCg0KT24gMDUvMDkvMjAxOSAxNDo1NywgSmVhbiBEZWx2YXJlIHdyb3RlOg0K
PiBJZiB0aGlzIGlzIG9mIGFueSB2YWx1ZSB0byB5b3UsIEkgdHJpZWQgaW1wbGVtZW50aW5nIGl0
IGluIGkyYy1pODAxIGENCj4gZmV3IGRheXMgYWdvLiBJIGNhbid0IHJlYWxseSB0ZXN0IGl0IHRo
b3VnaCBhcyBJIGRvbid0IGhhdmUgYW55IGRldmljZQ0KPiB3aGljaCB0cmlnZ2VycyBhbiBhbGVy
dCBvbiBteSBzeXN0ZW0sIGJ1dCBJIGFtIHNoYXJpbmcgaXQgd2l0aCB5b3UgaWYNCj4geW91IHdh
bnQgdG8gZ2l2ZSBpdCBhIHRyeS4gWW91IHdvdWxkIHN0aWxsIG5lZWQgdG8gd3JpdGUgdGhlIGNv
ZGUgaW4NCj4gdGhlIHNsYXZlIGRyaXZlci4NCj4gDQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1pODAxLmMgfCAgIDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQo+IA0KPiAtLS0gbGludXgtNS4yLm9yaWcvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pODAx
LmMJMjAxOS0wOC0yOCAxNTo1ODo1Mi43MjU4MjgyMTUgKzAyMDANCj4gKysrIGxpbnV4LTUuMi9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYwkyMDE5LTA4LTI4IDE2OjUwOjA5LjIxMjY5NjAz
NyArMDIwMA0KPiBAQCAtMTk2LDYgKzE5Niw3IEBADQo+ICANCj4gIC8qIEhvc3QgTm90aWZ5IENv
bW1hbmQgcmVnaXN0ZXIgYml0cyAqLw0KPiAgI2RlZmluZSBTTUJTTFZDTURfSFNUX05URllfSU5U
UkVOCUJJVCgwKQ0KPiArI2RlZmluZSBTTUJTTFZDTURfU01CQUxFUlRfRElTCQlCSVQoMikNCj4g
IA0KPiAgI2RlZmluZSBTVEFUVVNfRVJST1JfRkxBR1MJKFNNQkhTVFNUU19GQUlMRUQgfCBTTUJI
U1RTVFNfQlVTX0VSUiB8IFwNCj4gIAkJCQkgU01CSFNUU1RTX0RFVl9FUlIpDQo+IEBAIC0yODEs
NiArMjgyLDEwIEBAIHN0cnVjdCBpODAxX3ByaXYgew0KPiAgCSAqLw0KPiAgCWJvb2wgYWNwaV9y
ZXNlcnZlZDsNCj4gIAlzdHJ1Y3QgbXV0ZXggYWNwaV9sb2NrOw0KPiArDQo+ICsJLyogU01CdXMg
YWxlcnQgKi8NCj4gKwlzdHJ1Y3QgaTJjX3NtYnVzX2FsZXJ0X3NldHVwIGFsZXJ0X2RhdGE7DQo+
ICsJc3RydWN0IGkyY19jbGllbnQgKmFyYTsNCj4gIH07DQo+ICANCj4gICNkZWZpbmUgRkVBVFVS
RV9TTUJVU19QRUMJQklUKDApDQo+IEBAIC0yODksNiArMjk0LDcgQEAgc3RydWN0IGk4MDFfcHJp
diB7DQo+ICAjZGVmaW5lIEZFQVRVUkVfSTJDX0JMT0NLX1JFQUQJQklUKDMpDQo+ICAjZGVmaW5l
IEZFQVRVUkVfSVJRCQlCSVQoNCkNCj4gICNkZWZpbmUgRkVBVFVSRV9IT1NUX05PVElGWQlCSVQo
NSkNCj4gKyNkZWZpbmUgRkVBVFVSRV9TTUJVU19BTEVSVAlCSVQoNikNCj4gIC8qIE5vdCByZWFs
bHkgYSBmZWF0dXJlLCBidXQgaXQncyBjb252ZW5pZW50IHRvIGhhbmRsZSBpdCBhcyBzdWNoICov
DQo+ICAjZGVmaW5lIEZFQVRVUkVfSURGCQlCSVQoMTUpDQo+ICAjZGVmaW5lIEZFQVRVUkVfVENP
X1NQVAkJQklUKDE2KQ0KPiBAQCAtMzAxLDYgKzMwNyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpp
ODAxX2ZlYXR1cmVfbmFtZXNbXQ0KPiAgCSJJMkMgYmxvY2sgcmVhZCIsDQo+ICAJIkludGVycnVw
dCIsDQo+ICAJIlNNQnVzIEhvc3QgTm90aWZ5IiwNCj4gKwkiU01CdXMgQWxlcnQiLA0KPiAgfTsN
Cj4gIA0KPiAgc3RhdGljIHVuc2lnbmVkIGludCBkaXNhYmxlX2ZlYXR1cmVzOw0KPiBAQCAtMzEw
LDcgKzMxNyw4IEBAIE1PRFVMRV9QQVJNX0RFU0MoZGlzYWJsZV9mZWF0dXJlcywgIkRpc2ENCj4g
IAkiXHRcdCAgMHgwMiAgZGlzYWJsZSB0aGUgYmxvY2sgYnVmZmVyXG4iDQo+ICAJIlx0XHQgIDB4
MDggIGRpc2FibGUgdGhlIEkyQyBibG9jayByZWFkIGZ1bmN0aW9uYWxpdHlcbiINCj4gIAkiXHRc
dCAgMHgxMCAgZG9uJ3QgdXNlIGludGVycnVwdHNcbiINCj4gLQkiXHRcdCAgMHgyMCAgZGlzYWJs
ZSBTTUJ1cyBIb3N0IE5vdGlmeSAiKTsNCj4gKwkiXHRcdCAgMHgyMCAgZGlzYWJsZSBTTUJ1cyBI
b3N0IE5vdGlmeVxuIg0KPiArCSJcdFx0ICAweDQwICBkaXNhYmxlIFNNQnVzIEFsZXJ0ICIpOw0K
PiAgDQo+ICAvKiBNYWtlIHN1cmUgdGhlIFNNQnVzIGhvc3QgaXMgcmVhZHkgdG8gc3RhcnQgdHJh
bnNtaXR0aW5nLg0KPiAgICAgUmV0dXJuIDAgaWYgaXQgaXMsIC1FQlVTWSBpZiBpdCBpcyBub3Qu
ICovDQo+IEBAIC02MjAsOCArNjI4LDI0IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpODAxX2hvc3Rf
bm90aWZ5X2lzcigNCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQo+ICANCj4gK3N0YXRp
YyBpcnFyZXR1cm5fdCBpODAxX3NtYnVzX2FsZXJ0X2lzcihzdHJ1Y3QgaTgwMV9wcml2ICpwcml2
KQ0KPiArew0KPiArCXN0cnVjdCBpMmNfY2xpZW50ICphcmEgPSBwcml2LT5hcmE7DQo+ICsNCj4g
KwlpZiAoYXJhKSB7DQo+ICsJCWRldl9kYmcoJmFyYS0+ZGV2LCAiU01CdXMgYWxlcnQgcmVjZWl2
ZWRcbiIpOw0KPiArCQlpMmNfaGFuZGxlX3NtYnVzX2FsZXJ0KGFyYSk7DQoNCkkndmUganVzdCB0
ZXN0ZWQgdGhpcyBhcHByb2FjaCBhbmQgbXVzdCBjb25jbHVkZSB0aGF0IGl0IGRvZXNuJ3Qgd29y
ay4NClNlZW1zIHRoYXQgU01CQUxFUlQjIGluIGk4MDEgaXMgbGV2ZWwtdHJpZ2dlcmVkIChJIHdh
c24ndCBhYmxlIHRvDQpjb25maXJtIG9yIGRlY2xpbmUgdGhpcyBzdGF0ZW1lbnQgdXNpbmcgaTgw
MSBkb2N1bWVudGF0aW9uKSBhbmQNCm9uY2UgU01CQUxFUlQjIGlzIHRyaWdnZXJlZCwgSSBleHBl
cmllbmNlIHRoZSBpbnRlcnJ1cHQgZmxvb2QuDQpDbGVhcmluZyB0aGUgaW50ZXJydXB0IHJlcXVl
c3QgYml0IGJlbG93IGhhcyBubyBlZmZlY3QgYXQgdGhpcyBwb2ludC4NCg0KVW5mb3J0dW5hdGVs
eSwgY3VycmVudCBzbWJhbGVydCBBUEkgZG9lc24ndCBwcm92aWRlIGFueSBzeW5jaHJvbm91cw0K
aW50ZXJmYWNlIHRvIHRlc3QgYW5vdGhlciBhcHByb2FjaC4NCg0KPiArCX0gZWxzZQ0KPiArCQlk
ZXZfZGJnKCZwcml2LT5hZGFwdGVyLmRldiwNCj4gKwkJCSJTTUJ1cyBhbGVydCByZWNlaXZlZCBi
dXQgbm8gQVJBIGNsaWVudCFcbiIpOw0KPiArDQo+ICsJLyogY2xlYXIgU01CdXMgQWxlcnQgYml0
IGFuZCByZXR1cm4gKi8NCj4gKwlvdXRiX3AoU01CSFNUU1RTX1NNQkFMRVJUX1NUUywgU01CSFNU
U1RTKHByaXYpKTsNCj4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICt9DQo+ICsNCj4gIC8qDQo+
IC0gKiBUaGVyZSBhcmUgdGhyZWUga2luZHMgb2YgaW50ZXJydXB0czoNCj4gKyAqIFRoZXJlIGFy
ZSBmb3VyIGtpbmRzIG9mIGludGVycnVwdHM6DQo+ICAgKg0KPiAgICogMSkgaTgwMSBzaWduYWxz
IHRyYW5zYWN0aW9uIGNvbXBsZXRpb24gd2l0aCBvbmUgb2YgdGhlc2UgaW50ZXJydXB0czoNCj4g
ICAqICAgICAgSU5UUiAtIFN1Y2Nlc3MNCg0KVGhlcmVmb3JlLCBJJ2QgbGlrZSB0byBhc2sgeW91
IChhbmQgb3RoZXIgSTJDIG1haW50YWluZXJzKSwgbm90IHRoYXQNCkkgc3BlbmQgYSB0aW1lIGZv
ciBhIHNvbHV0aW9uIHdoaWNoIGhhcyBubyB1cHN0cmVhbSBwZXJzcGVjdGl2ZXMsIHdoYXQNCnNo
YWxsIGJlIHRoZSBwcmVmZXJyZWQgd2F5IGZvciBpODAxIGRyaXZlcjoNCg0KYSkgV2UgZGlzYWJs
ZSBTTUJBTEVSVCMgY29tcGxldGVseQ0KDQpvcg0KDQpiKSBJIGV4cG9ydCBzbWJ1c19hbGVydCgp
LCBzbyB0aGF0IHdlIGNhbg0KCS0gY2F0Y2ggdGhlIElSUQ0KCS0gZGlzYWJsZSBTTUJBTEVSVCMN
CgktIHN5bmNocm9ub3VzbHkgc21idXNfYWxlcnQoKQ0KCS0gcmUtZW5hYmxlIFNNQkFMRVJUIw0K
DQo/DQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K
