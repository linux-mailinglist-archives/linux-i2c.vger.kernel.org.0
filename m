Return-Path: <linux-i2c+bounces-7249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FFF993F93
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 09:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 488DD1F22548
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 07:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A61EF943;
	Tue,  8 Oct 2024 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EYNrNHTR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340C1CFEC2;
	Tue,  8 Oct 2024 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370692; cv=fail; b=rVG9Jj0P1O9XgGttcBDo5f+S1hN/ysDu5c8Qp8KlFxOgDcqLAa86pvF8hAk0qwoBy7ZuyhfwsSbhWzValL+UkOpb2Teo/CSS/u+nBqSq2ZnxsTIT9EjU71hde2BHKgjqcXyTtJc1rD9hP+UQdcW7v5TVOAd/Qc4FqMXgKsbTq78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370692; c=relaxed/simple;
	bh=zufWxaTRBO/aN6eERcrUCR9RTAN9FV+9V9q0xcux6tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZvyoIyxGW0BWYABXdzUBIKoV464iEbD77WHNnC4Cvw4q1UYiMGmjNe6k55KMhzRIoYRzuxFPpWuSf8OQACpFQaPmYDwA76AMi0xgqJ3NLiA1fCB1PH13TPb1Z/nIR52vmwfkyaFd2P0O7/CAgv1PUsTWjEbYNRAl3IY77AXHzT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EYNrNHTR; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px5on4hbKlHPEr5umN9ZRnbrZOIfV2SwWVWqfZn2v83d5j5YIUQGU6wZzpDfPi1vT+UNANTg+0/PZuNKFuvQic90KsXSc/wkdVetYnXK8u1YsJqMcyf8YNLi39KtLWw8yHxrdH/62EXiMuBh3PF7IplWtuhGaiR3zosQHXwbfLmNW+v+oXo/PhCwJIbCSlO0Ud0NEmKBsHkeTEvGBJGJ2hYAmsf0nV60xyXi4B+n2I0wn279pVnA9HlBelCOxJBkQlgkzUVvm8aFkdYTRkg+XRGqMSFJxSIcaFJrbZ89VfRXlBKz0CFo80qpNDwCyf33UYJQljQ5Cwdts6djHKzcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXCzY5zTCJ/jsisG9Yt84ToF6vZk5JLXlw1iq0MPpI4=;
 b=acWEiuZiBuPlEBmme3XSocPrQ1/xrNaAsbNGxDpEs1Ry3qRUMTJXPJk/0/QgjDZZmuemdRc+WpFq1HfcRggRBGrs7xgSWFzl70swG9ZZ3aIod9/jiq88Zj9OA8telubZi/+/7MadmBVPuogCOVLYZR0c72cnr10fl5B7w4zJByWsMyvCvdnKdGhjnJseeRRCythZOncXjDCQB5XjqwmMKjnKpLe4rREz8lApI2Or3hVYqgfH8I/61p9igD6t/4ZUVrzYbb/8D4/J/vwtzXmsmyE0isnInacc8pzyFVJdvl8HgkvOZbVZzhWF6DfFwkTQPNKGcRXIR+dTOxqQ4IqTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXCzY5zTCJ/jsisG9Yt84ToF6vZk5JLXlw1iq0MPpI4=;
 b=EYNrNHTRhZdFsY9EvJNRpvZZCF12hS2L85mAnrQD8lJWiVn0TpHxnGN6lzHEAOT51zmaSe2IIQYfGOQCtSEEND+K+05wa09Os44uNpZdQaNeWcj/Eihcl39o/qGo0p1EUcENHrBfm6VRTXJot0oEiv8sWoqjkut4vIntxkDjxwNeh1PiOWQeVUL+GURHLvGO6hFEA/oQvDt2el+z2BqcR0sIj1xZmp1Q/mqE7BE31ArKyXNZWTpHXXPhfpCm8vXSgzYjlqNrHJojioYbDl5OWVaYok1pvmzjylr7uU2vUP9wutOfB/SFuwHB9Z7tJeURcC5wO/v3pcg1zh6/Nuelpg==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PA4PR04MB9462.eurprd04.prod.outlook.com (2603:10a6:102:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 06:58:07 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8026.019; Tue, 8 Oct 2024
 06:58:07 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4] i2c: imx-lpi2c: add target mode support
Thread-Topic: [PATCH V4] i2c: imx-lpi2c: add target mode support
Thread-Index: AQHbGU9tvUeaCfFK5UyZ9XMS7JnpJA==
Date: Tue, 8 Oct 2024 06:58:06 +0000
Message-ID:
 <AM0PR0402MB3937BD3C11B8D9A39E35BBADE87E2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20240912082413.435267-1-carlos.song@nxp.com>
 <evfhjmeblrucqta2jb74jwul7evqt25tbsxp46xrghytbr645d@t6rvyuriruax>
