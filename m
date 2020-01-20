Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E15143062
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 18:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgATRDc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 12:03:32 -0500
Received: from mail-eopbgr50103.outbound.protection.outlook.com ([40.107.5.103]:63963
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726885AbgATRDc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 12:03:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXJzzf17Iz03X3PrAM2RlrjW3KlzYdIRDdob9UE000tVxGYxKU1kqczWvJR1nTQDwWldUIsmadXPFFl7P5zBXjm1rMeIEp/kVJCphlb+sKpw88bJ1e20URgO0EINfBKCL7a+SvInWr+3HOB29lxrrIJ1HOfbknXDwjNoB7yCnSYjr9+caq2pvEW3c49woYNolac+wUzY/8bN+qg0XulqgBNe/dpsqEkMh8HtMYGkUrnWr3IBI+QEW41BET0HCDoFwps7cArrGeq6YsYfQnTJIu/gx/3UurE8ekw/vYQZ86mmc1NBTb4osBjReKX3ayQVSFTX6aaEiqb4fke27SIT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEEnSGRJ70nTH3mbeBCjm7uuacH/0tyQ3BcllPoJGJ4=;
 b=W6dgxMNtdHzLyZeH2dvq0pklCXlg5Mfn03dsb++cguRRgrPcX2MjMXIWZMThfOA00VqtrW7ncBkT2hnxJ1/H4zDRdqcBarBR0B7NK4NLucQypLWBrLkCz/rAQdcR644UdzP4TfGvEo92S2I10QiHfO6LHrs+aAp4N+OrzMUIXmW3ZeadY4pXN9bWxadaCJJgTmeUwukjyDCU0CbHF4v4TRZA57ynr1MER9ZgkVB3YimtX9UXMAU+9HmFdxaZYvxm9Bbwm891bCwWeFnkK1tbl6hv69znm4i10vDJexfZSSAOP7fM5dhHhHZXJsm2DxXTvLv+kCU6kTdHGWW91zQ3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEEnSGRJ70nTH3mbeBCjm7uuacH/0tyQ3BcllPoJGJ4=;
 b=AduXbVnsPTe7uxLumIjzzSO9TaES5l+4bvT/leZg9BSiuEHn6FnhQHksGYJMg0S6qBtpf+SMNldh9IErdLX0mOw2wEQ6PmCaeDJgavNerkTAaf+xCcoL5Fn/BL39giezvnHGbQlE45i+XmLvym1wwohBZxz8/V41Kg38GWWJZAw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3449.eurprd02.prod.outlook.com (52.134.70.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Mon, 20 Jan 2020 17:03:26 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 17:03:26 +0000
Received: from [192.168.13.3] (213.112.138.4) by AM5PR0102CA0030.eurprd01.prod.exchangelabs.com (2603:10a6:206::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via Frontend Transport; Mon, 20 Jan 2020 17:03:25 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 01/12] i2c: pxa: use official address byte helper
Thread-Topic: [PATCH 01/12] i2c: pxa: use official address byte helper
Thread-Index: AQHVs2F1e0OdRPIFgkyuqVdat20s/6f0AEoA
Date:   Mon, 20 Jan 2020 17:03:26 +0000
Message-ID: <c3d57cc4-5ec4-492f-e233-580ac1aba2cd@axentia.se>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
 <E1igWOT-0005Dp-Sb@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1igWOT-0005Dp-Sb@rmk-PC.armlinux.org.uk>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: AM5PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:206::43) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd217e72-1f98-40ad-94e9-08d79dcaaa39
x-ms-traffictypediagnostic: DB3PR0202MB3449:
x-microsoft-antispam-prvs: <DB3PR0202MB3449197C03B376BB8F9733A5BC320@DB3PR0202MB3449.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(346002)(396003)(39830400003)(199004)(189003)(52116002)(16526019)(4001150100001)(2616005)(36756003)(6486002)(8936002)(53546011)(186003)(26005)(66446008)(64756008)(66476007)(66556008)(81166006)(81156014)(66946007)(8676002)(956004)(2906002)(16576012)(31696002)(5660300002)(86362001)(110136005)(316002)(71200400001)(508600001)(31686004);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3449;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mivYm1ni8K79YTOlWa7EQtJqffk6E0VULI0b0m0myrPSjloSTxGOxRIDOJ9XNYksSP2O3z1Pn/NyPrvNEg4+hRkZT+ShKJVJO6dSP0VG5Qz/xo6x7363TCXd8GN165SEngSG+jJbVFXy40jkgaRL8sdbAq34/PmKF3cKTu+BZDwNAtdq0QfvfyUSImNQy2IX15EdnSFFRxbMriTopv8yMOQcy5DxUusivoWC0xQc3+gQ24SryGSAqa4xqxyM4uVTYtZp5J+BYrs7jUjrPU8Q/mFc4yxYDz6XFJQdkmyv7V7cYSr8Rn0Qh8c6uTrNN6Jv1vCFVueqOAV4JBNvA7kK2bAVu8brDGAPRIv30YqUpQdWEu3PvM3r6F39UmUT+X5LgorcgsiPE54CY8q/ZTgHKe6P+KubrhFthjrGZHNY3/wFeEffLh5QzY40r1IDMOro
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E77B60F11703C4586695C3B57F587F9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: fd217e72-1f98-40ad-94e9-08d79dcaaa39
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 17:03:26.4187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iH/Z69hPhnxgxIOaJ82gn3BnmaamOAJgt6Xqlwsr4LRswGf3ET9NuX22PZF8Fy2v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3449
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMi0xNSAxNzowNSwgUnVzc2VsbCBLaW5nIHdyb3RlOg0KPiBpMmMtcHhhIHdhcyBj
cmVhdGVkIGJlZm9yZSBpMmNfOGJpdF9hZGRyX2Zyb21fbXNnKCkgd2FzIGltcGxlbWVudGVkLA0K
PiBhbmQgdXNlZCBpdHMgb3duIGkyY19weGFfYWRkcl9ieXRlKCkgd2hpY2ggaXMgZnVuY3Rpb25h
bGx5IHRoZSBzYW1lLg0KPiBTYWRseSwgaXQgd2FzIG5ldmVyIHVwZGF0ZWQgdG8gdXNlIHRoaXMg
bmV3IGhlbHBlci4gU3dpdGNoIGl0IG92ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxs
IEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtcHhhLmMgfCAyMSArKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcHhhLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXB4YS5jDQo+IGluZGV4IDJjM2MzZDY5MzVjMC4uOTY2MDAwOTIzZThlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXB4YS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtcHhhLmMNCj4gQEAgLTY3NSwyNSArNjc1LDE4IEBAIHN0YXRpYyB2b2lkIGkyY19weGFf
c2xhdmVfc3RvcChzdHJ1Y3QgcHhhX2kyYyAqaTJjKQ0KPiAgICogUFhBIEkyQyBNYXN0ZXIgbW9k
ZQ0KPiAgICovDQo+ICANCj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGkyY19weGFfYWRk
cl9ieXRlKHN0cnVjdCBpMmNfbXNnICptc2cpDQo+IC17DQo+IC0JdW5zaWduZWQgaW50IGFkZHIg
PSAobXNnLT5hZGRyICYgMHg3ZikgPDwgMTsNCj4gLQ0KPiAtCWlmIChtc2ctPmZsYWdzICYgSTJD
X01fUkQpDQo+IC0JCWFkZHIgfD0gMTsNCj4gLQ0KPiAtCXJldHVybiBhZGRyOw0KPiAtfQ0KPiAt
DQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgaTJjX3B4YV9zdGFydF9tZXNzYWdlKHN0cnVjdCBweGFf
aTJjICppMmMpDQo+ICB7DQo+ICAJdTMyIGljcjsNCj4gKwl1OCBhZGRyOw0KPiArDQo+ICsJYWRk
ciA9IGkyY184Yml0X2FkZHJfZnJvbV9tc2coaTJjLT5tc2cpOw0KPiAgDQo+ICAJLyoNCj4gIAkg
KiBTdGVwIDE6IHRhcmdldCBzbGF2ZSBhZGRyZXNzIGludG8gSURCUg0KPiAgCSAqLw0KPiAtCXdy
aXRlbChpMmNfcHhhX2FkZHJfYnl0ZShpMmMtPm1zZyksIF9JREJSKGkyYykpOw0KPiAtCWkyYy0+
cmVxX3NsYXZlX2FkZHIgPSBpMmNfcHhhX2FkZHJfYnl0ZShpMmMtPm1zZyk7DQo+ICsJd3JpdGVs
KGFkZHIsIF9JREJSKGkyYykpOw0KPiArCWkyYy0+cmVxX3NsYXZlX2FkZHIgPSBhZGRyOw0KDQpZ
b3UgYXJlIGludHJvZHVjaW5nIGEgdGVtcG9yYXJ5IHZhcmlhYmxlIChhZGRyKSBoZXJlLi4uDQoN
Cj4gIA0KPiAgCS8qDQo+ICAJICogU3RlcCAyOiBpbml0aWF0ZSB0aGUgd3JpdGUuDQo+IEBAIC0x
MDA2LDggKzk5OSw4IEBAIHN0YXRpYyB2b2lkIGkyY19weGFfaXJxX3R4ZW1wdHkoc3RydWN0IHB4
YV9pMmMgKmkyYywgdTMyIGlzcikNCj4gIAkJLyoNCj4gIAkJICogV3JpdGUgdGhlIG5leHQgYWRk
cmVzcy4NCj4gIAkJICovDQo+IC0JCXdyaXRlbChpMmNfcHhhX2FkZHJfYnl0ZShpMmMtPm1zZyks
IF9JREJSKGkyYykpOw0KPiAtCQlpMmMtPnJlcV9zbGF2ZV9hZGRyID0gaTJjX3B4YV9hZGRyX2J5
dGUoaTJjLT5tc2cpOw0KPiArCQl3cml0ZWwoaTJjXzhiaXRfYWRkcl9mcm9tX21zZyhpMmMtPm1z
ZyksIF9JREJSKGkyYykpOw0KPiArCQlpMmMtPnJlcV9zbGF2ZV9hZGRyID0gaTJjXzhiaXRfYWRk
cl9mcm9tX21zZyhpMmMtPm1zZyk7DQoNCi4uLmJ1dCBub3QgaGVyZS4gQnV0IGl0IHNlZW1zIGxp
a2UgdGhlIHNhbWUgcGF0dGVybi4gQW55IHBhcnRpY3VsYXIgcmVhc29uIGZvcg0KdGhhdCBkaWZm
ZXJlbmNlPw0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICANCj4gIAkJLyoNCj4gIAkJICogQW5kIHRy
aWdnZXIgYSByZXBlYXRlZCBzdGFydCwgYW5kIHNlbmQgdGhlIGJ5dGUuDQo+IA0KDQo=
