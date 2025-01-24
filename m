Return-Path: <linux-i2c+bounces-9162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42C1A1AFA5
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 06:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A5BE3ABD65
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 04:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808831D86E8;
	Fri, 24 Jan 2025 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wfj9tPM7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AC5733A;
	Fri, 24 Jan 2025 04:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737694802; cv=fail; b=hZhba5DPFvZzsq07tHuB2iQNTADRiXxUWgqNm7dD27hFYHxZfvMHHdz0GSKRW1l/A1YmLHY2at2mo3sWPiw8luKaGmt34h7AKZ4AWP2nCBs+MPK6XNUXHYirgivIa37J1AlAUFJqA5Y+1x66uSzqswSA478CPYy5YW+1/bgMnvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737694802; c=relaxed/simple;
	bh=f0yQUfzTlb6zu9KyOHx25fzF7dy4NAXAoFe5GsL/fQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W3VcE1JA+xl7XDOx7Y0MXhVuU+d/a4jvV5nkIjIO7+gFltStB2qqe+I04vaPVzloZr2Qj9Z8zNMTyr1EuvQMVHzMA6ZxKabjbZdCQhRc6rT3D/QFW6QY9Ca6y23CGElCDKFiYCTB84hLmfsAUo6BpmDiYfChVw7kJuQDSsVL5oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wfj9tPM7; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgJQljKLhqkq7eRZc2hQ5i9c9zRNm+VGdlaKgMV1ykMem7/WlN767+Iy5yB8u33jb0lpea8AqvJlcdaVyK9U5azsXuR/2wSGCClN0w3S1HfAPqCrLUivU8gzy/7LxbHkaPoXGiF32+WxjydaOms6QdUS6dqEuRiOnBamuH76AGz46nrA1K2MpaVahjbEme6TOlbfgUE2BhXCmi7Skz9cYKoFtpF8B0r7Eu6LCvH2HirPiIofPBmRRutHWFDmoGK4wW74i2rGN5+iRIIQWlEcB8DCppT+fc4MkAfBYvlIvwPEx3cKX7LhFlKVxlku9usiB5255YB8RCKyRRrw551yrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9t8Qw2e87Q2swQX9GLj2VrKKqAZIlzUKl47bdhsuDPc=;
 b=gyw7B+VVyOM0/L7M5bSigcotwxw3A9WkNCEVlM+B7xrqkHPKd0SdzU/Qfwu0jdMw4oeHdy3JOZzoaRWGFZb34rzcGgEgWRb+L3pwH6VCw5zCHKZUW+cWy9qUfoErmvDEh+eBxww8BeTmno635cxCQ9Ekzekk5caD5nn7WGC/aSQX5wznMCvIQp6trAGG8aZbXylmZpAZzLZFzsFwJox9I87qDpR/+aZ15wlR+E5/rz+sMdfPBwuJXNNmR5gyZltC4g/WEx1kjX/hF7F+14eBduHuF2hORajjAqigwNY64+5tcOQ5pLMz4BnrHLQUu3BfmpxzxuxuQ7PxxQg/yJfMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t8Qw2e87Q2swQX9GLj2VrKKqAZIlzUKl47bdhsuDPc=;
 b=Wfj9tPM7tekqrAT5tzSwSWn0oiUWI+ubYcw4V/F3z6q4a62+NetxB6inZrfDXHCv8nZh8MqaRe4PFnVIZzcMtJ/wiWZYsOXelN9uP+xIjoBIHgbQKMxMPw3Sfc+prWd9BHNwA/DambFGzCZg7/afrFEaj0m/n07hM04LRytNluH5SKYVUN3VKbNJQDpMdclxMssgiwO/J2fgCCYpLC+HkvX1HuYaICnkKKd0VPmJegj2bLvczi7DOzHQmcusmo8haHe5DYqJBIKWK+g1jQFGa7h6U/nSGTpia077jGGZiGKcW0nJVBJKXQHOEiIm8nZCwyUrBIMKFTTuDrnLNldsnw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DB9PR04MB9499.eurprd04.prod.outlook.com (2603:10a6:10:362::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 04:59:56 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%7]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 04:59:56 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx-lpi2c: select CONFIG_I2C_SLAVE
