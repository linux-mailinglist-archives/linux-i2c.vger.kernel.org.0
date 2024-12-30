Return-Path: <linux-i2c+bounces-8813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104A9FE1BD
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42753A1A20
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 02:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABB742AA6;
	Mon, 30 Dec 2024 02:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bDctnDrB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B31EB39;
	Mon, 30 Dec 2024 02:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524366; cv=fail; b=AESvn4A3bwb+3pMWW/zpQUpDpBIa3bpuNXyAIQuCRUztw9MeyeDvY8kHf65fNFN3BNpjo3K909QKH/V1IMdlqRq/i7Btb0sdAMFDvtC0h4MBynZD9XN4iqhuW5RrREFojAxnNSQPubo1RzTJaeGOgO+YArEKsW2fPNirCEihzWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524366; c=relaxed/simple;
	bh=ywZNKwLt/B0FdNaIGWBU+nfZHuzwjcVBQ3SjOeboVv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eEBiL1T2RvPbaPspTPtCqTmo9jVPNfkgrBqJJu/R2avxbpe7rKlSQyK2cbmg8laoFmL51+/ed0j3Z3kJ1g29el5yJ+vdwOE1NGN1sNgsX3P+Fy8hJDjvBb5W5Wr0IoWOQ8SgBSN8mkRv+74jNGvER6t5d/HAmrdleksLWtk3gVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bDctnDrB; arc=fail smtp.client-ip=40.107.21.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYQcmldRx0Ze/3FQly4O07wIeHOPnm8gsOiQF11oFaKLyQYHcQvYXcstC6k+5NqtVN5pkdGc6Rs4p/nNf3ip7mP4L02ChxJP9lZf+5EMmhgrEi/aPyQvXx8kvE8RkySupYN8FFxemH2J/JLc3/Yd0eObZdUJS0TajPq+L5MkDlNBrWH/aoxm285C/NDOsBmM8NSlM00fnM14rpHPmnGaCrFIqASs0hXohJk3Lu3gsuOTTVyOpeKwGA8412/Asx6T2KaEbQse/F9NBDWn1Da9bQoVF6wFMPnh7W747LHUsLbjda83BKYTWP5eR0I71UqzaPSN8NPDhwGr4VCytgl9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywZNKwLt/B0FdNaIGWBU+nfZHuzwjcVBQ3SjOeboVv0=;
 b=QLq6EAx8GuwnpauMV+79RYJ3QMqOBgmF6+EMmgYbl4hTm1db8ZEk1xyTeLP2DsCyVwsYmJdhzeC9qgMwmISll7Jpnmm5NETUu10o/OrYJfT3UJyWokCebE3eP/y4E/GtLohnigJdm8UxaX+BKj8ILW0thoBLh3N6JGs38IPHfACf+O8RMcEH9xRHO4DBlMrxPon6VF3p9V0rUXMkhzmi//mON64iSfVlYRd8BIIQU3kiKMk7p+0lM/AWxK+PbG5Z7+eqwv4kwQOy4VomffTsqDcUsDNNPzV54u5Kvy6wiJ5domiGAzgCSepTVPTb8Y9CTJgCkdUsfYGPxKyDl0wlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywZNKwLt/B0FdNaIGWBU+nfZHuzwjcVBQ3SjOeboVv0=;
 b=bDctnDrBklelujtuWJjS2QdFUWeJO1SZ+P9jLqk6fC5iTzT9bLxazCKdqTCXjInfXsubXY3FH1kiwGr7soUQmqIh5UqYvbSuJV/TDKgRDVeM62TcixdC/tGD37ACn1QVHuDNwA9HHdwolnBufhGyuk1dMe/f8pbxv0gZkewCr0IOMQfdooTWsI9cuIAwxJp6KnxPKR6mwVxcL82tAr4lFkbknNjWybw/XiK+fF07mgm1Z/378cwV3soCPXaKCYQxPlDXwdVEhTpcDFgc+gb4fC3HwZ9C5hiOxeZE8byVcWq5RkIsZD8MOG2hGswg1UjPjhRZKBLvm3jjE8R852P5xQ==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU4PR04MB11031.eurprd04.prod.outlook.com (2603:10a6:10:592::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:05:52 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:05:50 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Frank Li <frank.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Thread-Topic: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Thread-Index: AQHbWl9ZDhk0I8tGGkuGcQmmQVb+bg==
Date: Mon, 30 Dec 2024 02:05:50 +0000
Message-ID:
 <AM0PR0402MB393766FD0EC946FEA2E32819E8092@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241228090852.2049321-1-carlos.song@nxp.com>
 <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
 <lv7cliatuynamsimld546tjr7uhn3r7dqq5d7uhype2wh3au45@mdiv4asd33ti>
In-Reply-To: <lv7cliatuynamsimld546tjr7uhn3r7dqq5d7uhype2wh3au45@mdiv4asd33ti>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DU4PR04MB11031:EE_
x-ms-office365-filtering-correlation-id: 35b0ec9e-aa7c-4342-69a8-08dd28767bef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?34HoUB2SaGSOa0t1qmaICn1qvXzwa6AYCJgoipGnKPn0jDUyQNGJ/qUCHr+x?=
 =?us-ascii?Q?WvJFqx8i2Gpl6HE1pbUSMz4h5ImylilL2fNjcreAeeOLhdcr87WfkAhsDGAQ?=
 =?us-ascii?Q?bYtgz8i6VhbjTQAu5MKcT6FXwtgoefz22BXuBxtviB+KkwqWBmJ7fU0JJ3P8?=
 =?us-ascii?Q?bQEDUacgQVa3n7k1n6fKM+DSbc2xC47aywajAwI1nnjgL+76GfJKS7bxEG23?=
 =?us-ascii?Q?36iSN8QNAnTSuXto3fjQZN+6PuUO6Xs5nQ6e3i1BYbSbZyxL7tSSVYT1fRfy?=
 =?us-ascii?Q?2yJJ1u+9jLOQrEJOD7ubxKOCnKORGTLzHuiC6KWYtsISquZacAB+1jdRZ45Q?=
 =?us-ascii?Q?EKeFw/iCcFQg16VFSYwdUzkj2GZeKC8gN7W0Wr9n7XR50GWoVEV4NH5YASu7?=
 =?us-ascii?Q?cfguHBls8UIoYZaJzf8JuwrPf3xWvWr7oBhn+uRp5Q67NQ+VoIhGHAAeGr3S?=
 =?us-ascii?Q?xlOnNr/u/DDwiXqX27BG8V8GkOIIZ+OI7aTW//91VeiYhXH1m8cVIaG0isrF?=
 =?us-ascii?Q?72EWLO2c+Ea6rH4/rSE4E2wCLFN2t/psH+0as8JMTpBAoHwL82UNyhryawyO?=
 =?us-ascii?Q?P45o2Cp3UEOVCIXERzDUVOL6b0mTR/U8ymwQ3g0m2dJCCjOenOzPev6DcGoe?=
 =?us-ascii?Q?ZFu90Ke3n1vBeKs2dFy5NfT5rQw7yVne+2CjLvmNNiQL0okSYEj8kTTaZlm2?=
 =?us-ascii?Q?zFxCC+O6WodIrPQtAf3mPvfUWvqR0kGV0kS7kl8syI8EWvp/SyhnRfp7RUzV?=
 =?us-ascii?Q?156SqjRkapAKJgyud4kof4cEnVj9TlN3rrJWjebPY8NzJaEFORQJGBztpv38?=
 =?us-ascii?Q?cyux7IT54yS2xvYsLY6IjNeXRbw5MH5UcNjwInW0bZPmksBHz1uEflAWV2g/?=
 =?us-ascii?Q?7YX8c0v9XxRQyAEfOr3Di5SsJCF3MVYyhd7Liaucrj5JO0KVCgtPdJczS0xv?=
 =?us-ascii?Q?uTBPjr9ujgT1fWpfFHV8PdcO6SkDtGmllO+NmPkfGwcZ/4r8VdtN6X24a4hp?=
 =?us-ascii?Q?eZM96ZNgU2vSt2dXlfbWkZJUX4ySQm0U7acH9vzNrM3AwOwVD1821ZgLw4gv?=
 =?us-ascii?Q?rKTGsE7vLwYtibAQhM63qVLtXt7VhzWWxQjZ2x6XRsZwiBaTJXZHOP5s3Kpy?=
 =?us-ascii?Q?T2mBNur1HFinm7mdhErlDXG5vmBsLnnQzUMFdwaG0zSwvJKPpOt/Sh0/9Psw?=
 =?us-ascii?Q?KYbmCkIamF3rU7Byi1DaGPEhW/w98rqS9TmHQuILOk+NTDjvG1NeOa2Rd7uT?=
 =?us-ascii?Q?5wnf08ssaHEkNPi/eXEfm51wl9u2Oz+I+/Oxf1teD1mjHYBo3iNp0Ojj0bYo?=
 =?us-ascii?Q?AWjOsdb3+uUUub/iWrvL65fMUH/IxAFnMP0uUii7YcPPZYcDeiGn8eeNyMHj?=
 =?us-ascii?Q?1tfm+ZMZKpJGCMTXEMOkRYy733Wiwzh302EUuj647Qw+gxe40ruDTXQYal6K?=
 =?us-ascii?Q?L56p7bKygvqUJfOEYUpeTMFHfeAGiGh6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5Jm5fM4SD/PnObsdpPODxu6b5CovozVWNowfie1pRzdNAU1KN71OBquPrShw?=
 =?us-ascii?Q?AW7WqAai8khLq/ljGk4yzM7+0uOjsJXz6JPB1Jr+qcCQO/rw3D8b7PLkVZxU?=
 =?us-ascii?Q?NCZao/Mpx2FAZeWVg9zxhsf4hX/ofJt6Yfc+tmqh0cpDE0yKl5wJoeNEjeyf?=
 =?us-ascii?Q?mp37LgqTErwgTB+fr0Fcb8uCEciO477rFUDmWIMayCwkMlqsgiHeS2RMqIv8?=
 =?us-ascii?Q?3k5zGBjn+xV7eVrt4rm+7sgmSWoxS5UnHYWr3GZ8YisunYdXNLalFHFTz11m?=
 =?us-ascii?Q?jHyyE/aW0QHnl44K6TAcNnwbvq3h7UZRJGfQK8Hnz6SdE2jTDZanyWvnrx1b?=
 =?us-ascii?Q?IGydjbYXc7F9SCMgvKkKXNV4nleS47zR+fLwQut5AyAzFHi1tUAu7X/v/Kt/?=
 =?us-ascii?Q?Wt8wQc0nphUBEC/qx3EYbIIMEnfcVae62ZwnT6EbUlIRsmC/o6UUBJFt8wCH?=
 =?us-ascii?Q?5cM0UjveYXYbojiANI0sV67KP6hdl5cb8NywWJHqGSsFynuJ9XRKTF9Zv/to?=
 =?us-ascii?Q?hK71In5Q6+NnqmXskCEHBD07hDmML2ViJg9FYMEG0/p7BYbW2AJRc42DIGlz?=
 =?us-ascii?Q?KxSB9ns11gcEPg/+Qt7VdZeXtRaASJj7bbMGEgYJaWzhnk3oGnptTiU4RGnd?=
 =?us-ascii?Q?981WGP+FkQhb7AWbN9Rc6rhRxNrJMtBJPmDflyEGM/CAYnMxHdlNLEIIzw4l?=
 =?us-ascii?Q?cH4V9oKDsWvaAlDrySvVJL+xxoxuzCxz/N+b5q/HVF3U9CvEHtNz+qHOaK/K?=
 =?us-ascii?Q?x76CesEooY6J3pZTVn8ZeoPxoD0znf9uO7uuLInjYNby2Xc6BZSuK762AXVA?=
 =?us-ascii?Q?S2jQrlrre5EFSCmJ/uBXqhYPITfoLifJ3gR2WLTkXAoFsML5RMj4LNewA4aw?=
 =?us-ascii?Q?KIMtt3VkpA6Mx3gMmotSeraLRY9MN5NN86X8vIk9ncPXYFJxWd4yGJB/vOO1?=
 =?us-ascii?Q?02WCbNz+r5KkEQ1tk6sNxM6npLu0JuGFUOoXH3ehQfM/8cMUYH5+3209XCli?=
 =?us-ascii?Q?pmvcCicKLsfCiNrEZ/AL8mXcNhDxL79VdRlUFBOAAWKf2Fz7Q5LiqAofNDy8?=
 =?us-ascii?Q?vXCcLswFlcIA3/o8zqzP3QjktjYknXeh3XXqWR0TSZ/T8raYhlktnryaS44c?=
 =?us-ascii?Q?YHdrZJEh2RpvgEpN1Bi+lOB8bjkqknMeXQ5DXtSkHx7J0sNYFihu/VlB4fN3?=
 =?us-ascii?Q?8mObOGBL2r4VlCF1MsSzgKUw+TRUmTThoasAwcjWMnNK5LTVjKd0p0feyVtw?=
 =?us-ascii?Q?LQK+8bFRH/vv/M2dx6ItJLglDFe+E78hSHgH4IQ9Wt2NwwXWQw+B4/2aLWh8?=
 =?us-ascii?Q?WvdeJA5dMrJoyNaoOOj01fDRnFTfvgYEmWDZ5wVHNkavVAdfI6gSLffZE/cL?=
 =?us-ascii?Q?+LLsGVTenfPJN2VAXdkLicWnwY+frjFsY2M4u6IukIEwwo3hsPlQg3ZxtlR5?=
 =?us-ascii?Q?HCXZUhj8HBIiA4nEfOupIt2GzBkFiRPXdzCzlvZCrmONjuUnyX5eRrDfzMzO?=
 =?us-ascii?Q?U59E9uy9IwcmnqW5tzHtQZrLcXZ0M4j3HkH/gTBbS/1MXZVFlUv/vRvvD0Lf?=
 =?us-ascii?Q?aNr1gcb1xEMFMXox6lHiFrZY8SmmTZAGM14sy0Hm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b0ec9e-aa7c-4342-69a8-08dd28767bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 02:05:50.7005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sl2OY2JKt7VndebgXAzxj1j/2/zz/7wyNssNgqpOowqfMr5nwwPWfkYcFb8+9d8G7Mn+m3fOEPUghNg4F9zz3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11031



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Sunday, December 29, 2024 5:01 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Frank Li <frank.li@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kerne=
l test
> robot <lkp@intel.com>
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: fix build warning "function de=
fined but
> not used"
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> On Sat, Dec 28, 2024 at 09:53:22PM +0100, Andi Shyti wrote:
> > On Sat, Dec 28, 2024 at 05:08:52PM +0800, Carlos Song wrote:
> > > lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it
> > > maybe unused, so should add __maybe_unused to both functions to
> > > avoid build warning.
> > >
> > > Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> > > re.kernel.org%2Foe-kbuild-all%2F202412280835.LRAV3z0g-lkp%40intel.co
> > >
> m%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C20350a7984e64a96359
> d08dd
> > >
> 2782c95b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638710164
> 87754
> > >
> 0710%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
> uMDA
> > >
> wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C
> &s
> > >
> data=3DFR4jUHXmRZxQOnaBRkMsYV5toDEhfAsWatxTfoizbjo%3D&reserved=3D0
> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> >
> > yeah, I have different PM configuration to catch these kind of error
> > and I missed this.
> >
> > Rather than applying a fix over a recent patch, I am going to remove
> > your original patch and ask you to send a v7 of your
> > "imx-lpi2c: add target mode support".
> >
> > Is it OK with you?
>=20
> I removed the patch and updated patchwork. I will be waiting for your v7.
>=20
Hi, Andi, thank you very much! It helps a lot.:)

I will merge the fix to "imx-lpi2c: add target mode support" at V7 patch.

BR
Carlos Song

> Thanks,
> Andi

