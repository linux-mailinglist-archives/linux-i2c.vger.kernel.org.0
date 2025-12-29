Return-Path: <linux-i2c+bounces-14843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893DCE70C3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A664A303213C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26005320A3C;
	Mon, 29 Dec 2025 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="OZ26CdnH";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="OZ26CdnH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020089.outbound.protection.outlook.com [52.101.69.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCB031E0EA;
	Mon, 29 Dec 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.89
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018484; cv=fail; b=anhtFA2P7NAFaf6KvYkq2Fkh70wzovPeByskwYb0lLlfpAvOBzEAiC106wYJcrrIS4dYyeDa27Xa0MumkVR4NoqKJLGXcRqH4nYabLx8ftFIqxrk4MJTKF7UBhhWTvUwrX8ngaWAnUsrLE1HnCQvT35Cfc8IQxBZ5BGDGrIRme8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018484; c=relaxed/simple;
	bh=tpvcfWpRXymWMUSurraMiHmFPtufYeGlfqRnpwUSEn4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GZfl4f2rjbUJpJOIkFlMJtIslt8HkfI/dZCP6P5OCRsm0GJe3vH0Yb0Tr5WilBPsw+MJirGiZsWjvuzN8yJ5tjAZtEWevHSmgEIFVFIAmjHgONSA41J/kzfzWWUhVb/6OgxMmmI95k0sBp4N/igLb6WCkP5S7rU5LMfwAglo6/I=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=OZ26CdnH; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=OZ26CdnH; arc=fail smtp.client-ip=52.101.69.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PDEd+25/EgdNlPpuOZMHSnT7w5kzBpXyFrxDLCQCCdXZML0MvPgfDFH0hFzIOJkiyB5zYyi6AmgwOa7lYMF34OnZj6VC6fTIBAugOvzHG4KScw3Sqfua6Cbef9baofKXaIMOUXJk17my+gj39VQxbMcMh/4G9Ir1ULSMC/xZnJbbXJnij6wfza7MAPUfMzIpQynytALyfEZnAiy9CyprCtOPZAu7xUBpMXv+Ib7ABynne2239PcAO9do86h/7StH8+MyxK7OINlqWybJ+69LSsM4eIQ1ByYFHsiPIZx5M0TPSg2ZIP4BZsp9cxFw5AUrK1U0RHByrqp7IJQFTTV9OQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXyUhNx59LGdjVrmBYsNlhdpBssTkv3jXU4qgNHovFg=;
 b=gaWGqy7UB9t8DwNr6YBZV5CjOfuJdwSAjoukM7g5HSqU/cPCVMrkJ3aDSY4/bs1EkW4a/JU91bs/9KXYy01xSFcoVw2vQnWP9GmpduFZXhFBOKC6l2lQFNJq4iMpAuexVasI44mX6wqvBWD519KNd0VA0ww2CgRpiq/MXI9i24R0GdAlVGdjNfaRRsWbsA9QOfJghJ4hAaeNwlHsrZQe33UbO14DT6uXGR45RTzNsEdG3xvj1drUR8j24siYgByPixn4XscXaDiVKmfOIFEXLvnw3m1LJWV2drltsu2HT+FdLZ6q2xzbyA2YVlnXZaIQAjEPWs9wtUvoQWo5yXeI3g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXyUhNx59LGdjVrmBYsNlhdpBssTkv3jXU4qgNHovFg=;
 b=OZ26CdnHViPC6LeyH5kzBzoRmo5e6uOKxQOzPApYHMlDOVR782Rr97L8PpQMzVllKRnCHAuVivIbqi1154HFCgqF1kU+uvY/z6wFj0JCCLv5dTVpgk9pJ/koav77/tHOkdkpdpJT4x1n4fjYQu7N+6nnzXuRak35jdau0c9siEg=
