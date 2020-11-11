Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110592AE6EC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Nov 2020 04:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgKKDQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 22:16:54 -0500
Received: from mail-am6eur05on2049.outbound.protection.outlook.com ([40.107.22.49]:63943
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbgKKDQy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Nov 2020 22:16:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K79z88SJgJdgo0ePzXet9LS6/9Qt/WgrQyIr5aYtZ3Vpnm8sbF3kv78Z3mcC/lDL5IFYSeEmiiBbr2OchriQzX23I9Qw2T6N1OlvBNFUru+tMmqTVnU8zbRUR5svRvxMT2oko9PCWIYN5oe/K+yX3fmxdje2X9riD2rdf1CcXBoonqRWJo5w5fJQwApC1rQN94B22AjQHi3M68ZvxpUEJUIarvl3FNNc4kzFX1AyiTO1w0R26LDW8iNKGIW9xxeF0HTAaar2/2bs4e2V+Pdim6+N3ros1wADDraIM0hbYjTAMq7J0arQl0bYjQ7o3JjFpPLAeVBfRDPM98Jr6f8GQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLpZlMJrHcjrVrUrtBkTv35YHsl+fBcBNVCHZvpbacw=;
 b=MSmC4BRcz0/FFgQgrGnCdDeeBugiGroXGhoO1Ge7nxMRqcFZNv3whmm8R+ypngqKXyxjzspW67iiChvvDBRpa/ADAAU2kmX2X5aDzlBcGMmkRNPhCzFLpCOEk6FZbD+MYdYtch6a96CIX1nnNzPICY/f32yeHHZlXBhW/k5WKQsFdLAOxdNBotLm4v9TvE40YWvv0yagRmmHsMPuVncklRU9pQ0p/f/6+gaolMPYp7TDJ1PLr1eYxJRBiG4mf2it1dvQejQKkiuHVA4kfcTtv44KoqHsiDuOLMlXVlYq/wELxNnu9ed3a+4LZ7sPovGbllEZ0EqE5r/N279c1YBFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLpZlMJrHcjrVrUrtBkTv35YHsl+fBcBNVCHZvpbacw=;
 b=cjBDVQ/VhH6TTCrIb7ZOj2KBCFs9aQMCeZpOJGMTFchSYh5YES2DgTc1srB8XeE5NSB0D82s82IPk3LoxGvVwxdEXkV33gFtCwS0ZsSe6G2u3nk0SGMIgE/jBUuHJjbdr2KKT8Ac1sWtGX4sr1lXwbFrRCgsHbA3yh86n6O57LU=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB8PR04MB6700.eurprd04.prod.outlook.com (2603:10a6:10:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 03:16:49 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22%11]) with mapi id 15.20.3541.025; Wed, 11 Nov
 2020 03:16:49 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [v9 2/2] i2c: imx: select I2C_SLAVE by default
Thread-Topic: [v9 2/2] i2c: imx: select I2C_SLAVE by default
Thread-Index: AQHWt9kXxAiAEtzt90iI1MGgNESNSg==
Date:   Wed, 11 Nov 2020 03:16:49 +0000
Message-ID: <DB6PR0401MB2438A59A8061902DD8C30BE58FE80@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20201102082102.16508-1-biwen.li@oss.nxp.com>
 <20201102082102.16508-2-biwen.li@oss.nxp.com>
 <20201110104841.go32dadjctuprxxu@pengutronix.de>
