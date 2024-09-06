Return-Path: <linux-i2c+bounces-6329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF3196F8D8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5637B1F23CF9
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6781D31BB;
	Fri,  6 Sep 2024 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="FIGZ8mtT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC51D45F9;
	Fri,  6 Sep 2024 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638163; cv=fail; b=QSLfCYfi2ud1XfgDk8HgoevXFDDEaHaN6FW/TTkvbZjJsVJeYQ+e9TobWIbdDQsKv34/4BfC3QkpX5vtczXflZfvcvtOA68AGk2Iexorn8tMMkja1C7bnSVyBFxOas6xoGPGCv0sFN+KrNemCzaMZpP03hj5/SEeiQsy22TxVLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638163; c=relaxed/simple;
	bh=VyWkcMH1vIMrAshFDYbhv33bvEhtmogMG2bNAFhK2u4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j+ZnwOK6Xt0c+aiSs6zCHQE8C6YuBVOQSSsF+t20DyAmvSkaJTSRYhmCbA2AcTIatI6VPcojN92iEB1GFXNa8ZJuUxf5Ueqb+FTwPUxLZBTeWmEWHbZRqeYloBQw3MRo8M2MQgUSw9a8b2pBU5mH+dX7dCWNClyrobHATQgPR9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=FIGZ8mtT; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSsVAg5lcpCpGlV3clQJ1LtzR5EleY8szti7Zlm8yL1A3OCsuI6o14pF2rpxAxwjK4EOjsi6zMsRbj2htIuFUZaCXDHpV9If2tCWu2tds8KdcnxRA3RSyVQMqzNCXaus59yaOcdKOwvl/m1RXTdUzA4Tg78zToQOzrndn4DCCdN3ErwgmGKaHYH6b3FQfJsuogFLujtQ2votnaKAUVb/DN/VCruzUrZJ2PShGXOCX8r7AhZbLlFpJ58w6RUZijUXtr5Re2pPVd+MEsRN8amH81YHjjMMmNzQvdheIHFvXuKo9ri9sEumCiWRDhJUX0F6NjGYIxrLJQOMvHfts3AvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGwa/A4vBTysDmSS40p/93vepDiajPAWaGAkELG3XwM=;
 b=voNNhKaD+ElPqLKpeqOUXW/SqG0NmZKPUS3kht2YBocrvdXJgVP1RxoRBxiJbyQPGEqbUoSJF6LBqLudIT/GvEC537U08pK5VXZW0cpyRsLv5xxCfta9RS0lYwxji75+ebBxcwhyjRMvopl2adZ2HNcTMcodC5QyCKgxzfAp5lgNlLrXOuvOctEY1VvOK9wjmnlELx9C1UOFH0g19Uz3VHPozFgKNQP6BaD34mqU3dQDaIW6s54n3yUwSV64kpp84l6Ei6CC4DFJ+UBjVPTsDji6CmL3fSL6L/ceyWYhAjyxJAq5eVp1cR8jM9N0MX+GOWwG9Bqrx75OQM8WdHCMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGwa/A4vBTysDmSS40p/93vepDiajPAWaGAkELG3XwM=;
 b=FIGZ8mtToYhraPBzZEVJHZawBI7OQLpgIYbnpPKf1sHPwlj2u6vHI+68rR4fUEDf7QG+jcQGIPgiuR/Yu9n3WFf8XkxwDG+delA6hr/2xYaQFEsLpi/qk3t+xlGFLLDlybuveumC8roDRZ7xx8zg+cvZ2DHRs/jfTdq/wiEcv+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:51 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:51 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:17 +0200
