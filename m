Return-Path: <linux-i2c+bounces-14386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E8BCA1CE0
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 23:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35203008FAD
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 22:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B752DD5E2;
	Wed,  3 Dec 2025 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nKDlYwJA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E12D6E53;
	Wed,  3 Dec 2025 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800395; cv=fail; b=lE1JjXMRU4BCJofuW0NkNtW0Y+hsKqQlANSfYDoLoYy6JOqr7NFfJyMent4qkOlBnkoXWEYKJCnfjdQUpdIsBG+hGsxYqrUOmsnMBzoH8RJ2D4iF7EPUNwHL8YWOK8vWuSADKJcC7deXNM3HxWkDciioqOUj0GiLsQzRwg++OF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800395; c=relaxed/simple;
	bh=An0his4mUmE0EBrhiPx1jmEuI5u+1wNuFhVpPuc6EuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AyTdWDMdlmYEWDwmDiKdYpC7zTqUc1qfWBYG91GcWZ3+dCs6tFnwx+5IqY09r2LcyV3hAwItvIfMDsoA05+CKKb9KAWm4vfN8Xn75wJbDW9IHeseRw1raIzj5eWRv4+MlE+jceHgx2APUGe9L5xSdMBoU3gpOm/Qj9ty75KwFso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nKDlYwJA; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAfi2AOPPcMZuwOWj7fN29eE9QIoWYp1rRm+FfCTDRlXLoXFflpdu6/g+Mag5m1MSsIxy8vn4zSMjZzDxb93vQGj/vRGffIXkSBqhATUTqG6mFbebWnBfD2XBGczDoPthHSAeR6xVyao4y2UAl7twAxstIkBb4/b1/B+Jfad5VTlo6ebIOcvVk/3heMNi4A3Sw2R7v2M5v0bCnZw20wbrP2Tn9hEOiAfatiSVO4WPeOt9OJXM4K50soORAIbper1qsvTZ1MqcIr2lJS1NV8CWlGy9ptYcGY4aOXKdMCl6LSO9Bn0MCXOy1Nhvh1DLFW4jBrIalO9iWKOtvtgIvK9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfSB0bE+TvKTIeng+gQoImiUEBoOQSFNzHz+8HIASGQ=;
 b=vYMGQtynu4rvb/3EDeb3QfegHCRJ9d7nY2AkyR8moY5w+/+1IQNBTVegTK8RkrX1+GLy8J9OrpFq/OK5haHzK4AM2z0fcLAD6eWbI8RnsvEzrwbFhnUZSb6HUR5jrLBkClyJGhEGpUEOe24k6zwu6oTVkOlfxOlp6A07YbhHRkhM1tAIBtYRYp4olL7AT+hURIQR4WtyKJj299VUOaIWKFWxoOUfZYlssWatTv7PXrmc6dtyUnQ11tF/BrqjPcmq8mbyug17YK47FZrO+KQJM1xXeUmCxjK4BWDQ82az6JtNyb/RADeJBO+q/94zXnnBo/UujWeIHfXdetxjz41kGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfSB0bE+TvKTIeng+gQoImiUEBoOQSFNzHz+8HIASGQ=;
 b=nKDlYwJAYm58vBiUX+HkGKWANdJip3gIEbnVFGlaaxXbfORI/SvnrOzQ/falFBWXbp8cRMaIFeNyoLWErl1sXUSj9EsBpRHJ3esQdtj6sFZYMmBbCa+58LtN8fiCisR6WQzNAGddTtK8UuKEaVzpaomXIw32SU0wpZ/AUjeOhNeZdPwXtQGz4hsiO5eBDN0uqFU2Xjjev/YYKltz+HaQzy57ikL/1FF19ibOu5AWq3vne3VjjKnCTX84BbSRnSyBluOVBoEzuzn+9lxqMlpLmsQrgXZhqon0RQhcIBOyf9gqi1j3JZDTQi98/qOCxSS3RZSG5rx8BAqBtBF1+jrzPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DBAPR04MB7238.eurprd04.prod.outlook.com (2603:10a6:10:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 22:19:50 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 22:19:50 +0000
Date: Wed, 3 Dec 2025 17:19:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
Message-ID: <aTC3fly+fFU5hB2q@lizhi-Precision-Tower-5810>
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
X-ClientProxiedBy: PH0PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:510:5::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DBAPR04MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2050ba-a83f-44e8-1aa1-08de32ba132e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MbtY1JOId/OzEnosetGw5KCfJLFLEN+5lhRRrdgyLETDmzuUoZGMmxYjL4ny?=
 =?us-ascii?Q?uhlGZbuKlX3ZHqBrsXJDJlvYvs+CcBHAcdvCSGPAaajhQjefeWnwe9o/KvJH?=
 =?us-ascii?Q?Y58+9El0tmuHE/xs9XRJbuB8CLAST9kSb+lUTSONoBbkoOvLLp3Nm54QU7Au?=
 =?us-ascii?Q?k80Gkz9Hh4GT6Oz8G+6zkxyN+8bguokCXsDPOuSUyZeuVjHk4sE7Jz3+T7mU?=
 =?us-ascii?Q?dZzhoM3E4muieAnFe2Si9jjDhJpjj1h3CeptGRyh3tNmB9jJKyMt0cd3Cr9h?=
 =?us-ascii?Q?GIypsyh0OsfWLfCp6iwy7EdkI1iCKwaaHz6xqcVgAw/yn246haLCEWT0VjbC?=
 =?us-ascii?Q?DNyywChL54OEcx68F4a6sbggRXpPIEJcjtcOE6ozSunr6X8sIf3uaGk6nIOY?=
 =?us-ascii?Q?VIujDCNZOmodiZIvB9+7z1fdScHqihsb09uc6h3gO66E9kV4qnJaOr60y0/l?=
 =?us-ascii?Q?sKDyspFe+hbef4+Vgy0v4hUqZH+a160u/v9q1d78ZEPpNbyetIn3lw7sHZOE?=
 =?us-ascii?Q?/3oYY6biIl3ZXLjZzcIJqYESt625n/B4WnQ6Xab46zs80Z3GTMu/gFHfz1DM?=
 =?us-ascii?Q?+c1HcWJFStHKGHsE34idQ9VQ1tdBT0ZoWdHzvuHGnQR70DEVPvTjksydE7oR?=
 =?us-ascii?Q?CDvwWAX/QPLcTOoD/p/eUgHmgpDxjulufnk/ih+gpDyZtoE3czsC8BDNMr1z?=
 =?us-ascii?Q?AMYdje3Kvpd/qOI17XqBK42zC4d40s/j8W0qhoLCtfJ2HPB4yuDSCuo5ayTA?=
 =?us-ascii?Q?eF6JVK5DAYRLktH5Q4hvGUong63oZO5se1GKcns2Clf7ubO3ZxeSCu3Og3NM?=
 =?us-ascii?Q?55DFNnqFbVBDWEQ+0rjAQZdvw/YfY1Cq6Dd2co1nX7a1SMdLMLyeKT7LGJ8/?=
 =?us-ascii?Q?RlUjvaUqU35r1ztY52zWg5z4t8qzYbT5p+a/fNUpTciTxAw+4HhgLKy7GIrW?=
 =?us-ascii?Q?YYQeJyIEeXf3fXmYkLdrZ6DQp2V0inNfoQrR9oAJobS7G8QY7hbE9e3LpDAj?=
 =?us-ascii?Q?elgQnYHBZ+XdTrycrkgo/QlOSbPkqwbWvYaNgZkXhjwksiBFqz8C441CurxG?=
 =?us-ascii?Q?pAo7YFaVOEZ6AQxAXQwFSNhzUfA3AyBAULgT7kt3GvryYxfuDExHxHvhb6rZ?=
 =?us-ascii?Q?MW4MpMH17NO5mq3GFHDxQjGUtMzQT1vjT4/VEVk9Qg3uEnIy+CBvDSTvasZ9?=
 =?us-ascii?Q?GIm49WZRltjjw4yrpVBPS/gC1e784r3FV3DAtuSNx8ToXgMi62HN/9vER/X4?=
 =?us-ascii?Q?N+YaKRcYcW32fdwJ75YrCoLrZl90BPjBaW6UoHPobLDeC3bffxuuJloFydTh?=
 =?us-ascii?Q?T2Ts8Z2loYfEUqxza+IjgwjUrB0UXWk/4HifnkmnTZYANCcZuu0MThY56VpK?=
 =?us-ascii?Q?Aq3xIFNZv8+dX6DDoASN5hs0DkGasMVEOQpM9XAyJB88emVJF5xV2hf0KUo9?=
 =?us-ascii?Q?zAYUApQMT1KATJrucjLlyN/IDlKON3h+Zz5T9gxWXxenl+RbDFNdNTJQwGLV?=
 =?us-ascii?Q?0jEU5zCJ1MspqMH/k67cJ3/eZijyfG5tQ3/r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Hwt9+Xv9gO/jxrhE1nX/CEuEp64rBQiz2s9vezhocC/zUh02RYi9HAd0Pgx?=
 =?us-ascii?Q?hJR1TiWgSsHliatRdCZA8lpKuS3vMOh3tQrcQfwkeVH8LAdCI+hkIYOtBYgI?=
 =?us-ascii?Q?2nuiTJeu+2mkqdOYehcj3IDiGBP0ADikTuvX19WN2vBaWe9EUHROm9tOd6L5?=
 =?us-ascii?Q?eAE2p2Uws0wCz99lDZTmY1io2v0ZUwYXXZmMcwfWZO0dYWVY5iV+we0Cn1ef?=
 =?us-ascii?Q?ur/H8cEpOjfDuAD6IYE8P9vQss8Xim5+ODOhQH6E7QpnU4wsQIgsG9jewVNH?=
 =?us-ascii?Q?5Xo2pTAtguCetga3Hq61nnSs4FCjggx5oIKhub/Op70FvWd/pfri3WJKFQtA?=
 =?us-ascii?Q?3AncW367TNW25Nzoq3QQXvEHb/BftrNteQesL86fEhJ9I7jya2KN2rCKRMJ1?=
 =?us-ascii?Q?jOAXMaYf+4phvmsNVbscflLv+EM0OT2v83+7XOGsu7LW0TvwgSVdPvgMzkFf?=
 =?us-ascii?Q?lYECawUJ4JpFe955kI6qfslOiW2IlBhd776EXXFBOpN2XhklVlK/bPEgt1gR?=
 =?us-ascii?Q?2i2S7A8ZhwHPvxQoZUM9x9W+FD0HxVsMNSoyBZFsKavL07Mrcj8QIK19ORNp?=
 =?us-ascii?Q?LxeueBRjcfpAkqHJfyouk05OArqis+B45ETUtAEkaKX8URDKkWpWTd/phpIH?=
 =?us-ascii?Q?sOp3Bblale7pwwDyB9v78W7Le3yfK+loQGXb27HH3uqlE6XXwUeIlTwP23JN?=
 =?us-ascii?Q?CsbT9a21umtXo40dtpcHIpcdK3k8AcPn9+LlZ/Ah2IDzg9QpGpy1B/tajDuq?=
 =?us-ascii?Q?PaM6ZMMIlf71wFqkjQa+ziVtPnAYnAIMJcL0fOYGhSbZqf5YoJGufg2pwCKI?=
 =?us-ascii?Q?wg5/RKnvVJffVTfy9KJ8LyU0aXytbqeeD0mgrrGnWwBw81fupWDyRaJ7Th11?=
 =?us-ascii?Q?5+SNauO2dxdsL1L6lLxakuGI4ywLG/0gfiNwZHLUvG6meK9bMo8F0i4Iru1N?=
 =?us-ascii?Q?YnTB1YGNgDJWpqrNcL78Yrq3XWlQtNhYvM+2UJP4+54C1gKdkPztaHvGpfop?=
 =?us-ascii?Q?B6K800ymcF5/uONxav/tcRY0JnNqHjem8REmBFZJBXkYq8wqoizkck3bxQRF?=
 =?us-ascii?Q?5zXcVnCusqPOzDP8cILsQ1Xiqc0PY+HkFStUfq6xiZQolj5vFGtWVgWlvshA?=
 =?us-ascii?Q?KiDAZBJV47pyNnGRZO432zmUDLmLijryAzTft792Hz8bAXRCafZVGKADt4Fx?=
 =?us-ascii?Q?pfdbBwck6bL1G7S1KSSl80cw+B07mekAAq6q6b91Cj9PFEp1eofSGmahOYjZ?=
 =?us-ascii?Q?1PXh7fUrHQ22jlubTIl3GD0cmcHWpVVVD9iDWISCHoYR0oyCj1xT4/XucW05?=
 =?us-ascii?Q?f7BVWYot+jqjTxINsbpQnH6TRIZUSJo5KuRLwj0K4IukGR8gUahyEmZFj6j6?=
 =?us-ascii?Q?frARhH716Rc+nKZekEbls5l+9+jV5NBLAozRNi82S5Mu8eGsxRMMBNZgyYDY?=
 =?us-ascii?Q?jgv2tNw0XoXdviQSkEmbaUjeTI4EIV6xGB6cwdlz96MNpYv6EGaKV8zh+8EL?=
 =?us-ascii?Q?gB+O5Up4B6m/Rno5WN+dyhS1lR90z1QQVzaH9kYQ8zHEMC/8Tg4Z3emOh0dd?=
 =?us-ascii?Q?fKZxmuFArpoY4vitxBS+iPn15B3zjqYy1ZObayv1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2050ba-a83f-44e8-1aa1-08de32ba132e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 22:19:50.1468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9Pv2S2Q01SYtttxlZAIAP3ySmxTuZOes8unG2BXAZUqDXhNNXgBiBIDG3RJ1WRP2gIAR40dJW62ZiUPoiB/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7238

On Fri, Oct 03, 2025 at 12:26:49PM -0400, Frank Li wrote:
> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
> cleanup and simplify error handling.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Vinod Koul:

	Do you have chance to check this one, 3 month passed. Is it missed
at your review queue?

Frank

> Check patch report exceed 100 chars, but it's still better put into one
> line to keep consistent with other DEFINE_FREE and better readablity
>
> change in v2
> - remove surpoiouse remove empty line
> ---
>  include/linux/dmaengine.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -5,6 +5,7 @@
>  #ifndef LINUX_DMAENGINE_H
>  #define LINUX_DMAENGINE_H
>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/uio.h>
> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
>  	return desc->desc_free(desc);
>  }
>
> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
> +
>  /* --- DMA device --- */
>
>  int dma_async_device_register(struct dma_device *device);
>
> --
> 2.34.1
>

