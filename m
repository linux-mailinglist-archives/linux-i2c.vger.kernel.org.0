Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DA31F8DDD
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 08:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgFOGbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 02:31:33 -0400
Received: from mail-eopbgr00085.outbound.protection.outlook.com ([40.107.0.85]:28439
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728236AbgFOGbc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 02:31:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+k90AFPNtuitsCzbPwrLo1dV1xOaGFBSDPcd2vWtCOpbWGEkAl90W4x76TzdlVnTbeFSm1Xym1Ot7TitfEJLcg3vXjhgkNAI2s/tESZ9uemooHDG/3UNfwCdlgqzMBlltrCTJOTgdmAClMKBgJO/TEGjkK4IKVsCdZr4BR5oNPIWK+Rd9OAAF3TOEUnuWHXHVZjFc4szF/OrB7o0EjxKmqrYCP//cLNOo9CbvDrgcDewi4tisvXpig9Ej43O0SDAO0PEDT2TMWZshl/ojXbjyweQc1/+wch88OeQHKr0QjABMJUdwX5q2OwDH5rqEG+iMQJUMmreu8985qMK/IFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwJ08w4V8QLDFRQGA91kYWxfRKGCCOzxWRaXWuUeLQk=;
 b=Ks9fhRS0w//JtycyDlnFxfZxzv2CYkNFhsmLbxhPtk6kgvzW6s6/+2cCTRIA1GtKif2X1avQl9rndj+Vovy8U2/DwGm9oy3H1QwiRTyEpuYrDVBYuEeQEEjj0wGOpSRtYhN2TUd4zHzR/vDl/YfuMT9eLMMAVMuW2H08dKb+jFal+CsLK13BlM73GiWwvyskxwTgLElSirHijaMFRgprjKrzkb0axo7BQnMcerNb8BetxTI1U0UAVYT6i0v7r6gZr33O9zR2v31Fv9dUAnlf7MX7x0EyxD/7kxsUN/pvrqfT5j8RorGfKcW7a+vPSRlnAGjAOiyqQYyla0vE9kD8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwJ08w4V8QLDFRQGA91kYWxfRKGCCOzxWRaXWuUeLQk=;
 b=WyDAtkcRTAGkRBdhG555Enyo4FUIYf/bBG3W7SnXRno2qwfjuuYEDs0/5gEf1O7/HqK/2uKn2PXEujUvzjj1B/sbsTOVzYBmQU+F+gzo/Wb5mK4on7RghojVovA3X9mexxRnNAcdYKa4iOXlKa7YVYjTJE/eP/jHPplRIfvL7XE=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6725.eurprd04.prod.outlook.com (2603:10a6:20b:fa::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Mon, 15 Jun
 2020 06:31:28 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 06:31:28 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Andy Duan <fugang.duan@nxp.com>,
        "wu000273@umn.edu" <wu000273@umn.edu>,
        "kjlu@umn.edu" <kjlu@umn.edu>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "khilman@kernel.org" <khilman@kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
CC:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: busses: Fix a reference count leak.
Thread-Topic: [PATCH] i2c: busses: Fix a reference count leak.
Thread-Index: AdZC3g9dHxxizGn1RSGWb0XVyXlzTg==
Date:   Mon, 15 Jun 2020 06:31:28 +0000
Message-ID: <AM6PR04MB496688E213BDF2B104E5FCE1809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b46b2a91-2b05-4290-f015-08d810f5bc5a
x-ms-traffictypediagnostic: AM6PR04MB6725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB672590624CEEDCFF333B094F809C0@AM6PR04MB6725.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5VMayBASNCBoBCogGkd2qxfjdH6Li0ryFOVnfUrV9Vqb9d7w7vJGk0SxSl9kzq7jSuL/YdCZIyieomLtjAOsSvWCO4atswEj1bGkYTldhLJvVfJGCpimK7e+cToApXw+IKC5LGk0xaiciDWGWBfBkyzNL6NLmFbgynH/gFnSKzVZlM53NQZ+2tgMnxD5wcCJtiM9ceIMeTSOyTBSG2hdtY9lz7BlgARNRsdB3Z3BXP0Kd2D7k9tTsD8WihxAkqDatJ3tg7tPPBhd+CV51S2stasIKtiHmLJV9rrsKazRatejQyhKpn3xb+DlUojQ6RGM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(186003)(26005)(8676002)(64756008)(33656002)(2906002)(71200400001)(8936002)(76116006)(110136005)(54906003)(66946007)(66446008)(66476007)(66556008)(316002)(6506007)(7696005)(7416002)(4326008)(86362001)(5660300002)(52536014)(9686003)(478600001)(55016002)(83380400001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DU8WmK/YYPF5gD0rvWR9Xc4ENgknTv1lfZ43+Wh0JgmTv6O2BC4/jelNosgZkXIUvSxXsV3CdN7U/10l9PXUVzj+q+WlV7/ve5H5MaXFvtvoQSxML8V23Osq3szO650JT8LgJaDW7MJXU4qRRb0cmGmGmjsjJlzz/a1bF3oDD1kR17811794bBCCJ1XC3w7/lRNKBw3YOjl8NeqlEpMOsChkEI8QZZDwI8/yNo01hMhPo8uVKAPa2mtTET83lhYxCMrQ4AE/YjFVQ4e1mRTowbG0w5IPxQbL0Mq/L0nmYEREYYDQEk20wuC1a0Y1dGOBrnLhANc8vWkZzjR143XibtXo2Bw57ZLD14YKo6k30EI3v4nkLVIjeGl9PGXpgmwOqyiiSDRCIRCsrVN3d/T7YE/rk5uAp7og/HYWgp7EhzPPgLPIBZqTBWO9nwhs/8BgX2BKwvDxoVAeq05E/d4TWZ1qk1493MvLSxIC30yWxL4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46b2a91-2b05-4290-f015-08d810f5bc5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 06:31:28.5383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VhdN3QdsO9CLq126heskx4wunkyi+TOJdn5vdbTZ3k0dBqToKFtkfnD8436gR3Q/+lpdmilPhPgErwnosYcXeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6725
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBBbmR5IER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
SnVuZSAxNSwgMjAyMCAxMDo0OSBBTQ0KPg0KPiBGcm9tOiB3dTAwMDI3M0B1bW4uZWR1IDx3dTAw
MDI3M0B1bW4uZWR1PiBTZW50OiBTdW5kYXksIEp1bmUgMTQsDQo+IDIwMjAgNjoxMiBBTQ0KPiA+
IEZyb206IFFpdXNoaSBXdSA8d3UwMDAyNzNAdW1uLmVkdT4NCj4gPg0KPiA+IHBtX3J1bnRpbWVf
Z2V0X3N5bmMoKSBpbmNyZW1lbnRzIHRoZSBydW50aW1lIFBNIHVzYWdlIGNvdW50ZXIgZXZlbg0K
PiA+IHdoZW4gaXQgcmV0dXJucyBhbiBlcnJvciBjb2RlLiBUaHVzIGNhbGwgcG1fcnVudGltZV9w
dXRfbm9pZGxlKCkgaWYNCj4gPiBwbV9ydW50aW1lX2dldF9zeW5jKCkgZmFpbHMuDQo+ID4NCj4g
PiBGaXhlczogMTNkNmViMjBmYzc5ICgiaTJjOiBpbXgtbHBpMmM6IGFkZCBydW50aW1lIHBtIHN1
cHBvcnQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFFpdXNoaSBXdSA8d3UwMDAyNzNAdW1uLmVkdT4N
Cj4gDQo+IEFnYWluLCB3aGljaCBjYXNlIGNhbiB0cmlnZ2VyIHRoZSBpc3N1ZSA/DQoNCkl0J3Mg
anVzdCBlcnJvciBoYW5kbGluZyBpbXByb3ZlbWVudCBiZWNhdXNlIHBtX3J1bnRpbWVfZ2V0X3N5
bmMoKSB3aWxsIGluY3JlYXNlIHRoZQ0KcmVmZXJlbmNlIGNvdW50IGV2ZW4gaXQncyBmYWlsZWQu
DQoNCkkgd29uZGVyIGlmIHN1Y2ggZGUtcmVmZXJlbmNlIGNhbiBiZSBiZXR0ZXIgaGFuZGxlZCBi
eSBwbSBydW50aW1lIGNvcmUgY29kZS4NCkNvcHkgcG0gZ3V5cyB0byBjb21tZW50Lg0KDQpSZWdh
cmRzDQpBaXNoZW5nDQoNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgt
bHBpMmMuYyB8IDQgKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1pbXgtbHBpMmMuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0K
PiA+IGluZGV4IDlkYjZjY2RlZDVlOS4uODViOWMxZmM3NjgxIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ID4gQEAgLTI2MCw4ICsyNjAsMTAgQEAgc3RhdGljIGlu
dCBscGkyY19pbXhfbWFzdGVyX2VuYWJsZShzdHJ1Y3QNCj4gPiBscGkyY19pbXhfc3RydWN0ICps
cGkyY19pbXgpDQo+ID4gICAgICAgICBpbnQgcmV0Ow0KPiA+DQo+ID4gICAgICAgICByZXQgPSBw
bV9ydW50aW1lX2dldF9zeW5jKGxwaTJjX2lteC0+YWRhcHRlci5kZXYucGFyZW50KTsNCj4gPiAt
ICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+ICsgICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiArICAg
ICAgICAgICAgICAgcG1fcnVudGltZV9wdXRfbm9pZGxlKGxwaTJjX2lteC0+YWRhcHRlci5kZXYu
cGFyZW50KTsNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAgIH0N
Cj4gPg0KPiA+ICAgICAgICAgdGVtcCA9IE1DUl9SU1Q7DQo+ID4gICAgICAgICB3cml0ZWwodGVt
cCwgbHBpMmNfaW14LT5iYXNlICsgTFBJMkNfTUNSKTsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KDQo=
