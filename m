Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C3817B0BD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 22:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgCEVev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 16:34:51 -0500
Received: from mail-eopbgr80091.outbound.protection.outlook.com ([40.107.8.91]:9369
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725991AbgCEVeu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 16:34:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaZnMLGS0aFt5Iu1Z+RQtCCIJs5p/ZN4G4vC8FvjpdTsrd4fdqyRoAE3aoY9DUKFzCYFFypTLyTRsanSDx6yGQJXwjF8yjrVXOa/64L0pUInHhiCzSWtviv58KUxSyIBACaIcueJ+OcAWWfMPieQq8assmI1jDYsclM6mPRruI9XaStL6g2Q7/+BWrTBQaoxB7uiW+2dazp/d0nYCp1OdcKqEqlu+ISziumE+RgKSexBjMOl1SWkpSuZAqqbjI38nqSkv4OkRZevnjpnXQ8PZHBxt+GC3BmagO1PL1luqm2kXno74Wv8KYCk7JLLjDEil55+V8r4IccZqBx0nqdrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPL+wBxsoevB2pYrOjq5PERe54nLhWk6F3/zI+Qg2Ao=;
 b=RrcFLinLRx0bQmAHVUVIHweuATnD/HDvMCZQ7wbb7zAYUeLRs37oG6a3NXvqi7oZyED/MBzlvKK9MF3s0p6dxo2+Sb6iM9rcOIlC7b3lpXjtmxANqk2PFAZ5g8vboq8mU0u74OeDQq6xKXJhM3ZtQGQr3QjtZk1w70Wd72UNzddIz7uCLFujc8h8pC7mFDOEPMF5NbDJaHtOl198OMv4f9M2t76Eg7Pics+2F0Pi9bFdr91AXOqex6jbAU2GfXRpj1rT/0x+Q7N0dIc0lKpbB9YL5ImfwYgi7zn6fXAwEng++Tg8L0d0ReTZh+aXRMTM1lnTEO0LRZuTQ8yIoPHUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPL+wBxsoevB2pYrOjq5PERe54nLhWk6F3/zI+Qg2Ao=;
 b=fC8RGjGsff3PsniRtfVf1mB7ygSdCY72dtJxJulfUSQytapjFUC4Eq7ACpPnycbVaJ611X+TAudbTTs4+Imen5LHhfNl79CKiUV1J4XxHsBAZPf8FONmQO8KJEK4z5Sqahqm29Fdr/AHNQcBI2XBVWCBMHgbFmzZovBroJkISN8=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3382.eurprd02.prod.outlook.com (52.133.8.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Thu, 5 Mar 2020 21:34:46 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71%7]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 21:34:46 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR0402CA0031.eurprd04.prod.outlook.com (2603:10a6:7:7c::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16 via Frontend Transport; Thu, 5 Mar 2020 21:34:46 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 1/5] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Thread-Topic: [PATCH v1 1/5] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Thread-Index: AQHV8wZIGiAOnEsGbUGSg0D4hVTui6g6hbYA
Date:   Thu, 5 Mar 2020 21:34:46 +0000
Message-ID: <31d8a07f-a841-d58b-ebc8-3cba39d00a95@axentia.se>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR0402CA0031.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::20) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a13c60c-de12-4518-ba46-08d7c14d069c
x-ms-traffictypediagnostic: AM6PR0202MB3382:
x-microsoft-antispam-prvs: <AM6PR0202MB3382860CD0D551286ED462E9BCE20@AM6PR0202MB3382.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(396003)(136003)(39830400003)(346002)(189003)(199004)(81166006)(66446008)(316002)(81156014)(8936002)(508600001)(31696002)(956004)(6486002)(2616005)(36756003)(86362001)(71200400001)(110136005)(5660300002)(52116002)(2906002)(186003)(66946007)(16526019)(31686004)(26005)(64756008)(53546011)(66556008)(66476007)(16576012)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3382;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zu1VhGCc6yFyq8KHHk26ieXtf+HxOOfaXD2FKANF1nQxDZAP4YjcU6a6IKqbl/yHuA90eh7axFfXyOdPicBNmkMYmNkDcDiyzhi9gJwb6aMBmLd3NWb91kDpqgdlhFmYSTVB1SAakx3CSzqekiFdaIb7W54Zw12WCmJQNPA1vEnlybYAxYrslj3R+hz3lbSyY+hphcwXX4x+7tpGVwG+KW+k7RpphTornEzTGgU7GP+nom3u9LiiWGHkqG4G+U8LbZlkZGKpeZY6K8Ct0/Zs3Wd1wkaCUhEE/9ir4qWj+/HK8xKdCiAAK3CXxSjoQp2p2q7h4gUfqeN2i67WFQ94u7zbVVgQyRBOgrKiVXIUTTZlagNCSVinZYnTB0csPfR+mhp1hKGvsMCM3bfSkAI09Jx+RLP7d4aeVP/lEiyjwxlXd2+YUn9+yGMkE9GpneYF
x-ms-exchange-antispam-messagedata: KN16Wk32Vy+g7rZv4atH4nZhwtJmYwcaefcpGgPgaTuCElpMprvrFi888FVeyKhB6RITP0BjiDlbkJqC+kioBS8WcoLPsjnrQ8HkYmditaSLlX31uWeMx26CNmmALUQbEmVfP4mM6dv3H0Q+jEaFBw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <60CC9B632C5F9C4F81EA93147F1CFDF4@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a13c60c-de12-4518-ba46-08d7c14d069c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 21:34:46.5110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXihFNP0PZDuD8hy+GqZbQD93g//JDPYdZliuKhN58g5pLNidAkAGjXMYm4mbKlZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3382
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNCk9uIDIwMjAtMDMtMDUgMTY6NTMsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gUmVm
YWN0b3IgcGNhOTU0eF9pcnFfaGFuZGxlcigpIHRvOg0KPiAgIC0gdXNlIGZvcl9lYWNoX3NldF9i
aXQoKSBtYWNybw0KPiAgIC0gdXNlIElSUV9SRVRWQUwoKSBtYWNybw0KPiANCj4gQWJvdmUgY2hh
bmdlIG1ha2VzIGNvZGUgZWFzeSB0byByZWFkIGFuZCB1bmRlcnN0YW5kLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgfCAxNyAr
KysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11
eC1wY2E5NTR4LmMgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiBpbmRl
eCBhMGQ5MjZhZTNmODYuLjgxOWZmOTVlNjRiYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMv
bXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11
eC1wY2E5NTR4LmMNCj4gQEAgLTMyNywyMSArMzI3LDE4IEBAIHN0YXRpYyBERVZJQ0VfQVRUUl9S
VyhpZGxlX3N0YXRlKTsNCj4gIHN0YXRpYyBpcnFyZXR1cm5fdCBwY2E5NTR4X2lycV9oYW5kbGVy
KGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gIHsNCj4gIAlzdHJ1Y3QgcGNhOTU0eCAqZGF0YSA9
IGRldl9pZDsNCj4gLQl1bnNpZ25lZCBpbnQgY2hpbGRfaXJxOw0KPiAtCWludCByZXQsIGksIGhh
bmRsZWQgPSAwOw0KPiArCXVuc2lnbmVkIGxvbmcgcGVuZGluZzsNCj4gKwlpbnQgcmV0LCBpOw0K
PiAgDQo+ICAJcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZShkYXRhLT5jbGllbnQpOw0KPiAgCWlm
IChyZXQgPCAwKQ0KPiAgCQlyZXR1cm4gSVJRX05PTkU7DQo+ICANCj4gLQlmb3IgKGkgPSAwOyBp
IDwgZGF0YS0+Y2hpcC0+bmNoYW5zOyBpKyspIHsNCj4gLQkJaWYgKHJldCAmIEJJVChQQ0E5NTRY
X0lSUV9PRkZTRVQgKyBpKSkgew0KPiAtCQkJY2hpbGRfaXJxID0gaXJxX2xpbmVhcl9yZXZtYXAo
ZGF0YS0+aXJxLCBpKTsNCj4gLQkJCWhhbmRsZV9uZXN0ZWRfaXJxKGNoaWxkX2lycSk7DQo+IC0J
CQloYW5kbGVkKys7DQo+IC0JCX0NCj4gLQl9DQo+IC0JcmV0dXJuIGhhbmRsZWQgPyBJUlFfSEFO
RExFRCA6IElSUV9OT05FOw0KPiArCXBlbmRpbmcgPSByZXQgPj4gUENBOTU0WF9JUlFfT0ZGU0VU
Ow0KPiArCWZvcl9lYWNoX3NldF9iaXQoaSwgJnBlbmRpbmcsIGRhdGEtPmNoaXAtPm5jaGFucykN
Cj4gKwkJaGFuZGxlX25lc3RlZF9pcnEoaXJxX2xpbmVhcl9yZXZtYXAoZGF0YS0+aXJxLCBpKSk7
DQo+ICsNCj4gKwlyZXR1cm4gSVJRX1JFVFZBTChwZW5kaW5nKTsNCg0KV2hhdCBpZiByZXQgaGFz
IHNvbWUgYml0IHNldCBhYm92ZSB0aGUgYml0IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGxhc3QgY2hh
bm5lbD8NCg0KTWF5YmUgdGhhdCdzIHNvbWVob3cgbm90IHBvc3NpYmxlLCBidXQgaWYgdGhhdCdz
IHRoZSBjYXNlIGl0J3Mgbm90IGFwcGFyZW50Lg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICB9DQo+
ICANCj4gIHN0YXRpYyBpbnQgcGNhOTU0eF9pcnFfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpp
ZGF0YSwgdW5zaWduZWQgaW50IHR5cGUpDQo+IA0K
