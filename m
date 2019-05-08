Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FC51789C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2019 13:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfEHLpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 May 2019 07:45:35 -0400
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]:35296
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727516AbfEHLpf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 May 2019 07:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+TPNrzvi/1820Qpxi3wFI+Ele0govb6yjqQQxOjmkE=;
 b=QDEQAXHLVWEh+fU5i/qvxuUD3Ner9H3W0l5idlK7gJC2pGdpGqPWLVJ1tQQoxGI+wTVODie2St2oGK4mERarDEvKaJvaiCSP/aW23Xn7mw1fMmrlazLVU1Acodyu335Lsh14huym/1MyvSzyYvz1fAsIRv1KFnjjtew3GuYTmjA=
Received: from AM0PR04MB4353.eurprd04.prod.outlook.com (52.134.125.146) by
 AM0PR04MB4900.eurprd04.prod.outlook.com (20.176.215.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 11:44:50 +0000
Received: from AM0PR04MB4353.eurprd04.prod.outlook.com
 ([fe80::e4fe:fbdc:448b:c8a6]) by AM0PR04MB4353.eurprd04.prod.outlook.com
 ([fe80::e4fe:fbdc:448b:c8a6%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 11:44:50 +0000
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Leo Li <leoyang.li@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Sumit Batra <sumit.batra@nxp.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "peda@axentia.se" <peda@axentia.se>
Subject: RE: [EXT] Re: [PATCH 1/3] dt-bindings: i2c: add optional mul-value
 property to binding
Thread-Topic: [EXT] Re: [PATCH 1/3] dt-bindings: i2c: add optional mul-value
 property to binding
Thread-Index: AQHU/w2TnpxPP+I5F0qza5MEhbqLjaZYVaGAgAjSSRA=
Date:   Wed, 8 May 2019 11:44:50 +0000
Message-ID: <AM0PR04MB43537B281229FA847CE6F2B897320@AM0PR04MB4353.eurprd04.prod.outlook.com>
References: <20190430043242.29687-1-chuanhua.han@nxp.com>
 <20190502205901.GA24224@bogus>
In-Reply-To: <20190502205901.GA24224@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chuanhua.han@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23cc3d6f-e9fd-4bd2-5f0e-08d6d3aa9469
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4900;
x-ms-traffictypediagnostic: AM0PR04MB4900:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB4900F9D38DF0061A5F94B19997320@AM0PR04MB4900.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(136003)(396003)(366004)(346002)(13464003)(199004)(189003)(26005)(6506007)(229853002)(53546011)(6116002)(68736007)(186003)(6246003)(52536014)(3846002)(102836004)(44832011)(76116006)(53936002)(73956011)(66476007)(66946007)(66556008)(64756008)(5660300002)(99286004)(33656002)(66446008)(54906003)(76176011)(7696005)(6916009)(4326008)(476003)(6436002)(81166006)(8936002)(8676002)(81156014)(86362001)(74316002)(316002)(25786009)(305945005)(256004)(14454004)(11346002)(486006)(7736002)(55016002)(71190400001)(478600001)(7416002)(2906002)(446003)(9686003)(66066001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4900;H:AM0PR04MB4353.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gNtAN+HISg0AeBlQlH2qKuKbAv9iCxy3QfLV1KyxHBlBLQgaKl0fOvWL1nbyZtHCoWrMONHx60WxNZibSNRFDNAi33AeRs1Ey/4mvNacdLihoOaLRi0XtEodeI+5A4gVoGupaRTtl21aNqZiLvHSciQjclfXrl67NhRFS5i5Fh7s+DC+HVT6EoPHoDkkXzs63KQERT+l8NxweuM9vmwubcugyZ9I9JwQF2Xi4hQCKBN9zJbthG2VzSe/cqqvO7DVkbzoXpwBGHnGkGtUFrbdCvEx1Aa6yclHw1lioZ5P/NQF4PQGaivmmrFrxxjgLfqaGUGfl4jRWTdnMowSLdkg3nh4QjXrwdo3ynbOGd4RV9WrR1L0MQfpfOoj6zGO6JJgGiGS3/+nLlZdokx7ScPnd4dHXcbG+fPF0XA7pajstNk=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cc3d6f-e9fd-4bd2-5f0e-08d6d3aa9469
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 11:44:50.6009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4900
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOcTqNdTCM8jVIDQ6NTkNCj4gVG86IENodWFuaHVh
IEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+IENjOiBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsg
c2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4gTGVvIExpIDxs
ZW95YW5nLmxpQG54cC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7
IGRsLWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+OyBmZXN0ZXZhbUBnbWFpbC5jb207
DQo+IHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tOyB1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU7DQo+IGVoYUBkZWlmLmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsgU3Vt
aXQgQmF0cmEgPHN1bWl0LmJhdHJhQG54cC5jb20+Ow0KPiBsLnN0YWNoQHBlbmd1dHJvbml4LmRl
OyBwZWRhQGF4ZW50aWEuc2UNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCAxLzNdIGR0LWJp
bmRpbmdzOiBpMmM6IGFkZCBvcHRpb25hbCBtdWwtdmFsdWUNCj4gcHJvcGVydHkgdG8gYmluZGlu
Zw0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiBUdWUsIEFwciAzMCwgMjAxOSBh
dCAxMjozMjo0MFBNICswODAwLCBDaHVhbmh1YSBIYW4gd3JvdGU6DQo+ID4gTlhQIExheWVyc2Nh
cGUgU29DIGhhdmUgdXAgdG8gdGhyZWUgTVVMIG9wdGlvbnMgYXZhaWxhYmxlIGZvciBhbGwNCj4g
PiBkaXZpZGVyIHZhbHVlcywgd2UgY2hvaWNlIG9mIE1VTCBkZXRlcm1pbmVzIHRoZSBpbnRlcm5h
bCBtb25pdG9yIHJhdGUNCj4gPiBvZiB0aGUgSTJDIGJ1cyAoU0NMIGFuZCBTREEgc2lnbmFscyk6
DQo+ID4gQSBsb3dlciBNVUwgdmFsdWUgcmVzdWx0cyBpbiBhIGhpZ2hlciBzYW1wbGluZyByYXRl
IG9mIHRoZSBJMkMgc2lnbmFscy4NCj4gPiBBIGhpZ2hlciBNVUwgdmFsdWUgcmVzdWx0cyBpbiBh
IGxvd2VyIHNhbXBsaW5nIHJhdGUgb2YgdGhlIEkyQyBzaWduYWxzLg0KPiA+DQo+ID4gU28gaW4g
T3B0aW9uYWwgcHJvcGVydGllcyB3ZSBhZGRlZCBvdXIgY3VzdG9tIG11bC12YWx1ZSBwcm9wZXJ0
eSBpbg0KPiA+IHRoZSBiaW5kaW5nIHRvIHNlbGVjdCB3aGljaCBtdWwgb3B0aW9uIGZvciB0aGUg
ZGV2aWNlIHRyZWUgaTJjDQo+ID4gY29udHJvbGxlciBub2RlLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2h1YW5odWEgSGFuIDxjaHVhbmh1YS5oYW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtaW14LnR4dCB8IDMgKysr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1pbXgudHh0DQo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1pbXgudHh0DQo+
ID4gaW5kZXggYjk2NzU0NDU5MGU4Li5iYThlN2I3YjNmYTggMTAwNjQ0DQo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtaW14LnR4dA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWlteC50eHQNCj4gPiBA
QCAtMTgsNiArMTgsOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ICAtIHNkYS1ncGlvczog
c3BlY2lmeSB0aGUgZ3BpbyByZWxhdGVkIHRvIFNEQSBwaW4NCj4gPiAgLSBwaW5jdHJsOiBhZGQg
ZXh0cmEgcGluY3RybCB0byBjb25maWd1cmUgaTJjIHBpbnMgdG8gZ3BpbyBmdW5jdGlvbiBmb3Ig
aTJjDQo+ID4gICAgYnVzIHJlY292ZXJ5LCBjYWxsIGl0ICJncGlvIiBzdGF0ZQ0KPiA+ICstIG11
bC12YWx1ZTogTlhQIExheWVyc2NhcGUgU29DIGhhdmUgdXAgdG8gdGhyZWUgTVVMIG9wdGlvbnMN
Cj4gPiArYXZhaWxhYmxlIGZvciBhbGwgSTJDIGRpdmlkZXIgdmFsdWVzLCBpdCBkZXNjcmliZXMg
d2hpY2ggTVVMIHdlDQo+ID4gK2Nob29zZSB0byB1c2UgZm9yIHRoZSBkcml2ZXIsIHRoZSB2YWx1
ZXMgc2hvdWxkIGJlIDEsMiw0Lg0KPiANCj4gTmVlZHMgYSB2ZW5kb3IgcHJlZml4LiBJIGRvbid0
IGZpbmQgJ3ZhbHVlJyB0byBhZGQgYW55dGhpbmcgbm9yIGRvIEkgdW5kZXJzdGFuZA0KPiB3aGF0
IE1VTCBpcy4NClllcyx5b3UgYXJlIHJpZ2h0IQ0KPiANCj4gSWYgaXQgaXMgZGV0ZXJtaW5lZCBi
eSBTb0MgcmF0aGVyIHRoYW4gYm9hcmQsIHRoZW4gaXQgc2hvdWxkIHBlcmhhcHMgYmUgaW1wbGll
ZA0KPiBieSBjb21wYXRpYmxlLg0KVGhpcyBpcyBkZXRlcm1pbmVkIGJ5IHRoZSBTT0MsIGJ1dCBp
dCBoYXMgdGhyZWUgb3B0aW9ucyB0byBjaG9vc2UgZnJvbSwgDQpzbyBJIHRoaW5rIGl0J3MgYmV0
dGVyIHRvIHVzZSB0aGUgb3B0aW9uYWwgb3B0aW9uIGluc3RlYWQgb2YgY29tcGF0aWJsZQ0KDQo+
IA0KPiBSb2INCg==
