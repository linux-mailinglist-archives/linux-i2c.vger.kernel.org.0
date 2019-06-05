Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2969D3585A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 10:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfFEIPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 04:15:43 -0400
Received: from mail-eopbgr20136.outbound.protection.outlook.com ([40.107.2.136]:55257
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725294AbfFEIPn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 04:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESgDuCWs4w+yAULnW2/Ul5b4H1z34ea8nH/6QaJLlpY=;
 b=inAGze3HGbOMNJs8W3IrGEL0wqd5Crsx0qfEgsRLYB4Z838ekTrncxX92BQ4W0RwZzmD8yYi+TxiA6EnaqLKKwCiDsXXhmgdFZ6BKrOBHU2ymAeSPlZYf2svVxbB6f+CU845MS4iAse+ZLsYn4NETm+9Qs8brhrAIWFZWyEPCF0=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3402.eurprd02.prod.outlook.com (52.134.67.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 08:15:36 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 08:15:35 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v3] i2c: mux/i801: Switch to use descriptor passing
Thread-Topic: [PATCH v3] i2c: mux/i801: Switch to use descriptor passing
Thread-Index: AQHVGljf8OS73cKHtkS/pUc9RQiNFKaMH4uA///5koCAAJ/hAA==
Date:   Wed, 5 Jun 2019 08:15:35 +0000
Message-ID: <ee06c942-ad3d-b45b-f067-bbc988595733@axentia.se>
References: <20190603220819.31701-1-linus.walleij@linaro.org>
 <e992bb50-cedc-74c0-cecd-8cac37ecaf69@axentia.se>
 <20190604224316.slrrlinhzngdan5o@mobilestation>
In-Reply-To: <20190604224316.slrrlinhzngdan5o@mobilestation>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR07CA0042.eurprd07.prod.outlook.com
 (2603:10a6:7:66::28) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9096f228-fc18-413f-bf53-08d6e98dfc6c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3402;
x-ms-traffictypediagnostic: DB3PR0202MB3402:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0202MB340260FEA66C38BFC1F4E0A6BC160@DB3PR0202MB3402.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(366004)(39840400004)(396003)(346002)(189003)(199004)(54534003)(966005)(14454004)(2906002)(486006)(508600001)(316002)(6486002)(229853002)(86362001)(64126003)(31696002)(14444005)(256004)(5660300002)(74482002)(36756003)(6116002)(3846002)(52116002)(65806001)(65956001)(66066001)(8936002)(25786009)(2616005)(58126008)(81166006)(81156014)(8676002)(68736007)(54906003)(446003)(76176011)(6246003)(6916009)(11346002)(4326008)(102836004)(53936002)(99286004)(65826007)(31686004)(386003)(6506007)(53546011)(305945005)(73956011)(66946007)(66476007)(66556008)(64756008)(66446008)(6306002)(6512007)(7736002)(26005)(476003)(186003)(6436002)(71200400001)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3402;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a9PubqD+sVPxXPTa3q2YW3nIr6o7QfOn+IipvuvX+0Ij3X7crKLKmvHNf0CivCoCy6KcpsZz0y3btpjQ3zUJe8HLj4PTWJFRdUIUHxXN54fnfknLxw4nEq7MdQ8Biph1SzNRe8VD60G0NblmatgK7N8vjkVb9rNleyFas7puugcS4XZ2JRbWxvf4k658Ei9/C0Kx3UsAL5homX+RcP/OVdog5Sj7aDpf25f81/CsFvGxgRcJvxkU9X2nJWtxZ2BeiMwYqfAFlZOGv/uH5nkGscLC7q2gYI4Ys3gk7tP2WV5L+8eYXfdhHxsAn4YnGFdsFFwJV3Ajmk9fZMTG+H/MSi8PhofNzavlZNId7iWbXlZ33odmJmYiUAzqdBD/hBB6nQyzRQRWa1DeW/WlkPbwZzNHTtn0MvGMLkQnQ4ad6HM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BC03F3E755B084A81511080395AB806@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9096f228-fc18-413f-bf53-08d6e98dfc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 08:15:35.6738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3402
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0wNSAwMDo0MywgU2VyZ2UgU2VtaW4gd3JvdGU6DQo+IEhlbGxvIFBldGVyDQo+
IA0KPiBPbiBUdWUsIEp1biAwNCwgMjAxOSBhdCAwOTowNjoyMlBNICswMDAwLCBQZXRlciBSb3Np
biB3cm90ZToNCj4+IE9uIDIwMTktMDYtMDQgMDA6MDgsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+
Pj4gVGhpcyBzd2l0Y2hlcyB0aGUgaTgwMSBHUElPIG11eCB0byB1c2UgR1BJTyBkZXNjcmlwdG9y
cyBmb3INCj4+PiBoYW5kbGluZyB0aGUgR1BJTyBsaW5lcy4gVGhlIHByZXZpb3VzIGhhY2sgd2hp
Y2ggd2FzIHJlYWNoaW5nDQo+Pj4gaW5zaWRlIHRoZSBHUElPIGNoaXBzIGV0YyBjYW5ub3QgbGl2
ZSBvbi4gV2UgcGFzcyBkZXNjcmlwdG9ycw0KPj4+IGFsb25nIHdpdGggdGhlIEdQSU8gbXV4IGRl
dmljZSBhdCBjcmVhdGlvbiBpbnN0ZWFkLg0KPj4+DQo+Pj4gVGhlIEdQSU8gbXV4IHdhcyBvbmx5
IHVzZWQgYnkgd2F5IG9mIHBsYXRmb3JtIGRhdGEgd2l0aCBhDQo+Pj4gcGxhdGZvcm0gZGV2aWNl
IGZyb20gb25lIHBsYWNlIGluIHRoZSBrZXJuZWw6IHRoZSBpODAxIGkyYyBidXMNCj4+PiBkcml2
ZXIuIExldCdzIGp1c3QgYXNzb2NpYXRlIHRoZSBHUElPIGRlc2NyaXB0b3IgdGFibGUgd2l0aA0K
Pj4+IHRoZSBhY3R1YWwgZGV2aWNlIGxpa2UgZXZlcnlvbmUgZWxzZSBhbmQgZHluYW1pY2FsbHkg
Y3JlYXRlDQo+Pj4gYSBkZXNjcmlwdG9yIHRhYmxlIHBhc3NlZCBhbG9uZyB3aXRoIHRoZSBHUElP
IGkyYyBtdXguDQo+Pj4NCj4+PiBUaGlzIGVuYWJsZXMgc2ltcGxpZmljYXRpb24gb2YgdGhlIEdQ
SU8gaTJjIG11eCBkcml2ZXIgdG8NCj4+PiB1c2Ugb25seSB0aGUgZGVzY3JpcHRvciBBUEkgYW5k
IHRoZSBPRiBwcm9iZSBwYXRoIGdldHMNCj4+PiBzaW1wbGlmaWVkIGluIHRoZSBwcm9jZXNzLg0K
Pj4+DQo+Pj4gVGhlIGk4MDEgZHJpdmVyIHdhcyByZWdpc3RlcmluZyB0aGUgR1BJTyBpMmMgbXV4
IHdpdGgNCj4+PiBQTEFURk9STV9ERVZJRF9BVVRPIHdoaWNoIHdvdWxkIG1ha2UgaXQgaGFyZCB0
byBwcmVkaWN0IHRoZQ0KPj4+IGRldmljZSBuYW1lIGFuZCBhc3NpZ24gdGhlIGRlc2NyaXB0b3Ig
dGFibGUgcHJvcGVybHksIGJ1dA0KPj4+IHRoaXMgc2VlbXMgdG8gYmUgYSBtaXN0YWtlIHRvIGJl
Z2luIHdpdGg6IGFsbCBvZiB0aGUNCj4+PiBHUElPIG11eCBkZXZpY2VzIGFyZSBoYXJkY29kZWQg
dG8gbG9vayB1cCBHUElPIGxpbmVzIGZyb20NCj4+PiB0aGUgImdwaW9faWNoIiBHUElPIGNoaXAu
IElmIHRoZXJlIGFyZSBtb3JlIHRoYW4gb25lIG11eCwNCj4+PiB0aGVyZSBpcyBjZXJ0YWlubHkg
bW9yZSB0aGFuIG9uZSBncGlvIGNoaXAgYXMgd2VsbCwgYW5kDQo+Pj4gdGhlbiB3ZSBoYXZlIG1v
cmUgc2VyaW91cyBwcm9ibGVtcy4gU3dpdGNoIHRvDQo+Pj4gUExBVEZPUk1fREVWSURfTk9ORSBp
bnN0ZWFkLiBUaGVyZSBjYW4gYmUgb25seSBvbmUuDQo+Pj4NCj4+PiBDYzogTWlrYSBXZXN0ZXJi
ZXJnIDxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tPg0KPj4+IENjOiBBbmR5IFNoZXZj
aGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4+PiBDYzogUGV0ZXIg
Um9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4+PiBDYzogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBz
dXNlLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+DQo+Pj4gLS0tDQo+Pj4gQ2hhbmdlTG9nIHYyLT52MzoNCj4+PiAtIFJlb3Jk
ZXIgdmFyaWFibGUgZGVjbGFyYXRpb25zIHRvIGludmVyc2UgY2hyaXN0bWFzIHRyZWUuDQo+Pj4g
LSBTdGFzaCBhd2F5IEdQSU8gbG9va3VwIHRhYmxlIHJlZmVyZW5jZSBhbmQgbWFrZSBzdXJlIHRv
DQo+Pj4gICByZW1vdmUgaXQgb24gZGVsZXRpb24gYW5kIG9uIGVycm9yIHBhdGguDQo+Pj4gLSBJ
bnNlcnQgc29tZSBuYXN0eSBGSVhNRSBjb21tZW50cyBhYm91dCBwb2tpbmcgYXJvdW5kDQo+Pj4g
ICBpbiBncGlvbGliIGludGVybmFscy4NCj4+PiBDaGFuZ2VMb2cgdjEtPnYyOg0KPj4+IC0gRm91
bmQgc29tZSB1bnVzZWQgdmFycyB3aGVuIGNvbXBpbGluZyBmb3IgRFQsIG1lYSBjdWxwYS4NCj4+
Pg0KPj4+IEZvbGtzLCB5b3Ugc3VyZWx5IHNlZSB3aGF0IEkgYW0gdHJ5aW5nIHRvIGRvLiBXb3Vs
ZA0KPj4+IGFwcHJlY2lhdGUgaGVscCBmaXhpbmcgYW55IGJ1Z3MgKGl0IGNvbXBpbGVzKS4NCj4+
DQo+PiBCZWZvcmUgSSBkaXZlIGluLCBob3cgZG9lcyB0aGlzIGNvbXBhcmUgdG8gd2hhdCBTZXJn
ZSBTZW1pbg0KPj4gaXMgZG9pbmcNCj4+DQo+PiAJaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9jb3Zlci8xMDkxMTE5Lw0KPj4NCj4+IEFueSBjaGFuY2Ugb2Ygc29tZSBjb29wZXJhdGlvbj8g
VGhlIHdvcmsgc2VlbSByZWxhdGVkIGF0DQo+PiBmaXJzdCBnbGFuY2UuDQo+Pg0KPj4gW0knbSBx
dW90aW5nIHRoZSB3aG9sZSBtZXNzYWdlIGZvciBzb21lIGNvbnRleHQgZm9yIFNlcmdlLl0NCj4+
DQo+PiBDaGVlcnMsDQo+PiBQZXRlcg0KPj4NCj4gDQo+IFllcywgb3VyIHdvcmtzIGhhdmUgc29t
ZXRoaW5nIGluIGNvbW1vbiwgYnV0IEkgd291bGQgYXBwcmVjaWF0ZSBpZiB5b3UNCj4gcmV2aWV3
ZWQvYWNjZXB0ZWQgbXkgcGF0Y2hzZXQgZmlyc3QgZm9yIHNldmVyYWwgcmVhc29uczoNCg0KSSBh
c2tlZCBmb3IgY29vcGVyYXRpb24uIENhbGxpbmcgb3V0ICJtZSBmaXJzdCIgaXMganVzdCBub3Qg
aXQuDQoNCj4gMS4gSXQgaGFkIGJlZW4gc3VibWl0dGVkIGFuZCBvbmUgbW9yZSB0aW1lIHVwZGF0
ZWQgbG9uZyB0aW1lIGFnby4gRXZlbiBiZWZvcmUgdGhlDQo+IHJlY2VudCBtZXJnZSB3aW5kb3cg
aGFkIGJlZW4gb3BlbmVkLCBzaW5jZSB0aGVuIEkgaGF2ZW4ndCBnb3QgYW55IGNvbW1lbnRzDQo+
IGFuZCB5b3Ugc2FpZCB5b3UgZ2V0IHRvIGl0IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cgaXMgY2xv
c2VkLg0KDQpZb3VyIHNlcmllcyB3YXMgdG9vIGxhdGUgZm9yIHRoZSA1LjIgbWVyZ2Ugd2luZG93
IChpdCB3YXMgc2VudCBhIHdlZWsgb3INCnR3byBiZWZvcmUgaXQgb3BlbmVkLCBhbmQgSSBoYWQg
bm8gdGltZSB0byBydXNoIGl0KS4gRW5kIHJlc3VsdCwgSQ0Kbm93IGhhdmUgdHdvICJjb21wZXRp
bmciIHBpZWNlcyBvZiB3b3JrIGZvciB0aGUgNS4zIG1lcmdlIHdpbmRvdy4gV2hpY2gNCm9mIHRo
ZXNlIHdvcmtzIHdhcyBzZW50IGZpcnN0IGhhcyBsaXR0bGUgYmVhcmluZyBvbiBteSBvcmRlcmlu
ZyBpc3N1ZXMuDQpJIHlvdSBndXlzIGRvbid0IHNvcnQgdGhpcyBvdXQsIEkgd2lsbCBnbyB3aGlj
aGV2ZXIgd2F5IEkgZmluZCBtb3JlDQpwbGVhc2luZy4NCg0KPiAyLiBNeSBwYXRjaHNldCBzcGxp
dHMgcGxhdGZvcm1fZGF0YS1iYXNlZCBhbmQgT0YtYmFzZWQgY29kZSB1cCwgd2hpY2ggaW1wcm92
ZXMgdGhlDQo+IGkyYy1tdXgtZ3BpbyBkcml2ZXIgcmVhZGFiaWxpdHkuIExpbnVzJyBwYXRjaCBk
b2Vzbid0IHByb3ZpZGUgdGhlIHNhbWUgd2F5IG9mDQo+IHNpbXBsaWZpY2F0aW9uLCBidXQgbm8g
ZG91YnQgc2ltcGxpZnkgdGhlIGNvZGUgYSBiaXQuDQoNClNvLCBJIGhhZCBhIGNsb3NlciBsb29r
LCBhbmQgeWVzLCB5b3VyIHBhdGNoZXMgZG8gc3BsaXQgdXAgdGhlIG9mIGFuZA0KcGxhdCBjb2Rl
LiBCdXQgaXMgdGhpcyB0aGUgcmlnaHQgYXBwcm9hY2g/IFRoZSBvbmx5IHVzZXIgb2YgdGhlIHBs
YXQNCmludGVyZmFjZSBpcyB0aGUgaTJjLWk4MDEgZHJpdmVyIChhbmQgSSB3b3VsZCByZWFsbHkg
bGlrZSBmb3IgdGhlDQpwbGF0IGludGVyZmFjZSB0byBqdXN0IGdvIGF3YXkpLiBMaW51cycgYXBw
cm9hY2ggc2VlbSAodG8gYXQgbGVhc3QNCmF0dGVtcHQpIHRvIGNvbnNvbGlkYXRlIHRoZSBwbGF0
IGFuZCBvZiBjb2RlIHBhdGhzIHNvIHRoYXQgdGhlDQppMmMtbXV4LWdwaW8gY29kZSBjYW4gaWdu
b3JlIHRoZSBwbGF0Zm9ybSBpbnRlcmZhY2UgYW5kIG9ubHkNCndvcmsgd2l0aCB0aGUgZ3Bpb2Qg
aW50ZXJmYWNlLiBJIGxpa2UgdGhhdC4NCg0KPiAzLiBJdCBkb2Vzbid0IGJyZWFrIGN1cnJlbnQg
cGxhdGZvcm1fZGF0YS1iYXNlZCBkcml2ZXIgaW50ZXJmYWNlIGFzIExpbnVzJyBkb2VzLg0KPiBT
byBpZiBzb21ldGhpbmcgZ29lcyB3cm9uZyB3aXRoIHRoaXMgcGF0Y2ggYSB1c2VyIGFsd2F5cyBj
YW4gZ2V0IGJhY2sgdG8gbXkNCj4gdmVyc2lvbiBvZiB0aGUgZHJpdmVyLg0KDQpMaW51cyB0b3Vj
aGVzIGJvdGggdXNlcnMgb2YgdGhhdCBpbnRlcmZhY2UgKGlnbm9yaW5nIGFueSBhbmQgYWxsDQpv
dXQtb2YtdHJlZSBsb3NlcnMpLiBCdXQgc3VyZSwgdGhlcmUgbWlnaHQgYmUgc29tZSBtaXN0YWtl
IGx1cmtpbmcuDQpIZSBkaWQgYXNrIGZvciBoZWxwIHRob3VnaCENCg0KPiA0LiBJdCB1dGlsaXpl
ZCB0aGUgbW9kZXJuIEdQSU9kIEFQSSB0byBmdWxseSBwYXJzZSBvZi9kdGIvZmR0L2R0cyBub2Rl
cy4NCj4gTGludXMnIGFsdGVyYXRpb24gYWxzbyBkb2VzIHRoYXQsIGJ1dCBJIGhhdmUgYSBkb3Vi
dCBpdCBpcyBjb3JyZWN0bHkgaW1wbGVtZW50ZWQuDQo+IA0KPiBJdCBzZWVtcyB0byBtZSwgdGhh
dCBMaW51cycgcGF0Y2ggaGFzbid0IGJlZW4gdGVzdGVkICg/KSBvbiBhIE9GLWJhc2VkIHBsYXRm
b3JtLA0KPiBzaW5jZSBncGlvZF8qLW1ldGhvZHMgYXJlbid0IHVzZWQgY29ycmVjdGx5ICgibXV4
LWdwaW9zIiBjb25faWQgdXRpbGl6YXRpb24NCj4gaXMgY29tcGxldGVseSByZW1vdmVkIGZyb20g
dGhlIG1ldGhvZHMgaW52b2NhdGlvbnMsIHdoaWNoIG1heSBjYXVzZSBmYWlsdXJlcw0KPiBpbiBh
dHRlbXB0cyB0byBmaW5kIHRoZSBHUElPcyBjb3VudCBhbmQgZ2V0IEdQSU8gZGVzY3JpcHRvcnMp
Lg0KDQpZZXMsIGl0IHNlZW1zIHRoYXQgZ3Bpb2RfY291bnQoKSBhbmQgZGV2bV9ncGlvZF9nZXRf
aW5kZXgoKSBjYWxscyBjYW4ndA0KdW5jb25kaXRpb25hbGx5IHBhc3MgTlVMTCBhcyB0aGUgMm5k
IGFyZ3VtZW50LiBMaW51cz8NCg0KPiBTbyBJIHN1Z2dlc3QgdG8gZmluaXNoIG15IHBhdGNoc2V0
IHJldmlldyBmaXJzdC4gVGhlbiByZWJhc2UgdGhpcyBwYXRjaCBvbiB0b3Agb2YNCj4gaXQuIEJ5
IGRvaW5nIHNvIHdlJ2xsIGdldCB0byBoYXZlIGEgc2ltcGxlciBkcml2ZXIgY29kZSB3aXRoIHN0
ZXAtYnktc3RlcCBoaXN0b3J5DQo+IG9mIGFsdGVyYXRpb25zIGZyb20gY3VycmVudCBjb2RlIHN0
YXRlLCB0aHJvdWdoIHBsYXRmb3JtX2RhdGEtIGFuZCBPRi1iYXNlZCBjb2RlDQo+IHNwbGl0IHVw
LCBtb2Rlcm4gR1BJT2QgQVBJIHV0aWxpemF0aW9uIGZvciBPRi1iYXNlZCBwYXRoLCB0byB0aGUg
ZmluYWwNCj4gc2ltcGxpZmljYXRpb25zIExpbnVzJyBwYXRjaCBwcm92aWRlcy4gVGhpcyBwYXRj
aCBzaGFsbCBhbHNvIGdldCB0byBiZSBzaW1wbGVyIGZvcg0KPiByZXZpZXcgZHVlIHRvIHRoZSBj
b2RlIHNwbGl0IHVwIG15IHBhdGNoc2V0IHByb3ZpZGVzLiBJJ2xsIGhlbHAgd2l0aCB0aGUgcmV2
aWV3IGFuZA0KPiB0ZXN0IGl0IG9uIG15IHBsYXRmb3JtIHdoZW4gdGhlIHJlYmFzZSdzIGRvbmUu
DQoNCkknbSBub3Qgc28gc3VyZS4gSWYgTGludXMnIHBhdGNoIHdvcmtzIG91dCwgdGhlcmUgd2ls
bCBzaW1wbHkgYmUgbm8gbmVlZA0KdG8gc2VwYXJhdGUgdGhlIHBsYXQvb2YgY29kZSBwYXRocy4g
V2hpY2ggaXMgb2YgY291cnNlIG5lYXQgYW5kIHRpZHkuDQoNCkNoZWVycywNClBldGVyDQoNCj4g
UmVnYXJkcywNCj4gLVNlcmdleQ0KDQoNCg==