Received: from PAYP264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::16)
 by VI0PR04MB12032.eurprd04.prod.outlook.com (2603:10a6:800:311::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:54 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:11f:cafe::a6) by PAYP264CA0029.outlook.office365.com
 (2603:10a6:102:11f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.0 via
 Frontend Transport; Mon, 29 Dec 2025 14:27:54 +0000
Received: from emails-921615-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-251.eu-west-1.compute.internal [10.20.6.251])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 291048043C;
	Mon, 29 Dec 2025 14:27:54 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018474; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=wXyUhNx59LGdjVrmBYsNlhdpBssTkv3jXU4qgNHovFg=;
 b=bHaQABUxGNzuCi56KWDARNKS/4f2Sm3+mV3AQlqXe9me6R6VzBIjntOa90fpiZZNFexgt
 aE6e1m5jVVHZT3ZMYbkIm39GG2FncNQ6mKPU4PPZ2fToJz37QEQoEg43fiCVkeKWpGIUr6Q
 QymxMCPhU2AptIXUY7VRCEj4R+A7pg4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018474;
 b=To1g1LnTkZSe8hGNteoOow+i0NijKs4ooOtTGZMDoDP9NpaKlTLVYzgPzbQ+dHS/xTh+N
 dE2bp1YarunvZUXNNaRMFYkDuv77dzE5ODhdUTIRKxi45sIIErjqzcgTpayEdB5svoYu1ND
 OHEgFo9GE6WygCdJTA+NexmYsT9+xiE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0enxAiuqcmWG5I8ptuni1gSQmkue49S9i9f2MQYo53FAz5yokoO7egOvx2A0wD7ilO5BOWfz8SDmECIJH/9ghVgKMcdZLXmcmuCVp0jduciZ8TvBiJS/D5aF269Px35OpEte0UiWiJl0mMut2TYnlhrMBHCXU1zXe82dscC2gBPSnngVrGUwPRUlspf90R8P28BBqY5ExRN5DzIQUWVA+DnMBuAfXSOzSciTDzPAd2WUa0gSg1EdFj2MCx0A40Lc9xrz9bhT9ZogDQn68vXktEqImszwN3OsT5IiQD10RedCXFGHvSrwiivIQ1qJY0HhSdnBu86KjZgi8mI3lADVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXyUhNx59LGdjVrmBYsNlhdpBssTkv3jXU4qgNHovFg=;
 b=gE3r3dWdncXwTA8dk80z2NPu72QMy39/WG1gCcBJc3LYMbguT/P7vOKzTabtvFFv3VE0nO2YtfvedeZufKkTrW56lvVmAT8alYpDkQjAyErC+qLivw3ryi0uqU7AOhpB9n+qsbwSmYWPIs1uB1ShAiKjJVVI+k090/mwWoYatjeLKMWi1s3ZaZETs8Dmdb0J+N5e9hVtR1xOrGG76ZuFoNnIx7hjFtEGqvQxCTMcgj1USvHkaZcDHj5WOU2vNOurj0Luo1XrY3isRNZ786NGRRe6HQsDrsT265IjGQLrdFbz5k4Lm0p71kKOaLUNJbzGfPTJyNFZqIOz2j5cOvz0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXyUhNx59LGdjVrmBYsNlhdpBssTkv3jXU4qgNHovFg=;
 b=OZ26CdnHViPC6LeyH5kzBzoRmo5e6uOKxQOzPApYHMlDOVR782Rr97L8PpQMzVllKRnCHAuVivIbqi1154HFCgqF1kU+uvY/z6wFj0JCCLv5dTVpgk9pJ/koav77/tHOkdkpdpJT4x1n4fjYQu7N+6nnzXuRak35jdau0c9siEg=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:41 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:41 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 29 Dec 2025 15:27:26 +0100
Subject: [PATCH v4 2/7] mux: Add helper functions for getting optional and
 selected mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rz-sdio-mux-v4-2-a023e55758fe@solid-run.com>
