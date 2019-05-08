Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E967018013
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2019 20:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfEHSxO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 May 2019 14:53:14 -0400
Received: from mail-eopbgr40088.outbound.protection.outlook.com ([40.107.4.88]:18181
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725910AbfEHSxN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 May 2019 14:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+YKAOFNylk+wCOycQeinm8aZncWOKIJ3ANKZh3jpZQ=;
 b=UXwkvA7ZncFmpBlYfIM4CQ4VEbYM34D86eAj6sHhAut3qqdlRbVD4B/sUl5rx3huaksckxK3mUIyz8chVrn+a+giEwGJjdy0PGHGmHTTNB8mSDUouaFkn57JFzJvdrBYVwyJy8BGUSevREuuEaYvV4bnkLGXgpEdUOyVrok+19k=
Received: from AM6PR04MB5863.eurprd04.prod.outlook.com (20.179.1.11) by
 AM6PR04MB6007.eurprd04.prod.outlook.com (20.178.86.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 18:53:06 +0000
Received: from AM6PR04MB5863.eurprd04.prod.outlook.com
 ([fe80::4151:fb1b:9bf8:36f3]) by AM6PR04MB5863.eurprd04.prod.outlook.com
 ([fe80::4151:fb1b:9bf8:36f3%2]) with mapi id 15.20.1878.019; Wed, 8 May 2019
 18:53:06 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Chuanhua Han <chuanhua.han@nxp.com>, Rob Herring <robh@kernel.org>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
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
Thread-Index: AQHU/w2T7xtjy05tc0unzik+I96jZaZYVaGAgAjTJgCAAHWtYA==
Date:   Wed, 8 May 2019 18:53:06 +0000
Message-ID: <AM6PR04MB58632B9ADF6FB92BCB7A3FFC8F320@AM6PR04MB5863.eurprd04.prod.outlook.com>
References: <20190430043242.29687-1-chuanhua.han@nxp.com>
 <20190502205901.GA24224@bogus>
 <AM0PR04MB43537B281229FA847CE6F2B897320@AM0PR04MB4353.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB43537B281229FA847CE6F2B897320@AM0PR04MB4353.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78b029e5-0d78-4343-fa3b-08d6d3e66823
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR04MB6007;
x-ms-traffictypediagnostic: AM6PR04MB6007:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB600710C7ECEDDCE5CE156EC58F320@AM6PR04MB6007.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(366004)(136003)(396003)(13464003)(199004)(189003)(476003)(9686003)(11346002)(446003)(55016002)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(73956011)(52536014)(14454004)(478600001)(8936002)(486006)(68736007)(7696005)(76176011)(99286004)(5660300002)(186003)(26005)(6506007)(53546011)(102836004)(229853002)(6436002)(3846002)(6116002)(53936002)(305945005)(74316002)(7416002)(256004)(25786009)(66066001)(71190400001)(71200400001)(4326008)(86362001)(33656002)(54906003)(110136005)(6246003)(7736002)(316002)(8676002)(81166006)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB6007;H:AM6PR04MB5863.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6yiaHgEHoImTtIIP4Ivb2sjm4JYKFneW/56DXdnWU6fp9Af9T8j1zbR9275Q6aAc2nLVcRwjbsPr8ig+NcXo+2xS+FbNhFUDdLuvVyFQVxmZYgw+QX2RtxH+EfJHKEty1UQe/jayr3FHj83iyceb1oNPTmpFB8VlpzLCVFj1F/GAlYIKjubUDCzsVOpzvU3hjoRaEtkqZ7jcSFhCfzy6hAD82l8XBLCpHw48MIk24oWqEDr0Aa7mD+t3XeEY5ujw7p/NCihaHXDi+UuFdLMdUsvgyQBCRAZ5tsNpfgIti7DZFTcfzKw8VW9dsT3dlfmWStLkbATf1emEz5asm6wX36tAElbpGxWds84TjibHsHleHT44BvoR5MxVfKIEc6qEi3wssLwWkJ4/yGR+yH1lGi1xA+D03xSoJxu/TfaVVA0=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b029e5-0d78-4343-fa3b-08d6d3e66823
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 18:53:06.2140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6007
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2h1YW5odWEgSGFuDQo+
IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDgsIDIwMTkgNjo0NSBBTQ0KPiBUbzogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4NCj4gQ2M6IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1b0Br
ZXJuZWwub3JnOw0KPiBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBMZW8gTGkgPGxlb3lhbmcubGlA
bnhwLmNvbT47IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBkbC1s
aW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyB3c2Er
cmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbTsgdS5rbGVpbmUtDQo+IGtvZW5pZ0BwZW5ndXRy
b25peC5kZTsgZWhhQGRlaWYuY29tOyBsaW51eEByZW1wZWwtcHJpdmF0LmRlOyBTdW1pdA0KPiBC
YXRyYSA8c3VtaXQuYmF0cmFAbnhwLmNvbT47IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7IHBlZGFA
YXhlbnRpYS5zZQ0KPiBTdWJqZWN0OiBSRTogW0VYVF0gUmU6IFtQQVRDSCAxLzNdIGR0LWJpbmRp
bmdzOiBpMmM6IGFkZCBvcHRpb25hbCBtdWwtdmFsdWUNCj4gcHJvcGVydHkgdG8gYmluZGluZw0K
PiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiBTZW50OiAyMDE5xOo11MIzyNUgNDo1OQ0K
PiA+IFRvOiBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhhbkBueHAuY29tPg0KPiA+IENjOiBtYXJr
LnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRy
b25peC5kZTsNCj4gPiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPiBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRsLWxpbnV4LWlteA0KPiA+IDxsaW51eC1pbXhA
bnhwLmNvbT47IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gPiB3c2ErcmVuZXNhc0BzYW5nLWVuZ2lu
ZWVyaW5nLmNvbTsgdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlOw0KPiA+IGVoYUBkZWlm
LmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsgU3VtaXQgQmF0cmENCj4gPiA8c3VtaXQuYmF0
cmFAbnhwLmNvbT47IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7IHBlZGFAYXhlbnRpYS5zZQ0KPiA+
IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhZGQgb3B0
aW9uYWwNCj4gPiBtdWwtdmFsdWUgcHJvcGVydHkgdG8gYmluZGluZw0KPiA+DQo+ID4gQ2F1dGlv
bjogRVhUIEVtYWlsDQo+ID4NCj4gPiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAxMjozMjo0MFBN
ICswODAwLCBDaHVhbmh1YSBIYW4gd3JvdGU6DQo+ID4gPiBOWFAgTGF5ZXJzY2FwZSBTb0MgaGF2
ZSB1cCB0byB0aHJlZSBNVUwgb3B0aW9ucyBhdmFpbGFibGUgZm9yIGFsbA0KPiA+ID4gZGl2aWRl
ciB2YWx1ZXMsIHdlIGNob2ljZSBvZiBNVUwgZGV0ZXJtaW5lcyB0aGUgaW50ZXJuYWwgbW9uaXRv
cg0KPiA+ID4gcmF0ZSBvZiB0aGUgSTJDIGJ1cyAoU0NMIGFuZCBTREEgc2lnbmFscyk6DQo+ID4g
PiBBIGxvd2VyIE1VTCB2YWx1ZSByZXN1bHRzIGluIGEgaGlnaGVyIHNhbXBsaW5nIHJhdGUgb2Yg
dGhlIEkyQyBzaWduYWxzLg0KPiA+ID4gQSBoaWdoZXIgTVVMIHZhbHVlIHJlc3VsdHMgaW4gYSBs
b3dlciBzYW1wbGluZyByYXRlIG9mIHRoZSBJMkMgc2lnbmFscy4NCj4gPiA+DQo+ID4gPiBTbyBp
biBPcHRpb25hbCBwcm9wZXJ0aWVzIHdlIGFkZGVkIG91ciBjdXN0b20gbXVsLXZhbHVlIHByb3Bl
cnR5IGluDQo+ID4gPiB0aGUgYmluZGluZyB0byBzZWxlY3Qgd2hpY2ggbXVsIG9wdGlvbiBmb3Ig
dGhlIGRldmljZSB0cmVlIGkyYw0KPiA+ID4gY29udHJvbGxlciBub2RlLg0KPiA+ID4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1p
bXgudHh0IHwgMyArKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+
ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvaTJjLWlteC50eHQNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kyYy9pMmMtaW14LnR4dA0KPiA+ID4gaW5kZXggYjk2NzU0NDU5MGU4Li5iYThlN2I3YjNm
YTggMTAwNjQ0DQo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2kyYy1pbXgudHh0DQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2kyYy1pbXgudHh0DQo+ID4gPiBAQCAtMTgsNiArMTgsOSBAQCBPcHRpb25hbCBw
cm9wZXJ0aWVzOg0KPiA+ID4gIC0gc2RhLWdwaW9zOiBzcGVjaWZ5IHRoZSBncGlvIHJlbGF0ZWQg
dG8gU0RBIHBpbg0KPiA+ID4gIC0gcGluY3RybDogYWRkIGV4dHJhIHBpbmN0cmwgdG8gY29uZmln
dXJlIGkyYyBwaW5zIHRvIGdwaW8gZnVuY3Rpb24gZm9yIGkyYw0KPiA+ID4gICAgYnVzIHJlY292
ZXJ5LCBjYWxsIGl0ICJncGlvIiBzdGF0ZQ0KPiA+ID4gKy0gbXVsLXZhbHVlOiBOWFAgTGF5ZXJz
Y2FwZSBTb0MgaGF2ZSB1cCB0byB0aHJlZSBNVUwgb3B0aW9ucw0KPiA+ID4gK2F2YWlsYWJsZSBm
b3IgYWxsIEkyQyBkaXZpZGVyIHZhbHVlcywgaXQgZGVzY3JpYmVzIHdoaWNoIE1VTCB3ZQ0KPiA+
ID4gK2Nob29zZSB0byB1c2UgZm9yIHRoZSBkcml2ZXIsIHRoZSB2YWx1ZXMgc2hvdWxkIGJlIDEs
Miw0Lg0KPiA+DQo+ID4gTmVlZHMgYSB2ZW5kb3IgcHJlZml4LiBJIGRvbid0IGZpbmQgJ3ZhbHVl
JyB0byBhZGQgYW55dGhpbmcgbm9yIGRvIEkNCj4gPiB1bmRlcnN0YW5kIHdoYXQgTVVMIGlzLg0K
PiBZZXMseW91IGFyZSByaWdodCENCj4gPg0KPiA+IElmIGl0IGlzIGRldGVybWluZWQgYnkgU29D
IHJhdGhlciB0aGFuIGJvYXJkLCB0aGVuIGl0IHNob3VsZCBwZXJoYXBzDQo+ID4gYmUgaW1wbGll
ZCBieSBjb21wYXRpYmxlLg0KPiBUaGlzIGlzIGRldGVybWluZWQgYnkgdGhlIFNPQywgYnV0IGl0
IGhhcyB0aHJlZSBvcHRpb25zIHRvIGNob29zZSBmcm9tLCBzbyBJDQo+IHRoaW5rIGl0J3MgYmV0
dGVyIHRvIHVzZSB0aGUgb3B0aW9uYWwgb3B0aW9uIGluc3RlYWQgb2YgY29tcGF0aWJsZQ0KDQpJ
ZiB0aGVyZSBpcyBvbmx5IG9uZSBiZXN0IGNob2ljZSBmb3IgZWFjaCBTb0MgbGV0dGluZyB0aGUg
U29DIGNvbXBhdGlibGUgZGV0ZXJtaW5lIGl0IHdpbGwgYmUgdGhlIGJlc3QuICBVbmxlc3MgZGlm
ZmVyZW50IGJvYXJkIGRlc2lnbnModXNlIGNhc2VzKSBvZiB0aGUgc2FtZSBTb0MgcmVxdWlyZXMg
ZGlmZmVyZW50IE1VTCBzZXR0aW5ncywgSSBhbHNvIGRvbid0IHNlZSBtdWNoIHZhbHVlIG9mIG1h
a2luZyBpdCBkZWZpbmVkIGluIGRldmljZSB0cmVlLg0KDQpSZWdhcmRzLA0KTGVvDQo=
