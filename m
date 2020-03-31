Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E31D8198ED3
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 10:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgCaIsL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 04:48:11 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:26702
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726299AbgCaIsL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Mar 2020 04:48:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyKHQKl9y4xWU8ihlV3JyWiajjIy1JvKtSQK482/SyFPKSzewgt1z1dYM6Pvhch6I2CXZfPWUMGxK/+dVVO87qSBWi72T4TNFvf4t85wbGrabyFAWxq2LNyjN0j/99gAD5DEPIyCplkVGd6/bbNJsVw/r8Ijx8a69ga7ChRJPoYn0goHDWBWhk7TcXNjcgIj9KHpV4IDvtA3nZdjnUd9bkmkPRTJ4dO5CuR42HkQxi/zFf0tqewtmS9BBeRVMY0Ac4oteJ8VTKGmXYQ5o4g4/7K9xdz9sScZsMRhG4YqzjBmz2TD0vR7yR13ZQnFup9MAzfctW5WoNjuQbRI/0No7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB39O+tnUPQE5MOM6oYsSJaxPL/HlNtJTeOOYMtTqNY=;
 b=Rfz78R6RtsbwITwqExnnI0ETATPWJ9HQugkrVgM3StouWIJkzvtH0dcTP/aOQLtdshvSiJfOgI8/VlwktizCRMTgLytQ/Qe/ltpowqvzajRfQjuE4dml6zwuRGgxbYhDbFKxA0OHBxZF7OrE7+FOXv++EusFLnbVQbpflDULJzrJmy1vt5bDOHqTV93NcpwWzRfLUI+25xkNNAa3c3/uR61aEOxK+7ktLaawXlTCGIRrjTcbCtBUSkUEFBa0tj+XBdsIbKma8FyGxDNf2CfAjHdxqQyrJw2TT6ouojS01QdOtPzrAZk7mDqXMsRgm6lYI3LdJ2YCE6aUFEt++wkgUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB39O+tnUPQE5MOM6oYsSJaxPL/HlNtJTeOOYMtTqNY=;
 b=euBWPGbuhFa1Zw0aj8hwjy0h9NuYwKT1OVDdgG1yMDwFRh8orAoDwxJ0v2ct3uH5t2J4H8N5KNkdCx5MOTiRvj97CWXU0Wt2o9al1vCYBtJBK88rZQS9cmApeafsl3ZXhzdFaFk4fZ3lcMZrKQa0zD53ZRtHWCNKyRW3aO/nrPs=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (10.169.223.14) by
 DB6PR0401MB2488.eurprd04.prod.outlook.com (10.169.224.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 08:48:04 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::bca5:53b2:e6c3:4037%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:48:03 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Thread-Topic: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read
 transactions
Thread-Index: AQHWBzkXTcGzA0x8aUyGGvcxzEf3vQ==
Date:   Tue, 31 Mar 2020 08:48:03 +0000
Message-ID: <DB6PR0401MB2438EC4CDA8985BE84F825048FC80@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200330105038.22546-1-biwen.li@oss.nxp.com>
 <DB6PR0401MB24389E2570C242FB9036EC968FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <20200330111231.x2a57acoy57ycyo6@pengutronix.de>
In-Reply-To: <20200330111231.x2a57acoy57ycyo6@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 862ba4b2-653c-496c-547b-08d7d55039c8
x-ms-traffictypediagnostic: DB6PR0401MB2488:|DB6PR0401MB2488:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2488354F89DE8EE09C43F873CEC80@DB6PR0401MB2488.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(54906003)(2906002)(76116006)(33656002)(9686003)(81166006)(71200400001)(478600001)(55016002)(6506007)(8676002)(86362001)(6916009)(316002)(81156014)(66476007)(5660300002)(66946007)(7696005)(64756008)(186003)(8936002)(26005)(4326008)(66446008)(966005)(52536014)(66556008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pz4GaeyYAJFGpgWbdM431vws3u/0C5Ie3pUXKqYqaeM0XDCmWT7es/a+xDeZC1GEj5TLYI7X2hX1v8/SIJVIApr5+hk+vKoAaOQQ+kGphg8gBhco5abhWq6DVInCpvE+DiZeiN30dLmdPA0lA/+VzSyIrankFHYbV98YwfcpQ/FXMi+31qSGafl0MKbsNE5kvIZwt7YhJbrFwhsdxV+MKhITfuMNMNuuQEk82k0MArlLbdufQWDFq8zFrvFNRURhEWkYcuRpSeBHM+9o1BFb51jSo5+KHLx7RG0lpWkftFvVmEa9SWsi9GGcJ79s0VJ2cnC4lrphFWolO5+2HGP8TlXkjwxF1J/vfHL2EALXokEKe2TsnCsNzgZKBUcNG7Vs+g4sLzIRmS27o0GVvInoKupM0S02E/Aby4QUMFO4HPQKEDmZriw/3eJCldATnpkkBidXPxaaqgi4+zeGGy6gSjENBSiCF73jEZvfhcLOuRiYCmuEcsLMSIMoFU4cqPRfYgP5pcYjDHJ0dDi2fRmHuQ==
x-ms-exchange-antispam-messagedata: P/s0WznbM/Ng4xcYqzRC0y+fOhPKQhGPb2aa+QD7rQYPoLKAL5mJsP45ywayulak7/nmOSLwFsdqnz2cKCc7XREliVbW6g2RkUotXEOp2GHBpMTrHHUp6hXU+aYsHwOvxS0yR8m8Lc6b1/cIxUw1cw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862ba4b2-653c-496c-547b-08d7d55039c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 08:48:03.8825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzgUgbzvaeMMwPnBQhGwtWHcAl3nE2nQg4b9x+qTchiT+gCVmfxSJ8EOeKo9Hq1R9hU7bWetLuWzHsCq6bPEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2488
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBIaSwNCj4gDQo+IE9uIE1vbiwgTWFyIDMwLCAyMDIwIGF0IDEwOjU2OjI4QU0gKzAwMDAsIEJp
d2VuIExpIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+IFRoZSBwYXRjaCBiYXNlZCBvbiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzEyMDM2NDAvDQo+ID4gYW5kIGl0IGlz
IG5vdCBhY2NlcHRlZCwgc28gaXQoaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8x
MjAzNjQwLykNCj4gaXMgbmVlZGVkIGJlZm9yZSBhcHBseSB0aGUgbmV3IHBhdGNoLg0KPiANCj4g
SSdtIG5vdCBzdXJlIHdoYXQgc2hvdWxkIEkgZG8gd2l0aCB0aGlzIGluZm9ybWF0aW9uLiBUaGlz
IGxpbmtzIGFyZSB0byB0aGUgcGF0Y2gNCj4gd2hpY2ggbmVlZGVkIHRvIGJlIHVwZGF0ZSBieSB5
b3UsIGJlZm9yZSBpdCBjYW4gYmUgcmV2aWV3ZWQgYW5kIHRoZW4NCj4gaG9wZWZ1bGx5IGFjY2Vw
dGVkLiBXaHkgZG8geW91IHNlbmRpbmcgb25lIG1vcmUgcGF0Y2ggZm9yIHJldmlldyBmb3IgYSBw
YXRjaA0KPiB3aGljaCBpcyBub3QgYWNjZXB0ZWQ/DQpIaSBPbGVrc2lqLA0KT2theSwgZ290IGl0
LiBJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaCBhZnRlciB0aGUgb2xkIHBhdGNoIGlzIGFjY2VwdGVk
IGJ5IHVwc3RyZWFtLiBUaGFuayB5b3UNCmZvciB5b3VyIHJlcGx5Lg0KPiANCj4gPiBCZXN0IFJl
Z2FyZHMsDQo+ID4gQml3ZW4gTGkNCj4gPiA+IFN1cHBvcnQgSTJDX1NMQVZFX1NUT1AgZXZlbnQg
Zm9yIHRoZSByZWFkIHRyYW5zYWN0aW9ucyhtYXN0ZXIgcmVhZA0KPiA+ID4gZnJvbQ0KPiA+ID4g
c2xhdmUpDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54
cC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jIHwg
MSArDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gPiA+IGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1pbXguYyBpbmRleA0KPiA+ID4gNjI1MTdhNDFiMzJkLi4xZmQwZDg3
ODg1ZDUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+
ID4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ID4gPiBAQCAtMTQ2NCw2
ICsxNDY0LDcgQEAgc3RhdGljIGlycXJldHVybl90IGkyY19pbXhfc2xhdmVfaXNyKHN0cnVjdA0K
PiA+ID4gaW14X2kyY19zdHJ1Y3QgKmkyY19pbXgpDQo+ID4gPiAgCQljdGwgJj0gfkkyQ1JfTVRY
Ow0KPiA+ID4gIAkJaW14X2kyY193cml0ZV9yZWcoY3RsLCBpMmNfaW14LCBJTVhfSTJDX0kyQ1Ip
Ow0KPiA+ID4gIAkJaW14X2kyY19yZWFkX3JlZyhpMmNfaW14LCBJTVhfSTJDX0kyRFIpOw0KPiA+
ID4gKwkJaTJjX3NsYXZlX2V2ZW50KGkyY19pbXgtPnNsYXZlLCBJMkNfU0xBVkVfU1RPUCwgJnZh
bHVlKTsNCj4gPiA+ICAJfQ0KPiA+ID4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiAgfQ0K
PiA+ID4gLS0NCj4gPiA+IDIuMTcuMQ0KPiANCj4gUmVnYXJkcywNCj4gT2xla3Npag0KPiAtLQ0K
PiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiB8DQo+IFN0
ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVu
Z3V0cm9uaXguZGUvDQo+IHwNCj4gMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAg
ICAgICAgIHwgUGhvbmU6DQo+ICs0OS01MTIxLTIwNjkxNy0wICAgIHwNCj4gQW10c2dlcmljaHQg
SGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4Og0KPiArNDktNTEyMS0yMDY5MTct
NTU1NSB8DQo=
