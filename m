Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B498A14586
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 09:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfEFHp1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 03:45:27 -0400
Received: from mail-eopbgr40056.outbound.protection.outlook.com ([40.107.4.56]:14247
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725917AbfEFHp1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 03:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq3dtTTogPg7jiLJB6fd+rGvKWzQRDNJAeQaDU14Y+M=;
 b=lC7Et1u9pCWYxst17oo75e2E+GY6db0nrcLcR4oZrOHzDNJYa0YyuZ/fO0od9KGavtkGtNwwxuv7amd4eydxAT8WfmZRmqxJLRI5s87npyTotSl0lcgLGpAcuOjZvX8yoC4Z76Mdk2GLLOuB68lOGw6l27HsQunJkzyX2Aduca4=
Received: from AM6PR04MB4357.eurprd04.prod.outlook.com (52.135.167.33) by
 AM6PR04MB5414.eurprd04.prod.outlook.com (20.178.92.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 07:44:44 +0000
Received: from AM6PR04MB4357.eurprd04.prod.outlook.com
 ([fe80::f062:7002:6318:780b]) by AM6PR04MB4357.eurprd04.prod.outlook.com
 ([fe80::f062:7002:6318:780b%2]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 07:44:44 +0000
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "peda@axentia.se" <peda@axentia.se>,
        Sumit Batra <sumit.batra@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/2] arm64: dts: fsl: ls1046a: Add the guts node
 in dts
Thread-Topic: [EXT] Re: [PATCH 2/2] arm64: dts: fsl: ls1046a: Add the guts
 node in dts
Thread-Index: AQHU/w+WdcCQP8nmx0uhj1EM4V4JRKZdwAKAgAAAiDA=
Date:   Mon, 6 May 2019 07:44:43 +0000
Message-ID: <AM6PR04MB4357FB81536B39AF58BAD79B97300@AM6PR04MB4357.eurprd04.prod.outlook.com>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430044719.30720-2-chuanhua.han@nxp.com>
 <20190506074106.eqa7xhktn2vlmtio@pengutronix.de>
In-Reply-To: <20190506074106.eqa7xhktn2vlmtio@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chuanhua.han@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4d16648-90de-4bea-be00-08d6d1f6b487
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR04MB5414;
x-ms-traffictypediagnostic: AM6PR04MB5414:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB54145219DA268BC346252E3497300@AM6PR04MB5414.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(376002)(366004)(39860400002)(396003)(13464003)(199004)(189003)(71200400001)(6916009)(102836004)(71190400001)(53936002)(86362001)(6436002)(6246003)(6506007)(45080400002)(53546011)(966005)(14454004)(478600001)(68736007)(54906003)(7696005)(33656002)(76176011)(99286004)(316002)(14444005)(25786009)(256004)(4326008)(66066001)(2906002)(66476007)(55016002)(486006)(9686003)(6306002)(66446008)(64756008)(66556008)(74316002)(11346002)(446003)(8936002)(8676002)(7416002)(44832011)(81156014)(81166006)(229853002)(76116006)(5660300002)(52536014)(3846002)(6116002)(476003)(26005)(186003)(7736002)(66946007)(73956011)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB5414;H:AM6PR04MB4357.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EWqWdSQY47Lgg9DcFv6AVokHigDrbQu+QwWHRPS3SaVKmABxlwm3ZX1YqMj0QPXIOix+eQJLyv9mYXzMj6AYGZ9DBp93QJhwoh9ssciS4BHJ6D0aTMnXTuJTRg1K6T9SJP2kuxA/nOkr1tIpyaWkxkSRLJibVny9Tsl0NBCMmFmLemSOQKAXkSByGSC7R8siiY0mtPCOvCyl+HFMmqArhfoGBprAnZFRCed+bCTaIkOlmof9Ljpqs/e5p3T0ZJrdkyI9B3+bAgMcKVS3C7zfJUQ4D5J5nUOVUdaXFnTnWDmkNINvFEO1F2lEzbWiarCuku6xzwiUpkBAHHyEvVKUjzqnp3I+VZd+xD2yy7xUwf5kUZSEYYUwE1b6qIok0IkTAb+ySS4t/dZJMJxITNidmLLi+k2rrUDxfN7l4v+BisA=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d16648-90de-4bea-be00-08d6d1f6b487
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 07:44:43.9948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5414
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FzY2hhIEhhdWVyIDxz
LmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAyMDE5xOo11MI2yNUgMTU6NDENCj4gVG86
IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+IENjOiBzaGF3bmd1b0BrZXJu
ZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZzsN
Cj4gbWFyay5ydXRsYW5kQGFybS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+
IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWlsLmNv
bTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IHdzYStyZW5lc2FzQHNhbmct
ZW5naW5lZXJpbmcuY29tOw0KPiB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGVoYUBk
ZWlmLmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsNCj4gbC5zdGFjaEBwZW5ndXRyb25peC5k
ZTsgcGVkYUBheGVudGlhLnNlOyBTdW1pdCBCYXRyYQ0KPiA8c3VtaXQuYmF0cmFAbnhwLmNvbT4N
Cj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCAyLzJdIGFybTY0OiBkdHM6IGZzbDogbHMxMDQ2
YTogQWRkIHRoZSBndXRzIG5vZGUgaW4NCj4gZHRzDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwN
Cj4gDQo+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDEyOjQ3OjE5UE0gKzA4MDAsIENodWFuaHVh
IEhhbiB3cm90ZToNCj4gPiBGb3IgTlhQIGxzMTA0NmEgU29DLCB0aGUgaTJjIGNsb2NrIG5lZWRz
IHRvIGJlIGNvbmZpZ3VyZWQgd2l0aCB0aGUNCj4gPiBhcHByb3ByaWF0ZSBiaXQgb2YgUkNXLCBz
byB3ZSBhZGQgdGhlIGd1dHMgbm9kZSAoR1VUUy9EQ0ZHIGdsb2JhbA0KPiA+IHV0aWxpdGllcyBi
bG9jaykgZm9yIHRoZSBkcml2ZXIgdG8gcmVhZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFN1
bWl0IEJhdHJhIDxzdW1pdC5iYXRyYUBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENodWFu
aHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZhLmR0c2kgfCA1ICsrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS5kdHNpDQo+ID4gYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS5kdHNpDQo+ID4gaW5kZXggMzczMzEwZTRj
MGVhLi5mODg1OTlkZjE4YmIgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvZnNsLWxzMTA0NmEuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2ZzbC1sczEwNDZhLmR0c2kNCj4gPiBAQCAtMjA1LDYgKzIwNSwxMSBAQA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICAgICAgICAg
ICAgICAgfTsNCj4gPg0KPiA+ICsgICAgICAgICAgICAgZ3V0czogZ2xvYmFsLXV0aWxpdGllc0Ax
ZWUwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wscW9y
aXEtZGV2aWNlLWNvbmZpZyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAg
MHgxZWUwMDAwIDB4MCAweDEwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgfTsNCj4gDQo+IEFjY29y
ZGluZyB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9ndXRzLnR4
dCB3ZSBoYXZlIHRoZQ0KPiBmb2xsb3dpbmcgY29tcGF0aWJsZXM6DQo+IA0KPiAgICAgICAgICJm
c2wscW9yaXEtZGV2aWNlLWNvbmZpZy0xLjAiDQo+ICAgICAgICAgImZzbCxxb3JpcS1kZXZpY2Ut
Y29uZmlnLTIuMCINCj4gICAgICAgICAiZnNsLDxjaGlwPi1kZXZpY2UtY29uZmlnIg0KPiAgICAg
ICAgICJmc2wsPGNoaXA+LWd1dHMiDQo+IA0KPiAiZnNsLHFvcmlxLWRldmljZS1jb25maWciIGlz
IG5vbmUgb2YgdGhlbSBhbmQgSSBkb24ndCB0aGluayB5b3Ugc2hvdWxkIGdpdmUgdGhpcw0KPiBT
b0Mgc3BlY2lmaWMgdGhpbmcgYSBnZW5lcmljIGNvbXBhdGlibGUuDQo+ICJmc2wsbHMxMDQ2YS1k
ZXZpY2UtY29uZmlnIiB3b3VsZCBiZSBiZXR0ZXIuDQp5ZXMsIHlvdSBhcmUgcmlnaHQsSSB3aWxs
IG1vZGlmeSBpdCANCj4gDQo+IFNhc2NoYQ0KPiANCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUu
Sy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+IHwNCj4gSW5kdXN0cmlhbCBMaW51eCBT
b2x1dGlvbnMgICAgICAgICAgICAgICAgIHwNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZ3d3cucGUNCj4gbmd1dHJvbml4
LmRlJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NjaHVhbmh1YS5oYW4lNDBueHAuY29tJTdDMTM5DQo+
IDIzZmUxN2ExZDQ2ZGFkN2U3MDhkNmQxZjYzZjQxJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTlj
NWMzMDE2MzUNCj4gJTdDMCU3QzAlN0M2MzY5MjcyNTI4ODU0NTgzNDQmYW1wO3NkYXRhPVJMZURp
Q3RMSlJZek9aUTRQOENOOGcNCj4gaFRVR05GJTJGS0ElMkZUJTJGdExTQ3JnRWFFJTNEJmFtcDty
ZXNlcnZlZD0wICB8DQo+IFBlaW5lciBTdHIuIDYtOCwgMzExMzcgSGlsZGVzaGVpbSwgR2VybWFu
eSB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMA0KPiB8DQo+IEFtdHNnZXJpY2h0IEhpbGRlc2hl
aW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDoNCj4gKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfA0K
