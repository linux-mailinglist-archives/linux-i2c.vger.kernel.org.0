Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689BD6B9FB
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2019 12:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfGQKVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jul 2019 06:21:52 -0400
Received: from mail-eopbgr150040.outbound.protection.outlook.com ([40.107.15.40]:32674
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725873AbfGQKVw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jul 2019 06:21:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V03kG1Cf0fv7yoA0jf9gIqeDP3G8P8kjrtLKs117Cao85+zIRPih68kKTNI2yFxRgcgR8x0ya0WW6MVNH8gD1dtnrlbMI+kpg0Rl50XmXEPcMWryrKj/OWvQkOtnsl+cnb0XtniZ/bsCYlVahpf/HdYRouQMjvmKSmHkAmCMj3YdydXLL9H9I3mAf5kH43XwbFHI4rPLos+MVJn+dgn12WlQyRNmFJfi0iXNzff1L8mFWrxz7+YWWfMVRZElXVIhGaw/xcu6BQ2JSL32dsxfmJJ9evRKAeEEuUabEPtpYQfS7C6brF0iJ6H3X7435L+OZfMkEX0IGd0C2GkRuAfX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9j9YsTLIVstJLesTo3qPz2WaYhEd2PeuBWvILNqO6w=;
 b=YYrBKO7Oa9S17nEdcqy5ulVq23Vs0eV3jN1lxJznXoMif2Nk0by9ce9gEU6J/ppi43D9SedjNOfUh2zMnSJQMsT5dMQH/Hfz8QAJk67TDbhZi4ugkuA937AUIzSmNcjEihNluVPKwWrhQXbxEjKqsGZVYNrIVNDorRjOId4ItPdl9SAqTjVzgzvM0IDLKKJTR1TqWrdEr/s12zvyPHmuVwpfIkTHllUskUnF/DV+UVHQ5UO4WKJ3If1kDhGOmBPPuFl/5ggwZpHpqOBKHzFcvoMKOBZBJU5KPcryBgLYv5O+gul62QXylgtheRznAsbBYxxwKtWCT4WsG6zgemRHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9j9YsTLIVstJLesTo3qPz2WaYhEd2PeuBWvILNqO6w=;
 b=WuuUsnzMgP5N78XQpzjwI/E759bswKbSclhGXnVZUsuhdQRtehI8TKB3rsC8nc60LSjQrZdvIP3CpFvEvv+ck1wn093ry6vf6u7M6K7SIC4zMoZ4WCLATxY13UHcEkycpIRSSrJwO7rc9PtV3HfOjlIlwWeYnx8LyaOma8RO9CI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6306.eurprd04.prod.outlook.com (20.179.33.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 10:21:48 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 10:21:48 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] i2c: mxs: use devm_platform_ioremap_resource() to
 simplify code
Thread-Topic: [PATCH 1/2] i2c: mxs: use devm_platform_ioremap_resource() to
 simplify code
Thread-Index: AQHVPHyRBlijijTup0aiqRJOOQ662KbOmbdQ
Date:   Wed, 17 Jul 2019 10:21:47 +0000
Message-ID: <AM0PR04MB4211E8DCEC24D6D1D7848A6A80C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190717084017.30987-1-Anson.Huang@nxp.com>
In-Reply-To: <20190717084017.30987-1-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07f2dd7f-dba4-4328-ce68-08d70aa09373
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6306;
x-ms-traffictypediagnostic: AM0PR04MB6306:
x-microsoft-antispam-prvs: <AM0PR04MB6306B3D5EB1791A8B2A8F26D80C90@AM0PR04MB6306.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(81166006)(81156014)(446003)(74316002)(2501003)(7736002)(25786009)(64756008)(66946007)(66476007)(66556008)(66446008)(86362001)(8936002)(478600001)(68736007)(76116006)(316002)(8676002)(110136005)(53936002)(76176011)(55016002)(5660300002)(6436002)(3846002)(4326008)(6116002)(66066001)(33656002)(52536014)(7696005)(11346002)(476003)(14454004)(2906002)(71190400001)(44832011)(305945005)(486006)(71200400001)(9686003)(6246003)(229853002)(186003)(102836004)(26005)(6506007)(2201001)(256004)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6306;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YMPcApg77P3MGHLb7cBIx/WyTS5MbPOwieuEIQLzpQaa4VJSJC0PqcPNe9wAOhr0HhF2c2giuKjh6+hC7W1QxSA0fFdmhYjz6opAGjcZbV8DCQhQQu3Wt4tq6kuMD9wRihcdqPXThAm8Mt69rn+a1Z04GJ/U1pwfmFzb/tPjqtr/H0V8tvJsdSXVG3B70AaYTCUWktgUKI3itRidgemTlRKPp01XAWCV1hsKsPn2LSRPPhZ/1pyz5FbKwCci46CORV66KrIdtu1jCxkhSR73NLlyXtTMwb3yM4DlPJgUv+SltrX3o0JxTAYsEmoZ3YLteDUG18d7g5wjUXtZvAL2E0VE41zIbpNaCC2PnfBx4ViV9A5TKmxNH1bLCjCHUzXBQ/akTB/yY9Rh59x04IZpusKzVhT9kscFqrCz91RTxGg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f2dd7f-dba4-4328-ce68-08d70aa09373
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 10:21:48.0620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6306
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiBTZW50
OiBXZWRuZXNkYXksIEp1bHkgMTcsIDIwMTkgNDo0MCBQTQ0KPiANCj4gVXNlIHRoZSBuZXcgaGVs
cGVyIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHdoaWNoIHdyYXBzIHRoZQ0KPiBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBhbmQgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgdG9nZXRo
ZXIsIHRvIHNpbXBsaWZ5DQo+IHRoZSBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5zb24g
SHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcg
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gLS0tDQo+ICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW14cy5jIHwgNCArLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1teHMuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXhzLmMgaW5k
ZXgNCj4gN2Q3OTMxNy4uODkyMjQ5MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1teHMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW14cy5jDQo+IEBAIC04
MDIsNyArODAyLDYgQEAgc3RhdGljIGludCBteHNfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UNCj4gKnBkZXYpDQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4g
IAlzdHJ1Y3QgbXhzX2kyY19kZXYgKmkyYzsNCj4gIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXA7
DQo+IC0Jc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICAJaW50IGVyciwgaXJxOw0KPiANCj4gIAlp
MmMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmkyYyksIEdGUF9LRVJORUwpOyBAQCAtODE0
LDggKzgxMyw3DQo+IEBAIHN0YXRpYyBpbnQgbXhzX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCQlpMmMtPmRldl90eXBlID0gZGV2aWNlX2lkLT5kcml2ZXJfZGF0
YTsNCj4gIAl9DQo+IA0KPiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JF
U09VUkNFX01FTSwgMCk7DQo+IC0JaTJjLT5yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZw
ZGV2LT5kZXYsIHJlcyk7DQo+ICsJaTJjLT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlKHBkZXYsIDApOw0KPiAgCWlmIChJU19FUlIoaTJjLT5yZWdzKSkNCj4gIAkJcmV0dXJu
IFBUUl9FUlIoaTJjLT5yZWdzKTsNCj4gDQo+IC0tDQo+IDIuNy40DQoNCg==
