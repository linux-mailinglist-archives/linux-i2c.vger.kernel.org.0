Return-Path: <linux-i2c+bounces-15005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B188DD06E6D
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 04:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 935B6300E4FE
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 03:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D467E105;
	Fri,  9 Jan 2026 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WUI+1uUv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468C7262E;
	Fri,  9 Jan 2026 03:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767927729; cv=fail; b=Aj79jgBrWNgdPGYM1TAnzpt98vhn4bT1C+hT5Muql24DLzPaygacXmsil83CClzTwBjhy9QoF9N79MGdpLNqLWNTYxxWLhFDUPlfdFYb6XATsF1ZELuyJxwsB0rcimxg+EvOX9bHG8MqcqBcObxTIngMmvN9IUgixvSei1kYq/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767927729; c=relaxed/simple;
	bh=Runsr9x9x9qy9ZCNwgcS2z7yIJHQLdrboYszO7/mWFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ryKqEwpFjUR3Fc8FPc/IuoUN2cYVU4V3xtHedqK3ijrrrmzUmuwsS0to8X1NC1sEnyM2WGjL17x2FQTmiu4KjnTVb5a6LUFjeJPj5baSHKwRB4UexMR5dpBYpFI7k/+NEz9+PATc9inGtv7rXk430WJLQ5aCENQDyfv5Cflt+TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WUI+1uUv; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE3tj5FVg83Z8lMeqNY+MrTq+7KaLv+8K7tAIYif6oU8n91VXe0gJk9X81sfX4cKhuCGSg+z1iAXzTg7F1MJpjgUnfDvOowQxx4x4gKXuxGx9RfOMdV2HNFawTBmlRvVFB1GpOnwiFW1+vcnPWHWnHzRXBHzLGp+DVlTUPTSr2eeOQb4Ub07XTXI4nvdQwbtiZxt3JTeeZ9BCa/ESZe+BoHWTqyXZX2ItWG+iPO/IXZUiPdTbVRz9gRXt6ccfemjAYQo+me8xX5Oi8I6Hx4LrpwhqirNrC6/ddxig8LpmCY8MwTMF3EuarzrV8IAKJleguWEnzDZsyzOL5UwGO1vcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmxEKtrfQkKqnx76SnQSAa3e6fmX7JxTGz4OyECBqu0=;
 b=UNqXdR900+Lb2vhjzONIrqXbqA4qrkqTQbPnxrBZIaiP5WH6Y9FMCwf1+I66CQ02QdXVfh8M5yd4YSlkI23JcaXDbfxBzgx31alggPs5LeC5BWOd7r3ENgl181gV300sULNKIgYyZGt+Fl+QNn3II+qAqIFdQMBoead1NKJeV6sSwvs7s+JKL8OhTsT/fMvkM3qrZ/MRcc6MKp0LiCsQgskPx5qQibgKp3ejsz8taAj1ioJGz02BIqsbPlWvVtf7jiWwQvj0SlvmnOea8B8qjLfcolwqndcTUoPb4OmWl8kFBE2UO/OujOvNImaJkt1rAXelaSjiGd5TOkHiuFSUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmxEKtrfQkKqnx76SnQSAa3e6fmX7JxTGz4OyECBqu0=;
 b=WUI+1uUvBWE1V0SdSPoiv0kPYvkxbUn9vpL0S/rHmg5fJw6LsaD1zTz9nEoTKw/SSO/8f+uT2/oY9E2eMKfOetOwA4Ud8Dc96SkEs8dRVHonnT40wHGmaAeAPoe5yGlzXR+a5IlwfCBjkXydZ4roswrllko79Bq7ddMPsFOUE1Rn9rCP8213V65LnsBvHjjMvrXdj71A9kllOX0Izs7a2+rb80Ph1xe+sQMhucNdyhNj1v9FELHr1jgrbZ5RBU7pv5Hi+3Ep2tLbflI9l+rCBlxg9LzVLJepS9eevop49D9UQDu9GOjNava+LkXstppWkOtcO9BUqFikeKzn5/C9+Q==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA6PR04MB11950.eurprd04.prod.outlook.com
 (2603:10a6:102:516::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 03:02:05 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%3]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 03:02:05 +0000
From: Carlos Song <carlos.song@nxp.com>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "bsp-development.geo@leica-geosystems.com"
	<bsp-development.geo@leica-geosystems.com>
