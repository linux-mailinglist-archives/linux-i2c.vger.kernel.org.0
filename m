Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE20378A85
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 13:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387674AbfG2L26 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 07:28:58 -0400
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:31621
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387576AbfG2L26 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jul 2019 07:28:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjr9i/pB9+r3GJCgOgGWx75+IqwL0YB9eymlU3xqhznh+bJAO0Qh6XeqeNkTr74CWyceL+BFj5qQywou2Q7FNkESMqWtbPiWLZSBnfh3QJhy75+iCF1YzqqnfMSK36+IDiQ7BAgsVF9+CvS3PEKHWuYjSnFt5+tXjbwh34m1JwiSB6ccm3wDWnavhnlhNYKGm/0kVtYJbKP+QuJsPPWR0XvqXStMP8EeMNe1OzQWeVUvdKYi9Q8X693gfQYNNUZNAD4ti57kUF0+0J8VLb5gDoxiIadG4yANau5UuKlZcApS8GF2CuqDSFAumBJ0DA5/tmjvYXYzvmM2WdyH/TTgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MINc0VhBvKrJc24VKWRhXBFDA67exo6KPx14IbQxDaI=;
 b=DkmrxFmoLpngEHwaUyLwlGH8g5BOfrMK/mI8/810Or3ga4mcPwRYQDYpJn/5s/11Wxk4GrLZwl9vtgDvMaWXPQaf72XbcGgo5iHzyrnTm94bd17t2UjgtmBb7hDEAZwroMRmsD5tZK9i39LpglQR8Pe8csaYfeHcmRb6ovCbBA7k2MILs/usDSf/ykCFRqKGpjjRYet4UvAmwKkdj9YPYNK9kGR68F/X0dJi5do9UMTIWxcunj/dQsa1iGE9kcQspNNpPNVDgSBcjQAOFJ3c34r05Xu9A8RWy0sTndHRzt8Kt01HAffBI5yixrECtqHl9Ycunh1kRN3FbJ8Bvn/6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MINc0VhBvKrJc24VKWRhXBFDA67exo6KPx14IbQxDaI=;
 b=HnX6P/1VsQKgJ3rOCpRe5QnMqojcCk1A0qLNGtrJwxzJTrjYBaO109CKNBol46dRLh+E++IwtQmU5vCw8bxKb7Rd6ZPxxBwWbLTsyn+5oKhHl0HXDZ8Z4L2H+baRZO/K2xQbGLwr2mkxvEjwBRCisE/UgEpR6tkZVdtOyNfXOWI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6225.eurprd04.prod.outlook.com (20.179.33.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 11:28:52 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::5553:29b6:d66c:6afe]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::5553:29b6:d66c:6afe%5]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 11:28:52 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Robin Gong <yibin.gong@nxp.com>
