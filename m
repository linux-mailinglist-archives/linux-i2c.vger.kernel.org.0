Return-Path: <linux-i2c+bounces-4208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE5912554
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92552822C4
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BCA153BD2;
	Fri, 21 Jun 2024 12:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hZJgk+AI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2073.outbound.protection.outlook.com [40.107.114.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9021219F9;
	Fri, 21 Jun 2024 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973064; cv=fail; b=rVyZcrATDmK2HK/4LGgp0RKBYn4sWeQJgxa7vqs8Zd9xHM+MOlc+HGMGhOmmEedAmVFIvakPY3E87hZ065ZFUeVO55+VwNDpN3ho5Fk1uN065N1Run5l8A2cuDHHyc4mOTxxNkFiLQTDCG+XG8ILLYdQ7f+BRaQ4GXPmfEiBgnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973064; c=relaxed/simple;
	bh=E5/PW24V6o49Ve/8PjEN8/KOiaDhwBg2tqMKB80O6IM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XBwg80+0OHs0brjZSsOnk3CEER6kZ9HQlD6eIiGw4FVZmINxR4Jr61V8uCfb1TzD1mjRDCpW+2W/AyzJ2mulB6AdIZNVAOZgM344+3CXTohy+bYpfUAPZeuzb7hl8Gy8Byy/dLjMC/uDGrSdkNNuQEelC4AvlTmMLcCcKB9axAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hZJgk+AI; arc=fail smtp.client-ip=40.107.114.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwcjTOIu5WBUynuaq8wbXv8jKPSt6LufBo9jmLAUCsd1GpBHjv3+c4JdHi9ZsOppVXGiMn+x5wGf/94N3MYkWy0UeI4QjBO6rUDhHmTxnQWfm0vAseTELsGRIIwowXcgayoIS+mm37Fi4LO2ezVo285Y8uUV+H0lJtH11+8YujwpbWNYaVSaQYu5WZUHbjdND/9LS2hqzWGfG66paQmyDc3Duu+yu4FYRCTuFOy4RMTUevYNF1eXwttKrl+lrmCYCjX4YqPvFJGSbHI7j/7yBnIzdN4LcTszXBArJ0IG99z4Fvx1efbSch1XOzpD3kz1Gn0Xics4blP8mUseg556hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miGEXmV6Xf1Rb8zMtE5gPs56CQJWitCerDwk+/8ZhgA=;
 b=DhqTp4HnOxxSiTC/XPRtQ8MvCGehWKSLsqH4YQ9fJ8zyjgLdTyT9rawMQCgXKfi8eo0FobqOm9YftnJJaz5mgBsb0V6CjzCzltplu2oJ5r96jwpOPBP4KqHHFoYZRBDpNffxtUpQnV+vjle5MHqI/DxA+FU/qtkn2HMFqs9XiLHi6Rw1ocsKXb42gfk8Cxt9RykK4/4AjZlptnNWQU7Mu+mBZj/fTob7DvKadTuxCYUo5MgNGx/jAszUWS8LbXoiAapJHM4ym1zr12CEPvo03BpeeqJAE09u7rO0EXZnLChPEXut1DUIP3GzgLye+u6FlTqDrJ6iD/jeKxRhhH+NKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miGEXmV6Xf1Rb8zMtE5gPs56CQJWitCerDwk+/8ZhgA=;
 b=hZJgk+AIjNwjFX72pt2syCUSnhg7w2qRbEnLU7IxHzqUnYa3BdoYDYO/Ys4tlDbS7k++wePsQO4si+tAT3+1raWI8Ohs9ccmmeWGVKKCLCwJ2SqOJcn3o5uRs8Dv9uzeKm3WKo3cohQLnV5kLzSe2em0kbMRJ4Vn4ymm5+AeJLs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11266.jpnprd01.prod.outlook.com (2603:1096:400:3f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 12:30:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 12:30:57 +0000
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
Subject: RE: [PATCH 06/12] i2c: riic: Add suspend/resume support
Thread-Topic: [PATCH 06/12] i2c: riic: Add suspend/resume support
Thread-Index: AQHaw82uU3NCy1h4eEubSj2XogYUcrHSJRaA
Date: Fri, 21 Jun 2024 12:30:57 +0000
Message-ID:
 <TY3PR01MB113468CF1B6652524A2D101D686C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240621112303.1607621-7-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11266:EE_
x-ms-office365-filtering-correlation-id: 1e78a630-8eb0-445e-16aa-08dc91ee0055
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|7416011|366013|376011|38070700015|921017;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tGGl23joQFQ+29pltT4wq09yfsnDJZtkKnb/U6b1VZZNMXefmufx1rUV+IdY?=
 =?us-ascii?Q?merQuJwdKqClyFsBp52B7EPJGQO2WiovKqakOalL15+5CUbPZ1mA85WsZ83T?=
 =?us-ascii?Q?biwOofJAbxO7OlIl/e5e5F06P9er0OK/EwqxOiQmmGeSndFg0ivX3bLnNCee?=
 =?us-ascii?Q?VCyfwY64DTnLdmZRZXSQDCWo/bNB+TNIihHye1b4NA2no+UpdUaUdF9v7Ay6?=
 =?us-ascii?Q?szok15cctyBhAH05P6CP6jK/iX5ieBcvuaPGPzFtnUtMSFaqGYsklkbaweno?=
 =?us-ascii?Q?qKQZF/a6ORLjZGgmuszLRB8Qax3bwErJvhtf78RnVaMbVGKzcv2KYYrkB16C?=
 =?us-ascii?Q?WsiDwKdGZpag1Xrb4uFG2/IjTQzwjt4o0U+jBc9UFSak+66lb/tAnOquljx6?=
 =?us-ascii?Q?hqAjQjaR/DucvMchLXEkvHRPi2gH+2MV7lF4gySDSPhafn93buJGJ309SwNS?=
 =?us-ascii?Q?cd2PKYf4uTrkekNEOYN8H/59rnDOpz72s8jw4IIT6XKQuzSfWsQRSvhFrNsU?=
 =?us-ascii?Q?J5/SeHL8O/y7+r3ghppNYF1QI3Ivqg7g4UxLpXop93lSzVeDfv5+MHmzuDJx?=
 =?us-ascii?Q?onLOfrsyEYPty2tVuVMxyVl5gvGIhDJ9vD2nD1cZ62zow1oZDvmVeisEhoAU?=
 =?us-ascii?Q?TL+7YzSvdpf4OWXfhqsL9d5Bxbvils7OsgBf9XZZVjWRmcyyj84wB/mBHqzi?=
 =?us-ascii?Q?ALDPoGXwEyBqr+Q7LkkU42lkaffgRM8Blf5AYJs9LOorDRKqQE/8f+vSvOdJ?=
 =?us-ascii?Q?g4sbb14dO0a6h+8aSymJWoqd7A0j0cM92/yC9AYtgmc/N5UtEiEUM2e55X1D?=
 =?us-ascii?Q?erxqJw5MHiMXaLR6RquyA4XZ9oVcwYlPVu/W4IS+4xB6PaVNdj/qxHGmaum6?=
 =?us-ascii?Q?TWqS5t0RkZvu1RrgXya5h84X69NDH9rJu5t3TkW7DVW+1+r7ptcP04Qzf56C?=
 =?us-ascii?Q?SpQAOS8N8BzcHIgtYLNfJqC8Fj0sNAAY1BtJPRl3MOUSy4c+XU6gohcO97m0?=
 =?us-ascii?Q?6EXuWx4Qb3Dpu2F3EJVuqUo5QzyAKnD88Cn9vjO1F8oo1EJ56YJLg8XlVhMk?=
 =?us-ascii?Q?QKIvwaLm/SP0yenOyvKrlwRJ1aeEBYtf6evJq3EYPSmoXizPoZdFyF1V3BKs?=
 =?us-ascii?Q?iCa9p0QuujKdvy5QbNuc1GdDt+IaBTu7hfe2c0Cy01nIj9Wuty2SUS41Qd6q?=
 =?us-ascii?Q?wKQ4o89fDo55D9OxOCbxsSzKImWb1q/UxI2ocazLxtKgt7cN2xx6yPvbWMXc?=
 =?us-ascii?Q?N8HnDDKX0zs7f8p0fZ31U4zwtFm55AugGhx0pRdXOGWGdYrvzamNMOFQ0YY2?=
 =?us-ascii?Q?u76o2Kj0P7jzpCUR02i1FicaT9DdclHjYqyG6zhp8728BZwPkmbT8uks111R?=
 =?us-ascii?Q?977kZHV80Jg7aFTs2P7s2u80f8vQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(366013)(376011)(38070700015)(921017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4cJTzkBPVj7JxY4GAdtKmNun6LrJEBnL/VWjL0PZEszuoVSLs7U5ej1RSaca?=
 =?us-ascii?Q?yEQsz3jzV2xKcExr68c5qMGOA9kOyYAmd/xmTJxJnX862GTiIlaLzSVfaCLt?=
 =?us-ascii?Q?uLxAx3oEH7+k3rYHFgcbp9PfpM1NkPw/sM1VjQJho4MXXx9800/1ckAi29QK?=
 =?us-ascii?Q?IiqBy+aS9LvqfpKgyT2meOv+KZMxrdAgV7Dze2hzWbC0QByQWZ+uvmXAgnFA?=
 =?us-ascii?Q?QGpZmoyRs5Inkty+Mg4qfk3iuKojZHCPjBEPmcUe+1axwqxuxv/FPbSGDOGZ?=
 =?us-ascii?Q?754CDQ1ctBeuZUWkUYDRNy/7J9BplElkCG6KYHq62vQTPkcnOIicu94uHPc6?=
 =?us-ascii?Q?HIEEURFpaHzx8c47ycJrSs0YkawK6pCmzCQkNTgOeiaQB/aagwqml/6vyxi4?=
 =?us-ascii?Q?r9FvzfCC/fiStW8YThdD+nVOqkvQrFs18i0Wqz0qxmdL34wlX6oFyZ0S4t5K?=
 =?us-ascii?Q?BCRvr40wDtkMvUjbfkGFs+dODW00ZTye4HydOVfpoeXXr3LjzttcWdCGxK/x?=
 =?us-ascii?Q?+LatzedUVg6CqH525Oj8VhpFKMPnJX+WNoYtfxU/56q6bshWClNBS3hrRbzd?=
 =?us-ascii?Q?05Y/hXbsWQ7WJQxvpFMhURIyLCLhQUwV5KTJG850MGa0/tilzapDv0NqwDHX?=
 =?us-ascii?Q?cawULds3+Znv1XHxxOKjt6I1Oxg3ORN8JwzteFcQB4TWBZRalrnDUmNRrcEr?=
 =?us-ascii?Q?9Q25iQOH1Y+3C/XDobKNqVD0ApX8WH4wkvkN/KqqbZqna+8wj/4u8cToUxst?=
 =?us-ascii?Q?pInEpr/TDrmSgszmewPocaQAcxGlpch7AojCBu4JavqVpKm+l2Bo7SsLlfPR?=
 =?us-ascii?Q?1ZnizjscwwqTeQ41eK6olCJieCgKthygIP9fPqJdiSN541RVzEjtZfuhkCR6?=
 =?us-ascii?Q?uhf8Mw7FJMEZQ0qnlmlnMwqCdFsPuq+/XBrTyDwnpzYbYVk9kF/W0JaUTxxn?=
 =?us-ascii?Q?HwAzEB+Zg1AkGxN4d87MlCz7Re7ygWgso38A98HjUxvtjJW57rDyOjf2rnOf?=
 =?us-ascii?Q?2YJznVACrxnBOE9CRGELkB3RE7nc9LCae8QXq/2tcYi1gBkgTHlZb5nZvHpE?=
 =?us-ascii?Q?rXN16k3vrXuqm3vhYmBmHTSJQsy9dGmxSh8Uxiz91Ejv2pMhVjb9K0tbPZgl?=
 =?us-ascii?Q?zmql8iIuLpnNI51PQ5JyEYdl7h3n8GNAbIE1PJVX3iz4V3JbcHKQ3sttTX5J?=
 =?us-ascii?Q?+U6iH8OzniIwRA0SZP9huSl9MmxJ1FrjFNVlE4ET7eCTqKS+7HSCBZa8R2G/?=
 =?us-ascii?Q?qB2sKkDmHVxQ9+IgaSwUgV1SjaKlW2cBtwo4ruXk9y+ViPHrgOSUH4lR/XI5?=
 =?us-ascii?Q?9Bs8NZTggNnaFDlCvlurQMqp6G04NZfefVioNHhOnxXvp9P13qnYtDxZDxml?=
 =?us-ascii?Q?BoXG7zlX//G+0e9mx7+u+3JtVSz5VZHAdUPYaD9kGW1xHFVhzf98k2+0AG9L?=
 =?us-ascii?Q?GOP3AN+Se0WM+Y+UFTxJNb9peZQ/57tKTOwEIxzgC8LMXuBuZZbckuEVVre9?=
 =?us-ascii?Q?y9BsHaOAsgLh0Ryn8voEjA8uXZxm4K0DRBoe+AI3CNEC77/BzCB2Xv3LSuV1?=
 =?us-ascii?Q?Pzf+DqeEZ8UWUn8qTxrMEXdC5YQZO8X3Hi41BoxfY9Qp0MNjuIasW2KzHu09?=
 =?us-ascii?Q?Fg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e78a630-8eb0-445e-16aa-08dc91ee0055
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 12:30:57.3187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0U/duk5OzIs94sagdJgixVAKdEAeCc4IpxaQbu4x95ZzE9YtJUhcD3fy706wuzdf4depPEY9brfzCTrR8vSf8Ugltfim2vKUtuse40O3TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11266

Hi Claudiu,

Thanks for the patch

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Friday, June 21, 2024 12:23 PM
> Subject: [PATCH 06/12] i2c: riic: Add suspend/resume support
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add suspend/resume support for the RIIC driver. This is necessary for the=
 Renesas RZ/G3S SoC which
> support suspend to deep sleep state where power to most of the SoC compon=
ents is turned off. As a
> result the I2C controller needs to be reconfigured after suspend/resume. =
For this, the reset line
> was stored in the driver private data structure as well as i2c timings.
> The reset line and I2C timings are necessary to re-initialize the control=
ler after resume.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 66 +++++++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 00fb09786e48..f9b9e92570d8 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -105,6 +105,8 @@ struct riic_dev {
>  	struct completion msg_done;
>  	struct i2c_adapter adapter;
>  	struct clk *clk;
> +	struct reset_control *rstc;
> +	struct i2c_timings i2c_t;
>  };
>=20
>  struct riic_irq_desc {
> @@ -306,11 +308,12 @@ static const struct i2c_algorithm riic_algo =3D {
>  	.functionality	=3D riic_func,
>  };
>=20
> -static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
> +static int riic_init_hw(struct riic_dev *riic)
>  {
>  	int ret;
>  	unsigned long rate;
>  	int total_ticks, cks, brl, brh;
> +	struct i2c_timings *t =3D &riic->i2c_t;
>  	struct device *dev =3D riic->adapter.dev.parent;
>=20
>  	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) { @@ -429,8 +432,6 @@ stat=
ic int
> riic_i2c_probe(struct platform_device *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct riic_dev *riic;
>  	struct i2c_adapter *adap;
> -	struct i2c_timings i2c_t;
> -	struct reset_control *rstc;
>  	int i, ret;
>=20
>  	riic =3D devm_kzalloc(dev, sizeof(*riic), GFP_KERNEL); @@ -447,16 +448,=
16 @@ static int
> riic_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(riic->clk);
>  	}
>=20
> -	rstc =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> -	if (IS_ERR(rstc))
> -		return dev_err_probe(dev, PTR_ERR(rstc),
> +	riic->rstc =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(riic->rstc))
> +		return dev_err_probe(dev, PTR_ERR(riic->rstc),
>  				     "Error: missing reset ctrl\n");
>=20
> -	ret =3D reset_control_deassert(rstc);
> +	ret =3D reset_control_deassert(riic->rstc);
>  	if (ret)
>  		return ret;
>=20
> -	ret =3D devm_add_action_or_reset(dev, riic_reset_control_assert, rstc);
> +	ret =3D devm_add_action_or_reset(dev, riic_reset_control_assert,
> +riic->rstc);
>  	if (ret)
>  		return ret;
>=20
> @@ -485,13 +486,13 @@ static int riic_i2c_probe(struct platform_device *p=
dev)
>=20
>  	init_completion(&riic->msg_done);
>=20
> -	i2c_parse_fw_timings(dev, &i2c_t, true);
> +	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
>=20
>  	pm_runtime_set_autosuspend_delay(dev, 0);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);
>=20
> -	ret =3D riic_init_hw(riic, &i2c_t);
> +	ret =3D riic_init_hw(riic);
>  	if (ret)
>  		goto out;
>=20
> @@ -501,7 +502,7 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>=20
>  	platform_set_drvdata(pdev, riic);
>=20
> -	dev_info(dev, "registered with %dHz bus speed\n", i2c_t.bus_freq_hz);
> +	dev_info(dev, "registered with %dHz bus speed\n",
> +riic->i2c_t.bus_freq_hz);
>  	return 0;
>=20
>  out:
> @@ -561,6 +562,48 @@ static const struct riic_of_data riic_rz_v2h_info =
=3D {
>  	},
>  };
>=20
> +static int riic_i2c_suspend(struct device *dev) {
> +	struct riic_dev *riic =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	i2c_mark_adapter_suspended(&riic->adapter);
> +
> +	/* Disable output on SDA, SCL pins. */
> +	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_sync(dev);
> +
> +	return reset_control_assert(riic->rstc); }
> +
> +static int riic_i2c_resume(struct device *dev) {
> +	struct riic_dev *riic =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D reset_control_deassert(riic->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D riic_init_hw(riic);
> +	if (ret)
> +		return ret;

On error case we need to assert back??

Cheers,
Biju

> +
> +	i2c_mark_adapter_resumed(&riic->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops riic_i2c_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume) };
> +
>  static const struct of_device_id riic_i2c_dt_ids[] =3D {
>  	{ .compatible =3D "renesas,riic-rz", .data =3D &riic_rz_a_info },
>  	{ .compatible =3D "renesas,riic-r9a09g057", .data =3D &riic_rz_v2h_info=
 }, @@ -573,6 +616,7 @@
> static struct platform_driver riic_i2c_driver =3D {
>  	.driver		=3D {
>  		.name	=3D "i2c-riic",
>  		.of_match_table =3D riic_i2c_dt_ids,
> +		.pm	=3D pm_ptr(&riic_i2c_pm_ops),
>  	},
>  };
>=20
> --
> 2.39.2
>=20


