Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E57AA6B4
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 17:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388023AbfIEPFH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 11:05:07 -0400
Received: from mail-eopbgr50069.outbound.protection.outlook.com ([40.107.5.69]:30522
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732303AbfIEPFH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 11:05:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTDBtp20RNcGWwUiTYnvOOTUDI11yDdim4WUeaaL+AMUxecuw2lSkQaFgNo95IccD6K+f1iOMdXGt4gOMw5weB6GapnqeYr4Wk9U/pM8nbUGYBf/fSxoYfkeI/6MyZHTnLyPO800cT14rDRDnW//DJFEepWvGOm+YSeddO/SLQ4EK+Pd5GfI/7oAKTC5O0gQ8N2xOA9QpOGuy7n/Rn+IkBJlr3UrN2cd4fkgaOc8UT3e5JxX9NxCVUjS39JR0p+wGVbDImJOreweUb9cAHKLjGkilb6fZETOtfCd0VOfz0y4DodXm5dFzIw+16NGBs20WaIhcEQO6qob1UztiST6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh8qNTBlExiAQjh/fxxhxb/Tovj8gRMkuiDhETk7HfI=;
 b=ND1/Wuhhmo+V/pwRTQIZoSdJ/zzp0fxZHBXTZGh5D18B09hGIlTb6T1blsqpAqd1Bh879L7P2xvK7/9ZzdVlayjmAGT2PaF72Jj64mqDPKPITRvFbPnWi/PB8dTrMuJmgRuMBOLCPQVK1MI6mmAHuRLAxHatdRDc2FAeMq7jBCuosXSt99B07bOY5ITtP5isf70ziy6LmynCgk8lX0clHjvdgnAoAFTvSQY+qykXIDXvTDgWvjdVHrPoYE8NU4V4yFUEXbtXQBQpc9Mz2XxREUPzW1TCUz8Ez2NSgMh2DWTUfHaCLLTApCsG2CAUaHN5qTDYqr9+PHnrExdQxPM+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh8qNTBlExiAQjh/fxxhxb/Tovj8gRMkuiDhETk7HfI=;
 b=cpCyebcVh8dxiwI2JFJ9pLyf7g1RkJrfH48YSb/TVuGUfc/3Em9m67vje2G35wIlFcTytZERSgzf8yPwojohC52tvbe92fngQfjIR0J4rlsTQxUYMGD4ljPRmWBYh1oCI9kjj78w5nbmYKCTDCKsiYHC+CEmJMgGgFs39ir+IYg=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4619.eurprd04.prod.outlook.com (52.135.138.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 15:05:00 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 15:05:00 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     "'andy.shevchenko@gmail.com'" <andy.shevchenko@gmail.com>,
        "'rafael@kernel.org'" <rafael@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>,
        "'wsa@the-dreams.de'" <wsa@the-dreams.de>,
        "'rjw@rjwysocki.net'" <rjw@rjwysocki.net>
CC:     Chuanhua Han <chuanhua.han@nxp.com>,
        "'shawnguo@kernel.org'" <shawnguo@kernel.org>,
        "'s.hauer@pengutronix.de'" <s.hauer@pengutronix.de>,
        "'linux-acpi@vger.kernel.org'" <linux-acpi@vger.kernel.org>,
        "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
        "'linux-i2c@vger.kernel.org'" <linux-i2c@vger.kernel.org>,
        "'linux-arm-kernel@lists.infradead.org'" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] ACPI: support for NXP i2c controller
Thread-Topic: [PATCH] ACPI: support for NXP i2c controller
Thread-Index: AQHVN9RWONVodUogYk2tb4fLvCueOacZMhcAgAAFiwCAAI1AgIAABROQgAMCJ+CAALpIQA==
Date:   Thu, 5 Sep 2019 15:04:59 +0000
Message-ID: <DB7PR04MB449006447F52FBA418278E868FBB0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
 <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
 <CAHp75VfFtMMQhetRFHrx=Ft7OWwyMqLrwP3sPjT6YVtr8xCHoQ@mail.gmail.com>
 <896b88d4-9d1b-922b-1784-55ef9a1a1830@pengutronix.de>
 <AM7PR04MB6885DB03C6B96C7932DDA74B8EB90@AM7PR04MB6885.eurprd04.prod.outlook.com>
 <DB7PR04MB4490E737C00CF9CA173AB2898FBB0@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4490E737C00CF9CA173AB2898FBB0@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 169eb17a-4cdb-4d75-b2be-08d732126c3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4619;
x-ms-traffictypediagnostic: DB7PR04MB4619:|DB7PR04MB4619:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB46194C044B10F398195053BA8FBB0@DB7PR04MB4619.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(189003)(199004)(102836004)(6116002)(3846002)(74316002)(6506007)(53546011)(76116006)(81166006)(44832011)(186003)(966005)(110136005)(14454004)(86362001)(66066001)(7696005)(26005)(305945005)(8936002)(81156014)(8676002)(476003)(33656002)(11346002)(54906003)(71200400001)(446003)(71190400001)(2906002)(486006)(256004)(14444005)(76176011)(7416002)(9686003)(2940100002)(478600001)(7736002)(55016002)(52536014)(316002)(66946007)(4326008)(64756008)(6436002)(66556008)(25786009)(66446008)(53936002)(6306002)(45080400002)(229853002)(5660300002)(99286004)(66476007)(6246003)(491001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4619;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R5psLADPB4bx/bBxOIVbZtDtxFXw7dODZ31fDPmqvYc0QYA9y97Y/UBEJNntzlXg8oDNaJ2mjbt8jdL9D+TnobsCPlZn8i/JxD1aYeh2LLwIRnq35OwMjLZgvjIeYUJ/CvM+GdKg3v1NGbhxAX6WCOYlXnJUGynoKrAwPNzYVNCSmbDsr8Vnhuoi/0XVT1166LasqIkxeFsxKMdT6IAsI2a9G2o5jAdYcGSXK9jb2O1JWMADi/WgP5n7OeAwSG2xRmzJS+aOm9TaQxUVhO6uSgxLkcbV8M6EQ/9fHXWZgWGbE4FuDBi/as0aPQmfpiVPyRK8HHvLUCcoOTb8/JDRoLI5YE5b+kicPRIxsMdpWWzsbPJSbYC4Fjakn09QKETOBF6hp94Tf/E6fywr+PM7wmmJ8pET8g2u7HNKs5HyMFQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169eb17a-4cdb-4d75-b2be-08d732126c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 15:05:00.0888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQh4Q60X5rcy84nO0O7FUdS8ONLzO0GBLhxydDduHBPYCz+x34xcSS3/bqua8s+OqGNjVhltRQvbndQ61n7aog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4619
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gPiBIaSwNCj4gPg0KPiA+IE9uIDAyLjA5LjE5IDIzOjE2LCBBbmR5IFNoZXZjaGVua28g
d3JvdGU6DQo+ID4gPiBPbiBNb24sIFNlcCAyLCAyMDE5IGF0IDExOjU4IFBNIFJhZmFlbCBKLiBX
eXNvY2tpDQo+ID4gPiA8cmFmYWVsQGtlcm5lbC5vcmc+DQo+ID4gd3JvdGU6DQo+ID4gPj4NCj4g
PiA+PiBPbiBUaHUsIEp1bCAxMSwgMjAxOSBhdCAxMjozNSBQTSBDaHVhbmh1YSBIYW4NCj4gPiA+
PiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPj4+DQo+ID4gPj4+IEVu
YWJsZSBOWFAgaTJjIGNvbnRyb2xsZXIgdG8gYm9vdCB3aXRoIEFDUEkNCj4gPiA+Pj4NCj4gPiA+
Pj4gU2lnbmVkLW9mZi1ieTogTWVlbmFrc2hpIEFnZ2Fyd2FsIDxtZWVuYWtzaGkuYWdnYXJ3YWxA
bnhwLmNvbT4NCj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogVWRpdCBLdW1hciA8dWRpdC5rdW1hckBu
eHAuY29tPg0KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhh
bkBueHAuY29tPg0KPiA+ID4+DQo+ID4gPj4gV29sZnJhbSwgYW55IG9iamVjdGlvbnMgdG8gdGhp
cyBmcm9tIHRoZSBpMmMgc2lkZT8NCj4gPiA+DQo+ID4gPiBNYXkgSSBwcm9wb3NlIGFtZW5kbWVu
dChzKT8NCj4gPiA+DQo+ID4gPj4+IEBAIC00NCw2ICs0NCw3IEBADQo+ID4gPj4+ICAgI2luY2x1
ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiA+Pj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQu
aD4NCj4gPiA+Pj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ID4NCj4gPiA+Pj4gKyNp
bmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+ID4gPg0KPiA+ID4gSWYgaXQncyBrZXB0IGluIG9yZGVy
LCBiZXR0ZXIgdG8gZ28gd2l0aCBpdC4gKFllcywgaXQgaXMgYXMgSSBoYXZlDQo+ID4gPiBjaGVj
a2VkKSBIb3dldmVyLCBwcm9wZXJ0eS5oIHNob3VsZCBiZSBpbmNsdWRlZCBpbnN0ZWFkLCBzZWUg
YmVsb3cuDQpPaywgZ290IGl0LiBJIHdpbGwgZml4IGl0IGluIHYyLg0KPiA+ID4NCj4gPiA+Pj4g
ICAgICAgICAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQgPQ0KPiA+IG9mX21hdGNo
X2RldmljZShpMmNfaW14X2R0X2lkcywNCj4gPiA+Pj4NCj4gPiA+Pj4gJnBkZXYtPmRldik7DQo+
ID4gPj4+ICsgICAgICAgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkICphY3BpX2lkID0NCj4g
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWNwaV9tYXRjaF9kZXZpY2UoaTJjX2lteF9h
Y3BpX2lkcywNCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnBkZXYtPmRldik7DQo+ID4gPg0KPiA+ID4NCj4gPiA+Pj4gICAgICAgICAgaWYgKG9mX2lk
KQ0KPiA+ID4+PiAgICAgICAgICAgICAgICAgIGkyY19pbXgtPmh3ZGF0YSA9IG9mX2lkLT5kYXRh
Ow0KPiA+ID4+PiArICAgICAgIGVsc2UgaWYgKGFjcGlfaWQpDQo+ID4gPj4+ICsgICAgICAgICAg
ICAgICBpMmNfaW14LT5od2RhdGEgPSAoc3RydWN0IGlteF9pMmNfaHdkYXRhICopDQo+ID4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWNwaV9pZC0+ZHJpdmVyX2RhdGE7DQo+
ID4gPg0KPiA+ID4NCj4gPiA+IFRoZSBhYm92ZSBhbHRvZ2hlciBtYXkgYmUgcmVwbGFjZWQgd2l0
aA0KPiA+ID4NCj4gPiA+IGNvbnN0IHN0cnVjdCBpbXhfaTJjX2h3ZGF0YSAqbWF0Y2g7DQo+ID4g
PiAuLi4NCj4gPiA+IG1hdGNoID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0K
PiA+ID4gaWYgKG1hdGNoKQ0KPiA+ID4gICBpMmNfaW14LT5od2RhdGEgPSBtYXRjaDsNCj4gPiA+
IGVsc2UNCj4gPiA+IC4uLg0KPiA+DQpPaywgSSB3aWxsIGNvcnJlY3QgaXQgaW4gdjIuDQo+ID4g
SW5zdGVhZCBvZiAibWF5IGJlIHJlcGxhY2VkIiwgSSB3b3VsZCBzYXk6IGl0IHNob3VsZCBiZSBy
ZXBsYWNlZCA6KQ0KPiA+DQo+ID4gPj4+ICsgICAgICAgICAgICAgICAuYWNwaV9tYXRjaF90YWJs
ZSA9IEFDUElfUFRSKGkyY19pbXhfYWNwaV9pZHMpLA0KPiA+ID4NCj4gPiA+IFNpbmNlIHRoZXJl
IGlzIG5vICNpZmRlZiBndWFyZCBubyBuZWVkIHRvIHVzZSBBQ1BJX1BUUigpLg0KPiA+ID4NCj4g
Pg0KPiA+IFdoYXQgaU1YLyhvdGhlciBOWFA/KSBTb0NzIGFyZSB3aXRoIEFDUEkgc3VwcG9ydD8g
IFdoZXJlIEkgY2FuIGdldA0KPiA+IG9uZT8gSSB3b3VsZCBsaWtlIHRvIGtub3cgbW9yZSBhYm91
dCBpdC4NCj4gLSBOeHAgaGFzIHZhcmlldHkgU29jcywgaW5jbHVkZSBpLk1YLCBMYXllcnNjYXBl
LCBldGMuDQo+IC0gWW91IGNhbiBnZXQgb25lIGZyb20gaGVyZQ0KPiBodHRwczovL3d3dy5ueHAu
Y29tL2Rlc2lnbi9xb3JpcS1kZXZlbG9wZXItcmVzb3VyY2VzL3FvcmlxLWx4MjE2MGEtZGV2ZWxv
DQo+IHBtZW50LWJvYXJkOkxYMjE2MEEtUkRCDQo+IA0KPiA+DQo+ID4gS2luZCByZWdhcmRzLA0K
PiA+IE9sZWtzaWogUmVtcGVsDQo+ID4NCj4gPiAtLQ0KPiA+IFBlbmd1dHJvbml4IGUuSy4gICAg
ICAgICAgICAgICAgICAgICAgICAgICB8DQo+ID4gfA0KPiA+IEluZHVzdHJpYWwgTGludXggU29s
dXRpb25zICAgICAgICAgICAgICAgICB8DQo+ID4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZ3d3cucA0KPiA+IGUNCj4gbmd1
dHJvbml4LmRlJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NtZWVuYWtzaGkuYWdnYXJ3YWwlNDBueHAu
Y29tJQ0KPiA+DQo+IDdDNjQwZWIwMTVhOTFmNDk1OWQzYjUwOGQ3MzAzMTY4ZmIlN0M2ODZlYTFk
M2JjMmI0YzZmYTkyY2Q5OWM1Yw0KPiA+DQo+IDMwMTYzNSU3QzAlN0MwJTdDNjM3MDMwODYxMDc2
ODc5OTM4JmFtcDtzZGF0YT1zUFd0a1Z0SEhEdm9SUg0KPiA+IFptV0p1aXBDTyUyQkV3RyUyQmN1
cGdadmNJVjElMkJybEVZJTNEJmFtcDtyZXNlcnZlZD0wICB8DQo+IFBlaW5lciBTdHIuDQo+ID4g
Ni04LCAzMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55IHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0w
DQo+ID4gfA0KPiA+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8
IEZheDoNCj4gPiArNDktNTEyMS0yMDY5MTctNTU1NSB8DQo=
