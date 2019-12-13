Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C451A11E1FF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 11:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfLMKeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 05:34:02 -0500
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:55205
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725928AbfLMKeC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Dec 2019 05:34:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/ifs585KwiDVzD4Obz5prf++pRQHK0J1+iKtKhJ/REl6UOYsvafGzuRAlNdqjTsOTuRD33WCFGcWLzswe0CvxHr/vZeEdcR+nsCB6DwHXUCrz7vtbR8d8GTHoPy7CMpzMeXdSUz4GY2ApW3LvntfY+bHNpc9kVgAnnOwyGRxobmAMRUrGtYNQHenbdMuSafvmIWDtrN1JoGD2WVSFmd8BUazCzUJA21Gi6A4EFZX+jmclFl2kN2aEgF2GaE+qNxw6u4XzeJonTJYcCkUB6FDQkj2yC0lyY2O1tPfkv9/ch8eLAEx/eOWKBFzpS6BgFhm8pw/AJ5+k3W6o8HGaV/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRsHmyzdazwuXRwk9XFqsKXOYPBoIT4igaUR4srSllY=;
 b=NX3KgEygM7Tp4r42V3isz/Ndy6PweTjE7irPw9xOo11pqSc6g5KkuNYQzctJz0hoe1vt0LF+ib1yjgL0xwvYezrZzmcpIQ1AkFxlmdK8TudfWOo0pt9UipwtAT3Q+0y9oJtOu+HDEnB3NHR9t8nBRNxqqSfIiLDKu1EIo8Cp/Dt7bFCb9V9aKf+k2mBaQiCYNQMh9QK4D9GkX9lnwoFVJ+GmpkDGMJg6q5GABUDxQxMk00CHbcPMILK3hy+0YUsQQnIYU0exn/uWvpULsDy7DCv8Wsf2f9WBdGekYsa1QQIbKvq/zCVfoAZud4J57iTowl0yH9rtjdwCyD5vmbbd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRsHmyzdazwuXRwk9XFqsKXOYPBoIT4igaUR4srSllY=;
 b=qAid3KBQZqHVjQgfJLriXU5nl47yCkoi0e3gYZ00Oq5mYa41OP0ijGzAfHa1chnLOHYvu3gsS5qvmVPtIr0RV/akzr0Vd5Le0LFF2ehOIsTJNmEaXx4Xtpapm/Yo9j9LgeRdG+CwEiYUDGxFIX2+Ed+akhQwD2wTaR6QJNHrhDw=
