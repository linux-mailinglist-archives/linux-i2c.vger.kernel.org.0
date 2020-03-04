Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA1D178AF9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 07:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgCDGyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 01:54:14 -0500
Received: from mail-eopbgr10075.outbound.protection.outlook.com ([40.107.1.75]:26240
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726957AbgCDGyO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Mar 2020 01:54:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYq5nNr6SKAZklYHOycGPH71/uMKuE+xOJaHc+NZleExSr8jhXLjxitiHVQZyMV72Nf67JSQuOXM7wL6Pnv3tqpbXOw2rNVdr7htByh4omea357DhZolz27LBUoGYmwOlcvSU+XtsWWqVvEPDCGMnkVsEgHIsezMX8QOHPcp9yR+2vZEOdGxQqlNtYCP/lh9yaaXMdHgXi+R2otc4OwJ/+K4FWO398YVrzSmo8PIhVcdsOYJbXDtE+IXQu0yNWC3ogauo8blszLwbRgXl0Yb3Vi/bjE8PIadq1oecSg9kJO9RGKqNTLKROWYnQ72ezZkgqqGOC6CrOEW3LjqAecwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqn64LkHcz3WLjdI68cq5ydoDUna3l0UBLeBX6Nj+BA=;
 b=RCdLYCCHggJnE9Q3S9nxELIfDXVEdRbblrGu6wHJXXXSXWOYQd9sU2SCtQTJFfKpblxT8HoR2Bu/9EYTXQTXVQ6OgJUYiwFeox9xqoC3LiBn/vh+RBstgvy6hH06agkjvqHsIjQRKNZ5Z2Tll0rYEJxKcFBZQVz18j8j72CLLEeaeOzuxMlsKv4efhpfshSCbeffM1P1pEqC6Ux6LsEFZ6SqUpeChQ7AUE0GnSrKdJ1V8j6/zzqwOH6ZdoZfXsYraUsmds3KFxhc7Dkpe+zrwwg1M0qbcvQIN5yOY1UqS1wyn7MFs684U10qtp9wrfS2b9WKBfduMLT2vFihw5XAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqn64LkHcz3WLjdI68cq5ydoDUna3l0UBLeBX6Nj+BA=;
 b=nkZvycSDLnpn8kZQYofZToAEt+ttLGahLe55CkQwUFeGY+p5BMhn1nFes11VLjWuZhW7Oke6ZudujRLefOjV403l79BcVIzmnIcL6wO4qTq81MODLChqGfHu5AdN74ouaa8qO0FTYq5Qx7SnOqHVspM6DE12KyTC9f7g7s/AbYc=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5033.eurprd04.prod.outlook.com (20.176.233.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Wed, 4 Mar 2020 06:54:08 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::85a4:256:671:705d]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::85a4:256:671:705d%4]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 06:54:08 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Sascha Hauer <s.hauer@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [EXT] Re: [v6] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [EXT] Re: [v6] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHVqc+jQ6SBbHZv70GSkQhd1Ae4kKepv5SAgAGvTQCAjPNQoIAAFAKAgAAQB3A=
Date:   Wed, 4 Mar 2020 06:54:08 +0000
Message-ID: <DB7PR04MB44909B54E4760B88071C5B128FE50@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191203114809.21226-1-biwen.li@nxp.com>
 <20191204100005.r56huywxa7h3c6zr@pengutronix.de>
 <9a1a00c1-e9fa-36a1-0e79-3492d9b98d9f@pengutronix.de>
 <DB7PR04MB4490D8434B77DE285A9518448FE50@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <20200304052235.mvpjqa2u56joew3r@pengutronix.de>
