Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8E1B32C67
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 11:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfFCJLw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 05:11:52 -0400
Received: from mail-eopbgr30085.outbound.protection.outlook.com ([40.107.3.85]:2958
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728019AbfFCJLw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 05:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lUbE3IAV64cGmmc8MyXZz9pcD5QSTTIX77gmmsICro=;
 b=soB5yRM0dt4OYQ+wfoGMBBDH7kZFDyoWrYeNPVcJFCQzPHi+3y/0SZw0UbuVa3mQJ4sVV6k1O7kyBgrgWCB/ENXxIMlMcDzV+nOXKX8VOi8M+8S5j5ByVXwXxvZCB70SYti64QTQWOLVi0NOzz57sYXd8cwik/Kwrmpp5bda5Dc=
Received: from AM0PR05MB5217.eurprd05.prod.outlook.com (20.178.19.32) by
 AM0PR05MB4289.eurprd05.prod.outlook.com (52.134.126.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.21; Mon, 3 Jun 2019 09:11:48 +0000
Received: from AM0PR05MB5217.eurprd05.prod.outlook.com
 ([fe80::c91c:a669:49d1:600]) by AM0PR05MB5217.eurprd05.prod.outlook.com
 ([fe80::c91c:a669:49d1:600%7]) with mapi id 15.20.1878.024; Mon, 3 Jun 2019
 09:11:48 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>
Subject: RE: [PATCH v1 i2c-next] i2c: mlxcpld: prevent devices from being
 unbounded from driver via sysfs
Thread-Topic: [PATCH v1 i2c-next] i2c: mlxcpld: prevent devices from being
 unbounded from driver via sysfs
Thread-Index: AQHVFikvHsnod3P+HECicoXis2Atu6aGwxKAgALk3fA=
Date:   Mon, 3 Jun 2019 09:11:48 +0000
Message-ID: <AM0PR05MB521704ECCCB55AEA7C1DA072A2140@AM0PR05MB5217.eurprd05.prod.outlook.com>
References: <20190529141636.6043-1-vadimp@mellanox.com>
 <20190601124404.GA11008@kunai>
In-Reply-To: <20190601124404.GA11008@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3027040-77df-4100-17ce-08d6e80381f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR05MB4289;
x-ms-traffictypediagnostic: AM0PR05MB4289:
x-microsoft-antispam-prvs: <AM0PR05MB42895B59492D9321DCC86D3FA2140@AM0PR05MB4289.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(376002)(39860400002)(136003)(346002)(189003)(199004)(13464003)(478600001)(256004)(6916009)(74316002)(4326008)(68736007)(2906002)(7736002)(71190400001)(53936002)(8676002)(52536014)(316002)(5660300002)(71200400001)(81166006)(81156014)(9686003)(54906003)(14454004)(6116002)(305945005)(8936002)(3846002)(73956011)(33656002)(99286004)(6246003)(26005)(186003)(229853002)(107886003)(86362001)(53546011)(55016002)(7696005)(6506007)(76176011)(6436002)(102836004)(446003)(11346002)(66946007)(66446008)(64756008)(66556008)(66476007)(66066001)(486006)(76116006)(476003)(25786009)(133343001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR05MB4289;H:AM0PR05MB5217.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8WSdeAL9KK3XRr32OhEsBoiVE9wrnUQ8NkZ+QDZpqwMF0dhIUcBaFprsHL3Zr9HUzzKAvSJy8cId01k6qf41ykLX+4FZvmjcEeE5U2tdxH17hNygeQEiaOLvIu6WQspYoCQSBnYuWZZ2mQpV9ERf3GO0jR4TApUgvighUm5iVaicqpXUiB3gcBwCaMh8EgsydRUp6u7XgHQdIRMLvcmbgP0RA86OAIHXCTo63W2m0JvKl3JjfsYe2igiJAe81cBi6TPiacTO2ylxnS8NUai73xK1ixw+xm2OTytP4UTP+LBVzupHCv13LoZ9ReiX52QXvnFMTSQ8sBMHxeB57VSuybJBjivG1auYMPc39Fc0vzuLApw+cZylycJjGb/T4Jj6GVf9RN8lD9rMmH5o3V4m6E7Ufk/3Yqt8Cu4ZQ6XI5KM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3027040-77df-4100-17ce-08d6e80381f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 09:11:48.1202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4289
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Saturday, June 01, 2019 3:44 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-i2c@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [PATCH v1 i2c-next] i2c: mlxcpld: prevent devices from being
> unbounded from driver via sysfs
>=20
>=20
> > 'i2c_mlxcpld' is a platform drivers and it registered via
> > platform_driver_probe() and can be bound to devices only once, upon
> > registration.
>=20
> ?? No, it isn't. If it was, the driver core would have prevented these at=
tributes
> (post 2009 kernels at least).

Hi Wolfram,

Thank you very much for your input.
Yes, I see my statement was wrong.

I performed more debug with option CONFIG_DEBUG_TEST_DRIVER_REMOVE.
And I think I found the issue.

In code from 'mlx-platform' driver, I pointed out in commit text,
'mlx-platform' registers 'i2c_mlxcpld' device and then registers few
underlying 'i2c-mux-reg' devices:
	priv->pdev_i2c =3D platform_device_register_simple("i2c_mlxcpld", nr,
							 NULL, 0);
	...
	for (i =3D 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
		priv->pdev_mux[i] =3D platform_device_register_resndata(
						&mlxplat_dev->dev,
						"i2c-mux-reg", i, NULL,
						0, &mlxplat_mux_data[i],
						sizeof(mlxplat_mux_data[i]));
					=09
But it seems for priv->pdev_mux[i] entries,
platform_device_register_resndata() should be called with parent device
priv->pdev_i2c->dev instead of mlxplat_dev->dev, since "i2c-mux-reg
parent is device, created by "i2c_mlxcpld".

This change solves the issue I found with DEBUG_TEST_DRIVER_REMOVE.
And it also seems to be a possible source for some other issues.
I am going to send a path with this fix to platform.

--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2032,7 +2032,7 @@ static int __init mlxplat_init(void)
=20
        for (i =3D 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
                priv->pdev_mux[i] =3D platform_device_register_resndata(
-                                               &mlxplat_dev->dev,
+                                               &priv->pdev_i2c->dev,
                                                "i2c-mux-reg", i, NULL,
                                                0, &mlxplat_mux_data[i],
                                                sizeof(mlxplat_mux_data[i])=
);

Thank you,
Vadim.