References: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
In-Reply-To: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|AM4PEPF00025F95:EE_|VI0PR04MB12032:EE_
X-MS-Office365-Filtering-Correlation-Id: 11af079a-d941-43a1-2509-08de46e67491
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dUx2ZWE4UnZyZk5rMDU4SFROcjRNWFVnc0RKQXVNSVNSeVlyL25xdE9JY2xa?=
 =?utf-8?B?WmVvYldGa2daNEJ4U2tIN0RvMjZxb2xxbFJyYTVOUzhRNWhPZ2dTV2FUUnVo?=
 =?utf-8?B?Z1pzeDI4SEdOdzNNWGNORFFacDA1NXZla2tTUm40RGgrd2pNT201UmwvVUZN?=
 =?utf-8?B?Q3pYTkFjRlhXamRmL3NiRlRsY0h6L1I0QjE0MVlXQlBhbGlUTjZqeXJJdGJv?=
 =?utf-8?B?b1NVR2h6MUVkV3ZCcEpyUDdkektSU3pTRHZLL05JbXNqSEEvUDdoVXR3RTVS?=
 =?utf-8?B?NGFIb3pWRVB2RUdqN2JEeEZIeU1nVUxHMHlLVm43VjN3dnNQdWpFNjVDT2Nl?=
 =?utf-8?B?bk9nRUk4YUZYMnR2MlpnZTdIZWtnd1MwTUptM0NXeTdORVc3ZlUreExSdm1E?=
 =?utf-8?B?bnNJR2J0cE1xbjU5K0xDbjJrTGhVWEtESnlBUEc0ZEFxM0hiOXJOemF4ZTJp?=
 =?utf-8?B?UksvbjJ1SVBTRktpSHM1UGFPNlZHZzRLSWVhZXdTWFl2SFlQT3pVSTZvOEs1?=
 =?utf-8?B?MGt4aFFyVHR3YmdpNG1CQkQrSktXVGRLM1lrWGgyK3l0bVk3L3lHNXkvNkUr?=
 =?utf-8?B?UFR1dnVLU2VBdFJYZzdpTnVaZjdLTFhHUDRFRlNVZEp3QVVablVEN3RSSlhJ?=
 =?utf-8?B?bmtRU29GMnJtZFE0MCtPME0vcHZOU0RSMFgrS3BNbmpMSjl4empaUGVoaStH?=
 =?utf-8?B?bGVST2ozaW1NUUpXOFhBeGhSZVkzK2xjbC9YY0F1U0F2dnFtTi9CcDJjMllB?=
 =?utf-8?B?YUFMQjN0Rjl4dzhsaWNOS25HMmt6TUs0dnZiekFhRTVHdC92cXp4QzFZVFFX?=
 =?utf-8?B?SDYway9xblVZQ0c3QlRMK2I2SDdwLy9jUXhJTmVNejltWHVncEJxNXgrYmVW?=
 =?utf-8?B?eHFOb0lEd1BqNVEyaFlFdCtoNHg4Tmo4Zm5Dd2Nwb1VJWU0xWWpZSEtMTkVU?=
 =?utf-8?B?T1ZRUWU2dTRkWG9rSU5yY1JUcjlZK0JYLzB4dDVOYkgrSklzUmYwZEJyOW5F?=
 =?utf-8?B?ODFlaTNTUkttS0w2c01rMVpXQnNKOWtIL0g2YlFBV01VM2c1SmJjWHdtUEtO?=
 =?utf-8?B?SlZCVEg4aVJWZE93d1lFQXZDbC85UW5rOC9PdUZmeXluTThQcElIN0R3MDky?=
 =?utf-8?B?OGp2UDBBQ1YwdFBWeTFDdGErSmU4M0ZCWHh1UjdwZU95eDZaaXg1VzFQR051?=
 =?utf-8?B?aXBraWtGWC9Vbktjc2MvUGZaRjE4d2NySUlvczkrNW9tSnFEU0JlbkQvTElm?=
 =?utf-8?B?QUZGK0cyZXpjdW8yaCs0ZzdtZk9XNXhLUHNXb0FCZkRNT08xWkFjWisrdmRy?=
 =?utf-8?B?ZXNwcUI0Y1paZFZ4N0dWRk9UNWlBUXU0MGlxOHJNVWFTb2NMWXdpbXd2RTdG?=
 =?utf-8?B?ZzNyQlJnVXBnZEN5QTNlZHJRTzRHQUZ3Y0NYRDd6ZnMrMnpvUWVxeVVUbEkr?=
 =?utf-8?B?WnZ2dTIrV29LUmpBV0hlZHJGdWNCbkZaanJHc0FOaTRqWDBQWEZmKy9DNjhL?=
 =?utf-8?B?NFdicXZKQ0p3S1VOSE5aVlI3Y1lQdUJsblEzQnpOS3UrNmwzK0c5RGg0Z2J3?=
 =?utf-8?B?QUdtaE83Umx5NjZZZTlSTWlHZkFKaElqYnRCN1creS82K2xvNWYvYjRTVDBJ?=
 =?utf-8?B?TjVsNlMyZENJbURMQnIzM2FLTjI3aHJVQ2VzRG5qT2Q4Q0w3Syt0VlhsWDBn?=
 =?utf-8?B?MDZPeUhvODdKWDdSRkxGbE9kWTZXOStncE0rZVArUHR0cC9kYWFmR0tPQTdZ?=
 =?utf-8?B?R0EvcTMvWDhsUkx1aEdiOVN5K0V3ck1uR2pEQTdCVm5sMm15M1VRN1IxZ3Ni?=
 =?utf-8?B?d3FPNGJJM1JFWDFTbGwydGdFeURvdGZ6aERNUmtySllMNVVBczdVWjgyQUtl?=
 =?utf-8?B?cnlCRllpKytZdXVLRC8zanAwaGtlbU9nQm9vY1dWU2lHbjY1Y0dMaWs0eGkv?=
 =?utf-8?B?R2doaDE5UlNzU3ZxZWV3YTY3aG9MQTJxNG9wZlJ1bS9rcjBFTTRJUzNET2NX?=
 =?utf-8?B?czgvc2VzQjlabzRLSG9UaDEwK3RkaDZJbzQ3TWd6bTRGUEFLR1FiN1lmWHhC?=
 =?utf-8?B?Q2JRenpzWFBDanhsamtyODA1NTZSUjQyNFMvQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 35331caac48d4c15a2eaa00caaa4bc9e:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76aea7ba-09ec-42a4-7306-08de46e66c60
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|7416014|376014|35042699022|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmIwYnJYbVlFbWlZMElmc2x2Z0JDM3RhSmc4Z1h4eDlWcEExYjJMbEVSU3VV?=
 =?utf-8?B?TDBBV1pEZ1d3TnNMZGs3c2pvVDJWWUhIcFRQSEU4NnF3dUk1YnJ5ZXI1NjFy?=
 =?utf-8?B?Q3lZaSt3WndtWTRMZTU0ckF0amQxTXBMakxrZk0yRTNMc0M0YW1rUFpna2w4?=
 =?utf-8?B?Y040QkJqMGFLTVJzeC9vYUNtSW5yMEN0SXpxbmc4MVB5ZU1zTWJkVGhyK1Jn?=
 =?utf-8?B?YzNhVkNhU0RuNzJ0YkowcGkvMW9XSk1nZW42MUZWREhwYUdlamZHZExFZGo5?=
 =?utf-8?B?L0RvWjdCK2tXenlqM1BGWWdwRlRqZzNhczl6Q2t4UkF2L0poUEV0NUg4eUpx?=
 =?utf-8?B?RWVVc3ZYalFIaDFiNm85QzErVFRnK0lXYXNQRnN0NU8zZ1p4QmplVVdTeG5R?=
 =?utf-8?B?ZVV2Vk5DYVpmSkIzaVVBT2FkMlU1U2xUVHpuTFgwL3VIVVlIcGxUVWtvM1Q2?=
 =?utf-8?B?NUZzTG54Y3BpN3ptQmx0Mm5rQUh0NzFLVjlpSjFVWVFZcXVycWtnTGV2dzli?=
 =?utf-8?B?emZMVUdaNXRHa1dNQUdzZWx4R00vbVhZdzhwd2FkZk9XaXNPTkQ5QnpZUjVQ?=
 =?utf-8?B?RVVaSVFHRkFZK1hURENmQUdTamxsQWN4L01DRlY5RUpiVGNhTVpSU3lNS2FN?=
 =?utf-8?B?RzJUZXhRSGw3YS80VnltOUVnSnYyNkdtNmlrSHkxN1J1RVlkQjZlcUhKUGpQ?=
 =?utf-8?B?L3hDRlh3V1JSSStUOXpSSExiV05laDZZUkxxWWZZK3JUeU9ZVjZEd1pmNkpW?=
 =?utf-8?B?MzM3NEFxM2plSTFVNW8rQ2dWeXJ2djZHaXBmWnNYUHV4ZDJaTUgyUmVNclFS?=
 =?utf-8?B?bXlJb1d1YllONi9YQW03aTBYL0lBYzBXUE91OFlMRTFXVm5mMTRlMUg3NkZM?=
 =?utf-8?B?OEsydnRxUkZHcjFhSTU2aTgzYUlhYnVoQVJGanFmUTZ3aHF2cFp6bk1va0RQ?=
 =?utf-8?B?b3B0VkFDenV5QTJMNUdTOWp2dWQvYnpaQ0pBM2ZFNUxpd2RLa1JwRll6S3gw?=
 =?utf-8?B?NUFXT2ZNOXVYZ2RhU0lvUVkzeFcxdHR0K3JEVnJteW5BQ3pjT0F5Y1VMMnZn?=
 =?utf-8?B?ZVREcGxuUytobklTcWdTb0RBdWNVZmxwQ2pTaVRqQVZqeTVBTHdhV0lOOWM0?=
 =?utf-8?B?eXpwRE1TMmtqRElxaU1SZi9xNDcwZ3pub0lEdnZ3d2RNdXRBdG9BblkxYndu?=
 =?utf-8?B?YkN6c1JwREpFZDZNbTJJWjRhOE83alBKd2JBWHJLZUkyUXdoeVF2RngvS3Zu?=
 =?utf-8?B?SU50S244S3hkcVhwVy9CQ2tvb08vZkxHTFBDa0ZIUk1zb0tablJVbWFCZ3lo?=
 =?utf-8?B?K3hhM21ZdFZVM2MvM2lwb3JZNTZhRW5HSWRDOVNVZGhaR2J1VVo2SmZsVzY5?=
 =?utf-8?B?cGo5cFh1TXQ2bVpIelpyMWJad3lYOGU5cmowU0RTMllxbXJ3ODNrUTI5V3pz?=
 =?utf-8?B?YUt0UFN3aERsTVp0QkM1ZGhMZU9vVE9rMmZlaUtNeDdLSVZ1NDl2MGhHRDJL?=
 =?utf-8?B?ZmlIMVdxbW1QOExIaFordVhiWnZzeUZvL0ZmM010TmdJdmJGcjNMN1VYSFRF?=
 =?utf-8?B?NnhyVGtwWW42RXhYb2ozV2lkNFlMNkJGQUVmdGlEdDExQnBwRDhhMTJQYkRM?=
 =?utf-8?B?eTd5NnMrdUg5bGJvMlRIY3ZMdVBXdmN3UGxxN09VWTAvTDJTQ2pIaGtITjQx?=
 =?utf-8?B?dDEvV0FGZWJWTGRYRFF4K3JKdUtSRjFmaVU4ZzRMWVNuSlh0azJJdDY0V0JH?=
 =?utf-8?B?U1JnMC9oaTBGL2MrQnVBRTI4cmQrZUlDdGRCWklzTVh0Q1gvck1idm40MHZ5?=
 =?utf-8?B?WHM3RVVLQmNzdENMNVJaU1pYYmlaMGtzUEYrajVNa051eHRtakJkRE9ubTZS?=
 =?utf-8?B?THFOckFwaFY4dVF3eVNSdnpscHVQMFJKeG1EZmpDeUV5R1Fhelg5TExaYWVm?=
 =?utf-8?B?QjlNSEZRUjZYSzVWcmNOb1QyS3dZMWQzV05zUjlyKzMvUko4SW5wVmNzZGJE?=
 =?utf-8?B?aWpuSzJsbG0wdCt6MW94MVRaNmJHM25aZmtYSlNoUmR3SzhoM25sWWpSOVA3?=
 =?utf-8?B?VEU3TGRxTFFXRFV5TS85RGIrMHhjTVhJaWJNbkpDZkJEWEpjSmM4djlORmtj?=
 =?utf-8?Q?BVy1jtjWgxcmSxa3ABXQwl1OK?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(7416014)(376014)(35042699022)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:54.4285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11af079a-d941-43a1-2509-08de46e67491
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12032

