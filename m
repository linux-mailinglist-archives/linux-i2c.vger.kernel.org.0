Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267B03C4B9
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 09:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403862AbfFKHMJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 03:12:09 -0400
Received: from mail-eopbgr30125.outbound.protection.outlook.com ([40.107.3.125]:14830
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403812AbfFKHMJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 03:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLtl7q2l3/2/9qNqIpMF1Nd3boE+0rqK76h287Avmsk=;
 b=E5Ye+SZnzAjES46335VZoKbWgxVKeN+JdPzN/Djif0JKPsub4yki+t+ZEnig20z1pjgk3cVc4qoD63mxjGQ8qelxkXkjweHg0MuBuM+kpgzV/hyuR8xzzD+id4BFpsu1u7XVsegjB9tRH+gHKimFAcE/D5teMe7bMS7s9wrojqA=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3449.eurprd02.prod.outlook.com (52.134.70.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 07:12:04 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 07:12:04 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Use struct_size() in devm_kzalloc()
Thread-Topic: [PATCH] i2c: mux: Use struct_size() in devm_kzalloc()
Thread-Index: AQHVFjppJkxbZTNnA02k/V7Ddxx96aaWHXiA
Date:   Tue, 11 Jun 2019 07:12:04 +0000
Message-ID: <a7851536-52dc-367e-ffc2-88f49f96bd00@axentia.se>
References: <20190529162014.GA27389@embeddedor>
In-Reply-To: <20190529162014.GA27389@embeddedor>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::28)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef84eb48-04a3-459b-7bc4-08d6ee3c1b11
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3449;
x-ms-traffictypediagnostic: DB3PR0202MB3449:
x-microsoft-antispam-prvs: <DB3PR0202MB34497C7673282A31A7AB6C1FBCED0@DB3PR0202MB3449.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(136003)(366004)(39830400003)(346002)(189003)(199004)(6116002)(2616005)(7736002)(229853002)(4744005)(65806001)(65956001)(5660300002)(71190400001)(53936002)(6246003)(3846002)(476003)(446003)(11346002)(68736007)(186003)(386003)(316002)(102836004)(6506007)(71200400001)(6486002)(6512007)(64126003)(6436002)(86362001)(486006)(66066001)(256004)(53546011)(31696002)(26005)(99286004)(66556008)(76176011)(74482002)(66446008)(64756008)(52116002)(73956011)(508600001)(36756003)(305945005)(31686004)(4326008)(66476007)(25786009)(54906003)(110136005)(65826007)(81156014)(81166006)(8936002)(8676002)(66946007)(14454004)(2906002)(58126008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3449;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ip/IscYbMbIZa/IX08xVJUgxg6ynZUCnmDHoX0DS6Zhr6oCR7Sl71S5Yg5t72m+R/3cMTyHT1/jDHFFjl5JqnyEm1KJR8t2TV+T2DVsohNFq1Z1yui06W9XQ4WqVzgRnTDO+YeVV67WGrw97RCYJTz+2I3UJCjJWJg8Mt53mqztlGdjhrOTYaTrpl+Nl79DggYdDZ0ARCAjS+Z71M+QTFUSBrykaiNlu/lSyEiagZUnZnXhZ+DosxJTE7fW38RNEaxsZMbM2WP/FyrzoSxJZEpGpiSWpgfonevdXVvfTP/5rlUDxomPA2pdojkQ3jGiz3mYmm+93ChTEy/CIUWSuH46A3B+TcRvkCkoyxW+/qjNgvq6K4VYgv4lS6rCkK+eQq2GDEYA9HYz4eQgW1INs9AlwjBfyPnl+iTQjcRIXcGY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB133A1904977940BF87507E3FC30B92@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ef84eb48-04a3-459b-7bc4-08d6ee3c1b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 07:12:04.3630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3449
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNS0yOSAxODoyMCwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4gT25lIG9m
IHRoZSBtb3JlIGNvbW1vbiBjYXNlcyBvZiBhbGxvY2F0aW9uIHNpemUgY2FsY3VsYXRpb25zIGlz
IGZpbmRpbmcNCj4gdGhlIHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNpemVk
IGFycmF5IGF0IHRoZSBlbmQsIGFsb25nDQo+IHdpdGggbWVtb3J5IGZvciBzb21lIG51bWJlciBv
ZiBlbGVtZW50cyBmb3IgdGhhdCBhcnJheS4gRm9yIGV4YW1wbGU6DQo+IA0KPiBzdHJ1Y3QgZm9v
IHsNCj4gICAgIGludCBzdHVmZjsNCj4gICAgIHN0cnVjdCBib28gZW50cnlbXTsNCj4gfTsNCj4g
DQo+IGluc3RhbmNlID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKHN0cnVjdCBmb28pICsgY291
bnQgKiBzaXplb2Yoc3RydWN0IGJvbyksIEdGUF9LRVJORUwpOw0KPiANCj4gSW5zdGVhZCBvZiBs
ZWF2aW5nIHRoZXNlIG9wZW4tY29kZWQgYW5kIHByb25lIHRvIHR5cGUgbWlzdGFrZXMsIHdlIGNh
bg0KPiBub3cgdXNlIHRoZSBuZXcgc3RydWN0X3NpemUoKSBoZWxwZXI6DQo+IA0KPiBpbnN0YW5j
ZSA9IGRldm1fa3phbGxvYyhkZXYsIHN0cnVjdF9zaXplKGluc3RhbmNlLCBlbnRyeSwgY291bnQp
LCBHRlBfS0VSTkVMKTsNCj4gDQo+IFRoaXMgY29kZSB3YXMgZGV0ZWN0ZWQgd2l0aCB0aGUgaGVs
cCBvZiBDb2NjaW5lbGxlLg0KDQpUaGFua3MsIHBhdGNoIGFwcGxpZWQgdG8gaTJjLW11eC9mb3It
bmV4dA0KDQpDaGVlcnMsDQpQZXRlcg0K
