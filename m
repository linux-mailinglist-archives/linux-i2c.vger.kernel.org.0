Return-Path: <linux-i2c+bounces-5058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A593BC51
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 08:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170011F22338
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 06:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0536D2EAEA;
	Thu, 25 Jul 2024 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QFlW1UNC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6620310;
	Thu, 25 Jul 2024 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887517; cv=fail; b=UiF8fYtnlWjNlvmLbiheqtO3hjWhgnFYGYnjvZceT+xu7tdjyeincFaOFgYhxA/YF61yDeQcbZ546AilQ3JDk2pdxsNaknnYt/kxTfSUv26qNXldWTbEU3/xU2UME7OLlyOrgie7Tt2oIyMBQ9ro1PzKRjBkcdiMuFZhl8grolE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887517; c=relaxed/simple;
	bh=O/X+Y/UMYuJtOYZkn/1eTTYsa5m4e1tzkc9xeZeKZxE=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=kLTDN5xnh7jAjE6KpaOUO8fjqfyFrY8pv3pFKVxGD4yoKbE2VbBPObIt1LF2Wmp3nqA/yAr8zIfV1l9LxnLFAe7EDu+CAcQWaWB/oa4adYAt7szLUd+sjsBYJa1UxIC9UvqA5/stge7sgz8MBKFGNumpylKA72Ct2YTzKi+LU1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QFlW1UNC; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2AZKgYz1VI+QaV/fUW8us74BwqtXAdSHWcPlBEvFLaxjMyMnZ+yG0PBELFkRk4B7EIzWR9yN3a3YlYeeSVuoCJn0Jt9LlIjWOzTDjEJZnwuR38Rwp4KBAK0qW4R34eozYlIs3yIcSuRmNNxDH4Dpo0TDDUQiXgx+MlhMXHSe11wXUAAaygropS1OVEtNO5DXR5gZRJ2LovgI+1fo0SpWmRm4oegELCl/FTv77AI/q3ECIGaPr7P7LAEGoHdwBGsOK1p+yT8Jk62ga1u0J3AXG1TQ3gCFzBEwm7gW2XY0oT7pjUteBZRL8vVJdWYfTrZNpKRfNfbpKJQmki/qCwZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYnhVcTI0UGyWSaDO7Ikzy3zhEIgh2Qg8d9SUQkiqPY=;
 b=cmS5sg16NzPwOjYrDUjQSgt/k3PqHJMvP3QQLeNAFdho8Tg6UX5EFgpOaVV04G7B62edWaQl+kjaaFCpI+YEhFhESYR7CzAyMeuEt/gzQ/7Vv6Cl7Natr5b0Fi2c1iiVDxQ6PkYM5g1Utn0+1RrbA6L/cORibAfIatyhdfnS4zzTzlIdUw5SpkxhzF7Df8XK0fxYeDPCXgGa2KXqmmi5GFZoIECgOuX+KSAm7IP7pLuHhyAkHof5wf5X9zO6jwjOEmWCEn2HULNBy3qGcfMervjssr/yTSj97F7sbX/m75nT0s5gYsqKh/LD5+xRqFsl4kVjaz4yBa9lRQ5jQyLkRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYnhVcTI0UGyWSaDO7Ikzy3zhEIgh2Qg8d9SUQkiqPY=;
 b=QFlW1UNChwTf27NvyLyJbLY4gh/VFx0iLEiX7uKDZ7ytCFfgjt36mN0B2QzW2jPYSvNlw7CFyJlzHNoAD+T/wBr1+S99kERTnAcNDDr/tUWRocb7ZT5V+COWjyr3tHibeefw1eGzuqiEDgzwmpEIf9PEgmUq7/gsc7TZKg5kvWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8619.jpnprd01.prod.outlook.com
 (2603:1096:604:19b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 06:05:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 06:05:10 +0000
Message-ID: <875xsuknvt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/1] i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Jul 2024 06:05:10 +0000
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ae65e7-f428-4d41-574f-08dcac6fbdd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4KhjTvp7yeAEREQcLwSffhvx50Lkv9i+W8xpYXyd7NVxUSE/k1JOho9+FPXh?=
 =?us-ascii?Q?r/K+cb9I2WBj48ppn2gqdcWZHIzgNHxMV3zy+nsRfAuNqdyKVUIEUYyOvb9b?=
 =?us-ascii?Q?9+HJvFt0hxicRZ46FjLrZ57Gaguk8jLMuWJK/Sx7E9BkfbTvKG7ak6y9s+8W?=
 =?us-ascii?Q?2xiBCtTp4AudQK2CSLIJ61qoh4kIdtEGzjLxlC6L0OdYbdgvE6R/k0PgnFf7?=
 =?us-ascii?Q?5ydRC65cr4SZ9Q+ZzHQtFx9sek6SjVif4tscrLSRcHvX4plW3BO6b0AQdQIB?=
 =?us-ascii?Q?67m93hA2dCC8/Dcm6Wr1uuxLXl/FACKCvcXSuylqW/ZhF3VGZ5fokb0oSV5g?=
 =?us-ascii?Q?S0nonY9sjgBTKt59bYK/nLFH9exe6qEe/iMvOxaAYkG5bB7bXD6WJIjTaUwz?=
 =?us-ascii?Q?RQt+cyePaUZ3nH09Bsy55DI47yZ2xwTL3kQtQoktlGYzHL9FJD2sS/kqsxJY?=
 =?us-ascii?Q?bctLZX45T7p1uvai3o2YcDYKj7+I/yxehwZ9owKAOajvGEDszRvy24sNAVhJ?=
 =?us-ascii?Q?ZkM8mqC1xT69v65T51f+TmBjfJdum5mWuoVoB8cSNQH86fqWTFngN49D0r/4?=
 =?us-ascii?Q?6p96drQVHKnaWiY4TieO2hGzDRNFUbiWdo+AP2aPr5gsXBZbNRTo0nspeROI?=
 =?us-ascii?Q?zwO2YwqEN8eFAytbWukbcslJyImq6RnuDWd/jHcaou5+F1ouCR4eSAkF5ujN?=
 =?us-ascii?Q?x63ppObDhRELZQ7Q6dBaDLuiFvdc+wQHJM3lENPmQMwuA5fspl+w4o46xZzL?=
 =?us-ascii?Q?yIMIppp1/laX0hjFBCd4FOlFN9IHzZY57Gp0VZipXqZ5TLLsJs2dZbBlICBb?=
 =?us-ascii?Q?Yo+++pdE76mKUH8BiJw5AZIA59DSzh737RE59htA1AGDdlUb+CBaoUlEZm32?=
 =?us-ascii?Q?+PN/bQdVyT/9SRU3mO2EJ5FHOCn7f0d+L3NY+9WnxUW6otRqdBgFEZ2DpxBZ?=
 =?us-ascii?Q?TbiOPUE2XzMTknNs9/ysMTMs/xh8jxrE2wlgU9qrwyvpk5lFgdt7n1Aanrys?=
 =?us-ascii?Q?+8ZIbusluGv9M620xAu+11mVbEwOR6gnEdvyW+UwJQL6Mf4jkvFZDXiBK8S8?=
 =?us-ascii?Q?yvFFIzjL5H9MLfmkqsnfM9ZUcHUzfoW+69m6pGZo+279HdkNYPe9NkAnWnEb?=
 =?us-ascii?Q?6MSWS+LEygv6V0nQSTPYNXrLqtLf3IiW5isP5DYmBbDJUpmIM8gxKS4plbpt?=
 =?us-ascii?Q?qbtdMTs68e20Upawq4/fLLau0jduNe2FVXDwtyXpJ3c55OvqUffuT9xiFmIn?=
 =?us-ascii?Q?vWfzJAwUIFO/Dm/WHHkB0hw5rM/7gb8hmyaEnuPif4A4x7cNpPSxrDOBZFXF?=
 =?us-ascii?Q?WnTJcay1Y+gLlG6BJYFQ08LbFC32wABEOIpVl2LLUgComBfGWbpppz5/pHj1?=
 =?us-ascii?Q?bkccbm4x1ZvSvU7MPi5iWZ9eR4+rRSBhk0yMCdy8a2p6XE6Igw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DcRBBO+/gOzTdr3gMfIC1c8gwzj+gFqspSi1fJufhdYaDRpR+Dwl0R7WKSI7?=
 =?us-ascii?Q?8QLDB1RSu7WVUAH/31Tnlnj4QqGyBZXf8+S+rXhyU1U+/lFkq9VwrZ6wOIZG?=
 =?us-ascii?Q?7uzIQSbfKSjCJGvYhHkNrrFM19L1nJgRkOOVN2VuFYEjm4ev736XCjUUY4Qt?=
 =?us-ascii?Q?JbMAAttDD01q6Jm9YTGIJaE72NbYsxDPU2uzVBpWTOAJJcx5nVYOqu6hBQAU?=
 =?us-ascii?Q?ewN/tUJ/OQ58x2MyzrBZWZ0ckLoYUexqYUpk7/SpsY1Sf+IZQvEcqXZHzLHJ?=
 =?us-ascii?Q?AbWj7RrW/AH2IQmj8bZhYQ0Flumavni+Q5LHKQ3kVzr8yi1M2BAHJnASb1Ai?=
 =?us-ascii?Q?dH/EdIepPdwx2Qz5fqM31nLGlk/JcmXF0uFxRJ491PVIzr+fOtz4kCOyOR9W?=
 =?us-ascii?Q?lZYvhKJSf+LCDfL/F8+nJkxFYj+7x1bQY1Wz0zOGUV+dSJJAkWdxojYley82?=
 =?us-ascii?Q?HsVEr09PeH8nEVaPy3oev5Ky5XTkh6Qt6p+jkg1FVw9ld17VZX45GAF1e4C0?=
 =?us-ascii?Q?39Q+Q/kLtzQHpoV7ypsAM3UAcn/vu0ugBGJPyfMiiSxwpqR2CX6zXf0LIe6C?=
 =?us-ascii?Q?oyGdkTCij5eq4dWtHAjoL8DX5FPL7LJWswblkxk4OZjiFcQ4tG5qm1mfMmAG?=
 =?us-ascii?Q?uQyfzWzYPJ9ibHgBJLAYy8jfxWKZFIdTuLiQlk2z+/z0Eywv4xrddOBeIIEf?=
 =?us-ascii?Q?nm6IoEX5Pl+PGT7qoeUwW14oqpZVT+JzpBSGe9OVUBPngJWbllT5z6V98N6s?=
 =?us-ascii?Q?NFCOeTvTgI7ikoLu4FzaXPgQGx3LlrjyKAY39DEhwdhmKWfy0/SOVjQBzkDF?=
 =?us-ascii?Q?TwrAQQOiYU0p6vQ7LxcvK29biDrmgk+LF+Fh6MxK6k28vk0d++JHjfYap9lZ?=
 =?us-ascii?Q?l/UelOE6Nssi8KilHrGfe1+yfIjiC3+EqPd77wioNW5aQrvQvAHgGLnZQg+G?=
 =?us-ascii?Q?j/N/lsqtrli8itxTU4yUrC3+gTQrc01CKPC/S8KUtFV/DVF1zKhCuG1AamOp?=
 =?us-ascii?Q?HF4R8Qu6Ovf/67VFnKdW2sILJRy7OCUfiHUT/mQZstO253M4BE3KNSggPScS?=
 =?us-ascii?Q?vwd7Y8Cu14l/z/lDFWMg8R8Qu/hosT6R22C1S0veB9OjmtLfitTbD43tUXgU?=
 =?us-ascii?Q?iL7NtTXqZs/ZMMGFEfziY2myOudgNtVy4TWQEhPoJ8g/oGU2Kua/2xhVhruT?=
 =?us-ascii?Q?MUdzGD6H0hlBqslSwBWvftMxsVKESYhNnKmJrzkSfK4Oa7r9dkddq3tyg11i?=
 =?us-ascii?Q?MfbPiNljZ7RYD5fArDpAwY/yt9jObuo7d+9b2pF2oPZvDCneC3Zi88qXBrjz?=
 =?us-ascii?Q?KAXxv2XalaqxnWRQrYUXnWbU36LjymRgaU0J3FkrQW2zXfnZ02e5htqYkUIV?=
 =?us-ascii?Q?5Rm4GuAr6FwtI3z9UAvFfU8xV2xjq0R/hZGd8Gdu1FynmNLB1OcN3hKDFADI?=
 =?us-ascii?Q?z1gOOrsDBWZyZ7nrtYfgQ3H0h8wtW2BK/3YDK/g8wLpNpkuwOhYvORjNcr88?=
 =?us-ascii?Q?K0njd+4YOMQPh4//gBHCrk5wALYiINoy8spzE7m6yFtqRB/iw7SN+4JMzRDe?=
 =?us-ascii?Q?vBSxibzD+6UbrUFns/IgXY4T3itJYR/UaDm56TkkfF6jBzn0fkI2ZSN1yRv/?=
 =?us-ascii?Q?QrZ2WU8AElpeR3EQteAzW7A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ae65e7-f428-4d41-574f-08dcac6fbdd1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:05:10.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K2CxRwznLteYtSjuk/naMHGE8xh9TaPINmE5WluhGbcyMbym+tgNaWSxO2uJJlWAkbeFTel1WMQ5SBLxe5WByjFh5xv8HF2yOQ5xEksFL0mH0++Yqh8W7CTx5dTQSYo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8619

