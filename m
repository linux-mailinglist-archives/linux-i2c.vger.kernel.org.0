Return-Path: <linux-i2c+bounces-4345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8597916D89
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 17:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A33280F6D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 15:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3055F170831;
	Tue, 25 Jun 2024 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Fn9LtyJP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2077.outbound.protection.outlook.com [40.107.113.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225CA156654;
	Tue, 25 Jun 2024 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330819; cv=fail; b=RqiUh/Rk8QJlELuZ3+m3xPh8Igh/kGq1GEt8Dny9pFCaow/q7OkSi+8hK6V455dwB1GYMnlz6r0ru18vegVV5v3zh6JDUep0nfMPfvRL4W+eFtJo7Ctwgr3SvOHiTHxPumvyPw7xMlMULD/ZxeRZscgu5ZpnpqHSKmNCTGWDHmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330819; c=relaxed/simple;
	bh=7bxvQhRldn+VgAKPvJU/uv63vfCAeXxIXmSUeIY0rkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G2RXuwYdKtWxK805zR+DXCzW6xf9dkHKmfePAVVxDRCChSr1jZqJwA5dJ/Q2sFtu4TiXV5b34o1rpnOCwqICQafF0QD/UjXEcQmKjtL8F4b6sLjr6RmcVBvRFoHcfcr7iaE3FOKeYRs+KrVwRGvyKzJxN/AkLjLiEYH9nKVzwDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Fn9LtyJP; arc=fail smtp.client-ip=40.107.113.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBbY2bmU3WaTdfrTS/jZnCp0WhCR3zV0gOrW2sIkp4clyEdUslU3xYaAgDMAqCqPjUVGvrOq02lriBETOxhcKRTwsxkFq2Aam+eWMKh42Boer2w/Rak9V3slW4ds0MvSLrrYR6TMykkbTgFrrhhkDOf6xv6MsDDezamdMOzhMMdGKAFt+04fgpVnj3LxcNGvDmOjSsboGN1RHCR3/qCosvcDs3beJiKKEgGBXR1dPTX92jTSBu/yypmSfIGFw6lQD/baMt49V6qgeibqtndfPpRcY24tbdXg5sFHN8RH27/mnPZvyODbe9tHMk3G2uWurgNPDCgIUuMGRoRsydbj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRfHeExoHRYcFuq5ZEiIR/m0jNmS2iMNFkKVcRtD8sA=;
 b=OTqfVNGD/AbvMFbZtxoOUbCMIYaiuatZ0RPe0BoEEfP7mzA+7s4jG5mmxC53+Pl5ZgrrwIIgfoJwvdqhBIuaxXGiK4/qfA5UzNpi+ahkWn0S9T6KrQTNOjmDa/ci4VFfSPf34TmFKZpLxj/IrsqJd70oPBqoS4uWHmpbeIxrYd1UMUja2sO5nlGWlclogruz7+ZNI5kJ/roUHkkUD2V0sP33ldkMRKRUV1L435sRpApTraopyEQVPqUJGVZQiKiZgOcs/pQP8q9ROzdBowaaKdiLWF7mwcZK/h/jcZtITJHLoBKBvldfdAg/YlPPE3+ZdKlTq8SzxPHmo7B9llZ9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRfHeExoHRYcFuq5ZEiIR/m0jNmS2iMNFkKVcRtD8sA=;
 b=Fn9LtyJPa9zIPSGlQXJcQ0JLPHrZ3iFrH29A1p8PqBso1dPyqH58MCUByIWwe/e81HBpXsTWD/6K4PvFrQG+Zud3jWo3HNy4tOyix/FmSysWIeCwXkB6FS4uDhNCUX5DzBMH/sQkuT2LPlPy7Yfwcu107M6kEU2fTnzdwfleAHE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6856.jpnprd01.prod.outlook.com (2603:1096:604:117::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 15:53:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 15:53:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Topic: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Index: AQHaxvlYh4jiRKyfj0yWu87XUamtbLHYoIVQ
Date: Tue, 25 Jun 2024 15:53:27 +0000
Message-ID:
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6856:EE_
x-ms-office365-filtering-correlation-id: e808602c-50d4-4fce-9123-08dc952ef459
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230038|366014|376012|7416012|1800799022|921018|38070700016;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?t9yw2VRFanl02XZsgpfxv4Xgv3/UfEXhfmetLI/GdGupzv8CteBUck4sUoeV?=
 =?us-ascii?Q?CdLmSErOFtwpq07M59Dwe7+mh1hjE7ijco5dZy8B4w1ePMzWp2rkeO1n8mXK?=
 =?us-ascii?Q?SyrFnntv7VCZRsvrP1CZHHU9nKxTpG+Sy3XpremsbI1IIiGyKWFSgwqYTuBP?=
 =?us-ascii?Q?sHlLj7VMfFlYOMwL6v2tojv4YyEd3QAvX8dIeceRadid9oNjjAzwi4L/G7vd?=
 =?us-ascii?Q?5DtdLzhexBMFYl5XbulL5exsoA1/IkW2aq418OjgoaMj6jBdOYy7BTGCHacW?=
 =?us-ascii?Q?Uj/0Zs1lVviEbsCHe5YOa3lknm+TLy/jb3Fw4Tg1x0u4QK0j7vIeztvNOiXf?=
 =?us-ascii?Q?emiAT2XYVfBfwYIrR40UIXiY7zaPRqtTlQnNwALfX2cyYSl1HBXui+cYLj1X?=
 =?us-ascii?Q?7Iu9omqR7ko8iQKOKZ7RT70bu0VcI40hwYxzEPcVEfWRtL6xJ6Q9SUmT99V9?=
 =?us-ascii?Q?b3PrlpL++k02sJOvnUs31os93XGZBHu4EmVTgDrc/UB3/NPS85I+nDQnji3Z?=
 =?us-ascii?Q?HL9TseCDCUA0ekNKYahWfIXmnYS/fzRMNCC1lhDGEYALYY1Lf2ilG8Ebj9AU?=
 =?us-ascii?Q?SIfadkUO7yX5zLa+kjTJt7/I5jAuR/RESyqeB0qkWLjIVVSj9BIY55GfBkAc?=
 =?us-ascii?Q?30M/RIsU2wBfhEFmuzZA7abuPuInwqqSrBJF+NN2JfTNSmM+apUrvTuRPAW1?=
 =?us-ascii?Q?WTOy7uj06ve1CvtoXWqNcnMFPp6w89gtG+QiBGXNKqwgwV2JSdnzPI8VYG5C?=
 =?us-ascii?Q?e8ZOY6UJJfJsh4mMnUJC9UoUoISJjpLOWlZ5WAZiuQQcKCyMaoZzn7f6oMJ+?=
 =?us-ascii?Q?jAF5SvRkaaccS+mfe5tN5OwqI/EDFUj1anzlQH8wUS2ZXeADOthcd9+n6WlH?=
 =?us-ascii?Q?HNn1+d3+YnEPXRJORpxwYiDEYHHteanyZZbUsqdY0CwV5mg0RkC3ThWmQMY4?=
 =?us-ascii?Q?nF7+BmghllP/H88SYmPgl2YhNrZGVGAxqFycS7/A4TBYY1NzK4UBRqRjUm7t?=
 =?us-ascii?Q?NQ1g8je9nqNTP6xXze9y07Ym9B35CJ235iI75/4zXuW4XnkZA9je9eRfefbM?=
 =?us-ascii?Q?q/HkNOyOeuE4C06539vGmPwWgE6FaVpXIBT35c8JtQscV8iwKfjFrE8YwF8h?=
 =?us-ascii?Q?rTMCpBMpHi8J1IOlturDez8e5V556FdDfxEvC5jMflI8CkELVDMlPsDIKGKH?=
 =?us-ascii?Q?Ei9FQslCciFeUyFgQdCG/9lOZs+ge5Pkfld2zGIgcG8atoh8CqsWAsKUqYAi?=
 =?us-ascii?Q?Yi8/NYY/m6wkEqrQrYCbIdWcj5S+8oTnqW7Xz0xUHxBlmRElkop0oyo0jHcO?=
 =?us-ascii?Q?q+Xyz5yqZpCekMU6iua7rf3wAaaGfroKgnYFh+lZPSdEDg+4pPHZOzVsXEKk?=
 =?us-ascii?Q?mT92Y6OEuOXOuxEk3o05SEtOsBtiq+7C6ZDD5RbYlkBQkKV6LN7qH+vvW293?=
 =?us-ascii?Q?tn8x1q0n+/I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022)(921018)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6IoIu12XaAygH2pUVL9fIs22PsYfjFFF+Er8LSsdGqgZ7ywhADcDiHEnNMBK?=
 =?us-ascii?Q?bFmAWxdgjFwsYkIxuoaum3MmKal3XZ7uulUKTD/62tk5QK0Uz3jlyyxAn/h8?=
 =?us-ascii?Q?SCxtSj2O6+e7B58/W16jkm0ANZBFd0kizb9MKvmBFz88dVI55UetUIUqmYq/?=
 =?us-ascii?Q?ms5mLokH0D7gyaVy5UySmRRrXqD8lAtr5Som2KmJsxfnUwZy8tsAWVXStJd6?=
 =?us-ascii?Q?OkyK+otLzkxHsDMvfHVyKhjm/6GLMOaGsnjOGQrge/jrp2h/ysrWG/eP3Rsr?=
 =?us-ascii?Q?FtG0Pyn838DIeUBpwCIBMpgHWVfbh4e9y4Tnk2pOkTWrXJHe1GmSg8hGixNz?=
 =?us-ascii?Q?gHhMoW4Sfhx8ooxnPr6v2Io0iouA7GvKGh8/DKscBqBXMnnAow8bygcV6qg8?=
 =?us-ascii?Q?XcpBK84R6O5jv+AOYn95fl4vhz/MsLNIIN18H2Q+46ez65dSx0Dwbflawoif?=
 =?us-ascii?Q?gHOH5Xgvh5oKH+54n6iHTiz3AUXz/8IcchTbQzaV+nd+JvSzlUE8DDI2/k1b?=
 =?us-ascii?Q?5xXh2DMG4YzwduUfeIeHM4sWmGJp61Ri3WOMoU5f04ZutsU63pRg8fxnhY5T?=
 =?us-ascii?Q?m5HeqEAGpfqZ2ObSrrPiLyBtMWyViRVPUx3gGwd9PlP+c479nAhU7HSxNj2m?=
 =?us-ascii?Q?6n6NXqwjU6r/oDMfvlVubOfuI2Z/BPk1BM+2/ykILEH7Fmac5MPSFSFCl74m?=
 =?us-ascii?Q?aVia2OU1uaVJY0TODA2E0/VDO9BUHTkTVGFlOTRWIJGEC1SKT7bxCuwdPC0k?=
 =?us-ascii?Q?ufYCLCxek2UcC3viWfNIrCgXxhEgx3BoTSjsuiGhyrGEXCCxicXmMLrhwaap?=
 =?us-ascii?Q?gXRoyjyMpFxySCuJAcjI3wZWc/EruYy13+/NafxWeJArFR1ZnjX8S73peOl6?=
 =?us-ascii?Q?5klS36NFFQzBieQJenucfTVskLyj2B6PlWCXlENK6btTpl3vjPTjoDPHIenE?=
 =?us-ascii?Q?xG9LivYe356Yyo4jiRnV2HTzs0KotN13ChcTi35B8XdMOMv5w4e43dzwXS/o?=
 =?us-ascii?Q?loeQHP6r1Ppce85F/eLpWTKGCazXWLdyPzB17P9qilAt5sf04VUtA9HMJ2uX?=
 =?us-ascii?Q?iaWqRTndHiWZ5xYym6XWJjc+fuPhIOlX0FtErksi9TrRCAnbWxQvad3W1Q9/?=
 =?us-ascii?Q?K70zAJdbYdKTzDW6duNabUvUL5UGWrHP+BDTtcqaswLELkxgvLmT8wbMhu5t?=
 =?us-ascii?Q?N7cW+2ky3eB17PaeG3KAharvecxmzSCagXoBRnzp2sGiJL32QcybXz5pOIYW?=
 =?us-ascii?Q?w1qlhmhc8nPjzfcguFX1K2D9MFVox8QRhFiejQ3KAVUlicVcE/2ED0r5Lp1r?=
 =?us-ascii?Q?G+VOYzlCJZP++ZMonE1zQezZWyluUNDFWPrIASCOyy4zqPHTOlCF+TN8O6FW?=
 =?us-ascii?Q?Npa1/fevTl0/nEnKSmkhLX0gXAr5YkRY2TcM9PKPW8aHrCZ4RjiEhf2mJO6F?=
 =?us-ascii?Q?FaVw/y+LtaQt4Z5zwcMPUzcCyD6mmn/255EhDKtPKMs+X4VI0lESfkYFT5ii?=
 =?us-ascii?Q?qFirRvNBPZQXz71YPAlplOPeDXeG8Na9Lbl3x5XJFF89FYfH1OR+dK5udz2n?=
 =?us-ascii?Q?NuvanrSbD8j94TTMqaderEhKBew9ntfMYzMS9DXBf9vDCWzyvuvudq4fgqAQ?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e808602c-50d4-4fce-9123-08dc952ef459
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 15:53:27.9986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2BsNoo+K34yFGKsgnQlJIUDmSVqFQS2TrZFMEaT9TupJnzlNLpuNQFSy/E1fzE2M1N94BZzTv9WqR21qrnkWNLAQGz+rHCyzXI1125LfiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6856

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Tuesday, June 25, 2024 1:14 PM
> Subject: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> pm_runtime_get_sync() may return with error. In case it returns with erro=
r
> dev->power.usage_count needs to be decremented.
> dev->pm_runtime_resume_and_get()
> takes care of this. Thus use it.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v2:
> - delete i2c adapter all the time in remove
>=20
>  drivers/i2c/busses/i2c-riic.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 83e4d5e14ab6..002b11b020fa 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>  	char *name;
>  };
>=20
> +static const char * const riic_rpm_err_msg =3D "Failed to runtime
> +resume";
> +
>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)=
  {
>  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10 +135,14 =
@@ static int
> riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	struct riic_dev *riic =3D i2c_get_adapdata(adap);
>  	struct device *dev =3D adap->dev.parent;
>  	unsigned long time_left;
> -	int i;
> +	int i, ret;
>  	u8 start_bit;
>=20
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);

