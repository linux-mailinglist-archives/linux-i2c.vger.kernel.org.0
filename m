Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25AB1CF94D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 14:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfJHMHq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 08:07:46 -0400
Received: from mail-eopbgr30128.outbound.protection.outlook.com ([40.107.3.128]:50190
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730199AbfJHMHq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Oct 2019 08:07:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBzO51g2Aix20XvV2ikgBsWjQf4juBXZKXiS6s+h4FGuTaUvoYKYZhSBZU15ul4UtvqHhAyAN6Y6ibYaXcElLomvnxDSZ8H0MOZJYvmjTbzWRb7wJSmnmfbht5oMrt+TqOgFJGT17jtzWBR+twoObiZ4VJvIMy+S2E9+3tTyTYJslzFdkQiwhxXpdyZJPP/TzC3IvTenitGhsjjaUoBedhHqOxHKnHT19SPDmXyuxG7nx4O9onPfJ4sXpyR3mUVIsWhqzekYCzE8nNv5Kntz7oVUQr0uyXfXDn/KfHKrk8Z6YdOjrA+jy+w0CnLMRJXu0mQtpyYGsPWI1E8WlYkmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYEiGsIfPxdGFdG02cIfVs2pZDD7LWoTDFJvbAoG34I=;
 b=SlnW5jSDnQ7F+vWOVNgcJ+enqGBPmrDg5DV6igpiEYyzjw523AtGNAPuErOPEfQKeEx5c2OxEO93dBXeFkYBtXBm6fOwsdN1mwkX0Nb43RHzlVMX2fYTk4hDm9v3bofl1dhr6Py/VYWOTUIhXE3IcfSs/M1rHyPMDo+VOtpPZSLPG75T2FUCKi1B3vTJ9LREPAYk2Ax11jhJUFNglfZqo5/DMvM1e/lw7S5h3ThmymoEnVpd2JZLPuzPo4xBiPXnpN9CXrfcJ+w2vktsuKq9gKMe553MWd/965vUFZPXpjdONWST/OmLa5YiOiYSglX+bLBgbJ9Sm61d1X9dteBb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYEiGsIfPxdGFdG02cIfVs2pZDD7LWoTDFJvbAoG34I=;
 b=qvEcJhAE2OjvyX/k36+odmVnHYmEcpje7fNx8R8Yo9ksGlc/LUYlNC1JJhAlsYl5HF/+eBY3xopV6mdw8VeE4DhlTUhiDiDxpS1mHb5QGlc85xWtCrt5/0t+6agAMAkXdhENYy6FEqFc0TKfiOlqRMluH5tmIx5wZbg0aZ1kvPU=
Received: from AM0PR07MB4657.eurprd07.prod.outlook.com (52.135.145.14) by
 AM0PR07MB5233.eurprd07.prod.outlook.com (20.178.16.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.15; Tue, 8 Oct 2019 12:07:41 +0000
Received: from AM0PR07MB4657.eurprd07.prod.outlook.com
 ([fe80::c825:1956:bfa1:fcc9]) by AM0PR07MB4657.eurprd07.prod.outlook.com
 ([fe80::c825:1956:bfa1:fcc9%7]) with mapi id 15.20.2347.014; Tue, 8 Oct 2019
 12:07:41 +0000
From:   "Stepien, Slawomir (Nokia - PL/Wroclaw)" <slawomir.stepien@nokia.com>
To:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>,
        "Lewalski, Jakub (Nokia - PL/Wroclaw)" <jakub.lewalski@nokia.com>
Subject: [RFCv2] i2c: hold the core_lock for the whole execution of
 i2c_register_adapter()
Thread-Topic: [RFCv2] i2c: hold the core_lock for the whole execution of
 i2c_register_adapter()
Thread-Index: AQHVfdD8sceoYhN0R0CiS8BJensC6Q==
Date:   Tue, 8 Oct 2019 12:07:41 +0000
Message-ID: <20191008120737.GI20258@sstepien>
References: <20181204124514.GD20015@sstepien>
In-Reply-To: <20181204124514.GD20015@sstepien>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::13)
 To AM0PR07MB4657.eurprd07.prod.outlook.com (2603:10a6:208:6c::14)
x-originating-ip: [131.228.32.167]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=slawomir.stepien@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12da2350-d60a-4395-e73c-08d74be81e7f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR07MB5233:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR07MB5233C3FE5ECA65FA2D8359B6999A0@AM0PR07MB5233.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(189003)(199004)(76176011)(5660300002)(11346002)(7736002)(25786009)(86362001)(478600001)(2906002)(476003)(66574012)(81166006)(8936002)(81156014)(305945005)(256004)(1076003)(446003)(486006)(14454004)(8676002)(52116002)(14444005)(6436002)(6116002)(107886003)(186003)(6512007)(3846002)(9686003)(71200400001)(66946007)(71190400001)(66476007)(99286004)(66066001)(6486002)(6506007)(33716001)(386003)(110136005)(26005)(33656002)(64756008)(102836004)(66556008)(54906003)(66446008)(4326008)(2501003)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR07MB5233;H:AM0PR07MB4657.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VULihBV0UR9AiALz1itwUdBM+Zrq3j42F0mYVIC5Wabs8h92exwavdvkpPuhi1r+YVkLieTVr88BdxeWGdDI2efGHwIqaw0uLh97PmfHLvbTIx/IZ8LDevG/ro/g1yIfqOWQheCzr9sK9N+M3Lc36Z5WOWLGqHlN39IqHq1AbZn2zarWVQ7daBhBao/IV1uRRTM5KbBz8NAl93k+7WRsMFTHpu/rFVWt3gp+lU4J3GO85iD6eK2II3P3hH/A4arwF5ZxsNdFf1+QZwsdeN49JB4y3mkp15P8LeGgPVFzLeLrXZKm8zN83Gda0ZHHM7cMLgMUQodsbNpR3gp2EPq8Ck/NzCajJQp2ChRFcvAjPTKGJZwEGBtvEeQuRiVuvWQj1qFKkpNDd5txMJ3QPqjOsCPy+spp0T/aUspafEqy7OI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47068B7AB27B5648897FF71E06651797@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12da2350-d60a-4395-e73c-08d74be81e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 12:07:41.3738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWS3qCTfuRSqGFGuuxG1pyYo7YMX4qC7wFBw4FoAfZ0QvtSGCom0kUohLsOZmuAfRkhxY63KffT5+FFhipHP1i8gSZQApYqr2bzpA4vAyRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5233
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhlcmUgaXMgYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIHRoZSBpMmNfZ2V0X2FkYXB0ZXIoKSBh
bmQgdGhlDQppMmNfYWRkX2FkYXB0ZXIoKSBpZiB0aGlzIG11dGV4IGlzbid0IGhvbGQgZm9yIHRo
ZSB3aG9sZSBleGVjdXRpb24gb2YNCmkyY19yZWdpc3Rlcl9hZGFwdGVyKCkuDQoNCklmIHRoZSBt
dXRleCBpc24ndCBsb2NrZWQsIGl0IGlzIHBvc3NpYmxlIHRvIGZpbmQgaWRyIHRoYXQgcG9pbnRz
IHRvDQphZGFwdGVyIHRoYXQgaGFzbid0IGJlZW4gcmVnaXN0ZXJlZCB5ZXQgKGkuZS4gaXQncw0K
a29iai5zdGF0ZV9pbml0aWFsaXplZCBpcyBzdGlsbCBmYWxzZSksIHdoaWNoIHdpbGwgZW5kIHVw
IHdpdGggd2FybmluZw0KbWVzc2FnZToNCg0KIi4uLiBpcyBub3QgaW5pdGlhbGl6ZWQsIHlldCBr
b2JqZWN0X2dldCgpIGlzIGJlaW5nIGNhbGxlZC4iDQoNClRoaXMgcGF0Y2ggd2lsbCBjaGFuZ2Ug
aG93IHRoZSBsb2NraW5nIGlzIGFycmFuZ2VkIGFyb3VuZA0KaTJjX3JlZ2lzdGVyX2FkYXB0ZXIo
KSBjYWxsIGFuZCB3aWxsIHByZXZlbnQgc3VjaCBzaXR1YXRpb25zLiBUaGUgcGFydA0Kb2YgdGhl
IGkyY19yZWdpc3Rlcl9hZGFwdGVyKCkgdGhhdCBkbyBub3QgbmVlZCB0byBiZSB1bmRlciB0aGUg
bG9jayBoYXMNCmJlZW4gbW92ZWQgdG8gYSBuZXcgZnVuY3Rpb24gaTJjX3Byb2Nlc3NfYWRhcHRl
ci4NCg0KU2lnbmVkLW9mZi1ieTogU8WCYXdvbWlyIFN0xJlwaWXFhCA8c2xhd29taXIuc3RlcGll
bkBub2tpYS5jb20+DQotLS0NCnYxIC0+IHYyOg0KKiBhZGRlZCByZXR1cm4gMDsganVzdCBiZWZv
cmUgb3V0X3JlZyBsYWJlbC4NCi0tLQ0KIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyB8IDYz
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2kyYy9pMmMtY29yZS1iYXNlLmMgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCmluZGV4
IDVmNmE0OTg1ZjJiYy4uY2Y5YzVkMThhMjRjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pMmMvaTJj
LWNvcmUtYmFzZS5jDQorKysgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCkBAIC0xMzUy
LDYgKzEzNTIsMjMgQEAgc3RhdGljIGludCBpMmNfcmVnaXN0ZXJfYWRhcHRlcihzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmFkYXApDQogDQogCWRldl9kYmcoJmFkYXAtPmRldiwgImFkYXB0ZXIgWyVzXSBy
ZWdpc3RlcmVkXG4iLCBhZGFwLT5uYW1lKTsNCiANCisJcmV0dXJuIDA7DQorDQorb3V0X3JlZzoN
CisJaW5pdF9jb21wbGV0aW9uKCZhZGFwLT5kZXZfcmVsZWFzZWQpOw0KKwlkZXZpY2VfdW5yZWdp
c3RlcigmYWRhcC0+ZGV2KTsNCisJd2FpdF9mb3JfY29tcGxldGlvbigmYWRhcC0+ZGV2X3JlbGVh
c2VkKTsNCitvdXRfbGlzdDoNCisJaWRyX3JlbW92ZSgmaTJjX2FkYXB0ZXJfaWRyLCBhZGFwLT5u
cik7DQorCXJldHVybiByZXM7DQorfQ0KKw0KK3N0YXRpYyB2b2lkIGkyY19wcm9jZXNzX2FkYXB0
ZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKQ0KK3sNCisjaWZkZWYgQ09ORklHX0kyQ19DT01Q
QVQNCisJaW50IHJlczsNCisjZW5kaWYNCisNCiAJcG1fcnVudGltZV9ub19jYWxsYmFja3MoJmFk
YXAtPmRldik7DQogCXBtX3N1c3BlbmRfaWdub3JlX2NoaWxkcmVuKCZhZGFwLT5kZXYsIHRydWUp
Ow0KIAlwbV9ydW50aW1lX2VuYWJsZSgmYWRhcC0+ZGV2KTsNCkBAIC0xMzc4LDE4ICsxMzk1LDYg
QEAgc3RhdGljIGludCBpMmNfcmVnaXN0ZXJfYWRhcHRlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFk
YXApDQogCW11dGV4X2xvY2soJmNvcmVfbG9jayk7DQogCWJ1c19mb3JfZWFjaF9kcnYoJmkyY19i
dXNfdHlwZSwgTlVMTCwgYWRhcCwgX19wcm9jZXNzX25ld19hZGFwdGVyKTsNCiAJbXV0ZXhfdW5s
b2NrKCZjb3JlX2xvY2spOw0KLQ0KLQlyZXR1cm4gMDsNCi0NCi1vdXRfcmVnOg0KLQlpbml0X2Nv
bXBsZXRpb24oJmFkYXAtPmRldl9yZWxlYXNlZCk7DQotCWRldmljZV91bnJlZ2lzdGVyKCZhZGFw
LT5kZXYpOw0KLQl3YWl0X2Zvcl9jb21wbGV0aW9uKCZhZGFwLT5kZXZfcmVsZWFzZWQpOw0KLW91
dF9saXN0Og0KLQltdXRleF9sb2NrKCZjb3JlX2xvY2spOw0KLQlpZHJfcmVtb3ZlKCZpMmNfYWRh
cHRlcl9pZHIsIGFkYXAtPm5yKTsNCi0JbXV0ZXhfdW5sb2NrKCZjb3JlX2xvY2spOw0KLQlyZXR1
cm4gcmVzOw0KIH0NCiANCiAvKioNCkBAIC0xNDAxLDE1ICsxNDA2LDI0IEBAIHN0YXRpYyBpbnQg
aTJjX3JlZ2lzdGVyX2FkYXB0ZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKQ0KICAqLw0KIHN0
YXRpYyBpbnQgX19pMmNfYWRkX251bWJlcmVkX2FkYXB0ZXIoc3RydWN0IGkyY19hZGFwdGVyICph
ZGFwKQ0KIHsNCi0JaW50IGlkOw0KKwlpbnQgaWQsIHJldDsNCiANCiAJbXV0ZXhfbG9jaygmY29y
ZV9sb2NrKTsNCiAJaWQgPSBpZHJfYWxsb2MoJmkyY19hZGFwdGVyX2lkciwgYWRhcCwgYWRhcC0+
bnIsIGFkYXAtPm5yICsgMSwgR0ZQX0tFUk5FTCk7DQotCW11dGV4X3VubG9jaygmY29yZV9sb2Nr
KTsNCi0JaWYgKFdBUk4oaWQgPCAwLCAiY291bGRuJ3QgZ2V0IGlkciIpKQ0KKwlpZiAoV0FSTihp
ZCA8IDAsICJjb3VsZG4ndCBnZXQgaWRyIikpIHsNCisJCW11dGV4X3VubG9jaygmY29yZV9sb2Nr
KTsNCiAJCXJldHVybiBpZCA9PSAtRU5PU1BDID8gLUVCVVNZIDogaWQ7DQorCX0NCisNCisJcmV0
ID0gaTJjX3JlZ2lzdGVyX2FkYXB0ZXIoYWRhcCk7DQorCW11dGV4X3VubG9jaygmY29yZV9sb2Nr
KTsNCisNCisJaWYgKHJldCA8IDApDQorCQlyZXR1cm4gcmV0Ow0KIA0KLQlyZXR1cm4gaTJjX3Jl
Z2lzdGVyX2FkYXB0ZXIoYWRhcCk7DQorCWkyY19wcm9jZXNzX2FkYXB0ZXIoYWRhcCk7DQorDQor
CXJldHVybiAwOw0KIH0NCiANCiAvKioNCkBAIC0xNDI5LDcgKzE0NDMsNyBAQCBzdGF0aWMgaW50
IF9faTJjX2FkZF9udW1iZXJlZF9hZGFwdGVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCkNCiBp
bnQgaTJjX2FkZF9hZGFwdGVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlcikNCiB7DQogCXN0
cnVjdCBkZXZpY2UgKmRldiA9ICZhZGFwdGVyLT5kZXY7DQotCWludCBpZDsNCisJaW50IGlkLCBy
ZXQ7DQogDQogCWlmIChkZXYtPm9mX25vZGUpIHsNCiAJCWlkID0gb2ZfYWxpYXNfZ2V0X2lkKGRl
di0+b2Zfbm9kZSwgImkyYyIpOw0KQEAgLTE0NDIsMTMgKzE0NTYsMjIgQEAgaW50IGkyY19hZGRf
YWRhcHRlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIpDQogCW11dGV4X2xvY2soJmNvcmVf
bG9jayk7DQogCWlkID0gaWRyX2FsbG9jKCZpMmNfYWRhcHRlcl9pZHIsIGFkYXB0ZXIsDQogCQkg
ICAgICAgX19pMmNfZmlyc3RfZHluYW1pY19idXNfbnVtLCAwLCBHRlBfS0VSTkVMKTsNCi0JbXV0
ZXhfdW5sb2NrKCZjb3JlX2xvY2spOw0KLQlpZiAoV0FSTihpZCA8IDAsICJjb3VsZG4ndCBnZXQg
aWRyIikpDQorCWlmIChXQVJOKGlkIDwgMCwgImNvdWxkbid0IGdldCBpZHIiKSkgew0KKwkJbXV0
ZXhfdW5sb2NrKCZjb3JlX2xvY2spOw0KIAkJcmV0dXJuIGlkOw0KKwl9DQogDQogCWFkYXB0ZXIt
Pm5yID0gaWQ7DQogDQotCXJldHVybiBpMmNfcmVnaXN0ZXJfYWRhcHRlcihhZGFwdGVyKTsNCisJ
cmV0ID0gaTJjX3JlZ2lzdGVyX2FkYXB0ZXIoYWRhcHRlcik7DQorCW11dGV4X3VubG9jaygmY29y
ZV9sb2NrKTsNCisNCisJaWYgKHJldCA8IDApDQorCQlyZXR1cm4gcmV0Ow0KKw0KKwlpMmNfcHJv
Y2Vzc19hZGFwdGVyKGFkYXB0ZXIpOw0KKw0KKwlyZXR1cm4gMDsNCiB9DQogRVhQT1JUX1NZTUJP
TChpMmNfYWRkX2FkYXB0ZXIpOw0KIA0KLS0gDQpCZXN0IHJlZ2FyZHMNClPFgmF3b21pciBTdMSZ
cGllxYQNCg==
