Return-Path: <linux-i2c+bounces-9404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0375DA32D02
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4996C188BFCB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962C725B66E;
	Wed, 12 Feb 2025 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TTVn8rBB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29825B668;
	Wed, 12 Feb 2025 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380100; cv=fail; b=EUhaQqmtDsFbAU4ZG3jYOv+ezGQ6JBt0csxo5mF330OBXPt0kv9RGc3NsbDTlVn9FYNv7mzEeKVcBoWoHCa2cJQYxvFS8Kseycc6cwQ+JhaihTaxSrHQPAI/KfQhkZkEo0Z3RbZVu6/tzS9k7mNfcCD4jr9e5PBus/BRgRdAba8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380100; c=relaxed/simple;
	bh=oZlmAGFa7hNWrvp/SOCC7sVhEeZc4PkuN9TAqNbu5vA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b/0tJwsHvHrVsVtSv3Za6NGEqLCV2jsX4uMpTYl+IX+xYWq0hbFOqnXdBHfTtLgKClU8TlpFMN4XP0x0lD59NdZpd6PMzjHIyhxGEdVkI+ccHpehUw5Ds6ChEsO8YTI2ddGeXZqfYcldCySqALA9NP5/2VCyOPvPYyimoI+pJ1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TTVn8rBB; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr8Iz0BlllzxTWWjN0opTGGTGUDwd2sYaeHxEuf+o8YWj1jdh1YWxr9pX3nM22Y0hp8Ubt0H3obKk+8eUuH3hpWalks8yhBZCDCvw0wPmg25RRN0m8AoLMqI21P0W2Klu4vN5S2R8layE8kjIWOTd3hCN+5ze+xX9VY5SXvBPRSwiim1VUQE+ZVosmPKdYFnRa9z0K5c7oEjHx8Kzp26Je+g/4IZrWbNZnVOa7wKny6zMCDZbP5KdGLJwqI0ksfJYDYDksNOii15dQaFCo4NuczIxjEAf9T83zxNAYQUxy0afA0yiYPLJQ28z1kkiy63iyQAr46FpVaSDyfUei1Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+Kwsj6QZhwHc/+l2+oD7/CfOmTSEJbi4ApL2xiwdmk=;
 b=X0Qd39DFim1Lu9i/JQmfJ+zXtAac8unhakZibmoDE3s3v1Uw90nZKlvnFeWK4XS231mBOuSY8qcVoDWbYdrslMrmW1KrMXTIVBsvMuLjjzBJev/hRNyFEfclzptJdeuaqBbBfP+7oeaI4gtP3PBQSAADJDeQy+sMK3YFkmXG09CJ2VHdzhoBAPWmPjxWnNzQagD4QoULfdCz2GA3xwG7vSw3uTDhPXmrYuio8oTTfcSnmIc32Eo4rNB6k53o/3QO+dLl+i9ky7B9dh8ZeVXA4KPXNgh55SoPLvpxfI8hPBAEyZjHP650SfOkBVpVMsZ0WOapB+0f/7ETwSOTG1VIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+Kwsj6QZhwHc/+l2+oD7/CfOmTSEJbi4ApL2xiwdmk=;
 b=TTVn8rBBffvso6TRLXOLXv5G6zDHauwByz1D52pjZ0Y8HH0cPAJ1SSmrWk+ELhYxc4nJrT4uQBQA9VKI/wSuYUhTFGjKt0hwQk6+EivUfx2SEijyRPwmpqTBbxEent/w2LSaOy9iEJjzq0qOe/K9RxXSOAGcCE4G+kBH9N/ki4c=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYWPR01MB11829.jpnprd01.prod.outlook.com (2603:1096:400:400::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 17:08:14 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%6]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 17:08:14 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: Krzysztof Adamski <krzysztof.adamski@nokia.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>
Subject: RE: [PATCH v1 8/8] i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper
Thread-Topic: [PATCH v1 8/8] i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper
Thread-Index: AQHbfWv3NBCDdd7uM062ugk4pqgePbND5lRQ
Date: Wed, 12 Feb 2025 17:08:14 +0000
Message-ID:
 <TYCPR01MB120933A95FDD284DD3BFF0E2FC2FC2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-9-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250212163359.2407327-9-andriy.shevchenko@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYWPR01MB11829:EE_
