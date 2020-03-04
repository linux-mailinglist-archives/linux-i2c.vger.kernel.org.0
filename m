Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD2E178965
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 05:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgCDENJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Mar 2020 23:13:09 -0500
Received: from mail-eopbgr00064.outbound.protection.outlook.com ([40.107.0.64]:32999
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725796AbgCDENI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Mar 2020 23:13:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQDu9qa4n/IpwNs4B9NsbaDvnZ/J9WS7LTGSOgo1cqDGAJM4CLaEbwtUT7ljFzdxNRe6PepHEyMbdIlAJwArPiT4+/JEN5QTpyQjkUOrtP0q/MUsDmnsUAcJyiW3paCy/1X1UZDRd/8dO/oOqY91wYqrdIqexJGOeezve6um6mXB7pzVFIij481m/lp9MEXEblI6uJXhl4CPm3YQToVJRZWy1mu3vNk5/l5rjn3I8x32aDElZ/Qk0o1feKTbu8aoxEIRdwlgTa6HjW3zqi5alG9SelAv4BJu4+nGxY1IYlXkin72pSGFqoJG7Qinj1dZHBXlnsf6ATwg2KQO1kBpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTRoE4lltFzufIfyV2KOZuDWYZEZS59gl/NdWZXpfMQ=;
 b=MKDfC3Q3wBmhuAD0Djd8ykJN2J0sYSb/oUixQIuvyGfTd9lpR13pX5H6KHCde4GNhCKKnDGfCkP11eaP6jhRm+yxqBGwR6CJsgc6SIlcLTe22JDfM3C0M+KZ3c04wEhkvvRuBLtEilsD4PW+i44zzSWFjCnh/60sPwDtdebE7bvT1Ugq0WFchLiEfjov8YmpBvRTYJZkkq/vVSylxveBtzZVUvu64iE/FBbt+twLHQbiwL0aoXRiLl/mhYrOX2RR5nxDsqHCRCGsBaazIPKeXOVWDm1cBv0NmJrxLwIKffhIA+1CLE1oNJoh6jXhD4JhCf/fctPOLK8IzWUDV5ZnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTRoE4lltFzufIfyV2KOZuDWYZEZS59gl/NdWZXpfMQ=;
 b=EbuVYYZpR+Yn/z94dCFxN/CLU1Nr9zutEkBh13fuZ2kPHueQVjReWmupBROpTFIwWzgDGPoq3h7sePupwbHgDQ44MO/M/5Z2wkyeYtUHSdQhQaQx5JoH7TGSRjBZhh5ukqte7LiwuxaG8prAe6l6AoDrYazoBHGZj+/4aTcqTg8=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5308.eurprd04.prod.outlook.com (20.176.235.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Wed, 4 Mar 2020 04:13:03 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::85a4:256:671:705d]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::85a4:256:671:705d%4]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 04:13:03 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Leo Li <leoyang.li@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: RE: [EXT] Re: [v6] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [EXT] Re: [v6] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHVqc+jQ6SBbHZv70GSkQhd1Ae4kKepv5SAgAGvTQCAjPNQoA==
Date:   Wed, 4 Mar 2020 04:13:03 +0000
Message-ID: <DB7PR04MB4490D8434B77DE285A9518448FE50@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191203114809.21226-1-biwen.li@nxp.com>
 <20191204100005.r56huywxa7h3c6zr@pengutronix.de>
 <9a1a00c1-e9fa-36a1-0e79-3492d9b98d9f@pengutronix.de>
