Return-Path: <linux-i2c+bounces-5646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375495B15C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 029051F22060
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792B16F27E;
	Thu, 22 Aug 2024 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vBhX+ZfS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3421BF2A;
	Thu, 22 Aug 2024 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318372; cv=fail; b=cE/L8eJ1z7w8uf0tkzV0wKyEGcmDiGaH0608BztGCMOJ5W8fLjt982ODi2NP+DdPWazSJjb6L409GmjwxjY1lpP4+eRgpzJxwTr5NkQytRnhWt3BAO7vcdjOb0qRMmveTApJrYHwlY4F9tU2srYtP/7drUynkL4wHfq5okHWDAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318372; c=relaxed/simple;
	bh=D4S1bqWoR+GgsGFZH7dKDc2DvqMN4NrkUVFjMaDXqLc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gkba5OHghMdl7xyCkGtXKQTHPKEtRf4uHpIX8saXw8zQdT8kzpQaMlCeBMJMCtlVXhOdHlBvw79jJNuUTD1OkzoRuCDheL5b/DQjnljI05OIsjoAdyDng6NRXvnM0a9eLoan3bMq8YHcl4XGlkl/4DpDxNKLZNz0EYC5fSRvt9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vBhX+ZfS; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thr4LS1eIBcpcwqhLsiGJSTKzSTYuBWu+BVqqPiFV7zFZ3rTjMafZAQIuJvPFoTRwqjrNA9+5eGi5krwcVN+s9Lm958LZHigLYBjM5LNrcB7AhZsOTL+FdoK1PjcjouQk4BAGPhzQigdDYYcMgAiTtOCCoZC5MdRBwwL90OMgAYzXtPH8mt9Pbl+9/ObfNBgzuYYFh/s+kBS30ioOtEcX5/fkcgSEXiG3XEXbq8l2HpSkR0+Geq13rOfTnmlk/nITicvNuSoOj/xtyKfJpnX2df+n2SdxdX2aSrnYJdUgicDtFtfOOR0+qn11vjeGYAA6R9IyUMuK7WGvTEOfSYnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaJN/uagIcDvCSh161eiGPt8szsZEx2Qps/ecz4o+Ss=;
 b=HCytHi5ZCyA74rf8EeaD0m7QedCaaU4pmgLmfyv5Dwr0g6IKFuEFUH7LBpZO/gB83leTYLG6LtU19FSiDKeirmBMK+pIYLBRGfneJo0bcDdTSIs6jl2t3/21H7/99fGLn6qN4VjxVkMQ82w6ng726Br4l1QH5S2yZ0Z4QQpPQSR+ItHvv0yV0dc4lnu78Lqxk56XWRYo3xKx2sBOyj2LL8B7TgjUytrjm0fhQ2jKtdu6RvuulsdFMDtMq0yu8vhgCqELrOy8momBxRLsTT3LCAL9XcVfY4LwXjl7Pl/iC0fFJb5AYp3IHdMc+NpvVPrdiWjUCfqPK8wrGYVL/1W0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaJN/uagIcDvCSh161eiGPt8szsZEx2Qps/ecz4o+Ss=;
 b=vBhX+ZfS9cxYVXig8BVI/ISx6ZXdrNWwl0st/0W/DwGRkSwuqtqAvr3o4VJ5vHKdcfXckHMcFbiXzZNi/aeuL7Rkg8ZgpeFsS4J/2e0y8hYMtMPL3MD/qfuq6T5ziaJeBzgq+RAnnhjbbBR8Ivd/wPaS0IB3ogU2w+CAH8xV2JE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6062.jpnprd01.prod.outlook.com (2603:1096:400:48::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 09:19:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 09:19:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH 1/2] i2c: emev2: Use devm_clk_get_enabled() helpers
Thread-Topic: [PATCH 1/2] i2c: emev2: Use devm_clk_get_enabled() helpers
Thread-Index: AQHa9D/tAty6SmZPv0iqj5P+wnLntrIy/2ZA
Date: Thu, 22 Aug 2024 09:19:24 +0000
Message-ID:
 <TY3PR01MB113466D1AB122E210A12E3DFA868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240822025258.53263-1-rongqianfeng@vivo.com>
 <20240822025258.53263-2-rongqianfeng@vivo.com>
