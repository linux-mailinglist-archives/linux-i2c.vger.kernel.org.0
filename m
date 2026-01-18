Return-Path: <linux-i2c+bounces-15253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33AD3940B
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1ED53019575
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FFD30B529;
	Sun, 18 Jan 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Xn07RrTp";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Xn07RrTp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023074.outbound.protection.outlook.com [52.101.83.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F9286D64;
	Sun, 18 Jan 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.74
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732172; cv=fail; b=H1z35alULhbJJcfjw3as6p8pllZs39lKQ5brQwyjNqg+Nh45nA3aFan6ulwHexX14W4IEQdn6zd3V7Nl8cc3AiUHEpk1RFKkCc49HPrbIEzL+8YA9m4BOCOM1aB9FClaFY10C72BKOTovWc0/Zjr9KIMYSKzApWETHgHihDJUug=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732172; c=relaxed/simple;
	bh=EpuxHkc/g6h1tuI/kmhMdOaCgZ5Cams/bkIPMbFFJ1Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UhByTMInenlUSYPyaPP04QDb4nDyhG0yyXMF7fItHd9HzS3wkeLbfk0fkHgzYDw1Y7mNwL2djC/GjzpJHp8qS+aQ3nLjQa16G11x2qE559X9NIQ1aZE9VQw+44TWXeGcch8nTMkUpX30h/sjhtpXNjsVhzMKuIn6qd7BxcWOLGU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Xn07RrTp; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Xn07RrTp; arc=fail smtp.client-ip=52.101.83.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NlUZ8vbVdhvawwERaGhIEN1F3sZCxsDIWos1ynnavwySvJebC9DpDaYD5DrflGS/OZzMLJLRu+9t8LG4ci4FHc4DsjZhPLcpEXERs+vBrpUF/9M8Y664U8505fyHiZ4brOl++gd68DCwuBGGKdAY16IPYGYgbPh+M/ew9FcrwGxdV3cQRy2i1jGGD4q0QnAhkuKNBDdT4HPVtZtWhmhneqY4Ybs6bMemehJr1j28xyDCKnJUP8lfoUKTU1VQ9iuGwpT4ct8URbcHIg+4CccXPd4enU/bUS002Zj7wcQJ5RdTnegv4mgC7srCRxnC6AIsV1Qj9ENEemv7SVb2e0sWUg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSxzPjRw+NkfTJ9/QIi+VEYm8pw097F+87zWRALn19I=;
 b=jMiKqT9bN496rl2HfHaRScpZRQjEcllTNsHxJX2Xgk9Ruk7Q6op1scPzQlwwGJhN9vx9zZoD5BLhdy6hGqJebF7kNf9L7XIHSKJygcua9zmUBspZp6gpoI12Sc+EtufoqfjuW4Obf+fSYYC+TwkWaGHzaLSg8cOqSajJcjT+wJQXy8cquR17lCKS9KVRzi5uIBW7I67fwvLMW85T3v2EyI6IVk8RexZej7pU2tWF8LSnc1PEsUKT24eh7Qi9XHTu4AL5TdAvC4Et7/UE9OoHi1ofNvhoBajff56a0VjZRpmkliBVRwdYCZ7qVihODwfRrcCK9odudFYtNc4Q654E0A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSxzPjRw+NkfTJ9/QIi+VEYm8pw097F+87zWRALn19I=;
 b=Xn07RrTpX8OKPhRZVkzXeRSxqTVS/BgEDUFSgU4EcKr0QW6AXdTxXxiHIm7LScMDXQzTeZiPUWSWYAbhqW3ZOtYTQXNPZr/coYsiQ5cXr3YwNAPwuM1+Q5uA/S1dCSfPqWlu8Df2k5879/7NRSFtmTmmsEZcyBosBoCrFMbKgw4=
