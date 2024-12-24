Return-Path: <linux-i2c+bounces-8700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B89FB8C3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 03:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C7018849D3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 02:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF9F13D297;
	Tue, 24 Dec 2024 02:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OA+chLIr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057CD26D;
	Tue, 24 Dec 2024 02:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735008927; cv=fail; b=UsuzqMYUMZPXXjHlgTYkNyhICGhPkIZDvlv7LA/0wuI+uEJoYIpfL/pYuzgQvC2fWwqiBdKryb49SIeY0fDblVOUTez7avLqIWz+MFk5QdSyiM/U5LlqbemWWwKw61SuB4i2QPeGwE5VciC9kGuLBvxNQB4PrXG2m9S6GHJEnJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735008927; c=relaxed/simple;
	bh=lUuPXNqB5LK70MzR80ccV+qz9BBjjjm1uInBnz5ACo4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mlCYjrws9Y/Sz64bH0hudA9I0gKb8fhWRhAJwjXE+ZG/aE4TQHHlUvgRasrsDLzomr9Ixa6md/g1V347ak+8iHwy/KWKOXNfFvOG3leI8I1pzwIiV6JfH35/eYRZmKHUkifT4pqhwyuekPo65NtxuOYOE+4SUnPgXcFpIwzDZwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OA+chLIr; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh6xFXN9DMtGP2/oD8RMWKB7nocrSHXQU/d5boMeJWSiMOoRzpCOxebaWC4I2n7CDEbOiFS2UIBG1jAkPYQ1PfszAwUbD0bd+VqlfsxjUQE0MYArPzPrCLw1uqWN+zgtYAVXOGu2g0ZkKF01Ze/1klOOs9L2dYr8EfFTYZl1IzlS3ATWuAwZAMO57ITPZd69J1BIWYxYm2gwBE2XI+OY9Oxf2pvQgKAFJEzBcMJkX8qXRyzfzxVO1fyoEPFAfbMwm6un9gVr+THYHrMulu1x2sWObKXVxPH+5JyBOl7g3djrvQ4m/+52rY04GcN5QvALz6KKz4SFaW8PFguwCiYx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44OFw4mUtAsMEmO3ODhizwkKIvUhW1eXHJAyXV43h0c=;
 b=DJy+chMJrB8m9GmOLHL8FP27U2lVFltJFh8uH6K/6MAUv3KWosC6e/jKIIzyrsWGpItbeAM4h++Y7S6vzwEoSfqP/bqtLfHby28rDxPBwON/1SsWairandEgKYkbZwWjSOjmEDkRhW3E6aadUiZPJlxj9WNBQr6cMh/IhT8wffpXAz5Rxd7Lppfi/wCBvrTnxxXHOpCDv/t40Ih2fmbiufiIPy71qfaR9qfRQY6Sf4eg1zMKHAnxwzqbbbwOxony2j908+sv8DbXeGvXi89hwO6OOWVjs3wWrIXJNWB4/7nXlrSQBMBOjQYRlASnoyddzmhOjjQuGjALDcfK0FraAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44OFw4mUtAsMEmO3ODhizwkKIvUhW1eXHJAyXV43h0c=;
 b=OA+chLIrVx9ha9scnXtVejBx+PCEIBQ8ADSwAMcqck36RRayq0AgWBaavYPPmZY1WMH21cFA4fPom9fbI+ELfA01Nx7iK02SL442KpQ6XX0i+5o90/KZBCago+A8Y/Qkyayb0sToeLIH5fDjfsaY89KbNj0eei058j6Xkm4JPwp/KKeMm1J+UshXsDb9nCosA6511LSEY8zWPBPjGz3ApMdiqcof1t7ZTh4GX9CgdfJGNLYQHc6QN5YbQFoVv/xV7w3hGA82VtpYg7mez0iwXrWtntlPafS2jkIA8K0bQueDNioARaCThADXs1CYY7mhUgtnDr/jmzrEx2SO9nblCw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AS4PR04MB9690.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 02:55:18 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:55:18 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v6] i2c: imx: support DMA defer probing
Thread-Index: AQHbVa9DNCg8MK0CFkatqoCL+ZPXwQ==
Date: Tue, 24 Dec 2024 02:55:18 +0000
Message-ID:
 <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241223034416.544022-1-carlos.song@nxp.com>
 <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
