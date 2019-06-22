Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9E84F3EA
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2019 07:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfFVFng (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jun 2019 01:43:36 -0400
Received: from mail-eopbgr150110.outbound.protection.outlook.com ([40.107.15.110]:60494
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726049AbfFVFng (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jun 2019 01:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYx8lzSEFxiZWquaPbPdT+spkyamtvyO1pcENqji5vc=;
 b=Fd0Sk/T3skNSscvT0BDYzBU9ike9Ba2TMC1U2CNuQInI3D/OPWE30l1MplKshSlkOiboEPvKe+bq577+S3wmzNICMrvZ8NtoVFYOqEpaCzEJm9QpEeuNlxy8oT5ttW3n+PLY+mkgOydyd+eUMa1ZUatIoT+rIRAzZPMUJaZmUrc=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sat, 22 Jun 2019 05:43:31 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1987.014; Sat, 22 Jun 2019
 05:43:31 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: use proper email address for ABI
 requests
Thread-Topic: [PATCH] i2c: mux: demux-pinctrl: use proper email address for
 ABI requests
Thread-Index: AQHVJ6MFBAaquTyPy0KI7KFZkxoMZKanK46A
Date:   Sat, 22 Jun 2019 05:43:31 +0000
Message-ID: <a6ec1426-71a9-b42b-afbb-4603d5bf07eb@axentia.se>
References: <20190620200147.1268-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190620200147.1268-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::12) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21d48b36-5841-481c-007e-08d6f6d48ece
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3404;
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-microsoft-antispam-prvs: <DB3PR0202MB3404B68ABF04CAB3034823F2BCE60@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(346002)(396003)(366004)(39830400003)(376002)(199004)(189003)(64126003)(14454004)(476003)(5660300002)(66946007)(71200400001)(71190400001)(229853002)(446003)(186003)(52116002)(53936002)(316002)(7736002)(64756008)(11346002)(2616005)(486006)(8676002)(53546011)(25786009)(66556008)(86362001)(256004)(73956011)(81156014)(6436002)(66446008)(66476007)(8936002)(6512007)(81166006)(386003)(6506007)(99286004)(76176011)(74482002)(6486002)(65806001)(102836004)(31696002)(26005)(65956001)(6246003)(305945005)(508600001)(6116002)(3846002)(66066001)(110136005)(2501003)(58126008)(36756003)(4326008)(2906002)(65826007)(68736007)(31686004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3404;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DtgysnKNmDxtpSLWRC8HQfFmUDPXnVfet4x3KQ9x1X4YyJeTnxcp86raRXWQPLl8C0Z1kdVsWbRqY+Fx4A7SVqwyAgBv3IVQ5ZIFquQRi5EnJpDmTgptotSn7aHdMzyLfsADZTHzxolzJNSA9ieZZ2Ob3nkO9Usvr9sHiTf2XAL+6MXjJdyokv5WRgQyIpnABbs2nDmCOdP/LnWJV5N7M8kL9n9asPK7axkhVs+HC2NiWyomOGARcLTzgeCatUYmRB/Q1dBShKmjXNSwYwyRIw0uF+ofSQZ6Ej4Xlk6T83UMGqmWAD1qsljBimytbAo2f0qtNskIsm+NtHlxFAcWkKZCePY7YbMNXn0XNTx2Hk9MXfjRk+eWrxVHo5VtVwsN5N4vn3VKgP6TCLK90SmIy3+XVj8ks/eRjbiVo/rHcbs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66806222E7B21A40B095C0A924A65B07@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d48b36-5841-481c-007e-08d6f6d48ece
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 05:43:31.0827
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

T24gMjAxOS0wNi0yMCAyMjowMSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBVc2UgbXkgY29tbWVy
Y2lhbCBhZGRyZXNzLCBub3QgbXkgY29tbXVuaXR5IG9uZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+IC0tLQ0K
PiANCj4gUGV0ZXIsIEknZCBhc3N1bWUgdGhpcyBnb2VzIHZpYSB5b3VyIHRyZWUgdW5sZXNzIHlv
dSBsZXQgbWUga25vdw0KPiBvdGhlcndpc2UuIFRoYW5rcyENCj4gDQo+ICBEb2N1bWVudGF0aW9u
L0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWkyYy1kZW11eC1waW5jdHJsIHwgNSArKystLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWky
Yy1kZW11eC1waW5jdHJsIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9y
bS1pMmMtZGVtdXgtcGluY3RybA0KPiBpbmRleCAzYzM1MTQ4MTVjZDUuLmQ2ZTBjM2JiNmJiZiAx
MDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1p
MmMtZGVtdXgtcGluY3RybA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2Zz
LXBsYXRmb3JtLWkyYy1kZW11eC1waW5jdHJsDQo+IEBAIC0xLDcgKzEsOCBAQA0KPiAgV2hhdDoJ
CS9zeXMvZGV2aWNlcy9wbGF0Zm9ybS88aTJjLWRlbXV4LW5hbWU+L2F2YWlsYWJsZV9tYXN0ZXJz
DQo+ICBEYXRlOgkJSmFudWFyeSAyMDE2DQo+ICBLZXJuZWxWZXJzaW9uOgk0LjYNCj4gLUNvbnRh
Y3Q6CVdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+DQo+ICtDb250YWN0OglXb2xmcmFt
IFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KPiArDQoNClN1cnBsdXMg
bmV3bGluZS4uLg0KDQpJIHJlbW92ZWQgdGhhdCwgYW5kIGFkZGVkIHRoZSBwYXRjaCB0byB0aGUg
aTJjLW11eC9mb3ItbmV4dCBicmFuY2guDQoNCkNoZWVycywNClBldGVyDQoNCj4gIERlc2NyaXB0
aW9uOg0KPiAgCQlSZWFkaW5nIHRoZSBmaWxlIHdpbGwgZ2l2ZSB5b3UgYSBsaXN0IG9mIG1hc3Rl
cnMgd2hpY2ggY2FuIGJlDQo+ICAJCXNlbGVjdGVkIGZvciBhIGRlbXVsdGlwbGV4ZWQgYnVzLiBU
aGUgZm9ybWF0IGlzDQo+IEBAIC0xMiw3ICsxMyw3IEBAIERlc2NyaXB0aW9uOg0KPiAgV2hhdDoJ
CS9zeXMvZGV2aWNlcy9wbGF0Zm9ybS88aTJjLWRlbXV4LW5hbWU+L2N1cnJlbnRfbWFzdGVyDQo+
ICBEYXRlOgkJSmFudWFyeSAyMDE2DQo+ICBLZXJuZWxWZXJzaW9uOgk0LjYNCj4gLUNvbnRhY3Q6
CVdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+DQo+ICtDb250YWN0OglXb2xmcmFtIFNh
bmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KPiAgRGVzY3JpcHRpb246DQo+
ICAJCVRoaXMgZmlsZSBzZWxlY3RzL3Nob3dzIHRoZSBhY3RpdmUgSTJDIG1hc3RlciBmb3IgYSBk
ZW11bHRpcGxleGVkDQo+ICAJCWJ1cy4gSXQgdXNlcyB0aGUgPGluZGV4PiB2YWx1ZSBmcm9tIHRo
ZSBmaWxlICdhdmFpbGFibGVfbWFzdGVycycuDQo+IA0KDQo=