In-Reply-To: <20201110104841.go32dadjctuprxxu@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: baa35605-800b-42f0-ae47-08d885f03a7e
x-ms-traffictypediagnostic: DB8PR04MB6700:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB670030DE2863D70DE63A1D40CEE80@DB8PR04MB6700.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: USAijHhwCegP+8cZEeZZj7jFJGjxUVLEAsdQ9enLqejZi+yGeJ2RcQTzEwJkpMIPpfr5YQ+2I0HISuxEXwRfrk0nUF2Ipmb5Jop/Gd5ZRNz+fSyjIwwu8OkYpfRyt99D5mEhj7pvhKXmE76VkB8u4LoVPRzhCnTiUgCEmMd2soZ+5ZL8ywM4be+HhNUPXgTmMrXzgT4IzuxINOBw6/NzVYEyTyy0HWqd4D5w4whP5yBd0ExBPh9Y4rtq1/M6l3u0iPxfM2UbnDozLoQ2crdQ17wk4vGBdFuxUZnvPJhdorkCDy0Gq++GRTVL6hSoZygagMoQUq5oqUTJsLlZor7L4UGg4tkShfq0l8424l1vitfiawUoysYcgvEaeFkxojXhdwuY2n0QQOLw9B2XBkyiHipmh0AiES8H7Q5W/J5IF9crbp7ry9c6XWtRQLrbTnmsz+SUaTw/Mox8L0jZ7lzERg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(26005)(966005)(2906002)(76116006)(64756008)(71200400001)(8676002)(110136005)(54906003)(55016002)(8936002)(9686003)(316002)(7696005)(52536014)(86362001)(478600001)(5660300002)(66946007)(186003)(66556008)(33656002)(66476007)(4326008)(83080400002)(7416002)(6506007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3bWoj8gIjYBR1z87CFOCaIhgAev54BtfNHxbGwRGdAazrb5MB4TtKiGeN9LzwGf2mdXbD9/R1u1ASWb8npyqms+I7Sus4ZKHteWCV8PcKwVBfR0P0JYgZ9qNpnBAadbtPcuZ9RNgB3Rm3U/tr0ZlEcLSN16Xkk/lzFPl2/zosiCvZJimioRRz6G41Ey/Uvs9GV3QXtUcZM6Q8fMhuC16RvnTKx/+F25yg7L3Urh+eSOHBwE6vPHnql5Qjcs6mCoZ9bWos+OACbyDtwphhaFiL0Cgd2g+MZAR1yfn67HpBxtTJaPx4TnOwBk7wbGv3xWhHbEBz7bM1HZjVBYgtLbEk7h0nucsfjqfKT+XUvwtheA1wxiaBtoOgv16RZvgd2PmrIv7uxyi1HCWiuXgDvG3S3pHKTTF/nf9CA5dWmH8UBfUhMsTiZOsbPn5WZozF/U2jmoc7fBV2Wop6BMjM04zsOybbiqgJ4Q7Eu0yW0JW/qhFu9Od1gv6cJu29xk5grlzCEN601IBSCeQGKwhOc/e8E9xgdfAKM2BUmV+DQfrnnYznBtc01iRto5fonYHH/IjpVwnex/ZMtuARZaOnWUy6ez5QR9mYBnUdSf8KybZN6+EqjHKrQSSQ90Rj9WbkuibELgxI6HEGuSRT96PipN8i4OIekLyV0WIJUlL/v+10XBHooZotR9jOdn5F5pS88JEptLz1bxhRxq6g2/s/KEwinvZzICtoNHVJ4iWljPcvOAzt1ZRgL+Gu+iblcz1EzASPg+N9m4fTftzxMdkWQSRNxID5TyDdFg1l//2BoiWeve54V4XUt7bN17r7oY9+ZIDIENc8e+kg2lXX6oc8AcPCNeTVnNdf/xhI42HrYgvLbF8VAxSOaPelGQNvxnK4A/2MudXW4dRp4N+bl9Ba7aaHA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa35605-800b-42f0-ae47-08d885f03a7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 03:16:49.1931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7weMDwvUdNwwUJkcGdTjcv2Ggw5GtZnSwz9IuSh1+kKybhMHBfEHvoRib5Wa0/5pfcJdk4WCK2K+1/IyzTdhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6700
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gSGksDQo+IA0KPiBpdCBtYWtlcyBubyBzZW5zZSB0byBoYXZlIHNlcGFyYXRlIHBhdGNo
IGZvciBpdA0KT2theSwgZ290IGl0LiBJIHdpbGwgbWVyZ2UgaXQuDQo+IA0KPiBPbiBNb24sIE5v
diAwMiwgMjAyMCBhdCAwNDoyMTowMlBNICswODAwLCBCaXdlbiBMaSB3cm90ZToNCj4gPiBGcm9t
OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4gPg0KPiA+IFNlbGVjdCBJMkNfU0xBVkUg
YnkgZGVmYXVsdA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54
cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlIGluIHY5Og0KPiA+IAktIG5vbmUNCj4gPg0KPiA+
ICBkcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMv
S2NvbmZpZyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnDQo+ID4gaW5kZXggYTRmNDczZWY0
ZTVjLi5kM2Q5YTYxZGI3NmUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL0tj
b25maWcNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZw0KPiA+IEBAIC02NzUs
NiArNjc1LDcgQEAgY29uZmlnIEkyQ19JTUcNCj4gPiAgY29uZmlnIEkyQ19JTVgNCj4gPiAgCXRy
aXN0YXRlICJJTVggSTJDIGludGVyZmFjZSINCj4gPiAgCWRlcGVuZHMgb24gQVJDSF9NWEMgfHwg
QVJDSF9MQVlFUlNDQVBFIHx8IENPTERGSVJFDQo+ID4gKwlzZWxlY3QgSTJDX1NMQVZFDQo+ID4g
IAloZWxwDQo+ID4gIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gdXNlIHRoZSBJSUMgYnVz
IGNvbnRyb2xsZXIgb24NCj4gPiAgCSAgdGhlIEZyZWVzY2FsZSBpLk1YL01YQywgTGF5ZXJzY2Fw
ZSBvciBDb2xkRmlyZSBwcm9jZXNzb3JzLg0KPiA+IC0tDQo+ID4gMi4xNy4xDQo+ID4NCj4gPg0K
PiANCj4gLS0NCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwN
Cj4gfA0KPiBTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRw
Oi8vd3d3LnBlbmd1dHJvbml4LmRlLw0KPiB8DQo+IDMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkg
ICAgICAgICAgICAgICAgICB8IFBob25lOg0KPiArNDktNTEyMS0yMDY5MTctMCAgICB8DQo+IEFt
dHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDoNCj4gKzQ5LTUx
MjEtMjA2OTE3LTU1NTUgfA0K