rcar_i2c_probe() has priv->devtype operation, but handling (A) and (C)
in same place is more easy-to-understand ((A)(C) and (B) are independent).

(A)	if (priv->devtype < I2C_RCAR_GEN3) {
		...
	}

(B)	...

(C)	if (priv->devtype >= I2C_RCAR_GEN3) {
		...
	}

Let's merge it with if-else

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/i2c/busses/i2c-rcar.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 828aa2ea0fe4..66aca5c239d5 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1154,11 +1154,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
-	if (priv->devtype < I2C_RCAR_GEN3) {
-		irqflags |= IRQF_NO_THREAD;
-		irqhandler = rcar_i2c_gen2_irq;
-	}
-
 	/* Stay always active when multi-master to keep arbitration working */
 	if (of_property_read_bool(dev->of_node, "multi-master"))
 		priv->flags |= ID_P_PM_BLOCKED;
@@ -1168,7 +1163,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
-	if (priv->devtype >= I2C_RCAR_GEN3) {
+	if (priv->devtype < I2C_RCAR_GEN3) {
+		irqflags |= IRQF_NO_THREAD;
+		irqhandler = rcar_i2c_gen2_irq;
+	} else {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(priv->rstc)) {
 			ret = PTR_ERR(priv->rstc);
-- 
2.43.0


