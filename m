Return-Path: <linux-i2c+bounces-7764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B839BBA7A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 17:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE851F2162C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 16:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25D1C232D;
	Mon,  4 Nov 2024 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KB5680sQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8F616C695;
	Mon,  4 Nov 2024 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730738563; cv=fail; b=ORFXRsFBHu3urPpVp5pDy9h6o7v6cza9ryJzytxzY/c9TmtBZZjdboqfTzec7fYmlWiy9MGB2kulrYJWoQdeLBS7vBqwU1KnDuFoCyrePItWbLPr+Q30j+aOq+LO4tuIttDyYsh7cdnbEcDAhrmx4hOAjtpytjNm5aVVbheyYTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730738563; c=relaxed/simple;
	bh=q4SiRpvs6zREKBbollzx2p/mdg52JBJ47ydvff9B5iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=upp+HvGKpCBK2IOgcKXsHd6JHcH0rD1UGH3UdtDAWsAUysgTLph5KINL95l4FCovxqEbipsDCkUIldaNkkHnAYjG9nqAwvpVau82GHBwLlktyPp8m5NfNJIYSxMumm/j0j3Zgg0YpocEin0zdM/C/MrQNnHdybPVX/XUaURLBS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KB5680sQ; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX4IOaSj+s8t1fAa3AQap3KWT9LSjBS05Fo7C+/JNtg+FthLufgwzizxNwCkE1uEii8veOpJxkAdce/a3FrP4NQN7Z+Hr1BEzSCKw/xE/63kJGt7hMiXbvzza/K0Or+oV3qOoJRJIzyXbOpOedW5mpqbiG/0AoTSJkqyI8V3OEdwSa9nUAkn8w7MUxONZR7uUs1S2upmS4KOp0W8z5ygVJ168R9ykg9HDFhe4+gD1ViXGyi9LeW9SrZxgQvH8Lp1/kq7Ie+BaZQ/sXCFyoJCn8bDJVFCADNoAMjJ70TgWWDjE+HXM8EYcX6p6W5GuqeGJT/dPpX9vS7SrawPKTgndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dchde/jxDoecO4LUw0isprJhPEGzUuCOINM5/tHZ1pU=;
 b=I7Hk6JVRaRzcj+LFbbUZGmfGkA/hwMIbIH+gIgHMkia7S6mD6s7YwUsQJIXlTHC6sRoElqnPnkdMUkQ+zVcpCuqe1Ao009IVNGnbGmW5KYUegfQRiZtp7ZKqxP4M2cXTMH5K7iXuXBz8mqOg7TUfJ+E++0FckyGaJlCjkk3gkWOBNtZLIomM2hTUkMKEiMBseEjrBhmeWOBdVt86s2JIdeTFNHNT6N3t4yFObien2J1PRfwoaXMygiyLRx5gCc635n6yVZ/OnaV0N7KSxBoCggfqfyQojXFAVsYRyflffOpU/+xNUadXDLOC38GtvIbskroVAXfByAdWtr9vJ8NqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dchde/jxDoecO4LUw0isprJhPEGzUuCOINM5/tHZ1pU=;
 b=KB5680sQHt9v3x3zRiqpd9ucR0IKOFdcvNRDrAMHwLBAopeJ8Sz+MrYjarjcj1CMce5h+JCQn7ClvkYLPDv4vNxCGWYL9HMfgj20ICgUFcbflt5S3At13Br+S7LMBhxqUJawmmoGfPM91lSlDKdjcwL/HTYSEUn+bn+D3T7u7obpK/sOETm/e7asxZrblonJTnemQ8Z90DMsZrMt8tPdcglXFrc7l9wZDo4YR9KIlbo1WG2D02MNEXyU/S45vrS+0qUFzS28Qpiku8icHw7WP+c6J3CZORufaVZZbtV2455Dl+uMcD0zTGyCjS9tzChOIjf9PbFQc8pDyZQ3osiNOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8301.eurprd04.prod.outlook.com (2603:10a6:102:1c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 16:42:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 16:42:37 +0000
Date: Mon, 4 Nov 2024 11:42:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: Re: [PATCH 2/2] i2c: imx: add support for S32G2/S32G3 SoCs
Message-ID: <Zyj5dKghdbTysRFo@lizhi-Precision-Tower-5810>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
 <20241104100044.3634076-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104100044.3634076-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c6b580-92f7-4651-8142-08dcfcefb0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ekpEeZJVh/BK/6doURJfga+jOr3V7b3uwvY3Qy3/rQb9cP/ZsZoe2yE3fWIw?=
 =?us-ascii?Q?4Ks6McdMT1U1hNOF0gzI3AU+jZXrR66uApi7cZko2ECxAsz1W9xSx7R3pWZy?=
 =?us-ascii?Q?SHLAas9xQNtN6TLBMsHO3gvtkPkSZl2+Ni7gJ2Adjiy+67ILqD4nK7FzOAgc?=
 =?us-ascii?Q?ZBXBIh2zAtkCxV4nOGTlnEiX8tv7lI+V4Js3zehcrx4Tb2aiwZC4ia8ocRYL?=
 =?us-ascii?Q?TP6EVy44Lg0tqRPOSIhezww7gspRnFYwjWdDKloyz5RvmIvdvVHNsrsA+0Vd?=
 =?us-ascii?Q?Xy3JZxFSJQ2o2qbOauECgfNR1fakFJTGdj5Jahf9c4K398rhhSvXBSMa24SJ?=
 =?us-ascii?Q?ipQGe72A+9Ajc9mNdNVRVIphirRjeAkqgyrpyhl80m5tguPQ+Tt5COq0LX6y?=
 =?us-ascii?Q?XkJTHMj8H+Rh0bB0EAoQS4irUA6qeszxTUwYg+oRrqdqZJfTbwTw9Ew1CJJt?=
 =?us-ascii?Q?Klo5qrMart+d8Rep1twhKadEJ7U7xR8DO8i8fBHnx25N8C4a4Z2abvLS1qSy?=
 =?us-ascii?Q?qbdrq6iW+Cz/tFqhceJcS/sdMyJV6SPrIOpUl4t8R7xm36nQhGB16qS8fY6X?=
 =?us-ascii?Q?ev7Lq5jApqwIiouUEtC+x2UqYUr3lQ9qEcdnWNMH6eEJmHz/atEj7ysHdmly?=
 =?us-ascii?Q?DetvQibeKtzVkspzzMBataY0xzuSCGlDh8Hr2PPKyhc0PCi3/4HXgc7UvQn5?=
 =?us-ascii?Q?vPiryx2A5DA6ie0nz6OC7LaKdIWIgrLCOIK52agOI4yZ7cEL8dxSXBkoTxi7?=
 =?us-ascii?Q?PNZoVfKjLvAFdPAQF/bjg2uGcZ2HxeP+IhMFQI8hbWwGUXX1o4MkJFCOr1Zi?=
 =?us-ascii?Q?8Yi/vN7qV4A0w8y/bQyBLpqV7kegq/ObEtS8vzZFnZAdxn/kVd5akmyXJ/SV?=
 =?us-ascii?Q?8UGb8NJENFL7L5jvwkLdVCdt9XhHgpptXNMCrBexb5U+kVUBOTckl06+4I47?=
 =?us-ascii?Q?Y0MAkIzwUcnFX3z2fazJ0ebZkS6Ubt2YfV6cE6P7f47wopj9rEXKSFIHHYfK?=
 =?us-ascii?Q?PZbxeihy4tty6dcJQAinrCxOIb2JRDymGRPr8LVwj9Tb6VdSK1GYsQChWDMs?=
 =?us-ascii?Q?vKY9TfdszXsX/6Bn/yqucBKCh8JcNeQCgOklGKgBwi0Lmez7SLQSf23aMdVj?=
 =?us-ascii?Q?QNT5a2Mah3zsJs8uqKpNiMQ+iB9/oBCa+brcxcat99VqakYJbkRVS2clJS9T?=
 =?us-ascii?Q?eB1lhp78H7PV4LMcTTULs64AkO+vGacylS+/X7l5dDvmteXdUWpk3XVVQEnV?=
 =?us-ascii?Q?f8CndrJcPGJPWRg/Tvyz9qSjiYXP/y8H/AMkvu/jFMCkKEvsbNOfHu64dSOQ?=
 =?us-ascii?Q?0u6ZCjtvyZWhOC999a0UC+HC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QqJQ2oiZtorsl4EH9cq2SRxoEw6VeyDlsqZAwRxxTOc7xHLzxiVGa5da1QUr?=
 =?us-ascii?Q?4BAY3TV/2gXgXCaljmnblsBvc93RBMtisn1yJBsRffEyWcoJ4oTGXpYUImTj?=
 =?us-ascii?Q?DWMld9WPnGQn6bj0IdZIVrFyxHvRiQJUiOTAfai5nRst9BgcyhDyCjiu832s?=
 =?us-ascii?Q?WkFeHhBc4Pi0bDRefeMz4Zg3v6kmfDPhNIeIlVIFdbcyaJ4so20FWZOClGSl?=
 =?us-ascii?Q?0VZuq8kGzsYWNsBjbi3U39AR8nZopYgxV77cmIfZOVd3/BQSswFFPIhNVtAp?=
 =?us-ascii?Q?vtJve4YzzfSRazsclBdKUfrmD1wT4WpZojQC2b+eXDOY+WfUQR6gRvJg4TNW?=
 =?us-ascii?Q?ldTSj6LX0sC8on8JTtINeTuMUrs2lseoqHkl7nM6xeTQYYUDAQP9tyzR0OaZ?=
 =?us-ascii?Q?ttxgsNVeHdvBreEAYScxE+vdd80Xu7GwbqQym250DnD/HsPz8+pWkOw7tqsN?=
 =?us-ascii?Q?nLDsgxdHVEVtbKfRoOu7ex2xd35YshOKEDm+ZiqiR6IOFty6syCouAmF7V6x?=
 =?us-ascii?Q?zi76NOW8xXrG7twkOoS5rXHqQ5jlhFbPaTN9EutFze/zW4egxj8c5jefg50A?=
 =?us-ascii?Q?jYxrjTlNl0FFlU8KxNrnnDa2sryZ/IgfuKS5ciMmj+ZWUrrGZf+YeQE3Hw9y?=
 =?us-ascii?Q?vPkkwrekqyMfb50soYDu/fbllhq8iYEGngTUgapYzbYEX9MTHWs82JYLbXED?=
 =?us-ascii?Q?m868C1tEwsUWRLyBDOi6q3s5tiVmAs6u7SZDS2FMKN0xmIkwBO/OStLD0wb4?=
 =?us-ascii?Q?torIz4n3ZTAHpgutX/mzWl+nzQSIBOpplxvFjSnGX8gOgSUPDIil/KxPPpMq?=
 =?us-ascii?Q?hztLrHfqSQa4V5fIeunhWqJEi/vqjqjpEAHoGSdst6f7PuqWNoML9HbAaekr?=
 =?us-ascii?Q?6EWmwiff2BuQKkEeYcCh8nRPMXSNj+4sIJ4p4pahDESniIglcnw4thpKak7Q?=
 =?us-ascii?Q?6+scz3cwqONvGIMG+J7QnB3GDA+8jC5Xvdk4IrDZ+KVafFLjYYGo7m6LXkzA?=
 =?us-ascii?Q?65KFOElAISPUyt1cKUmMVOCN4U9D5frsbO4y29IatjQeVb/14V40kog1tTkm?=
 =?us-ascii?Q?8imz1xv9G68uXEF/TGu+y5q+6EeXTUkAios5TF3PEPlcsUBY4orbDRhXKk+a?=
 =?us-ascii?Q?YpwDkxSYfajUDwJxBS2gRv3TvU58ksVqCCPAhVGC6AemTqw631y7z6Q3x4P6?=
 =?us-ascii?Q?gpH77HQvEr7NX8gTwKlS6BRgmy8c+l+Ts/avf8EiBgvhWsxNmDQFwGDt+zdU?=
 =?us-ascii?Q?W5FElxkMpWi6Jd9GII4hOJ+NjKqg+mAIoc/WO9QWibILuxVikQicFWJxwbNg?=
 =?us-ascii?Q?4+optfVWDxXK8SbmaAtSmNVpXNqBqAq+fs60fUQ26jlds/uUahKPXj/UXjxu?=
 =?us-ascii?Q?gOH3ihq7IjiLr9y1q2Jv8I0UF/EIYVstQytNCAvdeP68J4ECbDPKL1PdFPQU?=
 =?us-ascii?Q?pQJQKad6qiDiTCojOpQuTyfokX4Xnwqb3JRW+GRLEpXYQTlDm+UIOwhAmZT3?=
 =?us-ascii?Q?5HpDPz2OT6mS6copMqzKPpiGrjxwPz/+zc1EaQceG484UXjc1w1lM+txhv40?=
 =?us-ascii?Q?chIFaJtod/ErXxv/9Pc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6b580-92f7-4651-8142-08dcfcefb0be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:42:37.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKumvwOvIetKwS1vsn/1CI/kZO27WjATQYsnI9qJEV6wON0I0oxjwMxj9o87+7iY2ypZGfXXDlRkxNDCiOYKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8301

On Mon, Nov 04, 2024 at 12:00:44PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Some S32G2/S32G3 SoC I2C particularities exist
> such as different <clock divider, register value> pairs.
> Those are addressed by adding specific S32G2 and S32G3
> compatible strings.

Add S32G2 and S32G3 support. The I2C in S32G2/S32G3 have different
<clock divider, register value> pairs.

with fix below nit:

Reviewed-by: Frank Li <Frank.Li@nxp.com
>
>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/i2c/busses/Kconfig   |  7 ++++---
>  drivers/i2c/busses/i2c-imx.c | 37 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6b3ba7e5723a..45ea214e4b0e 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -741,13 +741,14 @@ config I2C_IMG
>
>  config I2C_IMX
>  	tristate "IMX I2C interface"
> -	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE || COMPILE_TEST
> +	depends on ARCH_MXC || ARCH_LAYERSCAPE || ARCH_S32 || COLDFIRE \
> +		|| COMPILE_TEST
>  	select I2C_SLAVE
>  	help
>  	  Say Y here if you want to use the IIC bus controller on
> -	  the Freescale i.MX/MXC, Layerscape or ColdFire processors.
> +	  the Freescale i.MX/MXC/S32G, Layerscape or ColdFire processors.
>
> -	  This driver can also be built as a module.  If so, the module
> +	  This driver can also be built as a module. If so, the module
>  	  will be called i2c-imx.
>
>  config I2C_IMX_LPI2C
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 98539313cbc9..3509c37c89ab 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -17,7 +17,7 @@
>   *	Copyright (C) 2008 Darius Augulis <darius.augulis at teltonika.lt>
>   *
>   *	Copyright 2013 Freescale Semiconductor, Inc.
> - *	Copyright 2020 NXP
> + *	Copyright 2020, 2024 NXP
>   *
>   */
>
> @@ -84,6 +84,7 @@
>
>  #define IMX_I2C_REGSHIFT	2
>  #define VF610_I2C_REGSHIFT	0
> +#define S32G_I2C_REGSHIFT	0
>
>  /* Bits of IMX I2C registers */
>  #define I2SR_RXAK	0x01
> @@ -165,10 +166,35 @@ static struct imx_i2c_clk_pair vf610_i2c_clk_div[] = {
>  	{ 3840, 0x3F }, { 4096, 0x7B }, { 5120, 0x7D }, { 6144, 0x7E },
>  };
>
> +/* S32G2/S32G3 clock divider, register value pairs */
> +static struct imx_i2c_clk_pair s32g2_i2c_clk_div[] = {
> +	{ 34,    0x00 }, { 36,    0x01 }, { 38,    0x02 }, { 40,    0x03 },
> +	{ 42,    0x04 }, { 44,    0x05 }, { 46,    0x06 }, { 48,    0x09 },
> +	{ 52,    0x0A }, { 54,    0x07 }, { 56,    0x0B }, { 60,    0x0C },
> +	{ 64,    0x0D }, { 68,    0x40 }, { 72,    0x0E }, { 76,    0x42 },
> +	{ 80,    0x12 }, { 84,    0x0F }, { 88,    0x13 }, { 96,    0x14 },
> +	{ 104,   0x15 }, { 108,   0x47 }, { 112,   0x19 }, { 120,   0x16 },
> +	{ 128,   0x1A }, { 136,   0x80 }, { 144,   0x17 }, { 152,   0x82 },
> +	{ 160,   0x1C }, { 168,   0x84 }, { 176,   0x1D }, { 192,   0x21 },
> +	{ 208,   0x1E }, { 216,   0x87 }, { 224,   0x22 }, { 240,   0x56 },
> +	{ 256,   0x1F }, { 288,   0x24 }, { 320,   0x25 }, { 336,   0x8F },
> +	{ 352,   0x93 }, { 356,   0x5D }, { 358,   0x98 }, { 384,   0x26 },
> +	{ 416,   0x56 }, { 448,   0x2A }, { 480,   0x27 }, { 512,   0x2B },
> +	{ 576,   0x2C }, { 640,   0x2D }, { 704,   0x9D }, { 768,   0x2E },
> +	{ 832,   0x9D }, { 896,   0x32 }, { 960,   0x2F }, { 1024,  0x33 },
> +	{ 1152,  0x34 }, { 1280,  0x35 }, { 1536,  0x36 }, { 1792,  0x3A },
> +	{ 1920,  0x37 }, { 2048,  0x3B }, { 2304,  0x74 }, { 2560,  0x3D },
> +	{ 3072,  0x3E }, { 3584,  0x7A }, { 3840,  0x3F }, { 4096,  0x7B },
> +	{ 4608,  0x7C }, { 5120,  0x7D }, { 6144,  0x7E }, { 7168,  0xBA },
> +	{ 7680,  0x7F }, { 8192,  0xBB }, { 9216,  0xBC }, { 10240, 0xBD },
> +	{ 12288, 0xBE }, { 15360, 0xBF },
> +};
> +
>  enum imx_i2c_type {
>  	IMX1_I2C,
>  	IMX21_I2C,
>  	VF610_I2C,
> +	S32G_I2C,

Nit: please order by alphabet.

>  };
>
>  struct imx_i2c_hwdata {
> @@ -258,7 +284,15 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
>  	.ndivs			= ARRAY_SIZE(vf610_i2c_clk_div),
>  	.i2sr_clr_opcode	= I2SR_CLR_OPCODE_W1C,
>  	.i2cr_ien_opcode	= I2CR_IEN_OPCODE_0,
> +};
>
> +static const struct imx_i2c_hwdata s32g2_i2c_hwdata = {
> +	.devtype		= S32G_I2C,
> +	.regshift		= S32G_I2C_REGSHIFT,
> +	.clk_div		= s32g2_i2c_clk_div,
> +	.ndivs			= ARRAY_SIZE(s32g2_i2c_clk_div),
> +	.i2sr_clr_opcode	= I2SR_CLR_OPCODE_W1C,
> +	.i2cr_ien_opcode	= I2CR_IEN_OPCODE_0,
>  };
>
>  static const struct platform_device_id imx_i2c_devtype[] = {
> @@ -288,6 +322,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx8mp-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mq-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,vf610-i2c", .data = &vf610_i2c_hwdata, },
> +	{ .compatible = "nxp,s32g2-i2c", .data = &s32g2_i2c_hwdata, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
> --
> 2.45.2
>