Received: from DUZPR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::28) by AM8PR04MB8019.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sun, 18 Jan
 2026 10:29:27 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::3) by DUZPR01CA0170.outlook.office365.com
 (2603:10a6:10:4b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 10:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Sun, 18 Jan 2026 10:29:27 +0000
Received: from emails-281835-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 4AE8380151;
	Sun, 18 Jan 2026 10:29:27 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732167; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=rSxzPjRw+NkfTJ9/QIi+VEYm8pw097F+87zWRALn19I=;
 b=YxzEui7r8F8WX3GqGc2L1hRBnozsKvKQ3b0viMMQbmq9iQuxA9A38LEzH/GEQuCoKvP4A
 /eiw2vqlgRKLAkGEHnlbCGJg6GnSNaCSDc0G5DNQMSGz6UGnGmYD5QTtxorv6H8wGUJgHGy
 /pUiyp1CiJ9oMkQ6xqWnY3xlq1YVWvs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732167;
 b=U9ylYvDnYt57GMZNgAdr1LXcIPK92KoF4noq0nni1hm7h6ARLqF1uzh7bkSKpa+qKAJD9
 2e8F5RupWdXJeIdQ/f9XN14WAYixcnIclyJ59jUOmg+mmtSnahMzogxbvNrWwvDWFVqQ/LD
 B/g/xS+H+1+GY/8pqSAk9qRi/9kD+wU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSsZ2iR6eG9brdLRybm9mUz0i/K/Q/QtrIe5HOSE/1F8C5ndvac73y8pDXJbQ22Lbn2nynbHnsXscl1ShFYof3oVVYgen6gKNKdRrDzjLjmNKgG/tIpOf6EzpnighhOO9VbsVpv1KA9Nj1VqKxM8GVnt9ytmOUD6hdv33XKfaLMFpkraciTyodmG6E1f67idOT4/4QzzYD5qus+Oq6YEnLlgqV/2owh6MQXVNRujlxKA3KZ0vTRNED7NFIye3ntFFScZBRpdjNM3nHaGLZIbwCU9bbWyj1glwD8NtkXsuWKwLdvRv/ZkDPWsgExrWJVa76q/Rb3r/8OAW/1i1vMruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSxzPjRw+NkfTJ9/QIi+VEYm8pw097F+87zWRALn19I=;
 b=aaR42hq9oIBOIxnQZSOjG7c1qj72pWkA1Alc65sgKnIcKqyT17UlXUes26wnhCs6kNOR7LAkdwm4vSY0goMHT3SqlaIDl5meTnbA33mM2um5eN2RvOYbmeu8aGiNdu2Ak0/tKgkReh8gpd3mvxcQ2JxcZ8sueGJS20UA0Zt2MWyPipDs9/BupjMq1G9dpD8EIDu/bb14jBSlNUG1op3gRCXhIbG8xISPbcYcIhJoKHjAu23MImFkbfmZCAQFt1ucyeRI8LCbA9oIaTwdsinD4uEaBQhQiDGCSl5eCEI9flB2t3qCvCtE0RtHxuRYIfatY2LCd5zJJ0DWS/L/POpVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSxzPjRw+NkfTJ9/QIi+VEYm8pw097F+87zWRALn19I=;
 b=Xn07RrTpX8OKPhRZVkzXeRSxqTVS/BgEDUFSgU4EcKr0QW6AXdTxXxiHIm7LScMDXQzTeZiPUWSWYAbhqW3ZOtYTQXNPZr/coYsiQ5cXr3YwNAPwuM1+Q5uA/S1dCSfPqWlu8Df2k5879/7NRSFtmTmmsEZcyBosBoCrFMbKgw4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:18 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:17 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:29:01 +0200
Subject: [PATCH v5 5/7] i2c: omap: switch to new generic helper for getting
 selected mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-5-3c37e8872683@solid-run.com>
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|DU2PEPF0001E9C4:EE_|AM8PR04MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9c050d-30bb-4076-edb8-08de567c751d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bjRHVE04aHpBakxFOEtjeVFiNzVuSUNlOFBTWFkremNkWjU5ZzNNbVQ5Wnc5?=
 =?utf-8?B?ZndWVjlnSEFYSFlvblhRMUpiMC94c1hCNzRyVFNkbWVTQ1cxRVcyaUx5Nmw2?=
 =?utf-8?B?d0Z3bk1tNmZMUGpIOVZ6ZTNWVnQ1VU1ROFY4ZG5lRTQwTndmcW96SDJIank4?=
 =?utf-8?B?QWhmRVRvQXBTbGlHeFRhM1cwQ2c3RDg5NW45am1HbGtRZE5WS2I5NmR4QmRD?=
 =?utf-8?B?aStWekVsYjJsbWlRcEVjTXR5T3J1a0JxODdEakRmSE10SDE1RGRvOENqalFD?=
 =?utf-8?B?RE5sY0U5akJNS1VKL09aWTlJOWFPQlBqWVJkZTlOSnJKL0o5YVRMbXZ3bDk4?=
 =?utf-8?B?akoxRzVOa0ZZSE8xZGFNSFlxWFNHaXhoOHJmSytZc1RpZ3I5b1N2cU45eUFG?=
 =?utf-8?B?RDM3MHNXN0ZDY09FUngwQ0N5K3RJU002OHZ1cmhmc1dRV0p6VlljUktHUzJV?=
 =?utf-8?B?SHl3RXJTNmQrLzFXMHMwQzEwdjRwZVZMWk5pNkJ6UHBtSmZFc1RSWkY0TDR3?=
 =?utf-8?B?bm9BL0FUeFRuT3U2VGFYZ0FRT0RJb1NteEdFSkFSUkZKTHZmSTlkRmdUM2RB?=
 =?utf-8?B?ekxvL0ZUSUNBdTAwcm9nTlFOUWZwbHp2Rkpqc3piMStHcldsZDk5VTRIM241?=
 =?utf-8?B?RnJEZUJpMTIzak1kb3hxTFZqTHRIR0sxSWkzUTlLUlpHbTJ6dFdyVjlLblJI?=
 =?utf-8?B?SmZEVXl3OTV0RWg5cXlGOGVybnE3bGNsaE1xcVpxMGV2Y2EwSkhyQnM3blVS?=
 =?utf-8?B?NkxPVlFsMEk3K1hqajZYK09zNzBwdVdLbzNRK21tNktjWjdRWGNublFFY0hq?=
 =?utf-8?B?NnkzVk85NUdmTGpvdmZROHJ3M0tJdVlZR3lhYS9SdS9aOHZ0R2dmZEFuRnpF?=
 =?utf-8?B?VjBwZk9DNmRRWkRPMHFTQncrVUg5b3hUWkErZnFvc2NDUkJQSENtTG9YdEg4?=
 =?utf-8?B?VlVqenpDQkNLWmNjcVowLzhjQUhzUTUyd1pXWEg2QjUzc3pCUjNpWDBDRnl6?=
 =?utf-8?B?NXZKTENjenAxY1VvRHdxcUE4U2ZjbGNyQmkxWWQ5SEg1alUvbmxmcWEzd1FV?=
 =?utf-8?B?MlB3aG1vTmFGMkVMTGhDWkZxSm0wTkdRZTlpZTlYZ3ZaZ29wWEJVVHAwcUVo?=
 =?utf-8?B?cllzWEtXQ2xNVlZIV2NoNEVjL2Joa1ZRZGMySVJ2TEVwVlo1QlFiTTBtTHJ2?=
 =?utf-8?B?NlZ0bzlaSUs1cDlMS1NFL210Y3NFZ1FkWVZSMmV3bENUUEwzM2hvcmYraSs4?=
 =?utf-8?B?UVBDT1F1MmFTSUhWcERqMFV1M0JCYWRmKzhQNXovYnpFS1Z1emZDeThDS0Z4?=
 =?utf-8?B?RVJ0NDBNL0ZBUWE5bldsNWlBRkJJWVhqNmRiWnliK3hVM0ZwaVYwSU51cEhx?=
 =?utf-8?B?ZS9QOU5vYWdyVzJBQnBsWjR5MUM0UnRhUlYvMXpzamVYLzlvTUkwRldCbDMy?=
 =?utf-8?B?WVl2M0NubEdSOWg2YTBvYzZybnQ4cHJMZTlWR2NyK3pXWFdoVThvajRUQkZp?=
 =?utf-8?B?MmpLMk1nZktKSW1YeFlHYVdCdEdSMy9EYjIxRmYwNXJ2R1hNQU1RRWY1dGVX?=
 =?utf-8?B?Z0grU0pzNU9ac3ZSRXpvdENSMm5kamlMRElla1BaNGpIZE13eUl0MDl0bDJL?=
 =?utf-8?B?RGM4SVNxNnRCQXA2cy9mRUtXUkp0cXdpbGZXYTluUzkxb0QyanJpdmROeGJC?=
 =?utf-8?B?ZkttVVJqNDZHTzJLb0s0TmZPYnNXbHl2cnBpQ1VJRFE1ZGdkajdpeTNnemJw?=
 =?utf-8?B?eTg4K3h5UUdSaVUxOWNpSEZaaGF5MDJLNU5nQ09IdTBSM2NHWXN3REYxajgz?=
 =?utf-8?B?M21kTmoreXNVVU9ENHpsWUU1QVByWCswWWl5YTJxUElpc1ZIaklOdGpibXhU?=
 =?utf-8?B?dHB2VVJzelhST1U5RExsU1pOeWhiRlJjSUVpVExKVjFxQXRMOU1hU0VNemc2?=
 =?utf-8?B?SC8zd2x2aU0zcnRZSE8zWVNsOG1JK09VRjRKb3psZ0hoM2srSkhDMEc5dXFu?=
 =?utf-8?B?b1hQa0xBTDEvUWhMdFBaQzdyTy9kMWxMQnZhQ3ZSVjJOYUZaNGJjd2JIRTVQ?=
 =?utf-8?B?MTJnc1REelVpRUJ4VVA0U3NLT2w2VUhyWmMvSHJhQUNLRmhkOWRRMW5PR3dv?=
 =?utf-8?B?clVCRDZGdWJSUE9mNWhYTVJqZE1PaU5xRDA4bVFoYWpLNExZR2JFWTNIcFd0?=
 =?utf-8?Q?uBIcj4afN5V+VU1FiCCo0Zh0I8uths8V3qfbhLkEwuEo?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e06acc34264b4afcb8a915a64717e6d5:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2c22d7a-51a9-4a47-5351-08de567c6f64
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|14060799003|36860700013|35042699022|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTZEbzlzS0FKNnZ6ZStueHpOaHpsYnA4YURmc1djbGFsaGcvSW1tWFF6ZXBK?=
 =?utf-8?B?dEZJNFRiekdNazhUdys2N1pCL3J5Y3hGN3AvQkRURG1BMExvc3NVTVZ6RGZx?=
 =?utf-8?B?a2tLL0V5NTBFZ2hoUFNhTFFXZDhxZjRkWDNINThKL2VtZUtmUkJMYkxCVnFF?=
 =?utf-8?B?eEVRa3p6OVhWQ1BSdzhPU3NxOWNWZ2hINFRVV29aS1pmZ3lvWFJoUHdJVklH?=
 =?utf-8?B?Q04rd2QyTFNZeFRoOWxkLzZtWWFSeW5vWnJEZE5iMWFSbmtUN1NFL2VSQjM4?=
 =?utf-8?B?SmZwdHRzQ2UrbDd2b1EwRVV5Sjk0ZXR4OEJJUjIwaW9BZzMzcDFZVGRkUEtC?=
 =?utf-8?B?WFNyRjZUTGFrOXpkeUJBdFBCWEd6dGl6ZjdMaGpqR01rSXJ5NEg3K1ZlM2hl?=
 =?utf-8?B?VnlMZVVSNXM0dys3NldUdldUbEhxWTREVmJCSHRuVzdtcnU0dVdCUWQzd01u?=
 =?utf-8?B?NFMwU2RTS09sT0czcy9obUhOSk1QallpMHVFeG1BSzhzWWdidUd3a3lUMVZT?=
 =?utf-8?B?SG9nODlUVytSa2FRc3d6RGthTEQyVWhCWk1ub0hNWmhwMGRqWmp6OTVVTFFi?=
 =?utf-8?B?OUxJeUdWeFpZZmlZM1gyazBRekU3QkNpZ1ExazBQcERqUnZHR29NZzA0OHk4?=
 =?utf-8?B?cStLSzhuQ2c1YkZ2Skp5cmdkVDFyWkI4S1VmYUpaYlY4dXFtUGszMFVkQ1dP?=
 =?utf-8?B?MHBtdmR1cU1kMEloS09icHRlWUtySkR3bmNsMlN6VGhEQ0lCNnA4WmwxS2g4?=
 =?utf-8?B?ZGFjRFVKOVpVSU9KTWZ6UzRENmVpRkZvdWhua1g0ZWJsbnJIaWtTc0NEQ3d5?=
 =?utf-8?B?VXZiTFBTbXhRdU9QTTJlWk1tQThnSVkrNlpKZTc0N1pZaHJBY0QyVnV2NnBC?=
 =?utf-8?B?REJHQmNkSUwwSEJxbUVBTmgvWFU0M2t5a25NdlhXa3pIU3dBUmJJV3V0Q3E1?=
 =?utf-8?B?MGovSnJnSTlwNUdaVHFkTGpBSUlyYmhWcTZ5NFRxOWwvSWtGYXkxa3pRTW1o?=
 =?utf-8?B?TnBwNFd1UWltTnBvWFRxRkVnZW1vUHk1NkdiVHpWNk5QRlltWkNmaTV4NWtS?=
 =?utf-8?B?STlDclVuc3IzVk9zMTN4U3dsTGFzalR0VEV3TmR3azVuYUJmS1VYZzd1K05C?=
 =?utf-8?B?RTRISGc2Uk45WGNmWmRkOEZEL2RHNUlMRFVtY3VtVk1FOFo5OThXTXE0aHBM?=
 =?utf-8?B?RG5nNytJenZLZ0lMRXZ6UjhwYmJOa3NnYjFyWkhYZk9ocTdJVURHOXVsR3FI?=
 =?utf-8?B?VytQVjU0QWNXeElMRDdTQTIyS0dpMFMveVE0YmVWMXErMkpqL1RYaEdGQmI4?=
 =?utf-8?B?M3YyWXhUY3VPZmVXcDg4bHdUNFIyUUM5OGdjalBQOEEya3FCZTBlTWNzcHRk?=
 =?utf-8?B?dHFWalNVWnNMZk1FaGRmbVByem5ULzd3QXVNMFdLTjUxWExKTWF4UEdjK0lN?=
 =?utf-8?B?TC96MXJyN0ZRYXRZNHZqTXNUVlpiM3FzUVZFb25iVWtWZzNyTEU0N1Rxb3A5?=
 =?utf-8?B?anhybjFNeWxaaTB0amJMcUpYYzc0TTdhZVFYcGFKNHpTOUlHUGlEWmFzaWta?=
 =?utf-8?B?bzRLTUlVeVIxSDFHS2gvRldjUDljY0p4TE5QbTJ5N2doTnY1U0ZHbXg4STh4?=
 =?utf-8?B?Y241MUlOb0Q1MUZrY2JYcGo3eDJGRE5WeXVwSlBVVThwOE5WNjFxRktOWlVZ?=
 =?utf-8?B?dXFGLzFOd1hrSVQ1Nit2UnhSM3ljK0lPZXpJdU9ZbTZ4NUgvTXNmV0IrbWxu?=
 =?utf-8?B?VXF2T1Nta1kzbVk2T3g4d01FeGtXVXExaU9XUWFScFVwdDlpSE83amZrRDVx?=
 =?utf-8?B?cFZBWHZHZlhpeENyQzFNUWJ2cERjSytCR0M5emZUWm5oQXExQTM3cUorNFNY?=
 =?utf-8?B?eHlxdmN5WVFhL0tHSmdFV1lHakZLTVY5bXo3and6SHovallvTklNNlVuN2FK?=
 =?utf-8?B?Mk5MNEtLUk9FSmdDclp5bWZpYytBYkdmTkptcWxVZUxYN0lGNkdoVUZGczVZ?=
 =?utf-8?B?YTRLVTVvWm9SS1RxVmR4UUdDdmluZW9WSFcrOTB6S2FFQ0lGU1BCeW1GTEgz?=
 =?utf-8?B?bjJZV1ZFdUdYUWRoUXNjLys3YWFHUjRXMVFjY0VuaUxHOVdNa3V0Y20vM3Fv?=
 =?utf-8?B?dVk0ZXZBU2QrK1lOVWQrZDVHOFpHcGl5YThQcUJjdVp6a2s5bUZrallMbFI4?=
 =?utf-8?B?YnZDT2Z5UGlaei9jQTFjaWxUMUR4bXFMK1BVL0RYUlhmUXoyWmtQaHZPTHgr?=
 =?utf-8?Q?xBA09E7mOnenJ6vo+W/86hnplvzuIQuWwiNG1YIXIw=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(14060799003)(36860700013)(35042699022)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:27.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9c050d-30bb-4076-edb8-08de567c751d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8019

Multiplexer subsystem has added generic helper functions for getting an
already selected mux-state object.

Replace existing logic in probe with the equivalent helper function.

There is a functional difference in that the mux is now automatically
deselected on release, replacing the explicit mux_state_deselect call.

This change is only compile-tested.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/i2c/busses/i2c-omap.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384..f02d294db42a 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1453,27 +1453,16 @@ omap_i2c_probe(struct platform_device *pdev)
 				       (1000 * omap->speed / 8);
 	}
 
