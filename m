Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 819FF11C3CA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2019 04:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLLDJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Dec 2019 22:09:51 -0500
Received: from mail-eopbgr50046.outbound.protection.outlook.com ([40.107.5.46]:37699
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726647AbfLLDJu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Dec 2019 22:09:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/BOihJ9E6xLeiSdRplqs7X8lIm4e5jRmyavYYQOhBfNV6ZlRXuEsl4DpA1yNqABq58t8wiK0+H/M+pr8daARn4imi1fm2uBx7cdS50w5JUUItt5rXYAvE8t1xAbAfNO7s+DaZrCTeuahBAcBiA31jMwNYBEEzPWZoXdjCo1CMA5+IeoBWtTjBuavlgfBNWBQN/nGKyBAVjGwvmdaYsJ9pa0K17hmbBfubBoHf1nmOop68NwzPDKFcrq5L3M7491Cr0x7usYH6auFZLnYJJwj1ln93YZPl4cNzaqJnzSDJ5La2Vul/KZm5v5lo5+sO11ppMdzpHuMZ5vWcUKZbnGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvZy3qIKBF9Ow92mY3sRSdxEz92f0dKu9bZ72Yuq0F0=;
 b=LEDvCjLrFRyaKrNtG+yZNGSmqk1Mm8+36VRfKbfo0Vm6hwsjWDLaRa0iHgH5Nm4SfSinUFRpFpy+C4j9PFwbdiiW7AuLBqkMr3IFVxbTIPkfOhs/j1uTcJRFgZN41y4efSjcSTj+bDVITTekMV0+dooPI49jshnvbzeImCd10JtXDc99mWSn31XQGW11fTksq/czpeDjmJLmBDPLJhmJP5wQCDiDjsES7mhTYwIGrVWVCfOARB3ozQRYIjLF5rLDHHPIjLnW9ZGjwDeoSNrmjL8dd9fH1W9F1OMMu8L8kcb6ZbUytRQBD1c+irnl4bKbGWr5AynHdYUSmRG3OnC93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvZy3qIKBF9Ow92mY3sRSdxEz92f0dKu9bZ72Yuq0F0=;
 b=K3XCiBxKevXMvBoNgGMHH0zbwcIrtzU4NVQcZcFJzguH9KuqHN8S62NBAVjCuGPYFEWTS2NuiUdNfKwMjGHo8e+teUMcPUKbGSQca5fAkacFahd5b2/6YEDZOLytb/6YBuKkySc6XhTzSLacY+suAKnn0WUYaLyZcs8ro0SUREM=
Received: from VI1PR04MB4431.eurprd04.prod.outlook.com (20.177.55.205) by
 VI1PR04MB6877.eurprd04.prod.outlook.com (52.133.245.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 12 Dec 2019 03:09:32 +0000
Received: from VI1PR04MB4431.eurprd04.prod.outlook.com
 ([fe80::c947:5ae7:2a68:a4f2]) by VI1PR04MB4431.eurprd04.prod.outlook.com
 ([fe80::c947:5ae7:2a68:a4f2%3]) with mapi id 15.20.2538.017; Thu, 12 Dec 2019
 03:09:32 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Abel Vesa <abel.vesa@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Bogdan Florin Vlad <bogdan.vlad@nxp.com>,
        BOUGH CHEN <haibo.chen@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>, Han Xu <han.xu@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Jun Li <jun.li@nxp.com>, Leo Zhang <leo.zhang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Mircea Pop <mircea.pop@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Robin Gong <yibin.gong@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Ying Liu <victor.liu@nxp.com>,
        Zening Wang <zening.wang@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
Thread-Topic: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
Thread-Index: AQHVpPH7P18PyO0DCUWpmTSTyww0uaegXQmAgBRv36CAAAjvgIAABFvAgAAMDQCAAPGv4A==
Date:   Thu, 12 Dec 2019 03:09:32 +0000
Message-ID: <VI1PR04MB4431DF2E270FC45A6CC878A9ED550@VI1PR04MB4431.eurprd04.prod.outlook.com>
References: <20191127071136.5240-1-peng.ma@nxp.com>
 <20191128100613.GI25745@shell.armlinux.org.uk>
 <VI1PR04MB4431CF7F051F9439C84F84FAED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211104347.GA25745@shell.armlinux.org.uk>
 <VI1PR04MB44313AA19A4F81BA1AD9BC5CED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211114230.GC25745@shell.armlinux.org.uk>
In-Reply-To: <20191211114230.GC25745@shell.armlinux.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8bd5921c-37f0-49de-8a36-08d77eb0b5a1
x-ms-traffictypediagnostic: VI1PR04MB6877:|VI1PR04MB6877:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB68770347B5A67F77FD406186ED550@VI1PR04MB6877.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(13464003)(199004)(189003)(71200400001)(8676002)(81166006)(55016002)(64756008)(81156014)(478600001)(66446008)(6916009)(8936002)(2906002)(30864003)(316002)(45080400002)(6506007)(86362001)(9686003)(66556008)(54906003)(33656002)(186003)(52536014)(7696005)(76116006)(4326008)(44832011)(66946007)(5660300002)(66476007)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6877;H:VI1PR04MB4431.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ks9aXSw5sGyR61OXx70qkvEbvY/wvLXHgiHNZPdSP5SmihpZwVpAwE81WX5IJdFHymnfK4EsK/HGWbyMTCMR27bXo4R6jt4JrnW80MSPIJE97Aa459N7xGkZSIrItHBV8T+sIs+ur4qd8sXOb4xZe9Tpmw+55+o2Ek6jTNh8dp+sZHnO1rRXcVJ/gXiZiei7n6BFeIEDNeIoAnjD848/M8Jhd/H27hfmYM1ScR4N56qC9y2Omj9/p5akVSKleZizFdfgunFYOnMLrHT6PCp7OBN5BnuPPWovya1G+TxYgKu55PING/DT8/mHpG/t8DLWDuQ1O/AzigZ4vdf6zAuz2ueQmC2vW8xAuZhBvk6KriKCPQr3RZWSNmEwVrfGoZTbR34ezHSWN/b3PcuKMz2nDo7uaeDXuUlwftrUTGrEWv5n4lztIr3iyc36+Vt5y4JvwNoWpIYvhyGati3f3gJOr2jV2FF3zOSoEqeks8nII00seAc4o8cGbJZRNwEknRpDoaWwO/lQ92o1XqXZ+Gro4pFVc41iQdKYscKLoc5HVJQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd5921c-37f0-49de-8a36-08d77eb0b5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 03:09:32.0525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: psIzmvVqn7SC2iDjFTBfcn/wr7/D6+S8Rept83njBgVJj0rZa4ZHhqjWB74oF7l1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gUnVzc2VsbCwNCg0KVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91ciBzdHJpY3QgZ3VpZGFu
Y2UgYW5kIGNvbW1lbnRzLg0KSSByZWFsaXplZCBpdCBpcyBoYXJkIHRvIHVzIHRoYXQgd2Ugd2Fu
dCB0byBpMmMgdXNlZCBlZG1hIHdoZW4gZWRtYQ0KcHJvYmUgYWZ0ZXIgaTJjIHByb2JlLiBJIGxv
b2sgZm9yd2FyZCB0byBkaXNjdXNzaW5nIHdpdGggeW91IGFzIGJlbG93LCBpZiB5b3UgbGlrZS4N
ClRoYW5rcy4NCg0KWW91IHNheSBJIGNvdWxkIGRvIHRoaXM6DQoiU28sIGlmIHlvdSB3YW50IHRv
IGRvIHRoaXMgKGFuZCB5ZXMsIEknZCBhbHNvIGVuY291cmFnZSBpdCB0byBiZQ0KY29uZGl0aW9u
YWwgb24gRURNQSBiZWluZyBidWlsdC1pbiwgYXMgSTJDIGlzIGNvbW1vbmx5IHVzZWQgYXMgYSB3
YXkNCnRvIGdldCBhdCBSVENzLCB3aGljaCBhcmUgcmVhZCBiZWZvcmUga2VybmVsIG1vZHVsZXMg
Y2FuIGJlIGxvYWRlZCkNCnRoZW4geW91IE1VU1QgbW92ZQ0KaTJjX2lteF9kbWFfcmVxdWVzdCgp
IGJlZm9yZQ0KaTJjX2FkZF9udW1iZXJlZF9hZGFwdGVyKCkgdG8gYXZvaWQgdGhlIGluZmluaXRl
IGxvb3AuIg0KDQpFdmVuIGlmIEkgZG8gdGhpcywgSXQncyBoYXJkIHRvIGF2b2lkIHRoZSBpbmZp
bml0ZSBsb29wIG9mIGkyYyBwcm9iZSBjYXVzZWQgYnkgRURNQShidWlsZC1pbikgaW5pdGlhbGl6
YXRpb24gZmFpbHVyZS4NCkkgc2F3IHRoZSBmdW5jdGlvbiBvZl9kbWFfcmVxdWVzdF9zbGF2ZV9j
aGFubmVsIGFsbG9jIGNoYW4gYXMgZmFsbG93czoNCg0Kb2ZkbWEgPSBvZl9kbWFfZmluZF9jb250
cm9sbGVyKCZkbWFfc3BlYyk7DQoNCiAgICAgICAgaWYgKG9mZG1hKSB7DQogICAgICAgICAgICBj
aGFuID0gb2ZkbWEtPm9mX2RtYV94bGF0ZSgmZG1hX3NwZWMsIG9mZG1hKTsvL2RtYSBwcm9iZSBz
dWNjZXNzZnVsIHdoZW4gZGV2aWNlcyBhbGxvYyBkbWEgc2xhdmUgY2hhbm5lbA0KICAgICAgICB9
IGVsc2Ugew0KICAgICAgICAgICAgcmV0X25vX2NoYW5uZWwgPSAtRVBST0JFX0RFRkVSOyAvL2Rt
YSBub3QgcHJvYmUgb3IgcHJvYmUgZmFpbGVkIHdoZW4gZGV2aWNlcyBhbGxvYyBkbWEgc2xhdmUg
Y2hhbm5lbA0KICAgICAgICAgICAgY2hhbiA9IE5VTEw7DQogICAgICAgIH0gICANCg0KRHVlIHRv
IHRoaXMgY2FzZSx3ZSBzaG91bGQgbWFrZSBzdXJlOg0KMS4gRURNQSBidWlsZC1pbg0KMi4gRURN
QSBjYW4gcHJvYmUgc3VjY2Vzc2Z1bA0KDQpUaGUgZmlyc3QgY2FuIHJlYWxpemUsIGJ1dCBJIGRv
bid0IGtub3cgaG93IHRvIGNoZWNrIHdoZXRoZXIgRURNQSBoYXMgYmVlbiBwcm9iZWQgZmFpbGVk
IGluIGkyYywNCklmIHdlIGNvdWxkIGNoZWNrIGl0LCBpMmMgd2lsbCBza2lwIHRoYXQgbG9vcC4N
Cg0KQmVzdCBSZWdhcmRzLA0KUGVuZw0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJv
bTogUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIDxsaW51eEBhcm1saW51eC5vcmcudWs+
DQo+U2VudDogMjAxOeW5tDEy5pyIMTHml6UgMTk6NDMNCj5UbzogUGVuZyBNYSA8cGVuZy5tYUBu
eHAuY29tPg0KPkNjOiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRl
Ow0KPmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4QHJlbXBlbC1wcml2YXQuZGU7
IGRsLWxpbnV4LWlteA0KPjxsaW51eC1pbXhAbnhwLmNvbT47IGtlcm5lbEBwZW5ndXRyb25peC5k
ZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbRVhUXSBSZTog
W1BBVENIXSBpMmM6IGlteDogRGVmZXIgcHJvYmluZyBpZiBFRE1BIG5vdCBhdmFpbGFibGUNCj4N
Cj5DYXV0aW9uOiBFWFQgRW1haWwNCj4NCj5PbiBXZWQsIERlYyAxMSwgMjAxOSBhdCAxMToyMjow
MEFNICswMDAwLCBQZW5nIE1hIHdyb3RlOg0KPj4NCj4+DQo+PiA+LS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4+ID5Gcm9tOiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gPGxpbnV4
QGFybWxpbnV4Lm9yZy51az4NCj4+ID5TZW50OiAyMDE55bm0MTLmnIgxMeaXpSAxODo0NA0KPj4g
PlRvOiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+PiA+Q2M6IGZlc3RldmFtQGdtYWlsLmNv
bTsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4+ID5saW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBsaW51eEByZW1wZWwtcHJpdmF0LmRlOyBkbC1saW51eC1pbXgNCj4+ID48bGludXgtaW14
QG54cC5jb20+OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+
PiA+bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1pMmNAdmdlci5r
ZXJuZWwub3JnDQo+PiA+U3ViamVjdDogUmU6IFtFWFRdIFJlOiBbUEFUQ0hdIGkyYzogaW14OiBE
ZWZlciBwcm9iaW5nIGlmIEVETUEgbm90DQo+PiA+YXZhaWxhYmxlDQo+PiA+DQo+PiA+Q2F1dGlv
bjogRVhUIEVtYWlsDQo+PiA+DQo+PiA+T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMTA6MjU6MjZB
TSArMDAwMCwgUGVuZyBNYSB3cm90ZToNCj4+ID4+IEhpIFJ1c3NlbGwsDQo+PiA+Pg0KPj4gPj4g
SSBhbSBzb3JyeSB0byByZXBseSBsYXRlLCB0aGFua3MgZm9yIHlvdXIgcGF0aWVudCByZW1pbmRp
bmcsIFBsZWFzZQ0KPj4gPj4gc2VlIG15IGNvbW1lbnRzIGlubGluZS4NCj4+ID4+DQo+PiA+PiBC
ZXN0IFJlZ2FyZHMsDQo+PiA+PiBQZW5nDQo+PiA+PiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4+ID4+ID5Gcm9tOiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gPGxpbnV4QGFy
bWxpbnV4Lm9yZy51az4NCj4+ID4+ID5TZW50OiAyMDE55bm0MTHmnIgyOOaXpSAxODowNg0KPj4g
Pj4gPlRvOiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+PiA+PiA+Q2M6IGxpbnV4QHJlbXBl
bC1wcml2YXQuZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4+ID4+ID5zaGF3bmd1b0BrZXJu
ZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOw0KPj4gPj4gPmxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPj4gPj4gPmZl
c3RldmFtQGdtYWlsLmNvbTsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0K
Pj4gPj4gPmxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4+ID4+ID5TdWJqZWN0OiBbRVhUXSBS
ZTogW1BBVENIXSBpMmM6IGlteDogRGVmZXIgcHJvYmluZyBpZiBFRE1BIG5vdA0KPj4gPj4gPmF2
YWlsYWJsZQ0KPj4gPj4gPg0KPj4gPj4gPkNhdXRpb246IEVYVCBFbWFpbA0KPj4gPj4gPg0KPj4g
Pj4gPk9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDA3OjEyOjA5QU0gKzAwMDAsIFBlbmcgTWEgd3Jv
dGU6DQo+PiA+PiA+PiBFRE1BIG1heSBiZSBub3QgYXZhaWxhYmxlIG9yIGRlZmVyZWQgZHVlIHRv
IGRlcGVuZGVuY2llcyBvbg0KPj4gPj4gPj4gb3RoZXIgbW9kdWxlcywgSWYgdGhlc2Ugc2NlbmFy
aW9zIGlzIGVuY291bnRlcmVkLCB3ZSBzaG91bGQgZGVmZXINCj5wcm9iaW5nLg0KPj4gPj4gPg0K
Pj4gPj4gPlRoaXMgaGFzIGJlZW4gdHJpZWQgYmVmb3JlIGluIHRoaXMgZm9ybSwgYW5kIGl0IGNh
dXNlcyByZWdyZXNzaW9ucy4NCj4+ID4+ID4NCj4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IFBlbmcg
TWEgPHBlbmcubWFAbnhwLmNvbT4NCj4+ID4+ID4+IC0tLQ0KPj4gPj4gPj4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LmMgfCAxNiArKysrKysrKysrKy0tLS0tDQo+PiA+PiA+PiAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+PiA+PiA+Pg0KPj4g
Pj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4+ID4+ID4+
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyBpbmRleCA0MDExMWEzLi5jMmIwNjkzIDEw
MDY0NA0KPj4gPj4gPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPj4gPj4g
Pj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPj4gPj4gPj4gQEAgLTM2OSw4
ICszNjksOCBAQCBzdGF0aWMgdm9pZCBpMmNfaW14X3Jlc2V0X3JlZ3Moc3RydWN0DQo+PiA+PiA+
PiBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCkgIH0NCj4+ID4+ID4+DQo+PiA+PiA+PiAgLyogRnVu
Y3Rpb25zIGZvciBETUEgc3VwcG9ydCAqLyAtc3RhdGljIHZvaWQNCj4+ID4+ID4+IGkyY19pbXhf
ZG1hX3JlcXVlc3Qoc3RydWN0IGlteF9pMmNfc3RydWN0ICppMmNfaW14LA0KPj4gPj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QNCj4+
ID4+ID5waHlfYWRkcikNCj4+ID4+ID4+ICtzdGF0aWMgaW50IGkyY19pbXhfZG1hX3JlcXVlc3Qo
c3RydWN0IGlteF9pMmNfc3RydWN0ICppMmNfaW14LA0KPj4gPj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkbWFfYWRkcl90IHBoeV9hZGRyKQ0KPj4gPj4gPj4gIHsNCj4+ID4+ID4+
ICAgICAgIHN0cnVjdCBpbXhfaTJjX2RtYSAqZG1hOw0KPj4gPj4gPj4gICAgICAgc3RydWN0IGRt
YV9zbGF2ZV9jb25maWcgZG1hX3Njb25maWc7IEBAIC0zNzksNyArMzc5LDcgQEANCj4+ID4+ID4+
IHN0YXRpYyB2b2lkIGkyY19pbXhfZG1hX3JlcXVlc3Qoc3RydWN0IGlteF9pMmNfc3RydWN0ICpp
MmNfaW14LA0KPj4gPj4gPj4NCj4+ID4+ID4+ICAgICAgIGRtYSA9IGRldm1fa3phbGxvYyhkZXYs
IHNpemVvZigqZG1hKSwgR0ZQX0tFUk5FTCk7DQo+PiA+PiA+PiAgICAgICBpZiAoIWRtYSkNCj4+
ID4+ID4+IC0gICAgICAgICAgICAgcmV0dXJuOw0KPj4gPj4gPj4gKyAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4+ID4+ID4+DQo+PiA+PiA+PiAgICAgICBkbWEtPmNoYW5fdHggPSBkbWFf
cmVxdWVzdF9jaGFuKGRldiwgInR4Iik7DQo+PiA+PiA+PiAgICAgICBpZiAoSVNfRVJSKGRtYS0+
Y2hhbl90eCkpIHsgQEAgLTQyNCw3ICs0MjQsNyBAQCBzdGF0aWMNCj4+ID4+ID4+IHZvaWQgaTJj
X2lteF9kbWFfcmVxdWVzdChzdHJ1Y3QNCj4+ID4+ID5pbXhfaTJjX3N0cnVjdCAqaTJjX2lteCwN
Cj4+ID4+ID4+ICAgICAgIGRldl9pbmZvKGRldiwgInVzaW5nICVzICh0eCkgYW5kICVzIChyeCkg
Zm9yIERNQSB0cmFuc2ZlcnNcbiIsDQo+PiA+PiA+PiAgICAgICAgICAgICAgIGRtYV9jaGFuX25h
bWUoZG1hLT5jaGFuX3R4KSwNCj4+ID4+ID4+IGRtYV9jaGFuX25hbWUoZG1hLT5jaGFuX3J4KSk7
DQo+PiA+PiA+Pg0KPj4gPj4gPj4gLSAgICAgcmV0dXJuOw0KPj4gPj4gPj4gKyAgICAgcmV0dXJu
IDA7DQo+PiA+PiA+Pg0KPj4gPj4gPj4gIGZhaWxfcng6DQo+PiA+PiA+PiAgICAgICBkbWFfcmVs
ZWFzZV9jaGFubmVsKGRtYS0+Y2hhbl9yeCk7DQo+PiA+PiA+PiBAQCAtNDMyLDYgKzQzMiw4IEBA
IHN0YXRpYyB2b2lkIGkyY19pbXhfZG1hX3JlcXVlc3Qoc3RydWN0DQo+PiA+PiA+aW14X2kyY19z
dHJ1Y3QgKmkyY19pbXgsDQo+PiA+PiA+PiAgICAgICBkbWFfcmVsZWFzZV9jaGFubmVsKGRtYS0+
Y2hhbl90eCk7DQo+PiA+PiA+PiAgZmFpbF9hbDoNCj4+ID4+ID4+ICAgICAgIGRldm1fa2ZyZWUo
ZGV2LCBkbWEpOw0KPj4gPj4gPj4gKw0KPj4gPj4gPj4gKyAgICAgcmV0dXJuIHJldDsNCj4+ID4+
ID4NCj4+ID4+ID5Tb21lIHBsYXRmb3JtcyBkb24ndCBoYXZlIEVETUEuICBEb2Vzbid0IHRoaXMg
Zm9yY2UgZXZlcnlvbmUgd2hvDQo+PiA+PiA+d2FudHMgSTJDIHRvIGhhdmUgRE1BPyAgVGhlIGxh
c3QgYXR0ZW1wdCBhdCB0aGlzIGhhZDoNCj4+ID4+ID4NCj4+ID4+ID4gICAgICAgIC8qIHJldHVy
biBzdWNjZXNzZnVsbHkgaWYgdGhlcmUgaXMgbm8gZG1hIHN1cHBvcnQgKi8NCj4+ID4+ID4gICAg
ICAgIHJldHVybiByZXQgPT0gLUVOT0RFViA/IDAgOiByZXQ7DQo+PiA+PiA+DQo+PiA+PiA+aGVy
ZSBiZWNhdXNlIG9mIGV4YWN0bHkgdGhpcy4NCj4+ID4+ID4NCj4+ID4+ID4+ICB9DQo+PiA+PiA+
Pg0KPj4gPj4gPj4gIHN0YXRpYyB2b2lkIGkyY19pbXhfZG1hX2NhbGxiYWNrKHZvaWQgKmFyZykg
QEAgLTE2MDUsMTANCj4+ID4+ID4+ICsxNjA3LDE0IEBAIHN0YXRpYyBpbnQgaTJjX2lteF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gPj4gPj4gICAgICAgZGV2X2luZm8o
JmkyY19pbXgtPmFkYXB0ZXIuZGV2LCAiSU1YIEkyQyBhZGFwdGVyDQo+PiA+PiA+PiByZWdpc3Rl
cmVkXG4iKTsNCj4+ID4+ID4+DQo+PiA+PiA+PiAgICAgICAvKiBJbml0IERNQSBjb25maWcgaWYg
c3VwcG9ydGVkICovDQo+PiA+PiA+PiAtICAgICBpMmNfaW14X2RtYV9yZXF1ZXN0KGkyY19pbXgs
IHBoeV9hZGRyKTsNCj4+ID4+ID4+ICsgICAgIHJldCA9IGkyY19pbXhfZG1hX3JlcXVlc3QoaTJj
X2lteCwgcGh5X2FkZHIpOw0KPj4gPj4gPj4gKyAgICAgaWYgKHJldCA9PSAtRVBST0JFX0RFRkVS
KQ0KPj4gPj4gPj4gKyAgICAgICAgICAgICBnb3RvIGkyY19hZGFwdGVyX3JlbW92ZTsNCj4+ID4+
ID4NCj4+ID4+ID5UaGlzIGhhcHBlbnMgX2FmdGVyXyB0aGUgYWRhcHRlciBoYXMgYmVlbiBwdWJs
aXNoZWQgdG8gdGhlIHJlc3Qgb2YNCj4+ID4+ID50aGUNCj4+ID5rZXJuZWwuDQo+PiA+PiA+Q2xh
aW1pbmcgcmVzb3VyY2VzIGFmdGVyIHB1YmxpY2F0aW9uIGlzIHJhY3kgLSB0aGUgYWRhcHRlciBt
YXkgYmUNCj4+ID4+ID5pbiB1c2UgYnkgYSByZXF1ZXN0IGF0IHRoaXMgcG9pbnQuICBTZWNvbmRs
eSwgdGhlcmUncyBiZWVuDQo+PiA+PiA+cHJvYmxlbXMgd2l0aCB0aGlzIGNhdXNpbmcgcmVncmVz
c2lvbnMgd2hlbiBFRE1BIGlzIGJ1aWx0IGFzIGENCj4+ID4+ID5tb2R1bGUgYW5kIGkyYy1pbXgg
aXMNCj4+ID5idWlsdC1pbi4NCj4+ID4+ID4NCj4+ID4+ID5TZWUgZThjMjIwZmFjNDE1ICgiUmV2
ZXJ0ICJpMmM6IGlteDogaW1wcm92ZSB0aGUgZXJyb3IgaGFuZGxpbmcgaW4NCj4+ID4+ID5pMmNf
aW14X2RtYV9yZXF1ZXN0KCkiIikgd2hlbiBleGFjdGx5IHdoYXQgeW91J3JlIHByb3Bvc2luZyB3
YXMNCj4+ID4+ID50cmllZCBhbmQgZW5kZWQgdXAgaGF2aW5nIHRvIGJlIHJldmVydGVkLg0KPj4g
Pj4gPg0KPj4gPj4gPkFGQUlLIG5vdGhpbmcgaGFzIGNoYW5nZWQgc2luY2UsIHNvIG1lcmVseSBy
ZWluc3RhdGluZyB0aGUga25vd24NCj4+ID4+ID50byBiZSBicm9rZW4gY29kZSwgdGhlcmVieSBy
ZWludHJvZHVjaW5nIHRoZSBzYW1lIChhbmQgbW9yZSkNCj4+ID4+ID5wcm9ibGVtcywgaXNuJ3Qg
Z29pbmcgdG8gYmUgYWNjZXB0YWJsZS4NCj4+ID4+ID4NCj4+ID4+ID5Tb3JyeSwgYnV0IHRoaXMg
Z2V0cyBhIGJpZyBOQUsgZnJvbSBtZS4NCj4+ID4+ID4NCj4+ID4+IFtQZW5nIE1hXSBJIHNhdyB0
aGUgcmV2ZXJ0IGNvbW1pdCBlOGMyMjBmYWM0MTUgYW5kIHVuZGVyc3RhbmQgeW91cg0KPj4gPmNv
bmNlcm5zLg0KPj4gPj4gSSBzY2FuIHRoZSBpMmMtaW14LmMgZHJpdmVyLCBBbGwgcGxhdGZvcm1z
IHRoYXQgdXNlIGkyYyBkcml2ZXIgYW5kDQo+PiA+PiBzdXBwb3J0IGRtYSB1c2UgYW4gZURNQSBl
bmdpbmUsIFNvIEkgY2hhbmdlIHRoZSBjb2RlKGNvbXBhcmUgd2l0aA0KPj4gPj4gbGFzdA0KPj4g
PnBhdGNoKSBhcyBmb2xsb3dzLCBwbGVhc2UgcmV2aWV3IGFuZCBnaXZlIG1lIHlvdXIgcHJlY2lv
dXMgY29tbWVudHMuDQo+PiA+PiBUaGFua3MgdmVyeSBtdWNoLg0KPj4gPj4NCj4+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+PiA+PiBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LmMgaW5kZXggMTJmNzkzNGZkZGI0Li42Y2FmZWU1MmRkNjcNCj4+ID4+
IDEwMDY0NA0KPj4gPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPj4gPj4g
KysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPj4gPj4gQEAgLTE2MDUsOCArMTYw
NSwxMSBAQCBzdGF0aWMgaW50IGkyY19pbXhfcHJvYmUoc3RydWN0DQo+PiA+PiBwbGF0Zm9ybV9k
ZXZpY2UNCj4+ID4+ICpwZGV2KQ0KPj4gPj4NCj4+ID4+ICAgICAgICAgLyogSW5pdCBETUEgY29u
ZmlnIGlmIHN1cHBvcnRlZCAqLw0KPj4gPj4gICAgICAgICByZXQgPSBpMmNfaW14X2RtYV9yZXF1
ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4+ID4+IC0gICAgICAgaWYgKHJldCA9PSAtRVBST0JF
X0RFRkVSKQ0KPj4gPj4gKyAgICAgICBpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpIHsNCj4+ID4+
ICsjaWYgICAgSVNfQlVJTFRJTihDT05GSUdfRlNMX0VETUEpDQo+PiA+PiAgICAgICAgICAgICAg
ICAgZ290byBpMmNfYWRhcHRlcl9yZW1vdmU7DQo+PiA+PiArI2VuZGlmDQo+PiA+PiArICAgICAg
IH0NCj4+ID4NCj4+ID5Zb3UgaGF2ZW4ndCB1bmRlcnN0b29kIF93aHlfIHRoZSBwcm9ibGVtIG9j
Y3VycywgeW91J3JlIGp1c3QNCj4+ID5hdHRlbXB0aW5nIHRvIHBhdGNoIGFyb3VuZCBpdC4gWW91
J3JlIGhhY2tpbmcgdGhlIGNvZGUsIHJhdGhlciB0aGFuDQo+ZW5naW5lZXJpbmcgdGhlIGNvZGUu
DQo+PiA+DQo+PiA+VGhlIGluZmluaXRlIGRlZmVycmVkIHByb2JlIG9jY3VycyBiZWNhdXNlOg0K
Pj4gPg0KPj4gPi0gaTJjLWlteCBpcyBhdHRlbXB0ZWQgdG8gYmUgcHJvYmVkLg0KPj4gPi0gaTJj
LWlteCBzZXRzIHVwIHRoZSBoYXJkd2FyZSwgYW5kIHRoZW4gY2FsbHMNCj4+ID4gIGkyY19hZGRf
bnVtYmVyZWRfYWRhcHRlcigpDQo+PiA+LSBpMmNfYWRkX251bWJlcmVkX2FkYXB0ZXIoKSBwdWJs
aXNoZXMgdGhlIGJ1cyB0byB0aGUgd29ybGQsIGFuZCB0aGVuDQo+PiA+ICBzZWFyY2hlcyBEVCBm
b3IgYW55IGNoaWxkcmVuIHRvIGNyZWF0ZSAtIGFuZCBpdCBmaW5kcyBzb21lIGFuZA0KPj4gPiAg
Y3JlYXRlcyB0aGVtLg0KPj4gPi0gdGhlIGNoaWxkcmVuIGRldmljZXMgYXJlIG1hdGNoZWQgdG8g
dGhlaXIgZHJpdmVycywgd2hpY2ggYmluZC4NCj4+ID5UaGlzDQo+PiA+ICB0cmlnZ2VycyBhIGRl
ZmVycmVkIHByb2JlIHRvIGJlIHNjaGVkdWxlZC4NCj4+ID4tIGJhY2sgaW4gdGhlIGkyYy1pbXgg
ZHJpdmVyLCB3ZSBnZXQgdG8gaTJjX2lteF9kbWFfcmVxdWVzdCgpLCB3aGljaA0KPj4gPiAgZmFp
bHMsIGFuZCB5b3UgcmV0dXJuIC1FUFJPQkVfREVGRVIuDQo+PiA+LSB0aGUgaTJjLWlteCBkcml2
ZXIgcHJvYmUgYWN0aW9ucyBhcmUgdW53b3VuZCwgYW5kIHByb2JlIGV4aXRzLg0KPj4gPi0gdGhl
IGRyaXZlciBjb3JlIHByb2Nlc3NlcyB0aGUgZGVmZXJyZWQgcHJvYmUgcmVxdWVzdCwgZmluZHMg
dGhlDQo+PiA+ICBpMmMtaW14IGRldmljZShzKSBvbiB0aGUgZGVmZXJyZWQgcHJvYmUgbGlzdCwg
YW5kIGF0dGVtcHRzIHRvDQo+PiA+ICBwcm9iZSB0aGVtLiAgR290byB0aGUgdG9wIG9mIHRoaXMg
bGlzdC4NCj4+ID4NCj4+IFtQZW5nIE1hXSBUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVwbHksIE5v
LCBJIGRvbid0IHRoaW5rIHNvLCB3aGVuDQo+Zmlyc3Qsc2Vjb25kLHRoaXJkLi4uLi4uIHRpbWUg
cHJvYmUgZmFpbGVkLCB0aGUgaTJjX2RlbF9hZGFwdGVyIHdpbGwgYmUgY2FsbGVkKGl0DQo+d2ls
bCByZW1vdmUgdGhlIGkyYyBjaGlsZHJlbiBkZXZpY2UpLiBJIHRoaW5rIGlmIFdlIGJ1aWxkLWlu
IEVETUEsIGFmdGVyIEVETUENCj5wcm9iZSBzdWNjZXNzZnVsLCB0aGUgZGVmZmVyIHByb2JlIG9m
IGkyYyB3aWxsIHByb2JlIHdpdGggbm8gcmV0dXJuDQo+LUVQUk9CRV9ERUZFUi4NCj4NCj5ZZXMs
IGkyY19kZWxfYWRhcHRlciB3aWxsIGJlIGNhbGxlZCwgYnV0IHRoYXQgaXMgbmVpdGhlciBoZXJl
IG5vciB0aGVyZS4NCj5UaGUgZGVmZXJyZWQgcHJvYmUgaXMgdHJpZ2dlcmVkIGJ5IF9hbnlfIGRy
aXZlciBiaW5kaW5nLiAgVGhlIGZhY3RzIGFyZToNCj4NCj5pMmNfYWRkX251bWJlcmVkX2FkYXB0
ZXIoKSBjcmVhdGVzIGRldmljZXMuDQo+VGhlc2UgbmV3IGRldmljZXMgZ2V0IGJvdW5kIHRvIGRy
aXZlcnMuDQo+QXMgc29vbiBhcyBhbnkgb25lIG9mIHRob3NlIGRldmljZXMgYmluZHMgdG8gYSBk
cml2ZXIsIGRlZmVycmVkIHByb2JpbmcgaXMNCj50cmlnZ2VyZWQuDQo+V2hlbiBpMmNfaW14X3By
b2JlKCkgcmV0dXJucyAtRVBST0JFX0RFRkVSLCBpdCB3aWxsIGJlIGFkZGVkIHRvIHRoZSBsaXN0
IG9mDQo+ZGV2aWNlcyB0byBiZSByZS1wcm9iZWQgYnkgdGhlIGRlZmVycmVkIHByb2JpbmcuDQo+
DQo+PiBTbyB5b3Ugc2F5ICIgR290byB0aGUgdG9wIG9mIHRoaXMgbGlzdCAiIGp1c3QgaTJjIGRy
aXZlIHByb2JlIGZhaWxlZA0KPj4gd2l0aCBpMmNfaW14X2RtYV9yZXF1ZXN0KCkgcmV0dXJuIC1F
UFJPQkVfREVGRVIsIElmIHRoZSBFRE1BIGJ1aWxkLWluDQo+YW5kIHByb2JlIHN1Y2Nlc3NmdWwg
dGhpcyBjYXNlIG5vdCBoYXBwZW5lZC4gTm93IEkgYW0gd29ycmllZCBhYm91dCBFRE1BDQo+ZmFp
bGVkIHRvIHByb2JlLCB5b3VyIGNhc2UgaXMgY29ycmVjdC4NCj4NCj5Zb3UgYXJlIGFzc3VtaW5n
IHRoYXQgRURNQSBoYXMgc3VjY2Vzc2Z1bGx5IHByb2JlZC4gV2hhdCBpZiBFRE1BIGhhc24ndA0K
PmJlZW4gcHJvYmVkIHlldCwgYmVjYXVzZSBpdCBoYXMgYmVlbiBkZWZlcnJlZCBmb3Igc29tZSBv
dGhlciByZWFzb24gKGUuZy4NCj5hIGNsb2NrKT8NCj4NCj5UaGUgZmFjdCBpcywgdGhlIHdheSBp
MmMtaW14IGlzIHN0cnVjdHVyZWQgYXQgcHJlc2VudCwgaXQgaXMgdW5zYWZlIHRvIHByb3BhZ2F0
ZQ0KPnRoZSBFUFJPQkVfREVGRVIgZXJyb3IgY29kZSBmcm9tIGkyY19pbXhfZG1hX3JlcXVlc3Qo
KSB1bmRlciBBTlkNCj5DSVJDVU1TVEFOQ0VTLg0KPg0KPj4gPklmLCBmb3Igd2hhdGV2ZXIgcmVh
c29uLCBpMmNfaW14X2RtYV9yZXF1ZXN0KCkgZXZlciByZXR1cm5zDQo+PiA+LUVQUk9CRV9ERUZF
UiwgdGhlIGFib3ZlIGxvb3AgV0lMTCBoYXBwZW4uDQo+PiA+DQo+PiA+VGhlIEZVTkRBTUVOVEFM
IHJ1bGUgb2Yga2VybmVsIHByb2dyYW1taW5nIGlzIHRoYXQgeW91IGRvIE5PVCBwdWJsaXNoDQo+
PiA+YmVmb3JlIHlvdSBoYXZlIGNvbXBsZXRlZCBzZXR1cC4gIGkyYy1pbXggdmlvbGF0ZXMgdGhh
dCBydWxlIGFzIHRoZQ0KPj4gPnByb2JlIGZ1bmN0aW9uIGlzIG9yZGVyZWQgYXQgcHJlc2VudC4N
Cj4+ID4NCj4+IFtQZW5nIE1hXSBZZXMsIEkgYWdyZWUsIGJ1dCBrZXJuZWwgcHJvdmlkZSB0aGUg
ZGVmZmVyIHByb2JlIGFuZCBmb3IgdGhlDQo+cGxhdGZvcm0gZGV2aWNlcyB3ZSBkb24ndCBkZWNp
ZGUgd2hvIHByb2JlIGZpcnN0Lg0KPg0KPlNvLCBiZWNhdXNlIHRoZSBrZXJuZWwgcHJvdmlkZXMg
YSBmYWNpbGl0eSwgeW91IHRoaW5rIGl0J3MgZmluZSB0byBjcmVhdGUgaW5maW5pdGUNCj5sb29w
cyB1c2luZyBpdD8NCj4NCj4+ID5pMmMtaW14IGhhcyBiZWVuIHdyaXR0ZW4gZm9yIGkyY19pbXhf
ZG1hX3JlcXVlc3QoKSB0byBiZSBzYWZlIHRvIGNhbGwNCj4+ID5hZnRlciB0aGUgZGV2aWNlIGhh
cyBiZWVuIHB1Ymxpc2hlZCwgYnV0IHdpdGggdGhlIGN1cnJlbnQgcHJvYmUNCj4+ID5mdW5jdGlv
biBvcmRlciwgaXQgaXMgdW5zYWZlIHRvIHByb3BhZ2F0ZSB0aGUgRVBST0JFX0RFRkVSIHJldHVy
biB2YWx1ZSBmb3INCj50aGUgcmVhc29uIGFib3ZlLg0KPj4gPkZvciB0aGUgcmVhc29uIHRoZSBv
cmlnaW5hbCBhdHRlbXB0IGdvdCByZXZlcnRlZC4NCj4+ID4NCj4+ID5TbywgaWYgeW91IHdhbnQg
dG8gZG8gdGhpcyAoYW5kIHllcywgSSdkIGFsc28gZW5jb3VyYWdlIGl0IHRvIGJlDQo+PiA+Y29u
ZGl0aW9uYWwgb24gRURNQSBiZWluZyBidWlsdC1pbiwgYXMgSTJDIGlzIGNvbW1vbmx5IHVzZWQg
YXMgYSB3YXkNCj4+ID50byBnZXQgYXQgUlRDcywgd2hpY2ggYXJlIHJlYWQgYmVmb3JlIGtlcm5l
bCBtb2R1bGVzIGNhbiBiZSBsb2FkZWQpDQo+PiA+dGhlbiB5b3UgTVVTVCBtb3ZlDQo+PiA+aTJj
X2lteF9kbWFfcmVxdWVzdCgpIGJlZm9yZQ0KPj4gPmkyY19hZGRfbnVtYmVyZWRfYWRhcHRlcigp
IHRvIGF2b2lkIHRoZSBpbmZpbml0ZSBsb29wLg0KPj4gPg0KPj4gW1BlbmcgTWFdIFRvIGRvIHRo
aXMsIHRoZSBpMmMgZGV2aWNlcyBub3QgcHJvYmUgYW5kIGkyYyBhZGFwdGVyIG5vdCByZWdpc3Rl
cg0KPmJlZm9yZSBlZG1hIHByb2JlLg0KPg0KPldoaWNoIGlzIHRoZSBjb3JyZWN0IGJlaGF2aW91
ciwgcmF0aGVyIHRoYW4gaGF2aW5nIHRoZSBrZXJuZWwgY3ljbGUgdGhyb3VnaA0KPmNyZWF0aW5n
IGkyYyBkZXZpY2VzLCBwcm9iaW5nIGkyYyBkcml2ZXJzLCB0ZWFyaW5nIGRvd24gdGhlIGkyYyBk
ZXZpY2VzIGFuZA0KPnJlcGVhdGluZyBlbmRsZXNzbHkuDQo+DQo+VW50aWwgeW91IHNlZSB0aGlz
LCBzb3JyeSwgbm8sIHlvdSBjYW4ndCBwcm9wYWdhdGUgdGhlIHJldHVybiB2YWx1ZSBmcm9tDQo+
aTJjX2lteF9kbWFfcmVxdWVzdCgpLiAgV2UndmUgdHJpZWQgaXQsIGl0J3MgY2F1c2VkIHJlZ3Jl
c3Npb25zLCBhbmQgYQ0KPnByb2JsZW0gaGFzIGJlZW4gaWRlbnRpZmllZCB0aGF0IHlvdSBkb24n
dCBzZWVtIHRvIGJlIHdpbGxpbmcgdG8gcmVjb2duaXNlIF9hc18NCj5hIHNlcmlvdXMgcHJvYmxl
bSB3aXRoIHRoZSBhcHByb2FjaCB5b3UncmUgdHJ5aW5nIHRvIHJlLWltcGxlbWVudC4NCj4NCj4t
LQ0KPlJNSydzIFBhdGNoIHN5c3RlbToNCj5odHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ3d3cuYXINCj5tbGludXgub3JnLnVr
JTJGZGV2ZWxvcGVyJTJGcGF0Y2hlcyUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDcGVuZy5tYQ0KPiU0
MG54cC5jb20lN0MxNDJlMDAyZWJhODk0MGIyMjUwYjA4ZDc3ZTJmMzk5OSU3QzY4NmVhMWQzYmMy
YjRjDQo+NmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcxMTY2MTM2MTI0NjMyOTUmYW1w
O3NkYXRhPUFkSW8NCj5xNnJOeVBEY0tBanElMkZpa0RoRTh2cDNPcHlHT1VWMTA4VE82cjRqbyUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KPkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3Vi
dXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzDQo+dXAgQWNjb3JkaW5nIHRvIHNw
ZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cA0K
