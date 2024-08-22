Return-Path: <linux-i2c+bounces-5680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC095B837
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E94711C2402F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD291CB333;
	Thu, 22 Aug 2024 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JN17HbUP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAD1EB5B;
	Thu, 22 Aug 2024 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336489; cv=fail; b=Un3MNqXcPIYNancT1T/ICpKR65M3Pvx81kpElca9/WPhD+KZtWxI8kowoU2DJSed0WEud9WHWbU0DVaRSifYhgSC3kjswgjKa86C/2PkCqP/ruAjVYqQAqk8q6aypLYlPWlNYYhOrT55QJhDSFurqhlVRYPaqWQKCxy4qcDiLrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336489; c=relaxed/simple;
	bh=9qCUHPrSilAdDTEw7IpryUpg2SUDhSk1cWFy59mIrJY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AXo2XOkvbh7zlxF7UdVfbxEKo1OkIT740HxmPvgyR6/x+gWksEh83kpQdggXD4c/SuU964sBNDYXPsTFwIDM2IaWHw08B//pL4HI/r4ymMUZ5QmDVPPD3UpNwhO3u1aLZw7HGAFuHCk1BrybM7P2XoErV0GWACRAkRvEn1zQxNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JN17HbUP; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCxXFOvzS2+sRnD+3qb2XWRi9X+y6LKUyuD7z/3baOrne4eRRhnn5YM03WjLTrD87hO71Y8ZvvP8OygyOUHFjNzTzoryn8AfVkrCAjv9oaMhZURkztotkpCD/fZedBMvrAaS2ydHReeS1KWLWMDkQRZCc5LrK2+ubtq8movGXW3JU0iE8/1PdVZ+7uVBl/2YppEEhXQxnHa2jhw/yu5TBjIX9nrU+SWoQajUlWmVevoVgcK4Gj5tVBiz2D1CtZ2+jgliMZxpUc5ghN+DDFpOeJopcoMgyxLMYQMeQ65i6Be4ofCR/MIwoYQgmBao/6C1WcA+tLMiN7TbAUADNH4EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6BxsTDIBBEz+M87z+klp4FPhN9UK8Rimco9AYKE358=;
 b=cSLKepg0C74IXcOLF21x1yBSSZuWC80fMM1b7Z1WVqcKKra+ctGJmd5ERAPCEKZu9TC3DQDqlIlRQPYxq6Hm6N33ml4DiGCYqnT3nWoAlhrYQGPITn/b/HdcvmigMaoF7UThMR3OVgpuiXJ2xqePL+TA9RU3pLq1oDcHg2MTCk5C7IdPPBzaalsQzPz50WR0efMof+UdPkiDmuOim8EdF3WiTKrwKyGtlSGSUhtA6V6Ndwrs1Ehtn2GDGLxzfwy+t16Osl8YSJ2p/5+N/CFoB+8Z9vv3ww8I6MOg5TaGj7ZdGCgpQsz9+88BhRB0fYw+Q/ppbTLBODkusEOk6Xm4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6BxsTDIBBEz+M87z+klp4FPhN9UK8Rimco9AYKE358=;
 b=JN17HbUPTNUY5c5KgJOfXTzgD2aH7C0hrgFTyXgppZNvkNm2JLvVhBhzWlpkM3vmhqcxIO51hBGCA1kUEX8lvNo4V0pRFtvaklp5kLUr7O2gHMT2OKgrN5mzLpW1InJ/g8uZjHbhx9Nguboged4AVvangsccNrAC1KVpx6g3Aqo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11706.jpnprd01.prod.outlook.com (2603:1096:400:400::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Thu, 22 Aug
 2024 14:21:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:21:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v2 3/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
Thread-Topic: [PATCH v2 3/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
Thread-Index: AQHa9Jx0WnosnTI8d02b+jpH/TEhN7IzUuJg
Date: Thu, 22 Aug 2024 14:21:23 +0000
Message-ID:
 <TY3PR01MB1134676C8A4FE7BBC89E13701868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240822140413.65369-1-rongqianfeng@vivo.com>
 <20240822140413.65369-4-rongqianfeng@vivo.com>
In-Reply-To: <20240822140413.65369-4-rongqianfeng@vivo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11706:EE_
x-ms-office365-filtering-correlation-id: 7ae06552-5c8b-47d4-fcde-08dcc2b5b337
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YldpV0YucGuBEmaenjH8y1r5LmOcYKKR9yZYtHtUdPLpEWjTm43j0JpOZWoH?=
 =?us-ascii?Q?yXQ+LePj+g9cI3nw3VZgezx6oT8XAWDHrVRjXsB8bArvlXPQM5Pyi/vt0a7o?=
 =?us-ascii?Q?LZcSnpuWi+q/jyYtPvA/UPWJLPpCBqZ+SNQ3hfD70Hg1E/dZjQvsRj2Iyab5?=
 =?us-ascii?Q?4P3UFHYlYLywDcrUEXLM9YU/pXA3ip9e0+u4d3pLpilkwU0TLjjSE64s7qjz?=
 =?us-ascii?Q?dL6ZMYl3DiaN8oksr9yhDSlgqk6WJ9PEbKbXreGRJIXINmyJVBfl85Lo8Xw6?=
 =?us-ascii?Q?bXMpayTxMC6ZnwO7XYMG6pTtN0q/moScw/96b0qQV4GOmB/OLRBFipFG60y/?=
 =?us-ascii?Q?nLdG4tp7x03MoMLS2+MCmgviCCIEPPmWMNRInf734fwcnAn0oTKTv7X5cR0U?=
 =?us-ascii?Q?KtsxUEaNcOPsFkWmYRT6+xylTtewB/lvGhYQGy1BlBoNzOISwPkf0x/oKmDf?=
 =?us-ascii?Q?xVDTgNIcbxmIAWnlB6hGA2uTQzvOiqjt9zW9FRs/cZzPUorugC+HVq0Y9Lt7?=
 =?us-ascii?Q?Cxu1CzY1CYeYay1Yd0bvXu7sc7BUwJMfC0Iwr3C0PviNtVyoHbnQDmXUcISg?=
 =?us-ascii?Q?aUzaM6N6hqLIP87W3vIE02K0qhnx6D1P8xalelP/JKVWKV+6IebGf8lph55Z?=
 =?us-ascii?Q?Ws92Bw6Tad8aXjRCUhKozSCs/A2V3+DjD1LGTvlxP1uNdcwyCMniQRstmGRG?=
 =?us-ascii?Q?k8T7Zxl+VAIfmnv1htlOZhjqd2/T1HHz5Bmvl+IELuRnDhr3U+OAmQXnPskb?=
 =?us-ascii?Q?1tlnYPH0byJbVuGP4J1NBgg1xgUXr6W5HaevF2hatDQ7MCb2059T+Ptmx0xG?=
 =?us-ascii?Q?m3JZPlR1Tm3Kr9JWpAzcTf5vMAipLVBYBO31B4HJgvqwkRpVYgGAy+V6uyan?=
 =?us-ascii?Q?ycnvp/Kfawr1JU8yH8yka5SFZUfrCrTz3Z4+UT+XFFr8YyhfWrsJxuKjqJv0?=
 =?us-ascii?Q?UBIR4AbExKrOI3BFNg4uAnAmZcIJEgnXGiKZrucLKmX6oqM8LDx9dP/RkSHb?=
 =?us-ascii?Q?pbt93OBr1n0K7jHfROiBPgtnMfKZuxk9UxocTiXxJj2T1iWvM/8gHVGkcfz4?=
 =?us-ascii?Q?xMH+aR2TIo7PcUepk2X/OT8cVxmnHWoBtCWs3xjYIT4nDN9pAk+gJy+s1Q9B?=
 =?us-ascii?Q?YthDIuDaaZWldoHUCqn1YzyNSYa6MG6h1PcijVQGLhGdGN+9Xdc4jgJxNTJp?=
 =?us-ascii?Q?vKl8C4wwHgFKIpJZtaieRmJ95nT3cNV/5E3vTwtZcrHrl9Unnx0Ee7+vfxRP?=
 =?us-ascii?Q?ZwjzN544kUFA8lvjTCOQcOzq3eMuCGASz+CxPOKqfF4pN2QyNElRFc6pfSfO?=
 =?us-ascii?Q?IGnr0FV/7oCYuwc5dDn3D+L5hFYZ9Zm2aEJX/eeYKhdKHSiBuGag4X4CNoxk?=
 =?us-ascii?Q?ogA8t8x5r0Kg+4qa7ov6JwQKE3VfwLWbKKWtGYP0UBjqYmAG6g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?enT28Qmh3lpuSkvYGUB+qIpaDWQMAZVKKxkdgcCYfNDRuIZ9NWUjKqaON3pa?=
 =?us-ascii?Q?aDoMr+gIcuIsLAJpcD5J1N0Rk4KrUDnzblstDTE6qBho0UIRBPBluDCW5bGQ?=
 =?us-ascii?Q?2QFcSPDe4pv/atXYkACtuGPKxiMm0uFj33INFT/rMQMIdYTaiGDfm8WKlfCk?=
 =?us-ascii?Q?JRNj5yyEDXgkxwz1zTNAUT3cbZmusAxqr9VXiwqOMTGkoqBvVAJdI0KEwnNw?=
 =?us-ascii?Q?xYiOhfgipke7EOZ0UjujDLNq2E0nW5W7R1EekB+d24GLrZ+sY77w29FsLw0E?=
 =?us-ascii?Q?c4GcZxds5yhUhTMn0vQJJ0+dhUsIpEc2722MpgOBHFE1frl32t5reYUHBC5X?=
 =?us-ascii?Q?hkTLO0ytTfz+wcrGJPgLvjKqehReERwnkDZXbhr6G0dkdnZ6AO4aGNv8XwTN?=
 =?us-ascii?Q?5qATtJI/d0Kp6ECLKJVekNSgDeQf3xCbQGLtn2qPQpoQQZLW8ocVUgMWWPVy?=
 =?us-ascii?Q?8cXdbk4y9nEKgfIHJLCeUzw5ZwRjawgXyu+UimklnvQgUKc3gkzWHUU+BTj2?=
 =?us-ascii?Q?jyb0wUFFbZByOYAztcCaq3dMOWFcdlxK8eXe2Tc+joNuKYG+1ELyB/hokNrn?=
 =?us-ascii?Q?XJA3mPrVQPdz8Z7LEW6mMWD/w5OLFGEOMaoXS8YB1NVmKcsjI63VzSrtfzMr?=
 =?us-ascii?Q?3KohGRgLzHkyZU/jt/yw41kaOR4GpplPlPt3vj37p4IXdvSeZMeyuiv/C8T+?=
 =?us-ascii?Q?gz8DggK8RvzXnnKhIv1cN2NrO6Un/RZUmPeU819URDEfwv2/pVSfX0W040f5?=
 =?us-ascii?Q?VJUFNEOUx5f/Iqzu5o9bQF7hIW4wREAYbe993Mu5Fs6yGETjFqzvG7EsDfO9?=
 =?us-ascii?Q?MlSCnJvxkeTXZrOoYtYOtyaWf+Pv+NCEONKNgZ1YcGM64NFG+ehm2ok9lTN0?=
 =?us-ascii?Q?rhMh5kZg5AJQVSupQA8xsREq3VdO/VPAk1fSMge4XiGmTQSCGO1h2LT3SESO?=
 =?us-ascii?Q?sJepDtheMVCMmoCzZiyhOmzBrvBld9GcK7cqxb2ibw2eoaoz3siAHKLx1dLj?=
 =?us-ascii?Q?1uYogHhyZhS+c4ia4b9Mev7TSPPaVgNHN9G056X+9OrT41dk0L6mcr83vdwJ?=
 =?us-ascii?Q?PQZmnn7es3cQJaQf3gZ8iqhcbqBxUB/ERN02G9/nkqnt52dRGMHzz49/oeWC?=
 =?us-ascii?Q?gl3tEYuDBzu2DMXxdfrWS4w6LaByNuOZA6h9fdkroR5WC02ge38DQ6CZTxsL?=
 =?us-ascii?Q?1oHQahCNbp3a29bMBDM4BiPl+m5Y2C6ZxbIRCEoi8RQrZAd10j7mw6iCPQOh?=
 =?us-ascii?Q?0p9U52zzRlThCsvGzBiPFI6w1zr2HakBgMDllK9/a7VfTT+aFcPKyARvWu+Y?=
 =?us-ascii?Q?fSsT5NqD4jiL3tlv/fc9cGWlCVRL503zEGiD3QOwbTiRu3v/EFIyE/2UhrDz?=
 =?us-ascii?Q?ddQmptm5L8RiWb73p8VuUOLqHLo/dMr8lPT8APreMsvxZqNtnJCQFNzmOjDe?=
 =?us-ascii?Q?qAYHylcjoNDzEnqQNvjPTXy2qvO8MgO/MJYrEkvhJxO84PB8IgMLS1QHsCyv?=
 =?us-ascii?Q?w67dXYpu8PQmT1e003rQVgi4OJzxa/YE+icygk4/TW0fB/C0WXVee0CsMjvh?=
 =?us-ascii?Q?EoTyQJjTIBRZaACHLGQO8V9/DijfkVlOftnSWl9DynVNXaPKl+bI3YaBmo2M?=
 =?us-ascii?Q?ww=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae06552-5c8b-47d4-fcde-08dcc2b5b337
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 14:21:23.1164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cU9OFAyZWmc839FE9TC+VWGjzOn5ON8AQ056+D1w0YfgEty3uw7eF6bRx/NDYwLyFAKNAYjRlX0UV0sSN26swR5eE7Ac/MMmPfQuct1k6yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11706

Hi Rong Qianfeng,

Thanks for the patch

> -----Original Message-----
> From: Rong Qianfeng <rongqianfeng@vivo.com>
> Sent: Thursday, August 22, 2024 3:04 PM
> Subject: [PATCH v2 3/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
>=20
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>=20
> This simplifies the code and avoids the calls to clk_disable_unprepare().
>=20
> While at it, no more special handling needed here, remove the goto label =
"err:".
>=20
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4=
780.c index
> 4aafdfab6305..f5362c5dfb50 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -792,26 +792,22 @@ static int jz4780_i2c_probe(struct platform_device =
*pdev)
>=20
>  	platform_set_drvdata(pdev, i2c);
>=20
> -	i2c->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c->clk))
>  		return PTR_ERR(i2c->clk);
>=20
> -	ret =3D clk_prepare_enable(i2c->clk);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  				   &clk_freq);
>  	if (ret) {
>  		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
> -		goto err;
> +		return ret;

Nitpick:
Leaving it to you.=20
If needed, you could send another patch to use dev_err_probe

if (ret)
	return dev_err_probe(&pdev->dev, ret, "clock-frequency not specified in DT=
\n");

>  	}
>=20
>  	i2c->speed =3D clk_freq / 1000;
>  	if (i2c->speed =3D=3D 0) {
>  		ret =3D -EINVAL;
>  		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
		return dev_err_probe(&pdev->dev, -EINVAL, "clock-frequency minimum is 100=
0\n ");

Cheers,
Biju

> -		goto err;
> +		return ret;
>  	}
>  	jz4780_i2c_set_speed(i2c);
>=20
> @@ -827,29 +823,24 @@ static int jz4780_i2c_probe(struct platform_device =
*pdev)
>=20
>  	ret =3D platform_get_irq(pdev, 0);
>  	if (ret < 0)
> -		goto err;
> +		return ret;
>  	i2c->irq =3D ret;
>  	ret =3D devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
>  			       dev_name(&pdev->dev), i2c);
>  	if (ret)
> -		goto err;
> +		return ret;
>=20
>  	ret =3D i2c_add_adapter(&i2c->adap);
>  	if (ret < 0)
> -		goto err;
> +		return ret;
>=20
>  	return 0;
> -
> -err:
> -	clk_disable_unprepare(i2c->clk);
> -	return ret;
>  }
>=20
>  static void jz4780_i2c_remove(struct platform_device *pdev)  {
>  	struct jz4780_i2c *i2c =3D platform_get_drvdata(pdev);
>=20
> -	clk_disable_unprepare(i2c->clk);
>  	i2c_del_adapter(&i2c->adap);
>  }
>=20
> --
> 2.39.0


