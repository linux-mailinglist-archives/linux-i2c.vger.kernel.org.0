Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC27FDF12C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 17:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfJUPUy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 11:20:54 -0400
Received: from mail-eopbgr30121.outbound.protection.outlook.com ([40.107.3.121]:16389
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726847AbfJUPUy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 11:20:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpB3mIPsi8s3jBl1ZMERJOHM0VCFASgH7ObwLKttHTVm6uHmYHqf01Diod4FG0iQDW8n4SabLpou4+awyXzQd/1vKpav4X6e/kfP+zZXx5Z+c1F/MFUWnECyqVvf30BXWgrQMP7EOenkE2rE9qWQX88QdMS7tfgKbeYkeL4OkSYUem+mWeTipf3ADeMHLJEa/S+OtavO77MGbvrzHQKwbTCYyWtGY0gzJttYrunbNEmVsSqBQYNwdoLZu2uZwNUQXaFn67iYbSmIBWbe2baHHyAAQ8jt1iaFDwamuLNq5VMKJoQDGSmHwf3dOXPnOsdyeJtvvSS/UzAUaItI9lkLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76ShwPSz2IqcgJODhwTIqS3Hj9czJddBBjiNKAfdNvQ=;
 b=aTIC+4pSu4sKiVMCg0+cuyjQL/ogHG1xJuVwjE/Z6FUm9Ay7WqX+uJQSgzpxX3ASvvH+IFYLCjCPpnQITI/Sn6k3Eoslcmxp+Pn6z4gm0TS0RG7ziMv9Mdqfgu0+8n1nIAo/cb/0KNHaX0xDGE76dUIaS3iqNVRYKgnAxF2H1v7sDi1GkiUxGymvbJapKs64Jp8Y4x0zWAtUNwVBTHpypcwR8b28qZ+YUp+buTGhWftR5155OxsXyIN2RlteZ1mx6wVhuF4bCtFkYkM2BgHReSV93pjB9epleW8DobXvHhaVgDhfORR2Z65usiaBfw4ZqMxjAU/JBKSJbJDtVASTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76ShwPSz2IqcgJODhwTIqS3Hj9czJddBBjiNKAfdNvQ=;
 b=Ym+th3QnW4XtDGi8kfR16HE5C7oHW4gnjs4RUISaZS/4AWvfrniLEbWuyFxkEBRj1INT7IKlRA8fe3onUCj+btf6w50PaiWQJETNJOEaA6uujCYXsW5Md7E4sqmFPkWAZGKYkaq0cwZmGxPvckBmAzdbjkQwrOk9xLxgdANrBsw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 15:20:45 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 15:20:44 +0000
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
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v5 3/9] i2c: add support for filters optional properties
Thread-Topic: [PATCH v5 3/9] i2c: add support for filters optional properties
Thread-Index: AQHVaHpW6NWckaLWlEK4ND0k79ASNKdldToA
Date:   Mon, 21 Oct 2019 15:20:44 +0000
Message-ID: <d7172480-0ba3-3412-aebf-353bfe8d6f66@axentia.se>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <1568189911-31641-4-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1568189911-31641-4-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0902CA0016.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::26) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c754882a-b071-4299-ac44-08d7563a3dde
x-ms-traffictypediagnostic: DB3PR0202MB3435:
x-microsoft-antispam-prvs: <DB3PR0202MB3435005AB262E2F422C5D1C2BC690@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(346002)(396003)(136003)(376002)(366004)(199004)(189003)(11346002)(7736002)(31686004)(8936002)(71200400001)(71190400001)(508600001)(31696002)(5660300002)(446003)(86362001)(316002)(476003)(2616005)(305945005)(3846002)(25786009)(7416002)(6116002)(256004)(14444005)(486006)(2906002)(76176011)(52116002)(2501003)(6436002)(58126008)(229853002)(66476007)(66556008)(64756008)(66446008)(99286004)(66066001)(110136005)(65806001)(6486002)(66946007)(36756003)(6512007)(14454004)(26005)(2201001)(81166006)(81156014)(186003)(102836004)(6246003)(53546011)(386003)(65956001)(6506007)(4326008)(8676002)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3435;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNrx0wY9c9k6i0NWt0s75nCLUdA/Mynbt5QUpjaCJgrRsyEBOJCUi03dWaQa5bThZ1BGlz2R3pn7Kvz6iwhkVcEY20nqCJwVq0/4OgIQ4OvO6p1mhgtob/n2NDhNx7AVN7rPNeGrjGaSs7Q/zXJIL/KgqGtNcP/V9zP0Msod7BfXZ/Om54Fb9J/uHUhD9PUqp6JvYI7OGh30AX2sd2hsgMfPyzsEdoZBPA7sZEUzjo7pZB2z8dUBi5TRpg4bM/7mOPCxI+KVODRRHDYa254AACDwfCpGjNid4BuW3N9eJlYbKiU7V1R/E+qJyO1GwHtwgvMXKKJSAQr2zJuQ1SQJb/GpDHkk0ngROEDtw78twvoGUdjzCY2W0ohlcXHKkU03jYS5i+I8KF9XxuCeXf+v1CjF71b6Jc+hT5P5QYHZSK+DkX/ldB+v9xkC46AnCIFf
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E26C7A80CEE0D4A864CA97F250362B5@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c754882a-b071-4299-ac44-08d7563a3dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 15:20:44.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xDMbMiuCutJ1QtJiuQUjyCOz16iOAVxg2mYN66hGFEXJyqegeyEi437VAzJj4MVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0xMSAxMDoyNCwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBpMmMtZGlnaXRhbC1maWx0ZXItd2lkdGgtbnM6DQo+IFRoaXMgb3B0aW9uYWwgdGltaW5nIHBy
b3BlcnR5IHNwZWNpZmllcyB0aGUgd2lkdGggb2YgdGhlIHNwaWtlcyBvbiB0aGUgaTJjDQo+IGxp
bmVzIChpbiBucykgdGhhdCBjYW4gYmUgZmlsdGVyZWQgb3V0IGJ5IGJ1aWx0LWluIGRpZ2l0YWwg
ZmlsdGVycyB3aGljaCBhcmUNCj4gZW1iZWRkZWQgaW4gc29tZSBpMmMgY29udHJvbGxlcnMuDQo+
IGkyYy1hbmFsb2ctZmlsdGVyLWN1dG9mZi1mcmVxdWVuY3k6DQo+IFRoaXMgb3B0aW9uYWwgdGlt
aW5nIHByb3BlcnR5IHNwZWNpZmllcyB0aGUgY3V0b2ZmIGZyZXF1ZW5jeSBvZiBhIGxvdy1wYXNz
DQo+IGFuYWxvZyBmaWx0ZXIgYnVpbHQtaW4gaTJjIGNvbnRyb2xsZXJzLiBUaGlzIGxvdyBwYXNz
IGZpbHRlciBpcyB1c2VkIHRvIGZpbHRlcg0KPiBvdXQgaGlnaCBmcmVxdWVuY3kgbm9pc2Ugb24g
dGhlIGkyYyBsaW5lcy4gU3BlY2lmaWVkIGluIEh6Lg0KPiBJbmNsdWRlIHRoZXNlIHByb3BlcnRp
ZXMgaW4gdGhlIHRpbWluZ3Mgc3RydWN0dXJlIGFuZCByZWFkIHRoZW0gYXMgaW50ZWdlcnMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hp
cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIHwgNiArKysrKysN
Cj4gIGluY2x1ZGUvbGludXgvaTJjLmggICAgICAgICB8IDYgKysrKysrDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9p
MmMtY29yZS1iYXNlLmMgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gaW5kZXggOWM0
NDBmYS4uYzlmY2IxNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5j
DQo+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiBAQCAtMTY1OCw2ICsxNjU4
LDEyIEBAIHZvaWQgaTJjX3BhcnNlX2Z3X3RpbWluZ3Moc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgaTJjX3RpbWluZ3MgKnQsIGJvb2wgdXNlX2RlDQo+ICAJCXQtPnNkYV9mYWxsX25zID0gdC0+
c2NsX2ZhbGxfbnM7DQo+ICANCj4gIAlkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAiaTJj
LXNkYS1ob2xkLXRpbWUtbnMiLCAmdC0+c2RhX2hvbGRfbnMpOw0KPiArDQo+ICsJZGV2aWNlX3By
b3BlcnR5X3JlYWRfdTMyKGRldiwgImkyYy1kaWdpdGFsLWZpbHRlci13aWR0aC1ucyIsDQo+ICsJ
CQkJICZ0LT5kaWdpdGFsX2ZpbHRlcl93aWR0aF9ucyk7DQo+ICsNCj4gKwlkZXZpY2VfcHJvcGVy
dHlfcmVhZF91MzIoZGV2LCAiaTJjLWFuYWxvZy1maWx0ZXItY3V0b2ZmLWZyZXF1ZW5jeSIsDQo+
ICsJCQkJICZ0LT5hbmFsb2dfZmlsdGVyX2N1dG9mZl9mcmVxX2h6KTsNCj4gIH0NCj4gIEVYUE9S
VF9TWU1CT0xfR1BMKGkyY19wYXJzZV9md190aW1pbmdzKTsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9pMmMuaCBiL2luY2x1ZGUvbGludXgvaTJjLmgNCj4gaW5kZXggZmE1NTUy
Yy4uMjZjZTE0MyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9pMmMuaA0KPiArKysgYi9p
bmNsdWRlL2xpbnV4L2kyYy5oDQo+IEBAIC01NzUsNiArNTc1LDEwIEBAIHN0cnVjdCBpMmNfbG9j
a19vcGVyYXRpb25zIHsNCj4gICAqIEBzY2xfaW50X2RlbGF5X25zOiB0aW1lIElQIGNvcmUgYWRk
aXRpb25hbGx5IG5lZWRzIHRvIHNldHVwIFNDTCBpbiBucw0KPiAgICogQHNkYV9mYWxsX25zOiB0
aW1lIFNEQSBzaWduYWwgdGFrZXMgdG8gZmFsbCBpbiBuczsgdChmKSBpbiB0aGUgSTJDIHNwZWNp
ZmljYXRpb24NCj4gICAqIEBzZGFfaG9sZF9uczogdGltZSBJUCBjb3JlIGFkZGl0aW9uYWxseSBu
ZWVkcyB0byBob2xkIFNEQSBpbiBucw0KPiArICogQGRpZ2l0YWxfZmlsdGVyX3dpZHRoX25zOiB3
aWR0aCBpbiBucyBvZiBzcGlrZXMgb24gaTJjIGxpbmVzIHRoYXQgdGhlIElQIGNvcmUNCj4gKyAq
CQkJICAgICBkaWdpdGFsIGZpbHRlciBjYW4gZmlsdGVyIG91dA0KPiArICogQGFuYWxvZ19maWx0
ZXJfY3V0b2ZmX2ZyZXFfaHo6IHRocmVzaG9sZCBmcmVxdWVuY3kgZm9yIHRoZSBsb3cgcGFzcyBJ
UCBjb3JlDQo+ICsJCQkgICAgICBhbmFsb2cgZmlsdGVyDQoNClRoZSBpbmRlbnRhdGlvbiBpcyBh
IGxpdHRsZSBiaXQgZXhjZXNzaXZlIGFuZCBhbHNvIG9mZi4gT3RoZXIgY29tbWVudHMgaW4gdGhl
DQpmaWxlIGp1c3QgdXNlcyBhIHNpbmdsZSB0YWIgYWZ0ZXIgdGhlIGFzdGVyaXNrIGluIHRoaXMg
c2NlbmFyaW8uIEFsc28sIHRoZSBsYXN0DQpvZiB0aGUgbmV3IGxpbmVzIGlzIG1pc3NpbmcgdGhh
dCBsZWFkaW5nIGFzdGVyaXNrLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICAgKi8NCj4gIHN0cnVj
dCBpMmNfdGltaW5ncyB7DQo+ICAJdTMyIGJ1c19mcmVxX2h6Ow0KPiBAQCAtNTgzLDYgKzU4Nyw4
IEBAIHN0cnVjdCBpMmNfdGltaW5ncyB7DQo+ICAJdTMyIHNjbF9pbnRfZGVsYXlfbnM7DQo+ICAJ
dTMyIHNkYV9mYWxsX25zOw0KPiAgCXUzMiBzZGFfaG9sZF9uczsNCj4gKwl1MzIgZGlnaXRhbF9m
aWx0ZXJfd2lkdGhfbnM7DQo+ICsJdTMyIGFuYWxvZ19maWx0ZXJfY3V0b2ZmX2ZyZXFfaHo7DQo+
ICB9Ow0KPiAgDQo+ICAvKioNCj4gDQoNCg==
