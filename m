Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D126B9FF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2019 12:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGQKWi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jul 2019 06:22:38 -0400
Received: from mail-eopbgr00057.outbound.protection.outlook.com ([40.107.0.57]:5748
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725873AbfGQKWi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jul 2019 06:22:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faBuWjAqIAuwu87RAWlH+R0f/uXJe8ggIER4zIYp/jsDIhAl7HoKgiLAeqPrLMUl4fGEpDVbIOaBtDNBoLYWITteUgW54G4Pp4iCNangmig0i6RgOx8axDz5c6OPgFeLP1ICfOdcQAUjfJ6OUcI5dkipQ1foUOf0jqVgGgXFOShZoxvon2nNyIMVTCBJNIoxC7LQTqOS/Umv6StaXx5gm1CEnUuVf+OxgIhEvDeix/gEGF2AlzP5WlCU6emOv3zIkDnb4uxP6qHheAeumNSF2US35qw5xQv6auqjiDFwpZPY/VTLT6HeqcU0145chvTTu+U0wrE4SzejAqHXnZcLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlxCALpKAX/PPHwiaGuoBS9kB0Pnkf2POu8sgiQF3Q4=;
 b=TvGY9vkxH5CucL6/8i6fY0wFG8yvtSN+lC0eGQLeKDkx0qGZs5218R9bS5QZvZk1w4SLomaaaze2iwf7tFtHrsVk11vLscxN2VjNoF7mxs304Ty60b3PqpkR1PKEUkOFUPTrgAq6jEtvIpREtgwPUg6j1+SRVT/B5spHVy7DHS2O+LqfN9AXrA90scLfOu9kATcE+4E+HZkdTzVQ3Q+uu2YGT0aLawfBmocwpv2ukszh+sSUemn8cGd1zC99B+5OYyV9tS5LUZHQrJTkTWs4WC+xI7Tb53bSJMR2YzXAaaOkxn3ZtUan9hNXLU8nWDwhd6wuhsZYzMNkr8aLoKLJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlxCALpKAX/PPHwiaGuoBS9kB0Pnkf2POu8sgiQF3Q4=;
 b=a7inERjp53kaWixbm/n5pfOAKwdO9g2ftylYnWcJjI3ipTfzwRHG+1wHroMkxXX11w5gYV0cs7NYjiWvNx5P83Pp9+8YvCsNAbBnb/NzjIMFR+g2Gwn+kB5qUF2Kh2Tjbdx/BqmNaMwvLXMo8O2BQXH+cXcikJ6SvTbogYV7ovU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5604.eurprd04.prod.outlook.com (20.178.203.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 10:22:35 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::7882:51:e491:8431%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 10:22:35 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/2] i2c: imx-lpi2c: use devm_platform_ioremap_resource()
 to simplify code
Thread-Topic: [PATCH 2/2] i2c: imx-lpi2c: use devm_platform_ioremap_resource()
 to simplify code
Thread-Index: AQHVPHyR7JsrX+SniEe/wrvwOi8WYabOmevw
Date:   Wed, 17 Jul 2019 10:22:35 +0000
Message-ID: <AM0PR04MB42112856FEC15C74AE18824980C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190717084017.30987-1-Anson.Huang@nxp.com>
 <20190717084017.30987-2-Anson.Huang@nxp.com>
In-Reply-To: <20190717084017.30987-2-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8439905d-0381-4253-27c0-08d70aa0af98
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5604;
x-ms-traffictypediagnostic: AM0PR04MB5604:
x-microsoft-antispam-prvs: <AM0PR04MB5604F47B9CB43A45C45A4EE380C90@AM0PR04MB5604.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(199004)(189003)(8936002)(6506007)(53936002)(102836004)(71190400001)(44832011)(7696005)(2201001)(81156014)(76176011)(66446008)(66556008)(66476007)(76116006)(64756008)(71200400001)(5660300002)(2906002)(99286004)(305945005)(2501003)(66946007)(52536014)(229853002)(26005)(8676002)(6436002)(66066001)(6246003)(476003)(446003)(55016002)(11346002)(478600001)(86362001)(3846002)(186003)(110136005)(6116002)(25786009)(68736007)(33656002)(316002)(256004)(4326008)(74316002)(558084003)(14454004)(486006)(7736002)(81166006)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5604;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nQtfigxX2aK8BuAJ9zv30HtFXq8AzZ841w2sJfp4oJZnnhFwR0SCN4ebRGwqSHfSzAgJpMCvYD0PON1f19vS4g8MZt/iMAf5vwjs2Tc6UwwaLeic2VZBv2JVY12JxfN+Ey7gNRoOZr2vKO4XAHyoLgZAQzPRP99UQGBfx7LhE/Vfh+9WRG2cOEMbpXjj5XfWmI9EO172bnunf5l3EKOfhJ9aj56m71MhLNCzZ08p1rERQ+tKi2T5CzEzqA4WWPCnEPlefK067mVwIk0KJsXUkT+w36f4OEZMAELOXYaCWC+x6iBbtEmO54a1Titdwi7T0QOenNBt3a8GOPWxGKtDg2uy7PbAJSUYj4Kd/UDdbgQiZ+HvudYHPLWSRdJHYOF6VV/B7x84KCAvG18DL8eYufbSY7h6YzBbZseQmSUHDIc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8439905d-0381-4253-27c0-08d70aa0af98
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 10:22:35.2034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5604
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiBTZW50
OiBXZWRuZXNkYXksIEp1bHkgMTcsIDIwMTkgNDo0MCBQTQ0KPiANCj4gVXNlIHRoZSBuZXcgaGVs
cGVyIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHdoaWNoIHdyYXBzIHRoZQ0KPiBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBhbmQgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgdG9nZXRo
ZXIsIHRvIHNpbXBsaWZ5DQo+IHRoZSBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5zb24g
SHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQoNCkFja2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQo=
