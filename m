Return-Path: <linux-i2c+bounces-13368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A6BB50D9
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 21:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CA0F7ABFB6
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 19:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179E928D8E8;
	Thu,  2 Oct 2025 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GqDe9zGs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214428C2A6;
	Thu,  2 Oct 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434607; cv=fail; b=o9JZrelabKpmrzDacPcSTc3XD3/9+WBXY9kjMTocG1cpqrfswAtGoxEOKjUitV6WzE9jxEuSm52X9Lt3grRazS+089ufe6mQ8ZnJRrzSd70zpV3QkUZFglOuMPlFgOrXw2wv5y2xBp1idh5Qu9mAeiDnbcwUd7lgj+lEJpJYkes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434607; c=relaxed/simple;
	bh=+Qamxrjen8B1kqEOrOi6rjUZofRO8GoRS6nnxqVex/8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ndORQCiaHkgd8CmZzqY8K0kWBigzLIbHrXHnXyDgu3TVdAxI8r/2wPIYi5p5eGXZm9c5ASxV5dBuVIQO5QK2JRyOYd5cdx8P0jfaJW+AesUT+ilkOXhWJkBll5k825/z5slSr62LqgYHvgx6qY2LhR6HUt3DRyt16jMUFmc8nKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GqDe9zGs; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0XJcExghuBssxX7ihbTspnNZJRBN1N/yEg7eTMEN1Q3n3edw/nkJTR3+lFkkoMMp3hAKwMymeyFQtC99QDx550n8/pvjLWAWuuLERUNQdTUqWe4Rpfjd9YEwLbO/kte3gmergH08hDbuy1Jckw9b/eMRK/RZOWC/cLtZDMNU5D6zk6eaoJ4Eb7rwLuVLpV/9b+mqYGHUwGzaNYTmG3vbAb5Jz68GTQBdrfCR7Os86C9UcyKLUPWwS0ir47m+ZWvrCnhu0yuunsr9p/0IaOPm06ZKR4Q2068NkThIwmn2yXtUhESLAi3CFI/RDItN1A6yc5kQ7lTa04BU3fDAe8WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29e3Urj0ybWpDH1l47/frcWNmz8NjpphMH9gwZh+Nms=;
 b=nMdJDqDdip44nX1+b6eQBT2TZoicB5KCPBaIRjb1vmlWiQsNjdoHBXZ4G48Y/qAEGLdkOwHp1AiErgw/Ur69HlFpiV7Peu0i1SkYpLkXCjIwriuwdEV9BI/eLG9JDGgiqNKsCcdtrESiW4bigI0/nVp3kFKwbuhCvOg3dnWKevHA7dDoSN01q3edm7B4xytvWYoqDfjfPxyNeO+VW5vR/BuyvYhWw0Nf6NOvwYrCkaEBIkqKT3aZWAebMFIER/MGHAfpPkouJQ97FHpIfLAzvAkX4jWGk9EYROL3k4QYAuPcU0tGiFiCNSn4azBnUEKxacsxTyM5wT9UtrKXfIYdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29e3Urj0ybWpDH1l47/frcWNmz8NjpphMH9gwZh+Nms=;
 b=GqDe9zGsVnhBK0bIhq7SGFtHCAhRhbY3IZOq+5Eo0nsu3euZbpsZWZVsmAEEbnoygoc6s/9KoBbKShDedE32ZuxjxHScSSOec7CDNTyU0vMC2eyPaIRzcS3o0RTxmGY0OlhJnAc1q8ZJOhYJN5I/6gxisHiL8lYOWVSVavS03aS5VLAW9ccNdkwY1ilyCuyDs3gshMmSRkF3DVUMCvrFFGmOdwEvm/iIHox/oGT7g8tgQNtXl8BVXsfI5X0deyRdMA7Y59MExZ/zQ9rIJcR+7DIn9Y7uF4bZTlrYhRP2kiY5vMBerNw5IRFJu2iXxOKkKr7tlO6tBv5TaOEFKBSWLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 2 Oct
 2025 19:50:03 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Thu, 2 Oct 2025
 19:50:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 02 Oct 2025 15:49:42 -0400