In-tree phy-can-transceiver driver has already implemented a local
version of devm_mux_state_get_optional.

The omap-i2c driver gets and selects an optional mux in its probe
function without using any helper.

Add new helper functions covering both aforementioned use-cases:

- mux_control_get_optional:
  Get a mux-control if specified in dt, return NULL otherwise.
- devm_mux_state_get_optional:
  Get a mux-state if specified in dt, return NULL otherwise.
- devm_mux_state_get_selected:
  Get and select a mux-state specified in dt, return error otherwise.
- devm_mux_state_get_optional_selected:
  Get and select a mux-state if specified in dt, return error or NULL.

Existing mux_get helper function is changed to take an extra argument
indicating whether the mux is optional.
In this case no error is printed, and NULL returned in case of ENOENT.

Calling code is adapted to handle NULL return case, and to pass optional
argument as required.

Internal helpers are added so that optional and mandatory variants of
exported symbols can share code and pass through the optional argument
to core mux_get function:

- __devm_mux_state_get
- __devm_mux_state_get_selected

Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
property presence check") noted that "mux_get() always prints an error
message in case of an error, including when the property is not present,
confusing the user."

The first error message covers the case that a mux name is not matched
in dt. The second error message is based on of_parse_phandle_with_args
return value.

In optional case no error is printed and NULL is returned.
This ensures that the new helper functions will not confuse the user
either.

