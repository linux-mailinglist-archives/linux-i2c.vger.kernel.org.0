Return-Path: <linux-i2c+bounces-15078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A323D142C4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 17:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF57E30038FD
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B6E36E489;
	Mon, 12 Jan 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aMj+ZZAm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD3E36E462;
	Mon, 12 Jan 2026 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236695; cv=fail; b=Wviq7/1L21UnpS8O3oaOJyC1y+rcdOKXIzvnH/3FIdb48N8gokm1IxbHsDXBJDijbs7YpyDJr0dLky9qxMXO9Kmd1H2xkwQ2SEQTqWCyEIXV/JujAYEe2FEMPHhJ7z0Ms5U7YX+SliQwLxMC6FUNFHor3JDo0LJ266sqKINL57A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236695; c=relaxed/simple;
	bh=eEFbf+LJod5+EluUVkr16ZM3DrN8garr4USIhus3awY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=usZ9MhuBQ6csDLB+9Wov+ZU3Kp1DqKt2GCuk6kyYGbqqPsyprqzTm1K2sP6F1hvcoELT9Gc0MwA925SEPmVYeh/weWgXsVdM/dzrcVnazjECkFqrZq22l+6t+/iP+mmJtblppxHX707Qkq74ucKZJV3pKpl9NRBpF1/V57J3Ehw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aMj+ZZAm; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXZVZdH/AHnxh0WhI4ysUBeRHHoASJ6QgHSPiGtRyXdN0n3kNC6aaID1DvKR1msmOsy7Z2e+JYR97T1bqZVXahrBsiGiF7+1bS1jJbD5C3GcZN2O/HuFc+YqIrthAi4CUdTPylYH+OHtn7iw2PATnmA87M1hkGc8VCRiNdiWHcGJCuvgwiX05Inl12T+EvxkuOhEwc4lOc+gAwpDp/xJCgfUA3/v+2QGuQ+V1PO2UgscAvWaCO7oUQpkd9Orn/S+X2E9bMUgc3Pmi13xjTVJX3yUN/TSMpHTz3pGCLY+eJtRaKYTsQv27D9HX9UW24bIjgKuqi7QWYP4s00XfwrxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNr8bRQmzGL+J8pGjdL1jEURQw53kdej80z9CyAyjEc=;
 b=Gpx88FkwDGZGph6m9tF5IUWWxfEVU8pvN22rFHzUOPVgfkaAohbW1Ml1aCFBxMuonEI+rxq9j05X5DJCdIb0A548X6LG0fS7qEuq06cULyanKAcSUyQa5wrewlFfLaaJl4O0OzGppJ+t0OqYdWKE4eq/B9+0QLKWfEuPyvEHGAlqp6JpntsT27nmOvXrkyykzZjLyZQTtm4AvaOtjR0++CS5f21QSMgYuGrh/2k7QsRXd58+uTBKGfabvlNi/UL0FGzEHKK+FRNJ8qnMX1arUWU3HmuUtcshgNJIP5r9BL78ukq/t4WnPxfqIWArQYd/wcJHp5SCA0396albadVDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNr8bRQmzGL+J8pGjdL1jEURQw53kdej80z9CyAyjEc=;
 b=aMj+ZZAmj2w7ZhFFmzyZyRYLmbzdQ7Dj61kxDCprv6lZzm1Cpg6xQ9poV2AbidsjIXAZ7kQ8NlnH0yiF1ElSOqqXf2RM3Jwn7U+haDrCgpvcUHBN5icquAlS2EcKA+6mG/UJdsDPKNHOEUXu2WRy2lz+TQms0vlGtz0r8o6b9O8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB16349.jpnprd01.prod.outlook.com (2603:1096:405:144::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 12 Jan
 2026 16:51:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.003; Mon, 12 Jan 2026
 16:51:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Brandt <Chris.Brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: riic: Move suspend handling to NOIRQ phase
Thread-Topic: [PATCH v2] i2c: riic: Move suspend handling to NOIRQ phase
Thread-Index: AQHccDCTm0BP7QrH+0iXtysVOygybLVO30SAgAAG42A=
Date: Mon, 12 Jan 2026 16:51:25 +0000
Message-ID:
 <TY3PR01MB11346F947E11B80E51D8B6DEC8681A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251218151022.728661-1-tommaso.merciai.xr@bp.renesas.com>
 <aWUgEeouTeow1pvB@tom-desktop>
In-Reply-To: <aWUgEeouTeow1pvB@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB16349:EE_
x-ms-office365-filtering-correlation-id: 5b6b9e82-a02d-48e1-4024-08de51fad328
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j/LlVkfpwa7O17yxTw79nlx/Jgv7zZZdjUVf3m9aItPQWlO/0ccMGU45XXTt?=
 =?us-ascii?Q?i0VfEY45lDTv4ulgaFHSIcvZTRM2YAfufwlmEOL5kDrzuvATb1noSVCWxU+B?=
 =?us-ascii?Q?+7BRQVzLEKVHzENV1MuKwnixP7DW+y78cvpjju9shHO/kPZ/DX9bZSf2SBLt?=
 =?us-ascii?Q?xP3TjHT1SFnT7XGk8pmQRqKJ4KuInSorADGqoR2tyKgh8QWvXPFfox/hnOfg?=
 =?us-ascii?Q?dPkNOdnPNzE0JliHZqyf0lRs/hncyDfYb8wj8SCIn700IVKYTEyLYuxZJNkR?=
 =?us-ascii?Q?okVyHRozLh5FokIBb8+xNO+pNDTWqrdPx0rHSq44BTATiIBcW58qLBEQyv4x?=
 =?us-ascii?Q?1sARHke+opw8pALEdSbVXMq7zsGBDNo5WA3phQVtgT+WMtdNddVIN0b+09qJ?=
 =?us-ascii?Q?VRmM7QlvaRKWqaMtni9pXTM9g3pPuGbgCBza06gIycQ6BhEQJcmG9IM/BZBv?=
 =?us-ascii?Q?7bpBSBKz09t4zZjNGbOkCeP0KlEFwAyJL6NTldRNByzIfkRyoizyvo9a7v7j?=
 =?us-ascii?Q?DmbdMSnJdw2oFMLTZguBgLGKwW667TNk06U4YrNaK5qqn6wp+5Fn1kgWMQvE?=
 =?us-ascii?Q?+WPSUyegrE9tcq0J0lCtdXa/pBdSXL/vLY8ZRpvqxT02lrqujs6HiQEOWTfp?=
 =?us-ascii?Q?wA2tpY9adyebwbHlht4ytesV6Eq75OmhckW2TAMwEU1EjQ0FJK7qAufmBx4u?=
 =?us-ascii?Q?w7Mntz7iWB8NCLb3tJ0VA4tq5K01xSBhWeMEmTB6VwGILdxPHLpHxZlGHEvU?=
 =?us-ascii?Q?u7NeS5yYsGgypRghLOR8QDJU4Fza7FkN5GcTLVxeyljhnZ1bK56on78bnwNx?=
 =?us-ascii?Q?ZrmYerL35LGSjo9EZm6hLwqnSD+PpnhifysE+Zxn7rJE0LKvbfke36vQYbpA?=
 =?us-ascii?Q?F6Q/DVPzC/m2sVq8OXmQCCQSIx80tSxUM/KZLPR1pvKPPeKufe6J0XbIR7BM?=
 =?us-ascii?Q?lLaTFF6z35IsPGqKZlaUpws79J/6ZJd3FqmFH7JIrmYDVBB+HMiU56Z30xXn?=
 =?us-ascii?Q?FHnwhVEKqFREYYeAH5xeZyvMozs75ZZtji2VKs/SXvItFaZQdVu8qPzzjbzL?=
 =?us-ascii?Q?MLyaHrHzW1018RQQTQEJqE7FkCY8+w09dGlglWBZlWaZ+VFbobVUuSvX9DmD?=
 =?us-ascii?Q?NtcM5gw2lP2o/zWyvk+6RAbnuyfn6ngLDzcyKuUW0rz7nVdza0Gn1ZOWfD9U?=
 =?us-ascii?Q?QBoYAv6esbcRodi/YIKSfZ2NV3fL7mSl+ZoY3W29CTLeca7u5LU63pZy9x6s?=
 =?us-ascii?Q?AtV5DSm0ppSHxTq37GmBwlvWf7MONQH21ulqFIw7hRlfrHnkTyHfTBuDNxlE?=
 =?us-ascii?Q?mS5gWFD3PznYpgnz5C7ij0v9zs9hY592A/LJpffZCuifL2aWMQYkVP/kQ+HB?=
 =?us-ascii?Q?RxGTg6jCb/xwOUpGhd2Ke1JA6D8DHA1wB9qZse7FKuYcsNpfs7Z6VnIeXvKB?=
 =?us-ascii?Q?8hP3VgwPDkq5vKEPXqFnWhU3eLmWpIv7EwNHOExJzo/JsBhr/ofZJLubHGT5?=
 =?us-ascii?Q?ilE2e4ialcWCVsJGbQ4SxjB53+dkt4MZvtLg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L8XTmGKuiZVV5C0kL5tBvCxXkkQ8ZKfb6P0iad7NhI/muCR7O0skGdRVw3h2?=
 =?us-ascii?Q?GagLxdOrqwSmBdh6qcb9UEW+udeqipWS5Eojd23u+kp1dh6v0ycI/WDni0gx?=
 =?us-ascii?Q?WUVwz60Dn2TOLMJ350rKgBCleKKWpF6l1A1Q6KYEgmnWvcRdS4oc7aSoV17i?=
 =?us-ascii?Q?XBgXvivaMGX1vwhWNQcravmqA7GI7h2tWr3/PAzNInuZ1pUNkrAAChjzI2jD?=
 =?us-ascii?Q?v5mnmWiy8vTQ9ZH5/agJXxJQYb3oop/2gW6MMhlfsBJ5HGu8HHUkBjnoCKWH?=
 =?us-ascii?Q?UBM0THseie14Vj4ThnP8y/JaCNgbKKDnKTDHl8ApuNXcBpzLZnz6I9xp7YNb?=
 =?us-ascii?Q?5+bZZjcC/1rTJ8cM3VERpUjxVRXHrdobKrma8DoPC/W7Kdxo52oLBydO0kvH?=
 =?us-ascii?Q?xa+sB6buxVZVJNP7ySYpJNEclp7T4Nj8E4cTlM4rqxbeG3kJ8eteqgtMkCwg?=
 =?us-ascii?Q?YS9mIV5lHsrcOp7kTKmyUhuDVrp0gtFxE6juplmB0UZ63WQbW8rnOPnvMu0m?=
 =?us-ascii?Q?ammBWrRtN5/S0OiADJQFXRCJe1Wsf/EkFaJBTaYk1zFKEKzlEGlpvooToclZ?=
 =?us-ascii?Q?ES4UK8hZsQ+k4s16cDxjhiJ3vd5PkwsSGY7s8F6sQuvA5VpLq/C9knuUnvkq?=
 =?us-ascii?Q?XEpcJTko+mWttHuVP9Xekwk241YjTIdp9NDmkbu1H15EjcgyJyESWpXVSU1f?=
 =?us-ascii?Q?VMLL08kPyUmdZ3fvDb5ojUHcJYUiSOyu71d0gOF62qIlgWWm1CWAT4eKfkFA?=
 =?us-ascii?Q?cZ60I+Iniv7qGKryqIEwY4Be991lLYwHcrrUH92imYeDjR7lvRBs47ENMJK8?=
 =?us-ascii?Q?93uF5MiGjzVlsM3hHgVuhrfDz2Uyy0/QWx3J4jVuhbEtVtVGAlgppnYTT5fE?=
 =?us-ascii?Q?wn0u2B7lzL7VTICCiC/utIUQVQlkVrPixGmgQzu5Gjt9GJHS27vLhSVxIaXC?=
 =?us-ascii?Q?9slo879shdLOeE1s4jY7Ue5MxVLLFM64GFZHjszpfWX9WNtGS/EAsmaGBusd?=
 =?us-ascii?Q?4vDRdBP81si5cMZS9xvozvLQJCszVSi35LyohQrSsNQdtEt3dMAsrR4B3h0u?=
 =?us-ascii?Q?a4J5wD+Xgtbzj+QMnzx0BIC4+PL1aebHaahAiaaWY9dkXlo7p5bUXG0rI1pS?=
 =?us-ascii?Q?1+bztz1DjHLhZF2D6vQjvCPCNEfk5i2SBFMI//aJaAzamHrN0BwjcNYBv1mO?=
 =?us-ascii?Q?dA0Ez4cXyy/OlCONii8+E9QN2DpTFYfHMa1DiP2gLuYltgkr9dK6Z4DcwWCi?=
 =?us-ascii?Q?3lCEzA/vdfp02EputF0NFDFScnBXGnOoE0OarQSfbt9sCBEE4HvMvp3V920m?=
 =?us-ascii?Q?RFAohAYZowuM8F5cHuhkJ0032KIFj8dGzfjrj3PLjW5y/c9l4fWzo9Pa2kwX?=
 =?us-ascii?Q?aUdvaS+GWaYVAIcqUPhHwNgFbDg+vH1J+T94PwsHIqKoxlukJN9Z3lwRZdQ5?=
 =?us-ascii?Q?AxeQ4b96mSRbs+hCxVedzwt0AsJbhIeevmYy+iTphk3orKyyxxT2fVmlFxXN?=
 =?us-ascii?Q?A0uFLPX580grJOpHTvH1TfA6ArVbeV5RYRsyM7tVYXEp9zZNmqNi6cB46tpy?=
 =?us-ascii?Q?Cck3zBPAi/FhC2bfhrz7xpGA8zOTZh1UPCVPp1ZOSjCFTWWRuwQFyjX4oyDH?=
 =?us-ascii?Q?VoTp94QBMYBTAhi3MUF0UtudNIkl2RMv8k/qHLCaJFw6vuiUk+rj6lJruxv2?=
 =?us-ascii?Q?Omyk46Quzk9xPS2wHYbeGCSvyeZeTXEOSRjfonadwm4gZb+tzL5m+yoBhXXb?=
 =?us-ascii?Q?DQzYsJHzjg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6b9e82-a02d-48e1-4024-08de51fad328
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 16:51:25.9254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwy+eArt2+II7+pcOBVkSsLS/gH7amjGVbNb4rex5evvuQ3C7oRD8jumwhlfScZ8hcSAQ3Reh+TWEfqaIDujSAwrZ++wK4Vi3XoVlwaPNEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16349

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 12 January 2026 16:24
> Subject: Re: [PATCH v2] i2c: riic: Move suspend handling to NOIRQ phase
>=20
> Dear All,
> A gentle ping on this patch.
>=20
> Kind Regards,
> Tommaso
>=20
> On Thu, Dec 18, 2025 at 04:10:21PM +0100, Tommaso Merciai wrote:
> > Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> > suspend support for the Renesas I2C driver and following this change
> > on RZ/G3E the following WARNING is seen on entering suspend ...
> >
> > [  134.275704] Freezing remaining freezable tasks completed (elapsed
> > 0.001 seconds) [  134.285536] ------------[ cut here ]------------ [
> > 134.290298] i2c i2c-2: Transfer while suspended [  134.295174]
> > WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214,
> > CPU#0: systemd-sleep/388 [  134.365507] Tainted: [W]=3DWARN [
> > 134.368485] Hardware name: Renesas SMARC EVK version 2 based on
> > r9a09g047e57 (DT) [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO
> > -TCO -DIT -SSBS BTYPE=3D--) [  134.382935] pc :
> > __i2c_smbus_xfer+0x1e4/0x214 [  134.387329] lr :
> > __i2c_smbus_xfer+0x1e4/0x214 [  134.391717] sp : ffff800083f23860 [
> > 134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27:
> > ffff800082ed5d60 [  134.402226] x26: 0000001f4395fd74 x25:
> > 0000000000000007 x24: 0000000000000001 [  134.409408] x23:
> > 0000000000000000 x22: 000000000000006f x21: ffff800083f23936 [
> > 134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18:
> > 0000000000000006 [  134.423771] x17: 6f63657320313030 x16:
> > 2e30206465737061 x15: ffff800083f23280 [  134.430953] x14:
> > 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09 [
> > 134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 :
> > ffff800082b16ce8 [  134.445315] x8 : 00000000ffffefff x7 :
> > ffff800082b6ece8 x6 : 80000000fffff000 [  134.452495] x5 : 000000000000=
0504 x4 : 0000000000000000
> x3 : 0000000000000000 [  134.459672] x2 : 0000000000000000 x1 : 000000000=
0000000 x0 : ffff0000c9ee9e80
> [  134.466851] Call trace:
> > [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P) [  134.473715]
> > i2c_smbus_xfer+0xbc/0x120 [  134.477507]
> > i2c_smbus_read_byte_data+0x4c/0x84
> > [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208] [
> > 134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208] [
> > 134.493226]  __rtc_read_time+0x44/0x88 [  134.497012]
> > rtc_read_time+0x3c/0x68 [  134.500622]  rtc_suspend+0x9c/0x170
> >
> > The warning is triggered because I2C transfers can still be attempted
> > while the controller is already suspended, due to inappropriate
> > ordering of the system sleep callbacks.
> >
> > If the controller is autosuspended, there is no way to wake it up once
> > runtime PM disabled (in suspend_late()). During system resume, the I2C
> > controller will be available only after runtime PM is re-enabled (in
> > resume_early()). However, this may be too late for some devices.
> >
> > Wake up the controller in the suspend() callback while runtime PM is
> > still enabled. The I2C controller will remain available until the
> > suspend_noirq() callback (pm_runtime_force_suspend()) is called.
> > During resume, the I2C controller can be restored by the
> > resume_noirq() callback (pm_runtime_force_resume()). Finally, the
> > resume() callback re-enables autosuspend. As a result, the I2C
> > controller can remain available until the system enters suspend_noirq()=
 and from resume_noirq().
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Tested on RZ/G3E SMARC EVK by putting the display into deep sleep
and resume the display that has ADV bridge connected to it.

Cheers,
Biju

> > ---
> > v1->v2:
> >  - Taking as reference commit:
> >    4262df2a69c3 ("i2c: imx-lpi2c: make controller available until the s=
ystem
> >    enters suspend_noirq() and from resume_noirq().") reworked the patch=
 with
> >    a similar approach. Updated commit body accordingly.
> >
> >  drivers/i2c/busses/i2c-riic.c | 46
> > +++++++++++++++++++++++++++++------
> >  1 file changed, 39 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c
> > b/drivers/i2c/busses/i2c-riic.c index 3e8f126cb7f7..9e3595b3623e
> > 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -670,12 +670,39 @@ static const struct riic_of_data
> > riic_rz_t2h_info =3D {
> >
> >  static int riic_i2c_suspend(struct device *dev)  {
> > -	struct riic_dev *riic =3D dev_get_drvdata(dev);
> > -	int ret;
> > +	/*
> > +	 * Some I2C devices may need the I2C controller to remain active
> > +	 * during resume_noirq() or suspend_noirq(). If the controller is
> > +	 * autosuspended, there is no way to wake it up once runtime PM is
> > +	 * disabled (in suspend_late()).
> > +	 *
> > +	 * During system resume, the I2C controller will be available only
> > +	 * after runtime PM is re-enabled (in resume_early()). However, this
> > +	 * may be too late for some devices.
> > +	 *
> > +	 * Wake up the controller in the suspend() callback while runtime PM
> > +	 * is still enabled. The I2C controller will remain available until
> > +	 * the suspend_noirq() callback (pm_runtime_force_suspend()) is
> > +	 * called. During resume, the I2C controller can be restored by the
> > +	 * resume_noirq() callback (pm_runtime_force_resume()).
> > +	 *
> > +	 * Finally, the resume() callback re-enables autosuspend, ensuring
> > +	 * the I2C controller remains available until the system enters
> > +	 * suspend_noirq() and from resume_noirq().
> > +	 */
> > +	return pm_runtime_resume_and_get(dev); }
> >
> > -	ret =3D pm_runtime_resume_and_get(dev);
> > -	if (ret)
> > -		return ret;
> > +static int riic_i2c_resume(struct device *dev) {
> > +	pm_runtime_put_autosuspend(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int riic_i2c_suspend_noirq(struct device *dev) {
> > +	struct riic_dev *riic =3D dev_get_drvdata(dev);
> >
> >  	i2c_mark_adapter_suspended(&riic->adapter);
> >
> > @@ -683,12 +710,12 @@ static int riic_i2c_suspend(struct device *dev)
> >  	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
> >
> >  	pm_runtime_mark_last_busy(dev);
> > -	pm_runtime_put_sync(dev);
> > +	pm_runtime_force_suspend(dev);
> >
> >  	return reset_control_assert(riic->rstc);  }
> >
> > -static int riic_i2c_resume(struct device *dev)
> > +static int riic_i2c_resume_noirq(struct device *dev)
> >  {
> >  	struct riic_dev *riic =3D dev_get_drvdata(dev);
> >  	int ret;
> > @@ -697,6 +724,10 @@ static int riic_i2c_resume(struct device *dev)
> >  	if (ret)
> >  		return ret;
> >
> > +	ret =3D pm_runtime_force_resume(dev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret =3D riic_init_hw(riic);
> >  	if (ret) {
> >  		/*
> > @@ -714,6 +745,7 @@ static int riic_i2c_resume(struct device *dev)  }
> >
> >  static const struct dev_pm_ops riic_i2c_pm_ops =3D {
> > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend_noirq,
> > +riic_i2c_resume_noirq)
> >  	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)  };
> >
> > --
> > 2.43.0
> >