Subject: RE: REGRESSION: i2c-imx endlessly triggers clk warning
Thread-Topic: REGRESSION: i2c-imx endlessly triggers clk warning
Thread-Index: AQHVRf89o9wZbKkeSke6cICyeLdOaabhdTfA
Date:   Mon, 29 Jul 2019 11:28:52 +0000
Message-ID: <AM0PR04MB4211E3811826ADCA85F0FD0280DD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190729111720.GV1330@shell.armlinux.org.uk>
In-Reply-To: <20190729111720.GV1330@shell.armlinux.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d271ee0-65d9-4211-1217-08d71417ef4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6225;
x-ms-traffictypediagnostic: AM0PR04MB6225:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB6225E81D960ECF8AF9B6618D80DD0@AM0PR04MB6225.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(51914003)(51234002)(189003)(199004)(44832011)(446003)(476003)(9686003)(55016002)(71200400001)(486006)(11346002)(53936002)(6306002)(110136005)(316002)(68736007)(6116002)(3846002)(71190400001)(7696005)(76176011)(33656002)(256004)(14444005)(5024004)(25786009)(102836004)(99286004)(26005)(6506007)(186003)(66066001)(6246003)(478600001)(52536014)(45080400002)(66476007)(66556008)(8936002)(6636002)(76116006)(74316002)(6436002)(966005)(86362001)(5660300002)(2906002)(8676002)(81156014)(81166006)(2501003)(66446008)(66946007)(64756008)(7736002)(14454004)(229853002)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6225;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9KqdCUx2r3CDkQ6diZgk3ljh6+6QgXqxI/YeHRSCimOiKC3XrVTjyUHvNJ3NKXhtkxSlt2rBerxKrH3NhTEh06vUwbFGi5gyIkjfSZ6P9k/p4QmL8Im9ilDSd9eKBkeRygJ4Yh+4ws5k2CXlEQMmkit7wKJtz3ECsVz9ID90t88THyRi7TEvoUMgGcFhSP0bpvZ7kV2qd1uVk759YaBV2GiHkHd3T5g7N5wEfwM6lf1PKEpR3zuG8WaMZWrjvSZDkRdoYAkl6SKu30jxaWU+qROzKIEjzzj95BMiGf6hb7GZV55d7Vy87ZOpvF7DhUMxKJ5FB6hhlawD9AjPQYpLa/Dvh/XGxLABYR/xhk5qXp64BJELpss70/6KDhSbGjMZfcdoiHL/nbFeSPa7hk0YhLasvWeI64yLp1/eVIjAM7o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d271ee0-65d9-4211-1217-08d71417ef4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 11:28:52.6554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6225
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDI5LCAyMDE5IDc6MTcgUE0NCj4gDQo+IEJvb3Rp
bmcgNS4yIG9uIHRoZSBWRjYxMCBiYXNlZCBaSUkgcmV2IEIgYm9hcmQgcmVzdWx0cyBpbiB0aGUg
Ym9hcmQgbm90IG1ha2luZw0KPiBwcm9ncmVzcyBkdWUgdG8gYW4gZW5kbGVzcyBzdHJlYW0gb2Y6
DQo+IA0KDQpUaGFua3MgZm9yIHRoZSByZXBvcnRpbmcuDQoNCj4gWyAgMTUzLjA3NzgzMV0gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tIFsgIDE1My4wODI1MjhdIFdBUk5JTkc6
IENQVToNCj4gMCBQSUQ6IDE1IGF0IGRyaXZlcnMvY2xrL2Nsay5jOjkyNCBjbGtfY29yZV9kaXNh
YmxlX2xvY2srMHgxOC8weDI0DQo+IFsgIDE1My4wOTMwNzddIGkyYzAgYWxyZWFkeSBkaXNhYmxl
ZCBbICAxNTMuMDk2NDE2XSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gWyAgMTUzLjA5OTUyMV0gQ1BV
OiAwIFBJRDogMTUgQ29tbToga3dvcmtlci8wOjEgVGFpbnRlZDogRyAgICAgICAgVw0KPiA1LjIu
MCsgIzMyMQ0KPiBbICAxNTMuMTA3MjkwXSBIYXJkd2FyZSBuYW1lOiBGcmVlc2NhbGUgVnlicmlk
IFZGNXh4L1ZGNnh4IChEZXZpY2UgVHJlZSkNCj4gWyAgMTUzLjExMzc3Ml0gV29ya3F1ZXVlOiBl
dmVudHMgZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jDQo+IFsgIDE1My4xMTg5NzldIFs8YzAwMTk1
NjA+XSAodW53aW5kX2JhY2t0cmFjZSkgZnJvbSBbPGMwMDE0NzM0Pl0NCj4gKHNob3dfc3RhY2sr
MHgxMC8weDE0KSBbICAxNTMuMTI2Nzc4XSBbPGMwMDE0NzM0Pl0gKHNob3dfc3RhY2spIGZyb20N
Cj4gWzxjMDgzZjhkYz5dIChkdW1wX3N0YWNrKzB4OWMvMHhkNCkgWyAgMTUzLjEzNDA1MV0gWzxj
MDgzZjhkYz5dDQo+IChkdW1wX3N0YWNrKSBmcm9tIFs8YzAwMzExNTQ+XSAoX193YXJuKzB4Zjgv
MHgxMjQpIFsgIDE1My4xNDEwNTZdDQo+IFs8YzAwMzExNTQ+XSAoX193YXJuKSBmcm9tIFs8YzAw
MzEyNDg+XSAod2Fybl9zbG93cGF0aF9mbXQrMHgzOC8weDQ4KQ0KPiBbICAxNTMuMTQ4NTgwXSBb
PGMwMDMxMjQ4Pl0gKHdhcm5fc2xvd3BhdGhfZm10KSBmcm9tIFs8YzA0MGZkZTA+XQ0KPiAoY2xr
X2NvcmVfZGlzYWJsZV9sb2NrKzB4MTgvMHgyNCkgWyAgMTUzLjE1NzQxM10gWzxjMDQwZmRlMD5d
DQo+IChjbGtfY29yZV9kaXNhYmxlX2xvY2spIGZyb20gWzxjMDU4ZjUyMD5dIChpMmNfaW14X3By
b2JlKzB4NTU0LzB4NmVjKQ0KPiBbICAxNTMuMTY2MDc2XSBbPGMwNThmNTIwPl0gKGkyY19pbXhf
cHJvYmUpIGZyb20gWzxjMDRiOTE3OD5dDQo+IChwbGF0Zm9ybV9kcnZfcHJvYmUrMHg0OC8weDk4
KSBbICAxNTMuMTc0Mjk3XSBbPGMwNGI5MTc4Pl0NCj4gKHBsYXRmb3JtX2Rydl9wcm9iZSkgZnJv
bSBbPGMwNGI3Mjk4Pl0gKHJlYWxseV9wcm9iZSsweDFkOC8weDJjMCkNCj4gWyAgMTUzLjE4MjYw
NV0gWzxjMDRiNzI5OD5dIChyZWFsbHlfcHJvYmUpIGZyb20gWzxjMDRiNzU1ND5dDQo+IChkcml2
ZXJfcHJvYmVfZGV2aWNlKzB4NWMvMHgxNzQpIFsgIDE1My4xOTA5MDldIFs8YzA0Yjc1NTQ+XQ0K
PiAoZHJpdmVyX3Byb2JlX2RldmljZSkgZnJvbSBbPGMwNGI1OGM4Pl0gKGJ1c19mb3JfZWFjaF9k
cnYrMHg0NC8weDhjKQ0KPiBbICAxNTMuMTk5NDgwXSBbPGMwNGI1OGM4Pl0gKGJ1c19mb3JfZWFj
aF9kcnYpIGZyb20gWzxjMDRiNzQ2Yz5dDQo+IChfX2RldmljZV9hdHRhY2grMHhhMC8weDEwOCkg
WyAgMTUzLjIwNzc4Ml0gWzxjMDRiNzQ2Yz5dIChfX2RldmljZV9hdHRhY2gpDQo+IGZyb20gWzxj
MDRiNjVhND5dIChidXNfcHJvYmVfZGV2aWNlKzB4ODgvMHg5MCkgWyAgMTUzLjIxNTk5OV0NCj4g
WzxjMDRiNjVhND5dIChidXNfcHJvYmVfZGV2aWNlKSBmcm9tIFs8YzA0YjZhMDQ+XQ0KPiAoZGVm
ZXJyZWRfcHJvYmVfd29ya19mdW5jKzB4NjAvMHg5MCkNCj4gWyAgMTUzLjIyNTAwM10gWzxjMDRi
NmEwND5dIChkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMpIGZyb20gWzxjMDA0ZjE5MD5dDQo+IChw
cm9jZXNzX29uZV93b3JrKzB4MjA0LzB4NjM0KSBbICAxNTMuMjM0MTc4XSBbPGMwMDRmMTkwPl0N
Cj4gKHByb2Nlc3Nfb25lX3dvcmspIGZyb20gWzxjMDA0ZjYxOD5dICh3b3JrZXJfdGhyZWFkKzB4
MjAvMHg0ODQpDQo+IFsgIDE1My4yNDIzMTVdIFs8YzAwNGY2MTg+XSAod29ya2VyX3RocmVhZCkg
ZnJvbSBbPGMwMDU1YzJjPl0NCj4gKGt0aHJlYWQrMHgxMTgvMHgxNTApIFsgIDE1My4yNDk3NThd
IFs8YzAwNTVjMmM+XSAoa3RocmVhZCkgZnJvbQ0KPiBbPGMwMDA5MGI0Pl0gKHJldF9mcm9tX2Zv
cmsrMHgxNC8weDIwKSBbICAxNTMuMjU3MDA2XSBFeGNlcHRpb24NCj4gc3RhY2soMHhkZGU0M2Zi
MCB0byAweGRkZTQzZmY4KQ0KPiBbICAxNTMuMjYyMDk1XSAzZmEwOiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMA0KPiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAw
MA0KPiBbICAxNTMuMjcwMzA2XSAzZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAwMDAwMA0KPiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCBbICAxNTMuMjc4NTIw
XSAzZmUwOiAwMDAwMDAwMCAwMDAwMDAwMA0KPiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAxMyAw
MDAwMDAwMCBbICAxNTMuMjg1MTU5XSBpcnEgZXZlbnQgc3RhbXA6DQo+IDMzMjMwMjIgWyAgMTUz
LjI4ODc4N10gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMzMyMzAyMSk6IFs8YzA4NjFjNGM+
XQ0KPiBfcmF3X3NwaW5fdW5sb2NrX2lycSsweDI0LzB4MmMgWyAgMTUzLjI5NzI2MV0gaGFyZGly
cXMgbGFzdCBkaXNhYmxlZCBhdA0KPiAoMzMyMzAyMik6IFs8YzA0MGQ3YTA+XSBjbGtfZW5hYmxl
X2xvY2srMHgxMC8weDEyNCBbICAxNTMuMzA1MzkyXQ0KPiBzb2Z0aXJxcyBsYXN0ICBlbmFibGVk
IGF0ICgzMzIyMDkyKTogWzxjMDAwYTUwND5dIF9fZG9fc29mdGlycSsweDM0NC8weDU0MA0KPiBb
ICAxNTMuMzEzMzUyXSBzb2Z0aXJxcyBsYXN0IGRpc2FibGVkIGF0ICgzMzIyMDgxKTogWzxjMDAz
ODVjMD5dDQo+IGlycV9leGl0KzB4MTBjLzB4MTI4IFsgIDE1My4zMjA5NDZdIC0tLVsgZW5kIHRy
YWNlIGE1MDY3MzFjY2Q5YmQ3MDMgXS0tLQ0KPiANCj4gTXkgZ3Vlc3MgaXMgdGhhdCB0aGlzIGlz
IGR1ZSB0byBhIGNvbWJpbmF0aW9uIG9mIGUxYWI5YTQ2OGUzYiAoImkyYzoNCj4gaW14OiBpbXBy
b3ZlIHRoZSBlcnJvciBoYW5kbGluZyBpbiBpMmNfaW14X2RtYV9yZXF1ZXN0KCkiKSBhbmQgdGhl
IGZhY3QgdGhhdA0KPiBteSBjb25maWd1cmF0aW9uIGhhcyBDT05GSUdfRlNMX0VETUE9bS4gIEdp
dmVuIHRoYXQgdGhlIGJvb3QgbWFrZXMgbm8NCj4gcHJvZ3Jlc3MsIGl0IHNlZW1zIHRoYXQgdGhp
cyBkcml2ZXIgbm93IHJlcXVpcmVzIEVETUEgdG8gYmUgYnVpbHQtaW4gX2lmXyB0aGlzDQo+IGRy
aXZlciBpcyBhbHNvIGJ1aWx0IGluLiAgSXQgc2VlbXMgdGhhdCBLY29uZmlnIGFsbG93cyBhbiBp
bnZhbGlkIGNvbmZpZ3VyYXRpb24gYXMNCj4gZmFyIGFzIHRoZSBkcml2ZXIgaXMgY29uY2VybmVk
Lg0KPiANCj4gSG93ZXZlciwgZXZlbiB0aG91Z2ggaXQgc2VlbXMgdGhhdCBFRE1BIG5lZWRzIHRv
IGJlIGJ1aWx0LWluIHdpdGggNS4yLCB0aGlzDQo+IHNob3VsZCBub3QgdHJpZ2dlciB0aGUgYWJv
dmUga2VybmVsIHdhcm5pbmcsIHdoaWNoIHN1Z2dlc3RzIHNvbWV0aGluZyBpcw0KPiB3cm9uZyBp
biB0aGUgZHJpdmVyIGNsZWFudXAgcGF0aHMuDQoNCkNvcHkgWWliaW4gdG8gY2hlY2sgdGhlIHBv
c3NpYmxlIGVkbWEgaXNzdWUuDQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiANCj4gLS0NCj4gUk1L
J3MgUGF0Y2ggc3lzdGVtOg0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ3d3cuYXINCj4gbWxpbnV4Lm9yZy51ayUyRmRl
dmVsb3BlciUyRnBhdGNoZXMlMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2Fpc2hlbmcuDQo+IGRvbmcl
NDBueHAuY29tJTdDZTNlNzA0ZDdkOTQxNGU4NjBjN2EwOGQ3MTQxNjVlYmMlN0M2ODZlYTFkM2IN
Cj4gYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNjk5OTk1ODYzMDU1OTAwMSZh
bXA7c2RhdGENCj4gPTJkMlRpMGdNTjJ2aTduNGhQcnNQWjJqR3cza3FTY1N0cVB6cEklMkJpRU9Y
WSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiBGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGlu
IHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2Jwcw0KPiB1cCBBY2NvcmRpbmcg
dG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwDQo=