Subject: [PATCH v8 6/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3399-puma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-6-dbd28a150e41@cherry.de>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15-dev-77eae
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PAXPR04MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f7b517-7e9a-4c01-b19c-08dcce8c61e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXJJdk8xbTV1cUQ4ZENhNG5FdGVSVzVxSkorZjFaSytVK2E1MElSV1RyZ29v?=
 =?utf-8?B?WFlkdlhZc3FCeXdCZVhPQ295b0tDTEVsc1RvVTVlNTBNV2FUeWlXaDRlaFM4?=
 =?utf-8?B?bU9aMGl1TDBvQzc5WnlQeXNtL21IeWVGMk40MHl0RFhEaERpNHBGNG5MWUhh?=
 =?utf-8?B?dUduYjFLMzhLK0QxR2Z2a2M4elpqWUUwdDludXkrTGhXWERLRHNCalh2QVhz?=
 =?utf-8?B?MEJ3c0syTUliTFZBTk5MQ2Q2NlJZb3QzdW5UV1k0cEJ4QTYvc0NRcXJjWnRB?=
 =?utf-8?B?MEoveE01aGVMU0R0MGRKQmU1cktJcmJHblpoUTFOOHNhUk55ck1PYlhiT1dY?=
 =?utf-8?B?SHkxUlNSUGJKNHB5dzJHWlYyZ1hjMGN3aFJKTlRiaWJncnI5aUIvSlp2Q2Ew?=
 =?utf-8?B?eUt6T3EwY0pUdU1QNU5DZkk4a1JSUDRraG50ODU1QmxqQ1ByMmluTWJVV0My?=
 =?utf-8?B?K2Q4QVMxa2c1eTR2K29QZ0NabHpnZFZUNGxrTlMwQVdtalVjQ0FxdklZVXdn?=
 =?utf-8?B?QWxCVDk4dXl0T1NCMHBMMmxQUFUwaEF4NlN6WTI4SjZxWGlQbjZUM3l3MXZt?=
 =?utf-8?B?VWRubUpXeHAxVTY1WEJTUVl2TXFsT3pwY1VxcWFDditqa05Ra2QxQWtnb05l?=
 =?utf-8?B?bzY3cDBHTTV5NFdVUzJOS0xkNGowaGt2dnNFUDRYQXVHT0pIUTkzRWZWczVE?=
 =?utf-8?B?TDVza0hlVDA1MVVEczRBY2kvSUIwTHNFRVpwajduZUczVDJQUHdSYWJwSTlP?=
 =?utf-8?B?a3JCa2FVc1VtczlSMUZrcjRLeFFHMnNhUTh0NlpmMERBSXBCcEZPd21GdHMv?=
 =?utf-8?B?OW53cHdBbjFKazN1RWZOTVdDaE9YNDZoVXRHMmNrMGdRYWkxZXJMcVI4R1ZD?=
 =?utf-8?B?bHZPZjRlRXNoSzFaVkxTUXB5WjhQQ08yZE41bGViS1ovT0lTTTh2amJFYUlW?=
 =?utf-8?B?a1lJZnZhdm5zUWk4LzFibytidzBWcCtjU0hrSTZXYkp0M1RqdCtsR00zYU9i?=
 =?utf-8?B?ZDk1NFAxOVhpajN5T0kxVjREZTdSQUQwLzl2a2ZpSXB2VEMxdVQydUg2bTZY?=
 =?utf-8?B?WkhvRjlJOFBRVzNkQWgwQnRyZnI3NTJMeGMrMWNMRXIzTWdoT0Uzemtkd2Ix?=
 =?utf-8?B?UXJscFZobWhXcFkvY3Jnek9RTllBOFB5Tjl5U09Za1V0TFlydkFaOTNKOWdy?=
 =?utf-8?B?VHRqdFk4UVFCZWNiRGRBenlFeTg5SXdCTEVqM1ZuT2tIWE1hN3RsQjFOTUpL?=
 =?utf-8?B?Wi9tRDh3WHRRRkhQVlo0eFRtejhpN0lkZm5LaHEzWGwvYkNUNFkyTWt2S1Vi?=
 =?utf-8?B?MWZIZ3N1b0Q5RGdORXd1ejE3eWpUUVoxdGhBZWUyT2ZwbVFQZFpBODREdE5t?=
 =?utf-8?B?Vm5MempYelFjcGhMdE1COUlPcHYzbjJRMEk3aXAwWXhXYjd5dFpab3RhRXJT?=
 =?utf-8?B?NHRscEVlTjBFZHZPK05pT01Rcm12Z2JvM0JIUXZ1TThKdGJuNGdVMEVwV2ND?=
 =?utf-8?B?VFdJbTJGMTZiU1djYy9TN1lBUVhxazFqMlgzYTI3RU8yMThBa0hZcVdmVjJZ?=
 =?utf-8?B?eHF6eWgvSmJPNU55bGxuUDI4WVJjMWxZRVN4S0cwMUdobkdIbTZVYXhxVWZG?=
 =?utf-8?B?dXFwZWo0Y1Jrdmx3bGk0emJTbXpMZlp4c3BycTZMQWtLRUJKQWNXbytIUXFt?=
 =?utf-8?B?ZGJjajdyelo5bUhJT1g3VmhaVjk2YndncnU1S3paZzVtNVBWZEEwUHAvM0R1?=
 =?utf-8?B?SlRNeG5qanVoeDE0MThTWXBwYllBSi9xMHB2aXZwbWgzYjY5SSt4aUhVVWlQ?=
 =?utf-8?B?NEVYVWFCMDJFN0ptbXhNYUN4QkZBSURHL0IvMER1elR6UDIwMDVjcEhDL3RC?=
 =?utf-8?B?cGo5UnRSdGozUG56TTRybjBVcmlMeWJCc1hzZmkxOWtuczVoQXZaSnpWS3Z1?=
 =?utf-8?Q?JoweD44p9rk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1I0ZmtHUDBUOHpSaS8vVm4vNkt1cnYzajZTbEMrbU9hN2J0Tkl3Y2xQN2Er?=
 =?utf-8?B?UmZ6YzVhdjRSdE9obzM3d3FyV2luR1BaQkhPQ3lzcEliMzd6ZnVydzZtTVZl?=
 =?utf-8?B?NHpvVVdhNGltdTRNUDNjeGk5MFJKOXYxa0tuK2Z1a1g4VUZmUXpkWkcvVlZt?=
 =?utf-8?B?L3Y2Y2Z1dlQxUnMxS3dNQXdIVy9CbjJOemlFOWlGdEdSbXZXK2pQbi9oNlFw?=
 =?utf-8?B?SDN3VlJXRzljVGdseHpxY2NZNithVUJmT3VrYWI3M2k5NFVFSkJWSFU5MGdj?=
 =?utf-8?B?Z2orT2dMalJQN25rT0NVWEVSbS9TRjZ0NVhBYzZzQ2c5MlMrN2wyUEEzMjhn?=
 =?utf-8?B?dGFVQS8yOHZ2TVoxN1RDaGtwZ2dRWlFsdXhRc1FtNzlwRUJNLytScmNLVzNG?=
 =?utf-8?B?Wm1uSWd4azFZcjhWSlFwN2FzRk81T1NEY21MRE1wZjdmQ3B1RVg1M0RsK3BD?=
 =?utf-8?B?SnpGaEg0cTh6S3pNUWtZTmROSWpscTdWNWltNnBSMGRWUmxVbWEvYlJlakdK?=
 =?utf-8?B?K1BobXdZQXVwMEwwdjdwdklta0pHeStUaXUxcmNKdTBkRFpaQWNwUHhHOGxm?=
 =?utf-8?B?anBnYS90YjFudFB4clJ4R3RZY3ZwRk5sQXJWT1JPZUpWZjhsNnE1a3pmVmZx?=
 =?utf-8?B?ODdyTVJZMXBJNWEvbWVXd044c210NGczNFVEWDR0MHlQZkVycTlsdHZxT1h3?=
 =?utf-8?B?NWd4Rk9PL2JmZFpVWGJIQllkS21HRXM3TFFyVGNBck8xRjkxM0dTWGFIdEF6?=
 =?utf-8?B?ZkNIUXpVc094ZVU3V1NUWG42Q25rdFE4ZmZJNm0rdUd6UmxWay9yY3VRdG5z?=
 =?utf-8?B?a28rbFg0MWpGNUE0RG0xWkxXSzNZci9pZ01CZTlsTnFlZXlHTTVtdXo2dXg0?=
 =?utf-8?B?U0R4ZUJpeDFud0lEMmE2YkhaZmlUNEZlTTFHWkNtYVMwclZjZSt2U0E2cGxr?=
 =?utf-8?B?ZkxUb0hhczEzc3UyeFBzbmlhZHJTRmgreG5jejB1ZlBpM1hPZS83WEtpMnZN?=
 =?utf-8?B?S1UxY0FNVUtkOWh3OVZCRGdUVlV6MzZ5bmIrRmRVM3B1UUZzYXRHK0c3K0o2?=
 =?utf-8?B?cWQvNE5yNC9zenZEQ2VKeHJZTmVZWmJqOHFnbHVJalhMck9VYzUxd21NNVNV?=
 =?utf-8?B?bi9WcjR6ejR3T1g2NDAxK3hwdmk1Q0ZFMUJtU1VJYmZYUWszL1JpckpvWVpZ?=
 =?utf-8?B?S2loUmxOOThHdEU0NjZyUHliWCs3NEd4M0ZEaUNMQW4xOGdFUnVUZGlNTDVu?=
 =?utf-8?B?YThQaTNOTUR6d05TazlOd0lFUVF1N292SEUzZ1hqL0hRdE5RTUJTb3l4N1Rm?=
 =?utf-8?B?RTdKYW9ZYzluU2ZnVDVQL2VHcUR6d1ZXek1jb0liSC9tTkJSUk44My9SNWVM?=
 =?utf-8?B?a3krb1h5ejlZOE1aVGNCWk5oY1BqeWdIYnNNeFQ3b2NLOGpkZXVNQ3hVblpk?=
 =?utf-8?B?bmp3WVduTXhKaWROdEtxWTJzZEcxcnpOcjVxSE9EU21CemluVWs5N01xVWEz?=
 =?utf-8?B?ZXdoR0drU1g3eEpjT1pDMEx1dWNIWE0xb1JSWkoxYUs3ZTUzL2JwK3I0RlZ5?=
 =?utf-8?B?M3UwdkRqb2drdi9IekN5RVhPekN5ZGc0amlFcmdPRW9IUlJIVDVad1Z2algv?=
 =?utf-8?B?MTJZbGowTTI0a0toRHkwdXp1dXR2bjlVcmpETlp4V2piTk5zbE00Z28yWi9G?=
 =?utf-8?B?bTBWMVNLcldoci9CUVEyZGpkQnJXbjk1U0N0MXQzUEkxNk80dGNLYWhpd1pO?=
 =?utf-8?B?ZzkzMnJucnE5UWhUVzNXWEV6Z1ptTmNuY0d6MnViMW8zS2tuRkdqbmpubFRS?=
 =?utf-8?B?aWZKSzZ4cjE0dVdnb3cra3hMczlqVC8xR3NIK3N1YXNQeDVEYmtYMkVKWlhE?=
 =?utf-8?B?SlRaa3NwTVh6eHI0aEF6UEhyYUd5eG9qcGczQXllaUhnOWhEUXBjWGREKzR4?=
 =?utf-8?B?U3VWcVJGaEFKRnNQOGN3d3FFSUpGUS9ZNEYzMkNWd2RWUUxoVm5lbU1JUU5N?=
 =?utf-8?B?SnByeG1JT08wVk1NUk1zYXBDSjVibHFMK3FiWk80Nnd0enpQZWU3YzRyY1BZ?=
 =?utf-8?B?VmpNVHhRUjJQZWZsRUpHeSsxOU5KV3lRamI0WFd6ZkVXT3hDeXhXK2dtQ1hO?=
 =?utf-8?B?NTdjN0ZGNGlrYWlOaUtEc3hRYXhJc25VZ0kzR1g2UndTbEdKdDdhTHdUMnh5?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f7b517-7e9a-4c01-b19c-08dcce8c61e4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:51.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLZRHxnxkZgKRBy7WTvoO7p4OlUVfTefGrwce84GQmrOanUNe+5DOapZJpbpncjxul1BiVl6nhsyLzXyATlUzH1HG0mrXw1wp1oAW+oRJ14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patches 1,2,3,4

 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index ccbe3a7a1d2c..72a0bca57385 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		ethernet0 = &gmac;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 	};
 
@@ -378,14 +379,25 @@ &i2c7 {
 	clock-frequency = <400000>;
 
 	fan: fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


