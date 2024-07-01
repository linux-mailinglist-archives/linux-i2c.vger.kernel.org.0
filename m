Return-Path: <linux-i2c+bounces-4563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E391E8D4
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 21:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D0491C21980
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 19:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3F016F914;
	Mon,  1 Jul 2024 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LBlBcGYM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAB16F8F3;
	Mon,  1 Jul 2024 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719863255; cv=fail; b=p8IewT6e6Lv5tZlvwMQQJKAIv/kF5RRNcPDsYyhrVVXfZ+Bk6QlV1x7+SAOWVELifVfm8xHCljU4NBnjiUMMggLw8npd7wT6Au0eHAcfmHsOZmetNjr2LrMEOeYtrAbR2QtzToLd289+z52x8/6uXjHX9sVyX+kCDwDShmnfKtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719863255; c=relaxed/simple;
	bh=whwBicsLIw5g0NDOR2EBA7IvbgZkwEaEMjoSeOk6Gbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QkODcpuu4hUok63PAAoCVxJrbxYEHse117MNzkZqkhD5ITxWt15s70OTJ3PjPv/vwQGnlgJWQ4GMuz1y0X7gQavhaWgEfH1XNWCN0/lFmaVIhlODTunNL5sn7mH3Rc+rj6jsocENZlk7gmQAgJcLBMDPeokozT9JMfwTK59qlc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=LBlBcGYM; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXFeCAQcHwV/+goQF941rAm2aab2l3J3WW9VZSmlAcu1x+jI28DFlU+x1QCyBrqKO6c8Km/70lHwBJlldv2KME3z78+PeE5WiddB014Z0HhuIV6zfxWQnl9d0Z3/B+jY5nRmaFg/iFwEenUR9HJCPgjUZr609x80B4RoyYepViCm+abEbAYUNpaEkW7A4SKn92g3mZQdNjOHL4h9zdBPN+/xuCUG48QMvwlB4JL/nsE+M2TsOtzOec9vTOOeHRDmaAclp/SQF4nZ6BEy9CDLZBYTUsImU5W4PCyJc9hVfDSd9/RrDZYcI2vPGDrGB4fekxPoHei4y6V+niWIIicH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hICCXKtcOQDqUtuANseh1x25+W6S4EmgP9u30nRj+AU=;
 b=DZRu1jU1GO60D/cDlHlunYTBiuGuRp84ZleNHDCloWdc8nAUtzbyQtrxQqyB7AO832Z/QsD8Col1tu7/Q59bMzmxelh/W/B8Q1UqukoHH3aO3w/5C0SeaFgMuQy931m+b3OVE5LEzPLro5xzPjtV5NzQIOu+SRZmeDSwLsTES7mL8Pz9Ql01DsEASRsLP4FtelWJrFuA+YZTEPU0Z4vpai/RcV0GMB40fCuQGM/sqq62TYfC9JLe/wkNKXqSVQSRgKhTaBoQczu5IVfwDSr12OIBKA4874zQsXR0kI1yIXAct10L1G4fFJ6gjSqzlVF+i5T/Utou85D3JKO/ZRI3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hICCXKtcOQDqUtuANseh1x25+W6S4EmgP9u30nRj+AU=;
 b=LBlBcGYMOcH/FlpSDeJ26gJLXFMTohv4ncBHFq8x0t7dL8Zmu6PorbTyYxuqz6tLsxc4xix8XZfNYy/5pgHXnX+RU1urqex3egsJrdup4csNxAToT/tkxt33f3Oucbod/mvC53d9KM6iCOE+o5NpDWRUKYIwi1HRfyEsEnLdIYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8773.eurprd04.prod.outlook.com (2603:10a6:10:2e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 19:47:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 19:47:28 +0000
Date: Mon, 1 Jul 2024 15:47:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [Patch v5 08/12] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
Message-ID: <ZoMHxC7cRN45s0yl@lizhi-Precision-Tower-5810>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
 <20240627150046.258795-9-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627150046.258795-9-piotr.wojtaszczyk@timesys.com>
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: e896c931-a10a-409d-32e5-08dc9a06a382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mw9px1KJGKX0Pln0NxrxQWC3N2WXR+lh1tVqNDSNXGcyAoB+GvecBJBgIQD4?=
 =?us-ascii?Q?R9K3hjw7JYU6zcnKYBKGQpGC90jmlMswm9o+GkIln12kXEavMCXwBv0ByNtD?=
 =?us-ascii?Q?mt0qh+iy3De8OQcanh4D2oxxp1ZaiDp4TvkFNsZC1NI2v+/0JK6GZiEkJMlq?=
 =?us-ascii?Q?aKbLMSF4T5tomQzKqxqBmp6BPrnGD1oRi1JemMASq331mAOSOz52xCW5qJe3?=
 =?us-ascii?Q?WX9eeLGwsdgYLWA9mIt87YFxnK0c/AStIUcanTbTPykVdfgNI9/GwrGEMGcS?=
 =?us-ascii?Q?8DuvqymJtVfMJQ+1pZ5zkHgsdW+tVOrKTSuSPweifGlmOafkcWMtuMCrOnEu?=
 =?us-ascii?Q?7fYtweI5Q6+frQu1g74UFv5MIY5gYJvJguuMEm3Jnir9EPH62sqxFXoI8YhL?=
 =?us-ascii?Q?xk7BxMdyhrpckzF5ex+LVI8g1w624/cTkn3MTt18dIXQ4QKA0IZoVjISQpoF?=
 =?us-ascii?Q?8jQYX2LLbdzCcswdTnTFMGI2W96Ft05d16EXvgNY20qC4bIFHsQnNlCN8KD2?=
 =?us-ascii?Q?rybHFzwzzb8+56E/nBhXz1f4ZqxUgfp7Qg2a2IK3BvvATbgD3lTLRg4IlDgo?=
 =?us-ascii?Q?uriv5foBMkfEBIkn3hABtzPUUQ5zDBxRh6omI2QDsw9QLIc6NJdnvBWx6BCP?=
 =?us-ascii?Q?hjaYmUPPAeGlo+pXO8LaxcoVbsCB3v9Fx5awQjVy9paMxlGBw2iFDOtUnADc?=
 =?us-ascii?Q?0A1Si96180Gfm86JugFX/4DTHHBRQ594CRQWwBvoM/YjigqeZ/LxBuQGS2lT?=
 =?us-ascii?Q?TAufSEIl87Htj5/kZn0a+Fplv3zJ/R7WsidfdR7eXxog3+E1BhoPhr+jlnfP?=
 =?us-ascii?Q?7G2opItSX5+GuEcdxzhj9DsuVzHy+kW11PdtQAO3kqnwx/M4ZiZqBKqYvVwS?=
 =?us-ascii?Q?11K/pA9Wg7ENv3ilkAO7muktpmTsJbzq5B9X4syscRWTmTJkEv2ddPMUgZpv?=
 =?us-ascii?Q?scEoru/8xgG3DUW4bgsCx4yDBZOo48rQe3QGTtlRDwrUxxYk32/3+L5kBM0x?=
 =?us-ascii?Q?OVqm0u7URo6XObErXWYM2WIECk64GT+wLpVOIzoHhyGBXkm+mSQBXa0JxSO+?=
 =?us-ascii?Q?TMmg6FVxe9zXe2WwHUJlCIbA9bLibxIuEatDqxMf5j+Vceg3bAfepifxWDHK?=
 =?us-ascii?Q?me6/SrpBk9Zt2DrszJWyLk+JMfKBx2aQQpX13zky3uRvkv5S1jgJAD45F2Jr?=
 =?us-ascii?Q?zG48IMxGnl62FWjoGir3ARygvXO29hj3uk0Dbem5aHELae32/D3QBArSOvzf?=
 =?us-ascii?Q?lyfK9awYd5H7LLEzy7WyMckedUa20oZg5ZDiB4lw+CsXSr/jqw7JEFp/NWko?=
 =?us-ascii?Q?QzhY67qb6WVQEsm8yKk60VlluDD/puWosZJfZl+qdNgU0fDHFMJV5vXhwnuU?=
 =?us-ascii?Q?MGw87U0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZRiyCfaZqIGJr+j1met8q0fHABGzpLbhEEmcjoG6cSOrbwUKg96dEb1qgB0o?=
 =?us-ascii?Q?Wt/9LfHqiWbR2H2anvTpF+cr1H0V0UvLnNEdZCv4n7yaxN870g80EWesvZZC?=
 =?us-ascii?Q?JoL4E7iKSUvOhw1TrGkpakg4kNsIrUSvjHwEifov4GVuGD65tIT2xT3E/NeH?=
 =?us-ascii?Q?cVkKxC+iXoOuhnVUUtuyWaf4GUoMXkz0qNtCywDMGghqyNSabKmR9N5u935h?=
 =?us-ascii?Q?FffvalAvqoN8JJ0GghEg5C3XAv8g7d95GfJeQRLtSNMaeudbV7dJRwQHL0ox?=
 =?us-ascii?Q?C1W1aaYh3nor1jgxWnQd0JwU7zHG39h5UKRLxgbO07rIhkYIwvJO1Zm22BWc?=
 =?us-ascii?Q?5fA+LHnkpajGsR3MIa7Ac2f2GuQxr3Ipg/8fdB6CCxrzrdpIrTbhuh1Yz17d?=
 =?us-ascii?Q?vTM0ECPh2RUcGiu/N2hkMSbW7I8C33/r2b3j7N5I0O8hWs8oouAZ/yW/V5gF?=
 =?us-ascii?Q?1Uq7zyTgr0e0dhhdmWIuj/U4c1g83dQHRLBlU7BTXVv39KojW5CEh/Agod/0?=
 =?us-ascii?Q?pvgRVdSsaXZN2Nxreg2Q3wH/zEctnJJOksF9z3NhuS0H/jt33sRnnt//GH7F?=
 =?us-ascii?Q?YDqHEZlncclf7v42YkuC60Vxhh67y6+c8ky3aycld29A/koTEZPa/GaYS/eW?=
 =?us-ascii?Q?1ubMk2mjWmopqok9ewnV6PHiuzFZ9B2hqP6mQsqIseB8yDXJ3bmO+e2bqhb0?=
 =?us-ascii?Q?yuw5j1f9OP7ty6iyRox91t1sddNBhUnWSRwXB0kcXNdjBqmrD/dNBLSZJqux?=
 =?us-ascii?Q?QUS2qczBr3nfXyOEb1rRJPG5t01UJbeTfYdMqf7R7Jl/R5gveX3rXJvJQBE0?=
 =?us-ascii?Q?yeE4ZrsUcvLjh+y0PE4M1WzLsMRzeUy1wKCOF+WVdcsWbXrhDTzotOLaW50n?=
 =?us-ascii?Q?uOyCKRXucV7T6W4SXXxb1jfvrWlytiFx32GjCX8M8u6PzlV3lD0oyVVD9EXy?=
 =?us-ascii?Q?q5x9PdGHDB5wnrgEAzoehjXcR2PlVs3wtxM74DDausfxy/GnRRoGjFJpM623?=
 =?us-ascii?Q?BJH2+3pkSQ1nFHIfUTpKU2Krku0pZjudXTIdTP6xOwHHA3bVEF+VRKGkBIbB?=
 =?us-ascii?Q?IQvyE0dRXV9nnfFIydCQBmsuBbYe2Z96MeGmbCApmwFiSVLZP9SKN58YVT2d?=
 =?us-ascii?Q?xLDhnPQedQSfqQTwiI0krF8h400xIJS2VlE737tmD+zrvBFPXFm+LzgXW8rX?=
 =?us-ascii?Q?EcZ/m5WRg53YVGzlH9wdBr+QtB7qio028sfd8Ka0OgbK9LO88FVK8rg5YWgQ?=
 =?us-ascii?Q?OPuTY3uoYRYP1bhnkn6Lt8DjFRbM+7U6hqPY4bA1LPya81KmmMeeP7HbyQVk?=
 =?us-ascii?Q?qYhLWZQIdhAAYhvgI+ouULe2kM7QgiqzVySrd80oI043yey0EU/C7Ay7147N?=
 =?us-ascii?Q?NDCzAJt7CsZp+7LWouqsDMAibbnzeeBqmLsHolsO6+kpUgthgQ9XtX1S5Ul/?=
 =?us-ascii?Q?YcuWc0TODnbt3QG2rsRqe3X6Oohg/hnezNVg03vhBWOq3NfyI3Ks/raOnhe9?=
 =?us-ascii?Q?Zi7+9Nlg0YJTC/ZsgrFuM+smAddrkRWOvk/T6/RMfySZ3taBrs9RRVB7h6qQ?=
 =?us-ascii?Q?1VfL8izdgSjYQA+KPNs2W6RmN9XDSyBSOoJswQ+Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e896c931-a10a-409d-32e5-08dc9a06a382
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:47:28.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9nNFWFnPYhoS9Qb3Ul5Z9yKd75CdzwZtMWYH559ymntNw6aq6QvDnMxLJbVYBDnQiPlQSSIa/urKFWcXkCuXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8773

On Thu, Jun 27, 2024 at 05:00:26PM +0200, Piotr Wojtaszczyk wrote:
> LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer,
                                                       ^^^ through?
I google 'thru', most said it is informal spell of 'through'.

> this driver allows to route a signal request line thru the multiplexer for
> given peripheral.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v5:
> - Fix struct declaration order
> - Removed unused variables
> - Break search loop if expected lpc32xx_muxes[i].signal is found
> 
> Changes for v4:
> - This patch is new in v4
> 
>  MAINTAINERS                  |   1 +
>  drivers/dma/Kconfig          |   9 ++
>  drivers/dma/Makefile         |   1 +
>  drivers/dma/lpc32xx-dmamux.c | 195 +++++++++++++++++++++++++++++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 drivers/dma/lpc32xx-dmamux.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ceec359c68fc..118d48747641 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2404,6 +2404,7 @@ R:	Vladimir Zapolskiy <vz@mleia.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> +F:	drivers/dma/lpc32xx-dmamux.c
>  
>  ARM/Marvell Dove/MV78xx0/Orion SOC support
>  M:	Andrew Lunn <andrew@lunn.ch>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 002a5ec80620..aeace3d7e066 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -378,6 +378,15 @@ config LPC18XX_DMAMUX
>  	  Enable support for DMA on NXP LPC18xx/43xx platforms
>  	  with PL080 and multiplexed DMA request lines.
>  
> +config LPC32XX_DMAMUX
> +	bool "NXP LPC32xx DMA MUX for PL080"
> +	depends on ARCH_LPC32XX || COMPILE_TEST
> +	depends on OF && AMBA_PL08X
> +	select MFD_SYSCON
> +	help
> +	  Support for PL080 multiplexed DMA request lines on
> +	  LPC32XX platrofm.
> +
>  config LS2X_APB_DMA
>  	tristate "Loongson LS2X APB DMA support"
>  	depends on LOONGARCH || COMPILE_TEST
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 802ca916f05f..6f1350b62e7f 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
>  obj-y += idxd/
>  obj-$(CONFIG_K3_DMA) += k3dma.o
>  obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
> +obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
>  obj-$(CONFIG_LS2X_APB_DMA) += ls2x-apb-dma.o
>  obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
>  obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
> diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
> new file mode 100644
> index 000000000000..351d7e23e615
> --- /dev/null
> +++ b/drivers/dma/lpc32xx-dmamux.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright 2024 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
> +//
> +// Based on TI DMA Crossbar driver by:
> +//   Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
> +//   Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#define LPC32XX_SSP_CLK_CTRL 0x78
> +#define LPC32XX_I2S_CLK_CTRL 0x7c
> +
> +struct lpc32xx_dmamux {
> +	int signal;
> +	char *name_sel0;
> +	char *name_sel1;
> +	int muxval;
> +	int muxreg;
> +	int bit;
> +	bool busy;
> +};
> +
> +struct lpc32xx_dmamux_data {
> +	struct dma_router dmarouter;
> +	struct regmap *reg;
> +	spinlock_t lock; /* protects busy status flag */
> +};
> +
> +/* From LPC32x0 User manual "3.2.1 DMA request signals" */
> +static struct lpc32xx_dmamux lpc32xx_muxes[] = {
> +	{
> +		.signal = 3,
> +		.name_sel0 = "spi2-rx-tx",
> +		.name_sel1 = "ssp1-rx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 5,
> +	},
> +	{
> +		.signal = 10,
> +		.name_sel0 = "uart7-rx",
> +		.name_sel1 = "i2s1-dma1",
> +		.muxreg = LPC32XX_I2S_CLK_CTRL,
> +		.bit = 4,
> +	},
> +	{
> +		.signal = 11,
> +		.name_sel0 = "spi1-rx-tx",
> +		.name_sel1 = "ssp1-tx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 4,
> +	},
> +	{
> +		.signal = 14,
> +		.name_sel0 = "none",
> +		.name_sel1 = "ssp0-rx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 3,
> +	},
> +	{
> +		.signal = 15,
> +		.name_sel0 = "none",
> +		.name_sel1 = "ssp0-tx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 2,
> +	},
> +};
> +
> +static void lpc32xx_dmamux_release(struct device *dev, void *route_data)
> +{
> +	struct lpc32xx_dmamux_data *dmamux = dev_get_drvdata(dev);
> +	struct lpc32xx_dmamux *mux = route_data;
> +
> +	dev_dbg(dev, "releasing dma request signal %d routed to %s\n",
> +		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
> +
> +	guard(spinlock)(&dmamux->lock);
> +
> +	mux->busy = false;
> +}
> +
> +static void *lpc32xx_dmamux_reserve(struct of_phandle_args *dma_spec,
> +				    struct of_dma *ofdma)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> +	struct device *dev = &pdev->dev;
> +	struct lpc32xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	struct lpc32xx_dmamux *mux = NULL;
> +	int i;

It'd better keep reverse christmas tree order.

> +
> +	if (dma_spec->args_count != 3) {
> +		dev_err(&pdev->dev, "invalid number of dma mux args\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(lpc32xx_muxes); i++) {
> +		if (lpc32xx_muxes[i].signal == dma_spec->args[0]) {
> +			mux = &lpc32xx_muxes[i];
> +			break;
> +		}
> +	}

Add empty line here.

> +	if (!mux) {
> +		dev_err(&pdev->dev, "invalid mux request number: %d\n",
> +			dma_spec->args[0]);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (dma_spec->args[2] > 1) {
> +		dev_err(&pdev->dev, "invalid dma mux value: %d\n",
> +			dma_spec->args[1]);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* The of_node_put() will be done in the core for the node */
> +	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
> +	if (!dma_spec->np) {
> +		dev_err(&pdev->dev, "can't get dma master\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	spin_lock_irqsave(&dmamux->lock, flags);

you already use guard in lpc32xx_dmamux_release().
here is better place to use guard also.

because it spin lock, better use scoped_guard() {}.

> +	if (mux->busy) {
> +		spin_unlock_irqrestore(&dmamux->lock, flags);
> +		dev_err(dev, "dma request signal %d busy, routed to %s\n",
> +			mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
> +		of_node_put(dma_spec->np);
> +		return ERR_PTR(-EBUSY);
> +	}
> +
> +	mux->busy = true;
> +	mux->muxval = dma_spec->args[2] ? BIT(mux->bit) : 0;
> +
> +	regmap_update_bits(dmamux->reg, mux->muxreg, BIT(mux->bit), mux->muxval);
> +	spin_unlock_irqrestore(&dmamux->lock, flags);
> +
> +	dma_spec->args[2] = 0;
> +	dma_spec->args_count = 2;

Why need update dma_spec here? Suppose it just pass down dt information. 

> +
> +	dev_dbg(dev, "dma request signal %d routed to %s\n",
> +		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
> +
> +	return mux;
> +}
> +
> +static int lpc32xx_dmamux_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct lpc32xx_dmamux_data *dmamux;
> +
> +	dmamux = devm_kzalloc(&pdev->dev, sizeof(*dmamux), GFP_KERNEL);
> +	if (!dmamux)
> +		return -ENOMEM;
> +
> +	dmamux->reg = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(dmamux->reg)) {
> +		dev_err(&pdev->dev, "syscon lookup failed\n");
> +		return PTR_ERR(dmamux->reg);
> +	}
> +
> +	spin_lock_init(&dmamux->lock);
> +	platform_set_drvdata(pdev, dmamux);
> +	dmamux->dmarouter.dev = &pdev->dev;
> +	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
> +
> +	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
> +				      &dmamux->dmarouter);
> +}
> +
> +static const struct of_device_id lpc32xx_dmamux_match[] = {
> +	{ .compatible = "nxp,lpc3220-dmamux" },
> +	{},
> +};
> +
> +static struct platform_driver lpc32xx_dmamux_driver = {
> +	.probe	= lpc32xx_dmamux_probe,
> +	.driver = {
> +		.name = "lpc32xx-dmamux",
> +		.of_match_table = lpc32xx_dmamux_match,
> +	},
> +};
> +
> +static int __init lpc32xx_dmamux_init(void)
> +{
> +	return platform_driver_register(&lpc32xx_dmamux_driver);
> +}
> +arch_initcall(lpc32xx_dmamux_init);
> -- 
> 2.25.1
> 