In-Reply-To: <20200304052235.mvpjqa2u56joew3r@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7af6944f-0bcc-4474-ff30-08d7c008d636
x-ms-traffictypediagnostic: DB7PR04MB5033:|DB7PR04MB5033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB503322262517CB0134E15F868FE50@DB7PR04MB5033.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(189003)(199004)(478600001)(52536014)(44832011)(5660300002)(4326008)(86362001)(2906002)(71200400001)(6506007)(6916009)(9686003)(53546011)(66446008)(8936002)(64756008)(54906003)(8676002)(66476007)(33656002)(81156014)(66556008)(316002)(26005)(7696005)(81166006)(76116006)(55016002)(186003)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5033;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RNU8KSJ+EE5ZdnSulX4W54k2lhHYDScvv6uW0bpyY6ZinHezbSCaftzaX/RkQ3ltAd2VOhahVMUwwUpKF4Mz/2iKpBUG47iTpLuLsht2eiXvt0nBKErlsmjnx6cGiWrxPJ6V4Q/rjMgPzCYU7mWLJtAmkMaHnZZOS5+cvjlGMZDWn1M2S+j1b1rgBkDhjJdCOO9oiLjhk64FClSxH1Aq7oRNxaVPgX+U0G4U0ER6+MdiR0ZtcfcQB286mjc4KDvaSM8pdFAs7ohTlTByMMXXsStqH+Rc2duCvrKNPBdKSls8d8bw0N037a7IYij2JMM+jSmNRRHELVr1NMGGyFp8UWqhPij1lBaGFpdVqjK2vyvOECdImKhz21QYD2GnvWKZsEAuqu1ghRPXcV05q+0CvBnLJUSPwXn3u42d14R6AMThIUUVTyc+CvRL1XICsT2rf02PkWZkjKu4BlhwDWlmR0rB+qQAS5hrswGd2QzjJF0LmkZWl4kVGnQm6Y+6WUjSJnep7AJzKIy0mEmaff6FyPkv2DUGeuyNEr6cRfn+z9eXNMdet/L+Lq/ZtXPgSini5PQ7DLxLsHNJzpb4oBbSBHEmfgw+rvS9NMHM/wpST1V8LOdFfjOms5DZo113ibe+
x-ms-exchange-antispam-messagedata: C4qSpp0nUUOP7CPuPl78SY5HkFhfjadRI3lGL2teRb2SqmKvd8mKvBVP7+A9HiLyef3iDwFbsc+X7au+xo3vIhR8mYFMiAikDzZAGpmKIjjA4nJkcRBGClI/XzEv2FTDpcUTeutLIvHj1WDElWJIUA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af6944f-0bcc-4474-ff30-08d7c008d636
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 06:54:08.1065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NYSyOyM+sAwHjC0pKekR16Zy5QO161xIOfNNJUshUzoMK0mRFxDibOycj2SEBKNN3zV7PqsEngmQOdcqu0/iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5033
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBIaSBCaXdlbiwNCj4gDQo+IE9uIFdlZCwg
TWFyIDA0LCAyMDIwIGF0IDA0OjEzOjAzQU0gKzAwMDAsIEJpd2VuIExpIHdyb3RlOg0KPiA+IEhp
IFdvbGZyYW0sDQo+ID4NCj4gPiBBbnkgY29tbWVudHM/DQo+IA0KPiBXb2xmcmFtIGlzIHdhaXRp
bmcgdW50aWwgeW91IHJlYWN0IHRvIG91ciBjb21tZW50cy4gVW50aWwgdGhpcyBpcyBub3QgaGFw
cGVuZWQsDQo+IEkgd2lsbCBub3QgQUNLIHRoaXMgcGF0Y2ggYW5kIFdvbGZyYW0gd2lsbCBub3Qg
dGFrZSBpdC4NCkhpIE9sZWtzaWosDQoNCk9rYXksIGdvdCBpdC4gVGhhbmsgeW91IGZvciB5b3Vy
IHJlcGx5Lg0KUGxlYXNlIGxvb2sgaW50byBteSByZXBseSBmb3IgeW91IGFuZCBTYXNjaGEuDQoN
CkJlc3QgUmVnYXJkcywNCkJpd2VuIExpDQo+IA0KPiByZWdhcmRzLA0KPiBPbGVrc2lqDQo+IA0K
PiA+IEJlc3QgUmVnYXJkcywNCj4gPiBCaXdlbiBMaQ0KPiA+DQo+ID4gPg0KPiA+ID4gSGksDQo+
ID4gPg0KPiA+ID4gT24gMDQuMTIuMTkgMTE6MDAsIFNhc2NoYSBIYXVlciB3cm90ZToNCj4gPiA+
ID4gSGksDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBwYXRjaCBsb29rcyBvayB0byBtZSBub3csIGJ1
dCBJIHN0aWxsIGRvIG5vdCBsaWtlIHRoZQ0KPiA+ID4gPiAjaWZkZWZmZXJ5IGFyb3VuZCBDT05G
SUdfSTJDX1NMQVZFLiBXaXRoIHRoZSBwYXRjaCBJIGp1c3Qgc2VudA0KPiA+ID4gPiAoWW91IGFy
ZSBvbiBDYzopIHdlIGNvdWxkIGFwcGx5IHRoZSBmb2xsb3dpbmcgb24geW91ciBwYXRjaCB3aGlj
aA0KPiA+ID4gPiBtYWtlcyBpdCBtb3JlIHJlYWRhYmxlIGFuZCBpbmNyZWFzZXMgY29tcGlsZSBj
b3ZlcmFnZS4NCj4gPiA+ID4NCj4gPiA+ID4gV29sZnJhbSwgQml3ZW4sIHdoYXQgZG8geW91IHRo
aW5rPw0KSGkgU2FzY2hhLA0KDQpZb3VyIHBhdGNoIGlzIG9rLiBCdXQgSSBhZ3JlZSB3aXRoIFJD
QVIuKEtlZXAgSTJDX1NMQVZFKS4NCkluIGZpcnN0IHZlcnNpb24gSSBnZXQgYSBidWlsZCBlcnJv
ciwgc28gSSBhZGQgdGhlIG9wdGlvbiBpbiBzZWNvbmQgdmVyc2lvbiBwYXRjaC4NCklmIHlvdSB3
YW50IHRvIHJlbW92ZSB0aGUgb3B0aW9uIEkyQ19TTEFWRSwgZmlyc3RseSB5b3Ugc2hvdWxkDQpk
ZWxldGUgaXQgaW4gPGxpbnV4IGtlcm5lbCBzb3VyY2UgY29kZT4vaW5jbHVkZS9saW51eC9pMmMu
aC4gVGhlbg0KYnVpbGQgZXJyb3Igd2lsbCBiZSBnb25lIGFuZCBpdCdzIHNhZmUgdG8gcmVtb3Zl
IG9wdGlvbiBJMkNfU0xBVkUuDQoNCkJlc3QgUmVnYXJkcywNCkJpd2VuIExpDQo+ID4gPg0KPiA+
ID4NCj4gPiA+IFJDQVIgZGVwZW5kcyBvbiBzbGF2ZToNCj4gPiA+IGNvbmZpZyBJMkNfUkNBUg0K
PiA+ID4NCj4gPiA+ICAgICAgICAgIHRyaXN0YXRlICJSZW5lc2FzIFItQ2FyIEkyQyBDb250cm9s
bGVyIg0KPiA+ID4NCj4gPiA+ICAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8IENP
TVBJTEVfVEVTVA0KPiA+ID4NCj4gPiA+ICAgICAgICAgIHNlbGVjdCBJMkNfU0xBVkUNCj4gPiA+
IHNlZToNCj4gPiA+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmNhci5jDQo+ID4gPg0KPiA+ID4g
U28sIEkgd291bGQgc3VnZ2VzdCB0byBkbyB0aGUgc2FtZSBpbiBpbXguDQo+ID4gPg0KPiA+ID4g
U28gZmFyLCBJIHRlc3RlZCB0aGlzIHBhdGNoIG9uIGlNWDZTLiBJdCB3b3JrcyBpbiBvbmUgYm9h
cmQNCj4gPiA+IChpMmMtZ3BpbyArIGkyYy1pbXgpIGFuZCB0d28gYm9hcmQgKGkyYy1pbXggKyBp
MmMtaW14KSBjb25maWd1cmF0aW9uLg0KPiA+ID4gVGVzdGVkLWJ5OiBPbGVrc2lqIFJlbXBlbCA8
by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU+DQpIaSBPbGVrc2lqLA0KDQpPa2F5LCB0aGFuayB5b3Ug
c28gbXVjaC4NCkkgYWdyZWUgd2l0aCB5b3VyIHN1Z2dlc3Rpb25zLg0KDQpCZXN0IFJlZ2FyZHMs
DQpCaXdlbiBMaQ0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFNhc2NoYQ0KPiA+ID4g
Pg0KPiA+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+ID4gPg0KPiA+ID4gPiAgRnJvbSA1MmY3YzJiZjU5ZGI2MWQ0YjI3
YjU5Y2E2NDA0MTM2ZTNlZDc3MzEwIE1vbiBTZXAgMTcNCj4gPiA+IDAwOjAwOjAwDQo+ID4gPiA+
IDIwMDENCj4gPiA+ID4gRnJvbTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRl
Pg0KPiA+ID4gPiBEYXRlOiBXZWQsIDQgRGVjIDIwMTkgMTA6NTY6MzQgKzAxMDANCj4gPiA+ID4g
U3ViamVjdDogW1BBVENIXSBmaXh1cCEgaTJjOiBpbXg6IHN1cHBvcnQgc2xhdmUgbW9kZSBmb3Ig
aW14IEkyQw0KPiA+ID4gPiBkcml2ZXINCj4gPiA+ID4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAg
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQ0K
PiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
aW14LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jIGluZGV4IDQwY2Nm
Y2E2MDBiZi4uYzVkOWFlODIyNmNkDQo+ID4gPiA+IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtaW14LmMNCj4gPiA+ID4gQEAgLTIwMyw5ICsyMDMsNyBAQCBzdHJ1Y3QgaW14X2kyY19z
dHJ1Y3Qgew0KPiA+ID4gPiAgICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGluY3RybF9waW5z
X2dwaW87DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgIHN0cnVjdCBpbXhfaTJjX2RtYSAgICAgICpk
bWE7DQo+ID4gPiA+IC0jaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiA+ID4gPiAg
ICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAgICAgICAqc2xhdmU7DQo+ID4gPiA+IC0jZW5kaWYNCj4g
PiA+ID4gICB9Ow0KPiA+ID4gPg0KPiA+ID4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14X2ky
Y19od2RhdGEgaW14MV9pMmNfaHdkYXRhID0geyBAQA0KPiA+ID4gPiAtOTEzLDEyDQo+ID4gPiA+
ICs5MTEsMTAgQEAgc3RhdGljIGludCBpMmNfaW14X3hmZXIoc3RydWN0IGkyY19hZGFwdGVyICph
ZGFwdGVyLA0KPiA+ID4gPg0KPiA+ID4gPiAgICAgICBkZXZfZGJnKCZpMmNfaW14LT5hZGFwdGVy
LmRldiwgIjwlcz5cbiIsIF9fZnVuY19fKTsNCj4gPiA+ID4NCj4gPiA+ID4gLSNpZiBJU19FTkFC
TEVEKENPTkZJR19JMkNfU0xBVkUpDQo+ID4gPiA+ICAgICAgIGlmIChpMmNfaW14LT5zbGF2ZSkg
ew0KPiA+ID4gPiAgICAgICAgICAgICAgIGRldl9lcnIoJmkyY19pbXgtPmFkYXB0ZXIuZGV2LCAi
UGxlYXNlIG5vdCBkbw0KPiA+ID4gPiBvcGVyYXRpb25zDQo+ID4gPiBvZiBtYXN0ZXIgbW9kZSBp
biBzbGF2ZSBtb2RlIik7DQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsNCj4g
PiA+ID4gICAgICAgfQ0KPiA+ID4gPiAtI2VuZGlmDQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgIHJl
c3VsdCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoaTJjX2lteC0+YWRhcHRlci5kZXYucGFyZW50KTsN
Cj4gPiA+ID4gICAgICAgaWYgKHJlc3VsdCA8IDApDQo+ID4gPiA+IEBAIC0xMDY4LDcgKzEwNjQs
NiBAQCBzdGF0aWMgdTMyIGkyY19pbXhfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXINCj4gPiA+ICph
ZGFwdGVyKQ0KPiA+ID4gPiAgICAgICAgICAgICAgIHwgSTJDX0ZVTkNfU01CVVNfUkVBRF9CTE9D
S19EQVRBOw0KPiA+ID4gPiAgIH0NCj4gPiA+ID4NCj4gPiA+ID4gLSNpZiBJU19FTkFCTEVEKENP
TkZJR19JMkNfU0xBVkUpDQo+ID4gPiA+ICAgc3RhdGljIGludCBpMmNfaW14X3NsYXZlX2luaXQo
c3RydWN0IGlteF9pMmNfc3RydWN0ICppMmNfaW14KQ0KPiA+ID4gPiAgIHsNCj4gPiA+ID4gICAg
ICAgaW50IHRlbXA7DQo+ID4gPiA+IEBAIC0xMTU5LDYgKzExNTQsMTAgQEAgc3RhdGljIGludCBp
MmNfaW14X3JlZ19zbGF2ZShzdHJ1Y3QNCj4gPiA+ID4gaTJjX2NsaWVudA0KPiA+ID4gKmNsaWVu
dCkNCj4gPiA+ID4gICB7DQo+ID4gPiA+ICAgICAgIHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJj
X2lteCA9DQo+IGkyY19nZXRfYWRhcGRhdGEoY2xpZW50LT5hZGFwdGVyKTsNCj4gPiA+ID4gICAg
ICAgaW50IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICBpZiAoIUlTX0VOQUJMRUQoQ09O
RklHX0kyQ19TTEFWRSkpDQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gICAgICAgaWYgKGkyY19pbXgtPnNsYXZlKQ0KPiA+ID4gPiAgICAg
ICAgICAgICAgIHJldHVybiAtRUJVU1k7DQo+ID4gPiA+DQo+ID4gPiA+IEBAIC0xMTczLDYgKzEx
NzIsOSBAQCBzdGF0aWMgaW50IGkyY19pbXhfdW5yZWdfc2xhdmUoc3RydWN0DQo+ID4gPiA+IGky
Y19jbGllbnQNCj4gPiA+ICpjbGllbnQpDQo+ID4gPiA+ICAgew0KPiA+ID4gPiAgICAgICBzdHJ1
Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19pbXggPQ0KPiA+ID4gPiBpMmNfZ2V0X2FkYXBkYXRhKGNs
aWVudC0+YWRhcHRlcik7DQo+ID4gPiA+DQo+ID4gPiA+ICsgICAgIGlmICghSVNfRU5BQkxFRChD
T05GSUdfSTJDX1NMQVZFKSkNCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiA+ID4gKw0KPiA+ID4gPiAgICAgICBpZiAoIWkyY19pbXgtPnNsYXZlKQ0KPiA+ID4gPiAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gPg0KPiA+ID4gPiBAQCAtMTE4OCwx
NSArMTE5MCwxMiBAQCBzdGF0aWMgaW50IGkyY19pbXhfdW5yZWdfc2xhdmUoc3RydWN0DQo+ID4g
PiA+IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgcmV0dXJuIDA7
DQo+ID4gPiA+ICAgfQ0KPiA+ID4gPiAtI2VuZGlmDQo+ID4gPiA+DQo+ID4gPiA+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBpMmNfYWxnb3JpdGhtIGkyY19pbXhfYWxnbyA9IHsNCj4gPiA+ID4gICAg
ICAgLm1hc3Rlcl94ZmVyICAgID0gaTJjX2lteF94ZmVyLA0KPiA+ID4gPiAgICAgICAuZnVuY3Rp
b25hbGl0eSAgPSBpMmNfaW14X2Z1bmMsIC0jaWYNCj4gPiA+ID4gSVNfRU5BQkxFRChDT05GSUdf
STJDX1NMQVZFKQ0KPiA+ID4gPiAgICAgICAucmVnX3NsYXZlICAgICAgPSBpMmNfaW14X3JlZ19z
bGF2ZSwNCj4gPiA+ID4gICAgICAgLnVucmVnX3NsYXZlICAgID0gaTJjX2lteF91bnJlZ19zbGF2
ZSwNCj4gPiA+ID4gLSNlbmRpZg0KPiA+ID4gPiAgIH07DQo+ID4gPiA+DQo+ID4gPiA+ICAgc3Rh
dGljIGlycXJldHVybl90IGkyY19pbXhfaXNyKGludCBpcnEsIHZvaWQgKmRldl9pZCkgQEANCj4g
PiA+ID4gLTEyMDgsMTANCj4gPiA+ID4gKzEyMDcsMTAgQEAgc3RhdGljIGlycXJldHVybl90IGky
Y19pbXhfaXNyKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAg
aWYgKHN0YXR1cyAmIEkyU1JfSUlGKSB7DQo+ID4gPiA+ICAgICAgICAgICAgICAgaTJjX2lteF9j
bHJfaWZfYml0KHN0YXR1cywgaTJjX2lteCk7IC0jaWYNCj4gPiA+ID4gSVNfRU5BQkxFRChDT05G
SUdfSTJDX1NMQVZFKQ0KPiA+ID4gPiAtICAgICAgICAgICAgIGlmIChpMmNfaW14LT5zbGF2ZSkN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19J
MkNfU0xBVkUpICYmIGkyY19pbXgtPnNsYXZlKQ0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIGkyY19pbXhfc2xhdmVfaXNyKGkyY19pbXgpOyAtI2VuZGlmDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gICAgICAgICAgICAgICBpMmNfaW14LT5pMmNzciA9IHN0YXR1czsNCj4gPiA+ID4g
ICAgICAgICAgICAgICByZXR1cm4gaTJjX2lteF9tYXN0ZXJfaXNyKGkyY19pbXgpOw0KPiA+ID4g
PiAgICAgICB9DQo+ID4gPiA+DQo+ID4gPg0KPiAtLQ0KPiBQZW5ndXRyb25peCBlLksuICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfA0KPiB8DQo+IFN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAg
ICAgICAgICAgICAgICAgICB8DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGd3d3Lg0KPiBwZW5ndXRyb25peC5kZSUyRiZh
bXA7ZGF0YT0wMiU3QzAxJTdDYml3ZW4ubGklNDBueHAuY29tJTdDZTViNzINCj4gOWJkOTgyNDQ5
NzE0ZTc3MDhkN2JmZmMwZjdmJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUNCj4g
JTdDMCU3QzAlN0M2MzcxODg5NjE2NTcxNzE3NjUmYW1wO3NkYXRhPTZOR0hBOFU4OXRhVWU0OEpZ
Nw0KPiBHVDIzd1lOcnZ2VFZYUSUyQk9mclQzc1ptRGslM0QmYW1wO3Jlc2VydmVkPTAgIHwNCj4g
MzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6DQo+ICs0
OS01MTIxLTIwNjkxNy0wICAgIHwNCj4gQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYg
ICAgICAgICAgIHwgRmF4Og0KPiArNDktNTEyMS0yMDY5MTctNTU1NSB8DQo=
