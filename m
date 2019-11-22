Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359BE106836
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 09:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfKVIn7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 03:43:59 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com ([40.107.7.94]:17054
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726018AbfKVIn7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Nov 2019 03:43:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ6e26f7jJjEUaduciobWZeaDQWJjxQF9CZmr5Ck+rgzgWOBie2h2+Or0eGRSD/kCJn7qxeFc9+rfUn1B3NMMi6jrRU4HvjuWt4CC1A+eyXodasRk2hhe9vybEfYZNmkzJuCP2wBu0pxv3IrqPO237e2dOfOFruFqkhkvH6VOEcHKaAfkOWCbavi1lN4TStKE7iXuGASUiXO4sSsIqATGnsEqVnHNSAwRsqnoOUf2qG/pwhfa3TDSW1JOqVIwSTr4Z8BopNE/tcPFWcECvdza/JJLqnlw0cr8kcwgPApd58YlLNRBzWUXzhQ5ZTx8IFPQtDKYeDMsxotLWz3kesZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPZolzSkCmmfOElVD219lx1hv/5+RF6ZGDRpHp8sTVg=;
 b=AbwTb+cFw1/BkNPLtjmEiYWouY0Kn7JeWPhIPGhL/JBj66oh4U35PHjNUNuSuK9QeJI8oE63qvOLyr0VGY3xluFFxyC/lKuQvA3NEPPwXwUKmroB3yGzpTHB/6o8sm6FuuCI9ON3GnqNm9T1ZifNCTq0T0meqVoUJKe9ekoQpO//bSVBlTPFesPjK6uiNycgNDpcm+veBb+YtTEqpjF4MRC3Re9LUg6XGMp7DI9a9pmRtEu17tFdbRawL0uN7MeueaXRV6FGMCC0/z9RJ4Z61kAb6QyUVkydhHfgl9qn/M/OqKE7csCckkKUNOAc88IVIHKwttmaaZ2RYpBXy/sdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPZolzSkCmmfOElVD219lx1hv/5+RF6ZGDRpHp8sTVg=;
 b=MpCi+l9Zem1zEx6H4+hGeOoUbZ4qMcpySKy9/G5kdaOJaNb9lpNvw/7pm4G96vcqg3s79/6MFIvcV4qBmG+EEfQ/Llr9i7TIzpC8+tf1saKhRuB+0MhnAKbP/EjwTSJ7CIfV78cu7Qs+zlgcu3yYiKyeh3eIieMGQDfUj9qiMrc=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3273.eurprd02.prod.outlook.com (52.134.65.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Fri, 22 Nov 2019 08:43:51 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.021; Fri, 22 Nov 2019
 08:43:51 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
Thread-Topic: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
Thread-Index: AQHVmsPurZy7ZtYH5UOEuWcdG58cQaeRk7YAgAI+hYCAApaTAIAAPykAgABEaoA=
Date:   Fri, 22 Nov 2019 08:43:51 +0000
Message-ID: <9408fca3-8673-0a1d-0ba7-8bfca0c028be@axentia.se>
References: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <6d135b8a-cdba-e6a6-7738-cbc94cdb7ec0@axentia.se>
 <CAKfKVtE=ufzc=_EjPR2WKt4qf0sdOB=a7f-BRP-ZffMaemxGBw@mail.gmail.com>
 <b9eaaba2-dcfd-0c97-f088-21acf269a92f@axentia.se>
 <CAKfKVtHuzWqH4Su1vC2oMMxvUPiGjvZsBJtYSXxx+rG7Ub1pSQ@mail.gmail.com>
In-Reply-To: <CAKfKVtHuzWqH4Su1vC2oMMxvUPiGjvZsBJtYSXxx+rG7Ub1pSQ@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::19) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 433464f2-753f-41c2-4984-08d76f281952
x-ms-traffictypediagnostic: DB3PR0202MB3273:
x-microsoft-antispam-prvs: <DB3PR0202MB327319F22E1523EC34C48AB3BC490@DB3PR0202MB3273.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(136003)(376002)(39830400003)(396003)(199004)(189003)(51914003)(52314003)(186003)(8936002)(81166006)(446003)(26005)(6916009)(2616005)(76176011)(81156014)(316002)(6246003)(4326008)(31686004)(305945005)(52116002)(6486002)(14444005)(7736002)(66946007)(229853002)(6506007)(4001150100001)(54906003)(6512007)(66446008)(66476007)(6436002)(11346002)(256004)(102836004)(53546011)(6116002)(2906002)(3846002)(65806001)(36756003)(5660300002)(66556008)(25786009)(386003)(64756008)(8676002)(99286004)(71200400001)(66066001)(508600001)(14454004)(86362001)(65956001)(58126008)(31696002)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3273;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iUswGOBI3ak6lD/X8JXOLxPpIYSIb5D8amw8PDIRba3lI8Igxto+keXTbg17HbUSVR74VrH+U3uQ6+ervdaBx18NdThqu41levEhQYJaYPGpJvqmsFypGDTHo6wpDqkNAT0EraJ7QpGuLB/zWNERZRrwA59Iepu8wKP2SZI9sM9TgXsSxVGNcuWwd9WOi8JZK1YBqHkrOuj9yNoRwwuA2gpm77OCBUnS7qkqXK/BRc5C+4GA84wY/J0bls+gtBl2SMLd/nUlY5KZsB7xeWoBLMWvw5EC6Ztgb0dbbI7wGCnhvnwP32FKsSbr+nPP4bMgbddE+2FR/pl3geOn+AZkEjiEkAB9TTXO1emTXDlenp5R2t9xMWAyPbfPBZbnSFe0uRRzz3/iYB4KIznIZY6k23w+CKIa/xHARO1Y3eGg1y+RsEXEPr5q1e8Lv0jw73CP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <41EF1850266586499BBDFF0C29AC50F2@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 433464f2-753f-41c2-4984-08d76f281952
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 08:43:51.3510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMnFXzWJSHoar5dBmojdpPhtiDlwc0p/iSZKUlvk86VL/a3vj7Ypaw+GTV7juc3O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3273
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0yMiAwNTozOCwgU2h1YmhyYWp5b3RpIERhdHRhIHdyb3RlOg0KPiBPbiBGcmks
IE5vdiAyMiwgMjAxOSBhdCA2OjIzIEFNIFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+IHdy
b3RlOg0KPj4NCj4+IE9uIDIwMTktMTEtMjAgMTA6MjEsIFNodWJocmFqeW90aSBEYXR0YSB3cm90
ZToNCj4+PiBIaSBQZXRlciAsDQo+Pj4gdGhhbmtzIGZvciB0aGUgcmV2aWV3LA0KPj4+DQo+Pj4g
T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgNDozNSBBTSBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlh
LnNlPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMjAxOS0xMS0xNCAwOToxNywgc2h1YmhyYWp5b3Rp
LmRhdHRhQGdtYWlsLmNvbSB3cm90ZToNCj4+Pj4+IEZyb206IFNodWJocmFqeW90aSBEYXR0YSA8
c2h1YmhyYWp5b3RpLmRhdHRhQHhpbGlueC5jb20+DQo+Pj4+Pg0KPj4+Pj4gSW4gY2FzZSBvZiBt
dWx0aW1hc3RlciBjb25maWd1cmF0aW9uIHRoZSBsYXN0IGNoYW5uZWwgY2FjaGVkIHZhbHVlIGlz
DQo+Pj4+PiBub3QgcmVsaWFibGUuIEJhc2ljYWxseSB0aGUgZmlyc3QgcHJvY2Vzc29yL21hc3Rl
ciBkb2VzIGEgd3JpdGUgdG8gdGhlDQo+Pj4+PiBtdXggYW5kIHRoZW4gdG8gdGhlIGludGVuZGVk
IHNsYXZlLCBpdCBjYWNoZXMgdGhlIHZhbHVlLg0KPj4+Pj4gTm93IHRoZSBzZWNvbmQgcHJvY2Vz
c29yL3Byb2Nlc3NvciBkb2VzIGEgd3JpdGUgdG8gbXV4IG9uIGFub3RoZXINCj4+Pj4+IGNoYW5u
ZWwgYW5kIHdyaXRlcyB0byBhbm90aGVyIHNsYXZlLg0KPj4+Pj4gVGhlIGZpcnN0IHByb2Nlc3Nv
ci9tYXN0ZXIgd2hlbiBpdCBhdHRlbXB0cyB0byB3cml0ZSB0aGUgc2xhdmUNCj4+Pj4+IHNraXBz
IHRoZSBtdXggYXMgaXQgcmVsaWVzIG9uIHRoZSBtdXggY2hhbm5lbCBiZWluZyB0aGUgc2FtZSBh
cyB0aGUNCj4+Pj4+IGludGVuZGVkLiBUaGlzIGNhdXNlcyBhbiBpc3N1ZS4NCj4+Pj4+DQo+Pj4+
PiBUbyBmaXggdGhhdCB3cml0ZSBhbHdheXMgdG8gdGhlIG11eCBhZGRyZXNzLg0KPj4+Pg0KPj4+
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+Pj4+DQo+Pj4+IEhvd2V2ZXIsIEkgZG9uJ3QgcmVh
bGx5IHNlZSBob3cgdGhpcyBmaXhlcyBhbnl0aGluZy4gSWYgeW91IGhhdmUNCj4+Pj4gbXVsdGlw
bGUgbWFzdGVycyBjb21wZXRpbmcgZm9yIHRoZSBzYW1lIG11eCwgYWxsIGJldHMgYXJlIG9mZiBh
bmQgYW55DQo+Pj4+IHNvbHV0aW9uIG5vdCBpbnZvbHZpbmcgYW4gb3V0LW9mLWJhbmQgY2hhbm5l
bCB3aGVyZSB0aGUgbWFzdGVycyBjYW4NCj4+Pj4gY29vcmRpbmF0ZSB3aWxsIGJlIHJhY3ksIGJy
b2tlbiBhbmQgZGFuZ2Vyb3VzLg0KPj4+PiBBbmQgc2luY2UgeW91IG5lZWQgdGhhdA0KPj4+PiBl
eHRyYSBjaGFubmVsIGFueXdheSwgaXQgbWlnaHQgYXMgd2VsbCBhbHNvIGJlIHVzZWQgdG8gY29v
cmRpbmF0ZSB3aGVuDQo+Pj4+IHRoZSBjYWNoZSBuZWVkcyB0byBiZSBpbnZhbGlkYXRlZC4NCj4+
Pj4NCj4+Pj4gQXQgdGhlIHZlcnkgbGVhc3QsIGFsbCBsaW1pdGF0aW9ucyBuZWVkcyB0byBiZSBj
YXJlZnVsbHkgZG9jdW1lbnRlZCwNCj4+Pj4gYnV0IHRoYXQgZG9lcyBub3QgbWVhbiB0aGF0IEkg
d2lsbCBldmVyIGxpa2UgaXQuIEluIHNob3J0LCBJJ20gZXh0cmVtZWx5DQo+Pj4+IHJlbHVjdGFu
dCB0byBhZGQgYSBnbGdsbGlrZSB0aGlzLg0KPj4+Pg0KPj4+PiBDaGVlcnMsDQo+Pj4+IFBldGVy
DQo+Pj4NCj4+PiBJIGFncmVlIGRvZXMgdGhlIGJlbG93IHBhdGNoIG1ha2Ugc2Vuc2UuDQo+Pg0K
Pj4gVGhpcyBwYXRjaCBpcyBzZXZlcmVseSB3aGl0ZS1zcGFjZSBkYW1hZ2VkIGFuZCBJIGhhdmUg
YSBoYXJkIHRpbWUgcmVhZGluZw0KPj4gdGhlIGRldGFpbHMgc28gcGxlYXNlIGZpeCB5b3VyIHNl
dHVwLiBIb3dldmVyLCBJIGdhdGhlciB0aGUgaWRlYSBpcyB0bw0KPj4gcmVseSBvbiBoYXZpbmcg
YWxsIG1hc3RlcnMgY29uZmlndXJlZCB0byBpZGxlIHRoZSBtdXggd2hlbiB0aGV5IGRvbid0IHVz
ZQ0KPj4gaXQuIFRoYXQncyBhbHNvIHJhY3kgc2luY2UgbXVsdGlwbGUgbWFzdGVycyBjYW4gYWxs
IHJlYWQgdGhlIHplcm8sIGFuZA0KPj4gZGVkdWNlIHRoYXQgdGhlIG11eCBpcyBmcmVlLCB0aGVu
IGFsbCBvZiB0aGVtIHdyaXRlIHRoZWlyIHRoaW5nIHRvIHRoZQ0KPj4gbXV4LCBhbmQgcHJvY2Vl
ZCBhcyBpZiB0aGV5IG93biBpdC4gVGhhdCBzcGVsbHMgZGlzYXN0ZXIuDQo+IEhvd2V2ZXIgc2lu
Y2UgdGhlIGJ1cyBpcyBsb2NrZWQgd2hlbiB0aGUgbWFzdGVyIGlzIHRyYW5zYWN0aW5nIG90aGVy
cw0KPiB3aWxsIGdldCBidXMNCj4gYnVzeSBvciBhbiBhcmJpdHJhdGlvbiBsb3N0IGlmIHRoZXkg
c3RhcnQgdG9nZXRoZXIuDQoNCk5vdCBuZWNlc3NhcmlseSwgc2luY2UgYSBtdXhlZCB0cmFuc2Fj
dGlvbiB3aXRoIHNvbWUgc2xhdmUgb24gdGhlIG90aGVyDQpzaWRlIG9mIHRoZSBtdXggd2lsbCBj
b25zaXN0IG9mIChhdCBsZWFzdCkgZm91ciBpbmRlcGVuZGVudCB0cmFuc2ZlcnMgKHdpdGgNCnRo
aXMgcGF0Y2gpLg0KDQoxLiBjaGVjayB0aGF0IHRoZSBtdXggc3RhdGUgaXMgaWRsZQ0KMi4gc2V0
IHRoZSBtdXggdG8gdGhlIGludGVuZGVkIGNoaWxkIGJ1cw0KMy4gZG8gdGhlICJ1c2VmdWwiIHRy
YW5zZmVyIHRvIHRoZSBzbGF2ZSBvbiB0aGUgY2hpbGQgYnVzDQo0LiByZXNldCB0aGUgbXV4IHRv
IGlkbGUNCg0KVHdvIG1hc3RlcnMgbWlnaHQgdmVyeSB3ZWxsIGdldCBwYXN0IDEgd2l0aG91dCBu
b3RpY2luZyBlYWNoIG90aGVyLCB3aGljaA0KaXMgdGhlIGJpZyBmYWlsIGluIHlvdXIgcGF0Y2gu
IFRoZXkgbWlnaHQgYWxzbyB2ZXJ5IHdlbGwgZ2V0IHBhc3QgMiB3aXRob3V0DQpydW5uaW5nIGlu
dG8gYXJiaXRyYXRpb24uIFlvdSBjYW5ub3QgYmUgc3VyZSB0aGF0IGEgbWFzdGVyIGlzIGFibGUg
dG8gcHV0DQp0aGVzZSBmb3VyIHRyYW5zYWN0aW9ucyBvbiB0aGUgYnVzIGJhY2stdG8tYmFjaywg
YXQgbGVhc3Qgbm90IGluIHRoZSBMaW51eA0KY2FzZSAodGhlcmUgbWlnaHQgZS5nLiBiZSBhIHJl
c2NoZWR1bGUgdG8gc29tZSB0b3RhbGx5IHVucmVsYXRlZCB3b3JrKS4gQW5kDQpldmVuIGlmIHlv
dSBjb3VsZCwgdHdvIG1hc3RlcnMgY291bGQgaW4gdGhlb3J5IGJlIGNvbXBsZXRlbHkgaW4gc3lu
YyBzbyB0aGF0DQpib3RoIG1hc3RlcnMgdGhpbmsgdGhleSBoYXZlIHN1Y2NlZWRlZCByaWdodCB1
bnRpbCB0aGV5IHdhbnQgdG8gc2V0IHNvbWUgYml0DQppbiB0aGUgbXV4IHJlZ2lzdGVyIGRpZmZl
cmVudGx5LiBTbywgaXQncyBqdXN0IGZyYWdpbGUuIEFuZCBldmVuIGlmIHRoZXkgZG8NCnJ1biBp
bnRvIGVhY2ggb3RoZXIgb24gMSBvciAyIG9uIHRoZSBJMkMgYnVzIGxldmVsLCB5b3UgaGF2ZSBu
byBjb2RlIGZvcg0KaGFuZGxpbmcgdGhhdCBzbyB0aGV5IHdpbGwgcHJvYmFibHkganVzdCByZXRy
eSBhIGJpdCBsYXRlci4gSW4gb3RoZXIgd29yZHMsDQp0aGUgcmFjZSBpcyBvbiwgYW5kIGdldHRp
bmcgbW9yZSB0aGFuIG9uZSBtYXN0ZXIgcGFzdCAxIGJlZm9yZSBhbnkgb2YgdGhlbQ0KaGl0IDIg
aXMgZW5vdWdoIHRvIGdldCBpbnRvIHRyb3VibGUuDQoNClRoZSBwcm9ibGVtIGlzIHRoYXQsIHdp
dGhvdXQgY29vcmRpbmF0aW9uLCB0aGUgb3RoZXIgbWFzdGVycyBkbyBub3Qgc2VlDQp0aGVzZSBm
b3VyIHRyYW5zYWN0aW9ucyBhcyBhIHVuaXQuIFlvdSAqbmVlZCogYXJiaXRyYXRpb24gb24gYSBo
aWdoZXINCmxldmVsIHRoYW4gaW5kaXZpZHVhbCB0cmFuc2ZlcnMuDQoNCkNoZWVycywNClBldGVy
DQo=
