Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3CEA3A6D1
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 18:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbfFIQiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 12:38:01 -0400
Received: from mail-eopbgr30121.outbound.protection.outlook.com ([40.107.3.121]:35491
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728678AbfFIQiB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 9 Jun 2019 12:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EngMpKounZPzZ32Ch+Ck4ZFFgS/evJSip8KYe1nOlZw=;
 b=Tg5EmUYE64TeuLXo+AMqNPdL8tewMD6bxc/CKftnk4Ir1b1i61r3udvbesw5bdfeVYeEvQS9GkmKDny0J0emAhdL0XZr2pfzjU/szQ50AZYbSyV2gq57Q/lXAGSQWKw3Wcj2NqgOI76g5BZgAnth80wCm0cQKIODEYrxXTJqo0E=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3466.eurprd02.prod.outlook.com (52.134.72.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Sun, 9 Jun 2019 16:37:53 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1965.017; Sun, 9 Jun 2019
 16:37:53 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/34] treewide: simplify getting the adapter of an I2C
 client
Thread-Topic: [PATCH 00/34] treewide: simplify getting the adapter of an I2C
 client
Thread-Index: AQHVHelLRUjwurRB7Uaj1nj2qmlQFKaTh4UA
Date:   Sun, 9 Jun 2019 16:37:52 +0000
Message-ID: <661f1084-da4e-75f0-e632-335134932801@axentia.se>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0902CA0028.eurprd09.prod.outlook.com
 (2603:10a6:7:15::17) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de20f092-15a7-4702-8fc2-08d6ecf8d141
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3466;
x-ms-traffictypediagnostic: DB3PR0202MB3466:
x-microsoft-antispam-prvs: <DB3PR0202MB34662F819F80F0C79EA26E7CBC120@DB3PR0202MB3466.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 006339698F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(366004)(376002)(39830400003)(396003)(189003)(199004)(6246003)(65806001)(2501003)(66066001)(71200400001)(86362001)(6116002)(3846002)(31696002)(65826007)(71190400001)(5660300002)(4326008)(65956001)(66556008)(7416002)(64756008)(66446008)(256004)(66476007)(66946007)(73956011)(26005)(36756003)(25786009)(476003)(2616005)(14454004)(53936002)(6436002)(186003)(229853002)(8936002)(99286004)(52116002)(6512007)(6486002)(68736007)(53546011)(6506007)(386003)(11346002)(31686004)(446003)(64126003)(81166006)(81156014)(76176011)(110136005)(316002)(8676002)(7736002)(508600001)(74482002)(102836004)(2906002)(486006)(54906003)(58126008)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3466;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b5PbBXdfDmrxCUpaoqEeP2qIdv9epeSARFxp+Ctrw7uz8w0o/3OyFrDay2wEG0IkjivZIlW321ahRt3eTE1i9pomhJehCDP9vbTXa+1u7oAna0reWVUunYsM+PDK1jsxv8bVvTPfv0ICQHS1Y6GzIzOtBkUmsEBk8wVUiE4MmQ12KD8eD5IlPOo2Tc3H5wp9mS3zh3+1sor8Pjo86ZUKURBhUA3+LweyRO9UHQd30L9DZD6CbSLxtQRwP2WscT6Il6mG6V3FXQTnbDh3PGheCVZbdDVw+g2HZKemwzZ9JfFlArver5OvyyKXQay5CJ5CVglaNXjWGG+ThF/PWtn82KSdt+AKwv2Ood1U/sdTvUS5/6xTQkn5AF2vsHM04RBTIjPb3p/3yFAtK1f1vlQZdoZOcHO7Y+YO05XitWSJwc4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C55F5D15CFF4704BB7913C0E714412B0@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: de20f092-15a7-4702-8fc2-08d6ecf8d141
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2019 16:37:52.9651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3466
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0wOCAxMjo1NSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBXaGlsZSBwcmVwYXJp
bmcgYSByZWZhY3RvcmluZyBzZXJpZXMsIEkgbm90aWNlZCB0aGF0IHNvbWUgZHJpdmVycyB1c2Ug
YQ0KPiBjb21wbGljYXRlZCB3YXkgb2YgZGV0ZXJtaW5pbmcgdGhlIGFkYXB0ZXIgb2YgYSBjbGll
bnQuIFRoZSBlYXN5IHdheSBpcw0KPiB0byB1c2UgdGhlIGludGVuZGVkIHBvaW50ZXI6IGNsaWVu
dC0+YWRhcHRlcg0KPiANCj4gVGhlc2UgZHJpdmVycyBkbzoNCj4gCXRvX2kyY19hZGFwdGVyKGNs
aWVudC0+ZGV2LnBhcmVudCk7DQo+IA0KPiBUaGUgSTJDIGNvcmUgcG9wdWxhdGVzIHRoZSBwYXJl
bnQgcG9pbnRlciBhczoNCj4gCWNsaWVudC0+ZGV2LnBhcmVudCA9ICZjbGllbnQtPmFkYXB0ZXIt
PmRldjsNCj4gDQo+IE5vdyB0YWtlIGludG8gY29uc2lkZXJhdGlvbiB0aGF0DQo+IAl0b19pMmNf
YWRhcHRlcigmYWRhcHRlci0+ZGV2KTsNCj4gDQo+IGlzIGEgY29tcGxpY2F0ZWQgd2F5IG9mIHNh
eWluZyAnYWRhcHRlcicsIHRoZW4gd2UgY2FuIGV2ZW4gZm9ybWFsbHkNCj4gcHJvdmUgdGhhdCB0
aGUgY29tcGxpY2F0ZWQgZXhwcmVzc2lvbiBjYW4gYmUgc2ltcGxpZmllZCBieSB1c2luZw0KPiBj
bGllbnQtPmFkYXB0ZXIuDQo+IA0KPiBUaGUgY29udmVyc2lvbiB3YXMgZG9uZSB1c2luZyBhIGNv
Y2NpbmVsbGUgc2NyaXB0IHdpdGggc29tZSBtYW51YWwNCj4gaW5kZW50YXRpb24gZml4ZXMgYXBw
bGllZCBvbiB0b3AuDQo+IA0KPiBUbyBhdm9pZCBhIGJyb3duIHBhcGVyIGJhZyBtaXN0YWtlLCBJ
IGRvdWJsZSBjaGVja2VkIHRoaXMgb24gYSBSZW5lc2FzDQo+IFNhbHZhdG9yLVhTIGJvYXJkIChS
LUNhciBNM04pIGFuZCB2ZXJpZmllZCBib3RoIGV4cHJlc3Npb24gcmVzdWx0IGluIHRoZQ0KPiBz
YW1lIHBvaW50ZXIuIE90aGVyIHRoYW4gdGhhdCwgdGhlIHNlcmllcyBpcyBvbmx5IGJ1aWxkIHRl
c3RlZC4NCg0KU2ltaWxhciB0aGluZ3MgZ28gb24gaW46DQoNCmRyaXZlcnMvaHdtb24vbG05MC5j
DQpkcml2ZXJzL2xlZHMvbGVkcy1pczMxZmwzMTl4LmMNCmRyaXZlcnMvb2YvdW5pdHRlc3QuYw0K
DQpUaG9zZSBoYXZlIHRoaXMgcGF0dGVybjoNCg0KCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjbGll
bnQtPmRldjsNCglzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIgPSB0b19pMmNfYWRhcHRlcihk
ZXYtPnBhcmVudCk7DQoNCkFuZCBkcml2ZXJzL3J0Yy9ydGMtZm0zMTMwLmMgaGFzIGEgY291cGxl
IG9mIHRoZXNlOg0KDQoJdG1wID0gaTJjX3RyYW5zZmVyKHRvX2kyY19hZGFwdGVyKGZtMzEzMC0+
Y2xpZW50LT5kZXYucGFyZW50KSwNCgkJCS4uLik7DQoNCndoZXJlIGZtMzEzMC0+Y2xpZW50IGlz
IG9mIHR5cGUgInN0cnVjdCBpMmNfY2xpZW50ICoiDQoNCkNoZWVycywNClBldGVyDQo=
