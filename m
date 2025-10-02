Return-Path: <linux-i2c+bounces-13366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02FBB50C7
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 21:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 278913B1BB8
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 19:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F45E286D71;
	Thu,  2 Oct 2025 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wpf8dLDq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947CB2367B5;
	Thu,  2 Oct 2025 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434600; cv=fail; b=iSQkh0f8G98XD08NLOmHk+quPA1o60degDYCqRz4tXIUUqQwbhxN6d6CFciVq3+YCGTXX5kVjzzw4a1Z8s/rLYc2+9Jf2UCIZdPUhqCFAwNvqk1TvzP3BtLkAsBkcFdQM6mBc2OYvcx4DA5ZX4aum7AUSUy3Y1RBlqRyBKK5Z/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434600; c=relaxed/simple;
	bh=7GFzRDe2X1H/A1U+HnA8vwtN/s1mESYYgGRh9ncZ4j8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MbOwF/2sEpIF69ZB2TNM3JuRQAS28lsacjD5/jkPKWYacXD6xZk9LNcCF1BucQ93js2fKVcKRYo98Y7HjLE8//b+0Gb/LZ0Q1P6KvwAo/UkwZ2X0HhHUKjbGlxYDKWGYMWuVu6gur+k8EXtB5KEBhByQ1hZkcckkVkqP1yg7nEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wpf8dLDq; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMBRTh6q08ZczZvORNVTx2gEji5BsdXDHWFFJL/N5mGxCBNj4SAN6F8cBkkaDGRN00T4iwEVpxyhs8BgpW9VO7zWdczrY6d+9v/eXX4E+QjhKHi/chbwTq57ObAt47szT1KDCTvW2ghJ6/7dcM/D8FDuMYY+Td5faCEgD00RDMGARpYO+nkkKJYeXialYZX+64JC3LuoVRy3N720oMPkxlVbiOpD/0coxnYEf/6Gl7KV6wiSG4QKPxVelgL3d4D7slEbMxMQ1nXrNxu5wZXx7RcpKlritbjdZ3wGTbipnhzK2nmxTvPyfUqq7ogHQyGp0mEvSphRrmekdo6fbVQR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4lY3uqW8yJs3hsssNWyHGRRpYg1isFvuW2ESHevjvY=;
 b=nyNTu5lG84Vs68UIIwtoiLWAi7WIt9igEtoyYUlKYHt2ZvLloKgoFOJB2rdx3solycVdYDTLqBmAwXvVgYPre3/wYFH4ekiqKd5/samqV6J4gXENdPeW1e8oY1j4gt5etA8iuI2SB103VJ0IItp/zpMi0/urOyVfRI1B8Zy9UYPjSTQZiFBfae3TC/VPBu8rcKJ1UX7P71bOdkHkqQOCqvCbr53s9O4c5/cjUnykdJtK50P9X+0VrM7lz6DLiir4pEd+aaLwPL0aCLQrEABbv+rYwhbKeb0t/WLY4aCDoGUIsvh5Au0C73uUruOswtjroW8zxqlqZAT7uGMiXyGcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4lY3uqW8yJs3hsssNWyHGRRpYg1isFvuW2ESHevjvY=;
 b=Wpf8dLDqSO7fg6EnU9bTx0AA4OubuNKKKF8zXkM9VYz6+zGXgbIjrI9nxS1UniKoE1vnh+ghrzD3mmeAjYijcNvElR9dMMvNFNt6vOlf4uHM5xqMuId/CbHlEG7CCIPchQKsF/UbbcC+gR/uUxRK3Kl5tQUxSsCBlXXez3ibPjfLlp+kpqiuxvMpZEE9L359PYHn7cn3R09qygKVurq1E3SeSFbrcXWR0gxTQrNQC4W+66DMgbHHpmCSPxLsVk928Xl8J3q8ezIAAu17gPw1sx2HP5qv/EYYHMnLf0+cUOCbP8Zf1SX3UXIDYuVGGRUn0WUxpo6TePX4kqKl1wRznA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 2 Oct
 2025 19:49:56 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Thu, 2 Oct 2025
 19:49:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] dmaengine: Add cleanup to simple code
Date: Thu, 02 Oct 2025 15:49:40 -0400
Message-Id: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTX3mgC/x2MQQqAIBAAvyJ7TljNDvaVCJFcaw9ZKEQg/T3rO
 AwzFQplpgKjqJDp4sJHaqA6Acvm00qSQ2PQqAeFqGTYvfuMi5lIYm91NIgmWILWnJki3/9vmp/
 nBUxXzpJfAAAA