In-Reply-To: <evfhjmeblrucqta2jb74jwul7evqt25tbsxp46xrghytbr645d@t6rvyuriruax>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|PA4PR04MB9462:EE_
x-ms-office365-filtering-correlation-id: c70717ec-4ab9-4635-e07d-08dce766902a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?obnw3/GdEQeitB/B2ZVR90sg5VcJ33USAq19g8T0uR3AhtwjmQKKukK/lh4j?=
 =?us-ascii?Q?+5vUmMal0z0S5CvDOmnCZpYrmvAVXeJFeMDkCgWE7hfxFHlj7YCWWQMjz3ge?=
 =?us-ascii?Q?JN6vigDtrRruxPwUoUmIk7bqNMB8KYD8b4maDKpg77Xub34IhUusMf6SKAV6?=
 =?us-ascii?Q?FiDwQLBF8UuadN/MjQtnh9LgG86qUG2U5a9bkRfnwRSDoKXrdM63luTNU7LI?=
 =?us-ascii?Q?DzDvftzaqrbYx71oTUjJx5FJu0JSx/SugCqxEO3mBw+dDMY1+fcAF80XYvED?=
 =?us-ascii?Q?Tvfpr5CD+xJk++/Ts94xIrIQciwUT0yY+8Pdmo08aw/RyDL7M+YPJHsU8PX1?=
 =?us-ascii?Q?Ztk+DxnqAmtdQoWS0MFGja/MVftH2ErCpNU4e1/6pcsribpIgyGyqZAKC71I?=
 =?us-ascii?Q?jp9sPa1o5/OrCFGRlBClrHN5ruhB59l95HU3dEHsJ5h9mhp/dVSjiNJOmG7v?=
 =?us-ascii?Q?cgTEhZBd6DCzTikPRxgOitjBs+p2d6d9oABm1PYGYTRL5aM1hzqLDDx4nnJ1?=
 =?us-ascii?Q?me5Asc+pBq6ahATUBdHR96ZV3vSyVMbgGE21veTZ4/3Rfv7B3rpbPExTf/wb?=
 =?us-ascii?Q?VbuU9q63chCcKdwqvpKIEsyPDVGjfiV2U9dSipGGGay0O9U7QIgz28sasZej?=
 =?us-ascii?Q?krwuJkvVvfHIrsqvSbULAne/PeZ/Dzz4tjApXica873Gm3anjsj9wzVeW8mA?=
 =?us-ascii?Q?2ysK3f+YHqt2YwYUmi1VVIVHyge0u0bId/PUnKmJQiYqQtPaOyIeHStOjshk?=
 =?us-ascii?Q?Eeh5mtIhHMP7N4iX0qEoLH02qNQTHmA1v2NXWVFTw9PrsyXXX4vJCuEOF1rW?=
 =?us-ascii?Q?YqlQfCbCDsF4fjM3lWR8izBBogSKnfbO+tWbiNNQOQn3K7r2280zF7fnmbCX?=
 =?us-ascii?Q?6KyM1P6vjM5T0wwFVhbuXKlSynSW7Xjw0fZ4PEX4C473YSesI/rJsHKUJIZy?=
 =?us-ascii?Q?2oOQhlih5WGiW93g6ZSTZf4gxKNBV67AvgdVgjH8jCHThaAw54RPiMpJUVtj?=
 =?us-ascii?Q?IRLV5PNBoVfnjRv8Hnn8uFgurTYVWvWkv+irDGv6MybJWmpxQz9/FoAavNGq?=
 =?us-ascii?Q?+wHc53TdiZfLvrZPKfID5XW1szNXxqGdOLAoT3VluQWaz/3vxB/T8w0zIuka?=
 =?us-ascii?Q?unUpTnMHGg78ylxKQnRzvGTWMGlNt2F3EfMV2+EpH2ZpaMqGADbozUpWCirA?=
 =?us-ascii?Q?ChF16Hm31mRq2NNY3nz5jSUbTzT9xyZo4EPDWbrXaNlO95R5WWxjKkJdC81v?=
 =?us-ascii?Q?YtUURUat+ywFlxZy8ssXPjNab0oTdi32u5diApppNM95RVOTyZjAinackzcG?=
 =?us-ascii?Q?cXDiluEohD1sNLEgT1aylMZFLkE+0XHILdQGcAhn7y132Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?plGiAZaeYlRRrVVJEutNDfNcuJ3dM2Vz2ydRuCMi/H+Fq1ncKBaj4xoH+NLY?=
 =?us-ascii?Q?9QLxJ13HRqJol356i8R5bl1HtiCDW4qFZFzmramA+I+DShDd4oH5PcWKgnv2?=
 =?us-ascii?Q?XX9Sdk/q8HQdKoRXPGcdYuc423ZCGOivM9QwfZBn2iLOYc+TNK8oxSz6qFMU?=
 =?us-ascii?Q?wElf1iNjsSUVJYb8zuegzE9M2fg1fKhsPign+FUmAuGyp1ifvUMphms3OlKQ?=
 =?us-ascii?Q?Iu2XsUiZoi4IWP7r3XkuuGmhF9wF64neDJt4YphluznpW5wHebm4UZSM7yPX?=
 =?us-ascii?Q?lL8rUgpIM/Au/baUorkKYZmYVTQsVGxhdlAyX+hKv4wFBTCZ6HrKDJ89JBlj?=
 =?us-ascii?Q?xKWN/lV4kNVoV/P8rQawlY6DIEwOoi2evMbTkFaP6lLtZE2YAs9rzOTWKDZM?=
 =?us-ascii?Q?XseapnsqelqL5zr2/O4ctYOZmdhYLzjOZGRYcUI0AQok3ykPfwk+TJn2DNF8?=
 =?us-ascii?Q?GmPXRh3nBN3RJXGPf8kx4bOcOO02CwUNYIqcnrRVm+uY6Tye086pRP0upstX?=
 =?us-ascii?Q?0Eo2OX2TaHb0Tqd795GYg88s1vXEWJx0tDqpndJ29Jpf8r28fBXj+umAXh6y?=
 =?us-ascii?Q?vA/X26E9Cqz0CezdNzf6kP1gf3viH7+3SNFE4i8F/YY/E64dGe7ObQ1ORG2X?=
 =?us-ascii?Q?1Drth0R1jse74SqD/Ft9NsrNRYKztNr/HVaNFUO3JJlF2JEXHiQmqOceqYBI?=
 =?us-ascii?Q?5joTy+vUT+rQBpsVq/lhOrAkaCfU/rjs6sK7kxS/DzwaDXnlZOl2V3YyxCtd?=
 =?us-ascii?Q?VE4O5JVYThOAXVkivwankkuGQu0t+xjxsKSskVNZje/U24cDp3gsktQP8QYu?=
 =?us-ascii?Q?jD8vinJtZHq3+8HaFcx5IT08GSk+bx094iVIRryhzf827mPGBKMZ+oXyZv49?=
 =?us-ascii?Q?SymtfBJ8H8pvZ6RmwGNmC9Moo6VwM4eicoOmqT1xRmOcl6GOsfOL/weJ+htc?=
 =?us-ascii?Q?k+sHxLsL4YJDNHREl07INkpAcc331mZb7mWq10Nd+FeYVvflnBY2D+dA+CeF?=
 =?us-ascii?Q?MwhiM9j2KCKJpaExqq4QHdAdTta0vBRKYLiUNfH6pSDQVV8OAWVSdQp9IKZ6?=
 =?us-ascii?Q?4EWrgfsqZ1UBjUIkyhclHEh+aCiSjeqndL2C5TWTOBbJOcDIbQLurUCKnu+z?=
 =?us-ascii?Q?qRz69zO1KpVjFB0DYM+Vly3Rf14oh67Zv32VOV9J6j5pKWc6bLA5MqQwae51?=
 =?us-ascii?Q?uK0E3XeuafOi74GIwFt6jZ3PXlQCZ3zN31yIcN/i/H4rarI1D0ZZBXpswjBM?=
 =?us-ascii?Q?D7ihavsF6TiKw4juK4fp7iFOBWE4IMyllYQs9ZGjPD5qTbIRVwcNrOnUCWV9?=
 =?us-ascii?Q?BAhXQwdXPkN07dNLVQgV9kypOadgKvKmNk1DZG2hfCYAcTBf6ctAcM/crOJD?=
 =?us-ascii?Q?p1JgFrEbpPd/MiCW1dukXQSrlXGh4aSBHM4+JS5yIBFjADeARRDD76xctIv8?=
 =?us-ascii?Q?y4AQBeJ0kGhdCDkdND+SHdsrBotx6R3Xwlx80P0b4Alo7JuogNJbKpJ8xuyF?=
 =?us-ascii?Q?cxuWJeTSBMVhdO34LOT7jPqV8t+RW+CPeGk5Y3wtLnzpjPyXEMPQj12gXvMw?=
 =?us-ascii?Q?P1Gsbk2a348yifgdLq4PJa+kufWNgC5HFTMgVtYl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c70717ec-4ab9-4635-e07d-08dce766902a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 06:58:07.0657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lWIUWoOpO+C3GgMFBCscVoQ2KJxYFbppQwvTJKBcCtNDOzzNoY+dHWCK+X5fVmOSnZUb14RpStjCPeQZcWROQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9462

