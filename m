Return-Path: <linux-i2c+bounces-11148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43CAC5EE7
	for <lists+linux-i2c@lfdr.de>; Wed, 28 May 2025 03:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 802551BA478B
	for <lists+linux-i2c@lfdr.de>; Wed, 28 May 2025 01:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1461A841F;
	Wed, 28 May 2025 01:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CVvMjFAh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E7148838;
	Wed, 28 May 2025 01:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397059; cv=fail; b=h3BPdWncKSt+f5JSJhnuXH3o7cZb9H8okTuF3Jwt/sAhYbRhWSvDGD9SmHV4jxoLK621fI7NCZrrfZ3faSEWw4hKYEDmqDCUUMzjMlfKHoKi8drXr61WIc2K7aJnngsN40k67XdvRosyqec835wIDHCFSerc0DQ9X+C43UooY1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397059; c=relaxed/simple;
	bh=4UZJhi9j3RBXHt11F+pOsVPPrN416s99JSGJwxAe/mI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eOPMY1phUlS/LoCSTxzSFJmLOwjtiKpUc3VUrSoOZ67tGcubckgETGFhJZjFZPttvsOBTGPG3ne/fQSZKCPWbv7Fj2+l6vMdKGKloaG+UpOUigRzdKYUKyrc2+vxm3IVX+rm5Zgw4CsctNeGDxxTB7hJ26aRhq6wifKoi+zxtlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CVvMjFAh; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIDULv1PlDhE+/YHN4WkSb/b5o1N2JHlDdFyJccR3WZUMFqZ1WEz7GTvxux5DJ19/wkMHOHPU6yiuVjEBYdsOCDAfJVlyugSji2mhNZYpGMFL1W9I8lzb9yBLoOYqDe209hiIyT1jNnysV1qTx/J+TgIyxdE9OJTEQ6NBTahwC67K+qvjRcpA0TLd1jaud5n7CNDM9P5cxqoqZSXAbiesbn/7uNWkb+HlUutJQ3PSeEwIg2sFO+9cID73DNCfI/l5pZ94GaLvVK+AO2C8Oyn1zVc6ZavABJRg0EX81cv0KDrd9qmbCtvGNuzpRUvhJH9eB5ei7MOTasnO8+ag8aOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUPmQLckLD3bKgkRnwdcjXEmylTPnhBf/XgCTqcGmcI=;
 b=EywfDWhuUdmVe/fsJEp/q4Q5ZiMICZjyonug9+eCHJZLl3dKSffH4WH4JPKaiwy6qRmjtSfO+H2fpl/fgeHPOX22CHrC/2GzgeEqgXqreumy0vPTEMOHnGBJK7gcKTyDXeFw/lOfRN0gPhAH3zXca/H29Jjf8ENfnNaxTthZd5jsUKdDpkNo/J+Mztdyb0EHqDNFWX9uj7YJ1BwLqgNsYLz/iAggun1ZZcOhbVVedCbvAHPAMdIms/+HizYrNlAbmdCzFVIMwmlUmSZpORBdlh38eEdMgXobwlhKhQI6n72qvkFNFldO2Tw1rhG8kANyV6Co8DPLCfXvaLBf91REJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUPmQLckLD3bKgkRnwdcjXEmylTPnhBf/XgCTqcGmcI=;
 b=CVvMjFAhRNRK/tuPGCicKXUnC0+eyfwVM83IS2kywAdsZW93vyQaoikMC4KU3HgAIKNDQFQBnxA5UIg7iAwaOFyDNSkfuPLP51xwOoQYiQH7AzP991qRzPECoXbeHGqUTh7m74st9xFt4j7yc8qXnWoi08WC3kgN1TlEvIBvC+f6L2H4Kls2T8iZfp0tEnzKNf3xBogOovrW8gTNCPEgCf/1qouyn7mIpRC6ubUSK/pKKs+UbfQJQ+Qe+PkugiUo/CBiMpkgKD6ncjQU7qTCt8PWOnsXMr2hacU5dcKPTBpxMiXCtL/F/TDT6nTImMcrWO2kOTZiggJGPFlfA1iF/g==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GV2PR04MB11240.eurprd04.prod.outlook.com
 (2603:10a6:150:27b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 01:50:52 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 01:50:51 +0000
From: Carlos Song <carlos.song@nxp.com>
To: KUCHARCZYK Lukasz <lukasz.kucharczyk@leica-geosystems.com>, Oleksij Rempel
	<o.rempel@pengutronix.de>, "stefan.eichenberger@toradex.com"
	<stefan.eichenberger@toradex.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>, "open
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>,
	"customers.leicageo@pengutronix.de" <customers.leicageo@pengutronix.de>
Subject: RE: [PATCH] i2c: imx: fix emulated smbus block read
Thread-Topic: [PATCH] i2c: imx: fix emulated smbus block read
Thread-Index: AQHbz3LwOG6Zi4G6CE6xFwOmWKlW/g==
Date: Wed, 28 May 2025 01:50:51 +0000
Message-ID:
 <VI2PR04MB11147341238F4D0531E1E6102E867A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
 <VI2PR04MB11147245BA69A4C19B0DD037EE864A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <VI1PR06MB8616FBEE8A355BF5A314D504D864A@VI1PR06MB8616.eurprd06.prod.outlook.com>
In-Reply-To:
 <VI1PR06MB8616FBEE8A355BF5A314D504D864A@VI1PR06MB8616.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|GV2PR04MB11240:EE_
x-ms-office365-filtering-correlation-id: 54786da8-a9df-41db-4157-08dd9d8a1374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QPHnstJNM6SqF34YDt0mYWM19m4r42ti6CMp2Nti8qZxeBbZiWAFQZoPeyvk?=
 =?us-ascii?Q?+/WQv4G4P9QIfVhmmdAgmzAFD9WRPUe7qF1Ftr0/c201b8dviTu4lDBNjAyM?=
 =?us-ascii?Q?F4HW7HAGZD9KUyOiDvWYud/GKJq+TC62cHprFnqHuaD7BHQsnXRFAsSkEblH?=
 =?us-ascii?Q?bHX5lQKbcixuVAu8AFbP2pwB2s2immFVxWdLaGogsS7lbayPkP3ZHYCM+6Ed?=
 =?us-ascii?Q?Tvx5/y58FgHDOWi5FH9iTb9iMV2Aw7btZD0hyedpfDMQc7iBvVrsW2AChP26?=
 =?us-ascii?Q?yLWBMoC0748Rnu6qlW9ePeiZ4rtNRdgs6TcjZ3LRgoOrPDksv9R0fJCikZkt?=
 =?us-ascii?Q?U3bzGob9a4yy3SfsKYzWWgfzd9Uk3qzy14LsRfYC9xz/RYZFKmdHRVatBwEV?=
 =?us-ascii?Q?awS9X7nBAmYNZE9JKFQo3d9YF1Op9MoWbqtU4HMDkHQOShkzWzzUeEtQYEK9?=
 =?us-ascii?Q?WIVZ2tGG5qd2Cxh56V1Kr4bbYmhwx4n+4sjCSf+bT9fTzVKdL6BkFdug8MkE?=
 =?us-ascii?Q?2Pr422GD1SjaIYbZ/z32frTm0KsY8RP7fPzyK7dzySsdJ4ZCnVNaKjPgZWXi?=
 =?us-ascii?Q?2D7YvUxT6Gg2+YH+II7wqgPXptUcaW4Nt4Iw+H3psi01q6UTl67LJrD3u0Xn?=
 =?us-ascii?Q?tMrZEAVK8tMg7mvdovC35sEZGOCRNTTbx8CxjIkBzC/5u+6RMFFZA1TPcCnm?=
 =?us-ascii?Q?Whinxf68T4yo+6a4ldKdnMbrsbkBedOOdeZUKuFrTg+ChOH9HMrd91+atBLR?=
 =?us-ascii?Q?6pUtqPMqOZAlcEmvKI4YPHmKFX8jQ3xHyTJLMf7W/DloORq5FClogB5w6MnU?=
 =?us-ascii?Q?osxk0t+/60gR8giNr6DLTRliE4NC94zyOgRlw7eeJiujN1SyVFxYaUcVWQsW?=
 =?us-ascii?Q?OtR458QJOl8btDtuF1E8Z8o7aD4RR6m1dIpTE20fVeec2D/4YZcTWb0K0wm2?=
 =?us-ascii?Q?/P8JYuX3iFBoloj2bIL0y0J4HKUltbs7tVNIhqqeeo8mrcFniRyXuI5BJJj2?=
 =?us-ascii?Q?zYdwwgK3Ls3Y238r2yEpHr7wZz7Nj3VFQYfbX9vqRO7tAK2vXnU9Y8CaVwWp?=
 =?us-ascii?Q?sn6eUjRhuL1xKGnkeUsYilZsUKPF03FpUxXe4awDLrwFoZXsUrcrxliELZTK?=
 =?us-ascii?Q?q2R9KHYJYoy5vGs1cpWAWJ6cM3FKzL367aN2l2nIjzMK8v07Z+/dQTvjFk8m?=
 =?us-ascii?Q?PYYRKbkZehNWOsBCOApTRNud8iabkyf+9ItvfcyzpkIvPcw6xRwUiMFjoxA6?=
 =?us-ascii?Q?lXChSUHtQdBJrdCDcWODzZtKSxYpo1MbY6XFA/x5uJX5LIvkEcGBA3hNVely?=
 =?us-ascii?Q?O/igFqmIV989ZGhRIR3YHfh1v90g0AkocXeZm3RtNVbajY9o2ehgd1cuqoaI?=
 =?us-ascii?Q?78UHB2i0zhUMbw7CM9cMXv+ZTxHyjAiAA3xAVrbH1KSkpPkWWbS099ZeY/Rn?=
 =?us-ascii?Q?+CKGdvYsrv1nnSCmQNXbXgE3iBRlJAFPcr1mRsAVP9jHWKdpOyG4qg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ONi71GtnHqfAhu7eoyKZ1nJQnvcnCkbMjZ5rcdx7WjBuTvtdp3RCJ/pQlLOL?=
 =?us-ascii?Q?NteRhK2kRaVNjU1U0k3A6EcAcNvyNR0rUjWnL+xFiDqqYh2tt44ULjxOdCy9?=
 =?us-ascii?Q?mY6I6esrV4AiAQfrBEQB//EWcj+IAUu3UvuPy64bF7fW9i/v7598owfOJLh5?=
 =?us-ascii?Q?NJvnkaF9KLdmalbYJgyRcaXPsJpgpIhX9eOt5TKZ5TWF53DrJDLduS0it/ko?=
 =?us-ascii?Q?b74iNHCI3tBqmNkr6CHzBLBgVM6Bz6XI4JtXws3rEoL2CroqHSSo47cnIB5C?=
 =?us-ascii?Q?F72UYwC3fil8MiCUsAAYJ/yFE4nsyxQ9nYSGVh0yEV/0klmkjadEHdtE/Hwe?=
 =?us-ascii?Q?5M228oFny1gk8uoA0YugFXt79j9q1waVW2fNOTpVSoPKMoeHtrGgaRBFK+jv?=
 =?us-ascii?Q?ZYx2bb58VIB0/1mKiL6wB0ah4sVRLwZjGp4vVWgKnTVHIWFqOM9nPZzGAjer?=
 =?us-ascii?Q?pi4GqPRB5xKJeVHHulfMarAwe9muqScPSYDy2sF20tz7vf3DyuHYwcGgyQUr?=
 =?us-ascii?Q?MJ/2bzx0NOmCapg2ZzGxteKPNzbpnVXGITg3ADG1Zl3Tj1XfdYlO9weBf7iS?=
 =?us-ascii?Q?Lzo7AxdDcVQ3nFcssmVYYWZL+mkb+7nnHe7kVPyaCPRM5/FSiyliCJGmhGQm?=
 =?us-ascii?Q?dBYRkV9NFBpHOWbxcoAI1cW8rplVzJL3sok8MeQ/nRnYxf0quU3Fe2+8zI4n?=
 =?us-ascii?Q?x6MIaa1jrMg/i4wR71+IFUyfJ5llaB2hOEj3FrSpNb8vnUfuX6b4EBaCeC1K?=
 =?us-ascii?Q?zguskrLXp+k6uYKkU2RBbhYQIvITzaZxovcsY/f+bYF8/Dt2RGtrvq4Hd4D5?=
 =?us-ascii?Q?y8jHSQlbdqOtyq/VoU0t8y0wLs94ahg+T/7eRywpMXBzHcGtX5phTPwR8O65?=
 =?us-ascii?Q?zRfx+qIk6GK3Nt3AhdAQyM1AELQrJnWQ4El7tRiJfeGcligbX2fZlbF0azJT?=
 =?us-ascii?Q?DkhzYJXz0RgmMkCuAG0je09vPztzIYQLlBl7jVCjYds/dINrxY6qkueLaLnZ?=
 =?us-ascii?Q?fKYYIcEfrcMy70BlerG3OE8d/4/3Bz1jXhFHU2wQu6HkxgYw1qKkvBglJZw/?=
 =?us-ascii?Q?kvx003F1Vw2YLkO636W5JiCG3auS+UoN7rTlsB5zrw7ShLOR35XBfWHgL61x?=
 =?us-ascii?Q?AaYiTu5lzn5ApM6+WywBnaR7TBqk4nzRXzXnEf0lz2UGRUzpeeVArYlsZY6b?=
 =?us-ascii?Q?9lTeGkvXnXgi+JBQMFJ+UT4kIjr1tJ00DDfN6NtRos3a7NX0kIvavi0QWd/F?=
 =?us-ascii?Q?6/9m303WMbGMXDQVTg3SNUSAk+4FeLdS2TuzC+mHPr1uf0y5XYHxTLBIdlAy?=
 =?us-ascii?Q?RD1qWo9VuuzdQ0d3ovYl6sY2gHb34yksZi2FCWw+CllQ8rPGriFiHDwhktdw?=
 =?us-ascii?Q?utVCESl77lr70SAf824Pm9vgAsCKMQH5ovfjLsvWYlYJtEB2Zg9xa3XZoxFG?=
 =?us-ascii?Q?JoyDoN0g7xHfleKUexO5v/uJvzs00lDvTKGJiq3AAQJ1zgSxd6bXuLYzh20Y?=
 =?us-ascii?Q?hEW1kL/APIr5wuXAMG/bMxCVHW39Kz4D3uIif0/T5fMfltWzkxcNXRKSILnm?=
 =?us-ascii?Q?vAGjjLytZpH/IEVtihQCIaaTy1pr+bNUV+3M4IIa?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54786da8-a9df-41db-4157-08dd9d8a1374
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 01:50:51.3365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLCH1xohZW9hiQcTQAIB8SNB8omb1KIsWW5/xkdhoKp24n+tubbFybBbZBOAdZSwHGAST8YE9AqcomUbcadtlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11240



> -----Original Message-----
> From: KUCHARCZYK Lukasz <lukasz.kucharczyk@leica-geosystems.com>
> Sent: Tuesday, May 27, 2025 8:03 PM
> To: Carlos Song <carlos.song@nxp.com>; Oleksij Rempel
> <o.rempel@pengutronix.de>; stefan.eichenberger@toradex.com; Pengutronix
> Kernel Team <kernel@pengutronix.de>; Andi Shyti <andi.shyti@kernel.org>;
> Shawn Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Fabio Estevam <festevam@gmail.com>
> Cc: open list:FREESCALE IMX I2C DRIVER <linux-i2c@vger.kernel.org>; open
> list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE <imx@lists.linux.dev>;
> moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> <linux-arm-kernel@lists.infradead.org>; open list
> <linux-kernel@vger.kernel.org>; GEO-CHHER-bsp-development
> <bsp-development.geo@leica-geosystems.com>;
> customers.leicageo@pengutronix.de
> Subject: [EXT] RE: [PATCH] i2c: imx: fix emulated smbus block read
>=20
> [You don't often get email from lukasz.kucharczyk@leica-geosystems.com.
> Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> > -----Original Message-----
> > From: Carlos Song <carlos.song@nxp.com>
> > Sent: 27 May 2025 12:46
> > Subject: RE: [PATCH] i2c: imx: fix emulated smbus block read
> >
> > I2C SMBUS block read need first read one byte from data length offset
> > then I2C will know how many bytes need to continue read. For this
> > issue you can meet " Error: Read failed " when using i2cget -f -y bus a=
ddress
> offset s to test.
> >
> > So you apply this change to make i2c-imx controller can behavior like t=
his:
> >
> > S Addr Wr [A] Comm [A] Sr Addr Rd [A] [Count] A [Data] A [Data] A ...
> > A [Data] NA P
> >
> > Do I understand this right?
>=20
> hi Carlos; thanks for the message! Yes, exactly, that's correct.
>=20
> I run into this issue while trying to integrate a smart battery into a IM=
X8-based
> system. Fetching of properties that rely on data block read operation (i.=
e.,
> ManufacturerName, DeviceName,  DeviceChemistry and
> ManufacturerData) was failing.
>=20
> With the fix the block read looks just like you described.
>=20
>=20
> Without the fix, the transaction on the bus looked somehow like:
> S Addr Wr [A] Comm [A] Sr Addr Rd [A] [Count] NA [0xff] NA [0xff] NA ... =
[0xff]
> NA P
>=20
> (i.e., the Count is not acknowledged and SDA remains high afterwards).
>=20

Good, thank you for your work!
Reviewed-by: Carlos Song <carlos.song@nxp.com>

> Lukasz


