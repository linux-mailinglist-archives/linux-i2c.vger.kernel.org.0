Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 817C0184B8
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 07:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbfEIFKK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 01:10:10 -0400
Received: from mail-eopbgr70045.outbound.protection.outlook.com ([40.107.7.45]:8385
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726742AbfEIFKK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 May 2019 01:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6CRgV3uelV25JxAlOODzUZ1Xm48MiZSLpKYdjtuZPI=;
 b=UgQc454SqU7nGKiJtqtO0LulJ5mrydqVMmn8oRULpMKArevv68d2nzG1mBJSvFBFcDN1D2gQBoV14WzApXtl0j+4FuI0JnsPPfAcVMYEN4fugmwycucvtz16vra3ZoMyslJF3Mk6YA0oy47QKyW8RL9ohCXCpaxvxyFrGWyZfGA=
Received: from AM6PR04MB4629.eurprd04.prod.outlook.com (20.177.38.28) by
 AM6PR04MB5269.eurprd04.prod.outlook.com (20.177.35.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 05:10:01 +0000
Received: from AM6PR04MB4629.eurprd04.prod.outlook.com
 ([fe80::909a:bfcb:89aa:cdb7]) by AM6PR04MB4629.eurprd04.prod.outlook.com
 ([fe80::909a:bfcb:89aa:cdb7%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 05:10:01 +0000
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
Thread-Index: AQHU/w+WxhNHqUrORkaLbPX64iAO0KZUqIWAgAYQ6QCAAwWXgIADZuiAgAEXrjCAAA3oYA==
Date:   Thu, 9 May 2019 05:10:01 +0000
Message-ID: <AM6PR04MB462986872E11FE0E0E60344AEF330@AM6PR04MB4629.eurprd04.prod.outlook.com>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430125043.weqwzim4gpsvtkfe@pengutronix.de>
 <AM6PR04MB43571B8D52C1FE9ED20DBA1D97360@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <20190506073735.ctzybytamu44pbvv@pengutronix.de>
 <AM0PR04MB43534A9B1A146DEFA929844C97320@AM0PR04MB4353.eurprd04.prod.outlook.com>
 <AM6PR04MB4629DEDAAA6559EBBD20E974EF330@AM6PR04MB4629.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4629DEDAAA6559EBBD20E974EF330@AM6PR04MB4629.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sumit.batra@nxp.com; 
x-originating-ip: [92.120.0.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fc72811-86e4-4e58-c1db-08d6d43c971a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR04MB5269;
x-ms-traffictypediagnostic: AM6PR04MB5269:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB5269A978720CA6DBAC50D7A8EF330@AM6PR04MB5269.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(136003)(39860400002)(366004)(396003)(376002)(346002)(199004)(189003)(13464003)(99286004)(54906003)(66556008)(64756008)(66446008)(110136005)(66946007)(73956011)(66476007)(76116006)(229853002)(7416002)(14444005)(256004)(966005)(14454004)(45080400002)(71190400001)(71200400001)(478600001)(7736002)(33656002)(66066001)(186003)(2940100002)(81166006)(86362001)(11346002)(446003)(6116002)(476003)(305945005)(486006)(3846002)(8936002)(44832011)(53936002)(52536014)(68736007)(6246003)(7696005)(6506007)(9686003)(55016002)(53546011)(76176011)(5660300002)(6436002)(316002)(74316002)(2906002)(26005)(6306002)(8676002)(4326008)(102836004)(25786009)(81156014)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB5269;H:AM6PR04MB4629.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: laSSr+j0L1fW9Z9peM+TcEUCJTr4FkqNhBOhmHSyHdE4aQDNeNDbfl/IlPoo97a4B/XdvqM9iUnUe+OaRLiWjYsvA69ApbhoP0pzGFDLnmFeomoFfigcxeZSoEAzsJ3kdJTO7lte7G6X+/o26XCQx0vtYS6z+Vxdl7YHpFgByHiBsJpnMGNxcee+5tungKtcEZa8uRAYxkrZv9s8EXuPqfrSt8RFHUj1GowjjDbp+mRxTMPW9GUf7fua3vDI9nnXjLvs3vkGpbBlR7Ki/9eX4hlJFND4Q+CNqzH/nj9u5z3AZCvMX8AyPquVYqvVxhoY4PdnVcNsoZuozvEiIZ3HA7AoA0YEv5tCVMsP+y86pBsPW1WTrXQbVar6/C3chkKGinOz9+CDS9VtDalv0QBrWs9fA0wKDh29r49zjibZCC8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc72811-86e4-4e58-c1db-08d6d43c971a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 05:10:01.6822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5269
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdW1pdCBCYXRyYSANClNlbnQ6
IFRodXJzZGF5LCBNYXkgOSwgMjAxOSAxMDowNiBBTQ0KVG86IENodWFuaHVhIEhhbiA8Y2h1YW5o
dWEuaGFuQG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQpD
Yzogc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyByb2Jo
K2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBmZXN0ZXZhbUBn
bWFpbC5jb207IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyB3c2ErcmVuZXNhc0Bz
YW5nLWVuZ2luZWVyaW5nLmNvbTsgdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlOyBlaGFA
ZGVpZi5jb207IGxpbnV4QHJlbXBlbC1wcml2YXQuZGU7IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7
IHBlZGFAYXhlbnRpYS5zZQ0KU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbUEFUQ0ggMS8yXSBpMmM6
IGlteDogSTJDIERyaXZlciBkb2Vzbid0IGNvbnNpZGVyIEkyQ19JUEdDTEtfU0VMIFJDVyBiaXQg
d2hlbiB1c2luZyBsczEwNDZhIFNvQw0KDQpIaSBTYXNjaGEsDQpQbGVhc2UgY2hlY2sgbXkgY29t
bWVudA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2h1YW5odWEgSGFuIA0K
U2VudDogV2VkbmVzZGF5LCBNYXkgOCwgMjAxOSA1OjA1IFBNDQpUbzogU2FzY2hhIEhhdWVyIDxz
LmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KQ2M6IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8
bGVveWFuZy5saUBueHAuY29tPjsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJt
LmNvbTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgZmVzdGV2YW1AZ21haWwuY29tOyBkbC1saW51eC1pbXggPGxpbnV4LWlt
eEBueHAuY29tPjsgd3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb207IHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZTsgZWhhQGRlaWYuY29tOyBsaW51eEByZW1wZWwtcHJpdmF0LmRl
OyBsLnN0YWNoQHBlbmd1dHJvbml4LmRlOyBwZWRhQGF4ZW50aWEuc2U7IFN1bWl0IEJhdHJhIDxz
dW1pdC5iYXRyYUBueHAuY29tPg0KU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbUEFUQ0ggMS8yXSBp
MmM6IGlteDogSTJDIERyaXZlciBkb2Vzbid0IGNvbnNpZGVyIEkyQ19JUEdDTEtfU0VMIFJDVyBi
aXQgd2hlbiB1c2luZyBsczEwNDZhIFNvQw0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IFNl
bnQ6IDIwMTnlubQ15pyINuaXpSAxNTozOA0KPiBUbzogQ2h1YW5odWEgSGFuIDxjaHVhbmh1YS5o
YW5AbnhwLmNvbT4NCj4gQ2M6IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5s
aUBueHAuY29tPjsgDQo+IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207
IA0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOyANCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgZmVzdGV2YW1AZ21haWwuY29tOyBkbC1saW51eC1pbXggDQo+
IDxsaW51eC1pbXhAbnhwLmNvbT47IHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tOyAN
Cj4gdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlOyBlaGFAZGVpZi5jb207IGxpbnV4QHJl
bXBlbC1wcml2YXQuZGU7IA0KPiBsLnN0YWNoQHBlbmd1dHJvbml4LmRlOyBwZWRhQGF4ZW50aWEu
c2U7IFN1bWl0IEJhdHJhIA0KPiA8c3VtaXQuYmF0cmFAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtFWFRdIFJlOiBbUEFUQ0ggMS8yXSBpMmM6IGlteDogSTJDIERyaXZlciBkb2Vzbid0IA0KPiBj
b25zaWRlciBJMkNfSVBHQ0xLX1NFTCBSQ1cgYml0IHdoZW4gdXNpbmcgbHMxMDQ2YSBTb0MNCj4g
DQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gT24gU2F0LCBNYXkgMDQsIDIwMTkgYXQgMDk6
Mjg6NDhBTSArMDAwMCwgQ2h1YW5odWEgSGFuIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU+DQo+ID4gPiBTZW50OiAyMDE55bm0NOaciDMw5pelIDIwOjUxDQo+ID4g
PiBUbzogQ2h1YW5odWEgSGFuIDxjaHVhbmh1YS5oYW5AbnhwLmNvbT4NCj4gPiA+IENjOiBzaGF3
bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47DQo+ID4gPiByb2Jo
K2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiA+ID4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgDQo+ID4gPiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgZmVzdGV2YW1AZ21haWwuY29tOyBkbC1saW51eC1pbXggDQo+ID4gPiA8bGlu
dXgtaW14QG54cC5jb20+OyB3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbTsgDQo+ID4g
PiB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGVoYUBkZWlmLmNvbTsgDQo+ID4gPiBs
aW51eEByZW1wZWwtcHJpdmF0LmRlOyBsLnN0YWNoQHBlbmd1dHJvbml4LmRlOyBwZWRhQGF4ZW50
aWEuc2U7IA0KPiA+ID4gU3VtaXQgQmF0cmEgPHN1bWl0LmJhdHJhQG54cC5jb20+DQo+ID4gPiBT
dWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDEvMl0gaTJjOiBpbXg6IEkyQyBEcml2ZXIgZG9lc24n
dCANCj4gPiA+IGNvbnNpZGVyIEkyQ19JUEdDTEtfU0VMIFJDVyBiaXQgd2hlbiB1c2luZyBsczEw
NDZhIFNvQw0KPiA+ID4NCj4gPiA+IENhdXRpb246IEVYVCBFbWFpbA0KPiA+ID4NCj4gPiA+IE9u
IFR1ZSwgQXByIDMwLCAyMDE5IGF0IDEyOjQ3OjE4UE0gKzA4MDAsIENodWFuaHVhIEhhbiB3cm90
ZToNCj4gPiA+ID4gVGhlIGN1cnJlbnQga2VybmVsIGRyaXZlciBkb2VzIG5vdCBjb25zaWRlciBJ
MkNfSVBHQ0xLX1NFTCAoNDI0IA0KPiA+ID4gPiBiaXQgb2YNCj4gPiA+ID4gUkNXKSBpbiBkZWNp
ZGluZyAgaTJjX2Nsa19yYXRlIGluIGZ1bmN0aW9uIGkyY19pbXhfc2V0X2NsaygpIHsgMCANCj4g
PiA+ID4gUGxhdGZvcm0gY2xvY2svNCwgMSBQbGF0Zm9ybSBjbG9jay8yfS4NCj4gPiA+ID4NCj4g
PiA+ID4gV2hlbiB1c2luZyBsczEwNDZhIFNvQywgdGhpcyBwb3B1bGF0ZXMgaW5jb3JyZWN0IHZh
bHVlIGluIElCRkQgDQo+ID4gPiA+IHJlZ2lzdGVyIGlmIEkyQ19JUEdDTEtfU0VMID0gMCwgd2hp
Y2ggZ2VuZXJhdGVzIGhhbGYgb2YgdGhlIGRlc2lyZWQgQ2xvY2suDQo+ID4gPiA+DQo+ID4gPiA+
IFRoZXJlZm9yZSwgaWYgbHMxMDQ2YSBTb0MgaXMgdXNlZCwgd2UgbmVlZCB0byBzZXQgdGhlIGky
YyBjbG9jayANCj4gPiA+ID4gYWNjb3JkaW5nIHRvIHRoZSBjb3JyZXNwb25kaW5nIFJDVy4NCj4g
PiA+DQo+ID4gPiBTbyB0aGUgY2xvY2sgZHJpdmVyIHJlcG9ydHMgdGhlIHdyb25nIGNsb2NrLiBQ
bGVhc2UgZml4IHRoZSBjbG9jayBkcml2ZXIgdGhlbi4NCj4gPiBObywgdGhpcyBpcyBhIHByb2Js
ZW0gd2l0aCB0aGUgaTJjIGRyaXZlci4gSXQgaXMgbm90IGEgcHJvYmxlbSB3aXRoIA0KPiA+IHRo
ZSBjbG9jayBkcml2ZXIsIHNvIHRoZSBpMmMgZHJpdmVyIG5lZWRzIHRvIGJlIG1vZGlmaWVkLg0K
PiANCj4gU28gaG93IGRvZXMgdGhpcyBSQ1cgYml0IGdldCBldmFsdWF0ZWQ/IA0KQWNjb3JkaW5n
IHRvIHRoZSByZWZlcmVuY2UgbWFudWFsDQo+IG9ubHkgb25lIGNsb2NrIGdvZXMgdG8gdGhlIGky
YyBtb2R1bGUgKGRlc2NyaWJlZCBhcyAxLzIgUGxhdGZvcm0NCj4gQ2xvY2spIGFuZCB0aGUgaTJj
IG1vZHVsZSBvbmx5IHRha2VzIG9uZSBjbG9jay4gU28gaXQgc2VlbXMgdGhlcmUgbXVzdCANCj4g
YmUgYSAvMiBkaXZpZGVyIHNvbWV3aGVyZSwgZWl0aGVyIGluIGVhY2ggaTJjIG1vZHVsZSBvciBz
b21ld2hlcmUgDQo+IG91dHNpZGUuIENhbiB5b3VyIElDIGd1eXMgdGVsbCB5b3Ugd2hlcmUgaXQg
aXM/DQpJIG5lZWQgdG8gY29uZmlybSB0aGlzIHdpdGggdGhlIElDIHRlYW0NCltTdW1pdCBCYXRy
YV0gVGhlcmUgYXJlIDIgcGxhY2VzIHdoZXJlIGNsb2NrIGRpdmlzaW9uIHRha2VzIHBsYWNlIC0N
CiAgICAgICAgICAgICAgMSkgVGhlcmUgaXMgYSBjbG9jayBkaXZpZGVyIG91dHNpZGUgb2YgSTJD
IGJsb2NrLCB3aGljaCBtYWtlcyB0aGUgY2xvY2sgcmVhY2hpbmcgSTJDIG1vZHVsZSBhcyAtIFBs
YXRmb3JtIENsb2NrLzINCgkyKSBUaGVyZSBpcyBhbm90aGVyIGNsb2NrIGRpdmlkZXIgd2hpY2gg
c3BlY2lmaWNhbGx5IGRpdmlkZXMgdGhlIGNsb2NrIHRvIHRoZSBJMkMgYmxvY2ssIGJhc2VkIG9u
IFJDVyBiaXQgNDI0IChpZiA0MjR0aCBiaXQgaXMgMCB0aGVuIHRoZSBiYXVkIGNsb2NrIHNvdXJj
ZSBpcyBQbGF0Zm9ybSBDbG9jay80LCBpZiA0MjR0aCBiaXQgaXMgMSB0aGVuIGl0IHJlbWFpbnMg
UGxhdGZvcm0gQ2xvY2svMikNCiAgICAgICAgICAgICAgMykgTm93IGJhc2VkIG9uIHRoZSB3aGF0
IGlzIHRoZSBkZXNpcmVkIFNDTCB2YWx1ZSAoMTAwS0h6IGV0YykgYW5kIHRoZSBjbG9jayB3aGlj
aCBpcyByZWNlaXZlZCBieSBJMkMgYmxvY2ssIHRoZXJlIGlzIGEgY2FsY3VsYXRpb24gdGhhdCBn
b2VzIG9uIGluc2lkZSB0aGUgSTJDIGRyaXZlciBtb2R1bGUgd2hpY2ggaXMgdXNlZCB0byBtYXAg
YSB2YWx1ZSBpbiB0aGlzIGlteF9pMmNfY2xrX2RpdiB0YWJsZS4NCiAgICAgICAgICAgICAgICAg
IFRoaXMgdmFsdWUgaXMgdXNlZCB0byBwcm9ncmFtIHRoZSBJTVhfSTJDX0lGRFIgcmVnaXN0ZXIg
b2YgdGhlIEkyQyBibG9jay4gTm93IGlmIHdlIGRvbid0IGNvbnNpZGVyIHRoZSBSQ1cgYml0IDQy
NCBpbiBvdXIgSTJDIGRyaXZlciBjYWxjdWxhdGlvbiB0aGVuIHRoZSBJTVhfSTJDX0lGRFIgdmFs
dWUgdGhhdCBnZXRzIHNldCBtYWtlcyBTQ0wgaGFsZiBvZiB3aGF0IGlzIGRlc2lyZWQgYnkgdGhl
IHVzZXIuDQogICAgICAgICAgICAgICAgICBUaGlzIGlzIGJlY2F1c2UgaWYgeW91IG1ha2UgdGhl
IFJDVyA0MjR0aCBiaXQgYXMgMCB0aGVuIGFueWhvdyBJMkMgYmxvY2sgKGhhcmR3YXJlKSB3aWxs
IHJlY2VpdmUgUGxhdGZvcm0gQ2xvY2svNCwgYnV0IHRoZSBkcml2ZXIgKHNpbmNlIGl0IGhhcyBu
b3QgY29uc2lkZXJlZCB0aGlzIGJpdCkgd2lsbCBjb25zaWRlciBpdCBhcyBQbGF0Zm9ybSBDbG9j
ay8yIHNvIGl0J2xsIHByb2dyYW0gYSBiaWdnZXIgZGl2aWRlciBmcm9tICAgICAgIA0KICAgICAg
ICAgICAgICAgICAgdGhlIGlteF9pMmNfY2xrX2RpdiB0YWJsZQkJDQpbU3VtaXQgQmF0cmFdIEp1
c3QgdG8gY2xhcmlmeS4uLiAgUGxhdGZvcm0gQ2xvY2svMiBoYXBwZW5zIGZvciBtYW55IGJsb2Nr
cyBpbiB0aGUgc3lzdGVtLCBidXQgdGhpcyBSQ1cgNDI0dGggYml0IGlzIHNwZWNpZmljIGZvciBJ
MkMgbW9kdWxlcyAoc3BlY2lmaWNhbGx5IGluIGxzMTA0NmEpLCBub3cgZm9yIHRoaXMgb25lIFJD
VyBiaXQgd2hpY2ggaXMgc3BlY2lmaWMgdG8gSTJDIG1vZHVsZSBkbyB5b3UgdGhpbmsgaXQgaXMg
YWR2aXNhYmxlIHRvIGNoYW5nZSB0aGUgY2xvY2sgZHJpdmVyICA/DQo+IA0KPiBPbmUgcmVhc29u
IEkgc3VnZ2VzdGVkIHRoZSBjbG9jayBkcml2ZXIgaXMgdGhhdCB0aGUgY2xvY2sgZHJpdmVyIA0K
PiBjb250YWlucyBTb0Mgc3BlY2lmaWMgY29kZSBhbHJlYWR5LCBzbyBpdCBzaG91bGQgYmUgZWFz
aWVyIHRvIGludGVncmF0ZSB0aGVyZS4NCkl0IHNlZW1zIGluYXBwcm9wcmlhdGUgdG8gcHV0IHRo
ZSBjbG9jayBmcmVxdWVuY3kgZGl2aXNpb24gbW9kaWZpY2F0aW9uIG9mIGkyYyBpbiB0aGUgY2xv
Y2sgZHJpdmVyLCBiZWNhdXNlIHRoZSBjbG9jayBkcml2ZXIgaXMgZm9yIGFsbCBJUCBhbmQgaXMg
YSB1bml2ZXJzYWwgY29kZSwgc28gSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gbW9kaWZ5IHRoZSBj
bG9jayBpbiB0aGUgSVAgZHJpdmVyLg0KPiANCj4gU2FzY2hhDQo+IA0KPiANCj4gLS0NCj4gUGVu
Z3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfA0KPiBJbmR1c3Ry
aWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfA0KPiBodHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRnd3dy5wDQo+
IGUgbmd1dHJvbml4LmRlJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NjaHVhbmh1YS5oYW4lNDBueHAu
Y29tJTdDYjJkDQo+IDQ2ODA2OTljNDQ4ZTg1MTQzMDhkNmQxZjViZjgyJTdDNjg2ZWExZDNiYzJi
NGM2ZmE5MmNkOTljNWMzMDE2Mw0KPiA1JTdDMCU3QzAlN0M2MzY5MjcyNTA3NDM1MTY1NjMmYW1w
O3NkYXRhPXBGZENiaURYRSUyRkRsbDAxWDlOag0KPiBIZzNTQ0RwRUN6Z3JyOE1MdFlCZEtINWMl
M0QmYW1wO3Jlc2VydmVkPTAgIHwgUGVpbmVyIFN0ci4gNi04LCAzMTEzNyANCj4gSGlsZGVzaGVp
bSwgR2VybWFueSB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMA0KPiB8DQo+IEFtdHNnZXJpY2h0
IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDoNCj4gKzQ5LTUxMjEtMjA2OTE3
LTU1NTUgfA0K