In-Reply-To: <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AS4PR04MB9690:EE_
x-ms-office365-filtering-correlation-id: 4e524ad8-5c25-496d-8585-08dd23c66666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VUzLBC0sT1jSAHyQwZdQCtF7TyKzoIwE9o6bzpSUD/4TZRdiOw8Xkx7pYPY3?=
 =?us-ascii?Q?BzfxtPoKgweFCODDreHmgSqYNvl4eiObU/a+Oc9R8y3vxzvW5X2jTJBM1Lcf?=
 =?us-ascii?Q?i2yXfu89rSBUD9PX60gtUp9OEyHElf8gbOJg+r2/m8ObrG3gjtmABajXr0sM?=
 =?us-ascii?Q?52DsaCwBdXpApSTQwvn2iN1al7zIimMaW856jJlEY1QiElrzAOjC6VtL7V8o?=
 =?us-ascii?Q?vw+//SUf9qBgSyJjc/pvtcrWCZgVhH9Q7Tl7i8qTCdvoyHFnA0kgxWcN2FCs?=
 =?us-ascii?Q?i+O2BSxxdKw4BaYqt5N/QhduGwbs3TdtgVSb08ZX4H48+rsW0rgHD9TgR4dW?=
 =?us-ascii?Q?p3IFarQz3nIeEpV8jjENMM/kqX3WzQ6HDsXDuL2a2YQ4ulNH2guF48raUzrz?=
 =?us-ascii?Q?DnpiQv9e7BCRY5fDizTqChieCUV93W+Wui8RpiASxO/6TVecqgguRfx4yra0?=
 =?us-ascii?Q?cm1IwppaFukhnZ6x735siEruvAaG2Xvo1cXp1WbDykkvLabGInghlUez0Mp5?=
 =?us-ascii?Q?YvpMkzWlDptS/NhQuwhFqONYfj87CjWnZfuNkS5jHWHbsQ6LWYx1cSp2cj6b?=
 =?us-ascii?Q?K91IlyhB9jpmcX+qLGOyjNAmUQBp24NXsSbVwN3wVfyXehM2NFhmMKxWlFKI?=
 =?us-ascii?Q?884A166bzNa9jCLz/TDziKiB7/8ym6LDNdTBxwpSOeeOtOH7fN1KxUrpSSaI?=
 =?us-ascii?Q?18qFodoxGdWH5cacmJKRoOIKeWrWxjwusoT7kQEGrqS2MKAo2SFWWWG37Rn1?=
 =?us-ascii?Q?DqUVwbykI71+qS9HhQLML01AvmINdG3hN+e6c82jTfzTcKfmhOsLrq+c0u7B?=
 =?us-ascii?Q?eumRGTLA42grtEu2wx9Ft9WX+q97f3j4nbpcaj0CgeWW3cgFQST2Ip2CDYBD?=
 =?us-ascii?Q?58iKpNY42rzapgcvogib+TZSOg35SslymNIx+8pVq6nwBm/SGatdvXNH9fOd?=
 =?us-ascii?Q?eY53yPMGIuUABAhM7WuPa020jTHt23f/X8W7tlmdRjCYPjoBJedxWFZHOd2x?=
 =?us-ascii?Q?Lnzqfe5dmVGiMtLFPa5jft8Ac/D6cS3Xu+wea/bvBElsyjg/mzT4xvW1y5Bs?=
 =?us-ascii?Q?1Mh9qhpOHCZVXH0nAApdrqNPKVMItZV2w8Wt4no1atFUbYyFo+nv5vLAJ0MA?=
 =?us-ascii?Q?CHVUwpcyURMhjPTZ1BPUVktOY3doMnAhMUrlZSmPiKWJr8zNLDCnNH1THAmQ?=
 =?us-ascii?Q?l2/WY+so6OH3014+EIMkn+OUhzKJv8Jj+uGaliU+vvVDXJqLzuXezHzWpIP2?=
 =?us-ascii?Q?pjoWtQptqsy963fjt7+nHYrp/4qrX5dBOBKI2lRvaUCzt8t1twmVCxUDu2h1?=
 =?us-ascii?Q?iK4mDZqndZuFsR8lZEA7LpNzAXV66KUlq5zqG8Pu3SPX5PVXdavjxtXHwXZQ?=
 =?us-ascii?Q?h5BDTsFt6OKvP7QU5lNqFO2tv5ckL8itQB4NvRJphFn+dz8CymjenUnSh/my?=
 =?us-ascii?Q?fBStq+FvglVI4T1gUqRCoOj1yeKUM2DI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2gQ2oMI6GKyLelvL/JKq+FiOFNGEkPVyNxKd/FgFfPMCJcXomxbXDyVaSL+c?=
 =?us-ascii?Q?7cokMK7Ywi7Astx6GkPu+kdI2fiL+O+tIE+ylWmEFxwuJqMH/ppL00FyWCVO?=
 =?us-ascii?Q?oOOR8HkhR7ku9DdUl3XxeKkdroE//2Eyd6M0upAL/5XO05v9CLKHb0JguXHD?=
 =?us-ascii?Q?Vclbyaql18I0eyTdcciRyjDXKp479ipRPuEm6vr2Ra0vA0mUtuqbEnooRm88?=
 =?us-ascii?Q?PdyUmc9+CPhE5zJ/Fb6G1RjSGagIa77TeMLldW9YUdKcyeN56/E/wB3qKXK9?=
 =?us-ascii?Q?+xfnLwjz/8HjzOoInoLOBNZ53zqkAhzbiHCghQtqxKJ/bpAi5Md9ASbYwQb7?=
 =?us-ascii?Q?nYQAFIFrsSOAwH4GDh/4X38+pxG6X1emR9B5YpLkGLRjb5+Ft7wLa1AJmjSL?=
 =?us-ascii?Q?eA46paOvnh/cvlsnKQ3hGsP2boefHetoykA9Bb+hv7HfxdhmA60i5TXFXT8p?=
 =?us-ascii?Q?v6G7NONZvASlHIEoKnS1nmujJOpxAjxUJ3A9uZCxJeWmPIgzyIZApfXeVd98?=
 =?us-ascii?Q?YnzZolsRwYC23hhyccCN5O0AnCiD/nzHWg7ciVeLWK47acjOffnJjDHN0XoD?=
 =?us-ascii?Q?c3OPA0vWUpdfXpZ+RhxZ3Z7jRQtDCTNyxXB2Zh/xFwm0kE6eUEluHdjm3sCP?=
 =?us-ascii?Q?tDN6O+mIOGMNB3AEiG14EEUfBxkdAaF6pUB8SLZ/UutWg6YnzR7oAAQhdLXl?=
 =?us-ascii?Q?G55A7KgGPnVNgxS5hzUDB9lIoFjBPowptbbNhjhYL9y9sBkupYqZSfwmm2FH?=
 =?us-ascii?Q?BMjTcIyMJ8IdH50jSB2RhJ55kwPia2fXs7LK4OdsJJrrdyb1RshCRRemZBse?=
 =?us-ascii?Q?zJiKjQsYmNY6ZAAKrXwJsocA5kz5UtnsYhfB4lYdA/WOAWO/pULfiIKcelFs?=
 =?us-ascii?Q?lN31sgxJ12Gy6TqtPvkfRVt/9k59wpE424wgw3u0qKM/jRJYf7fuLvTtdqW4?=
 =?us-ascii?Q?/gR45qkSrFgsMC4r6/fDg4p/Mgt5T2qHvtWHZ3Z9Qc7InLJMdCFvITa5f2mg?=
 =?us-ascii?Q?7bFkLMCSwSnDOXS6A2smB2VNr2F7JRLYgcqJLuyAo3MibtMnfC+VcuGpW+Ih?=
 =?us-ascii?Q?pCIWOBGVkyKwYIP3m2Pvd09ljmwWyCpMoBlg91t5NTAaTMVgKECsYFRBo89m?=
 =?us-ascii?Q?NoibOsqz2LSGEpTs5xKEWcCykFOW5efBETgfV/lnwDMB9PwrokyGoQGUSTBJ?=
 =?us-ascii?Q?PInRh7L30mwybvfmPCkv2og98m0SAaOfUL6X2v2/wLXUEFbMo8kvEqYFYpmi?=
 =?us-ascii?Q?4blmsrAQpmVRNkC7DLF9QW7HDNkA+Hwn8Xo8t9NI+B7q42xuCXSe4Fz7Je1B?=
 =?us-ascii?Q?Qc61pF+cRIqjvT4qNGms8rPYBIdhPVPkV/sgFN3FNxM+TcLH6GEIc4xfxHAq?=
 =?us-ascii?Q?TCokq4fEU0ZhWw0jCSW7OGPB7GmGD8HpvsA8kWrJi8jPW0OjcUhSJzt6mxbT?=
 =?us-ascii?Q?kfm00GYnL8/1AQE/VPGz6Ds2i1zkZDuoblx+SHFB/sXcUvTTdebFSv2lt/Cy?=
 =?us-ascii?Q?f4UFt+2cJZ0dUwJXtdprpWPtG/wj3SfQvzxE74r8YX/IGAGI334Nw0F4fTrE?=
 =?us-ascii?Q?Gr1UqDRzLfKUA/vtbP6slfttJTJuMOE9kETSP9Yr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e524ad8-5c25-496d-8585-08dd23c66666
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 02:55:18.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: It+6UJES3NfGxON0AZsPvbKXxTCylaGXFdL0k2Bj82KmBhuWQFYpmG/wrdSsvQZSeP1eHTLNWzQCUWdRsqJnJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9690



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, December 24, 2024 7:14 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: o.rempel@pengutronix.de; kernel@pengutronix.de; shawnguo@kernel.org;
> s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>; Ahmad
> Fatoum <a.fatoum@pengutronix.de>
> Subject: [EXT] Re: [PATCH v6] i2c: imx: support DMA defer probing
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
> ...
>=20
> > @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
> >       if (ret =3D=3D -EPROBE_DEFER)
> >               goto clk_notifier_unregister;
> >
> > +     /* As we can always fall back to PIO, let's ignore the error sett=
ing up
> DMA. */
> > +     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > +     if (ret) {
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     goto clk_notifier_unregister;
> > +             else if (ret =3D=3D -ENODEV)
> > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > +             else
> > +                     dev_err(&pdev->dev, "Failed to setup DMA (%pe),
> only use PIO mode\n",
> > +                             ERR_PTR(ret));
>=20
> My question here is not just about the use of dev_err vs dev_err_probe, b=
ut why
> don't we exit the probe if we get an error.
>=20
> We should use PIO only in case of ENODEV, in all the other cases I think =
we
> should just leave. E.g. why don't we exit if we meet ret =3D=3D -ENOMEM?

Hi, Andi

Thank you! From my point, I2C is critical bus so it should be available as =
much as possible.
-ENOMEM or other unknown errors all are from i2c_imx_dma_request(). So erro=
r happened in enable DMA mode process.

As I comment at previous mail[1]:
DMA mode should be optional for i2c-imx[2], i2c-imx can accept DMA mode not=
 enabled.
Even though DMA mode can not be enabled by some known/unknown issue, I2C st=
ill can work in PIO mode in all time for all cases.
As a result, don't exit the I2C probe and only print error to show i2c DMA =
error.

This patch just is used to make i2c-imx can support defer probe to use DMA =
resources as much as possible.

If meet a DMA error then exit i2c probe, which means binding I2C to DMA, th=
is is not what we expect. Once the DMA encounters a problem,
the entire I2C bus and peripherals will not be able to start, this is not a=
 small damage, so we use current logic.

[1]: https://lore.kernel.org/imx/AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@A=
M0PR0402MB3937.eurprd04.prod.outlook.com/
[2]:
commit ce1a78840ff7ab846065d5b65eaac959bafe1949
Author: Yao Yuan <yao.yuan@freescale.com>
Date:   Tue Nov 18 18:31:06 2014 +0800

    i2c: imx: add DMA support for freescale i2c driver

    Add dma support for i2c. This function depend on DMA driver.
    You can turn on it by write both the dmas and dma-name properties in dt=
s node.
    DMA is optional, even DMA request unsuccessfully, i2c can also work wel=
l.

    Signed-off-by: Yuan Yao <yao.yuan@freescale.com>
    Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Carlos
>=20
> Andi

