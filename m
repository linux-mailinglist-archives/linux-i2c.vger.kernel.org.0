Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657FE4F3F0
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2019 07:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfFVFs7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jun 2019 01:48:59 -0400
Received: from mail-eopbgr20136.outbound.protection.outlook.com ([40.107.2.136]:60267
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725932AbfFVFs6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jun 2019 01:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ9DDFGGCDcaC9IZxo/k0cJ74phhW1XPbWQclkTZUgo=;
 b=qWAHsbule6WmEkxg/Cv6igXKztAU48VKrbVOeQGnPSlkaF2TPKlYIylCd2O4evNNVGW8EN96D2GHSJyDL/SxvLATTTsEueImCi3XiYozr44dldibBeqMJR4hhkECm3khq1SKIjFpQXu/fMfA3ZVZk7pH/DZUJJ91MF8gSRYUVCA=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sat, 22 Jun 2019 05:48:55 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1987.014; Sat, 22 Jun 2019
 05:48:55 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v4] i2c: mux/i801: Switch to use descriptor passing
Thread-Topic: [PATCH v4] i2c: mux/i801: Switch to use descriptor passing
Thread-Index: AQHVJcUTnaH0ngKTLUCqa3jXlreqBaanMMyA
Date:   Sat, 22 Jun 2019 05:48:55 +0000
Message-ID: <ec0a5d1d-2a45-868c-c4e1-e3750ad6ebab@axentia.se>
References: <20190618105833.31933-1-linus.walleij@linaro.org>
In-Reply-To: <20190618105833.31933-1-linus.walleij@linaro.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9289052-c33a-4fcb-73be-08d6f6d54feb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3404;
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-microsoft-antispam-prvs: <DB3PR0202MB34040D80BD2103D9546BCE58BCE60@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(396003)(366004)(39830400003)(376002)(54164003)(199004)(189003)(64126003)(14454004)(476003)(5660300002)(66946007)(71200400001)(71190400001)(229853002)(446003)(186003)(52116002)(53936002)(316002)(7736002)(64756008)(11346002)(2616005)(486006)(8676002)(53546011)(25786009)(66556008)(86362001)(256004)(73956011)(81156014)(6436002)(66446008)(66476007)(8936002)(6512007)(81166006)(386003)(6506007)(99286004)(76176011)(74482002)(6486002)(65806001)(102836004)(31696002)(26005)(65956001)(6246003)(305945005)(508600001)(54906003)(6116002)(3846002)(66066001)(110136005)(2501003)(58126008)(36756003)(4326008)(2906002)(65826007)(68736007)(31686004);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3404;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Etzx7E8KLe7E8jW8kkryeHTYOlynQuZWc0+MKaLCrT6I0/wg743RuL7M1be1x5+BDXDD4p6KHk+Uh5yHMPcpbi0bwqOFS3qRWTR9d49sB6KNURIYvv4lPJXsCW/LjUdPKVpdHo+sH2JnQvKYfS9/LDx1TKp76UiKuaAbsoixpyBwIZI/sSks+3qOKdVPubd4LsV4MtzJDSu+KszoRmg7bQ2VJxM0J3ih6O3hQFnnwBvEC5W7NcqVEvgVYcer435yIXABWdNF80jTEgglbHl80JYj5RrvorqBpUy5Vl6DlhbNTr7FQa5JhOcqRcZS3KjNij3sotJsYzMRRupdOBtKoD3rkSJBQSYXXooTo1DIdtvMD3Z0yREf1X/0Hv74IdzuXzR77MGz3j8dScEgHdj39fY7GBPndQRCoHcJDVEOdPE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83BFBF1C42CE1443BD463737E3646EA9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d9289052-c33a-4fcb-73be-08d6f6d54feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 05:48:55.0720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3404
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0xOCAxMjo1OCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gVGhpcyBzd2l0Y2hl
cyB0aGUgaTgwMSBHUElPIG11eCB0byB1c2UgR1BJTyBkZXNjcmlwdG9ycyBmb3INCj4gaGFuZGxp
bmcgdGhlIEdQSU8gbGluZXMuIFRoZSBwcmV2aW91cyBoYWNrIHdoaWNoIHdhcyByZWFjaGluZw0K
PiBpbnNpZGUgdGhlIEdQSU8gY2hpcHMgZXRjIGNhbm5vdCBsaXZlIG9uLiBXZSBwYXNzIGRlc2Ny
aXB0b3JzDQo+IGFsb25nIHdpdGggdGhlIEdQSU8gbXV4IGRldmljZSBhdCBjcmVhdGlvbiBpbnN0
ZWFkLg0KPiANCj4gVGhlIEdQSU8gbXV4IHdhcyBvbmx5IHVzZWQgYnkgd2F5IG9mIHBsYXRmb3Jt
IGRhdGEgd2l0aCBhDQo+IHBsYXRmb3JtIGRldmljZSBmcm9tIG9uZSBwbGFjZSBpbiB0aGUga2Vy
bmVsOiB0aGUgaTgwMSBpMmMgYnVzDQo+IGRyaXZlci4gTGV0J3MganVzdCBhc3NvY2lhdGUgdGhl
IEdQSU8gZGVzY3JpcHRvciB0YWJsZSB3aXRoDQo+IHRoZSBhY3R1YWwgZGV2aWNlIGxpa2UgZXZl
cnlvbmUgZWxzZSBhbmQgZHluYW1pY2FsbHkgY3JlYXRlDQo+IGEgZGVzY3JpcHRvciB0YWJsZSBw
YXNzZWQgYWxvbmcgd2l0aCB0aGUgR1BJTyBpMmMgbXV4Lg0KPiANCj4gVGhpcyBlbmFibGVzIHNp
bXBsaWZpY2F0aW9uIG9mIHRoZSBHUElPIGkyYyBtdXggZHJpdmVyIHRvDQo+IHVzZSBvbmx5IHRo
ZSBkZXNjcmlwdG9yIEFQSSBhbmQgdGhlIE9GIHByb2JlIHBhdGggZ2V0cw0KPiBzaW1wbGlmaWVk
IGluIHRoZSBwcm9jZXNzLg0KPiANCj4gVGhlIGk4MDEgZHJpdmVyIHdhcyByZWdpc3RlcmluZyB0
aGUgR1BJTyBpMmMgbXV4IHdpdGgNCj4gUExBVEZPUk1fREVWSURfQVVUTyB3aGljaCB3b3VsZCBt
YWtlIGl0IGhhcmQgdG8gcHJlZGljdCB0aGUNCj4gZGV2aWNlIG5hbWUgYW5kIGFzc2lnbiB0aGUg
ZGVzY3JpcHRvciB0YWJsZSBwcm9wZXJseSwgYnV0DQo+IHRoaXMgc2VlbXMgdG8gYmUgYSBtaXN0
YWtlIHRvIGJlZ2luIHdpdGg6IGFsbCBvZiB0aGUNCj4gR1BJTyBtdXggZGV2aWNlcyBhcmUgaGFy
ZGNvZGVkIHRvIGxvb2sgdXAgR1BJTyBsaW5lcyBmcm9tDQo+IHRoZSAiZ3Bpb19pY2giIEdQSU8g
Y2hpcC4gSWYgdGhlcmUgYXJlIG1vcmUgdGhhbiBvbmUgbXV4LA0KPiB0aGVyZSBpcyBjZXJ0YWlu
bHkgbW9yZSB0aGFuIG9uZSBncGlvIGNoaXAgYXMgd2VsbCwgYW5kDQo+IHRoZW4gd2UgaGF2ZSBt
b3JlIHNlcmlvdXMgcHJvYmxlbXMuIFN3aXRjaCB0bw0KPiBQTEFURk9STV9ERVZJRF9OT05FIGlu
c3RlYWQuIFRoZXJlIGNhbiBiZSBvbmx5IG9uZS4NCj4gDQo+IENjOiBNaWthIFdlc3RlcmJlcmcg
PG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+DQo+IENjOiBBbmR5IFNoZXZjaGVua28g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFBldGVyIFJvc2luIDxw
ZWRhQGF4ZW50aWEuc2U+DQo+IENjOiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4N
Cg0KUGF0Y2ggYWRkZWQgdG8gdGhlIGkyYy1tdXgvZm9yLW5leHQgYnJhbmNoIHdpdGggdGhlIG5l
d2xpbmUNCnJlbW92ZWQgYXMgc3VnZ2VzdGVkIGJ5IEFuZHkuIFRoYW5rcyB0byBhbGwgaW52b2x2
ZWQgZm9yIHRoZQ0KZWZmb3J0IHRvIGdldCB0aGlzIGRvbmUhDQoNCltCVFcsIEFuZHksIEkgZG8g
bm90IHNlZW0gdG8gZ2V0IGFueSBtYWlscyBmcm9tIHlvdSBkZWxpdmVyZWQsDQphbmQgb25seSBu
b3RpY2VkIHlvdXIgcmV2aWV3IGJ5IGxvb2tpbmcgYXQgcGF0Y2h3b3JrLiBTdHJhbmdlXQ0KDQpD
aGVlcnMsDQpQZXRlcg0K