In-Reply-To: <20240822025258.53263-2-rongqianfeng@vivo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6062:EE_
x-ms-office365-filtering-correlation-id: 2b0d1de3-0904-49c6-6165-08dcc28b836c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Maz4hn4bcN7P+7qkuXRfjcNT5nf6rpPLHWikN8Ux+v+LYpBUvgcaYdMIDTcA?=
 =?us-ascii?Q?URYyUCIa6kysMCldpHW6OUXCAdm0AT+Kmc1FPt87L1hekiLZ2m/bKRkCnteH?=
 =?us-ascii?Q?T7vnFwyRrEi9fAZvFFezIc5ZjIcRE6gJsDhFh3Uv8Y4etIjAf69I2qQUqRla?=
 =?us-ascii?Q?Ubmxu3SDQ/5S9OeTerVSwK+NssEOFHFCCb8Zlhrw0ds4CgdREeOA+jOWZ/IX?=
 =?us-ascii?Q?AbEys9tOvFRTHgnsHZF9rEqyo8kA/eLzBz/JSBOsYko50SRhtkqxseBN983p?=
 =?us-ascii?Q?jiNbV8yx4VwVjAUcjrMRatgc9QFJ0rSejU545O8hVFCPpJezxI8ji6nzZ6Lr?=
 =?us-ascii?Q?1629hdgThtI12S7fxWzDMsarPSbOJsqysocOna1EUa4+zyZwNdBLBfYBQfPn?=
 =?us-ascii?Q?khktHGm6708CkNHpczbvGUyE5VDIpZWkY2/lmEBq+8D1pkD0T+0ZnOC0d7Qv?=
 =?us-ascii?Q?mCrjNWo+h9jRobGrYIIHBjV+T/WQXzdTGKE5VqPLRQCME5As4Z9KS/00dtX/?=
 =?us-ascii?Q?6uGDsWCZuus6JxmGNm6yS9SqkM/pr+XdR6EiR6FNaqKPYYwvGRSlpMSF5uQS?=
 =?us-ascii?Q?YqZJ8qp4+xV1sE1IoGSzEAHs/1fjLsYA2lfts7pmIjaVj85laQRvfCw/grPU?=
 =?us-ascii?Q?jDnIeWYMaDj4hCvxyerlUaqsMChP4y9DnkCtK+Cr4FF2e1gtNAPOHE5r/aYx?=
 =?us-ascii?Q?Ui/K3xqZ/tZZC+V4eefgMDFqdWBJWClOsxRYoqxTkVr7scGzl9oeBqQ+n9e5?=
 =?us-ascii?Q?oECboaz25AfX9vCkcr/Zx4pnZaYfNoUSJZeBbev2ns7f4EXPYDM6uYw9hIDe?=
 =?us-ascii?Q?0kDuIdd0pXzMPpPCwgs7O7bbMQbNoXO1DZRtzXpILXizQMQxOjvDoIiUFoF6?=
 =?us-ascii?Q?CkmJpxkejfVjVBpnE0V2+xqsx6QH3cGNYBHs36P+iDf3e2IjGRKgzaZrlupd?=
 =?us-ascii?Q?rnyvcwgSxvmeptjj5EwQckabK7Kr1VuZzIBzafZrzDSOODKp1LOtWJRASAHv?=
 =?us-ascii?Q?GUpfVLppAky4yuIAR1XWzkEk7lnvoWB+JtR0uEgQrJCHV0nJGWJjDhLJLwmY?=
 =?us-ascii?Q?uXTrJclrIRkRBbf95kJbBqBg/WL2xqQG6nl9a1G1IQdyDn13d5v8LhbEpG6s?=
 =?us-ascii?Q?rwUXy2+ryZ2Wyi4R/2L+SBEyzj76Y/fDRsFJRvtJxqe7GM1ryxUo5bCBiYvr?=
 =?us-ascii?Q?HjizUddcuEc707GmUe4I/BmwRiNrdijGFKgM1SkdAYwnGIaBp+GS/ZLmP6t0?=
 =?us-ascii?Q?p6oVvIPRjmRewF02AVecto0u8LQ+K+mVkZqliGEzrYp855cVSZMY5M6oiEim?=
 =?us-ascii?Q?m/WKslElLRS8rC9XMPdOBT2db/zfr1NLToSw/gA3T/glymKheo9XApKMUkA/?=
 =?us-ascii?Q?1nX2B712tRf4UYlF+eIi7FDj/O/DhRjuu0dVAhNptQcbqDUeFw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BkstM9s0NVUL+amDiB17kkkSAmXt7pJBQFVjipGC9vGy0y9gGJbaTzGaDgWX?=
 =?us-ascii?Q?yJYElsJjCDItJLUFdeTsf672p90308Mj6sGAq4nEVZlTsP0EnNvrlu570qfO?=
 =?us-ascii?Q?/5y19v3qJa3kt2X/hi1n5kQnrHzSaBPM1Ky23+gxR4/c5LfM/UHQj8gDBBj5?=
 =?us-ascii?Q?6yG5ELMAqXUpmoWQQPbqlp709M4PtGUB7B6BLDR1DZ91lDH3L3EdHb36y86u?=
 =?us-ascii?Q?KpjkVyT+9ViiuydriJjxzVBqawi/jA3oO6jEIzl1hWzWK0pzOS/YfRuDPknz?=
 =?us-ascii?Q?t0Pw+n8Ve78sg+ZURsBoAbmnU7qIxP/XVCj+17vKtRU3Cyc/GSH3j68IgtGQ?=
 =?us-ascii?Q?VCE1GAs20BIcyEEhxLOYqyqMkD96AxiUN6RziJKlKoqezeb1N1Q+mqptnsY/?=
 =?us-ascii?Q?Vpfcm6TZ7YC2PBWQBO84wbAbkLRYOrcBUT3Rblp3jPtnvQRNeCoXR6dhWEMJ?=
 =?us-ascii?Q?7E9XQ8qp/7EcXLdaKK83IXVT8reUlAs3JXGxyrWqquuKq4QkUoJDpEldjv04?=
 =?us-ascii?Q?44Xn1szjEyAraJcNLPncptnzu+vY+qVL/VE8g+zPbR3tbG/zRhyDn9F9JPHB?=
 =?us-ascii?Q?PQvcUwM0S2RJS61Cmh7o02pL+DV69asqo26gMp8aJMyoMYJ78uG39xPk1qK4?=
 =?us-ascii?Q?7cV15qwgmRZotx1hfAuhR+DNzYpuSUbyIB7+9BaBKYhaTkLVyiyr3AF74EgN?=
 =?us-ascii?Q?9F1iVotZLBWgmQffaNFK4rZmPgHJdua16gDeR3aVVv6Vht/LURWiTjXFthUt?=
 =?us-ascii?Q?fklXKrrG+IYhbLAXrisWcIHzrTvZhYl+1jdP8colFlsZXVVjB+ZX+HiKyjxK?=
 =?us-ascii?Q?P7VuznE4NuQteveeimKhqhJ3guGk2stPF40QwIhPtSgIiqejT66pkNk5WqnV?=
 =?us-ascii?Q?Pf6K0j8wTvS+GRn1gW85Jh+MAZ2rg5ZqPvDkun6bi+Di9ffhCcT0VIMxUrS9?=
 =?us-ascii?Q?hq7lKMxssr5IPhrnh5hz+RoxPcxku8yWwanjXkr4NWC0/wUOVZULWdZaiHyC?=
 =?us-ascii?Q?YL67Y2rB+krYWABj82LFTITM3m+Zbt1lI5Yp6GPCRpDvka7GHrn3oz6R7AfN?=
 =?us-ascii?Q?0Sk9YGeOBLL8v1YYuV39exkgbqqUVfP9pBIgVV6LLoYF5vtQjDRazP6yG6ME?=
 =?us-ascii?Q?xIXzJPixkdOXNVKRGNcFN2IMktmexxH0WeSWQ+t3JKGfpO03KM8VzrC1/l3e?=
 =?us-ascii?Q?r0hBHebK2+XpXSjeVeyFOJDxAYBt0gSgP+6Pbxb76hi70rzEbFgQs94/CzQC?=
 =?us-ascii?Q?H9iPmaYPe4EE9lVpEiqQ3aFAUxCLRACnSdJzVwVAUrNHFgkkEcKI1hkNwC5H?=
 =?us-ascii?Q?TkvRp8wvYy0TnUtZFi0dq32kCaMZ96rO/qKRJaQll1PTi4CTbZItwsEVCHN7?=
 =?us-ascii?Q?dM1em3Fv0RMf2Qj/H7GmctqKDQ1Hev0J9Dc4B42/K7+RhOe6bGbFTEOOnzX7?=
 =?us-ascii?Q?29DioFq2ZqDENhvPLlIuRGEYi4qhKIy24o2iQnPlX/Im+mD5+Iq5dxHAAqtl?=
 =?us-ascii?Q?B+Vn2VHMVda+jV/32OjbPXH/AKdg+GQ53YtD3pMd3sGfONuCe08f15N9t7Rs?=
 =?us-ascii?Q?iOkw1oyoLdRaBXwMRGaonryntbh9QOWMyQe3p9GJLpi7KO9R8b41jgQZe+O9?=
 =?us-ascii?Q?uw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0d1de3-0904-49c6-6165-08dcc28b836c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 09:19:24.0387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQ7FMy7fqEWF8Li0/I2svWUiODqEjr0MAy6DkS+TRlejRWQyB9a0GUtmfDDVpJFvebPednUhR1Ix6Vrg78DxgQiEwJxlqPgaqMwRpHYq+7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6062