With the addition of optional helper functions it became clear that
drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
Add stubs for all symbols exported by mux core.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mux/core.c           | 153 +++++++++++++++++++++++++++++++++++++------
 include/linux/mux/consumer.h | 111 +++++++++++++++++++++++++++++--
 2 files changed, 240 insertions(+), 24 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index a3840fe0995fe..2aa2a29b21913 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -522,11 +522,12 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @mux_name: The name identifying the mux-control.
  * @state: Pointer to where the requested state is returned, or NULL when
  *         the required multiplexer states are handled by other means.
+ * @optional: Whether to return NULL and silence errors when mux doesn't exist.
  *
  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
-				   unsigned int *state)
+				   unsigned int *state, bool optional)
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args args;
@@ -542,7 +543,9 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		else
 			index = of_property_match_string(np, "mux-control-names",
 							 mux_name);
-		if (index < 0) {
+		if (index < 0 && optional) {
+			return NULL;
+		} else if (index < 0) {
 			dev_err(dev, "mux controller '%s' not found\n",
 				mux_name);
 			return ERR_PTR(index);
@@ -558,8 +561,12 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 						 "mux-controls", "#mux-control-cells",
 						 index, &args);
 	if (ret) {
+		if (optional && ret == -ENOENT)
+			return NULL;
+
 		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
-			np, state ? "state" : "control", mux_name ?: "", index);
+			np, state ? "state" : "control",
+			mux_name ?: "", index);
 		return ERR_PTR(ret);
 	}
 