In-Reply-To: <9a1a00c1-e9fa-36a1-0e79-3492d9b98d9f@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a17cfa81-a22e-4ad7-dbbc-08d7bff255bf
x-ms-traffictypediagnostic: DB7PR04MB5308:|DB7PR04MB5308:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5308A9E5D48CA7F9F34BCC7D8FE50@DB7PR04MB5308.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(199004)(189003)(26005)(186003)(316002)(44832011)(33656002)(71200400001)(55016002)(86362001)(66556008)(4326008)(5660300002)(52536014)(81156014)(64756008)(2906002)(66446008)(81166006)(8676002)(9686003)(66946007)(53546011)(478600001)(66476007)(8936002)(54906003)(76116006)(7696005)(6506007)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5308;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1GXLghqyGAZ57y/r+2g++cGWswsXw++pLuYb5mVeVASAbMe7cFrErGUqznNqVQaE1KD9XZssKVva/vkWdsx9QmrmCjl4M2tGz2C87z46hdPv2y7OZdZHSS0W7PXp0DDCnXt+gAx//JD3mGMitdIMs3VBaEpXA1WDOdSZBj5jB+7iSzApAw1H04QNMjpWW6Ogon0KnWkj/2TxHdijbIfvsp8hxXxDLlO8VBhu895agdepfavQrE+/KZ5NttstlOmiIyxm5zQ5mM46usHfFKfVpU3SPT7JcDGdYfWmEs2N8M9GxXhPNxLzkEUkba29hnUjs5y0vn+NQPLeNa8Z6LGjpFj/vBmq33CdvTrgvSSMzmPZhbiqcs1bSgq+0+Ge3SI6yNzhN73snDZj1ZfBaN3IZT/qT6gbGCgZZtqRME1X5DLHSTnhCgfvWk78Gk4dtNfjuMIm/kkdZXD/4AArZbytFu9iZ/1lDa1Rz05oCwSIcN1tqekUejXUH2GMG5VgpC8uI0Us4897Znq2S/ikggXF+myh+Bu3rypYcpOVOPkcrCmI9E1n+qEsx+askGnLkEachkHhOCN+JccOGfodf/TzAPs8tT8wXkciniBujnS7MwOgeOQhyfBrTwTPR8ThxB5Y
x-ms-exchange-antispam-messagedata: qcmNN2JVtZVOSNLukCN6JTzmB9TLJNumHZnltQu9aY+fNKL7yWBZ7VQxO/3WfI9DaYw9e7+10XHOHK/peoB6Ch2dv5f8WK1GEk14NEgqB6VE8FHSTxXvn58up8B2NBZBUecYBNFegQPOsB3O1skIMw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17cfa81-a22e-4ad7-dbbc-08d7bff255bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 04:13:03.6243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHJ6e8YrY/k09bb+sUxUzbhBY3mrHnaLUsY8SF1HcQfK+qo5IBZR1ds1fRyBelZjKWqxKPLZT8QAKx9e43O7Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5308
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KQW55IGNvbW1lbnRzPw0KDQpCZXN0IFJlZ2FyZHMsDQpCaXdlbiBMaQ0K
DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDA0LjEyLjE5IDExOjAwLCBTYXNjaGEgSGF1ZXIgd3JvdGU6
DQo+ID4gSGksDQo+ID4NCj4gPiBUaGUgcGF0Y2ggbG9va3Mgb2sgdG8gbWUgbm93LCBidXQgSSBz
dGlsbCBkbyBub3QgbGlrZSB0aGUgI2lmZGVmZmVyeQ0KPiA+IGFyb3VuZCBDT05GSUdfSTJDX1NM
QVZFLiBXaXRoIHRoZSBwYXRjaCBJIGp1c3Qgc2VudCAoWW91IGFyZSBvbiBDYzopDQo+ID4gd2Ug
Y291bGQgYXBwbHkgdGhlIGZvbGxvd2luZyBvbiB5b3VyIHBhdGNoIHdoaWNoIG1ha2VzIGl0IG1v
cmUNCj4gPiByZWFkYWJsZSBhbmQgaW5jcmVhc2VzIGNvbXBpbGUgY292ZXJhZ2UuDQo+ID4NCj4g
PiBXb2xmcmFtLCBCaXdlbiwgd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiANCj4gUkNBUiBkZXBl
bmRzIG9uIHNsYXZlOg0KPiBjb25maWcgSTJDX1JDQVINCj4gDQo+ICAgICAgICAgIHRyaXN0YXRl
ICJSZW5lc2FzIFItQ2FyIEkyQyBDb250cm9sbGVyIg0KPiANCj4gICAgICAgICAgZGVwZW5kcyBv
biBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUDQo+IA0KPiAgICAgICAgICBzZWxlY3QgSTJD
X1NMQVZFDQo+IHNlZToNCj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yY2FyLmMNCj4gDQo+IFNv
LCBJIHdvdWxkIHN1Z2dlc3QgdG8gZG8gdGhlIHNhbWUgaW4gaW14Lg0KPiANCj4gU28gZmFyLCBJ
IHRlc3RlZCB0aGlzIHBhdGNoIG9uIGlNWDZTLiBJdCB3b3JrcyBpbiBvbmUgYm9hcmQgKGkyYy1n
cGlvICsgaTJjLWlteCkNCj4gYW5kIHR3byBib2FyZCAoaTJjLWlteCArIGkyYy1pbXgpIGNvbmZp
Z3VyYXRpb24uDQo+IFRlc3RlZC1ieTogT2xla3NpaiBSZW1wZWwgPG8ucmVtcGVsQHBlbmd1dHJv
bml4LmRlPg0KPiANCj4gDQo+ID4NCj4gPiBTYXNjaGENCj4gPg0KPiA+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAg
RnJvbSA1MmY3YzJiZjU5ZGI2MWQ0YjI3YjU5Y2E2NDA0MTM2ZTNlZDc3MzEwIE1vbiBTZXAgMTcN
Cj4gMDA6MDA6MDANCj4gPiAyMDAxDQo+ID4gRnJvbTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBl
bmd1dHJvbml4LmRlPg0KPiA+IERhdGU6IFdlZCwgNCBEZWMgMjAxOSAxMDo1NjozNCArMDEwMA0K
PiA+IFN1YmplY3Q6IFtQQVRDSF0gZml4dXAhIGkyYzogaW14OiBzdXBwb3J0IHNsYXZlIG1vZGUg
Zm9yIGlteCBJMkMNCj4gPiBkcml2ZXINCj4gPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1pbXguYyB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gPiBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LmMgaW5kZXggNDBjY2ZjYTYwMGJmLi5jNWQ5YWU4MjI2Y2QgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+ICsrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gPiBAQCAtMjAzLDkgKzIwMyw3IEBAIHN0cnVjdCBp
bXhfaTJjX3N0cnVjdCB7DQo+ID4gICAgICAgc3RydWN0IHBpbmN0cmxfc3RhdGUgKnBpbmN0cmxf
cGluc19ncGlvOw0KPiA+DQo+ID4gICAgICAgc3RydWN0IGlteF9pMmNfZG1hICAgICAgKmRtYTsN
Cj4gPiAtI2lmIElTX0VOQUJMRUQoQ09ORklHX0kyQ19TTEFWRSkNCj4gPiAgICAgICBzdHJ1Y3Qg
aTJjX2NsaWVudCAgICAgICAqc2xhdmU7DQo+ID4gLSNlbmRpZg0KPiA+ICAgfTsNCj4gPg0KPiA+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXhfaTJjX2h3ZGF0YSBpbXgxX2kyY19od2RhdGEgPSB7
IEBAIC05MTMsMTINCj4gPiArOTExLDEwIEBAIHN0YXRpYyBpbnQgaTJjX2lteF94ZmVyKHN0cnVj
dCBpMmNfYWRhcHRlciAqYWRhcHRlciwNCj4gPg0KPiA+ICAgICAgIGRldl9kYmcoJmkyY19pbXgt
PmFkYXB0ZXIuZGV2LCAiPCVzPlxuIiwgX19mdW5jX18pOw0KPiA+DQo+ID4gLSNpZiBJU19FTkFC
TEVEKENPTkZJR19JMkNfU0xBVkUpDQo+ID4gICAgICAgaWYgKGkyY19pbXgtPnNsYXZlKSB7DQo+
ID4gICAgICAgICAgICAgICBkZXZfZXJyKCZpMmNfaW14LT5hZGFwdGVyLmRldiwgIlBsZWFzZSBu
b3QgZG8gb3BlcmF0aW9ucw0KPiBvZiBtYXN0ZXIgbW9kZSBpbiBzbGF2ZSBtb2RlIik7DQo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPiA+ICAgICAgIH0NCj4gPiAtI2VuZGlmDQo+
ID4NCj4gPiAgICAgICByZXN1bHQgPSBwbV9ydW50aW1lX2dldF9zeW5jKGkyY19pbXgtPmFkYXB0
ZXIuZGV2LnBhcmVudCk7DQo+ID4gICAgICAgaWYgKHJlc3VsdCA8IDApDQo+ID4gQEAgLTEwNjgs
NyArMTA2NCw2IEBAIHN0YXRpYyB1MzIgaTJjX2lteF9mdW5jKHN0cnVjdCBpMmNfYWRhcHRlcg0K
PiAqYWRhcHRlcikNCj4gPiAgICAgICAgICAgICAgIHwgSTJDX0ZVTkNfU01CVVNfUkVBRF9CTE9D
S19EQVRBOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLSNpZiBJU19FTkFCTEVEKENPTkZJR19JMkNfU0xB
VkUpDQo+ID4gICBzdGF0aWMgaW50IGkyY19pbXhfc2xhdmVfaW5pdChzdHJ1Y3QgaW14X2kyY19z
dHJ1Y3QgKmkyY19pbXgpDQo+ID4gICB7DQo+ID4gICAgICAgaW50IHRlbXA7DQo+ID4gQEAgLTEx
NTksNiArMTE1NCwxMCBAQCBzdGF0aWMgaW50IGkyY19pbXhfcmVnX3NsYXZlKHN0cnVjdCBpMmNf
Y2xpZW50DQo+ICpjbGllbnQpDQo+ID4gICB7DQo+ID4gICAgICAgc3RydWN0IGlteF9pMmNfc3Ry
dWN0ICppMmNfaW14ID0gaTJjX2dldF9hZGFwZGF0YShjbGllbnQtPmFkYXB0ZXIpOw0KPiA+ICAg
ICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfSTJD
X1NMQVZFKSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiAg
ICAgICBpZiAoaTJjX2lteC0+c2xhdmUpDQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZ
Ow0KPiA+DQo+ID4gQEAgLTExNzMsNiArMTE3Miw5IEBAIHN0YXRpYyBpbnQgaTJjX2lteF91bnJl
Z19zbGF2ZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50KQ0KPiA+ICAgew0KPiA+ICAgICAg
IHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCA9DQo+ID4gaTJjX2dldF9hZGFwZGF0YShj
bGllbnQtPmFkYXB0ZXIpOw0KPiA+DQo+ID4gKyAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19J
MkNfU0xBVkUpKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+
ICAgICAgIGlmICghaTJjX2lteC0+c2xhdmUpDQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gPg0KPiA+IEBAIC0xMTg4LDE1ICsxMTkwLDEyIEBAIHN0YXRpYyBpbnQgaTJjX2lt
eF91bnJlZ19zbGF2ZShzdHJ1Y3QNCj4gPiBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4NCj4gPiAg
ICAgICByZXR1cm4gMDsNCj4gPiAgIH0NCj4gPiAtI2VuZGlmDQo+ID4NCj4gPiAgIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaTJjX2FsZ29yaXRobSBpMmNfaW14X2FsZ28gPSB7DQo+ID4gICAgICAgLm1h
c3Rlcl94ZmVyICAgID0gaTJjX2lteF94ZmVyLA0KPiA+ICAgICAgIC5mdW5jdGlvbmFsaXR5ICA9
IGkyY19pbXhfZnVuYywNCj4gPiAtI2lmIElTX0VOQUJMRUQoQ09ORklHX0kyQ19TTEFWRSkNCj4g
PiAgICAgICAucmVnX3NsYXZlICAgICAgPSBpMmNfaW14X3JlZ19zbGF2ZSwNCj4gPiAgICAgICAu
dW5yZWdfc2xhdmUgICAgPSBpMmNfaW14X3VucmVnX3NsYXZlLA0KPiA+IC0jZW5kaWYNCj4gPiAg
IH07DQo+ID4NCj4gPiAgIHN0YXRpYyBpcnFyZXR1cm5fdCBpMmNfaW14X2lzcihpbnQgaXJxLCB2
b2lkICpkZXZfaWQpIEBAIC0xMjA4LDEwDQo+ID4gKzEyMDcsMTAgQEAgc3RhdGljIGlycXJldHVy
bl90IGkyY19pbXhfaXNyKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gPg0KPiA+ICAgICAgIGlm
IChzdGF0dXMgJiBJMlNSX0lJRikgew0KPiA+ICAgICAgICAgICAgICAgaTJjX2lteF9jbHJfaWZf
Yml0KHN0YXR1cywgaTJjX2lteCk7IC0jaWYNCj4gPiBJU19FTkFCTEVEKENPTkZJR19JMkNfU0xB
VkUpDQo+ID4gLSAgICAgICAgICAgICBpZiAoaTJjX2lteC0+c2xhdmUpDQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0kyQ19TTEFWRSkgJiYgaTJjX2lteC0+
c2xhdmUpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBpMmNfaW14X3NsYXZlX2lz
cihpMmNfaW14KTsgLSNlbmRpZg0KPiA+ICsNCj4gPiAgICAgICAgICAgICAgIGkyY19pbXgtPmky
Y3NyID0gc3RhdHVzOw0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGkyY19pbXhfbWFzdGVyX2lz
cihpMmNfaW14KTsNCj4gPiAgICAgICB9DQo+ID4NCj4gDQo+IEtpbmQgcmVnYXJkcywNCj4gT2xl
a3NpaiBSZW1wZWwNCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAg
ICAgICAgICAgICB8DQo+IHwNCj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAg
ICAgICAgIHwNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHAlM0ElMkYlMkZ3d3cuDQo+IHBlbmd1dHJvbml4LmRlJTJGJmFtcDtkYXRhPTAy
JTdDMDElN0NiaXdlbi5saSU0MG54cC5jb20lN0MyMzc0YQ0KPiA0ODY5MjJmNDYyNTcxN2UwOGQ3
Nzk3ODZiMmYlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzDQo+IDUlN0MwJTdDMCU3
QzYzNzExMTQzMDQwNjQ5NzgzNyZhbXA7c2RhdGE9ZmlXMHhwaFYlMkZGUkxOVTN4DQo+IHhZYVU2
cXpBeWl5ZFZmSndpSGM1WHUlMkJjdkNRJTNEJmFtcDtyZXNlcnZlZD0wICB8DQo+IFBlaW5lciBT
dHIuIDYtOCwgMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSB8IFBob25lOiArNDktNTEyMS0yMDY5
MTctMA0KPiB8DQo+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8
IEZheDoNCj4gKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfA0K
