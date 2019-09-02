Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C49A5993
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 16:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731628AbfIBOk7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 10:40:59 -0400
Received: from mail-eopbgr30129.outbound.protection.outlook.com ([40.107.3.129]:26798
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731626AbfIBOk7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 10:40:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuS+kpm1L+qu/JzAiMuGKCVMrH2FCYeE41RwEactnNrXnKmyMrB8QikgdAQfQl+U7bY7Diq5sIRAdEQ9Dp3kqtN55MstbuRo7tq3auNE07kh/VoZEaCfFvbq+gb+3v/BpIoKbpctTRaoZGFJedHTqlpUfeqApP0S7y98EV8zwEcESk2PVCT8+lFtrv4AdSTvGRgvolUJ8txlhizF1FhytVOSSj/IsrdLRXcJGp20SS1tKp3WPUT9W+gl/Jd1rWG0+RftV99ZGpXpKLYSaaq17hrU4MzffkhqaOpkYBbseUm52bU2b+X+BfXwFzRVzpUgn33+GU+vt1SnOxTgblma1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c/2G9MHpAm7T2Pb58R0JSpaIbGhllX7hE/0eYehlFs=;
 b=CGvNYqtvhbMGx/T0+TMp/3sZ0AZuyPN9pm91KaCsoawlmyVLzbKzJdM75P0fuu7e945Xydwft8vGk5RZ0Eong3rC4robmhE7Mf5RM2C96gL/w170+5WZoc8bYw957ejcBQIDEncg4x8vBtfqYn/Q0OlBnXxg45EAvE51WaTvTLvMlSglzK5PCI+8vzWY8FZrXuJ43lk4+kLNF+UCPbKKnY3rkyX6b23bWetAfqHt6Y5XCmLzm1tvj7GKwTwUVes74a/8uAkHP/0UdJNCfEMKt2P+mu4B0giy7lqzkE2xzyp1tnhr1lPRoVe4/QVNRoNcUZ6yaUDVNJ5cmFQeNGFDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c/2G9MHpAm7T2Pb58R0JSpaIbGhllX7hE/0eYehlFs=;
 b=CYuqhy+IV9pbnzjqgFo+XGShXgFs/WID6ztltpCEz1CbEKXxqiL4YqFS/uT0ryGwta4ZcmL7JH4LonV/H2elhiUaT+MP+HRz9YcQsVAizimBz8lyClnX6j35mNDJCIVYCDP4czgTS0f2zruAgNOlbmKreZ9GEwML9AdThWp3zY4=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3385.eurprd02.prod.outlook.com (52.134.73.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 14:40:55 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09%7]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 14:40:55 +0000
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
Subject: Re: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Topic: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Index: AQHVYXbiXZEVScDXYk6rEHjvPF2S2qcYVqwAgAAYEwCAAAcpAA==
Date:   Mon, 2 Sep 2019 14:40:55 +0000
Message-ID: <52038b5a-5940-2ac0-b7b4-5677c2fc5fbf@axentia.se>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
 <9a9c209c-2fb8-0a4c-4e0a-b04fefda3360@axentia.se>
 <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
In-Reply-To: <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b9515e6-d602-491c-9cdf-08d72fb38fa3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3385;
x-ms-traffictypediagnostic: DB3PR0202MB3385:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0202MB3385F314881B8D50F80013D7BCBE0@DB3PR0202MB3385.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(136003)(396003)(39830400003)(199004)(189003)(6512007)(6306002)(66066001)(65956001)(65806001)(2501003)(52116002)(99286004)(31696002)(6246003)(5660300002)(7416002)(6436002)(256004)(305945005)(110136005)(7736002)(11346002)(446003)(58126008)(6506007)(386003)(186003)(31686004)(76176011)(6116002)(3846002)(8936002)(26005)(14454004)(66446008)(966005)(66946007)(66556008)(66476007)(2906002)(64756008)(53936002)(508600001)(2201001)(476003)(316002)(2616005)(81166006)(8676002)(81156014)(86362001)(36756003)(486006)(6486002)(71200400001)(71190400001)(25786009)(229853002)(53546011)(102836004)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3385;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nJ02A/dseY8Js8g0N9Cj1iV3jgS3ivLldgBNDK3zFkV/MvVzlltO0tWXsmhHxs/BWdN7Yse/7x8uHKKjK8bbvZlRsnX7kTeKi7aqoSmEnRl8Y4KJ43NFyg4xKlAOlS5jJ0MXqHFMAxyIoF2rADPH9BoURroJEzvQgSOwznQflH/+t8S0ErcnP4pPsTuULNMa4OL7XCuX3pvbVVqfZRrOzGYoa1XoMNZLXPQzwZKw0ZRZDf+XrRF0yaRLjjVgPSMycBQ10jPQXBZqm1Cfyh7Cj5rfCFXJYfOrwt/rC6I++/MRTtyZewxtxdqnr2LU1SEoIlHg5X7wF31OAVR04CbFoNg+7CkiuUwEZ/nD0qcCzWql41YkVRjF21b8VIu792PfZyNcEdall5gLsZVTuxpnInBZhnmBIsKosEotSvZ6V1A=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C56B3A8B13F234BBB6A1FFC3502C322@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9515e6-d602-491c-9cdf-08d72fb38fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 14:40:55.2989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F74rHEh49NKEI4XAcKiyV43avaDNZo8/hO25GnOT1c2pw74w/MkA0wXEPOZWxuf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3385
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0wMiAxNjoxNSwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiANCj4gDQo+IE9uIDAyLjA5LjIwMTkgMTM6NDksIFBldGVyIFJvc2luIHdyb3RlOg0KPiANCj4+
IE9uIDIwMTktMDktMDIgMTI6MTIsIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToN
Cj4+PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+
Pj4NCj4+PiBTb21lIGkyYyBjb250cm9sbGVycyBoYXZlIGEgYnVpbHQtaW4gZGlnaXRhbCBvciBh
bmFsb2cgZmlsdGVyLg0KPj4+IFRoaXMgaXMgc3BlY2lmaWNhbGx5IHJlcXVpcmVkIGRlcGVuZGlu
ZyBvbiB0aGUgaGFyZHdhcmUgUENCL2JvYXJkLg0KPj4+IFNvbWUgY29udHJvbGxlcnMgYWxzbyBh
bGxvdyBzcGVjaWZ5aW5nIHRoZSBtYXhpbXVtIHdpZHRoIG9mIHRoZQ0KPj4+IHNwaWtlcyB0aGF0
IGNhbiBiZSBmaWx0ZXJlZC4gVGhlIHdpZHRoIGxlbmd0aCBjYW4gYmUgc3BlY2lmaWVkIGluIG5h
bm9zZWNvbmRzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4u
aHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPj4+IC0tLQ0KPj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0IHwgMTEgKysrKysrKysrKysNCj4+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0DQo+Pj4gaW5kZXggNDRlZmFmZC4uOGRiZmY2
NyAxMDA2NDQNCj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy50eHQNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy50eHQNCj4+PiBAQCAtNTUsNiArNTUsMTcgQEAgd2FudHMgdG8gc3VwcG9ydCBvbmUgb2Yg
dGhlIGJlbG93IGZlYXR1cmVzLCBpdCBzaG91bGQgYWRhcHQgdGhlIGJpbmRpbmdzIGJlbG93Lg0K
Pj4+ICAgCU51bWJlciBvZiBuYW5vc2Vjb25kcyB0aGUgU0RBIHNpZ25hbCB0YWtlcyB0byBmYWxs
OyB0KGYpIGluIHRoZSBJMkMNCj4+PiAgIAlzcGVjaWZpY2F0aW9uLg0KPj4+ICAgDQo+Pj4gKy0g
aTJjLWFuYWxvZy1maWx0ZXINCj4+PiArCUVuYWJsZSBhbmFsb2cgZmlsdGVyIGZvciBpMmMgbGlu
ZXMuDQo+Pj4gKw0KPj4+ICstIGkyYy1kaWdpdGFsLWZpbHRlcg0KPj4+ICsJRW5hYmxlIGRpZ2l0
YWwgZmlsdGVyIGZvciBpMmMgbGluZXMuDQo+Pj4gKw0KPj4+ICstIGkyYy1maWx0ZXItd2lkdGgt
bnMNCj4+PiArCVdpZHRoIG9mIHNwaWtlcyB3aGljaCBjYW4gYmUgZmlsdGVyZWQgYnkgZWl0aGVy
IGRpZ2l0YWwgb3IgYW5hbG9nDQo+Pj4gKwlmaWx0ZXJzIChpMmMtYW5hbG9nLWZpbHRyIG9yIGky
Yy1kaWdpdGFsLWZpbHRyKS4gVGhpcyB3aWR0aCBpcyBzcGVjaWZpZWQNCj4+DQo+PiBmaWx0ciAt
PiBmaWx0ZXIgKHR3byBpbnN0YW5jZXMpDQo+Pg0KPj4gV2hhdCBpZiB5b3Ugd2FudC9uZWVkIHRv
IGhhdmUgZGlmZmVyZW50IGJhbmR3aWR0aCBmb3IgdGhlIGRpZ2l0YWwgYW5kIGFuYWxvZw0KPj4g
ZmlsdGVycz8gQWZ0ZXIgYWxsLCB0aGlzIGlzIGEgZ2VuZXJpYyBiaW5kaW5nLi4uDQo+IA0KPiBI
aSBQZXRlciwNCj4gDQo+IEZvciBvdXIgbmVlZHMsIHRoaXMgaXMgZW5vdWdoOiB0aGUgcHVycG9z
ZSBvZiB0aGUgZmlsdGVycyBpcyB0byBhdm9pZCANCj4gbm9pc2Ugb24gdGhlIGxpbmVzLCB0aGUg
bm9pc2UgaXMgYXMgYmlnIGFzIGl0IGlzIGZvciB0aGUgZGlnaXRhbCBhbmQgZm9yIA0KPiB0aGUg
YW5hbG9nIGZpbHRlcnMsIHNpbmNlIHdlIHVzZSBhbiBhYnNvbHV0ZSBtZWFzdXJlbWVudCBmb3Ig
dGhlbS4gU28gSSANCj4gZG8gbm90IGtub3cgaG93IHVzZWZ1bCBpdCB3b3VsZCBiZSB0byBtYWtl
IGEgZGlmZmVyZW5jZS4NCkkgdGhpbmsgbXkgZ3JpcGUgaXMgdGhhdCB0aGUgZGVzY3JpcHRpb24g
YWxzbyBzZWVtcyBub24tZ2VuZXJpYy4gQW5hbG9nDQpmaWx0ZXJzIG5ldmVyIChvaywgdXN1YWxs
eSwgYnV0IEkgaGF2ZSBhIGhhcmQgdGltZSBzZWVpbmcgaG93IGEgc2ltcGxlDQphbmFsb2cgZmls
dGVyIGNhbikgd29yayBpbiB0ZXJtcyBvZiBzb21lICJ3aWR0aCBvZiBzcGlrZXMiLiBUaGF0IHBo
cmFzaW5nDQpzZWVtcyBsaWtlIHNvbWV0aGluZyBpbmhlcmVudCB0byB0cml2aWFsIGRpZ2l0YWwg
ZmlsdGVycy4gRm9yIGFuYWxvZw0KZmlsdGVycywgc3BlY2lmeWluZyB0aGUgYmFuZHdpZHRoIG9y
IGN1dC1vZmYgZnJlcXVlbmN5IHNlZW1zIG11Y2ggbW9yZQ0KYXBwcm9wcmlhdGUuIEFuZCBiYW5k
d2lkdGggd291bGQgd29yayBlcXVhbGx5IHdlbGwgZm9yIGRpZ2l0YWwgZmlsdGVycywNCm1ldGhp
bmtzLg0KDQpJIGFsc28gdGhpbmsgaXQgc2hvdWxkIGJlIG1lbnRpb25lZCBleHBsaWNpdGx5IHRo
YXQgdGhpcyBiaW5kaW5nIGlzIGZvcg0KTFAgZmlsdGVycy4gSSBkb24ndCB0aGluayBhbnl0aGlu
ZyBlbHNlIHdvdWxkIGJlIHVzZWZ1bCwgYnV0IGJldHRlciBzYWZlDQp0aGFuIHNvcnJ5Li4uDQoN
CkhtbSwgd291bGQgaXQgYmUgZ29vZCBvciBiYWQgdG8gc3BlY2lmeSB0aGUgYmFuZHdpZHRoIHJl
bGF0aXZlIHRvIHRoZQ0KY3VycmVudCBtYXhpbXVtIGJ1cyBzcGVlZD8NCg0KQ2hlZXJzLA0KUGV0
ZXINCg0KPiBXb2xmcmFtLCB3aGF0IGRvIHlvdSB0aGluayA/DQo+IA0KPiBFdWdlbg0KPiANCj4g
DQo+Pg0KPj4gQ2hlZXJzLA0KPj4gUGV0ZXINCj4+DQo+Pj4gKwlpbiBuYW5vc2Vjb25kcy4NCj4+
PiArDQo+Pj4gICAtIGludGVycnVwdHMNCj4+PiAgIAlpbnRlcnJ1cHRzIHVzZWQgYnkgdGhlIGRl
dmljZS4NCj4+PiAgIA0KPj4+DQo+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+PiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbA0KPj4NCj4+DQoNCg==
