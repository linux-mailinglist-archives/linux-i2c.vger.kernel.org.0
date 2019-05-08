Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700A617856
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2019 13:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfEHLeq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 May 2019 07:34:46 -0400
Received: from mail-eopbgr130077.outbound.protection.outlook.com ([40.107.13.77]:36718
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727677AbfEHLep (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 May 2019 07:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB1SbsCmwkm1HmMj2DG+JXsqDZA1DYn00mvMYZU3xHI=;
 b=evzsZiJE2s+9DRbcRlsES1P8K6El8TkjL2r9LTCjn5JVV9kVEFZmvfVi3ilHQUhBkyPZJMB/9rv7RTr2DwZtaYG5Lw3Z1+Wnp28ghXvahD1XSnTJONXHXkXtZItF+WcSk5KmkYNtRZX/xxWKyCj/z7S9LxNn0r5S4HYL81BA1f0=
Received: from AM0PR04MB4353.eurprd04.prod.outlook.com (52.134.125.146) by
 AM0PR04MB4657.eurprd04.prod.outlook.com (52.135.150.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 11:34:41 +0000
Received: from AM0PR04MB4353.eurprd04.prod.outlook.com
 ([fe80::e4fe:fbdc:448b:c8a6]) by AM0PR04MB4353.eurprd04.prod.outlook.com
 ([fe80::e4fe:fbdc:448b:c8a6%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 11:34:41 +0000
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
Subject: RE: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Thread-Topic: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Thread-Index: AQHU/w+WtXmB7zSh+EKM7NDEvi24aqZUqIWAgAYQEbCAAwZvgIADZGxA
Date:   Wed, 8 May 2019 11:34:41 +0000
Message-ID: <AM0PR04MB43534A9B1A146DEFA929844C97320@AM0PR04MB4353.eurprd04.prod.outlook.com>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430125043.weqwzim4gpsvtkfe@pengutronix.de>
 <AM6PR04MB43571B8D52C1FE9ED20DBA1D97360@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <20190506073735.ctzybytamu44pbvv@pengutronix.de>
In-Reply-To: <20190506073735.ctzybytamu44pbvv@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chuanhua.han@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2774356-d24b-405f-a43c-08d6d3a9290f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4657;
x-ms-traffictypediagnostic: AM0PR04MB4657:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB465735DDBB1B93142F4C5EE397320@AM0PR04MB4657.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(346002)(39860400002)(366004)(136003)(13464003)(189003)(199004)(478600001)(4326008)(25786009)(14454004)(71200400001)(8936002)(6436002)(71190400001)(966005)(81166006)(81156014)(8676002)(2906002)(316002)(54906003)(52536014)(256004)(55016002)(14444005)(86362001)(66556008)(9686003)(11346002)(66446008)(6246003)(446003)(26005)(64756008)(44832011)(229853002)(186003)(76116006)(66946007)(73956011)(6306002)(66476007)(53936002)(486006)(476003)(7736002)(305945005)(7416002)(74316002)(68736007)(53546011)(102836004)(6916009)(45080400002)(33656002)(6506007)(7696005)(99286004)(76176011)(3846002)(6116002)(5660300002)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4657;H:AM0PR04MB4353.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L8pshLA4qyjLcTIECishv4+tIlUcsPz/5pwFiU8cS9jaFvsa3UgtXBOMXd7ZZxW0OV2z7D3bNMfBQYs7NruIHqwgunb/+zZC8T45h++HKFWVF4CdfsgH0wdPHQ9SlWR1ZhdP89Zg6k/ka7VKZ64Q1hwrDFpAvWQ2lsZQief2gmlK6+Z66MdfxNy0ZxQCpemnfWCj0sNRBtjwMbSvsXHdFNDNT8JEjUpXAPFioEUF5FLOFEN9nD5uVJ/Tfr/ODY5M5/MOhZGkr6NznNPltXEiQ77pS444W2h/V/FnDtCvjewAWF9c3Qx4iCDy36fsqWjDIh87BuT51FzUEvab4dW4bYAD4i8LrvSQMosJCUDl9aPqILVF1WVOoBKoJmslIo2rrmtAxYcpLORJV8rLyptTQNP51OMVsSqW1fyNadwKxOc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2774356-d24b-405f-a43c-08d6d3a9290f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 11:34:41.0579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4657
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FzY2hhIEhhdWVyIDxz
LmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAyMDE55bm0NeaciDbml6UgMTU6MzgNCj4g
VG86IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+IENjOiBzaGF3bmd1b0Br
ZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9y
ZzsNCj4gbWFyay5ydXRsYW5kQGFybS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWls
LmNvbTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tOw0KPiB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGVo
YUBkZWlmLmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsNCj4gbC5zdGFjaEBwZW5ndXRyb25p
eC5kZTsgcGVkYUBheGVudGlhLnNlOyBTdW1pdCBCYXRyYQ0KPiA8c3VtaXQuYmF0cmFAbnhwLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtFWFRdIFJlOiBbUEFUQ0ggMS8yXSBpMmM6IGlteDogSTJDIERy
aXZlciBkb2Vzbid0IGNvbnNpZGVyDQo+IEkyQ19JUEdDTEtfU0VMIFJDVyBiaXQgd2hlbiB1c2lu
ZyBsczEwNDZhIFNvQw0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiBTYXQsIE1h
eSAwNCwgMjAxOSBhdCAwOToyODo0OEFNICswMDAwLCBDaHVhbmh1YSBIYW4gd3JvdGU6DQo+ID4N
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFNhc2No
YSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gPiA+IFNlbnQ6IDIwMTnlubQ05pyI
MzDml6UgMjA6NTENCj4gPiA+IFRvOiBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhhbkBueHAuY29t
Pg0KPiA+ID4gQ2M6IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAu
Y29tPjsNCj4gPiA+IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+
ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOw0KPiA+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+ID4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWlsLmNvbTsgZGwtbGludXgt
aW14DQo+ID4gPiA8bGludXgtaW14QG54cC5jb20+OyB3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVy
aW5nLmNvbTsNCj4gPiA+IHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZTsgZWhhQGRlaWYu
Y29tOw0KPiA+ID4gbGludXhAcmVtcGVsLXByaXZhdC5kZTsgbC5zdGFjaEBwZW5ndXRyb25peC5k
ZTsgcGVkYUBheGVudGlhLnNlOw0KPiA+ID4gU3VtaXQgQmF0cmEgPHN1bWl0LmJhdHJhQG54cC5j
b20+DQo+ID4gPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDEvMl0gaTJjOiBpbXg6IEkyQyBE
cml2ZXIgZG9lc24ndCBjb25zaWRlcg0KPiA+ID4gSTJDX0lQR0NMS19TRUwgUkNXIGJpdCB3aGVu
IHVzaW5nIGxzMTA0NmEgU29DDQo+ID4gPg0KPiA+ID4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+ID4g
Pg0KPiA+ID4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTI6NDc6MThQTSArMDgwMCwgQ2h1YW5o
dWEgSGFuIHdyb3RlOg0KPiA+ID4gPiBUaGUgY3VycmVudCBrZXJuZWwgZHJpdmVyIGRvZXMgbm90
IGNvbnNpZGVyIEkyQ19JUEdDTEtfU0VMICg0MjQNCj4gPiA+ID4gYml0IG9mDQo+ID4gPiA+IFJD
VykgaW4gZGVjaWRpbmcgIGkyY19jbGtfcmF0ZSBpbiBmdW5jdGlvbiBpMmNfaW14X3NldF9jbGso
KSB7IDANCj4gPiA+ID4gUGxhdGZvcm0gY2xvY2svNCwgMSBQbGF0Zm9ybSBjbG9jay8yfS4NCj4g
PiA+ID4NCj4gPiA+ID4gV2hlbiB1c2luZyBsczEwNDZhIFNvQywgdGhpcyBwb3B1bGF0ZXMgaW5j
b3JyZWN0IHZhbHVlIGluIElCRkQNCj4gPiA+ID4gcmVnaXN0ZXIgaWYgSTJDX0lQR0NMS19TRUwg
PSAwLCB3aGljaCBnZW5lcmF0ZXMgaGFsZiBvZiB0aGUgZGVzaXJlZCBDbG9jay4NCj4gPiA+ID4N
Cj4gPiA+ID4gVGhlcmVmb3JlLCBpZiBsczEwNDZhIFNvQyBpcyB1c2VkLCB3ZSBuZWVkIHRvIHNl
dCB0aGUgaTJjIGNsb2NrDQo+ID4gPiA+IGFjY29yZGluZyB0byB0aGUgY29ycmVzcG9uZGluZyBS
Q1cuDQo+ID4gPg0KPiA+ID4gU28gdGhlIGNsb2NrIGRyaXZlciByZXBvcnRzIHRoZSB3cm9uZyBj
bG9jay4gUGxlYXNlIGZpeCB0aGUgY2xvY2sgZHJpdmVyIHRoZW4uDQo+ID4gTm8sIHRoaXMgaXMg
YSBwcm9ibGVtIHdpdGggdGhlIGkyYyBkcml2ZXIuIEl0IGlzIG5vdCBhIHByb2JsZW0gd2l0aA0K
PiA+IHRoZSBjbG9jayBkcml2ZXIsIHNvIHRoZSBpMmMgZHJpdmVyIG5lZWRzIHRvIGJlIG1vZGlm
aWVkLg0KPiANCj4gU28gaG93IGRvZXMgdGhpcyBSQ1cgYml0IGdldCBldmFsdWF0ZWQ/IA0KQWNj
b3JkaW5nIHRvIHRoZSByZWZlcmVuY2UgbWFudWFsDQo+IG9ubHkgb25lIGNsb2NrIGdvZXMgdG8g
dGhlIGkyYyBtb2R1bGUgKGRlc2NyaWJlZCBhcyAxLzIgUGxhdGZvcm0NCj4gQ2xvY2spIGFuZCB0
aGUgaTJjIG1vZHVsZSBvbmx5IHRha2VzIG9uZSBjbG9jay4gU28gaXQgc2VlbXMgdGhlcmUgbXVz
dCBiZSBhIC8yDQo+IGRpdmlkZXIgc29tZXdoZXJlLCBlaXRoZXIgaW4gZWFjaCBpMmMgbW9kdWxl
IG9yIHNvbWV3aGVyZSBvdXRzaWRlLiBDYW4geW91cg0KPiBJQyBndXlzIHRlbGwgeW91IHdoZXJl
IGl0IGlzPw0KSSBuZWVkIHRvIGNvbmZpcm0gdGhpcyB3aXRoIHRoZSBJQyB0ZWFtDQo+IA0KPiBP
bmUgcmVhc29uIEkgc3VnZ2VzdGVkIHRoZSBjbG9jayBkcml2ZXIgaXMgdGhhdCB0aGUgY2xvY2sg
ZHJpdmVyIGNvbnRhaW5zIFNvQw0KPiBzcGVjaWZpYyBjb2RlIGFscmVhZHksIHNvIGl0IHNob3Vs
ZCBiZSBlYXNpZXIgdG8gaW50ZWdyYXRlIHRoZXJlLg0KSXQgc2VlbXMgaW5hcHByb3ByaWF0ZSB0
byBwdXQgdGhlIGNsb2NrIGZyZXF1ZW5jeSBkaXZpc2lvbiBtb2RpZmljYXRpb24gb2YgaTJjIGlu
IHRoZSBjbG9jayBkcml2ZXIsDQpiZWNhdXNlIHRoZSBjbG9jayBkcml2ZXIgaXMgZm9yIGFsbCBJ
UCBhbmQgaXMgYSB1bml2ZXJzYWwgY29kZSwgc28gSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gbW9k
aWZ5IHRoZSBjbG9jayBpbiB0aGUgSVAgZHJpdmVyLg0KPiANCj4gU2FzY2hhDQo+IA0KPiANCj4g
LS0NCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfA0K
PiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfA0KPiBodHRwczov
L2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUy
Rnd3dy5wZQ0KPiBuZ3V0cm9uaXguZGUlMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2NodWFuaHVhLmhh
biU0MG54cC5jb20lN0NiMmQNCj4gNDY4MDY5OWM0NDhlODUxNDMwOGQ2ZDFmNWJmODIlN0M2ODZl
YTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzDQo+IDUlN0MwJTdDMCU3QzYzNjkyNzI1MDc0MzUx
NjU2MyZhbXA7c2RhdGE9cEZkQ2JpRFhFJTJGRGxsMDFYOU5qDQo+IEhnM1NDRHBFQ3pncnI4TUx0
WUJkS0g1YyUzRCZhbXA7cmVzZXJ2ZWQ9MCAgfA0KPiBQZWluZXIgU3RyLiA2LTgsIDMxMTM3IEhp
bGRlc2hlaW0sIEdlcm1hbnkgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTANCj4gfA0KPiBBbXRz
Z2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6DQo+ICs0OS01MTIx
LTIwNjkxNy01NTU1IHwNCg==
