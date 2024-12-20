Return-Path: <linux-i2c+bounces-8653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB289F8D5F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 08:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AE697A0502
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 07:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D6D1304B0;
	Fri, 20 Dec 2024 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IprOmQQN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7721194A60;
	Fri, 20 Dec 2024 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734680333; cv=fail; b=ZO/wTvyrHse7OoZoMa/NhwKJfwWNls4b8oOFtbC2E1/eeYsp+oVAgKKrfZQYwKFz1qYgasd6KZENjEPgFceXh5ivF3It7RFOP1l4UqSMu3r1jb6QbyfMUzNEa5ySB10pkP2VfG3m+jjYeiKPU2tExnE2Bxw8sumAKxFvWk/UWV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734680333; c=relaxed/simple;
	bh=AM8SkBiFZMWIV4dCzVgW9kaBI9WiiK3v+A5yqk6X6g0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FGn26hOAIKJJ51SAvTt6OxH6XQAaA7EfBYAmo3rOFMwlHbZ5f4eiQJUeAkiFoZXdJ8sNV4gUk1DoYBM7hOu2i5W7EsyS3TZKUnbflivM8DzRZyucYWccp+FDPDmX+6kieA8Op0ufq/C7c/AYks0CEvY1XcbS13mL3cI0WXtO3f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IprOmQQN; arc=fail smtp.client-ip=40.107.21.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6FCTOBDbx1SdIOT1bjCFt0Nvul1V/Dd5ejqYcXw5vB/VKmEODyV1BuD0v369/EWSpSLbPSCoGCmhamxRTrvEBkglvlYHebqionDEE+YP4hK5hlAWfRGnuNYhCXbNaDGYoyQNZcSPaV5AHlkBJxFxG9lavyeBJ4FAKooTgpYg1BmbluzoK65d42lJJw5NAe4TZ7T4Bx0C1GLzpDJzQE8T+VF95mUUxOgGLY39aBKWsjC4zPM2lWEe6PK1Ng+wKp9V4R/HInwfZqZGVj4qpCIXV0X10DjfZKS4Xv8Sf0jcJi/1H5K26MH4zE6hAPqXiFteYZ/e4TFksxWypOlHCA2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0iGAyyy7c1lDb/OdHI9TPXdZZgQTRBtcu8ExSvZdzM=;
 b=WbrDYpBN/Z7OLl60+HNggeKxiyDWfLCyDjb79qajsfFCMEt5YNfIroK6p7o2Nughq8B6uM8CWxXtAsGtTaTVIbieB7lYa9/BSlpZO7KIbnQMUymKdoBe8m2rRW7RfJSuF9rpavJNTI9P3glNoG3y+mC9nFD1emob9QpZAPSGhmPsmuL31MAhbK9+DFJVicIPVB57jDyEOLPauI+Gv0hY/2e0UhrC3fdvE33OE/1n44dtHCQjgiDzuLQ6OcwY4SNApmNijNAe3l1aqQ98O7q34qL8ojNOaBVqZ50LrsbdAq8dS+UlQmqEeBv9pSpD+1B9XZyB4+pBd97DGwrx9x4e/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0iGAyyy7c1lDb/OdHI9TPXdZZgQTRBtcu8ExSvZdzM=;
 b=IprOmQQNllq2SM21Lla6M2IOqumFlE6p6A/+wFFwjTbUUsWin1RgqbgvDW9LLjc1HO/XMIaenhXcKwK1noMvx4ZuDxjEm+mqp55TzfP6CuEZL3reOXZprB8FmUrc0e+1Uw3GoMW0z/M2MHjZ30f78US8WVPPDVAo+dKym7AsvnTVbmlvRaAveongKyUQnFCqrz6rQI6ObloZ1Y68fGY2VNfRRZa+uj3oPZIcO/ex0TVtSrreqM0UiwNYRgYBLf37Grx12GPEj6k8/oSmSo19zQFMpU9AImKYi7vVF8COomtESLwbeIzVF1GmRCKkdxnV7ixXQavK/YRa15y8U67K2g==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI0PR04MB10173.eurprd04.prod.outlook.com (2603:10a6:800:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 07:38:47 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 07:38:47 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Ahmad Fatoum
	<a.fatoum@pengutronix.de>
CC: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Index: AQHbUrI0CD0DDTa+eEulKJcBjVXzGg==
Date: Fri, 20 Dec 2024 07:38:47 +0000
Message-ID:
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
In-Reply-To: <Z2UeKZcpeRUt2OQ4@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|VI0PR04MB10173:EE_
x-ms-office365-filtering-correlation-id: 281989aa-5f55-4b62-fd5a-08dd20c9570e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QmLQtvA0HZ39D02TqtbXGQp7Sv7BLBLX1bGUOzdT4brLxdLzWsvvm1AdyKN0?=
 =?us-ascii?Q?VixXeMf7J2E/pJyjr3BFkFNK0A3Kpr7Gz6OqvDbskVAlFlwn3Lv1LIg9kpnx?=
 =?us-ascii?Q?JPT3L62KeZ0KGoKzFybDkMW1qOZ7y31WHI1PpWFd2S9PfGs+GxxEHpe6wg6a?=
 =?us-ascii?Q?zVNY1dqHJO6xcfw4g9TXDVzti61vV9M6u8GtPSCdBQ8p4oUmyxVRedMi4D7Z?=
 =?us-ascii?Q?4AipL6J62ithlp4UVUU4pU05/NDY+IN1giIKUivRH5qXnZfuCUf7Sr5cUGyc?=
 =?us-ascii?Q?2A3UEO0zYlP8jnjVvgXvZE9DHEzJL/UOwYtDcsG1eEOZFFxJmtWjIUo4oggN?=
 =?us-ascii?Q?liGEsbTOizzOuAXSP/olO7EqT/+LsqCc8BiR6nZMpakjdRAlctJtKCx1xqrY?=
 =?us-ascii?Q?Yos3JzIlRFbZw+vp/qHzpKheWubUgOu9Xgf8FTnp0UROSr4uEs++wXGgVOvt?=
 =?us-ascii?Q?8WBkDDMRyXhT131PdSfilkyiulF7ZiGRnBpcKw91twz5e7IrpiW5GxpiiVM0?=
 =?us-ascii?Q?6c/oqmngXtkDkWrXIxLh+B733Sj1A8x8RgW7pNfyj92cSEwb+rw5DBNfgSLt?=
 =?us-ascii?Q?Dx63YVbhlemGN7RZaRaxwXBmd/Aqh+jJEjznOjM2vMSOScvToCrP+vAtU0/Y?=
 =?us-ascii?Q?o7Ft77M25fYl6uaLWHVGOFAHFhoG8FYav7BsJSEL2owxamrujt94eVk3UHHb?=
 =?us-ascii?Q?8pNntzFt5zcnTq2TopdxopzTfoMslpDR6iCpcb2Y3icluMF9FXIdoDcJyBhq?=
 =?us-ascii?Q?53D0Wj/jrDJ7TAYvNFZfbKyGsRRHJGlcIToDA9Ozyfzaomkx3TIZFXzuO4fG?=
 =?us-ascii?Q?medo8Di2PegUQv41ROjEIlDcFSGDAff4ggVX0oobi+HVHg/DDIXCQNLQXvUT?=
 =?us-ascii?Q?VgG1EeRBOyzwk8vEGTKvfani/M+pZt648OZ9c5D0K6OWE1hVoqO3ia9QGm4b?=
 =?us-ascii?Q?rorx02UK9+mJSI68VY2U4hXIacXR+IeabHnGpWKinX54gBVvUTVkrgr3PRm2?=
 =?us-ascii?Q?52iiYp2yLRBSWXMfiMzCn0NF3lyWTZ4o85FroCH+CEwuhw8BTXudedpVFpbJ?=
 =?us-ascii?Q?uZTJ/zSvhmtnRzLZPSckZH9Vi/z06/d52flk7tiKSIh3etopMgjRt4oTEwAL?=
 =?us-ascii?Q?NLP6XUtC92XKV9Q3TmhxuQ2K9TkMj4AsxPPrdojTEPcnza6inmSNbOD1SQPJ?=
 =?us-ascii?Q?iyynLzGYlHfvk+qJ9QBORLBdOwDi5DUQ+JgOE7w5kEQn6RjzNn79R+YFcGhA?=
 =?us-ascii?Q?Vf0GnabX5egHQ85SKnpYoMAACIaouNy6TA832qpOONX6g/NEJftVBlMkE3Zo?=
 =?us-ascii?Q?tSUYk+iAaEGvlQRyndrfPsa0qkQVD5fMCgvIqb+MghltToFigsucFgkkYzUz?=
 =?us-ascii?Q?UKyALxKllAZXDMNL2PKn0VSB4fPK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qljKm2QLmQOuEdO3BQr6vIcZzJf5cCwL1hN9Q+ED1qUlfi/nltXosI1YGtiH?=
 =?us-ascii?Q?9KccnVpSw2se4DohjPhVXUZzP4wjGPDo5X9T9dJfOaMtSh8gK3Zotz8D0MnN?=
 =?us-ascii?Q?5f5dPA6SvOkDzJRzK/+s5e7Zx+TvbxOn6dBOGFuBwpMqDWfCinO+lD0D/CbV?=
 =?us-ascii?Q?E4RT6wXj+M+BnfD85kYB9zWyQOGkVmd2UMaYXeEtCOE+IytcjtW6DY2kR27H?=
 =?us-ascii?Q?sVJrtVp8aNamMbH/NWLX2G4kNQs1Ysf2tNu5ZyWomQguksMa3L7gNPiTVoH7?=
 =?us-ascii?Q?tgwvNIbXZvvoYCbZnoqaSI9wV5p6D3hD6poNhlIZLCCQlK2TTHZhL13HszdB?=
 =?us-ascii?Q?s5bTS3Y4XLh5LVJaJoF+8NF681uH6POPYJPVzIGtmkNXeYZF0dCSNoTZHNgt?=
 =?us-ascii?Q?NJGXkpUSLM/cZ92y/FdSWsUb5HPEkoVC0ErLwWc3SWeKTO6LeS879vblK6No?=
 =?us-ascii?Q?iF8R7YhoiNRmXD25ob1uQlMKFy0afdN3vR3t2XfPB2UTQBqrnDwDmYgF7ub8?=
 =?us-ascii?Q?+6nO2MrnZE0qZZ75KW8xRzN7rqD1SOyfx7NP669rDDYbfw7jLQ8kSCF0JUC6?=
 =?us-ascii?Q?dXMtYV5+gS1LmVqe5wx83pL7KrVQS08b0cDtjxE6jtyi3hKqanVj+vQMsReh?=
 =?us-ascii?Q?DY2tAb88wOOmumWd6sXj13t6ZhzY3qA4BK3sjX7H1M5ib13VvMj+iJpQy1NP?=
 =?us-ascii?Q?NFzuIJisbpjtDosDK6UsXAeCDVCzpZmkDieyveJxuqKg0YfiTKxNUUa7Io7I?=
 =?us-ascii?Q?LkGjxsUKPJXNH9lr07uB3PPES/NgmlnMLjMwIxJt7O3PzPSaNZlaAtI4mp2b?=
 =?us-ascii?Q?r8eDi853gqthZIbHooYz4Je9ytMVPPvZJDx52aqg+X+x0oEHDHR0mzxh31Di?=
 =?us-ascii?Q?9+UMzyw4hXQxEBCf+yjV+fcne4y0Uk3tv8UrVC0LNlNC5Z7lCeYB8RLwu+LN?=
 =?us-ascii?Q?9aStM3TliNYagzxONjAGyfjcpnXz0EGq1Cmnc8305Gs+qiKOL6Z8iaZqw/O7?=
 =?us-ascii?Q?1yfOGcrJyzRFKgSNGAbXPHE/ao2UphD9G3q1FJgWdKIKNU5Kh8dv9Hblwamk?=
 =?us-ascii?Q?hkafJaNivdB3IUI5OrKtcyBvUPESQzhdUzZH/ewKO554BLDNrwlxAaETdLXa?=
 =?us-ascii?Q?WPFWINPGfu35yLpVv8e40D3txDsLzD4K60k+3FvnG2IiA2RJAMA3CdtMvDU6?=
 =?us-ascii?Q?Np6jgqhrYlGQe4plUHxb13iaaSU/fD4MVpjlUjRBk8L57TP3/9+MUp2nWl8x?=
 =?us-ascii?Q?a4XZFMrUrcYffbHzNca58B561pMiTPn2xNsjQWkcwZY97zv1xHAXcw6+aREk?=
 =?us-ascii?Q?75KFCXmLEjLALxMpVD18DVZ7N86S16JY6Rthafk9/t+B6XLonIbXxSVw+k2t?=
 =?us-ascii?Q?QPGFV1EBeRZ+e7ktbqaj7mgXHwzcmHsBggsc/SjmIyWkN9gCkustoc+7zqVT?=
 =?us-ascii?Q?kGJvSPHwAJzTGkNqCWE466gp59hqoyn9rT1MCp8K/TtOiK0/D2PW7FjJtYjS?=
 =?us-ascii?Q?6OdjjCIH08ucZIcFo7pJ+bNbknxrwWkJ3acZG0Fe1gWZ5QxfEKTMDj5uZ2ZQ?=
 =?us-ascii?Q?/uX3IB05E0bGuTgC0KtJuI+lV7yoHq6RdIcWRoLV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 281989aa-5f55-4b62-fd5a-08dd20c9570e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 07:38:47.7395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjcRwHfOuK0Y1olcR6drRZpUPzZA9SibxrYxP2+IEkCz1G4iR2bywvmKHJ23g1n0QWEJcYmJ6Cl0Yb+jADmwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10173



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Friday, December 20, 2024 3:35 PM
> To: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Carlos Song <carlos.song@nxp.com>; Andi Shyti <andi.shyti@kernel.org>=
;
> Frank Li <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>
> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> On Fri, Dec 20, 2024 at 08:06:25AM +0100, Ahmad Fatoum wrote:
> > Hello Carlos,
> >
> > On 20.12.24 07:58, Carlos Song wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Oleksij Rempel <o.rempel@pengutronix.de>
> > >> Sent: Friday, December 20, 2024 2:13 PM
> > >> To: Carlos Song <carlos.song@nxp.com>
> > >> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li
> > >> <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> > >> s.hauer@pengutronix.de; festevam@gmail.com;
> > >> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > >> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > >> Clark Wang <xiaoning.wang@nxp.com>; Ahmad Fatoum
> > >> <a.fatoum@pengutronix.de>
> > >> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> > >>
> > >> Caution: This is an external email. Please take care when clicking
> > >> links or opening attachments. When in doubt, report the message
> > >> using the 'Report this email' button
> > >>
> > >>
> > >> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
> > >>>>> So we make this logic. Anyway we let the I2C controller
> > >>>>> registered whether
> > >>>> DMA is available or not(except defer probe).
> > >>>>> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
> > >>>>> happened if
> > >>>> DMA is defer probed or not enabled(This is an expected).
> > >>>>> However we still need i2c DMA status is known when meet an
> > >>>>> unexpected
> > >>>> error, so we use dev_err_probe() to print error.
> > >>>>
> > >>>> Why dev_err_probe() instead of dev_err()?
> > >>>>
> > >>> Hi,
> > >>> In patch V2 discussion, Marc suggested just return
> > >>> dev_err_probe(), but I don't accept it so I choose to use
> > >>> dev_err_probe() to print error in V3.[1]
> > >> In this case, the two APIs have the same function, do you mean
> > >> dev_err() is more suitable?
> > >>
> > >> Yes, dev_err_probe() should be used in combination with return. For
> > >> example:
> > >>   return dev_err_probe(...);
> > >>
> > >> It will pass the return value on exit of the function and
> > >> optionally print of the error message if it is not EPROBE_DEFER.
> > >> Practically it replace commonly used coding pattern:
> > >>   if (ret =3D=3D -EPROBE_DEFER) {
> > >>     return ret;
> > >>   } else if (ret) {
> > >>     dev_err(..);
> > >>     return ret;
> > >>   }
> > >>
> > > Hi,
> > >
> > > Get your good point. I will change my code in V6:
> > > +       ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +       if (ret) {
> > > +               if (ret =3D=3D -EPROBE_DEFER)
> > > +                       goto clk_notifier_unregister;
> > > +               else if (ret =3D=3D -ENODEV)
> > > +                       dev_dbg(&pdev->dev, "Only use PIO
> mode\n");
> > > +               else
> > > +                       dev_err(&pdev->dev, "Failed to setup DMA,
> only use PIO mode\n");
> > > +       }
> > >
> > > I think this is what you want to see, right?
> >
> > This loses the information why the error happens (ret). Using
> > dev_err_probe even if no probe deferral is expected in that branch is
> > perfectly fine and the kernel-doc even points it out:
> >
> >   Using this helper in your probe function is totally fine even if @err
> >   is known to never be -EPROBE_DEFER.
>
> Thank you for the feedback. While I recognize the benefits of
> dev_err_probe() for compact and standardized error handling, using it wit=
hout
> returning its result raises a red flag.
>
> The function's primary purpose is to combine error logging with returning=
 the
> error code. If the return value is not used, it can create confusion and =
suggests
> potential oversight or unintended behavior. This misuse might mislead rea=
ders
> into thinking that the function always returns at that point, which is no=
t the case
> here.
>
> In this scenario, using dev_err() directly is more explicit and avoids an=
y ambiguity
> about the control flow or error handling intent. It keeps the code clear =
and
> aligned with its actual behavior.
>

how about this?

+       ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
+       if (ret) {
+               if (ret =3D=3D -EPROBE_DEFER)
+                       goto clk_notifier_unregister;
+               else if (ret =3D=3D -ENODEV)
+                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
+               else
+                       dev_err(&pdev->dev, "Failed to setup DMA (%d), only=
 use PIO mode\n", ret);
+       }

We can both know the error and also use dev_err() directly.
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7Cae12fdac9f63
> 4b7d7d9408dd20c8d8b6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638702769209008171%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
> %3D%3D%7C0%7C%7C%7C&sdata=3DDKjI9z82LWvymmNmnTRo33F9F%2FBOBb
> Wc7In0RS1xAPs%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