Subject: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Thread-Topic: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Thread-Index: AQHcgRRVxgWquXA80EG2D4yuP1alcw==
Date: Fri, 9 Jan 2026 03:02:04 +0000
Message-ID:
 <VI2PR04MB11147E578957B70705DC14AEAE882A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
In-Reply-To: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|PA6PR04MB11950:EE_
x-ms-office365-filtering-correlation-id: 92dc2842-77ff-4042-5387-08de4f2b77f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|1800799024|376014|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?a4+oOqttVHgne5ENxGPFoIYfp3C3N+VcChYZUwo4lEwpsJt8DQ07IMHAeDRa?=
 =?us-ascii?Q?WHhtgpBUOF9raD8lAYWI683K//cxN9Vhg5ScnseOcXjgoGg/X4XUNOkpJNoU?=
 =?us-ascii?Q?K11VCbmIAz4GMIeYcQtxMYsfDvl1UvA0119Y6BJ+ciCdgv0tc5dSksuvHiU0?=
 =?us-ascii?Q?Oj1gX+1SCBNagLagfYTUrAvwsPP5fsr7qGjqBMxqNYlwMpYN/pK4SUyoUhSR?=
 =?us-ascii?Q?EG6vjb+5Nf2BRZPztnSRV2Uf7j10FUg5XkHbSg1XtQc/k6tNJt29rfpMFZfr?=
 =?us-ascii?Q?zR6ag74r7X2CjzxDNwMLX0xSJNrftWlTEkaep9OELVOSlYrguU0ruXguKfkD?=
 =?us-ascii?Q?fFagy6BvZj1CkZhqhxsn/jucutXcGqlmBSpMCWR0ae901OZ+VbYurmSTSuAG?=
 =?us-ascii?Q?429ITfrI4x9s0wYgkzRp3wuS2WzYy76OSgtSyQY2pUdO9qMgkyC0eae0OxGr?=
 =?us-ascii?Q?D4uuxIkQsRaZ5HRf40F2rtt5XUjuZqIPRiqdmAnCG9Fu9VbeVuZNr7FD5hGi?=
 =?us-ascii?Q?nbE4qYRxps6eWOEJ0cFbTPcWCYHQFUvjQW/0kuHWwF4BaSG/Tdtv0BfrgIfj?=
 =?us-ascii?Q?3ATRxn8R73Os5AwnCCF+3O6AjS3DC3SZGbZR/FBJYQ0RCOmd7xRulv+Pybu/?=
 =?us-ascii?Q?KK2fADRsVcbaHNf91yu1n47OaKWCV2rKMnwsxBjGKS+CjPFwtELkblccug1c?=
 =?us-ascii?Q?3b23DN4U8fE6UuNPbQfxtq+h89nP0F5Cm5wDlm9MLZ2Zv2tzIlmZU0FYK2Ha?=
 =?us-ascii?Q?5xVTbpve+opMDLcqh9u330xYq8KRuXWVKg27VmGzYyPheY/sRGx3QQpNhXHY?=
 =?us-ascii?Q?SA06zSOakN/9hmdfk+ZGb1ux3HoChM9DcNfBD5CAJXLiR6hfqySVRoqMc3A6?=
 =?us-ascii?Q?j/xOSoVKGEu0TvcffI92TlePniI3WIk7URt+62dln9K3EewSdiDVonot5DOE?=
 =?us-ascii?Q?8cUIqplvz+X43x0vrULGzUAcbHev3obektNFHS5bz//DiqmXCFk9RPcRwQoB?=
 =?us-ascii?Q?J96oe2eN0Uh4WN4M6gkv20uVwvyo9twObkToUePEoowZZUli6PrlWnKLqCpu?=
 =?us-ascii?Q?/L4B1Pv30ZlTOXSakQk08XOQnhEPpCDwQ3rvjlfkMQ0l6PZo457/l9LIA6lt?=
 =?us-ascii?Q?z6zM7tfmIUMI5imoFR5oNObOZwSuIn8pHVQ7LIM+/cd7SeTJ7QrqnNDgf4Me?=
 =?us-ascii?Q?F8hW0uTEIre5/qBXnrAZGKm0ehTo9TN3lNpfLitKspVf/hJ/dTfFiHN2W0rF?=
 =?us-ascii?Q?W4o6DRD1Lt592tlJ/vB46c2VNMNOBaZ9rwUEZfhCPXqj+WuNhQmgoplXufp9?=
 =?us-ascii?Q?cTll2knaM0MXYEkhXvGm+1GdFqUndwXkcbhHJ+MXZQsFPlVnThRbKmHg6WSq?=
 =?us-ascii?Q?KUfo3h1b59HvEqsE9yp9r6TCR3TF4znrG6U4tf3qAAp/leHl5o3ypyoxV5mn?=
 =?us-ascii?Q?ornvMCwzJR3WyVZhT1I/Iao45BUJLncAbdyzm7fv9v/t5UImVzOw9EgIlB/S?=
 =?us-ascii?Q?OYoD1n3po2HhTFJ52VTO7ZqFRnMQRZbPaw9fTmIoxBUJTNMpxrP4w+0mcQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(376014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/eHF8PxjNKSdyFfmvCfAFSMyQAqK6rlsQMzkjEU3AaUfnkahct/0rs6zMISz?=
 =?us-ascii?Q?pqhgSyOfUzdstNrOia9nSSEbUPtXkOZ9Kj6pFvyB8TdHw3TmPw1D4pAZx/zw?=
 =?us-ascii?Q?lrswvdvvx+EBdy55seTuTSpIjkDHgYSc7La7CdyIfx3yXbNHw0fU5ZDgXhge?=
 =?us-ascii?Q?6pCoEvJY6Rv7pjxLnI2eeJBQ2IEQWsKIcSenD+1E2vIU1BNE+JsYooiLPpLz?=
 =?us-ascii?Q?r+24yn/Sqdr/Ycpk/BZSv8z/Hk2/V+B8QWKS+bwnIHeGbZzJ5uNnjDJRZ5/P?=
 =?us-ascii?Q?tLGm2HyundKSpTT1uhPFgzw5STGOAQ/7uhM7yDb0nK/8UN/luHLPOmEjKvVj?=
 =?us-ascii?Q?vOZjqXY7GU0yPynJplKTBDv1vE5gNNhtzmrtMc9IecnCZsjqJBvNmsDYvEJG?=
 =?us-ascii?Q?Hl7/WvfyIVDV9TPo9Jq8FulhCDDvk+wChR9fJ2+8vnoaSlbI1LVyhpegqvSP?=
 =?us-ascii?Q?4jixhqNaRm8Wl3sh9QVNV0YQK1+4ZNalIS+4QLg+smjOUINWduPw+7tBGiIF?=
 =?us-ascii?Q?ngByYhf1OEk2QOZ1iHLHJ8Hk6vrpZ2IKmq8nclApOtcVj0p3+uBS8XuP6aHj?=
 =?us-ascii?Q?IzXKuf6M/NFPLab2psJcn9OFw6yUHqarX8bDcHo3gXN9FYBx84bsaNF2R3/J?=
 =?us-ascii?Q?TirjsAP153MAJHppRfwr1KHYoPuj4CvrYiGWpLwe3AIujZkojc7/IrkTNxGW?=
 =?us-ascii?Q?idDVfZjqB2grcBMd0J06751XjZRq+/SVKKRmr9G9OQPHjBmNu41GptShE5EI?=
 =?us-ascii?Q?TH1qZ+Ol1iKUkFy+wuu5mEloqRob3kmlw3G4inzbhUuqekoBogCEScVjv52Z?=
 =?us-ascii?Q?RaEQyNNGmFwQHli/oP8LxHh+zJZAYqRcm0P92lGX7MN9l6GW+9nxkD3N+DV5?=
 =?us-ascii?Q?rPSB9k4pWXQyLdOVjot2Ryus4etfivxCNmwT0jzKUFeqOI73zajIVb7dnKHt?=
 =?us-ascii?Q?BZOvrE4y0pXNjEdyo4IsUVrevjcJrXCrNmYWEZMsbxUuQWmRstOX0j59iUa5?=
 =?us-ascii?Q?yqMjcwWvlMH8osuJrbQld9FhgfViIZWeqd2/ihR7iYuVB8eNBZWovLfRVWuZ?=
 =?us-ascii?Q?yMeHColklJyqA9wSk7ZRZ/v6NiU43BCiAUPYYpfVlw18cM+rcWVNWfV0p0rO?=
 =?us-ascii?Q?cuDPntkrjavgf2NUKbUhgCxkX7NUjvu1f/UY9B5bIzut29weRcOBOEYxRYnk?=
 =?us-ascii?Q?wEsJnkvNw+cZ2yH5HwPuiEu14XJ4dh1+aRAZhinJZaH7SlXx0wZbzsLhRA2x?=
 =?us-ascii?Q?p/RKuvAdeGccQZgvkW148dXttpL64/YysCmr8Ag49Dcegf+NvyTNjWSLroLf?=
 =?us-ascii?Q?je5AD4B0Fsx8pOxIQa62njjtG+cwsEGOLMXoguHZnwrFqN4V0hcZHWP7pW4e?=
 =?us-ascii?Q?ynEZZrvHCRjp7Aq5YuR4sNy45D3/45z9HOMrZGQGlJBYfaMuHFBUhHnwS9nn?=
 =?us-ascii?Q?Er0nEvrcE83Uf4b5UtjBpngoM/xKl+qjdsu9Hq2RNQ+2G8IWt8mR5lJzbCM2?=
 =?us-ascii?Q?L6uD/IiLd0OmAcCuSApAhpFlSDjynPMgr6X6mxgqfAy9PYwPI5svx4M5/87+?=
 =?us-ascii?Q?ulJi5uypLsMma4qfAeXhLubnexEm7Rb6xhQaxTxFhbapAWCFebcZsmQfTnqI?=
 =?us-ascii?Q?O7y4BFs1JB757+pmXpQ5Nyxn/RU8fEsvr6Mtqu/+kNw6cLHoIltJDJwcPDP2?=
 =?us-ascii?Q?GEY9rQvE3KzDK63PTo74nrGo+PaIPuuGnDm2iifukF6aqPb7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dc2842-77ff-4042-5387-08de4f2b77f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 03:02:04.7691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA3ovyTTJx6hfHh9QyQaWYzDmelsRIBE/OEXTYevS+xP9NEQ8s6tQZsJlLda++nk659QFZ6sjK2LlvkcejnBdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11950



> -----Original Message-----
> From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> Sent: Monday, December 29, 2025 4:16 PM
> To: o.rempel@pengutronix.de; kernel@pengutronix.de; andi.shyti@kernel.org=
;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: bsp-development.geo@leica-geosystems.com; LI Qingwu
> <Qing-wu.Li@leica-geosystems.com.cn>
> Subject: [EXT] [PATCH V1] i2c: imx: Fix SMBus block read hang on zero len=
gth
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> SMBus block read transfers encode the payload length in the first data by=
te.
> When this first byte is zero, there is no payload and the transaction sho=
uld
> terminate immediately.
>=20
> On i.MX, if the first byte of an SMBus block read is zero, the driver
> unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
> This causes the state machine to enter an endless read loop, eventually
> overrunning internal buffers and leading to a crash.
>=20
> At the same time, the controller remains in master receive mode and never
> generates a proper STOP condition, leaving the I2C bus permanently busy a=
nd
> preventing any further transfers on the bus.
>=20
> Fix this by handling the zero-length case explicitly: when the first byte=
 is zero,
> ensure that a clean STOP is generated. In this situation the controller i=
s in
> master receive mode, so it must be switched to master transmit mode befor=
e
> stopping. This is done by draining the pending received byte from I2DR, s=
etting
> I2CR_MTX to enter transmit mode, waiting briefly for the mode change, and
> then proceeding with the normal STOP sequence.
>=20
> This change has been tested on i.MX 8M Plus platform.
>=20
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> dcce882f3eba..f40deecf0f66 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct
> *i2c_imx, bool atomic)
>                 temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>                 if (!(temp & I2CR_MSTA))
>                         i2c_imx->stopped =3D 1;
> +               if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
> +                       (void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +                       temp |=3D I2CR_MTX;
> +                       imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +                       if (atomic)
> +                               udelay(25);
> +                       else
> +                               usleep_range(25, 50);
> +                       temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +               }
Hi,

for fix a smbus block read stop, you added these codes to normal stop logic=
. Could you help check if it will effect stop in other path like i2c DMA/CP=
U read/write stop logic except for smbus block read?

And do you have mind to move this logic to smbus block read error path? Thi=
s may be a minimal fix?

Carlos
>                 temp &=3D ~(I2CR_MSTA | I2CR_MTX);
>                 if (i2c_imx->dma)
>                         temp &=3D ~I2CR_DMAEN; @@ -1103,7 +1113,8
> @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx,
> unsigned i
>=20
>         case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
>                 i2c_imx_isr_read_block_data_len(i2c_imx);
> -               i2c_imx->state =3D IMX_I2C_STATE_READ_CONTINUE;
> +               if (i2c_imx->state =3D=3D
> IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
> +                       i2c_imx->state =3D
> IMX_I2C_STATE_READ_CONTINUE;
>                 break;
>=20
>         case IMX_I2C_STATE_WRITE:
> --
> 2.43.0
>=20