Hi Rong Qianfeng,

Thanks for the patch.

> -----Original Message-----
> From: Rong Qianfeng <rongqianfeng@vivo.com>
> Sent: Thursday, August 22, 2024 3:53 AM
> Subject: [PATCH 1/2] i2c: emev2: Use devm_clk_get_enabled() helpers
>=20
> The devm_clk_get_enabled() helpers:    - call devm_clk_get()    - call cl=
k_prepare_enable() and
> register what is needed in order to     call clk_disable_unprepare() when=
 needed, as a managed
> resource.This simplifies the code and avoids the calls to clk_disable_unp=
repare().While at it, remove
> the goto label "err_clk:", and use its return value to return the error c=
ode.
>=20
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/i2c/busses/i2c-emev2.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev=
2.c index
> 557409410445..20efe0b0cb85 100644
> --- a/drivers/i2c/busses/i2c-emev2.c
> +++ b/drivers/i2c/busses/i2c-emev2.c
> @@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pde=
v)
>=20
>  	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
>=20
> -	priv->sclk =3D devm_clk_get(&pdev->dev, "sclk");
> +	priv->sclk =3D devm_clk_get_enabled(&pdev->dev, "sclk");

nit:
After your change sclk can be local. You can drop sclk from struct em_i2c_d=
evice
Maybe send another patch to fix this.