@@ -617,10 +624,23 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-	return mux_get(dev, mux_name, NULL);
+	return mux_get(dev, mux_name, NULL, false);
 }
 EXPORT_SYMBOL_GPL(mux_control_get);
 
+/**
+ * mux_control_get_optional() - Get the optional mux-control for a device.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: A pointer to the mux-control, an ERR_PTR with a negative errno.
+ */
+struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name)
+{
+	return mux_get(dev, mux_name, NULL, true);
+}
+EXPORT_SYMBOL_GPL(mux_control_get_optional);
+
 /**
  * mux_control_put() - Put away the mux-control for good.
  * @mux: The mux-control to put away.
@@ -657,8 +677,8 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mux = mux_control_get(dev, mux_name);
-	if (IS_ERR(mux)) {
+	mux = mux_get(dev, mux_name, NULL, false);
+	if (IS_ERR_OR_NULL(mux)) {
 		devres_free(ptr);
 		return mux;
 	}
@@ -677,7 +697,7 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
  *
  * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
+static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
 {
 	struct mux_state *mstate;
 
@@ -685,12 +705,10 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
 	if (!mstate)
 		return ERR_PTR(-ENOMEM);
 
-	mstate->mux = mux_get(dev, mux_name, &mstate->state);
-	if (IS_ERR(mstate->mux)) {
-		int err = PTR_ERR(mstate->mux);
-
+	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
+	if (IS_ERR_OR_NULL(mstate->mux)) {
 		kfree(mstate);
-		return ERR_PTR(err);
+		return ERR_CAST(mstate->mux);
 	}
 
 	return mstate;
@@ -716,15 +734,16 @@ static void devm_mux_state_release(struct device *dev, void *res)
 }
 
 /**
- * devm_mux_state_get() - Get the mux-state for a device, with resource
- *			  management.
- * @dev: The device that needs a mux-control.
- * @mux_name: The name identifying the mux-control.
+ * __devm_mux_state_get() - Get the optional mux-state for a device,
+ *			    with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ * @optional: Whether to return NULL and silence errors when mux doesn't exist.
  *
  * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name)
+static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
+					      bool optional)
 {
 	struct mux_state **ptr, *mstate;
 
@@ -732,8 +751,8 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mstate = mux_state_get(dev, mux_name);
-	if (IS_ERR(mstate)) {
+	mstate = mux_state_get(dev, mux_name, optional);
+	if (IS_ERR_OR_NULL(mstate)) {
 		devres_free(ptr);
 		return mstate;
 	}
@@ -743,8 +762,102 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 
 	return mstate;
 }
+
+/**
+ * devm_mux_state_get() - Get the mux-state for a device, with resource
+ *			  management.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ */
+struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_state_get(dev, mux_name, false);
+}
 EXPORT_SYMBOL_GPL(devm_mux_state_get);
 