> Hi Carlos,
>=20
> On Thu, Sep 12, 2024 at 04:24:13PM GMT, carlos.song@nxp.com wrote:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > LPI2C support master controller and target controller enabled
> > simultaneously. Both controllers share same SDA/SCL lines and
>=20
> /same/the same/
>=20
> > interrupt source but has separate control and status registers.
>=20
> /separate/a separate/
>=20
> > Even if target mode is enabled, LPI2C can still work normally as
> > master controller at the same time.
>=20
> It's not what happens in the irq handler, though (I left a comment in irq
> handler).
>
> > This patch supports basic target data read/write operations in 7-bit
> > target address. LPI2C target mode can be enabled by using I2C slave
> > backend. I2C slave backend behave like a standard I2C
>=20
> /behave/behaves/
>=20
> > client. For simple use and test, Linux I2C slave EEPROM backend can be
> > used.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
>=20
> ...
>=20
> > +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id) {
> > +     struct lpi2c_imx_struct *lpi2c_imx =3D dev_id;
> > +
> > +     if (lpi2c_imx->target) {
> > +             u32 scr =3D readl(lpi2c_imx->base + LPI2C_SCR);
> > +             u32 ssr =3D readl(lpi2c_imx->base + LPI2C_SSR);
> > +             u32 sier_filter =3D ssr & readl(lpi2c_imx->base +
> > + LPI2C_SIER);
> > +
> > +             /* Target is enabled and trigger irq then enter target
> > + irq handler */
>=20
> This sentence is a bit hard to understand, how about:
>=20
>                 /*
>                  * The target is enabled and an interrupt has
>                  * been triggered. Enter the target's irq handler.
>                  */
>=20
> > +             if ((scr & SCR_SEN) && sier_filter)
> > +                     return lpi2c_imx_target_isr(lpi2c_imx, ssr,
> > + sier_filter);
>=20
> Can't the interrupt be generated by the master if lpi2c_imx->target is as=
signed?
>=20
> In the git log you are describing a different behavior.
>=20
Hi, Andi,

Thanks for your suggestion.

In fact, if lpi2c_imx->target is assigned, master still can generate the in=
terrupt and will also can enter
master's irq handler.

Because LPI2C has independent slave register group and master register grou=
p.
SCR register is slave control register, SSR register is slave status regist=
er and SIER register is slave interrupt enable register.
So Even if target is assigned, and if the interrupt is triggered by master,=
 this judgment will NOT hit:
		if ((scr & SCR_SEN) && sier_filter)
			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);

so logic will keep going then enter the lpi2c_imx_master_isr().

Over all, when lpi2c_imx->target is assigned, either enter the master handl=
er or the target handler.
When lpi2c_imx->target is not assigned, only enter the master handler.

Maybe my commit log "master mode and target mode can work at the same time"=
 is misleading.
I will change to "Both master mode and target mode can be enabled".

Do I understand you correctly? If I do. Please tell me I will send V5 patch=
 for other fixes.

Carlos
> > +     }
> > +
> > +     /* Otherwise triggered by master then handle irq in master
> > + handler */
>=20
> Otherwise the interrupt has been triggered by the master. Enter the maste=
r's
> irq handler.
>=20
> > +     return lpi2c_imx_master_isr(lpi2c_imx); }
> > +
> > +static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
> > +{
> > +     u32 temp;
> > +
> > +     /* reset target module */
> > +     writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
> > +     writel(0, lpi2c_imx->base + LPI2C_SCR);
> > +
> > +     /* Set target addr */
>=20
> /addr/address/
>=20
> > +     writel((lpi2c_imx->target->addr << 1), lpi2c_imx->base +
> > + LPI2C_SAMR);
> > +
> > +     writel(SCFGR1_RXSTALL | SCFGR1_TXDSTALL, lpi2c_imx->base +
> > + LPI2C_SCFGR1);
> > +
> > +     /*
> > +      * set SCFGR2: FILTSDA, FILTSCL and CLKHOLD
> > +      *
> > +      * FILTSCL/FILTSDA can eliminate signal skew. It should generally=
 be
> > +      * set to the same value and should be set >=3D 50ns.
> > +      *
> > +      * CLKHOLD is only used when clock stretching is enabled, but it =
will
> > +      * extend the clock stretching to ensure there is an additional d=
elay
> > +      * between the target driving SDA and the target releasing the SC=
L
> pin.
> > +      *
> > +      * CLKHOLD setting is crucial for lpi2c target. When master read =
data
> > +      * from target, if there is a delay caused by cpu idle, excessive=
 load,
> > +      * or other delays between two bytes in one message transmission.=
 so
> it
> > +      * will cause a short interval time between the driving SDA
> > + signal and
>=20
> /transmission. so it will/transmittion, it will/
>=20
> > +      * releasing SCL signal. Lpi2c master will mistakenly think it
> > + is a stop
>=20
> /Lpi2c/The lpi2c/
>=20
> > +      * signal resulting in an arbitration failure. This issue can be =
avoided
> > +      * by setting CLKHOLD.
> > +      *
> > +      * In order to ensure lpi2c function normally when the lpi2c spee=
d is as
> > +      * low as 100kHz, CLKHOLD should be set 3 and it is also
> > + compatible with
>=20
> /3/to 3/
>=20
> > +      * higher clock frequency like 400kHz and 1MHz.
> > +      */
> > +     temp =3D SCFGR2_FILTSDA(2) | SCFGR2_FILTSCL(2) |
> SCFGR2_CLKHOLD(3);
> > +     writel(temp, lpi2c_imx->base + LPI2C_SCFGR2);
> > +
> > +     /*
> > +      * Enable module:
> > +      * SCR_FILTEN can enable digital filter and output delay counter =
for
> LPI2C
> > +      * target mode. So SCR_FILTEN need be asserted when enable
> SDA/SCL FILTER
> > +      * and CLKHOLD.
> > +      */
> > +     writel(SCR_SEN | SCR_FILTEN, lpi2c_imx->base + LPI2C_SCR);
> > +
> > +     /* Enable interrupt from i2c module */
> > +     writel(SLAVE_INT_FLAG, lpi2c_imx->base + LPI2C_SIER); }
> > +
> > +static int lpi2c_imx_reg_target(struct i2c_client *client)
>=20
> lpi2c_imx_register_target as a name is a bit better, in my opinion
>=20
> > +{
> > +     struct lpi2c_imx_struct *lpi2c_imx =3D
> i2c_get_adapdata(client->adapter);
> > +     int ret;
> > +
> > +     if (lpi2c_imx->target)
> > +             return -EBUSY;
> > +
> > +     lpi2c_imx->target =3D client;
> > +
> > +     ret =3D pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
> > +     if (ret < 0) {
> > +             dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c
> controller");
> > +             return ret;
> > +     }
> > +
> > +     lpi2c_imx_target_init(lpi2c_imx);
> > +
> > +     return 0;
> > +}
> > +
> > +static int lpi2c_imx_unreg_target(struct i2c_client *client)
>=20
> lpi2c_imx_unregister_target sounds better to me.
>=20
> > +{
> > +     struct lpi2c_imx_struct *lpi2c_imx =3D
> i2c_get_adapdata(client->adapter);
> > +     int ret;
> > +
> > +     if (!lpi2c_imx->target)
> > +             return -EINVAL;
> > +
>=20
> ...
>=20
> > +static int lpi2c_suspend_noirq(struct device *dev) {
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_force_suspend(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
>=20
> This function can simply be:
>=20
>    static int lpi2c_suspend_noirq(struct device *dev)
>    {
>         return pm_runtime_force_suspend(dev);
>    }
>=20
> but I'm not strong for it, your choice.
>=20
> > +}
> > +
> > +static int lpi2c_resume_noirq(struct device *dev) {
> > +     struct lpi2c_imx_struct *lpi2c_imx =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_force_resume(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * If i2c module powered down in system suspend, register
> > +      * value will lose. So reinit target when system resume.
> > +      */
>=20
> Can we re-write this to something like:
>=20
>         /*
>          * If the I2C module powers down during system suspend,
>          * the register values will be lost. Therefore, reinitialize
>          * the target when the system resumes.
>          */
>=20
> Thanks,
> Andi
>=20
> > +     if (lpi2c_imx->target)
> > +             lpi2c_imx_target_init(lpi2c_imx);
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct dev_pm_ops lpi2c_pm_ops =3D {
> > -     SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > -                                   pm_runtime_force_resume)
> > +     SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
> > +                                   lpi2c_resume_noirq)
> >       SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
> >                          lpi2c_runtime_resume, NULL)  };
> > --
> > 2.34.1
> >

