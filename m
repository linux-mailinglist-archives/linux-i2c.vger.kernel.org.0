Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D3D18492
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 06:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfEIEfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 00:35:43 -0400
Received: from mail-eopbgr140070.outbound.protection.outlook.com ([40.107.14.70]:63204
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726108AbfEIEfn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 May 2019 00:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1AbEwA7uFCYEkK5k9EIlcgc/vFWjMsPX96cDB4Ob0Q=;
 b=AH21/DI8JRCyAtZYEmytGo2yVomYd3GgIpAffhHsxyL5XkuI3xnzZ8WM/M09337/voB6c+vY9e7GJkfeglR60jmubzG4AkSZrCILOw9DD82Ffj7Jc8/RlQw8lR9vZEH9BTpmNnm/sxXktsM1IvRfg333SVuKBiRHyZNTQpfuPzk=
Received: from AM6PR04MB4629.eurprd04.prod.outlook.com (20.177.38.28) by
 AM6PR04MB4760.eurprd04.prod.outlook.com (20.177.32.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 04:35:33 +0000
Received: from AM6PR04MB4629.eurprd04.prod.outlook.com
 ([fe80::909a:bfcb:89aa:cdb7]) by AM6PR04MB4629.eurprd04.prod.outlook.com
 ([fe80::909a:bfcb:89aa:cdb7%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 04:35:33 +0000
From:   Sumit Batra <sumit.batra@nxp.com>
To:     Chuanhua Han <chuanhua.han@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
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
        "peda@axentia.se" <peda@axentia.se>
Subject: RE: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Thread-Topic: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Thread-Index: AQHU/w+WxhNHqUrORkaLbPX64iAO0KZUqIWAgAYQ6QCAAwWXgIADZuiAgAEXrjA=
Date:   Thu, 9 May 2019 04:35:33 +0000
Message-ID: <AM6PR04MB4629DEDAAA6559EBBD20E974EF330@AM6PR04MB4629.eurprd04.prod.outlook.com>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430125043.weqwzim4gpsvtkfe@pengutronix.de>
 <AM6PR04MB43571B8D52C1FE9ED20DBA1D97360@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <20190506073735.ctzybytamu44pbvv@pengutronix.de>
 <AM0PR04MB43534A9B1A146DEFA929844C97320@AM0PR04MB4353.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB43534A9B1A146DEFA929844C97320@AM0PR04MB4353.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sumit.batra@nxp.com; 
x-originating-ip: [92.120.0.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f6bbcc0-7d4c-4d2b-6d93-08d6d437c63e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR04MB4760;
x-ms-traffictypediagnostic: AM6PR04MB4760:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB47606942347F2A32A2519891EF330@AM6PR04MB4760.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(13464003)(86362001)(66066001)(76176011)(6506007)(53936002)(6246003)(74316002)(71200400001)(71190400001)(68736007)(14454004)(478600001)(966005)(45080400002)(54906003)(110136005)(99286004)(7696005)(102836004)(4326008)(7416002)(476003)(26005)(64756008)(73956011)(66946007)(33656002)(66446008)(66476007)(66556008)(53546011)(6436002)(55016002)(446003)(11346002)(8936002)(25786009)(486006)(76116006)(316002)(186003)(44832011)(52536014)(5660300002)(14444005)(229853002)(2906002)(81166006)(81156014)(8676002)(256004)(3846002)(6116002)(305945005)(7736002)(6306002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB4760;H:AM6PR04MB4629.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dOe1pKxfy9zFCEsqDmzmwFmnT0m8yL15q4rBRTjYpFxRyIyueWkLDdmg89bzMXQqbs6HpsvDWoytGmt2JK7mK86GFJUCuMGTdxyJfQ5fNB3gKBX0UzLB+yEm+8Tr1R0tTxT95d7GyflZoYkshqQdapX9snHX6LE+Fw9MJxwRaO6kbUgWYc6Bbsp+ti/3jn6QVRgurpmgPiigfuZDs4XHsgDNj0RMr5889zgtEsXbH59Y8ROkqDOIucC7D3IABsJ8O7aS4CEFWFpULgMsaM9WWj/vLeUD6YAxrLntwHKLz4CPqbefz0RXhchS+bLr/bipLNr3Os61hcnwht5EVHf2d/NKMCVNnc+MLDkJh4BDra2u6E2UA5996LocS7miu0zGt5GLfd3lgF/CSzwZteAnNDwsTT0gmlg4K+3Nv6PUWN4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6bbcc0-7d4c-4d2b-6d93-08d6d437c63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 04:35:33.2642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4760
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgU2FzY2hhLA0KUGxlYXNlIGNoZWNrIG15IGNvbW1lbnQNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IENodWFuaHVhIEhhbiANClNlbnQ6IFdlZG5lc2RheSwgTWF5IDgsIDIw
MTkgNTowNSBQTQ0KVG86IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCkNj
OiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IHJvYmgr
ZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdt
YWlsLmNvbTsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tOyB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGVoYUBk
ZWlmLmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsgbC5zdGFjaEBwZW5ndXRyb25peC5kZTsg
cGVkYUBheGVudGlhLnNlOyBTdW1pdCBCYXRyYSA8c3VtaXQuYmF0cmFAbnhwLmNvbT4NClN1Ympl
Y3Q6IFJFOiBbRVhUXSBSZTogW1BBVENIIDEvMl0gaTJjOiBpbXg6IEkyQyBEcml2ZXIgZG9lc24n
dCBjb25zaWRlciBJMkNfSVBHQ0xLX1NFTCBSQ1cgYml0IHdoZW4gdXNpbmcgbHMxMDQ2YSBTb0MN
Cg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAyMDE55bm0NeaciDbml6UgMTU6MzgN
Cj4gVG86IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+IENjOiBzaGF3bmd1
b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IA0KPiByb2JoK2R0QGtl
cm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyANCj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgDQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3Rl
dmFtQGdtYWlsLmNvbTsgZGwtbGludXgtaW14IA0KPiA8bGludXgtaW14QG54cC5jb20+OyB3c2Er
cmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbTsgDQo+IHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZTsgZWhhQGRlaWYuY29tOyBsaW51eEByZW1wZWwtcHJpdmF0LmRlOyANCj4gbC5zdGFj
aEBwZW5ndXRyb25peC5kZTsgcGVkYUBheGVudGlhLnNlOyBTdW1pdCBCYXRyYSANCj4gPHN1bWl0
LmJhdHJhQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbRVhUXSBSZTogW1BBVENIIDEvMl0gaTJj
OiBpbXg6IEkyQyBEcml2ZXIgZG9lc24ndCANCj4gY29uc2lkZXIgSTJDX0lQR0NMS19TRUwgUkNX
IGJpdCB3aGVuIHVzaW5nIGxzMTA0NmEgU29DDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4g
DQo+IE9uIFNhdCwgTWF5IDA0LCAyMDE5IGF0IDA5OjI4OjQ4QU0gKzAwMDAsIENodWFuaHVhIEhh
biB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gU2Vu
dDogMjAxOeW5tDTmnIgzMOaXpSAyMDo1MQ0KPiA+ID4gVG86IENodWFuaHVhIEhhbiA8Y2h1YW5o
dWEuaGFuQG54cC5jb20+DQo+ID4gPiBDYzogc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxs
ZW95YW5nLmxpQG54cC5jb20+Ow0KPiA+ID4gcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxh
bmRAYXJtLmNvbTsNCj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWky
Y0B2Z2VyLmtlcm5lbC5vcmc7IA0KPiA+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOw0KPiA+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWls
LmNvbTsgZGwtbGludXgtaW14IA0KPiA+ID4gPGxpbnV4LWlteEBueHAuY29tPjsgd3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb207IA0KPiA+ID4gdS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlOyBlaGFAZGVpZi5jb207IA0KPiA+ID4gbGludXhAcmVtcGVsLXByaXZhdC5kZTsgbC5z
dGFjaEBwZW5ndXRyb25peC5kZTsgcGVkYUBheGVudGlhLnNlOyANCj4gPiA+IFN1bWl0IEJhdHJh
IDxzdW1pdC5iYXRyYUBueHAuY29tPg0KPiA+ID4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCAx
LzJdIGkyYzogaW14OiBJMkMgRHJpdmVyIGRvZXNuJ3QgDQo+ID4gPiBjb25zaWRlciBJMkNfSVBH
Q0xLX1NFTCBSQ1cgYml0IHdoZW4gdXNpbmcgbHMxMDQ2YSBTb0MNCj4gPiA+DQo+ID4gPiBDYXV0
aW9uOiBFWFQgRW1haWwNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAxMjo0
NzoxOFBNICswODAwLCBDaHVhbmh1YSBIYW4gd3JvdGU6DQo+ID4gPiA+IFRoZSBjdXJyZW50IGtl
cm5lbCBkcml2ZXIgZG9lcyBub3QgY29uc2lkZXIgSTJDX0lQR0NMS19TRUwgKDQyNCANCj4gPiA+
ID4gYml0IG9mDQo+ID4gPiA+IFJDVykgaW4gZGVjaWRpbmcgIGkyY19jbGtfcmF0ZSBpbiBmdW5j
dGlvbiBpMmNfaW14X3NldF9jbGsoKSB7IDAgDQo+ID4gPiA+IFBsYXRmb3JtIGNsb2NrLzQsIDEg
UGxhdGZvcm0gY2xvY2svMn0uDQo+ID4gPiA+DQo+ID4gPiA+IFdoZW4gdXNpbmcgbHMxMDQ2YSBT
b0MsIHRoaXMgcG9wdWxhdGVzIGluY29ycmVjdCB2YWx1ZSBpbiBJQkZEIA0KPiA+ID4gPiByZWdp
c3RlciBpZiBJMkNfSVBHQ0xLX1NFTCA9IDAsIHdoaWNoIGdlbmVyYXRlcyBoYWxmIG9mIHRoZSBk
ZXNpcmVkIENsb2NrLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGVyZWZvcmUsIGlmIGxzMTA0NmEgU29D
IGlzIHVzZWQsIHdlIG5lZWQgdG8gc2V0IHRoZSBpMmMgY2xvY2sgDQo+ID4gPiA+IGFjY29yZGlu
ZyB0byB0aGUgY29ycmVzcG9uZGluZyBSQ1cuDQo+ID4gPg0KPiA+ID4gU28gdGhlIGNsb2NrIGRy
aXZlciByZXBvcnRzIHRoZSB3cm9uZyBjbG9jay4gUGxlYXNlIGZpeCB0aGUgY2xvY2sgZHJpdmVy
IHRoZW4uDQo+ID4gTm8sIHRoaXMgaXMgYSBwcm9ibGVtIHdpdGggdGhlIGkyYyBkcml2ZXIuIEl0
IGlzIG5vdCBhIHByb2JsZW0gd2l0aCANCj4gPiB0aGUgY2xvY2sgZHJpdmVyLCBzbyB0aGUgaTJj
IGRyaXZlciBuZWVkcyB0byBiZSBtb2RpZmllZC4NCj4gDQo+IFNvIGhvdyBkb2VzIHRoaXMgUkNX
IGJpdCBnZXQgZXZhbHVhdGVkPyANCkFjY29yZGluZyB0byB0aGUgcmVmZXJlbmNlIG1hbnVhbA0K
PiBvbmx5IG9uZSBjbG9jayBnb2VzIHRvIHRoZSBpMmMgbW9kdWxlIChkZXNjcmliZWQgYXMgMS8y
IFBsYXRmb3JtDQo+IENsb2NrKSBhbmQgdGhlIGkyYyBtb2R1bGUgb25seSB0YWtlcyBvbmUgY2xv
Y2suIFNvIGl0IHNlZW1zIHRoZXJlIG11c3QgDQo+IGJlIGEgLzIgZGl2aWRlciBzb21ld2hlcmUs
IGVpdGhlciBpbiBlYWNoIGkyYyBtb2R1bGUgb3Igc29tZXdoZXJlIA0KPiBvdXRzaWRlLiBDYW4g
eW91ciBJQyBndXlzIHRlbGwgeW91IHdoZXJlIGl0IGlzPw0KSSBuZWVkIHRvIGNvbmZpcm0gdGhp
cyB3aXRoIHRoZSBJQyB0ZWFtDQpbU3VtaXQgQmF0cmFdIFRoZXJlIGFyZSAyIHBsYWNlcyB3aGVy
ZSBjbG9jayBkaXZpc2lvbiB0YWtlcyBwbGFjZSAtDQogICAgICAgICAgICAgIDEpIFRoZXJlIGlz
IGEgY2xvY2sgZGl2aWRlciBvdXRzaWRlIG9mIEkyQyBibG9jaywgd2hpY2ggbWFrZXMgdGhlIGNs
b2NrIHJlYWNoaW5nIEkyQyBtb2R1bGUgYXMgLSBQbGF0Zm9ybSBDbG9jay8yDQoJMikgVGhlcmUg
aXMgYW5vdGhlciBjbG9jayBkaXZpZGVyIHdoaWNoIHNwZWNpZmljYWxseSBkaXZpZGVzIHRoZSBj
bG9jayB0byB0aGUgSTJDIGJsb2NrLCBiYXNlZCBvbiBSQ1cgYml0IDQyNCAoaWYgNDI0dGggYml0
IGlzIDAgdGhlbiB0aGUgYmF1ZCBjbG9jayBzb3VyY2UgaXMgUGxhdGZvcm0gQ2xvY2svNCwgaWYg
NDI0dGggYml0IGlzIDEgdGhlbiBpdCByZW1haW5zIFBsYXRmb3JtIENsb2NrLzIpDQogICAgICAg
ICAgICAgIDMpIE5vdyBiYXNlZCBvbiB0aGUgd2hhdCBpcyB0aGUgZGVzaXJlZCBTQ0wgdmFsdWUg
KDEwMEtIeiBldGMpIGFuZCB0aGUgY2xvY2sgd2hpY2ggaXMgcmVjZWl2ZWQgYnkgSTJDIGJsb2Nr
LCB0aGVyZSBpcyBhIGNhbGN1bGF0aW9uIHRoYXQgZ29lcyBvbiBpbnNpZGUgdGhlIEkyQyBkcml2
ZXIgbW9kdWxlIHdoaWNoIGlzIHVzZWQgdG8gbWFwIGEgdmFsdWUgaW4gdGhpcyBpbXhfaTJjX2Ns
a19kaXYgdGFibGUuDQogICAgICAgICAgICAgICAgICBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gcHJv
Z3JhbSB0aGUgSU1YX0kyQ19JRkRSIHJlZ2lzdGVyIG9mIHRoZSBJMkMgYmxvY2suIE5vdyBpZiB3
ZSBkb24ndCBjb25zaWRlciB0aGUgUkNXIGJpdCA0MjQgaW4gb3VyIEkyQyBkcml2ZXIgY2FsY3Vs
YXRpb24gdGhlbiB0aGUgSU1YX0kyQ19JRkRSIHZhbHVlIHRoYXQgZ2V0cyBzZXQgbWFrZXMgU0NM
IGhhbGYgb2Ygd2hhdCBpcyBkZXNpcmVkIGJ5IHRoZSB1c2VyLg0KICAgICAgICAgICAgICAgICAg
VGhpcyBpcyBiZWNhdXNlIGlmIHlvdSBtYWtlIHRoZSBSQ1cgNDI0dGggYml0IGFzIDAgdGhlbiBh
bnlob3cgSTJDIGJsb2NrIChoYXJkd2FyZSkgd2lsbCByZWNlaXZlIFBsYXRmb3JtIENsb2NrLzQs
IGJ1dCB0aGUgZHJpdmVyIChzaW5jZSBpdCBoYXMgbm90IGNvbnNpZGVyZWQgdGhpcyBiaXQpIHdp
bGwgY29uc2lkZXIgaXQgYXMgUGxhdGZvcm0gQ2xvY2svMiBzbyBpdCdsbCBwcm9ncmFtIGEgYmln
Z2VyIGRpdmlkZXIgZnJvbSAgICAgdGhlIGlteF9pMmNfY2xrX2RpdiB0YWJsZQkJDQo+IA0KPiBP
bmUgcmVhc29uIEkgc3VnZ2VzdGVkIHRoZSBjbG9jayBkcml2ZXIgaXMgdGhhdCB0aGUgY2xvY2sg
ZHJpdmVyIA0KPiBjb250YWlucyBTb0Mgc3BlY2lmaWMgY29kZSBhbHJlYWR5LCBzbyBpdCBzaG91
bGQgYmUgZWFzaWVyIHRvIGludGVncmF0ZSB0aGVyZS4NCkl0IHNlZW1zIGluYXBwcm9wcmlhdGUg
dG8gcHV0IHRoZSBjbG9jayBmcmVxdWVuY3kgZGl2aXNpb24gbW9kaWZpY2F0aW9uIG9mIGkyYyBp
biB0aGUgY2xvY2sgZHJpdmVyLCBiZWNhdXNlIHRoZSBjbG9jayBkcml2ZXIgaXMgZm9yIGFsbCBJ
UCBhbmQgaXMgYSB1bml2ZXJzYWwgY29kZSwgc28gSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gbW9k
aWZ5IHRoZSBjbG9jayBpbiB0aGUgSVAgZHJpdmVyLg0KPiANCj4gU2FzY2hhDQo+IA0KPiANCj4g
LS0NCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfA0K
PiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfA0KPiBodHRwczov
L2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUy
Rnd3dy5wDQo+IGUgbmd1dHJvbml4LmRlJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NjaHVhbmh1YS5o
YW4lNDBueHAuY29tJTdDYjJkDQo+IDQ2ODA2OTljNDQ4ZTg1MTQzMDhkNmQxZjViZjgyJTdDNjg2
ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2Mw0KPiA1JTdDMCU3QzAlN0M2MzY5MjcyNTA3NDM1
MTY1NjMmYW1wO3NkYXRhPXBGZENiaURYRSUyRkRsbDAxWDlOag0KPiBIZzNTQ0RwRUN6Z3JyOE1M
dFlCZEtINWMlM0QmYW1wO3Jlc2VydmVkPTAgIHwgUGVpbmVyIFN0ci4gNi04LCAzMTEzNyANCj4g
SGlsZGVzaGVpbSwgR2VybWFueSB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMA0KPiB8DQo+IEFt
dHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDoNCj4gKzQ5LTUx
MjEtMjA2OTE3LTU1NTUgfA0K