Cheers,
Biju

>  	if (IS_ERR(priv->sclk))
>  		return PTR_ERR(priv->sclk);
>=20
> -	ret =3D clk_prepare_enable(priv->sclk);
> -	if (ret)
> -		return ret;
> -
>  	priv->adap.timeout =3D msecs_to_jiffies(100);
>  	priv->adap.retries =3D 5;
>  	priv->adap.dev.parent =3D &pdev->dev;
> @@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pde=
v)
>=20
>  	ret =3D platform_get_irq(pdev, 0);
>  	if (ret < 0)
> -		goto err_clk;
> +		return ret;
>  	priv->irq =3D ret;
>  	ret =3D devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
>  				"em_i2c", priv);
>  	if (ret)
> -		goto err_clk;
> +		return ret;
>=20
>  	ret =3D i2c_add_adapter(&priv->adap);
>=20
>  	if (ret)
> -		goto err_clk;
> +		return ret;
>=20
>  	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr=
,
>  		 priv->irq);
>=20
>  	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(priv->sclk);
> -	return ret;
>  }
>=20
>  static void em_i2c_remove(struct platform_device *dev) @@ -424,7 +416,6 =
@@ static void
> em_i2c_remove(struct platform_device *dev)
>  	struct em_i2c_device *priv =3D platform_get_drvdata(dev);
>=20
>  	i2c_del_adapter(&priv->adap);
> -	clk_disable_unprepare(priv->sclk);
>  }
>=20
>  static const struct of_device_id em_i2c_ids[] =3D {
> --
> 2.39.0
>=20