+/**
+ * devm_mux_state_get_optional() - Get the optional mux-state for a device,
+ *				   with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ */
+struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_state_get(dev, mux_name, true);
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
+
+/**
+ * __devm_mux_state_get_selected() - Get the optional mux-state for a device,
+ *				     with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ * @optional: Whether to return NULL and silence errors when mux doesn't exist.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The returned mux-state (if valid) is already selected.
+ */
+static struct mux_state *__devm_mux_state_get_selected(struct device *dev, const char *mux_name,
+						       bool optional)
+{
+	struct mux_state *mux_state;
+	int ret;
+
+	mux_state = __devm_mux_state_get(dev, mux_name, optional);
+	if (IS_ERR_OR_NULL(mux_state))
+		return mux_state;
+
+	ret = mux_state_select(mux_state);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to select mux-state %s: %d\n",
+				mux_name ?: "", ret);
+
+		mux_state_put(mux_state);
+		return ERR_PTR(ret);
+	}
+
+	return mux_state;
+}
+
+/**
+ * devm_mux_state_get_selected() - Get the mux-state for a device, with
+ *				   resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The returned mux-state (if valid) is already selected.
+ */
+struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_state_get_selected(dev, mux_name, false);
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_selected);
+
+/**
+ * devm_mux_state_get_optional_selected() - Get the optional mux-state for
+ *					    a device, with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The returned mux-state (if valid) is already selected.
+ */
+struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
+						       const char *mux_name)
+{
+	return __devm_mux_state_get_selected(dev, mux_name, true);
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_optional_selected);
+
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
  * the non-modular case - that the subsystem is initialized when mux consumers
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 2e25c838f8312..8096ae34eb3a3 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -16,6 +16,8 @@ struct device;
 struct mux_control;
 struct mux_state;
 
+#ifdef CONFIG_MULTIPLEXER
+
 unsigned int mux_control_states(struct mux_control *mux);
 int __must_check mux_control_select_delay(struct mux_control *mux,
 					  unsigned int state,
@@ -54,11 +56,112 @@ int mux_control_deselect(struct mux_control *mux);
 int mux_state_deselect(struct mux_state *mstate);
 
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
+struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name);
 void mux_control_put(struct mux_control *mux);
 
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name);
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name);
+struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get_optional_selected(struct device *dev, const char *mux_name);
+
+#else
+
+static inline unsigned int mux_control_states(struct mux_control *mux)
+{
+	return 0;
+}
+static inline int __must_check mux_control_select_delay(struct mux_control *mux,
+							unsigned int state, unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+static inline int __must_check mux_state_select_delay(struct mux_state *mstate,
+						      unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+static inline int __must_check mux_control_try_select_delay(struct mux_control *mux,
+							    unsigned int state,
+							    unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+static inline int __must_check mux_state_try_select_delay(struct mux_state *mstate,
+							  unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_control_select(struct mux_control *mux,
+						  unsigned int state)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_state_select(struct mux_state *mstate)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_control_try_select(struct mux_control *mux,
+						      unsigned int state)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_state_try_select(struct mux_state *mstate)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int mux_control_deselect(struct mux_control *mux)
+{
+	return -EOPNOTSUPP;
+}
+static inline int mux_state_deselect(struct mux_state *mstate)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_control *mux_control_get_optional(struct device *dev,
+							   const char *mux_name)
+{
+	return NULL;
+}
+static inline void mux_control_put(struct mux_control *mux)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_state *devm_mux_state_get_optional(struct device *dev,
+							    const char *mux_name)
+{
+	return NULL;
+}
+static inline struct mux_state *devm_mux_state_get_selected(struct device *dev,
+							    const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
+								     const char *mux_name)
+{
+	return NULL;
+}
+
+#endif /* CONFIG_MULTIPLEXER */
 
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.51.0