X-Change-ID: 20251001-dma_chan_free-0392f4004d9e
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759434592; l=1349;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7GFzRDe2X1H/A1U+HnA8vwtN/s1mESYYgGRh9ncZ4j8=;
 b=LVx+EoTO0tB/fLgHPW9WLfv0xEia7sbHNSxm5H4/yWak+VFYJACmJ9J6RxygJiziQ1C1/kD2M
 39/HZRDRQh5C1cn/+IrvFqGfXGmG3M7J0P8KrSzQwqpNrs7JPT5UPJ1
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
X-MS-Office365-Filtering-Correlation-Id: 9e43f27a-6d76-4640-38b1-08de01ecdc86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|19092799006|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU05OGIxaFhVVEF2Q3JFNWlqNHdLVjk1Qm5vbWw5RUliRTgwbmxEM01UYkVs?=
 =?utf-8?B?K2JkbW9ldExvVGtNcFNuSm53QTQzcmM4UFh1UjIrOWkzc09RQ3VnTFZTbWRB?=
 =?utf-8?B?REt0a3dPMEtOYytIS2VjL2ViZFFEOW5PY2JaZm1rZzcxRktRcUNUWGVLWTF3?=
 =?utf-8?B?dytuME9FOXRGM0pERGxHU2Zsd2V0VlFWalVBNTduNzE2a0NneVlFVU93d2E5?=
 =?utf-8?B?ZytxS09FMFJHQWI5R0d6d3pKaXUyNnpkYTgwVjJzZDhsMTd5V3BrVy94SUxI?=
 =?utf-8?B?c1QxeHJ0a3QyWkVYR08zYXJiY3hyYVpwODVtTnBmNXM0N1NRSG9SU0FPT0Vn?=
 =?utf-8?B?MU1oVGxZdGJBTDZvZXl4S09xdlVrZW11UERjNTFPSXZCS1N5WHBFRVNBWmRq?=
 =?utf-8?B?bGhhQlV2QTd1Slh5UmZIUy9wcEFoNjAzZWdLSEZlSFJDS2ZJTjVXYmRHS0k3?=
 =?utf-8?B?UkRNUE8yVXRHeE5YclMwbnYxTS8vK3I4dmRPQ2V1YW5icGR2ZmY1ZU1Kb2d0?=
 =?utf-8?B?bDlUYWlnckg4OUFQUGs4dFhtMUs3eGhVR0NKSjhZMFNmeFZVeGNVQ3NGUkh0?=
 =?utf-8?B?QjZjUTcwQjBvUkhXR29jV3JxaXRiQ3pFaG96ckQwaDJXV0RRd0U5TWFqdnJk?=
 =?utf-8?B?Wit6UGFKNzBCajJLSGhUc1dtN3JPV2FnMHMrTmlOU29OL3A0QXBrd2d6OHhK?=
 =?utf-8?B?SFl2TENjeUY0VStoaTRrZ3QrYnhvcU83NHY0YWNoZUgxck4rZzZ5QmRHMXdm?=
 =?utf-8?B?OGg4RG80N3dWQ3N4T3NPTjFaTlJiZU85MThwMk5aRzB4Y01BdUV2OEExVUNx?=
 =?utf-8?B?TElRN1U4VndmS1UzcmYyU01zVGJPdHV1OFM1eExXQjJiT0lHZXl5YWxMelNN?=
 =?utf-8?B?Zm9mekNoL3REd3creFBKOWx5bDlkazluRjErKzRuY09GRUppelNSSzhOU3BV?=
 =?utf-8?B?OGI3c3R6SUhzS2Evc2tWZExLYmNYT1FhbzBJckNackhFQU9zRHlSRnRuK3Zo?=
 =?utf-8?B?NFQ0aGszSE9vcU9lY25PQXhaNWM5T2JzWUJISkJQTFFSSC9xRHFSZmwrZ28r?=
 =?utf-8?B?aGV4RFhJck5CRnFQOCthaU9CWnlGOXlwR0gyV1krMldWeXNCRU5HQ2R6b0hM?=
 =?utf-8?B?aXAzRWQwSUNDdUEwNktKWEpvei9wNE5EZFdHZU4yNnBHYVkvVE5HK3pjaUZC?=
 =?utf-8?B?MjZvcDVnWTdIUTBaN0J6VXVpSCtpaUplUFVBM2orTlVucUVzRWNwNlBNYm5P?=
 =?utf-8?B?aDF2cDdEWnZMd01WU1BLajg4eDRaRlI4Q1Z3dTNsMkZGZTFtU1U1MXRjMGFM?=
 =?utf-8?B?Y3dKQk02MWQzbmNNQXZ6UVRxRzdabXdlQTd5UllXNTR2ZmZBUGJUelZQZWFV?=
 =?utf-8?B?MVQ4WjVLVUkwd2tsbThTeGJOVGFsUUpibFVkWHV3ZHdPTjVaNHM5T1VadXRH?=
 =?utf-8?B?MEo3U3B1ZXdVNDNLc0ZHQnVTNDUyQk5KV2ZLK1VTRUp6UDRORHF3NjFTb0Z3?=
 =?utf-8?B?eVZxOTVHditXRStxbmJySHZLQ2tqVG9kK2pYa3VEcDBPbDFzRm9GbGtULzlw?=
 =?utf-8?B?ZkMrUnBkQjg0ZG9wWWpqaUdhMFlhd3JTbUJ3YThWOTg4dUQxZTJ0RWNXVVpz?=
 =?utf-8?B?a2FsM25aTDNxWVEvMVVxbHZjc1NWZUpvancvMG0ra1QreTlodVVUb3NBWlBx?=
 =?utf-8?B?dlcrY25CdnVENnQ4OEJ5dGk3aVJWakNxcjJsdmtSUG14OVptNitsTDFhWXlo?=
 =?utf-8?B?VGxyWDE3KzRLS2t3U283VXNCNWhJZlZsWnBTZGovUVJucytXOXZoSXExbkVZ?=
 =?utf-8?B?WVBMWU1IcUp3OTYxaTZvV2M3TzhwWmovVTROUHd5ZE5QQUlXRnBwblJuNnRt?=
 =?utf-8?B?NlBrWEhNN3FLam52OC92ejNBL2ZrVTRKZFFyTzVGMGg4ZXNmUTdsVUxTMmFS?=
 =?utf-8?B?WUhiUXEyL1dhSjRqb2NxU1FGVllaWTVacmxhUmIwZkJFbWdyRHhQT0xUd3Nu?=
 =?utf-8?B?QXk4SXNmbENmMU9oM1NJZ05PN2RxZHJJZ3g0VS8ySndqVzY0dHc5dmZwY3lD?=
 =?utf-8?Q?rv8Iz8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(19092799006)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUtDdGtuTG1MZ1UyV1VYSFFidnBPYldjRkhpaGg4ZnFJclNLUXlPWHRpam82?=
 =?utf-8?B?MmV1ODlzZE1UYStlc1RqRTRMNFo5YkhtZlhGWHgvR3pPL2tSNExtanlQdEpN?=
 =?utf-8?B?SUpGTmQ5b0U3WTdpZ0ttTnJrZkdaQzNORnI2alh5T0Jac0Z2V2IxTFQ3ZmtY?=
 =?utf-8?B?dFlxNHRWR0hnaFppN204YUQrYWk1bGJxSytjemFieEJzQXJKOTJwUlNFWjQx?=
 =?utf-8?B?aHA2SW05cmRic0hwZ2NpM3N0ak5aKzREVXNwNGlhUXJraEFYK3A2alcwV3JF?=
 =?utf-8?B?Y3lWOGVhQms4VEphTkMwWms4TmZLMWFMaGZBUmozRW1MSTI3Ujl1SUJKSVA4?=
 =?utf-8?B?M2dQUG1QdGpRUER2ZnJVVG1CbVBVYUZ1c0lmTTNHTHpvTGFaU0hJKy9xajli?=
 =?utf-8?B?aFVWejBJRnp1WUw5TlFpak9FM3NEWWNCeGlnVHhGWDcvaWtaRlJndnZWZnFG?=
 =?utf-8?B?MG9VRXduUHhJMk50OURWUXhRdnBTWUJwNEhaNWw0aWtnVlNzQVMvNTQ2R3Bs?=
 =?utf-8?B?UVdFSk9nZkIwdDJFUW5FeXlIcjN0Ykcxd3Z0YncrNUxOM3A5aDNOSE8rSEhq?=
 =?utf-8?B?anpKYmVTM0drUE9tb01ncnVHUFU5NVl2QTRPdUxMNE4vZXBHdnhSN01rUmNy?=
 =?utf-8?B?RVI1V2FvTkwwNGxqMHBlVlJRRURXWFBEQk13TGlEczNtWmNQMi9MU21xN3Nj?=
 =?utf-8?B?dXdaSTJYekUwWDlkUkM2dkN0Ry9KUDJCbXlsQ20xazliRzFEblJTWE9HTldV?=
 =?utf-8?B?SUVhZi8rZnc5TGFLSzF5R1FHM1c0ejFLeXcvc3ByMG5nbXBjSnE0SFc5dHNh?=
 =?utf-8?B?Y2RGK2hhOVJ2dExsRXg2N1h5M3lxZmgybWdYMXBTSmtLak9jS0dOaldHTmFU?=
 =?utf-8?B?SFpMdGhpNmJmRmo5MGhXMnBWdTA4d0lFb1RHLzNXRkdIRjhVUWs2Zmt0blZs?=
 =?utf-8?B?UVFBSEhmbm5rQzNSbzhsUlRtVE1ZQzdOMUxsa2l0cmQyMFlNcmZFYWJZMDhU?=
 =?utf-8?B?MnJyZ0xzdk8xcGV3a084SFRIVTY2aDkzaHRocGtZVVh1bU9KdWkxZ3QwT0dN?=
 =?utf-8?B?QzA5ZnFXUTlITTUvaFcyckJ0aE1YV1prd3hzVHVtVVYzN3V4eXc0RmhIZit2?=
 =?utf-8?B?enRkVDJoTkR0U2c4UDZ0dFdtaVQ3M05TWElvZjV4SFptS1llbmEwYUtrVG9a?=
 =?utf-8?B?S0FjTDNuWDJ6SUZEek1hUmdNODhLakhONUxpL01icHg4WkxHYnNTUmsrMDVt?=
 =?utf-8?B?MHI3VDAvS2xCWnFJQTNLU2RLdlJUcE1xMVlrajRkb0kvUTFHSXcxMUVoWEEv?=
 =?utf-8?B?RUEzcTdrdExQWS9xY1pta3VQYjQ0MVozdlJtenQxd05NWENBS0tKU2VRWkQy?=
 =?utf-8?B?K1E1ckR4cmp3dTFMRHJjRlR6OTYyTGZFMWR0RkQvellGVTBLTm1wbURkd1Y4?=
 =?utf-8?B?QlFLM2hKUEw4OGVUNE9sSGs5NTJHcVFmaEtXUm42bEMwZy9XRjNORjJVRXh0?=
 =?utf-8?B?dzA5MDFQK25PRFEveWhiM2VUbFVxR0lvN1o3cW9lcVVxanl4VDdGUEV2VU0y?=
 =?utf-8?B?S1Q1ZHFTa0RvZ2Y2RFk4d01Jd1E4L2pJSmpBNkk2TkJqYjgwdVM0SDBoQnIv?=
 =?utf-8?B?OWJwN0ZwbXh1Y3k4WmpyQVA4V3lidWN5cmtMNnBvOFB6UW5hWjBXUzlYZm5X?=
 =?utf-8?B?YjhKZkhBekI5Tm5SZk5yV0dzTjFNQUQrZGUraVZFcnd6c1orb3hXZyt5T2Rp?=
 =?utf-8?B?a2txOVlpZ0ZtTHpiWHQ0QU1rMFUvalB6LzBtemcwbjZnKzlVb0NBWWkxeW5x?=
 =?utf-8?B?clVUaEdTZFRjN0tZV3JOdTZ5RE1RQUNlbE45djRhc0RnZDNMd0pwOUJQZ3VG?=
 =?utf-8?B?YTNRcVM0S004YkJtUnB5UzZuRDg1S1hHakdiYk9TTWNWMEpSS01lYzBQU2pQ?=
 =?utf-8?B?MVZiSUUrQ3p4cE5INlZhZXRXVm1Hdml3R3A3MjY1N1FNWi95eXFnUkpxQVds?=
 =?utf-8?B?dFpFQmdvYjJjc0VjYTk2MU0reDBxalJQdklRK05qSGtVSzVJUG9kQzRaMHAr?=
 =?utf-8?B?WXovRWEva1JkUWJaOXNDSFJZNlcrOC9KaTBzSHptWmI3UFJaZmJjQlNxak10?=
 =?utf-8?Q?q+Nc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e43f27a-6d76-4640-38b1-08de01ecdc86
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 19:49:55.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imWRxUnvA4IMMd2+QMsyC0PwRWSlCohNtZ0xoC9k3/aG9VxMo7chUo+YD17hvSfDIqgAyE9qBIVXG29ggh3yEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406

start_dma()
{
        struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
        ...
        cookie = dmaengine_submit(rx_cmd_desc);
        if (dma_submit_error(cookie))
                return dma_submit_error(cookie);
        ...
        retain_and_null_ptr(rx_cmd_desc);

        return 0;
}

To: Vinod Koul <vkoul@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: carlos.song@nxp.com

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      dmaengine: Add cleanup FREE defines for dma_async_tx_descriptor
      i2c: lpi2c: Use cleanup helper for dma_async_tx_descriptor error handling

 drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
 include/linux/dmaengine.h          |  4 +++-
 2 files changed, 6 insertions(+), 9 deletions(-)
---
base-commit: 019ffdd87705bcef1ca5cf9bfdd2b358ce190ab5
change-id: 20251001-dma_chan_free-0392f4004d9e

Best regards,
--
Frank Li <Frank.Li@nxp.com>