As at the moment we don't know how to reproduce this error condition
Can we use WARN_ON_ONCE() instead to catch detailed error condition here??

Cheers,
Biju

> +		return ret;
> +	}
>=20
>  	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
>  		riic->err =3D -EBUSY;
> @@ -301,6 +307,7 @@ static const struct i2c_algorithm riic_algo =3D {
>=20
>  static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)  {
> +	int ret;
>  	unsigned long rate;
>  	int total_ticks, cks, brl, brh;
>  	struct device *dev =3D riic->adapter.dev.parent; @@ -379,7 +386,11 @@ s=
tatic int
> riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  		 t->scl_fall_ns / (1000000000 / rate),
>  		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
>=20
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +		return ret;
> +	}
>=20
>  	/* Changing the order of accessing IICRST and ICE may break things! */
>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1); @@ -498,11 +5=
09,18 @@ static void
> riic_i2c_remove(struct platform_device *pdev)  {
>  	struct riic_dev *riic =3D platform_get_drvdata(pdev);
>  	struct device *dev =3D &pdev->dev;
> +	int ret;
>=20
> -	pm_runtime_get_sync(dev);
> -	riic_writeb(riic, 0, RIIC_ICIER);
> -	pm_runtime_put(dev);
>  	i2c_del_adapter(&riic->adapter);
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +	} else {
> +		riic_writeb(riic, 0, RIIC_ICIER);
> +		pm_runtime_put(dev);
> +	}
> +
>  	pm_runtime_disable(dev);
>  }
>=20
> --
> 2.39.2
>=20


