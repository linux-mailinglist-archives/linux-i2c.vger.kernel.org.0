Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0781A6161
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Apr 2020 03:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgDMBr1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Apr 2020 21:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgDMBr1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Apr 2020 21:47:27 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D009C0A3BE0;
        Sun, 12 Apr 2020 18:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu8ObJCZEv7XtySinS8h/OYSLmH6do0WdzQvYop6y8s/n+Lcqsi1tq71FcjKgsoJlgAbzyBRVhpEvllZwaxA4/FtUtz6Adx0ffy1n5Nh9ogBesosr2bF6MVZDXBK4bbbVxQRvRs32/gID7hswKabVUvHbP0nk6gAOVDh4yrsIqzxz7M+X/eRkXbxldD/iBVkfvJZGmh2MH8xDeqfVYNXT6rl19t8TW/IUoaKXYA/+nCP0LNie03EW8jLuSFN+76ojcd9qiFn2I4KWtBtoMw8tfj5Q6zNkmVPTAfV8qHSRLCQMQq15f6S95IOxyb1mwFwaGQIuBfb1//Pg5NiZg+QXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SufpMPNKt3kr0WQz8ipOgLXFnez2JMVr/PD482/kkN8=;
 b=aVwBWv2g1zTuRdcc+WP464Q3tJVbvVsCxKvp0oXxWQIDyfyX97pGwTBSXzozMxIpVTVZaV5Vsg95dNYEIaRDUm4Exop03GpiEoK1zKGe9NuSsW6/aaHgtd86qx03qV6H5qbSe4eZUe2bHyDAw2nqSCmTGScAO2yiSFY/34ZCskLcM1pH5DMcqZl2Bo5rCMpbQ09v1zxy16Zw7k+TG5tcET7GAxeqzENQkm98Z42aCW3aFOcRUimzPZOnQ0gDj9X47p7aJ7vZPpq0mY2Q99SBsR4weT218BydEKI9E9wGJIUbCtnJ6oJ/KYl9mwoqEmLU9XPg2uw5xQr6WKv0TbgfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SufpMPNKt3kr0WQz8ipOgLXFnez2JMVr/PD482/kkN8=;
 b=HvMzIUFho/7Ts/NHufQQm4UMjLgOw+yBiuwNI0Mck9urLt4IWT4oV0OZxYesnexsyAzOugdkzV3JWcW6bOLEx7sgefwWRfkzCPEbBFt/Rxyjg2WVT3VZMmYnTn3yxuaFgK9lZOlPg3MiGVo56UHjcDAkK8nKya+dpeF2dPy5Lfg=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR0401MB2661.eurprd04.prod.outlook.com (2603:10a6:4:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Mon, 13 Apr
 2020 01:47:21 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 01:47:21 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Jiafei Pan <jiafei.pan@nxp.com>, Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Thread-Topic: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Thread-Index: AQHWBzkXTcGzA0x8aUyGGvcxzEf3vahg9ioggAAFCICAAWn4gIABV62AgBKg4aA=
Date:   Mon, 13 Apr 2020 01:47:21 +0000
Message-ID: <DB6PR0401MB2438758B508896794994EC0B8FDD0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200330105038.22546-1-biwen.li@oss.nxp.com>
 <DB6PR0401MB24389E2570C242FB9036EC968FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <20200330111231.x2a57acoy57ycyo6@pengutronix.de>
 <DB6PR0401MB2438EC4CDA8985BE84F825048FC80@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <20200401051807.edaxgrloyqkp3p4z@pengutronix.de>
In-Reply-To: <20200401051807.edaxgrloyqkp3p4z@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [120.244.152.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ccc4f816-7ab4-41dd-88c4-08d7df4c9baa
x-ms-traffictypediagnostic: DB6PR0401MB2661:|DB6PR0401MB2661:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2661AD2F89811315AA643D1ECEDD0@DB6PR0401MB2661.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(76116006)(478600001)(55016002)(66946007)(66476007)(7696005)(26005)(64756008)(66446008)(9686003)(66556008)(86362001)(83080400001)(316002)(52536014)(966005)(81156014)(8936002)(5660300002)(54906003)(33656002)(110136005)(4326008)(2906002)(71200400001)(6506007)(186003)(8676002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VTYM5myDl9+Txg0e+00lcpXgGWJnjqN3LqBdDfUcI9lFo8AaJM9vJqG3GjTuQR1Cno8D4MCWcoUTzkpsmZOyi9wiUi3uIYPjke4hK2SX9wDTENb1PrIxOXodiKpRpA39dRJy7jHvZBkePrvSJJS/lpEI165v8SuM2dBnTtemY3MiP8BMvxjP+vJFIw5vGYIHs00DK6GmvgO5Bqqe1kWx6s+iWMQyW0TiPSuQUxoayEGXtWU0S/xyPbyZfPJfWgziEVbi8yqLEfx3fCwSzLT6T5C8veekeOtQKhcv5Axr5JQUO6eM3pNemWmzYxttFir1odRUKdfMqM9yP5iLhcfJpNWYRLb9pC+fI/BSnJ9b9kRtMW5Cy6GULTBSbi4DTN26r3HGu7XevO30pZqJ7000P5BlAzcc+3QIFhhObFQVVLqk+XWTkAIxOpMWDdsmQmz16VMODoPYaR4dTN33niyeaFdHt9vIvBKj9yGIgrsw8EfxMsqjiBI08vtYEMDXWRZ2ZDcrgJZeJnVPm5J1kupPw==
x-ms-exchange-antispam-messagedata: vHmrqg9ukvuruxpcgcj+donVhF7BW6C3JaGEKbzOaEJLg7T/JNbrara6Sn7WlwiMnWuQwvu28UprEWE6gDdXoVugbpn9uJqpP9HEe7ktG6MDN6bMWfsC43UCGAS0OGPBUkl+P13tj4KakJ57xv4d2w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc4f816-7ab4-41dd-88c4-08d7df4c9baa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 01:47:21.7078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2jCRQb6wrXghO513jXhinIXFZoxH/F+ksRbXzlZn5JDMW3n+8CmSzwo9GWOHIZcsHEo3BjPmHe2z8TFGMDDKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2661
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gSGksDQo+IA0KPiBPbiBUdWUsIE1hciAzMSwgMjAyMCBhdCAwODo0ODowM0FNICswMDAw
LCBCaXdlbiBMaSAoT1NTKSB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+IE9uIE1vbiwg
TWFyIDMwLCAyMDIwIGF0IDEwOjU2OjI4QU0gKzAwMDAsIEJpd2VuIExpIHdyb3RlOg0KPiA+ID4g
PiBIaSBBbGwsDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBwYXRjaCBiYXNlZCBvbiBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3BhdGNoLzEyMDM2NDAvDQo+ID4gPiA+IGFuZCBpdCBpcyBub3Qg
YWNjZXB0ZWQsIHNvDQo+ID4gPiA+IGl0KGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0
Y2gvMTIwMzY0MC8pDQo+ID4gPiBpcyBuZWVkZWQgYmVmb3JlIGFwcGx5IHRoZSBuZXcgcGF0Y2gu
DQo+ID4gPg0KPiA+ID4gSSdtIG5vdCBzdXJlIHdoYXQgc2hvdWxkIEkgZG8gd2l0aCB0aGlzIGlu
Zm9ybWF0aW9uLiBUaGlzIGxpbmtzIGFyZQ0KPiA+ID4gdG8gdGhlIHBhdGNoIHdoaWNoIG5lZWRl
ZCB0byBiZSB1cGRhdGUgYnkgeW91LCBiZWZvcmUgaXQgY2FuIGJlDQo+ID4gPiByZXZpZXdlZCBh
bmQgdGhlbiBob3BlZnVsbHkgYWNjZXB0ZWQuIFdoeSBkbyB5b3Ugc2VuZGluZyBvbmUgbW9yZQ0K
PiA+ID4gcGF0Y2ggZm9yIHJldmlldyBmb3IgYSBwYXRjaCB3aGljaCBpcyBub3QgYWNjZXB0ZWQ/
DQo+ID4gSGkgT2xla3NpaiwNCj4gPiBPa2F5LCBnb3QgaXQuIEkgd2lsbCByZXNlbmQgdGhlIHBh
dGNoIGFmdGVyIHRoZSBvbGQgcGF0Y2ggaXMgYWNjZXB0ZWQNCj4gPiBieSB1cHN0cmVhbS4gVGhh
bmsgeW91IGZvciB5b3VyIHJlcGx5Lg0KPiANCj4gRG8geW91IG1lYW4gdGhlIHNodXRkb3duIHBh
dGNoPw0KTm8sIGl0IGlzIG5vdCByZWxhdGVkIHdpdGggc2h1dGRvd24gcGF0Y2guDQo+IA0KPiA+
ID4NCj4gPiA+ID4gQmVzdCBSZWdhcmRzLA0KPiA+ID4gPiBCaXdlbiBMaQ0KPiA+ID4gPiA+IFN1
cHBvcnQgSTJDX1NMQVZFX1NUT1AgZXZlbnQgZm9yIHRoZSByZWFkIHRyYW5zYWN0aW9ucyhtYXN0
ZXINCj4gPiA+ID4gPiByZWFkIGZyb20NCj4gPiA+ID4gPiBzbGF2ZSkNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPg0KPiA+ID4g
PiA+IC0tLQ0KPiA+ID4gPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jIHwgMSArDQo+
ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gPiA+ID4g
PiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgaW5kZXgNCj4gPiA+ID4gPiA2MjUxN2E0
MWIzMmQuLjFmZDBkODc4ODVkNSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWlteC5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1p
bXguYw0KPiA+ID4gPiA+IEBAIC0xNDY0LDYgKzE0NjQsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QN
Cj4gPiA+ID4gPiBpMmNfaW14X3NsYXZlX2lzcihzdHJ1Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19p
bXgpDQo+ID4gPiA+ID4gIAkJY3RsICY9IH5JMkNSX01UWDsNCj4gPiA+ID4gPiAgCQlpbXhfaTJj
X3dyaXRlX3JlZyhjdGwsIGkyY19pbXgsIElNWF9JMkNfSTJDUik7DQo+ID4gPiA+ID4gIAkJaW14
X2kyY19yZWFkX3JlZyhpMmNfaW14LCBJTVhfSTJDX0kyRFIpOw0KPiA+ID4gPiA+ICsJCWkyY19z
bGF2ZV9ldmVudChpMmNfaW14LT5zbGF2ZSwgSTJDX1NMQVZFX1NUT1AsICZ2YWx1ZSk7DQo+ID4g
PiA+ID4gIAl9DQo+ID4gPiA+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiA+ID4gIH0N
Cj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IDIuMTcuMQ0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMsDQo+
ID4gPiBPbGVrc2lqDQo+ID4gPiAtLQ0KPiA+ID4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwNCj4gPiA+IHwNCj4gPiA+IFN0ZXVlcndhbGRlciBTdHIuIDIxICAg
ICAgICAgICAgICAgICAgICAgICB8DQo+IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvDQo+ID4g
PiB8DQo+ID4gPiAzMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQ
aG9uZToNCj4gPiA+ICs0OS01MTIxLTIwNjkxNy0wICAgIHwNCj4gPiA+IEFtdHNnZXJpY2h0IEhp
bGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDoNCj4gPiA+ICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwNCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAg
ICAgICAgICB8DQo+IHwNCj4gU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAg
ICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8NCj4gfA0KPiAzMTEzNyBIaWxkZXNoZWlt
LCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZToNCj4gKzQ5LTUxMjEtMjA2OTE3LTAg
ICAgfA0KPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6
DQo+ICs0OS01MTIxLTIwNjkxNy01NTU1IHwNCg==