-	if (of_property_present(node, "mux-states")) {
-		struct mux_state *mux_state;
-
-		mux_state = devm_mux_state_get(&pdev->dev, NULL);
-		if (IS_ERR(mux_state)) {
-			r = PTR_ERR(mux_state);
-			dev_dbg(&pdev->dev, "failed to get I2C mux: %d\n", r);
-			goto err_put_pm;
-		}
-		omap->mux_state = mux_state;
-		r = mux_state_select(omap->mux_state);
-		if (r) {
-			dev_err(&pdev->dev, "failed to select I2C mux: %d\n", r);
-			goto err_put_pm;
-		}
+	omap->mux_state = devm_mux_state_get_optional_selected(&pdev->dev, NULL);
+	if (IS_ERR(omap->mux_state)) {
+		r = PTR_ERR(omap->mux_state);
+		goto err_put_pm;
 	}
 
 	/* reset ASAP, clearing any IRQs */
 	r = omap_i2c_init(omap);
 	if (r)
-		goto err_mux_state_deselect;
+		goto err_put_pm;
 
 	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
 		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
@@ -1515,9 +1504,6 @@ omap_i2c_probe(struct platform_device *pdev)
 
 err_unuse_clocks:
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
-err_mux_state_deselect:
-	if (omap->mux_state)
-		mux_state_deselect(omap->mux_state);
 err_put_pm:
 	pm_runtime_put_sync(omap->dev);
 err_disable_pm:

-- 
2.43.0