Received: from VI1PR04MB4431.eurprd04.prod.outlook.com (20.177.55.205) by
 VI1PR04MB4880.eurprd04.prod.outlook.com (20.177.49.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Fri, 13 Dec 2019 10:33:52 +0000
Received: from VI1PR04MB4431.eurprd04.prod.outlook.com
 ([fe80::c947:5ae7:2a68:a4f2]) by VI1PR04MB4431.eurprd04.prod.outlook.com
 ([fe80::c947:5ae7:2a68:a4f2%3]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 10:33:51 +0000
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
Thread-Index: AQHVpPH7P18PyO0DCUWpmTSTyww0uaegXQmAgBRv36CAAAjvgIAABFvAgAAMDQCAAPGv4IAAlHuAgAFaR8A=
Date:   Fri, 13 Dec 2019 10:33:51 +0000
Message-ID: <VI1PR04MB44318D7C92B6A29D04840B0DED540@VI1PR04MB4431.eurprd04.prod.outlook.com>
References: <20191127071136.5240-1-peng.ma@nxp.com>
 <20191128100613.GI25745@shell.armlinux.org.uk>
 <VI1PR04MB4431CF7F051F9439C84F84FAED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211104347.GA25745@shell.armlinux.org.uk>
 <VI1PR04MB44313AA19A4F81BA1AD9BC5CED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211114230.GC25745@shell.armlinux.org.uk>
 <VI1PR04MB4431DF2E270FC45A6CC878A9ED550@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191212105857.GE25745@shell.armlinux.org.uk>
In-Reply-To: <20191212105857.GE25745@shell.armlinux.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 94387e4a-8d5a-44f7-98ed-08d77fb7f272
x-ms-traffictypediagnostic: VI1PR04MB4880:|VI1PR04MB4880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB48809471FF7025A0F087CBC3ED540@VI1PR04MB4880.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(13464003)(26005)(6506007)(186003)(8936002)(76116006)(64756008)(8676002)(81166006)(5660300002)(86362001)(9686003)(66556008)(66476007)(81156014)(478600001)(2906002)(33656002)(54906003)(7696005)(66446008)(316002)(45080400002)(4326008)(52536014)(55016002)(66946007)(71200400001)(6916009)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4880;H:VI1PR04MB4431.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yLh5Q4kxZzrIvq7Bvf8C3cmv/YUUgMCeX0p2o6B8pjhevIdRi7D+UX4eA6Pd9kJ0zrZUd4Nz5q0zRiZ/LwZ3TMmPiQplcC0fhdVFJqm2Z0bKDqkW9GsJ9CwRw8KgR5r26mBPCcfTNOdTmYv1hsz3oKRpJbWfX7l8aNMeBPSGjyWgd27O5nfWJLslLAIuDpX/yZgb98Yf/g8MPsuXULLUO+gdR4yRZMlrqz+sSPlmRuQAgdA60SsBfX4bbi99z//SfdfzhGnF4CxDOmvfInEsyRGOjnq6+2lN1Hif7kata0AzcT2M5fnCodNvHYiwvMqRo0X9JE6iDHoXfOElWm2rtN5GmrF1hiR1TP82/Ik+WSfoJNA+al7EkCrKCi2CV95lJu13RbSbBQh2KlUoxEZmewQyVg0481dhynEUOV6VNYomD20BFxIQCIeajrhVI8TiZs7KYg0JZID3YThhHmjvVgGJfahwD99VvQcn81HuNI2i7ZWvZVG25DmV+WPaLzYvP3Hl1DBsAglmfdZATBdRgkPSblP4+vQvpg+dOmFQIzE=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94387e4a-8d5a-44f7-98ed-08d77fb7f272
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 10:33:51.7437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDbEzIqEDnnJ+5BKXOw1gkh4Y5/SR2QrKSH12vYfbgAEYLoMFMqLsyjXmVGyXQrN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4880
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFJ1c3NlbGwgS2luZyAtIEFS
TSBMaW51eCBhZG1pbiA8bGludXhAYXJtbGludXgub3JnLnVrPg0KPlNlbnQ6IDIwMTnE6jEy1MIx
MsjVIDE4OjU5DQo+VG86IFBlbmcgTWEgPHBlbmcubWFAbnhwLmNvbT4NCj5DYzogc2hhd25ndW9A
a2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj5saW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eEByZW1wZWwtcHJpdmF0LmRlOyBBYmVsIFZlc2ENCj48YWJlbC52ZXNh
QG54cC5jb20+OyBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgQW5zb24gSHVh
bmcNCj48YW5zb24uaHVhbmdAbnhwLmNvbT47IEJvZ2RhbiBGbG9yaW4gVmxhZCA8Ym9nZGFuLnZs
YWRAbnhwLmNvbT47DQo+Qk9VR0ggQ0hFTiA8aGFpYm8uY2hlbkBueHAuY29tPjsgQ2xhcmsgV2Fu
Zw0KPjx4aWFvbmluZy53YW5nQG54cC5jb20+OyBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRh
QG54cC5jb20+OyBGYW5jeQ0KPkZhbmcgPGNoZW4uZmFuZ0BueHAuY29tPjsgSGFuIFh1IDxoYW4u
eHVAbnhwLmNvbT47IEhvcmlhIEdlYW50YQ0KPjxob3JpYS5nZWFudGFAbnhwLmNvbT47IEl1bGlh
bmEgUHJvZGFuIDxpdWxpYW5hLnByb2RhbkBueHAuY29tPjsgSmFja3kNCj5CYWkgPHBpbmcuYmFp
QG54cC5jb20+OyBKb2FraW0gWmhhbmcgPHFpYW5ncWluZy56aGFuZ0BueHAuY29tPjsgSnVuIExp
DQo+PGp1bi5saUBueHAuY29tPjsgTGVvIFpoYW5nIDxsZW8uemhhbmdAbnhwLmNvbT47IExlb25h
cmQgQ3Jlc3Rleg0KPjxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT47IE1pcmNlYSBQb3AgPG1pcmNl
YS5wb3BAbnhwLmNvbT47IE1pcmVsYQ0KPlJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+
OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IFBldGVyDQo+Q2hlbiA8cGV0ZXIuY2hlbkBu
eHAuY29tPjsgUmFuamFuaSBWYWlkeWFuYXRoYW4NCj48cmFuamFuaS52YWlkeWFuYXRoYW5Abnhw
LmNvbT47IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT47DQo+Um9iaW4gR29u
ZyA8eWliaW4uZ29uZ0BueHAuY29tPjsgU2hlbndlaSBXYW5nDQo+PHNoZW53ZWkud2FuZ0BueHAu
Y29tPjsgVmlvcmVsIFN1bWFuIDx2aW9yZWwuc3VtYW5AbnhwLmNvbT47IFlpbmcgTGl1DQo+PHZp
Y3Rvci5saXVAbnhwLmNvbT47IFplbmluZyBXYW5nIDx6ZW5pbmcud2FuZ0BueHAuY29tPjsNCj5r
ZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj5saW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj5TdWJq
ZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSF0gaTJjOiBpbXg6IERlZmVyIHByb2JpbmcgaWYgRURN
QSBub3QgYXZhaWxhYmxlDQo+DQo+Q2F1dGlvbjogRVhUIEVtYWlsDQo+DQo+T24gVGh1LCBEZWMg
MTIsIDIwMTkgYXQgMDM6MDk6MzJBTSArMDAwMCwgUGVuZyBNYSB3cm90ZToNCj4+IEhlbGxvIFJ1
c3NlbGwsDQo+Pg0KPj4gVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91ciBzdHJpY3QgZ3VpZGFuY2Ug
YW5kIGNvbW1lbnRzLg0KPj4gSSByZWFsaXplZCBpdCBpcyBoYXJkIHRvIHVzIHRoYXQgd2Ugd2Fu
dCB0byBpMmMgdXNlZCBlZG1hIHdoZW4gZWRtYQ0KPj4gcHJvYmUgYWZ0ZXIgaTJjIHByb2JlLg0K
Pg0KPkkgaGF2ZSBubyBwcm9ibGVtIHdpdGggdGhhdCBhaW0uICBJJ20ganVzdCB2ZXJ5IGNvbmNl
cm5lZCBieSB0aGUgcHJvcG9zZWQNCj5pbXBsZW1lbnRhdGlvbiwgZXNwZWNpYWxseSB3aGVuIGl0
IGhhcyBhbHJlYWR5IGJlZW4gcHJvdmVuIHRvIGNhdXNlDQo+cmVncmVzc2lvbnMgaW4gdGhlIGtl
cm5lbC4gSSBzZWVtIHRvIHJlbWVtYmVyIHRoYXQgdGhlIGluZmluaXRlIGxvb3AgY2F1c2VkDQo+
b3RoZXIgaXNzdWVzLCBzdWNoIGFzIHRoZSBzeXN0ZW0gYmVpbmcgdW5hYmxlIHRvIGNvbXBsZXRl
IGJvb3RpbmcuDQo+DQo+PiBJIGxvb2sgZm9yd2FyZCB0byBkaXNjdXNzaW5nIHdpdGggeW91IGFz
IGJlbG93LCBpZiB5b3UgbGlrZS4NCj4+IFRoYW5rcy4NCj4+DQo+PiBZb3Ugc2F5IEkgY291bGQg
ZG8gdGhpczoNCj4+ICJTbywgaWYgeW91IHdhbnQgdG8gZG8gdGhpcyAoYW5kIHllcywgSSdkIGFs
c28gZW5jb3VyYWdlIGl0IHRvIGJlDQo+PiBjb25kaXRpb25hbCBvbiBFRE1BIGJlaW5nIGJ1aWx0
LWluLCBhcyBJMkMgaXMgY29tbW9ubHkgdXNlZCBhcyBhIHdheQ0KPj4gdG8gZ2V0IGF0IFJUQ3Ms
IHdoaWNoIGFyZSByZWFkIGJlZm9yZSBrZXJuZWwgbW9kdWxlcyBjYW4gYmUgbG9hZGVkKQ0KPj4g
dGhlbiB5b3UgTVVTVCBtb3ZlDQo+PiBpMmNfaW14X2RtYV9yZXF1ZXN0KCkgYmVmb3JlDQo+PiBp
MmNfYWRkX251bWJlcmVkX2FkYXB0ZXIoKSB0byBhdm9pZCB0aGUgaW5maW5pdGUgbG9vcC4iDQo+
Pg0KPj4gRXZlbiBpZiBJIGRvIHRoaXMsIEl0J3MgaGFyZCB0byBhdm9pZCB0aGUgaW5maW5pdGUg
bG9vcCBvZiBpMmMgcHJvYmUgY2F1c2VkIGJ5DQo+RURNQShidWlsZC1pbikgaW5pdGlhbGl6YXRp
b24gZmFpbHVyZS4NCj4NCj5JdCBpc24ndCBjbGVhciB3aGF0IHlvdSBtZWFuIGhlcmUuDQo+DQo+
SWYgRURNQSBmYWlscyB0byBwcm9iZSAoYmVjYXVzZSBmc2xfZWRtYV9wcm9iZSgpIHJldHVybnMg
YW4gZXJyb3Igb3RoZXIgdGhhbg0KPkVQUk9CRV9ERUZFUikgdGhlbiBvZl9kbWFfZmluZF9jb250
cm9sbGVyKCkgd2lsbCByZXR1cm4gTlVMTC4gVGhhdCB3aWxsIGJlDQo+cHJvcGFnYXRlZCBkb3du
IHRocm91Z2ggaTJjX2lteF9kbWFfcmVxdWVzdCgpLiBUaGlzIGlzIG5vIGRpZmZlcmVudCBmcm9t
IHRoZQ0KPmNhc2Ugd2hlcmUgRURNQSBpcyBidWlsdCBhcyBhIG1vZHVsZS4gSXQgaXMgYWxzbyBu
byBkaWZmZXJlbnQgZnJvbSB0aGUgY2FzZQ0KPndoZXJlIEVETUEgaGFzbid0IHlldCBiZWVuIHBy
b2JlZC4NCj4NCkhlbGxvIFJ1c3NlbGwsDQoNClRoZSByZXN1bHQgb2YgbXkgdGVzdCBpcyBub3Qg
bGlrZSB0aGF0LCBJdCBpcyBzdGlsbCB3aXRoIHByb2JlIGxvb3AsIHRoZSB0ZXN0IGNvbmZpZyBh
cyBmb2xsb3dzOg0KMS5FRE1BIGJ1aWxkLWluDQoyLnJldHVybiAtRUlOVkFMIHRvcCBvZiBmc2xf
ZWRtYV9wcm9iZSB3aGVuIGVkbWEgcHJvYmUNCjMuaTJjIHByb2JlIHdpdGggb3JpZ2luYWwgcGF0
Y2gsIEkgcHV0IHRoZSBpMmNfaW14X2RtYV9yZXF1ZXN0IGluIGZyb250IG9mIGkyY19hZGRfbnVt
YmVyZWRfYWRhcHRlciBvciB1c2VkIG9yaWdpbmFsIHBhdGNoLg0KDQpJIHNlbmQgeW91IHRoZSBm
dW5jdGlvbiBvZl9kbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsIGNvdWxkIGV4cGxhaW4gaXQgbGFz
dCBtYWlsLA0KIlJldHVybiAtRVBST0JFX0RFRkVSIiBkZXBlbmRzIG9uOg0KMS4gZWRtYSBub3Qg
cHJvYmUgb3IgcHJvYmUgZmFpbGVkDQoyLiBUaGVyZSBpcyBlZG1hIG5vZGUgaW4gRFRTIGFuZCBJ
MkMgd2l0aCBlZG1hIHByb3BlcnR5DQoNCj5JZiBpMmNfaW14X2RtYV9yZXF1ZXN0KCkgaXMgcGxh
Y2VkIGFmdGVyIGkyY19hZGRfbnVtYmVyZWRfYWRhcHRlcigpLCBhbmQNCj5FUFJPQkVfREVGRVIg
aXMgcHJvcGFnYXRlZCBvdXQgb2YgaTJjX2lteF9wcm9iZSgpLCB0aGVuIF95ZXNfLCBpdCB3aWxs
IGNhdXNlDQo+YW4gaW5maW5pdGUgbG9vcCwgYmVjYXVzZSB5b3UgYXJlIHJlcGxpY2F0aW5nIHRo
ZSBleGFjdCBjb25kaXRpb25zIHRoYXQgY2F1c2VkDQo+dGhlIGF0dGVtcHQgdG8gcHJvcGFnYXRl
IGkyY19pbXhfZG1hX3JlcXVlc3QoKSdzIHJldHVybiB2YWx1ZSB0byBiZSByZXZlcnRlZA0KPmxh
c3QgdGltZSAtIHdoaWNoIGJyb3VnaHQgdGhlIGtlcm5lbCB0byBhIGdyaW5kaW5nIGhhbHQuDQo+
DQo+SWYgaTJjX2lteF9kbWFfcmVxdWVzdCgpIGlzIHBsYWNlZCBiZWZvcmUgaTJjX2FkZF9udW1i
ZXJlZF9hZGFwdGVyKCksIHRoZW4NCj50aGVyZSBpcyBubyBpbmZpbml0ZSBkZWZlcnJlZCBwcm9i
aW5nIGxvb3AgLSB5ZXMsIGkyY19pbXhfcHJvYmUoKSB3aWxsIGJlIGNhbGxlZCBhcw0KPmEgcmVz
dWx0IG9mIG90aGVyIGRyaXZlcnMgc3VjY2Vzc2Z1bGx5IHByb2JpbmcsIGFuZCBlYWNoIHRpbWUg
aXQgd2lsbCByZXR1cm4NCj5FUFJPQkVfREVGRVIsIGJ1dCB0aGUgX2tleV8gcG9pbnQgaXMgdGhh
dCB0aGUgYWN0aW9uIG9mIGkyY19pbXhfcHJvYmUoKSB3aWxsDQo+bm90IF9zZWxmIHRyaWdnZXJf
IHRoZSBkZWZlcnJlZCBwcm9iaW5nIF9hbmRfIHBsYWNlIGl0c2VsZiBvbnRvIHRoZSBkZWZlcnJl
ZA0KPnByb2JlIGxpc3QuDQo+DQo+UGxlYXNlLCByYXRoZXIgdGhhbiBjb250aW51aW5nIHRvIHNl
bmQgZW1haWxzIGFyZ3Vpbmcgb3ZlciB0aGlzIHBvaW50LA0KPmludmVzdGlnYXRlIHRoZSBzdGF0
ZWQgaXNzdWUgd2l0aCBzb21lIHByYWN0aWNhbCB0ZXN0czoNCj4NCj4xLiBNYWtlIGkyY19pbXhf
cHJvYmUoKSBwcm9wYWdhdGUgaTJjX2lteF9kbWFfcmVxdWVzdCgpJ3MgcmV0dXJuIHZhbHVlLA0K
PiAgIGFzIGl0IGRpZCBpbiB0aGUgb3JpZ2luYWwgcGF0Y2guDQo+Mi4gQnVpbGQgaTJjLWlteCBp
bnRvIHRoZSBrZXJuZWwuDQo+My4gQnVpbGQgZWRtYSBhcyBhIG1vZHVsZS4NCj40LiBCdWlsZCBh
bmQgdGVzdCBib290IHRoZSBrZXJuZWwgYW5kIGNoZWNrIHdoYXQgaGFwcGVucy4NCj41LiBNb3Zl
IGkyY19pbXhfZG1hX3JlcXVlc3QoKSBiZWZvcmUgaTJjX2FkZF9udW1iZXJlZF9hZGFwdGVyKCkg
Ni4gQnVpbGQNCj5hbmQgdGVzdCBib290IHRoZSByZXN1bHRpbmcga2VybmVsIGFuZCBub3RlIGFu
eSBkaWZmZXJlbmNlcy4NCj4NCltQZW5nIE1hXSB0aGUgaTJjIHByb2JlIGxvb3Agc3RpbGwgZXhp
c3QgYnV0IG5vdCBpbmZpbml0ZSBsb29wIHdpdGggYmVsb3cgY2FzZXM6DQoxOiANCglVc2VkIG9y
aWdpbmFsIHBhdGNoDQoJQnVpbGQgaTJjLWlteCBpbnRvIHRoZSBrZXJuZWwNCglCdWlsZCBlZG1h
IGludG8gdGhlIGtlcm5lbA0KMjoNCglVc2VkIG9yaWdpbmFsIHBhdGNoDQoJQnVpbGQgaTJjLWlt
eCBpbnRvIHRoZSBrZXJuZWwNCglCdWlsZCBlZG1hIGludG8gdGhlIGtlcm5lbA0KCU1vdmUgaTJj
X2lteF9kbWFfcmVxdWVzdCgpIGJlZm9yZSBpMmNfYWRkX251bWJlcmVkX2FkYXB0ZXIoKQ0KMzoN
CglVc2VkIG9yaWdpbmFsIHBhdGNoDQoJQnVpbGQgaTJjLWlteCBpbnRvIHRoZSBrZXJuZWwNCglC
dWlsZCBlZG1hIGFzIGEgbW9kdWxlDQoJTW92ZSBpMmNfaW14X2RtYV9yZXF1ZXN0KCkgYmVmb3Jl
IGkyY19hZGRfbnVtYmVyZWRfYWRhcHRlcigpDQoNCkkgc2F3IHRoZSBjb21taXQgZThjMjIwZmFj
NDE1ZDlmNGE5OTRiMGMyODcxYjgzNWZlYWMxZWI0ZSB5b3Ugc2FpZA0KMS4gaTJjX2lteF9wcm9i
ZSgpIGlzIGNhbGxlZCBhbmQgc3VjY2Vzc2Z1bGx5IHJlZ2lzdGVycyBhbiBJMkMNCiAgIGFkYXB0
ZXIgdmlhIGkyY19hZGRfbnVtYmVyZWRfYWRhcHRlcigpDQoNCjIuIEFzIGEgcGFydCBvZiBpMmNf
YWRkX251bWJlcmVkX2FkYXB0ZXIoKSBuZXcgSTJDIHNsYXZlIGRldmljZXMNCiAgIGFyZSBhZGRl
ZCBmcm9tIERUIHdoaWNoIHJlc3VsdHMgaW4gYSBjYWxsIHRvDQogICBkcml2ZXJfZGVmZXJyZWRf
cHJvYmVfdHJpZ2dlcigpDQoNCjMuIGkyY19pbXhfcHJvYmUoKSBjb250aW51ZXMgYW5kIGNhbGxz
IGkyY19pbXhfZG1hX3JlcXVlc3QoKSB3aGljaA0KICAgZHVlIHRvIGxhY2sgb2YgcHJvcGVyIERN
QSBkcml2ZXIgcmV0dXJucyAtRVBST0JFX0RFRkVSDQoNCjQuIGkyY19pbXhfcHJvYmUoKSBmYWls
cywgcmVtb3ZlcyBJMkMgYWRhcHRlciBhbmQgcmV0dXJucw0KICAgLUVQUk9CRV9ERUZFUiwgd2hp
Y2ggcGxhY2VzIGl0IGludG8gZGVmZXJyZWQgcHJvYmUgbGlzdA0KDQo1LiBEZWZlcnJlZCBwcm9i
ZSB3b3JrIHRyaWdnZXJlZCBpbiAjMiBhYm92ZSBraWNrcyBpbiBhbmQgY2FsbHMNCiAgIGkyY19p
bXhfcHJvYmUoKSBhZ2FpbiB0aHVzIGJyaW5naW5nIHVzIHRvIHN0ZXAgIzEiDQpDYW4gSSB1bmRl
cnN0YW5kIDQsIHlvdSBtZWFuIGp1c3QgcmVtb3ZlIEkyQyBhZGFwdGVyIHRoZSBpMmMgc2xhdmUg
ZGV2aWNlcyBub3QgYmUgcmVtb3ZlZD8gVGhlbiB0aGUgaTJjIHNsYXZlIGRldmljZXMgd2lsbCBw
cm9iZSB0aGVpciBkcml2ZXJzIHRyaWdnZXJlZCB0aGUgZHJpdmVyX2RlZmVycmVkX3Byb2JlX3Ry
aWdnZXIoKS4NCklmIHNvLCBNeSB0ZXN0IGlzIG5vdCBsaWtlIHRoaXMsIHdoZW4gdGhlIGkyYyBw
cm9iZSBmYWlsZWQgdGhlIGkyYyBzbGF2ZSBkZXZpY2VzIHdpbGwgYmUgcmVtb3ZlZCBhbmQgSTJD
IGFkYXB0ZXIgd2lsbCBiZSByZW1vdmVkIHRvby4NCg0KQmVzdCBSZWdhcmRzLA0KUGVuZw0KPi0t
DQo+Uk1LJ3MgUGF0Y2ggc3lzdGVtOg0KPmh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rp
b24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5hcg0KPm1saW51eC5vcmcudWsl
MkZkZXZlbG9wZXIlMkZwYXRjaGVzJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NwZW5nLm1hDQo+JTQw
bnhwLmNvbSU3Q2E1MzU3MTJlYWJlMzQzYTUxYzJmMDhkNzdlZjI1MGU0JTdDNjg2ZWExZDNiYzJi
NGM2DQo+ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzExNzQ1MTYyNzM0MTE1NSZhbXA7
c2RhdGE9JTJGeXoNCj54QUk4JTJGZXpWUndHVGFUNHZZYTNDTWtJTXNhU1lpYUg4RGp2SldVS0El
M0QmYW1wO3Jlc2VydmVkPTANCj5GVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1
YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2Jwcw0KPnVwIEFjY29yZGluZyB0byBz
cGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXANCg==
