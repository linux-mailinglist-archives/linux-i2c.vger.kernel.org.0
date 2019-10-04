Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD6CCB489
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 08:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388306AbfJDGhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 02:37:37 -0400
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:6512
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388232AbfJDGhh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Oct 2019 02:37:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFk4EOAAV7sslLQsRAY79cjvABfMziCyDMO+l5oIKG5h9LQyaQ24zCQQpkXE9AR1RZaEgSI/QzIj7v1W0lmYjE5nyPAeE1Xcq/OnA2GvihRY1berxY148QGnrJIILgohkGstQyPoY7M4vUzqH2wmqYOBDUSTDXcxP9hvMHQZXKfExTRVSEYEALf34MzfxMlPNwm8YBajsjRPa9FaDP9r5lu3qECFEP6nFfh2uzqRDOXc+ln9tUZAgng0Y5iZ5ShQAeh79ygnsVXgCuPMLWFjPsZbeuOFxYtN9PAi5SvZqx9NypVz94iShTJwYmISWYE9Wwc+pb+Qzr7ba9+Yo1aEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsReQ3qF445DMWngaol/dlXaYHwn1zn5I4gzQyimXzw=;
 b=gU5rH9bgcYZqUKz0zIYRpspikTzK+s+42kxeI7+8FPD1VxXF57Gzup8G9dZ2CX16oLRxZjK5r+OBtixsrbi0LK+4MgWdAso0LJ5psh4rsVOafdj6l/OP7VqSnciJGY04nDzPQ/dlM6SRq8cGmiJ+PEod662g9mOu2rm+F0CRzP1dWCKjSp5icru0kHOUWKDUJtH4/vhDB1k+qwrB/iVnCUI9S0KcUROwV2XmlPDgers1g+4Z/LIa1IvCW9HXSO2L/mG+y2D44mPjYMNjVq3invcBXxQybvdBkJp0RbsHaui8K3I5OXHpE1ah/cLVtXiCKY4O3+WMOMGfiv7CqTFIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsReQ3qF445DMWngaol/dlXaYHwn1zn5I4gzQyimXzw=;
 b=e8jP9Mu1A5ZawMVhBHncWZkTzNqS9O6nwGuMHg1J0vE4ksikxdsIqBkaiZuMi1+m2ustIsl90B2SbZPCn9ArfOb8h4T9q0g0BgGfW5wBJ9lNdn6lwT0e9UFFqAz1/2csBWn1DCz/PxHMtW4VroSNAoVn2P8dLmCD5fsTYe4ZRZY=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3093.jpnprd01.prod.outlook.com (52.134.253.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 06:37:33 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 06:37:33 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: i2c: rcar: Add r8a774b1 support
Thread-Topic: [PATCH] dt-bindings: i2c: rcar: Add r8a774b1 support
Thread-Index: AQHVcqpSHM7YgJMz3Eqi6oDiZNhRqac96kIAgAABirCADCqmMA==
Date:   Fri, 4 Oct 2019 06:37:32 +0000
Message-ID: <OSBPR01MB2103AD1CECA6DCD0C1BCE067B89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569310377-24976-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXp_u-w9DMbmBZn3G99LexLuQyBR2hRA_0T8Wn130SsZg@mail.gmail.com>
 <OSBPR01MB2103237D77ECCD14A41EEFFAB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103237D77ECCD14A41EEFFAB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80a9db9a-a4a7-442f-9832-08d748955656
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB3093:|OSBPR01MB3093:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB30936853BCFF3948C3621E5CB89E0@OSBPR01MB3093.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(51914003)(199004)(189003)(8676002)(7696005)(478600001)(8936002)(76176011)(4326008)(53546011)(6246003)(81156014)(81166006)(71200400001)(71190400001)(102836004)(26005)(256004)(486006)(44832011)(446003)(476003)(25786009)(11346002)(7736002)(186003)(33656002)(305945005)(76116006)(99286004)(316002)(66446008)(14454004)(54906003)(64756008)(74316002)(66476007)(66556008)(66946007)(6506007)(9686003)(3846002)(6116002)(229853002)(66066001)(55016002)(6436002)(4744005)(86362001)(5660300002)(52536014)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3093;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rc6MlNNzA7JaKKfhJ7jszh6QGpUZhUGUYWlhc2HvJwhHv3qpy0dR7vv9Ccfg2ignAD/7COvT9qT7MnTKsbx9+492x3S4VssDkd2L9OCvxKUlUP9Fqy9Wk0yGTin11Rw+ercv39PFsJ0d9EkaBTos8Nz7kzt3WwIxpsDfuVhNIw8t21H8bcrL8wcHYjqf22j1CkqQI1FBLkaEdymBdkGNBKBvy3LDE2AOFiK4QE4X5p7sod+tZDdjmIW/ypr4nIgQgb3RkU+YIBq+q3v+PsV8jYe27uVvU7owCUBP+0F2tSxbP1yOuMFZ5p8fq+RAA2MhE20YtDpNOrdBTo9kTGTREYE1dMEOevzC3lVaaSrAntRqg5Rca5Kd1pvIUxDdGIy6zEinz0aSyge2GGANzBB/dQoab147ImNkI0z57tgp+8c=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a9db9a-a4a7-442f-9832-08d748955656
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 06:37:33.0148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uj3U0L+xMiNOLWn4VqXjtPG5Hh6ms30oEAhFXjMxgBaoQXbTki48ayOBqM+TdAtfmUch1EiHoHMWGp4blY2AsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3093
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KRG8geW91IHdhbnQgbWUgdG8gc2VuZCBWMj8gT3IgQXJlIHlvdSBoYXBw
eSB0byBmaXggdGhpcyB3aGlsZSBhcHBseWluZyB0aGlzIHBhdGNoIGFnYWluc3QgY2hhbmdlZCBm
aWxlIG5hbWU/IA0KDQpQbGVhc2UgbGV0IG1lIGtub3cuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4g
U3ViamVjdDogUkU6IFtQQVRDSF0gZHQtYmluZGluZ3M6IGkyYzogcmNhcjogQWRkIHI4YTc3NGIx
IHN1cHBvcnQNCj4gDQo+IEhpIEdlZXJ0LA0KPiANCj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2su
DQo+IA0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBpMmM6IHJjYXI6IEFk
ZCByOGE3NzRiMSBzdXBwb3J0DQo+ID4NCj4gPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCA5OjMz
IEFNIEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBE
b2N1bWVudCBSWi9HMk4gKFI4QTc3NEIxKSBJMkMgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSByZWxl
dmFudA0KPiA+ID4gZHJpdmVyIGR0LWJpbmRpbmdzLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+DQo+
ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtcmNhci50eHQg
fCAxICsNCj4gPg0KPiA+IEJUVywgdGhpcyBmaWxlIGhhcyBiZWVuIHJlbmFtZWQgdG8NCj4gPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMsaTJjLnR4dA0KPiAN
Cj4gT0suIFdpbGwgc2VuZCBWMiB3aXRoIHRoZSBhYm92ZSBmaWxlIGNoYW5nZS4NCj4gDQo+IFJl
Z2FyZHMsDQo+IEJpanUNCg==
