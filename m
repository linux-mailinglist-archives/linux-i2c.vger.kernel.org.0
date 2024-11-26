Return-Path: <linux-i2c+bounces-8214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F29D903C
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 03:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB865289947
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 02:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F0112E7E;
	Tue, 26 Nov 2024 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CMyYEs++"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560BD1CFBC;
	Tue, 26 Nov 2024 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586650; cv=fail; b=OIkBQyZ7ED03eNGwZfdUpEAMQRRF8ZYvtrzBslWLrtemn8EDAo9GvILUr1ToBunaMa/MK3mCGnAal1pZpvfB3J9Sal/oonIYiiVpfXBiiISHrKX66TEm4ig+8t5bA6KFdWqtryBPa0L9qspHaM+ewUivipULB+ngO+7mMO6lwdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586650; c=relaxed/simple;
	bh=wOiEdzlhF471UFCxlnl/i4CSFdvm+5KTN/D7Mokt3VU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YsmNyCGKKSSJ+3MJKas6M6LPbzdctlU9qFnJvfZLT07Z1+FpXHZMgnt3BCJVD9+P+yxwCF+QECxgveaVM0SylLplVK9wzM818ROqhTfZ4nLx2QT8nttIlnS3qgn7UzYXlZX7Y1Ds7YA/7T/z41FwaIagBNmtKxewX5AvM8nKnHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CMyYEs++; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8FoMcexnxDChpK63DiBmoyKPLytsH1RoI79CwsAvfsB4lzpdLhnCWvkQfuN3IM5w5zzwui/1KSin8XgCFezRG1qqCIsVuuuHtFn6preeGlFp1maPGNT5qXUXpHP8U/9ovFOOoT9oP52j7MJf6fNGLjRsnuUKGdEgibhGBT2poml7Zor+dwXzJrkxNfxru29ehU90mf34glJRqitpZecK29+oa3NkvaUp0cWmGI0Oeu7Cz8A5qvGZydOhEdXE4JsGGNFRKSiQWp1RIHnavwRMC6KEKze5SPm1HC4G7zqev/lGNVtDN35H2RH3yZhPalY0j4UoQ6QMut3xMypWDAp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN9jPsmSta4lBbsXWLZ5g2Cab84cQarUvrNXftoQxTA=;
 b=OUhev5s4NXKjZ1PEKXlkf/BlzFAR01c06m5Ey7HyfR94sx4YZhdvcCegT9kwWNponI3dMEKTW44ZSoqIZ3HWqZd0G3WSGkMjZERcM8i//JFVLTRSNL9vHYFkr83tXXntlemXF4K/hsynNmsRq9qATk4LaeEX25c/iIxu0nrZVo62fXOEfR1v7faSMhhV2BOi1InfntaK1lud+e/7MgdNKQpbUHZ2GmqZRFC3FcRbwIGpYcBO3RY0Oa16gR6rF3stHbc+hk3wvhLw4Pp9zr0HZt9OSQ+xQlv9yr2/HbxoAGsvggIuhWkf3NaemoLa/6wNUFlGZSKSffaVcAMaBbw9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN9jPsmSta4lBbsXWLZ5g2Cab84cQarUvrNXftoQxTA=;
 b=CMyYEs++v/Msro7haj0lSxqO9dvpBvoMPhJjMvPrnW1P7j8i4z1tBPB50rRtZkFkh63AWzJpXO0NU6Zs8n9u853BDmFUCgcmhn4eLpWD02YnBK7kB+PhbRckfROY6y3e6HT/zt0uENZ+RWdTEz0eUCmVqJikJ/jm70DYufRvueVz2o7+0maNODV9L9lGOEugi9TmNv948d5peOCTN1tuV8HtlGSszzMV1BXpAIBcQH0arO5M/3+5bqa/gqsaqOPLxDvJRSoExGqXpb6e5UqBnxljerc3QCq6RktESG6gorlk5krcx4ElAYjeDBYPwJTc1u7YrK7l8PyJzgCprGSgQg==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU2PR04MB9083.eurprd04.prod.outlook.com (2603:10a6:10:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 02:04:02 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Tue, 26 Nov 2024
 02:04:02 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx: fix divide by zero warning
Thread-Topic: [PATCH] i2c: imx: fix divide by zero warning
Thread-Index: AQHbP0NEOOEJHbUC20qGWDvCC3mYQ7LIPXkAgACRt/A=
Date: Tue, 26 Nov 2024 02:04:02 +0000
Message-ID:
 <AM0PR0402MB39372A814D43DBCD5AAD1595E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
 <Z0SxUhBmp06ScnfP@lizhi-Precision-Tower-5810>
In-Reply-To: <Z0SxUhBmp06ScnfP@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DU2PR04MB9083:EE_
x-ms-office365-filtering-correlation-id: bbb4089a-04c1-4fc4-356b-08dd0dbe997e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?W1yH7X96wu9NyS4nuUMHZEIB5bx4FAHxxw/zvehO4fOw1YXCb5+HeNOM53kX?=
 =?us-ascii?Q?DbM0mNVff+lXVxpnTmI5fbaTN0eDD0tv1kcIi94b58zKnvT4gAllEb/CSWdV?=
 =?us-ascii?Q?K6BtTNjaI7gBK6GOS/nAZl4pmbbz8LdMIHd5Vjw1qStRE4Yb2l8DXEb0wiyX?=
 =?us-ascii?Q?3SCtem8EvRZXnNhHVKJ7ujVeegl4NEVwra0xoJUHzLDcu/2q01Pou1PLQHQS?=
 =?us-ascii?Q?vxQDzxxG24tW+U3z4Ju4dZZixV7989zyedMMLAoQOPdv/mMeYA1e5CzJcLyd?=
 =?us-ascii?Q?N1HvdwLU7D99tAfFxZY6Ql0C8h60IzlV7fK/P8x/byZJVxteNEtzyDj6FbM8?=
 =?us-ascii?Q?AWDHCiLXKwfstd65iI+3exJ6oWhBhMeMdy03BOr044pL8bPdlccShmsIcNiD?=
 =?us-ascii?Q?rKwF3RVNXnB+g3s3gwRakISqJIVJZLoLcfu88pLI6Qh5SFa/s22vqJnQ/XyL?=
 =?us-ascii?Q?xedUOtpZEViC3bziT/TpLt3qvuQ/mu6aM8NbT4OesoWSVL+dTwyzOFCDTsv2?=
 =?us-ascii?Q?y55PiutZATuhEEhcp/t5QG6VotRpIrrQt/c13QiH4zQFu9oSZluQ0XsDyr2h?=
 =?us-ascii?Q?RGH79QtvBn/Kl8FtXTCC8O1D8EMy10J7+3JOEkvvK2ETRJ1wtXc4iBDc3ZwX?=
 =?us-ascii?Q?XsiTpUXAMJ6izUmzCH/O9a+ylj0vYA29zXahvA+mBr1ICzayF8yE2uppVdQc?=
 =?us-ascii?Q?bHt8lKkakZl3Fuhc/BI528A+3syhnU4I4TJ/nEbRlikTUVRjtKiqUnlHzYot?=
 =?us-ascii?Q?H56wNg1SqmUbz3iUXFH4rTpQAselLXrB5eacKttEHbMhoiY4rHFYxtelk4p6?=
 =?us-ascii?Q?Wbud1d33wfe0DYFSEDtWBnNs90emuIZyCcVGlvyN4ALYrwr8OA6mr0V5tyIk?=
 =?us-ascii?Q?onPWHVRY7uq0ild4NuNVL7j5eIFkrURTzxNFQQy0Fm0haEz8ycMfn+dF7aj3?=
 =?us-ascii?Q?N7iyh/gupJt7Lf1vI84Mf+I03cMIKw6++mXeRgfkxKnqWxasQA9Ma3vukDH9?=
 =?us-ascii?Q?MIn/w5cbCf1hXrPczUPx6wglaKDvZLgQcKM8JjB2xV0qiX4ROyoUYwCpx0fJ?=
 =?us-ascii?Q?lwjAIcbrt+PHwbc091u43ymrAbxjqXniGoE7hZJWxgapdW2c2MO46tfyE6VA?=
 =?us-ascii?Q?41EV88Q1JhdPG6sfxUk46FmG78TKj5Judi/dV0ufD4auXR8g1Ita2kWSLOsT?=
 =?us-ascii?Q?I2Hcb/jMx+9cogjT4u0zaQTTV+yx4WKng6raEL4QfAWckNafKOlG3Hy1PLhR?=
 =?us-ascii?Q?Yhi2//R9HIpS3vgVNlxj63KQ/38S+Hpvloe8USGe6xnDRWToWK80/w+gOiwM?=
 =?us-ascii?Q?EblVyoirxz1os8B4ktpzBCLdqzdDKL83suLe/2AnddUql3+fniBnB5oFfsKQ?=
 =?us-ascii?Q?3w6USV5vGJKbQq10dpAga1HwvNoIQf4ang62Q683b/WGNihR4g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pM40Gix7DYAXhDvgWVl2B6ysbKNL0MaOav7sjhKkhKjjOweKKQs9YYx/uIf2?=
 =?us-ascii?Q?nANcvenAAmyqqyI59s5Ev/SSr7L/V+RTyWtJNmcFC9LFe/z9jiju6ctXVxoP?=
 =?us-ascii?Q?q4/bQTUiM9aaDW9QyxCDZ+X1Y/w8tcDZVKUY8DTpAk3pgTHZQIOefQO93d8J?=
 =?us-ascii?Q?FQysFnGOkJeEOIoynqGjflhnylsc2DhNra9amDXsgqG777nSzJtAZm3SqcGw?=
 =?us-ascii?Q?5HoQ4sHz4dIURsY0AgB/17fVbjJUUkY3jF/IIt99e2qbn5YZJ0a8vTmXP93/?=
 =?us-ascii?Q?gGLM9TMp+UAKBIfuMfJIY1t23Fr3JOhYT8ZvcUPtlgYe2wJhKXRyf4qRgcmI?=
 =?us-ascii?Q?Rs/Ar0ZVwZAu/KvdINSBpP46OXDHcFXgzlv5/UTd/zU39N6GCb7u2VJX5u7j?=
 =?us-ascii?Q?vw1ieFY/xhKRyMb/WYFCJtsYK4w38g5fw0J0U+gg+Oal8oGHBn/ac0lm0UXk?=
 =?us-ascii?Q?BAg3y15+fVGheBjva7+aLKXz8yd1P3rgu5LB7xQCwx8mfPOX+KXkHLNANhMx?=
 =?us-ascii?Q?VxXW//t61FLjoyshTc9vyWTB36GwtJpdqvrfhjRRMB2arl2m/QtCjx8LbEmO?=
 =?us-ascii?Q?oelHJ95HVPeQP/v5bjI79VLtLsrRAVUGp077RNR0U5u84gSHkTmX+5OcR4mg?=
 =?us-ascii?Q?dK3VJP9yc05owDU743wcOclEjwFKRW5XAZTQgln41Mg+3bEsNL6CBDgq9kS7?=
 =?us-ascii?Q?AG6F/kXCNTSz6VDLbijJ1vIJLn5PGtxO+lddIcqnRIderKwKGfvccXPPrPfk?=
 =?us-ascii?Q?O7awS3U3T/NmjgRQbk78w3BUwGU3BEbygOknQ8AwNnFkpISAng4G6EpvltLv?=
 =?us-ascii?Q?V4cDiUrwGM21zNGRbYZ47ys2fh9x58yyvHOAyIlxJ58/i9UiRUfVraRU85ie?=
 =?us-ascii?Q?yv7WuJ2vKqxsd1VMRVdnvGhbnqac1Zkb0JoErnaX9oOk6OOUd2kEXKCBCPN2?=
 =?us-ascii?Q?TXI789suEL+jY7h/A8/17qn1urv4h3biqTsCmiEtrvSjcOJ2QmqNrUwQk4Mn?=
 =?us-ascii?Q?qSEgwXC0M3DYISUvVo8RCSPECb412qNhci40u56j6dz6hdKl9OvpjziWSdpU?=
 =?us-ascii?Q?VI2ieXaCBNGolDNvmRuuFhKY0zz1FrfUQooqAqbxwfdzTwdQFI1IBjV67Ra8?=
 =?us-ascii?Q?iXogvZrYQezagmXoxm3wrdbYPl1xjwPpr40OiCRpdKOrayFXqTh+njAJKuDJ?=
 =?us-ascii?Q?nuMyhGB36mAN95D63cmfKGCfK/pHD5aJkDDx0y8rP2RKk+C62sFSfEg+PNRk?=
 =?us-ascii?Q?9RAAzVFtT76XHQ6/ATmyNRYUux9kG9WRT42ugY9DXNjfEtQxJTdLMWj8WROC?=
 =?us-ascii?Q?jl5TtSuCdeYFag4yxLKh9V1IfVesuvElrJbpo4sgweALVYHo+QA0KKRtSaTD?=
 =?us-ascii?Q?NRDI3U7ERIyMFrpGqfAwvOos0OG+vN7ytry6KQUSbyFF/XYukJSZRmVL2k3f?=
 =?us-ascii?Q?HyKkX5XE1fXntNWNtub7wEiwTopAUB+5WGVM8edSGs1GLq8bFKaNU6jBXtBp?=
 =?us-ascii?Q?IwpLAI2Z04YUO/DfY2hWcWCV+yajOrYLrfuB8NO5hCQDw5q9pYAlGA9H5thd?=
 =?us-ascii?Q?0lxFq+Qj8dTVSjxX43k7aj0h9nZitoMOTdMnFFsj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb4089a-04c1-4fc4-356b-08dd0dbe997e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 02:04:02.6405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHYRWhst7Z3ylA/OMvVz4OWhaF2N5ZkIw3GBGrlUy73zoF93VQCQvja1rpuUmQUDLHSNUQu8wKichiU+5CY70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9083



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Tuesday, November 26, 2024 1:18 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: o.rempel@pengutronix.de; kernel@pengutronix.de; andi.shyti@kernel.org=
;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
>=20
> On Mon, Nov 25, 2024 at 10:15:21PM +0800, carlos.song@nxp.com wrote:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > Add "i2c_clk_rate / 2" check to avoid "divide by zero warning".
> > i2c_clk_rate may be zero if i2c clock is disabled.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > ---
>=20
> You sent this patch twice?
>=20
Yes, because I meet a net error, I send the patch out and wait for a half o=
f hour, but I don't see the mail in the mail list, so I send it again, but =
another one come in
after 1 hour.. You can dismiss the same one.

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
> >  drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index 2c782cdc26bd..5ed4cb61e262 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -623,8 +623,8 @@ static int i2c_imx_acked(struct imx_i2c_struct
> *i2c_imx)
> >  	return 0;
> >  }
> >
> > -static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
> > -			    unsigned int i2c_clk_rate)
> > +static int i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
> > +			   unsigned int i2c_clk_rate)
> >  {
> >  	struct imx_i2c_clk_pair *i2c_clk_div =3D i2c_imx->hwdata->clk_div;
> >  	unsigned int div;
> > @@ -639,7 +639,11 @@ static void i2c_imx_set_clk(struct imx_i2c_struct
> > *i2c_imx,
> >
> >  	/* Divider value calculation */
> >  	if (i2c_imx->cur_clk =3D=3D i2c_clk_rate)
> > -		return;
> > +		return 0;
> > +
> > +	/* Keep the denominator of the following program always NOT equal to =
0.
> */
> > +	if (!(i2c_clk_rate / 2))
> > +		return -EINVAL;
> >
> >  	i2c_imx->cur_clk =3D i2c_clk_rate;
> >
> > @@ -670,6 +674,8 @@ static void i2c_imx_set_clk(struct imx_i2c_struct
> *i2c_imx,
> >  	dev_dbg(&i2c_imx->adapter.dev, "IFDR[IC]=3D0x%x, REAL DIV=3D%d\n",
> >  		i2c_clk_div[i].val, i2c_clk_div[i].div);  #endif
> > +
> > +	return 0;
> >  }
> >
> >  static int i2c_imx_clk_notifier_call(struct notifier_block *nb, @@
> > -679,11 +685,12 @@ static int i2c_imx_clk_notifier_call(struct notifier=
_block
> *nb,
> >  	struct imx_i2c_struct *i2c_imx =3D container_of(nb,
> >  						      struct imx_i2c_struct,
> >  						      clk_change_nb);
> > +	int ret =3D 0;
> >
> >  	if (action & POST_RATE_CHANGE)
> > -		i2c_imx_set_clk(i2c_imx, ndata->new_rate);
> > +		ret =3D i2c_imx_set_clk(i2c_imx, ndata->new_rate);
> >
> > -	return NOTIFY_OK;
> > +	return notifier_from_errno(ret);
> >  }
> >
> >  static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
> > @@ -1782,7 +1789,11 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
> >  		i2c_imx->bitrate =3D pdata->bitrate;
> >  	i2c_imx->clk_change_nb.notifier_call =3D i2c_imx_clk_notifier_call;
> >  	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
> > -	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
> > +	ret =3D i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev, "can't get I2C clock\n");
> > +		goto clk_notifier_unregister;
> > +	}
> >
> >  	i2c_imx_reset_regs(i2c_imx);
> >
> > --
> > 2.34.1
> >

