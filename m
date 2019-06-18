Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D607F49DA3
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 11:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbfFRJl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 05:41:59 -0400
Received: from mail-eopbgr60092.outbound.protection.outlook.com ([40.107.6.92]:6212
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729230AbfFRJl7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jun 2019 05:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pMqrB5fVYDhb/YWgmeP5oY77sPjNL7kwx+zrcLKPBM=;
 b=NLbvbMl1UocPvvGyPnFEdCk6Weyn33bBxKYOMf0rrogiGihgDVzQ3Wdrmd4wfkzRAS7ym/ZaA0tq1jEoZKfAkrIRF0fXGLLQabu24kKxXUKlo22N5IjEM7x66pv1P+9X/StNlVJJFuLKsZfkZr3JuIBMyQQ2t9IvS/pAmXLA4sU=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3433.eurprd02.prod.outlook.com (52.134.70.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Tue, 18 Jun 2019 09:41:56 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 09:41:56 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
Thread-Topic: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
Thread-Index: AQHVJbHVWO9y/73B8UiOGSY2zxmHNqahKLkA
Date:   Tue, 18 Jun 2019 09:41:55 +0000
Message-ID: <d911ad6c-477f-7946-c0c4-ac7e86d15ceb@axentia.se>
References: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
In-Reply-To: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0701CA0076.eurprd07.prod.outlook.com
 (2603:10a6:3:64::20) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 611f5c99-c4bd-43cb-7fed-08d6f3d13370
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3433;
x-ms-traffictypediagnostic: DB3PR0202MB3433:
x-microsoft-antispam-prvs: <DB3PR0202MB343301A2B90751B77361976EBCEA0@DB3PR0202MB3433.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(346002)(136003)(376002)(396003)(366004)(189003)(199004)(52314003)(26005)(7416002)(54906003)(6246003)(25786009)(110136005)(186003)(74482002)(229853002)(8676002)(71190400001)(71200400001)(6486002)(58126008)(81166006)(81156014)(31686004)(65956001)(65806001)(66066001)(2616005)(476003)(14454004)(11346002)(446003)(316002)(68736007)(64126003)(5660300002)(8936002)(2501003)(4326008)(65826007)(7736002)(486006)(76176011)(52116002)(6512007)(2906002)(102836004)(14444005)(386003)(6506007)(86362001)(66476007)(66556008)(64756008)(73956011)(66946007)(31696002)(53546011)(6116002)(3846002)(6436002)(305945005)(99286004)(508600001)(256004)(2201001)(36756003)(53936002)(66446008)(70780200001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3433;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dJvpmGcvPjK/Ln/PioNoN+0EjENJCp7HwvDS7xbpRlJekqDgHe4//Gi/exrsV79ZqUqZs5KHJadhdqXG59efz029ApPL1y8nHxlZcbKb/IU7LPhVUxw4Af3HYJi6m6qJajx08C5/rq83iIBLWLZMYwdK/14BlY6ML024Y8gRBEok2MDnlbBNvM1T7j29YxESpjT2BXvwp76b6Yw48hh0IOuFHDMA4m6WUgr2MzVGKdisM58B3XR1enHd/SDVxy2EKwFOeC1/brVCYlE8yTAKQW/2ROqFFrquCdrjKmhgxT0CsPiI1bPWDSHKiBsvQHXfuKnBiveNtAd0WRLvlxzM9nbkIa5je4oiyghl6ksaYOpCDq5Xy/wuImUC9hDqqC6aqn3Xj2SUHJf+rWLrtEPzYbsY91W5MI/O9ERY2yqFrYA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27E9B971228C324985661CDD2D33B01C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 611f5c99-c4bd-43cb-7fed-08d6f3d13370
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 09:41:56.0216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3433
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0xOCAxMDo0MiwgQml0YW4gQmlzd2FzIHdyb3RlOg0KPiB0ZWdyYV9pMmNfeGZl
cl9tc2cgaW5pdGlhdGVzIHRoZSBJMkMgdHJhbnNmZXIgaW4gRE1BDQo+IG9yIFBJTyBtb2RlLiBJ
dCBpbnZvbHZlcyBzdGVwcyB0aGF0IG5lZWQgRklGTyByZWdpc3Rlcg0KPiBhY2Nlc3MsIERNQSBB
UEkgY2FsbHMgbGlrZSBkbWFfc3luY19zaW5nbGVfZm9yX2RldmljZSwgZXRjLg0KPiBUZWdyYSBJ
MkMgSVNSIGhhcyBjYWxscyB0byB0ZWdyYV9pMmNfZW1wdHlfcnhfZmlmbyBpbiBQSU8gbW9kZQ0K
PiBhbmQgaW4gRE1BL1BJTyBtb2RlIHdyaXRlcyBkaWZmZXJlbnQgSTJDIHJlZ2lzdGVycyBpbmNs
dWRpbmcNCj4gSTJDIGludGVycnVwdCBzdGF0dXMuIElTUiBjYW5ub3Qgc3RhcnQgcHJvY2Vzc2lu
Zw0KPiBiZWZvcmUgdGhlIHByZXBhcmF0aW9uIHN0ZXAgYXQgdGVncmFfaTJjX3hmZXJfbXNnIGlz
IGNvbXBsZXRlLg0KPiBIZW5jZSwgYSBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiBJU1IgYW5kIHRl
Z3JhX2kyY194ZmVyX21zZw0KPiBpcyBpbiBwbGFjZSB0b2RheSB1c2luZyBzcGlubG9jay4NCj4g
DQo+IFNwaW5sb2NrIGJ1c3kgd2FpdHMgYW5kIGNhbiBhZGQgYXZvaWRhYmxlIGRlbGF5cy4NCj4g
DQo+IEluIHRoaXMgcGF0Y2ggbmVlZGVkIHN5bmNocm9uaXphdGlvbiBpcyBhY2hpZXZlZCBieSBk
aXNhYmxpbmcNCj4gSTJDIGludGVycnVwdCBkdXJpbmcgcHJlcGFyYXRpb24gc3RlcCBhbmQgZW5h
YmxpbmcgaW50ZXJydXB0DQo+IG9uY2UgcHJlcGFyYXRpb24gaXMgb3ZlciBhbmQgc3BpbmxvY2sg
aXMgbm8gbG9uZ2VyIG5lZWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJpdGFuIEJpc3dhcyA8
YmJpc3dhc0BudmlkaWEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVn
cmEuYyB8IDE3ICsrKysrKysrLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtdGVncmEuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiBpbmRl
eCA2ZmI1NDVlLi5jY2M3ZmFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXRlZ3JhLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQo+IEBAIC0y
NDAsNyArMjQwLDYgQEAgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHsNCj4gICAqIEBidXNf
Y2xrX3JhdGU6IGN1cnJlbnQgSTJDIGJ1cyBjbG9jayByYXRlDQo+ICAgKiBAY2xrX2Rpdmlzb3Jf
bm9uX2hzX21vZGU6IGNsb2NrIGRpdmlkZXIgZm9yIG5vbi1oaWdoLXNwZWVkIG1vZGVzDQo+ICAg
KiBAaXNfbXVsdGltYXN0ZXJfbW9kZTogdHJhY2sgaWYgSTJDIGNvbnRyb2xsZXIgaXMgaW4gbXVs
dGktbWFzdGVyIG1vZGUNCj4gLSAqIEB4ZmVyX2xvY2s6IGxvY2sgdG8gc2VyaWFsaXplIHRyYW5z
ZmVyIHN1Ym1pc3Npb24gYW5kIHByb2Nlc3NpbmcNCj4gICAqIEB0eF9kbWFfY2hhbjogRE1BIHRy
YW5zbWl0IGNoYW5uZWwNCj4gICAqIEByeF9kbWFfY2hhbjogRE1BIHJlY2VpdmUgY2hhbm5lbA0K
PiAgICogQGRtYV9waHlzOiBoYW5kbGUgdG8gRE1BIHJlc291cmNlcw0KPiBAQCAtMjcwLDggKzI2
OSw2IEBAIHN0cnVjdCB0ZWdyYV9pMmNfZGV2IHsNCj4gIAl1MzIgYnVzX2Nsa19yYXRlOw0KPiAg
CXUxNiBjbGtfZGl2aXNvcl9ub25faHNfbW9kZTsNCj4gIAlib29sIGlzX211bHRpbWFzdGVyX21v
ZGU7DQo+IC0JLyogeGZlcl9sb2NrOiBsb2NrIHRvIHNlcmlhbGl6ZSB0cmFuc2ZlciBzdWJtaXNz
aW9uIGFuZCBwcm9jZXNzaW5nICovDQo+IC0Jc3BpbmxvY2tfdCB4ZmVyX2xvY2s7DQo+ICAJc3Ry
dWN0IGRtYV9jaGFuICp0eF9kbWFfY2hhbjsNCj4gIAlzdHJ1Y3QgZG1hX2NoYW4gKnJ4X2RtYV9j
aGFuOw0KPiAgCWRtYV9hZGRyX3QgZG1hX3BoeXM7DQo+IEBAIC04MzUsNyArODMyLDYgQEAgc3Rh
dGljIGlycXJldHVybl90IHRlZ3JhX2kyY19pc3IoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAg
DQo+ICAJc3RhdHVzID0gaTJjX3JlYWRsKGkyY19kZXYsIEkyQ19JTlRfU1RBVFVTKTsNCj4gIA0K
PiAtCXNwaW5fbG9jaygmaTJjX2Rldi0+eGZlcl9sb2NrKTsNCj4gIAlpZiAoc3RhdHVzID09IDAp
IHsNCj4gIAkJZGV2X3dhcm4oaTJjX2Rldi0+ZGV2LCAiaXJxIHN0YXR1cyAwICUwOHggJTA4eCAl
MDh4XG4iLA0KPiAgCQkJIGkyY19yZWFkbChpMmNfZGV2LCBJMkNfUEFDS0VUX1RSQU5TRkVSX1NU
QVRVUyksDQo+IEBAIC05MzUsNyArOTMxLDYgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2ky
Y19pc3IoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgDQo+ICAJY29tcGxldGUoJmkyY19kZXYt
Pm1zZ19jb21wbGV0ZSk7DQo+ICBkb25lOg0KPiAtCXNwaW5fdW5sb2NrKCZpMmNfZGV2LT54ZmVy
X2xvY2spOw0KPiAgCXJldHVybiBJUlFfSEFORExFRDsNCj4gIH0NCj4gIA0KPiBAQCAtMTA1NCw3
ICsxMDQ5LDYgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfeGZlcl9tc2coc3RydWN0IHRlZ3JhX2ky
Y19kZXYgKmkyY19kZXYsDQo+ICAJdTMyIHBhY2tldF9oZWFkZXI7DQo+ICAJdTMyIGludF9tYXNr
Ow0KPiAgCXVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Ow0KPiAtCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
DQo+ICAJc2l6ZV90IHhmZXJfc2l6ZTsNCj4gIAl1MzIgKmJ1ZmZlciA9IE5VTEw7DQo+ICAJaW50
IGVyciA9IDA7DQo+IEBAIC0xMDg1LDcgKzEwNzksMTAgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNf
eGZlcl9tc2coc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYsDQo+ICAJICovDQo+ICAJeGZl
cl90aW1lICs9IERJVl9ST1VORF9DTE9TRVNUKCgoeGZlcl9zaXplICogOSkgKyAyKSAqIE1TRUNf
UEVSX1NFQywNCj4gIAkJCQkJaTJjX2Rldi0+YnVzX2Nsa19yYXRlKTsNCj4gLQlzcGluX2xvY2tf
aXJxc2F2ZSgmaTJjX2Rldi0+eGZlcl9sb2NrLCBmbGFncyk7DQo+ICsJaWYgKCFpMmNfZGV2LT5p
cnFfZGlzYWJsZWQpIHsNCj4gKwkJZGlzYWJsZV9pcnFfbm9zeW5jKGkyY19kZXYtPmlycSk7DQoN
CldoeSBkbyB5b3UgdXNlIC4uLl9ub3N5bmMgaW4gdGhpcyBjb250ZXh0PyBEbyB5b3Ugbm90IGNh
cmUgYWJvdXQgZXhhY3RseSB3aGVuDQp0aGUgaXJxIGlzIGFjdHVhbGx5IGRpc2FibGVkPyBNYXli
ZSB5b3UgbXVzdCB1c2UgX25vc3luYywgSSBkb24ndCBrbm93LCBidXQgSQ0KZ2V0IHRoZSBmZWVs
aW5nIHRoYXQgeW91IGp1c3QgY29waWVkIHRoZSBjb2RlIGZyb20gdGhlIElTUi4gQW55d2F5LCB0
aGUNCnF1ZXN0aW9uIGlzIGlmIHRoaXMgaXMgc3RpbGwgYWRlcXVhdGUgc3luY2hyb25pemF0aW9u
PyBFdmVyeXRoaW5nIG1pZ2h0IHZlcnkNCndlbGwgYmUgc2FmZSBhbmQgaW4gb3JkZXIsIGJ1dCB0
aGlzIGlzIG5vdCBjbGVhciB0byBtZSBmcm9tIG5laXRoZXIgdGhlIGNvZGUsDQp0aGUgKG5vbmV4
aXN0aW5nKSBjb21tZW50cyBub3IgdGhlIHBhdGNoIGRlc2NyaXB0aW9uLg0KDQpJJ20gbm8gSVJR
IGV4cGVydCwgSSdtIGp1c3QgYXNraW5nIHF1ZXN0aW9ucy4uLg0KDQpDaGVlcnMsDQpQZXRlcg0K
DQo+ICsJCWkyY19kZXYtPmlycV9kaXNhYmxlZCA9IHRydWU7DQo+ICsJfQ0KPiAgDQo+ICAJaW50
X21hc2sgPSBJMkNfSU5UX05PX0FDSyB8IEkyQ19JTlRfQVJCSVRSQVRJT05fTE9TVDsNCj4gIAl0
ZWdyYV9pMmNfdW5tYXNrX2lycShpMmNfZGV2LCBpbnRfbWFzayk7DQo+IEBAIC0xMTgwLDcgKzEx
NzcsMTAgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfeGZlcl9tc2coc3RydWN0IHRlZ3JhX2kyY19k
ZXYgKmkyY19kZXYsDQo+ICAJCWkyY19yZWFkbChpMmNfZGV2LCBJMkNfSU5UX01BU0spKTsNCj4g
IA0KPiAgdW5sb2NrOg0KPiAtCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmkyY19kZXYtPnhmZXJf
bG9jaywgZmxhZ3MpOw0KPiArCWlmIChpMmNfZGV2LT5pcnFfZGlzYWJsZWQpIHsNCj4gKwkJaTJj
X2Rldi0+aXJxX2Rpc2FibGVkID0gZmFsc2U7DQo+ICsJCWVuYWJsZV9pcnEoaTJjX2Rldi0+aXJx
KTsNCj4gKwl9DQo+ICANCj4gIAlpZiAoZG1hKSB7DQo+ICAJCWlmIChlcnIpDQo+IEBAIC0xNTc2
LDcgKzE1NzYsNiBAQCBzdGF0aWMgaW50IHRlZ3JhX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCQkJCUkyQ19QQUNLRVRfSEVBREVSX1NJWkU7DQo+ICAJaW5pdF9j
b21wbGV0aW9uKCZpMmNfZGV2LT5tc2dfY29tcGxldGUpOw0KPiAgCWluaXRfY29tcGxldGlvbigm
aTJjX2Rldi0+ZG1hX2NvbXBsZXRlKTsNCj4gLQlzcGluX2xvY2tfaW5pdCgmaTJjX2Rldi0+eGZl
cl9sb2NrKTsNCj4gIA0KPiAgCWlmICghaTJjX2Rldi0+aHctPmhhc19zaW5nbGVfY2xrX3NvdXJj
ZSkgew0KPiAgCQlmYXN0X2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiZmFzdC1jbGsi
KTsNCj4gDQoNCg==