Thread-Topic: [PATCH] i2c: imx-lpi2c: select CONFIG_I2C_SLAVE
Thread-Index: AQHbbhzPHmtAjw8CnEWulAvYq0KYrw==
Date: Fri, 24 Jan 2025 04:59:56 +0000
Message-ID:
 <AM0PR0402MB393773B2F928011CC9DCA2D9E8E32@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20250122064906.1220557-1-arnd@kernel.org>
In-Reply-To: <20250122064906.1220557-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DB9PR04MB9499:EE_
x-ms-office365-filtering-correlation-id: be698f5f-7f33-40f7-df6c-08dd3c33f240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iHARmaZdWFIch1s+4k2FckOe8OP7GbYinQ9E/L/y+U9x8c5DDCnNRX0rZVsF?=
 =?us-ascii?Q?ZxqnIImzVQeOcuktrRa6FPe4ioiTJyoCnwKRg67DIS2vVrdJV6svkGX6O7i+?=
 =?us-ascii?Q?ZjmaTLchARdB3VYxF2HqwYTt6V2nTeYFg6G0HRhPmKRJ/A4UFWNw2IP7wi9F?=
 =?us-ascii?Q?Hgzp8YMzVdxKUeidxlF3/HidpMQcaaBMepOhOfLMF/Tuz2LH9vMR4wV7oK3m?=
 =?us-ascii?Q?9lbLFvn37mCAWCsJqIV2LyH3jYqxOyAr+/DlUfB4CREI3qIJ2ZLdj8O2/3ej?=
 =?us-ascii?Q?4pCcV1tjpMMiqOK5A7Fxn/fJP+aNzHtoK8VkYTD3Zwmicv7ek/zhisfC8D1H?=
 =?us-ascii?Q?Giz4zKLtFvF8sYCugh4I17Nu6H6JTL6qbrz+wx1OMq2GqthSYgWgBZHKYX5p?=
 =?us-ascii?Q?gZZOBAdHtZ3+U4HOA8fv6fVhrRFPezKRTezZasvfMorTG68m3j4KnAdhJ0qZ?=
 =?us-ascii?Q?KiO3m7vf+aRvzXy1KYQI5IOAlMHRQkQxTca/+HqQUs0DnCCNpzZ7c7GoeeSi?=
 =?us-ascii?Q?kv+kT566RAVEnlYPhSH3/zi48qSBmWsAX88v+JWbQIn/2Rigc19PzJf2skYh?=
 =?us-ascii?Q?VfngKZBbLE3UOglt+6HCqj5UFN0O4RGoMhSvopw/8MSBqZ/NpbYqm2EDZQ2j?=
 =?us-ascii?Q?HjcBuGK6j/HsOzJVYiIlkyqt0Cqlh20lp+kT/bGpjLTsiF0Z64Q/J+s7PXmO?=
 =?us-ascii?Q?QUR2lQkPUY9SJVsN/r8kTZoYcKSdUNQZd5+LewSS77hbDBekkhnhGjPdnclX?=
 =?us-ascii?Q?J5TPBWJgOlDCyVbbH/jEz5pj6IO+ASLjryoEV4pX23KRgeOe+mzvXjM1GikI?=
 =?us-ascii?Q?mkvqEHe54eqJ2pWFXYLB89EWMLrX5sPmA58iHVw5aK9AyPO0oXMuHCIciFLl?=
 =?us-ascii?Q?3cng5K7EiYfEIej7gAgx+lwJA5w3Ng4y0F8WG+lOYzAt4scNy1NXM8HRGn9s?=
 =?us-ascii?Q?EIJ5su99XuTSZxCnsh8vAxOI+Z5dHESJbgD2B05xR2MiwiK4ZDb9qHd/BNYF?=
 =?us-ascii?Q?o2H1mo0Y5P1DkVVLwY6dn+Jtr2+/GRmpltsstYfCO/0UVQoeEYYC2ShGcu6L?=
 =?us-ascii?Q?k2RxHdUtLVWlUmHu+7dyiQ9xWjAG6aZi1vCansJpwNkcHpPOzmCTacJ3bk0b?=
 =?us-ascii?Q?2uoOBjfvKtyI0SEg0/JxH7RyjUXctLTh67pnj89NOHvHnBl0zGcRhMs3Hntg?=
 =?us-ascii?Q?rO86d1gusHnX5Fl+bbZHEnc3bEHpAkzWPHYLwZXMNS5+7OqGmcKSexXJ9eqa?=
 =?us-ascii?Q?CrJl1Ms4fYi4L0YDlIAxejS104rcWt7MWNFTu0pgWB8OgSGxZG+zwiJ24F06?=
 =?us-ascii?Q?o9knft2SfCjdMZoMy4iT/tcYpImtcbFooQja371H/+91GeORrgVynwi2pLEf?=
 =?us-ascii?Q?Ag2k2iR+n7mifdQ9Wbg4dwcN8duP98pf9KubQ0o5d1EQNzy1llO02ZnJoqeo?=
 =?us-ascii?Q?wDVrp+MCKlkIDiOlE3CcN51jXDdr1WGv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?obZkfENogLTNTDu0jyXrAU7i984RWAhDc/h7UEnfFL5gfNSXeo9b/8MuSfVk?=
 =?us-ascii?Q?hcNwjSQxWWmOBA6wJko+dSzfTKjy08gkVE4TvWRvVVltAGVPqqLr7fpHniav?=
 =?us-ascii?Q?18wWMc2wGXxxDhXGZwyMqjcF26N37Cde+Yzk466rnYeTdlwcf2ndGs9bF1zM?=
 =?us-ascii?Q?7+N9BGADA6Wqoe3oHkYPu1d1hHkRHHvhIHvDIyvHzhReOzdWJlLnpg1nqtCF?=
 =?us-ascii?Q?MDnaXL9L4bzPNfT1iL84SJqMBW16HLfjbQXnhYiuCxTc4E2EYhjYkhuVL0mW?=
 =?us-ascii?Q?klnAF1tAMWlCieENsAdRxC/13M9v+N00/UUTwZjj8KLrB+QI7N9G2u9ISdWW?=
 =?us-ascii?Q?pW34l8JEWu/uXmBH8g3yp7PyLxrjpRPhp17F20yKf+rnyRetYG0BiEqmnM+R?=
 =?us-ascii?Q?BUr4luI+FG9jEmKKV1Oy/FOwea7H7BjcsHMH2tIveAV8+7PGYzSYFhz4YT7M?=
 =?us-ascii?Q?sU2A11NedhDT2jKgjt18LJA13ZhJwDsPdtLu1A6DNH2QbyuGwSVGbFBFfzlV?=
 =?us-ascii?Q?gYq8CdVwkILFA5CvMmtpQmbzzG5h9JOKyaYZVvtAXX2al/p0nIQil4WeL3EC?=
 =?us-ascii?Q?H6jMvuHFG+lYbX9SZXc/cOqVE+xTqj1Vmp2W7ndkWyZq/a+xadRWuq1JGnCl?=
 =?us-ascii?Q?j01axsglRxLcsm32cfyT/mw+P4oGAtU+siRZLjuH4C2s6Kz45pWP8LnQbXaF?=
 =?us-ascii?Q?G7AOJ2cMNe6OXIsrl8EOlxezGC71BsZiabacGh1FAGbx0st3aSKFAcbq83Z9?=
 =?us-ascii?Q?mOpxONolMcqEVvvV3izNxP3hJJhX3KywwQ0cGvrn/gapAkVZXfDTTrHiMzRY?=
 =?us-ascii?Q?foIVId+1HD/j8BDImc7icvpzIS2QH5ShQgWOrLB/ZyINdu9dFKiyGd6od82L?=
 =?us-ascii?Q?Qfkph2fOgTfnJjtXTtynEcD2CRQ7OMKZrUx8ZgmioH1aL4rEKF8Kb+qSQjgK?=
 =?us-ascii?Q?OM71zT7un4n3oaGDbRZgWrGzEEdFGpny/L7drWV/BMerEjrF9c7U1my9/0Az?=
 =?us-ascii?Q?HkLBEM607TXxno/ujWNYi1e3aU/fdBllmL3Urxxx5D7J8JyNxvHKaj606fPx?=
 =?us-ascii?Q?4l5M1uGP02zUKy6QwI5LH0AxJD86ha/2tpwuh7UhHV0g7eHdu0OK31HyilJA?=
 =?us-ascii?Q?54NzBhvf73azj0/vt3ClCQEf9GWt1Pq4G2ikQFVG9yivIoPbgplZNk+dik1e?=
 =?us-ascii?Q?8TlO+FXAybdc1jADj79v2MeZDH2VXAoNZzuiSde8aN9BX9w4ofOpXqCznshA?=
 =?us-ascii?Q?ifAcKW5fWs1kdWGX1IHW9gAopIsYvN5eFDXz5HZNfJ8SdOQ2Z0cN57A1XJeQ?=
 =?us-ascii?Q?/GTZVCfEYc+A9eAiqaw4g6IQpWopWRyww1FhvLE/XLQaQYQ7fcgOSTkD9aLN?=
 =?us-ascii?Q?ofHtV2qpGvVzhVR1NepmkAektPJMqdgP6Cosjm1Zc9EmX6Qomc3BrEF4yC6s?=
 =?us-ascii?Q?1S1zkvgxYfJXwa5WB8yUW7XxBXIovQPQrccegWogy24ems5mWMEIh9DzeFxq?=
 =?us-ascii?Q?LuUjr/8ceAIMYyzC9Fv91b/h8xkn9/NDjFxT9o+eO3ap4OorLDyKHEk9vK2v?=
 =?us-ascii?Q?aysZB5eTW/QiCQ45gov5Y1SyWIicSHeTblwaZHGL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be698f5f-7f33-40f7-df6c-08dd3c33f240
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 04:59:56.1188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGyd2w1AgVeVetAWxPTHDckbAyVFJlom5oikTao4UiSrbvox8Hu/pP6G4O8Oqy7dEFSHcB0B+dkYGYqSt3zN1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9499


> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The addition of target mode causes a build failure when CONFIG_I2C_SLAVE =
is
> turned off:
>=20
> drivers/i2c/busses/i2c-imx-lpi2c.c:1273:10: error: 'const struct i2c_algo=
rithm'
> has no member named 'reg_target'
>  1273 |         .reg_target     =3D lpi2c_imx_register_target,
>       |          ^~~~~~~~~~
> drivers/i2c/busses/i2c-imx-lpi2c.c:1274:10: error: 'const struct i2c_algo=
rithm'
> has no member named 'unreg_target'
>  1274 |         .unreg_target   =3D lpi2c_imx_unregister_target,
>       |          ^~~~~~~~~~~~
>=20
> Select the Kconfig symbol like we do for other similar drivers.
>=20
> Fixes: 1ee867e465c1 ("i2c: imx-lpi2c: add target mode support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig inde=
x
> 3fb1fa8244fb..60736a2831ba 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -756,6 +756,7 @@ config I2C_IMX
>  config I2C_IMX_LPI2C
>         tristate "IMX Low Power I2C interface"
>         depends on ARCH_MXC || COMPILE_TEST
> +       select I2C_SLAVE
>         help
>           Say Y here if you want to use the Low Power IIC bus controller
>           on the Freescale i.MX processors.
> --

Hi, Arnd

Thank you for very much for your fix!:)=20

You may add my ack:
Acked-by: Carlos Song <carlos.song@nxp.com>

Best Regards
Carlos
> 2.39.5


