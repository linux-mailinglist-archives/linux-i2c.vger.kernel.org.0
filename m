Return-Path: <linux-i2c+bounces-4209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B8C912582
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987F9B2903A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE539158A3B;
	Fri, 21 Jun 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="D66U7ZyQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2049.outbound.protection.outlook.com [40.107.114.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6F515357A;
	Fri, 21 Jun 2024 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973284; cv=fail; b=L9UdD2xoCW7i5aDQuOlQIlLvRzbvzNjUyNDsmytQa0Ta8YRD2G4swke68ZfVMMbkUDUn7KObccjoSCXCqqiuccvm8i8jZG6ZvTn1O5KaPiJandFCj8KZqffcKwvkHlqDINGdJlWbc30aGxHSlL7GZpr7uW2+giS+yZQ7Rtscph8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973284; c=relaxed/simple;
	bh=IIDnD/7AGCO6I57YZRnycjkcWL1l3s/PSieeSME1hgQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p+5vwL5gIainYiKGvFuzxvop8vPz33Fu7AIqSnivQx7UEWe05B6BM/h8qO40R8QAWSfeaWkGZndDYd5ifJcIJ7WRXDZtytIB5O4XdGsy1bum9dQQXEIeGBwt3pz6sVW1I9gXiWpPXCsdMKsJEPI7FEkZZTFS7ghEcBRpyYP6leQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=D66U7ZyQ; arc=fail smtp.client-ip=40.107.114.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wze3Z9s9Z74QigwL/uR6OSyYhtf6balYuubXyXu4RORIFQOr7wGFYz80GXvl7Y+BjlCevEKsdTap5RGpwy17MoLojPTIKgRiae+fTH91lVDC5YEgCPpKqOtl1rpTqfVihjdlklCTl8PjEQ9bWVzBJpsRvD/gUPxNTZOjxThvKhijrf9b4p7y1Mw4cqeE0pdyhBnx93ZzmvNSWJle8mBnsukxAnR9Cp9pANvhR0VziYIlIVhQIY3LRwUuq8paCE6xS56yfG+V6m/cY9X52mwTpyoOxcabAYNmTvypDiUuK4ENUFPKt9o54S1DRwSqWH3UhenreyLVeIaiF9wzleRVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np5dfh9TflE+xe7FkqRMqZHWFEG+cgscqEEt1akDb6Q=;
 b=IDRvgGqZKxfn2etGU1gP/2sBUsgJozQWrzagLYWGnJFtq3zQj8r2VQMNeZpr4HGU2lfGHaKjdt5fk1leYOaxjTR1SmVP6qGhcDdI5VnpBG7SX4idGqqnxoN0BqrdcuczXdNoyIJk0aIk35jMalyz93mBPiKzOJyPfH5mD9V1vlyEJYyZfU41u9qmaexIEQWNY4rv51fBJ7XaOkDU1VYAuF7ylnM0qchPzyxcqj5JOMbEfVg7AZobjE+BGAoPblnyMN5bZw/pzY5IQLUNv0CS3TmC5M7Wom15k46PzcqRnNlMbTef0S2gd8BVqMDx876nhSzaPA2VvXTi4Q8g/oOjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np5dfh9TflE+xe7FkqRMqZHWFEG+cgscqEEt1akDb6Q=;
 b=D66U7ZyQtDJyhyG96Iuc7qQ8OFA2LobOpNv5dj2U6NiIeY6H3uoexuz3/czJZrAwNqbVHNAsgaSaLOs3qqmCQpFOLK/JEvuXlUMdNS1d23hkq0fzSs94/fY+M0a1W13GscKFNHX4u8TQp71trh5nKlOtO/w8co20s2jUV0eJOc8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11266.jpnprd01.prod.outlook.com (2603:1096:400:3f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 12:34:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 12:34:38 +0000
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
Subject: RE: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Topic: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Index: AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsg
Date: Fri, 21 Jun 2024 12:34:38 +0000
Message-ID:
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11266:EE_
x-ms-office365-filtering-correlation-id: 0119cbb0-446b-49d0-f206-08dc91ee8444
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|7416011|366013|376011|38070700015|921017;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZX/XWn4fPsPrj03jWLqqKaJK9Zi32aVqFt4wWGI/GV+aZubfiHAV3IEQYYIi?=
 =?us-ascii?Q?gKSESHwP93Cw8nUX0Tux3P7iUnEDeKm4o6OBiaplXtdzf1g3pqgo2EbigkVk?=
 =?us-ascii?Q?wAWwsUHXpJ9EfXiVUSIZRBn9/df4sVcBm+yUP/fw1muqTgbudbafRaYgfVHp?=
 =?us-ascii?Q?6L9eZkgmpEb9B3xnPWzIaX1qZ7GsC8Zor+wyDzufB7Pu9VPbSkp8XZBMB/9l?=
 =?us-ascii?Q?omJS9PCypFWQ3Mqt/i6rX4ZV4JUkCd8qdTPAU9QhAie74J4+QAPiqMpR4Gnu?=
 =?us-ascii?Q?EUWmK0uWCSjUcD2DPAYHNOPrz9khPJh+4AKlq041cGDEqecI+Q913IjiHY2b?=
 =?us-ascii?Q?JIdKg2y/pl597Xb2YxoGQFtRvZ56xVTGpI7lZNeDxG/X20PnfjROq2GQJPGx?=
 =?us-ascii?Q?zabltZVE7GkJYAss32pxelBYlkQ6Uwev66LCpRvD0OgUIQIbD+hYx97T7z2X?=
 =?us-ascii?Q?W6FgHosxhn9vFHtGkDGbWmq6CcN6fJylifBrml0ZsXITy08DJqN9KUo1Lqlq?=
 =?us-ascii?Q?AJyUgXruC4hG0JsHzNlybSA0mLzdm9HWaDLbkBDSa251Qv/qD3RwjJJ5RNAz?=
 =?us-ascii?Q?hwnvshb2r0q5NDHVQCZiRh23MSjI2eBUbkHx0CF3VNUI0uWhOdNEdBcFFUXT?=
 =?us-ascii?Q?eaNHweRtBC8sfr2CrZKDcpgFahBiLiXhrixNxWGZOHlhRZF9K+cgg8hFnArf?=
 =?us-ascii?Q?+2pqtYbWTZqJBx/lkYbsmAxJPb1ZnDYomGVGGUV+R+adZgtAR3HLnKkkhhaE?=
 =?us-ascii?Q?VrsdrUFXtvpdCs8gZL5SGp0OXkvzQJLbpq2Refw9EnJ/FerqDlXwvrHJH3mT?=
 =?us-ascii?Q?jBsrDGzqbx8RavZnhmTe/W92u5W58k+whF837rvrLB5vu6KzeHVW3R5N3TNc?=
 =?us-ascii?Q?ZD3qC6tflOvOPwY2tghzU+FAmFrCBws5/h3p0MwGc7lSB1w92zVy3i7U84v1?=
 =?us-ascii?Q?wSZXigUrOkOaOXj0lReuzZnLWW2el9PqhPc26yo7ZW1Yd7MYiqKPf+T1KYzS?=
 =?us-ascii?Q?Frq/+Cj3KfdM2bGbk5ll/QcUHHaSt6CLUBuv4pSjOFeggI3IrOyCXrgo/kyA?=
 =?us-ascii?Q?fCiW78KtveGEYX9udeRaI5ef/dvN2g5Wrb6NRMOaL0tznbrb+4gmRXRZPs/D?=
 =?us-ascii?Q?SiCbh8aFXH6CAY1f16xQGIjbgbhE1eEjmas0MXecqBd7g4M0HN4o5TqgkBkb?=
 =?us-ascii?Q?K3OaQ196/kSYU2wNBO897whq8bdY3Kg0xVu/FcBi6w5f+ekZUTGb8JI+FrzQ?=
 =?us-ascii?Q?rvft4Rgq1zCjSzojJKZc44TuvkhC0Jp7I4qKdH0DuoP/6TbRIHDoJq7Tdbab?=
 =?us-ascii?Q?kgXbNP8bTe374K4Fa7xREfcgbgIUAeXMrxGN1ovBhaFGVqvoUten6giq2+g1?=
 =?us-ascii?Q?6vAhMrWH7eOHJ3iwZf3+LVWwwzMA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(366013)(376011)(38070700015)(921017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GqS45KbocqvKeOvdnLSHb+mWHLFeW5h7T5y355yd1QzK173O/cxIt6J4D4i4?=
 =?us-ascii?Q?Ve8j6MUdEGQAkKCT4vKZZhcs1dQ78iAznph5CJEZNjNBODlLiJvQXDdCytLp?=
 =?us-ascii?Q?ftTQmyHIAmIFgMFKup7VXUety0zBj4EBfAC7QPUHxCwyopiKInm375zfjRQi?=
 =?us-ascii?Q?tR/Eo31mXkpSIBuelmv9Nk706gnWnd5PR3nD/NlkcZgUss0J8oG5GZEvv4mB?=
 =?us-ascii?Q?su84c8KwFFIeSak41FckEgtX89WcAXgZSFTf47vKqhVpj+LBMPg+VNRN4UVX?=
 =?us-ascii?Q?gCLEcli5lA8nTdlbgSHrgeAtHVfbiErum5Mv/OY9zcHWhOE5GSeENJ7TEPuD?=
 =?us-ascii?Q?wWaFf+EslFu9wrPdEyRRxRJBmgZL9FB31yLrqheNNW5VpvBGKFZFtkN8owDi?=
 =?us-ascii?Q?/IW77FjZ+HuJPyGto5rTodG+aEK6xGCLHyX4ns2JbdSx1gdckV0zteDPGbsA?=
 =?us-ascii?Q?1SS076MDuFITIwZ/TDrG+KBXsx0MbxGJqdNMERaPmPmr2zrQlF8TekKgOkow?=
 =?us-ascii?Q?WXYHzdHKCwvQmpNAx2R2M5Bu9T3GAb+EVWuUaeJtL02njTaA/zHc2PuFnxtF?=
 =?us-ascii?Q?y0i65qDlfyAih+4cHb4OW2Y77qvub1jmhnYJZsSvWSZTlg7RtguIChOl9SrO?=
 =?us-ascii?Q?HSE9Ld9hkwWCAOPvw6htsjItuagINOXmNnokPLUJOOUSZXMaVSGF7KJ99dzJ?=
 =?us-ascii?Q?UMtzhvHmODRP9SZ0erH2ddYnJIfgBI2UoKx8wzogJzxgqV/LtBqRAqQiQABi?=
 =?us-ascii?Q?rgAHPUkAxtxP9NovvVG3LpMEz4GUJbvPr1k++8Wu/DQ1MWQeF0wf6XQVCpfQ?=
 =?us-ascii?Q?OI1zV3CpmYR53Z3cjXvzEuua25undknrxo3FpBxM/RQLrIkn5G89qs4Y1eRL?=
 =?us-ascii?Q?ZgZfbreyacDavdmQmn5G2P/O4F9RMBaKbMv5vYWkSb82vVkBxB4GdyJQZsVT?=
 =?us-ascii?Q?MM/k7Ow9n+4soYptQtWz/nvLJ9dfdu4MvKF2KuIrqVI6gk8zoOqj2uT/VXG1?=
 =?us-ascii?Q?fIMrcFIMaPnCveTqx1moLd3w+ZfMolhbMe0zI+FfFD/RfG7IUhOgy0JvpFmU?=
 =?us-ascii?Q?OIdHmJPNn13gy2BZmoUiH6teSOqTbxNosUUnNjx4oaiytPjfMz7VS2L4asby?=
 =?us-ascii?Q?v0rpFAkkq8om4ieEgrDr/HPuCK+h+OprW99aPENqNxt9TAY0PMCKooyLpdux?=
 =?us-ascii?Q?miNe+7dIC9zAkuqsuHX9/JqaOfB3BDpHDQp6Rob8slddQa2IvgkBGaLnNTlD?=
 =?us-ascii?Q?b3/0jlYDadDtMPuob45/3rZZ1Bas/B8LzdHHLApyUDldINVm5BBmzzgc6Uum?=
 =?us-ascii?Q?/8uNExd0Hxkz1Wrh6ZgMxWawvVEXjSWpfHgxAHypiA4hZhrcLOS/U6/t5WgE?=
 =?us-ascii?Q?QEc8zdbF0UuY1uZDYYggOYzrGZXqdITGh3TzrbT4NKKiUTqbWA2YqVTkpgCZ?=
 =?us-ascii?Q?c9mb9PnjuGOBBX68KUvO9CH1wlmuIQtoZCIX6V6MVWG9FkMPnm7t7IX9Kd0I?=
 =?us-ascii?Q?QRkTiAnUylPUQD9zNdPcwyNjNQaHsMewQrfMkhDbB4KPK+n2LkNk0SimaY7Q?=
 =?us-ascii?Q?SRmQEYvVmsdXbt1nsArbII3mC0J0BXxyBnzZl7aquLqKBZ0Sfv/a210wpAkj?=
 =?us-ascii?Q?Kw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0119cbb0-446b-49d0-f206-08dc91ee8444
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 12:34:38.6733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+zfVB0OM9Dzg9c/myhVm14pVov4eM1Xncx1PJCHtp9YA2tlyKabwImDcFVub9joG91d15A/ab6j+5jIHC9NlceWZgPj2LYmOmUhrgOikHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11266

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Friday, June 21, 2024 12:23 PM
> Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08=
G045 support
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with =
the version available on
> Renesas RZ/V2H (R9A09G075). Most of the IP variants that the RIIC driver =
is working with supports
> fast mode plus.
> However, it happens that on the same SoC to have IP instatiations that su=
pport fast mode plus as
> well as IP instantiation that doesn't support it. For this, introduced th=
e renesas,riic-no-fast-
> mode-plus property.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> index 91ecf17b7a81..c0964edbca69 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -25,6 +25,10 @@ properties:
>                - renesas,riic-r9a07g054  # RZ/V2L
>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>=20
> +      - items:
> +          - const: renesas,riic-r9a08g045   # RZ/G3S
> +          - const: renesas,riic-r9a09g057
> +
>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>=20
>    reg:
> @@ -66,6 +70,10 @@ properties:
>    resets:
>      maxItems: 1
>=20
> +  renesas,riic-no-fast-mode-plus:
> +    description: specifies if fast mode plus is not supported
> +    type: Boolean

Can't this info, as part of device data?? Based on frequency and device dat=
a
is enough to derive this info??

Cheers,
Biju

> +
>  required:
>    - compatible
>    - reg
> --
> 2.39.2
>=20