Subject: [PATCH 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-dma_chan_free-v1-2-4dbf116c2b19@nxp.com>
References: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
In-Reply-To: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759434592; l=1809;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+Qamxrjen8B1kqEOrOi6rjUZofRO8GoRS6nnxqVex/8=;
 b=0sNfsQaoCllxveAWtP0hADDMxenipQKUvVhKA7IdTyp8bHBB3zLtYDLpsTukoXHo0hprWBlLZ
 Q4e52UochjXCuWmRDvydXrgcatm1Vc2vm7rHFTtl0oNf4x8noDgC0ss
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e44e35-538d-418a-ead3-08de01ece0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|19092799006|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXJTYzVXbHpFY2hPMExuN3oxS0RzYU4rbTFyRzNyWVhSMUxhSDBpdTJXSXdh?=
 =?utf-8?B?ZktSNW5Fa0NCUEdaMlh3MTVzbXovcXlzcGovZ0RRVit6Wm9DZUNqcHhjMGp6?=
 =?utf-8?B?U25XZzd6czJodkdCck1pQmRDRWh1Q2xRbjc5S1B2M3cvNzBlaXJOYmQ4MW1Q?=
 =?utf-8?B?ZSszNnBGSEhENmJRS1RoMytaRkI2OG5GOHZ2d01ZNnpaQkNSMzNwdnFxT0pZ?=
 =?utf-8?B?YXNMVlpPbzBXcTc4eVdZZDR0MWVVUm85aGJnNlNPSE5RczV6VVJYbWRDN0E0?=
 =?utf-8?B?anBnb0xKTWxLVThMYVlSanBONTVVTHFtbTZHMnRqQnRCZlNwY21TcXVCcml6?=
 =?utf-8?B?VGhjeG83c2Evb3AzcktuZEZFdHhtRW0vWkJld2UrVVZWZG9WUTEwbUhDYlJE?=
 =?utf-8?B?RmE4S0lpV3BwMldLRlRvdTFxZjFtRTR5eS9DZDJnR2xud1ZzWXFiUjBqbkdN?=
 =?utf-8?B?OUdnNXdzMUR4Y0lGUjNKT2FrWFFHekFqY2pmNjNBZDdOVlhVUmZGMHJpeEdF?=
 =?utf-8?B?ZlJIZmpFVE9PZjlORWZpa3dpeW9Oeld3UjRSeGowdUt1ZnkvZUZwRW44YUhX?=
 =?utf-8?B?K21leXpNYi84Nkw1Z1lRZTVZc0p3L0d6RDdpVzBPWG5RbXNoOE1EZ29PRllj?=
 =?utf-8?B?M29iUW9MRXV0QUF4WVhNRE5HcEdzd1BrNFVQRC84T1h2RU5hM09oSnFXM3B0?=
 =?utf-8?B?L1RKWFBNdGhnSUZ6WXNYYmtBL1RIdkZJWCtidkZ0MFVURHkza3ZWTGFMaWR4?=
 =?utf-8?B?aXgyT2dVZ3hMbUM0cnZaOFBOMW82cXVRZXFMbGZvS1dveXVJZHlnVU5MclJO?=
 =?utf-8?B?VHYzVGk1ZnFyVCtZYU9HSm4zQnFsV2FYT1pXK1dMT0RDWERKaTk0dlBNbGl1?=
 =?utf-8?B?TkZpbjM2VlludUprTjhJU2JXMVFadkEyYUR2WjFIZ0t2S0dwWGdheDdBd0pk?=
 =?utf-8?B?VHhBVWw2eGc1S3FsUytQU1p4ZUZ3eVFFeGh5dG9PZFc4SWFzTUNySlZsdnRM?=
 =?utf-8?B?UjA2UGRyNjAwMUZUeU5nK2tEOHkrUEdqYjlCdWxZQXFGTkhVb2M2TGRWakJX?=
 =?utf-8?B?YWx6bnRKeDQ4cSs0VjBGemNIU1Z3MEdMMFhXdkYrNHA2M05pT2V0SkRFT2Js?=
 =?utf-8?B?YjNiZmN1RG5wbWpZTTdQcjQ4aHA2eUtkaUlaSzZnYTlvbjE4akRnQzFpODlx?=
 =?utf-8?B?aGlpMWkwRkVvR2VKNkxDdDRVM3ZiclF3RjBJVUlrYjRyYUk5S0Q2bjdiNkND?=
 =?utf-8?B?MHVjVjFENC9zeEh2RGxPeDUzUU05a01hdEN5MERYVndDTEJSRjhYUU1kZ1VB?=
 =?utf-8?B?bnZTQUlxQ3VFZzBsajVtakNLQW50cDdXbzVidkNBdmFJNC9qQ0o5SWxMd0J0?=
 =?utf-8?B?VzNOUG1jUjNsUXJxYUdvcmwwVURHUGdNUzVpYUlHR245eUFyZEloWmhXakVM?=
 =?utf-8?B?ZGZPVG14alRsK3JiRWMrYUVuelFYRWdSVXRKa3pOclFpbnM0M04xVlAybXdv?=
 =?utf-8?B?SVJndVpSVFViWG96NHRiQVN2RDhuTmVXWHpiM3lBSEV3dVV3RGJXZGdBZlVn?=
 =?utf-8?B?bytIbFd0KzJDSlJuVHkrNXVSd2xVZzlGQkdlU0RnZHBMUXFnc2s2Zkt6a3hX?=
 =?utf-8?B?UUUrREJDelgzcHZwa3NDd1JhZHdHdzdkcjNxblhuTUxGREFVTFdBSHVUZ05r?=
 =?utf-8?B?RFhna3lFWFRhcmRPUWc3MnRTZ0pHeVpBdHFJS0ZjMDJwTm5IaDUrcWRFVHQz?=
 =?utf-8?B?NlN2UldzNkhsUFpRd3p6YVY1RW9JWTA1Wk45OWZlODRWeEUwQlA5Si9WV0NE?=
 =?utf-8?B?Z0J1RkltTjRBZXZoajdPeURuSGNEdTZKVGF1eG84TjdFNzhjSjhRWXNxdnJ3?=
 =?utf-8?B?U0RKVlhqQlRIT0YvM3ZpM1ZaTjZRVk1vc1FOV05RTklua0Raczd6QmZJODBl?=
 =?utf-8?B?amExNTM2anNTL21Pdm5jVzdIemRjVWlMNXR4SDNZbm14NkNPVWhkMm9JRGFH?=
 =?utf-8?B?ZFB2bFMxUjh5ZHA5S1loYmR5QUFDSXV4cFl3a1JjZkkyYmNtZ1k0VHdmU3or?=
 =?utf-8?Q?DgaSQm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(19092799006)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlRka0RPY0VEK2J2NERETFA4ckFsUFg1YUZoUnArSGNVc0l2bXNyOWNtaG11?=
 =?utf-8?B?MllwdUczMy9sTmpCZ0ZWWWFmTlhiVXkxV0QrNmkvOXAwRXFVYUxhQXVZZFZ4?=
 =?utf-8?B?SkVNSVpHNzREWkM3UnB6bjlyVk9KZjQweisvNTVqSzZyQ2NZSnZ2RkdjRXFL?=
 =?utf-8?B?WUg1bkFaa21aZ0V1V1N5d0pRRGdKckQ5NnFUS0JBL202TnJyYWUvTnZvQnFa?=
 =?utf-8?B?b1E1bHdmTzFjekJ0eUpoOFZBRHN5M0d6UWY1TkFOS0ZBYTMwSGNyb0dZZ1JS?=
 =?utf-8?B?V1FjaTNNSkVONlBmVy90UU5YcHE5WGVXajF2blVvamM2TzBMMlZyQTB6eWlq?=
 =?utf-8?B?SFYwakJKaHhPRGYrcklRTnZZNXBSWUNVT1YybVNURUkrTWxSc0s2dm92V2xE?=
 =?utf-8?B?ZVNjdW1RTmVMZG5mQllBSlFLdW5Za0FJL0FjblRQMjJJdUpzVXpYQ3M2MUN4?=
 =?utf-8?B?b1lsMWJrNkxQU1Yvd0FvMnpQM3Azd0FJL1BuaU1sNTFBMFJ0K2JubWEvS1d3?=
 =?utf-8?B?K2FpWlhBa2RoSkpjeGlXczVERS94ajhvS0wxUi9IR2hTa1I1R0QwL0R4bmVJ?=
 =?utf-8?B?UE5NNUExSGFPNHRNVmxjanhjRFFyWG9IaG5jRWZMSEdoVG9ZaHhmNzJBNThW?=
 =?utf-8?B?UG54N0hMc2hYR25RZmZRL1NCYm9jQUpCR0o3REZQQVhRNld0T3FleGlBWW9Y?=
 =?utf-8?B?R3MzN1RqejBoU2UwNmk2akhKZFFlb1NqUlBDdFZWZ1lWK0ptRUlGTEVUNlhF?=
 =?utf-8?B?bGhzS2V3K2kzWk1CdzB5dEpWU1dZZ1ViUk16U0Qxb09EUXF0elltU3c2Rmg2?=
 =?utf-8?B?WldQM0VXTkd1a1NtU2taYmpEWGM0UGtTMXpDemRYam53V3kwT3lsK3lQbTls?=
 =?utf-8?B?c0ZSVm13VTZyaHlQWGJGUVo4ZGhabXF5a0kwZ292ZWEybzJVbkl0YkpkNXBw?=
 =?utf-8?B?MnFMZTZ1UnJyZTd1WXF5UzMzUWJGK3VpcWFSNjRESmZVd1pneFFZVE1LYnBY?=
 =?utf-8?B?UnJ4RGYza1I4RU5WcFVkeks5ekl3c212aDRwU0NjVzlBaGJnbWlUNy9DK2ZS?=
 =?utf-8?B?bWpQRVBoZDAxeGp2OU9RWXJuVkU0eVh5RURpVzRMMTh6SjVnUEFvZWhqWUY3?=
 =?utf-8?B?b3p4ZDM5VkFVcGhyT2M0a3lwTlFuTlAvTGR0UWhsQmVPRjl2Ty9lMG9aRkwx?=
 =?utf-8?B?VS83RGpQRlNlRjVPdFpPRXdBNEJwaktGei9mY2JzemFLL2NiMGgxOHhYR0tR?=
 =?utf-8?B?QnJka21pK1lqWFNmbG5hTm9FaFBQRWhrTUE5WlZsc2hrYnd6YkdHTnVpRDZH?=
 =?utf-8?B?alBRQUhLaFN2OE4yK2JLVEVCQi9pV0JvNG4zQzhMZ2Iwc3BjOTlBSGpIMkdB?=
 =?utf-8?B?bGFNRHgvZlZEMy8yaVdNcll0emt5NnRRT0xha1N5dHFJV0NLZk9lMWhVT0pI?=
 =?utf-8?B?TlMzVE1EOWVtbnlDNVdzelJubUFIL3JPRDBSdnJnS3dYZ1prcDMxVGFaTFQ1?=
 =?utf-8?B?UEE5a3hLRHdhNkg3eXJPdkpldjNheUFpZ21PUkV3R21ySW92d0hsNmdjanl6?=
 =?utf-8?B?eWZpL25YVXlyOGlCd2o3SmIyM3VrZTNONE5IVGlDYWpEbS9pZnlVS3BCVTRE?=
 =?utf-8?B?aUh4RTZPWVoraWFDaDAzVWNYOFkwV3Jzd3VucUNmNnBaazA0TFYyZzdSbXo2?=
 =?utf-8?B?ZXdOTTlwYmJGWC9MellMNlZBQmovRHNtQ05Zb1ZwUzV4aU5kYVd0d2JMby9y?=
 =?utf-8?B?LzErNHYxeGFmR1Z4YXhhZGJsdkk0RW5BbkxFRHBua1RZdHY0bWlET2xELzQz?=
 =?utf-8?B?aENvUEpBVlVDMjV3aXA5L0Rvb1RZcG9nWmppek43NGV0NTA3czNGQ3VEMkJI?=
 =?utf-8?B?eFM0RWJSWS8xVXNoV1oyQ1JmcUkzS25VTUVKL1pXU1F0b3o5UlVMMUJXWjZy?=
 =?utf-8?B?Tk9FSmp3U2M4Tzd3MisvTDZIRkhzWWVQOUtzcjZxeUE1cndFbzVjOGhEcXJr?=
 =?utf-8?B?ZzVyaXFLUjJSRDlpWnhZMTQ3QTRLS3pxRkJ5TGpFQmdvL1FzY1ZBZG9LRWNp?=
 =?utf-8?B?MW9pd3hjN0RvaW1XTW1KNnJRN3V1QUZaSjVQN205UWJoTndNejJYVVhzTnRD?=
 =?utf-8?Q?krb89+lKVwUTPS2V6NWl/2qMP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e44e35-538d-418a-ead3-08de01ece0e9
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 19:50:03.2357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUL97/FMZISDC7QX+mQkHN5qSDus3Esh1dif/IzPnez8vO0YOh/yEjLb7WhiddLgWQNbFCjSmX+XibM5vicX9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406

Use the cleanup helper to simplify dma_async_tx_descriptor error handling.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..b1d035ca8002e9648b67bfe4d674578373394710 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
 
 static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	struct dma_async_tx_descriptor *rx_cmd_desc;
+	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
 	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
 	struct dma_chan *txchan = dma->chan_tx;
 	dma_cookie_t cookie;
@@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 	cookie = dmaengine_submit(rx_cmd_desc);
 	if (dma_submit_error(cookie)) {
 		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
-		goto submit_err_exit;
+		return dma_submit_error(cookie);
 	}
 
 	dma_async_issue_pending(txchan);
+	retain_and_null_ptr(rx_cmd_desc);
 
 	return 0;
 
@@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
 			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
 	return -EINVAL;
-
-submit_err_exit:
-	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
-			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
-	dmaengine_desc_free(rx_cmd_desc);
-	return -EINVAL;
 }
 
 static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)

-- 
2.34.1