x-ms-office365-filtering-correlation-id: 1d4a3019-27b0-4b2d-2766-08dd4b87d655
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eyXuOJIf+K5IBx4K6CmH8NxnkWBoMcvbR+ymQD1Eg3RFpw9WYUp9M8kQwScB?=
 =?us-ascii?Q?s1WKOW+Y9Ha0NUiNWl5Jwpz8FK/PIPd2SyGPmF0yogS012c2P1/wXClQNmw5?=
 =?us-ascii?Q?hDBw9TUMOuQtK4bgvemnKGylEjIWWKGpTb9H4HO6G7P/OP6gKmSrqpZBWCh7?=
 =?us-ascii?Q?W714hPCf0odKnix+R2pAepIESPAztaR9/7FNSYULb06s47qKuzsNOXdyqOo5?=
 =?us-ascii?Q?qYA8MNYTW5LP3mJqglJWIg2Er6TxNjG2Ir7sv/L+k0XMuT/x9xwGRMCzxVPR?=
 =?us-ascii?Q?PTrkFEV2MTCKou4NZm+Uae49O+3qoJkvcBKVhXSGFRGZQC9XNAXQ4F/sDdHe?=
 =?us-ascii?Q?mx1gDOJ+IX+pQ0dt/FlZ/lnJ3q3kJt3Z1WdvZlCX3Agtwz7cFeQ7d7lviGX+?=
 =?us-ascii?Q?gI25Y87yTpzPE6sb9APhR/SykId0nQmr2E8mki29ydOEVVbrDR0eiX02E26M?=
 =?us-ascii?Q?Hq0c7ZeoSLqisgx/m4ZuoNooHNVGPIiZMTTsD9klNfjN0oVan+HgxZJY0EAU?=
 =?us-ascii?Q?7sPILIBM54k3z0lPmfLlCR5ijSLvXpKUbDu1UcyIZUamYv4vm1/e/JKGMUNy?=
 =?us-ascii?Q?OB2j4DZWqsnSxJ7W1cDlNuNayaN9/HWkDt+2eZKZ80en8Cr5l0CmOUu59gEW?=
 =?us-ascii?Q?GiS3bCa0NBfKkHLVyWD2ImQXtJk1T1cBsFxsm8WA+AEQej1qN4QG/1UKXik7?=
 =?us-ascii?Q?ZTXnzieoUrxqF3M9JYIXZdzjQCAPDrhOLbqiVlS1XP0A9INmdrXMMU3IRwfb?=
 =?us-ascii?Q?xsj4oEO5ZiL0W6EQ/vd/m5w3NQbxpT9D7Mi16oqRbmzKOrb7r987HgSRUuZX?=
 =?us-ascii?Q?8YI1iJWQ31sQAW21nmoyH/M0cwi47tcvkL0IkVdqr3qncPJIOCX5yBcGV1fc?=
 =?us-ascii?Q?9BGdkzo6xOOGmzQsLunMfZI6hbdp1+HtIGo8UyRG2fJgD+76glgJFV6rV8Um?=
 =?us-ascii?Q?bXMmQ1a2xVnFOvgd3HWINYbfurAQnFxOlf/ISavO4OoZWx+9r0rsIfIOrB5b?=
 =?us-ascii?Q?9meXfzPBIOKVKrBbmuui1rBJuQ0Wf1VloBsu8Ow7rUc1nn3EJfS6UnLjOcl7?=
 =?us-ascii?Q?VyV25T736XWbMQnqGoKY2/rseBn93L0zdj6duH94cWlgGwYIa7mnZpNOhbbA?=
 =?us-ascii?Q?DNeu3CsQEmB+GfU//qvbPY2MWsZkxg4NGWQk40oFrSeqS28n3EjRg3RbOO5P?=
 =?us-ascii?Q?J0QQwcKtZUFzYPuTPvvILuzk/Ue8Niq5PtTY9O27eaICEkm+JdZoyKBMMJTK?=
 =?us-ascii?Q?6eMEKcsyOi6TeRHE3pof0lgSac8v58vECHLcF/jNxARrzS7kl1A3zVugOx+w?=
 =?us-ascii?Q?n5sl7G76Imnzadxol+Ji6EfaGT7dberrJY3gvRZ3EiY341Lw8yURhQjCgjDp?=
 =?us-ascii?Q?pDD7p8aLpM9z0AyK1EOnh3nO1QX8SrKqJNZa/AMs4GmF+2B+61wjSb7DDXRo?=
 =?us-ascii?Q?P3NiKg61OkNziYMnx3p3TXYaBb6m7Ew1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5hOzQ2SUhq2207c3imoxWaw0RRY4qzwIYMNKnxMZFvXw+W7bb2ilPBx1hnkJ?=
 =?us-ascii?Q?Irjq2xTnmhlF1x7P0xEyk5jJhxOb5EYhm0t0TPzEHWI+Wj3MkAZProL0hDF6?=
 =?us-ascii?Q?nBWwyPimdp7PSeMgQiSMF3lCvZleBHhzlPwu4GsMsf4GKJ6hhxR7PIGt0v25?=
 =?us-ascii?Q?2o1a31wWgmOBqqcN2WH7He4QdyneJ0SFNMXQg4halagPLI7uH9k+sUgASk0m?=
 =?us-ascii?Q?P1OPvvlM8wwqYcoQmamtKN8LAhnXiqxQU538WGX8seNHJZflyrNKjV0mCjVZ?=
 =?us-ascii?Q?pIqwLmCCAh7u6hh1tcd7BHNV1nLWcq2QZEXsIVNDG8ZizGsQVuDqjwykGLPm?=
 =?us-ascii?Q?LmKcNts16F0DKnEJWjljpGUiEyyYvjsxxc+diD8vHC2GBqUjgmdyGZnKQ81o?=
 =?us-ascii?Q?PWl48St085oBWjaqCY8zCCTsHNLgWWzJAMD7K+fXvKgZCl4DlCrbS/x3RR91?=
 =?us-ascii?Q?Wvi6UZN2U0XlNLF8rnQk6JMCtuA6rJEdv9zwfhphAX45rgsZ0ej9M5bjzIo/?=
 =?us-ascii?Q?9xKtNKQa2HKJTFb7JfFXFEDCc7iwj6ZZz5FH1gcsGEPK6MTHykeNPxlb1k33?=
 =?us-ascii?Q?eEdF0z/UPGd/SSfrzOPecmy3xZYE8okC3y8ZHS34D6i+0Xh6qrRGDRfArMj+?=
 =?us-ascii?Q?tW7Ul8KA9Lbdmj/XHMRGcYF7b0JJr9L2pTc2tWgjgtLnWrLmfXYuB+b3bw2y?=
 =?us-ascii?Q?1NtFT7CHy+24LfDlYlpW7ZHcDN3Bs1vWVaHPIdjWgBaxlk01MBwwsy7EiBkZ?=
 =?us-ascii?Q?rqn20bJBgqjNSvZPFVWQYrKjV2tPjEHol8KaKzP1Xx0u4a81sRCyTn1PYLfm?=
 =?us-ascii?Q?D0iJ29MFJvWYwOH9szmNJfvYa5j4YvY3ClGuUhTrZbQlnn+GY44ZYymZMMxv?=
 =?us-ascii?Q?h1GrRBH0WPE1w+0srR1swsFUiF8zBars/YDbkWf93QkEWJYdr6RmtLx41+ma?=
 =?us-ascii?Q?qRnYxU7nfYmHBGBBlR4PPPJJ0D81i4f3wpllOa1CFGozHPav0IjrMQV94EK8?=
 =?us-ascii?Q?YX+9nJqD6TEwCjBv2aYOmq1pZkXCFfvdQ6+tF089tRvRay2UVjq1X6EBpR6M?=
 =?us-ascii?Q?vohrukgFCgajM878TfKAEQCdZ9bGbHmxw+I/G9Y0EXSjeCzkqxQ5I6/rHWc/?=
 =?us-ascii?Q?cbdmRgVRyNQzYgUKzwJKAUe3GIIblUvfxWsrWgFS1SOS7TNDEqyu7LMBHB7r?=
 =?us-ascii?Q?Rx0xBcjtj+Aokr73ExTTn+H4SwAcdhpfLCdFD9oRjQ+7vSz+QOz55WDvuiod?=
 =?us-ascii?Q?1Rwf4T6fk+uhznbsGQljEg4nMRK8+gbh01hEzhGsJvq6HdBtu2bkMm8V+Cno?=
 =?us-ascii?Q?Bk9W0oUTJbhCQolzzq0i9HtNwbrA6cnJBNq0k1Mkhmy9133refp6uf/fhN7V?=
 =?us-ascii?Q?cU2jWbza25ecOl3XQZ346UVPLZsTO9fbAof4/0K3VkldqHFaex/JhM8enT5v?=
 =?us-ascii?Q?FoDrvx8WwcPes9C2bKtIemDynPXhkcJihMQRpohexGl7lojdWNwJMyZZ2ICm?=
 =?us-ascii?Q?Sla2xi8hrL25FEoD4hL9/JjA2JxwgoSP4ibxCCLzLqbSWrGyrqjXE6kkS3mr?=
 =?us-ascii?Q?VjYzTIxceIIJ1EGjXTxjiLOuXm7HJQBV0nOfyB/mlrewTl+yQwUjPaQLYN6p?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4a3019-27b0-4b2d-2766-08dd4b87d655
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 17:08:14.4773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNGQCySq8hdy48uk4t7HJ1o9VCCXPHa8hnBpKhbtDET9XjGM1wV3T4fc8zr6xa34s7MHQXThTuGc6UVkrH4tLR4P765GpXTt3AwG1HkoN8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11829

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: 12 February 2025 16:33
> Subject: [PATCH v1 8/8] i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper
>=20
> Use i2c_10bit_addr_from_msg() helper instead of local copy.
> No functional change intended.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/i2c/busses/i2c-rzv2m.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2=
m.c
> index 02b76e24a476..55c5ce3b0f97 100644
> --- a/drivers/i2c/busses/i2c-rzv2m.c
> +++ b/drivers/i2c/busses/i2c-rzv2m.c
> @@ -287,13 +287,9 @@ static int rzv2m_i2c_send_address(struct rzv2m_i2c_p=
riv *priv,
>  	int ret;
>=20
>  	if (msg->flags & I2C_M_TEN) {
> -		/*
> -		 * 10-bit address
> -		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> -		 *   addr_2: addr[7:0]
> -		 */
> -		addr =3D 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7);
> -		addr |=3D !!(msg->flags & I2C_M_RD);
> +		/* 10-bit address */
> +		addr =3D i2c_10bit_addr_from_msg(msg);
> +
>  		/* Send 1st address(extend code) */
>  		ret =3D rzv2m_i2c_write_with_ack(priv, addr);
>  		if (ret)
> --
> 2.45.1.3035.g276e886db78b


