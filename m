Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D0617883
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2019 13:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfEHLmX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 May 2019 07:42:23 -0400
Received: from mail-eopbgr10059.outbound.protection.outlook.com ([40.107.1.59]:49795
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727516AbfEHLmX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 May 2019 07:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb25SX3b915X225Epee1pwVzDXDSjWu4Xbik7F0dT30=;
 b=fJ9J6/4NHh8j9DDyHI0nh9XM6DfSdgZWuvdTDUoIZtzlrTVEP7SOQvYIER0ZbqKmBtyN9DAwCxapsxdjUHFGN4sJzH/dXa9/UyB8Muanlaidcn/abn5tcQb5NJ87kS2RY9iDT52Riqu3KFyoUsWZH+qrf8S7zEaSZHp60bLBxpQ=
Received: from AM0PR04MB4353.eurprd04.prod.outlook.com (52.134.125.146) by
 AM0PR04MB5011.eurprd04.prod.outlook.com (20.177.40.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 11:42:15 +0000
Received: from AM0PR04MB4353.eurprd04.prod.outlook.com
 ([fe80::e4fe:fbdc:448b:c8a6]) by AM0PR04MB4353.eurprd04.prod.outlook.com
 ([fe80::e4fe:fbdc:448b:c8a6%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 11:42:15 +0000
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
Thread-Index: AQHU/w+WtXmB7zSh+EKM7NDEvi24aqZdwekAgANlghA=
Date:   Wed, 8 May 2019 11:42:15 +0000
Message-ID: <AM0PR04MB4353C226935B25AB5AFC892797320@AM0PR04MB4353.eurprd04.prod.outlook.com>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190506074756.mdegqdhirclipg7q@pengutronix.de>
In-Reply-To: <20190506074756.mdegqdhirclipg7q@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chuanhua.han@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac7584fc-1b1e-4bdc-1f47-08d6d3aa37cb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5011;
x-ms-traffictypediagnostic: AM0PR04MB5011:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB50110A83A28F7DF1BA49520E97320@AM0PR04MB5011.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(136003)(396003)(376002)(39860400002)(189003)(199004)(13464003)(6306002)(4326008)(99286004)(66446008)(55016002)(86362001)(476003)(53936002)(486006)(5660300002)(6506007)(53546011)(7416002)(9686003)(7696005)(6246003)(102836004)(3846002)(6116002)(66946007)(64756008)(66556008)(25786009)(54906003)(73956011)(66476007)(76116006)(76176011)(14454004)(74316002)(316002)(44832011)(52536014)(33656002)(305945005)(66066001)(229853002)(446003)(186003)(68736007)(2906002)(11346002)(478600001)(26005)(6916009)(8676002)(71200400001)(71190400001)(81156014)(81166006)(8936002)(7736002)(256004)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5011;H:AM0PR04MB4353.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ODMshjQJSUmSNolbvYWgy8Xd/pqpiilGNKXLR4IbFP4iZz48jyxy9LLnhR8Op+eT4bNKgRWYl7ZheLI66WM1RPnCcAiJs2FU4+xlnFew83p03dqw5pnfxFFnLXUE51h5Y5DeBXGIezZ8W9vD9iAbgspBljG8VVCGo1mOk2odR1UaAIaHNu+N6AMdaW5ys4G22QODp6yeW/1QL6oUCpS1k83bXFOFxcPS85xzgxeVRNo6hybkJpBafi5arXlkThNLCP5Kjjmd8K3j6mgrDMO/EIYBIyU3rUloEKRSzS0KvvwfbpcMSExX+oSvdsCbtOgEVo3KmL93VvndFt7YmE8PqI8LvGi3z+x+yQ4WP+9kzmecaOCRtOufaDoxfk24xop57BGSiY4fNK51p6lIdbD1F6FiZ5RUyDvPjYx7fsWY6Mk=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7584fc-1b1e-4bdc-1f47-08d6d3aa37cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 11:42:15.2823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5011
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FzY2hhIEhhdWVyIDxz
LmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAyMDE5xOo11MI2yNUgMTU6NDgNCj4gVG86
IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+IENjOiBzaGF3bmd1b0BrZXJu
ZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZzsN
Cj4gbWFyay5ydXRsYW5kQGFybS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+
IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWlsLmNv
bTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IHdzYStyZW5lc2FzQHNhbmct
ZW5naW5lZXJpbmcuY29tOw0KPiB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGVoYUBk
ZWlmLmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsNCj4gbC5zdGFjaEBwZW5ndXRyb25peC5k
ZTsgcGVkYUBheGVudGlhLnNlOyBTdW1pdCBCYXRyYQ0KPiA8c3VtaXQuYmF0cmFAbnhwLmNvbT4N
Cj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCAxLzJdIGkyYzogaW14OiBJMkMgRHJpdmVyIGRv
ZXNuJ3QgY29uc2lkZXINCj4gSTJDX0lQR0NMS19TRUwgUkNXIGJpdCB3aGVuIHVzaW5nIGxzMTA0
NmEgU29DDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IEhpLA0KPiANCj4gSW4gY2Fz
ZSB3ZSBlbmQgdXAgd2l0aCB0aGUgaGFuZGxpbmcgb2YgdGhpcyBpc3N1ZSBpbiB0aGUgaTJjIGRy
aXZlciwgaGVyZSBhcmUgdGhlDQo+IHRoaW5ncyB0byBjb25zaWRlciBmb3IgdjIuDQo+IA0KPiBP
biBUdWUsIEFwciAzMCwgMjAxOSBhdCAxMjo0NzoxOFBNICswODAwLCBDaHVhbmh1YSBIYW4gd3Jv
dGU6DQo+ID4gVGhlIGN1cnJlbnQga2VybmVsIGRyaXZlciBkb2VzIG5vdCBjb25zaWRlciBJMkNf
SVBHQ0xLX1NFTCAoNDI0IGJpdCBvZg0KPiA+IFJDVykgaW4gZGVjaWRpbmcgIGkyY19jbGtfcmF0
ZSBpbiBmdW5jdGlvbiBpMmNfaW14X3NldF9jbGsoKSB7IDANCj4gPiBQbGF0Zm9ybSBjbG9jay80
LCAxIFBsYXRmb3JtIGNsb2NrLzJ9Lg0KPiA+DQo+ID4gV2hlbiB1c2luZyBsczEwNDZhIFNvQywg
dGhpcyBwb3B1bGF0ZXMgaW5jb3JyZWN0IHZhbHVlIGluIElCRkQNCj4gPiByZWdpc3RlciBpZiBJ
MkNfSVBHQ0xLX1NFTCA9IDAsIHdoaWNoIGdlbmVyYXRlcyBoYWxmIG9mIHRoZSBkZXNpcmVkIENs
b2NrLg0KPiA+DQo+ID4gVGhlcmVmb3JlLCBpZiBsczEwNDZhIFNvQyBpcyB1c2VkLCB3ZSBuZWVk
IHRvIHNldCB0aGUgaTJjIGNsb2NrDQo+ID4gYWNjb3JkaW5nIHRvIHRoZSBjb3JyZXNwb25kaW5n
IFJDVy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFN1bWl0IEJhdHJhIDxzdW1pdC5iYXRyYUBu
eHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54
cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgfCA2NA0K
PiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNjQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LmMNCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgaW5k
ZXggNDIyZjFhNDQ1YjU1Li43MTg2Y2YzYzdkMjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14
LmMNCj4gPiBAQCAtNDUsNiArNDUsOCBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGlt
ZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2ZzbC9ndXRzLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9zeXNfc29jLmg+DQo+ID4NCj4gPiAgLyogVGhpcyB3aWxsIGJlIHRoZSBkcml2ZXIg
bmFtZSB0aGUga2VybmVsIHJlcG9ydHMgKi8gICNkZWZpbmUNCj4gPiBEUklWRVJfTkFNRSAiaW14
LWkyYyINCj4gPiBAQCAtMTA5LDYgKzExMSwyMSBAQA0KPiA+DQo+ID4gICNkZWZpbmUgSTJDX1BN
X1RJTUVPVVQgICAgICAgICAgICAgICAxMCAvKiBtcyAqLw0KPiA+DQo+ID4gKy8qIDE0LTEgU2lu
Y2UgYXJyYXkgaW5kZXggc3RhcnRzIGZyb20gMCAqLyAjZGVmaW5lDQo+ID4gK1JDV19JMkNfSVBH
Q0xLX1dPUkQgKDE0IC0gMSkNCj4gPiArLyoNCj4gPiArICogU2V0IG1hc2sgZm9yIFJDVyA0MjR0
aCBiaXQsIHJlYWRpbmcgZnJvbSBEQ0ZHX0NDU1IgUkNXIFN0YXR1cw0KPiA+ICtSZWdpc3RlcnMN
Cj4gPiArICogU2luY2UgdGhpcyByZWdpc3RlciBpbiBSTSBkZXBpY3RlZCBhcyBiaWcgZW5kaWFu
LA0KPiA+ICsgKiBzbyBjb25zaWRlciAzMXN0IGJpdCBhcyBMU0IgZm9yIGNyZWF0aW5nIHRoZSBt
YXNrLg0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBSQ1dfSTJDX0lQR0NMS19NQVNLICAgIDB4ODAw
MDAwDQo+ID4gK2ludCBpMmNfaXBnY2xrX3NlbCA9IDE7DQo+IA0KPiBzaG91bGQgYmUgc3RhdGlj
Lg0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1
dGUgbHMxMDQ2YV9zb2NbXSA9IHsNCj4gPiArICAgICAgICAgICAgey5mYW1pbHkgPSAiUW9ySVEg
TFMxMDQ2QSJ9LA0KPiA+ICsgICAgICAgICAgICB7IC8qIHNlbnRpbmVsICovIH0NCj4gPiArfTsN
Cj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIHNvcnRlZCBsaXN0IG9mIGNsb2NrIGRpdmlkZXIsIHJl
Z2lzdGVyIHZhbHVlIHBhaXJzDQo+ID4gICAqIHRha2VuIGZyb20gdGFibGUgMjYtNSwgcC4yNi05
LCBGcmVlc2NhbGUgaS5NWCBAQCAtMzA0LDYgKzMyMSwxMSBAQA0KPiA+IHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIGlteF9pMmNfZGV2dHlwZVtdID0geyAgfTsNCj4gPiBN
T0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBpbXhfaTJjX2RldnR5cGUpOw0KPiA+DQo+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGd1dHNfZGV2aWNlX2lkc1tdID0gew0K
PiA+ICsgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLHFvcmlxLWRldmljZS1jb25maWciLCB9LA0K
PiA+ICsgICAgIHt9DQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBpMmNfaW14X2R0X2lkc1tdID0gew0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUg
PSAiZnNsLGlteDEtaTJjIiwgLmRhdGEgPSAmaW14MV9pMmNfaHdkYXRhLCB9LA0KPiA+ICAgICAg
IHsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDIxLWkyYyIsIC5kYXRhID0gJmlteDIxX2kyY19od2Rh
dGEsIH0sDQo+ID4gQEAgLTUzMyw2ICs1NTUsOSBAQCBzdGF0aWMgdm9pZCBpMmNfaW14X3NldF9j
bGsoc3RydWN0IGlteF9pMmNfc3RydWN0DQo+ICppMmNfaW14LA0KPiA+ICAgICAgIHVuc2lnbmVk
IGludCBkaXY7DQo+ID4gICAgICAgaW50IGk7DQo+ID4NCj4gPiArICAgICBpZiAoIWkyY19pcGdj
bGtfc2VsKQ0KPiA+ICsgICAgICAgICAgICAgaTJjX2Nsa19yYXRlID0gaTJjX2Nsa19yYXRlIC8g
MjsNCj4gDQo+IEl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0aGUgdmFyaWFibGUgaW52ZXJ0ZWQu
IFlvdSB3b3VsZG4ndCBoYXZlIHRvIGluaXRpYWxpemUgYQ0KPiBnbG9iYWwgdmFyaWFibGUgd2l0
aCBzb21ldGhpbmcgZWxzZSBidXQgMCB0aGVuLg0KPiANCj4gPiArDQo+ID4gICAgICAgLyogRGl2
aWRlciB2YWx1ZSBjYWxjdWxhdGlvbiAqLw0KPiA+ICAgICAgIGlmIChpMmNfaW14LT5jdXJfY2xr
ID09IGkyY19jbGtfcmF0ZSkNCj4gPiAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiBAQCAtNTUx
LDYgKzU3NiwxMCBAQCBzdGF0aWMgdm9pZCBpMmNfaW14X3NldF9jbGsoc3RydWN0IGlteF9pMmNf
c3RydWN0DQo+ICppMmNfaW14LA0KPiA+ICAgICAgIC8qIFN0b3JlIGRpdmlkZXIgdmFsdWUgKi8N
Cj4gPiAgICAgICBpMmNfaW14LT5pZmRyID0gaTJjX2Nsa19kaXZbaV0udmFsOw0KPiA+DQo+ID4g
KyAgICAgcHJfYWxlcnQoIlslc10gQ0xLIFJhdGU9JXUgQml0cmF0ZSA9JXUgRGl2ID0ldSBWYWx1
ZSA9JWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgX19mdW5jX18sIGkyY19jbGtfcmF0ZSwgaTJj
X2lteC0+Yml0cmF0ZSwNCj4gPiArICAgICAgICAgICAgICBkaXYsIGkyY19jbGtfZGl2W2ldLnZh
bCk7DQo+IA0KPiBQbGVhc2UgZHJvcCB5b3VyIGRlYnVnZ2luZyBhaWRzLCBmb3Igc3VyZSB0aGV5
IHNob3VsZG4ndCBiZSBwcl9hbGVydC4NCj4gDQo+ID4gKw0KPiA+ICAgICAgIC8qDQo+ID4gICAg
ICAgICogVGhlcmUgZHVtbXkgZGVsYXkgaXMgY2FsY3VsYXRlZC4NCj4gPiAgICAgICAgKiBJdCBz
aG91bGQgYmUgYWJvdXQgb25lIEkyQyBjbG9jayBwZXJpb2QgbG9uZy4NCj4gPiBAQCAtMTExNiw2
ICsxMTQ1LDkgQEAgc3RhdGljIGludCBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gKnBkZXYpDQo+ID4gICAgICAgaW50IGlycSwgcmV0Ow0KPiA+ICAgICAgIGRtYV9hZGRy
X3QgcGh5X2FkZHI7DQo+ID4gICAgICAgdTMyIG11bF92YWx1ZTsNCj4gPiArICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmd1dHNfbm9kZTsNCj4gPiArICAgICBzdGF0aWMgc3RydWN0IGNjc3JfZ3V0
cyBfX2lvbWVtICpndXRzX3JlZ3M7DQo+ID4gKyAgICAgdTMyIHJjd19yZWc7DQo+ID4NCj4gPiAg
ICAgICBkZXZfZGJnKCZwZGV2LT5kZXYsICI8JXM+XG4iLCBfX2Z1bmNfXyk7DQo+ID4NCj4gPiBA
QCAtMTEzNSw2ICsxMTY3LDM4IEBAIHN0YXRpYyBpbnQgaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAgICAgIGlmICghaTJjX2lteCkNCj4gPiAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+DQo+ID4gKyAgICAgaWYgKHNvY19kZXZpY2Vf
bWF0Y2gobHMxMDQ2YV9zb2MpKSB7DQo+ID4gKyAgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAg
ICAgICAgICogTWFrZSBkZXZpY2Ugbm9kZSBmb3IgR1VUUy9EQ0ZHIChnbG9iYWwgdXRpbGl0aWVz
IGJsb2NrKQ0KPiA+ICsgICAgICAgICAgICAgICogdG8gcmVhZCBSQ1cuDQo+ID4gKyAgICAgICAg
ICAgICAgKi8NCj4gPiArICAgICAgICAgICAgIGd1dHNfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hpbmdf
bm9kZShOVUxMLA0KPiBndXRzX2RldmljZV9pZHMpOw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFn
dXRzX25vZGUpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2
LCAiQ291bGQgbm90IGZpbmQgR1VUUw0KPiBub2RlXG4iKTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gKyAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAg
ICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICogTWVtb3J5IChJTykgIE1BUCB0aGUgRENGRyBy
ZWdpc3RlcnMoZm9yIFJDVykgdG8NCj4gPiArICAgICAgICAgICAgICAqIGJlIHVzZWQgaW4ga2Vy
bmVsIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4NCj4gPiArICAgICAgICAgICAgICAqLw0KPiA+ICsg
ICAgICAgICAgICAgZ3V0c19yZWdzID0gb2ZfaW9tYXAoZ3V0c19ub2RlLCAwKTsNCj4gPiArICAg
ICAgICAgICAgIG9mX25vZGVfcHV0KGd1dHNfbm9kZSk7DQo+ID4gKyAgICAgICAgICAgICBpZiAo
IWd1dHNfcmVncykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5k
ZXYsICJJT1JFTUFQIG9mIEdVVFMgbm9kZQ0KPiBmYWlsZWRcbiIpOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiArICAgICAgICAgICAgIH0NCj4gPiArICAg
ICAgICAgICAgIC8qIFJlYWQgcmN3IGJpdCA0MjQgKHN0YXJ0aW5nIGZyb20gMCkgKi8NCj4gPiAr
ICAgICAgICAgICAgIHJjd19yZWcgPQ0KPiBpb3JlYWQzMmJlKCZndXRzX3JlZ3MtPnJjd3NyW1JD
V19JMkNfSVBHQ0xLX1dPUkRdKTsNCj4gPiArICAgICAgICAgICAgIHByX2FsZXJ0KCJSQ1cgUkVH
WyVkXT0weCV4XG4iLCBSQ1dfSTJDX0lQR0NMS19XT1JELA0KPiByY3dfcmVnKTsNCj4gPiArICAg
ICAgICAgICAgIGlmIChyY3dfcmVnICYgUkNXX0kyQ19JUEdDTEtfTUFTSykgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBwcl9hbGVydCgiRGl2IGJ5IDIgQ2FzZSBEZXRlY3RlZCBpbiBSQ1dc
biIpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpMmNfaXBnY2xrX3NlbCA9IDE7DQo+ID4g
KyAgICAgICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl9hbGVy
dCgiRGl2IGJ5IDQgQ2FzZSBEZXRlY3RlZCBpbiBSQ1dcbiIpOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBpMmNfaXBnY2xrX3NlbCA9IDA7DQo+ID4gKyAgICAgICAgICAgICB9DQo+ID4gKyAg
ICAgfQ0KPiANCj4gVGhpcyBpcyBkb25lIG9uY2UgcGVyIGkyYyBjb250cm9sbGVyLCBidXQgaXQg
c2V0cyBhIHZhcmlhYmxlIHZhbGlkIGZvciBhbGwgY29udHJvbGxlcnMuDQo+IEVpdGhlciBleGVj
dXRlIHRoaXMgY29kZSBvbmNlIG91dHNpZGUgb2YgZGV2aWNlIHNwZWNpZmljIGNvbnRleHQgb3Ig
dXNlIGENCj4gdmFyaWFibGUgaW4gZHJpdmVyIGRhdGEgYW5kIG5vdCBhIGdsb2JhbCBvbmUuDQpE
byB5b3UgbWVhbiB0aGUgZ2xvYmFsIHZhcmlhYmxlICJpMmNfaXBnY2xrX3NlbCKjvw0KPiANCj4g
U2FzY2hhDQo+IA0KPiAtLQ0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfA0KPiB8DQo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAgICAg
ICB8DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwJTNBJTJGJTJGd3d3LnBlDQo+IG5ndXRyb25peC5kZSUyRiZhbXA7ZGF0YT0wMiU3QzAx
JTdDY2h1YW5odWEuaGFuJTQwbnhwLmNvbSU3QzdjMA0KPiBkNjIxYWQ0YmI0NjIxN2NmMTA4ZDZk
MWY3MzNlMSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjMNCj4gNSU3QzAlN0MwJTdD
NjM2OTI3MjU2OTg3OTkyMzE1JmFtcDtzZGF0YT1Pd0RGS0N2OEpWeXZsWHJiVmhSSjANCj4gJTJG
TmJyNXVJN1d0UXc5MmpyWHlSTXNnJTNEJmFtcDtyZXNlcnZlZD0wICB8DQo+IFBlaW5lciBTdHIu
IDYtOCwgMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSB8IFBob25lOiArNDktNTEyMS0yMDY5MTct
MA0KPiB8DQo+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZh
eDoNCj4gKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfA0K
