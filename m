Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB2410209A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 10:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfKSJdI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 04:33:08 -0500
Received: from mail-eopbgr50134.outbound.protection.outlook.com ([40.107.5.134]:46899
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725784AbfKSJdI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 04:33:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDs3+/qbrETWtfllW9ZhN9We1s9KfuD+yENM2kv3BDAt8FoOTUZfLPkjX3kEqwCbYL0fiDgb7iswNcGzqUpN+vxGjXWy6T75p1pWY1c6q3TlevbZgtuwHDSPQE9K/68hZs0ZyX4M/xDgRiNpqp5zqVRuba7AS6ex4QF/GxqqsrhrgIPtSuw0i0TS/ECmvYgDhIaKwsYxJb/VS+OVD2T7QP57usCef0UyQmNcKv79iO/LoO7QrCPKz12b9S1Cea1dNPpu+jaLZW4vekJFBLeGExLPjguWvynKQCGptSogdULEFlm2WAGJVuba7zVQXgAKO3Efr+Ielg8GYlUTVlDYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNjEioAx2prqwQf1AYVuUvtFgRUGS9O5eyv5PNvAakk=;
 b=Lb1X40zxmEedfWwM1+bAIUS1/043tH1GQFTceYEtMnnWY4Ej3MrYY8fx6Aq4Vg8YdS0X29/nOxIy9fymQ9Y8e5rmc3UbfG0M00v/EdCbPcW10/0qhnSwyi//uXTLUTOKTac0A5YrplQHGR3iWhc+mh+l07kcW6doAsB2/4FPEVvae1h67rnSfuVvml29vMee4dgDQK7Yog5r+BYE9oF69R7Q24RqJEz8jBNqlO3VuMbuw6eLjgmgcKSlF7kTkGY+ZSeFjz2XbiZ3P8aHTMbR6cFpjE69sJX85X/7TaP4DorEONi/31bO7RhQmfT5fxZvSUddVCyRiBUZwdq9OEeTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNjEioAx2prqwQf1AYVuUvtFgRUGS9O5eyv5PNvAakk=;
 b=SI13HTKkvXpmnBzzj0VXqimXztdP40IdC+h3cO8jFDgpNLBuvQYLNWbGecoGnJugtrQdCh/MwArXkOVBAFOp1u63PEuocs+n+kWvfibcBZLSqDoAZlHB8la/i3M8hCAbC7LmUGfBZ592HZjx5KnGnOFkCogkacXb8p91NMVovuM=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3400.eurprd02.prod.outlook.com (52.133.8.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Tue, 19 Nov 2019 09:33:02 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::dc43:ed2c:945a:cd5]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::dc43:ed2c:945a:cd5%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 09:33:02 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Lei YU <mine260309@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Thread-Topic: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Thread-Index: AQHVnrdKJrKxiOciCEaViJqC+aa9maeSOzkA
Date:   Tue, 19 Nov 2019 09:33:02 +0000
Message-ID: <a1444cbf-3a1d-6f17-97a9-77664a95d304@axentia.se>
References: <1574153778-59977-1-git-send-email-mine260309@gmail.com>
In-Reply-To: <1574153778-59977-1-git-send-email-mine260309@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0402CA0020.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::30) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a364abdc-9194-457c-512a-08d76cd37930
x-ms-traffictypediagnostic: AM6PR0202MB3400:
x-microsoft-antispam-prvs: <AM6PR0202MB34004C1D58D112627821A1B1BC4C0@AM6PR0202MB3400.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(376002)(366004)(39830400003)(396003)(189003)(199004)(25786009)(186003)(476003)(11346002)(446003)(2616005)(102836004)(53546011)(386003)(58126008)(486006)(6506007)(316002)(6512007)(110136005)(14444005)(4001150100001)(26005)(2501003)(6486002)(31686004)(5660300002)(256004)(8936002)(229853002)(6246003)(8676002)(66946007)(76176011)(66446008)(6436002)(81156014)(71190400001)(71200400001)(81166006)(508600001)(2201001)(64756008)(66556008)(66476007)(6116002)(14454004)(305945005)(99286004)(66066001)(65806001)(86362001)(2906002)(52116002)(7736002)(36756003)(3846002)(65956001)(31696002)(21314003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3400;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KipcN4aGC4d57Mq+V6fYFfT6sqxuGpBktIrkI+waUFLlvrdELGtauKkSvYYw62mQW1oiZyrbzlHBZHb2EQzYpMmuFDdYOGpXSQIHRzxs1etoaXnZWZWyf2prOQ8ZiPajUAy7OK2JvjBUhQQVaqdxjgqtzrG5cmFbVza0nK069f6VxT6IIJ6Aw1WAbwsKmnaZeS1HHrQNfKRBgqGhzpEBFP2T2Nj+Jh3kxn7TW2RmBxvTi3TlWwNTVLC8aJPOiKFjOtD52rq+a3f15H5/2cz1d2L0Vz3g0dXX4lEMPoYS1ZvNR/LoZn6ND0Ev7DefJh0kgCHiCgbUmn1h1Eml2nKrk4rB02jSODXEw54+R14tgsPtYCts3HUJnxQ5hCT8Cs8ZKA7psSdVQL1OeuUgu1TauS8mzT6hAIFgszmEgox95zy9XiiPpTOg7ObGSXvRBwRq
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DFE34F3793D764FA3CF8181BD721021@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a364abdc-9194-457c-512a-08d76cd37930
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 09:33:02.4932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuc0r4x3VmepkpiuYwCzHUYtbMSi434fzojivbI5B1bim6vQgIfo8oEV6iiHh9Uv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3400
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0xOSAwOTo1NiwgTGVpIFlVIHdyb3RlOg0KPiBJbiBpMmMvZGV2LWludGVyZmFj
ZS5yc3QgaXQgc2FpZA0KPiANCj4+IEFsbCB0aGVzZSB0cmFuc2FjdGlvbnMgcmV0dXJuIC0xIG9u
IGZhaWx1cmUNCj4gDQo+IEJ1dCBhY3R1YWxseSB0aGUgaTJjX3NtYnVzX3h4eCBmdW5jdGlvbnMg
cmV0dXJuIG5lZ2F0aXZlIGVycm9yIG51bWJlcnMNCj4gb24gZmFpbHVyZSwgaW5zdGVhZCBvZiAt
MS4NCj4gDQo+IEZpeCB0aGUgZG9jdW1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMZWkgWVUg
PG1pbmUyNjAzMDlAZ21haWwuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vaTJjL2Rldi1p
bnRlcmZhY2UucnN0IHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vaTJjL2Rl
di1pbnRlcmZhY2UucnN0IGIvRG9jdW1lbnRhdGlvbi9pMmMvZGV2LWludGVyZmFjZS5yc3QNCj4g
aW5kZXggNjljMjNhMy4uNzNiNzdjMyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9pMmMv
ZGV2LWludGVyZmFjZS5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9pMmMvZGV2LWludGVyZmFj
ZS5yc3QNCj4gQEAgLTE2Myw4ICsxNjMsOCBAQCBmb3IgZGV0YWlscykgdGhyb3VnaCB0aGUgZm9s
bG93aW5nIGZ1bmN0aW9uczo6DQo+ICAgIF9fczMyIGkyY19zbWJ1c193cml0ZV9ibG9ja19kYXRh
KGludCBmaWxlLCBfX3U4IGNvbW1hbmQsIF9fdTggbGVuZ3RoLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX3U4ICp2YWx1ZXMpOw0KPiAgDQo+IC1BbGwgdGhlc2UgdHJh
bnNhY3Rpb25zIHJldHVybiAtMSBvbiBmYWlsdXJlOyB5b3UgY2FuIHJlYWQgZXJybm8gdG8gc2Vl
DQo+IC13aGF0IGhhcHBlbmVkLiBUaGUgJ3dyaXRlJyB0cmFuc2FjdGlvbnMgcmV0dXJuIDAgb24g
c3VjY2VzczsgdGhlDQo+ICtBbGwgdGhlc2UgdHJhbnNhY3Rpb25zIHJldHVybiBuZWdhdGl2ZSB2
YWx1ZSBvbiBmYWlsdXJlOyB5b3UgY2FuIHJlYWQgZXJybm8gdG8NCj4gK3NlZSB3aGF0IGhhcHBl
bmVkLiBUaGUgJ3dyaXRlJyB0cmFuc2FjdGlvbnMgcmV0dXJuIDAgb24gc3VjY2VzczsgdGhlDQoN
CnMvcmV0dXJuIG5lZ2F0aXZlL3JldHVybiBhIG5lZ2F0aXZlLw0KDQpBbmQgdGhlIGxpbmUgaXMg
bm93IHRvbyBsb25nIGNvbXBhcmVkIHRvIHRoZSByZXN0IG9mIHRoZSB0ZXh0LCBzbyB5b3UNCm5l
ZWQgdG8gcmV3cmFwIHRoZSBwYXJhZ3JhcGguDQoNCkFuZCB3aHkgZG8geW91IG5lZWQgdG8gZGln
IGFyb3VuZCBpbiBlcnJubyBpZiB0aGUgbmVnYXRpdmUgZXJybm8gaGFzDQphbHJlYWR5IGJlZW4g
cmV0dXJuZWQ/DQoNCj4gICdyZWFkJyB0cmFuc2FjdGlvbnMgcmV0dXJuIHRoZSByZWFkIHZhbHVl
LCBleGNlcHQgZm9yIHJlYWRfYmxvY2ssIHdoaWNoDQo+ICByZXR1cm5zIHRoZSBudW1iZXIgb2Yg
dmFsdWVzIHJlYWQuIFRoZSBibG9jayBidWZmZXJzIG5lZWQgbm90IGJlIGxvbmdlcg0KPiAgdGhh
biAzMiBieXRlcy4NCj4gDQoNCkhtbSwgdW5yZWxhdGVkLCBidXQgc2hvdWxkIHRoYXQgcGVyaGFw
cyBiZSAibXVzdCBub3QiIGluc3RlYWQgb2YgIm5lZWQgbm90Ij8NCg0KQ2hlZXJzLA0KUGV0ZXIN
Cg==
