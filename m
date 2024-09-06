Return-Path: <linux-i2c+bounces-6328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA32996F8D4
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D6C8B2453B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892431D31B5;
	Fri,  6 Sep 2024 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="NqClS21b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82D1D4179;
	Fri,  6 Sep 2024 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638162; cv=fail; b=pY/qZZ4D2YP87Lust+sD2KuSvZGrGU5QccArdeis6hcSgFWyWUNi4LbDuWz9McKOsK008oWMg1PSQzs84rR1bk6c8HLlF5P5tX317MRIUoB1kr4vM49jnP+ue7BfoE/pt3uR2Tg7YF88M4yiR5IvXAEg3jsM0tmsLMPmo1tfQnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638162; c=relaxed/simple;
	bh=S7s9qDoMVXGaFywXlkhz+h2UHx51YfqZuzNCpBeo5no=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JCLnbM9O+XnsGqetJOmZLvg7adajITRrJVfOODjHwSVLVqRTrG++VWOUI/unQom838YFuaCE5rTebtbwC6GOYiU8pL442Yb5Z80101LMtE8LtTqSTLzTLTdKq6F+qmHsIQL1X+T2YsqH/g+hRH5poZ/P5yqet+dKtvONEK9kC7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=NqClS21b; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dczkVQK4Bl1FGyN2g4v6QpU25ZhB5H6nHOxw8ArcJPjFnvJP05P3TsL0gn1Ni4tBzdfk1tRf3P7NM03RSe3m6RmXel/r6XITYihdhicB177T0uqeylOkO1LQwPv5ChivJ7fld6q04Hhepc0NrF6o18ge1rAwGDEpBSaDMrp+5EK8JGjqOvZVqDI56gSuwnd+X+3mLWv+ScDC4LCT4a1/iHUouS5T8BXxJ9mucepCpa+I5Ijr3VGjyFjQKGVB3/fpmFVIzQdRAgEPSOWDxHoL3oqsRtTpV2xwxkxdyY/TEFKZN+JWupC1ItKKYGV9Wv5hr3+JNLRpFRpLY1pGw5IBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25dGd0E5AtCR8zFuoAAzxvVQNaW8OT1xvILoEmM433I=;
 b=xMHAelBx1aRlJuD+fU8KU3IkQnrgZt3dFAxXtL5Wqb6XAkgzFhABDmZYOH7GC6YGUJIo9JAkiexyFuSHrTe1t9UeGqAbDAMaJ2VfvmijtQh65QxTlB2iK0YafFs4c+zCMwRu5SKkNrt21vn/u134KY39nSG4wqTVgwlrJbbarNOJOzr1LfTBk1nLYGa2MvcqgYli2xkKhxSuwevM2ekJ+cTccSFwDbaJF8nH302oZZFQG2L0EEA+EhysMYaVnVAJFAYqsrFWZPijXTB7tqG7BptvRHoYKp8VmiqzoZFGcRkcAmkIY4lby5d0ty7XuHiXVpp55/FKVilRizTvsuplHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25dGd0E5AtCR8zFuoAAzxvVQNaW8OT1xvILoEmM433I=;
 b=NqClS21b6Oq+7JJ0vqpqekNYgsDvFrcwSyrUiK88DtnoOe1d7/KT6qfdNP3UZgsPasFwFlbAszHodlVSsEI3QslifZR0BNZw4NktcnFwYH4CGgLpNtZ2GgKNWGh4XGk6IKeGWX2vuwHlfIGqwrr8POsPvupNpm19rWNd5CZs9ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:50 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:50 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:16 +0200
Subject: [PATCH v8 5/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-jaguar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-5-dbd28a150e41@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 50e25b67-2657-4993-78a5-08dcce8c6165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U05Kd1FyQ1FuWGR1Y3NHVWowZ2wxRjlaZnduMm4ySWVzVU90ekRkZDYweFZu?=
 =?utf-8?B?V1BTMkxtUVZmSHhLS3c1akZpdU5sNEFTMitXZnl6bGIzcVE0YlB0MnRwSUhw?=
 =?utf-8?B?c2ZyTDU1TVNtVFpmUGxEVXlqdVVqdm83Ulo2aFBRc1o5UjU3UEVQbXZZT1pj?=
 =?utf-8?B?MnlUdVcxL292OCtiR2VEUXkxWnJVZ1BzRUFyM2pXN3YzK0tZV3Brd1Bqbm9P?=
 =?utf-8?B?d2tseFlBR0VsMnplUjljaXdQOGZPaElaamFUOEs2OGtWdWkxL205ZkQyTkxm?=
 =?utf-8?B?VUoyNHArbGJzQWl1MDhFS2k5WDJWVHVZd0cvVlBBYXp2RHlOSFJsYTRuZmsy?=
 =?utf-8?B?T1RvQ2Q5SmZ3TzB6UDJKOEdoeHpyUExpR1FpT3lTbUhDd2hRaUJTMUx6ay9K?=
 =?utf-8?B?dVZMMTZ6L1BkVW0waTlKQzdxd2x2OU8ycnNtb2w0eEVJS0UzSjBIN2ptUWJQ?=
 =?utf-8?B?YmIvbjF5Zk9jVHRRK3JJMG5VZ0lMU1RDMEhrcUw1YVVDVDcrUzlDdUFrY1Q1?=
 =?utf-8?B?RGJJMW5lZ0hIT0wwbGtEVWV6bWFpSnhueEdTakJtRnJiRTJHUlJMUWEvVkMv?=
 =?utf-8?B?aktvYk9kcGlLbkVuZ0lZZXZqdXY3bzIvMUtPZENpUWF6SUJuOFJjdU5vZWc5?=
 =?utf-8?B?YzliK3F6MmF5dm5lRnVXWjF5QUE4bUZYSnBaQkc1NklNRzdrS0N5ZytJNmFV?=
 =?utf-8?B?aFdKbTYrcENYZzh0eVV3OW16WEJ1dHIvRFdiRC9FcEl4Myt4L2pteUxSQ01I?=
 =?utf-8?B?RDhzOG4yVWdoM0oxazlxUXlXUWRxY3lPaUpud3I2WEdpM2t4NlVhcXBtSUY2?=
 =?utf-8?B?MFVkZk9hTm5MRDBwYmhJL2JDc2tvUzhCSkxocWw1WnBCcTVwWjliRXlzRVlX?=
 =?utf-8?B?cmsvcGgyQUdXZDRwMy9KMEtaZ28rd1QvY0JseFZUR0gxZGlLNWQ5dE5NNUUw?=
 =?utf-8?B?TGZQL2RaQVJwVTNhZHdXMGk2cVJGeCttUnlURFF2SkVSQlFDZitleFF6ZFhx?=
 =?utf-8?B?aW90RStySDNHM1I1Nmw4aTJNN3BJSVhpUE5EQ3Y3R1Z2M1RvRG9GRFRBSDRR?=
 =?utf-8?B?RmNjZHhnOGxyQ1hVZXJ2RDVYYXg1czhvblBTekJ3N2NPU3hkcENvS3JuN1Bw?=
 =?utf-8?B?NVZ4NGtNRzdvdUNmN3ZIdDBIYjVTLzRBWHV5SFlPdXFmNnFnek05MGxNejVP?=
 =?utf-8?B?OGF5OXlzRG9mQWhuOFZRVzdrWFNoYU1aNmNlNlU5N1kvbnNUTzlOd3ZvTG9F?=
 =?utf-8?B?bXRtTUVQZHQrMUJ3WXlXU04xRDBsaGt2U0FHSUNMOVY1ODU2V2xIamI3ZENE?=
 =?utf-8?B?b3Vyb2FDNk1ZMk10WUYwVFZWbHZoT0gybjF5bE1uY016WVhpK2k1amRXTDhl?=
 =?utf-8?B?OXRnaVFmVFRQSjhPY0tGcCtJMGh6QmwxVmtvTytGYUdRQUY3UHZnVTRRMXVK?=
 =?utf-8?B?OWtsZjlyUm1pTm16blBZLzlobkp1NjBFVm12am9GRTN5eXZ0YjFlT29tSFRn?=
 =?utf-8?B?b25vN0dOTnJzRlVQM0dIbmNyOXZOVnBhUG9Uek9UdGhPRVFIUHdUUUh4V29D?=
 =?utf-8?B?TS9XVVdGTEYwdlFrSjl5Z01Zd1ZnOTltd3NuYmltejRKY1J1N2tWSEZOSTNo?=
 =?utf-8?B?azZBb3plVjMyV3ZvOFdkVklaTXRkMVo1bFJGUnRBY2hqdmFJOG5rTkdXYUxl?=
 =?utf-8?B?aFE5eDA0bENlRHgxRTRML0NxZ0xHTHZNWk5oY0k3OXIwUDA5NXZXekt4TEc5?=
 =?utf-8?B?U0d4N3htT2dLMVJaTllrUG13eGxhdHlIWG1oWkpnYndlczEvVk1QQmtDM29P?=
 =?utf-8?B?a20vVTRaMUxNNUJydzdFQloxa1RxeWNEZ2JucHpnd1lHSHA3ekNSKzhHM3RG?=
 =?utf-8?B?Yk12cEdTYS9HTUNwczlyVFFLQ1ZRV3c0T1JWcjJGZ3hIWDhYVFovcE9QZzJE?=
 =?utf-8?Q?vRAcHkstGaA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S21XQUIrcmFOR3dpR1F0RWR4VjZkMDJmNDNoeFJzZGNLUC8yTytSdHp3R3Y5?=
 =?utf-8?B?MWduOXFubmxldTQ3aHJlL2JmeXlRWGl6RkluQ0RDdm9IdDA4aWIrekF1cXl4?=
 =?utf-8?B?Y3B6eHdnNkF5VHdKNDZXSUJJeUh1V0p5eXE1ZzkrSjMvbWRxRTBCUUtQZnpF?=
 =?utf-8?B?ZWIxLzh6Vjg5VDdCMUd1QzgyYXJCODNhRStld0dYeGtreU15VG51bzRjZW4w?=
 =?utf-8?B?K3poSEtiUHN3MjU0UWptMkxRUXlWRnNqVDVBdTZhd3E5SHo4WSt2bXg2NzVT?=
 =?utf-8?B?cm1uZkZHNnlnbnVobkZMdW1OL29kYXVWcXlWOStEeXFYV0g5UUZRbGwvVE5F?=
 =?utf-8?B?WEhGRUNXMmRpRW5pWFRwOEtaMlhuUm9oc08xSEVzSGNUNUF3enE2bVQ5eGJ0?=
 =?utf-8?B?YjlwSEFyeTNLR0tjUXBpamVBbzlKZmFnaU1ZVWJzemltOHFvcnAxaEh1RzMz?=
 =?utf-8?B?NE1nRjJzbkIyTStmK25JUzFuMUx6dXcvV1lESldzOStLM05ZbVlML1B0S2Nr?=
 =?utf-8?B?QW8yUmFoUmYxVmdlVnN5ZUVsOVhyWllEbHcrbThFTkJPemVLZ0RJUHhOZzUy?=
 =?utf-8?B?ZTZoQzBrQS9jbFBrZVo3Z1NGMUpHUlZvaC92RTE0QllzQmRPbVdHZDFEQmth?=
 =?utf-8?B?S3NPUVF2M3hQSUdYaUpzcElzNlRkWUtPN0YvaXh4YThSckZQRDluNitlTnIv?=
 =?utf-8?B?WXJiNW1SeGp1T3ZKWWtKbzNLWTVkRUVub1ltelV3Y2tGaFprZlRFNUFORUk5?=
 =?utf-8?B?RURWSWxjQ1hTMFRsMktXd3JGazl0WWhFVUs0ZkdYaklscVdMOFlNT29ZYmhu?=
 =?utf-8?B?bjQ2MWNCM1pRSUVGaGdBR2g4Vmo1SmVIRk54L0Vta0JjZEhSRDAzL0hTRUU3?=
 =?utf-8?B?aG5HTm1aWnAxYkNKejVEMm5GM3RESSt6c1BScUw1K0JMcXlCd2VSNHBNMTAw?=
 =?utf-8?B?M01rQVVUV3lDbFlyWXp5Nkx5MHZtclFhY2FBTG84M1hCSFlSdHRpZHkzZmNs?=
 =?utf-8?B?N2tVd3hiem1Zd2dKWkVwQVFXdDRCT3pzQWliRlNQZU5HQVdNWUh3eXRqMDJZ?=
 =?utf-8?B?Z2V2VUxpdko0dnVRLzluWnh1Y3E2U2VReStjTHlWTkhFTW91TlBrOFNUQkc4?=
 =?utf-8?B?UkxTU1hSODBqb0JSMk84dXZDZmd0Tm50UFcwaHlwQ0xkNWVTWkQ4d1ZEU2hh?=
 =?utf-8?B?ZkZhWFNpbERIcXBaaXR4dHcvMUlGVFBZMS9teU43YlZrQmsvSEg0MTI5bWpO?=
 =?utf-8?B?T3ZuZk9Oc2dRR3ZlUEQvUjNLdTBVNEFlRWh6ZkpOamFGM09tczE5aGt0SkRj?=
 =?utf-8?B?djFiamtCMkZYWGRzVVYzWm14ekUxZUtFVXh1QVd1cEN6L0FQc3drTTB6RUV3?=
 =?utf-8?B?b0xhVGFoZ3owNTAwS0pFM2xiOURCcG5mWW8vM0JPMk9za1RkdHA4aHBJWE5K?=
 =?utf-8?B?T01nVWtaYUpzSTJ5TXRUeE81eGV0eldReWdDdHFKdUFla2xiNzhWcVRXL0FX?=
 =?utf-8?B?Zjl6M0REUE5WVHk3VitPVWQ0RzVIN1ovZ3hVUVBFaWt5Zk9rV0ZtcXJWRnpa?=
 =?utf-8?B?Tmc5YXFmYmN0N01ydVJrOXpMOVA5SlBtc0VjeFdQalBDUXFRcXNGd2Y5eGZV?=
 =?utf-8?B?TnIvN0c5VXdVcW1QdmVRVmltVDJza0pPb3ZkSGNycy8yQ1M2Wm50dGZ6SXFh?=
 =?utf-8?B?MzBQMmZ1VEw0SlQxYUJFVlFLbmhnSHliS2hhV2R2SytIc1M5SDB5VGh5ZG1D?=
 =?utf-8?B?bnE1dTl3WmxXT0ZnZzBpQ3JrY1VvMTdUOTdKTk1icXl6eDZreXREQUhvQU9Y?=
 =?utf-8?B?WEdlYWRoZ0ZodmdHV3FSN2NlYmNaYlFZRUJ5dGZUTHZXRDZUSExNSjJOMmVw?=
 =?utf-8?B?KzUxZ1N3ZXJnbmh1aFhodkFJbmQwQ2hHQWNrRmJPUy9jWml2REZxTVFkTlEz?=
 =?utf-8?B?QVJQbWJvT29kMm01cWRuNDdtZmtDYnZiZVJvRFR4d29TL2ZReHZ3YmhCQXVR?=
 =?utf-8?B?bGVSVUJTamZKT21LdjJvOGlCRjZreVdTc3Z0WE12UDVTenNQeDNIdHJaYTdO?=
 =?utf-8?B?amVvL0V2QWxObzdJVUEzekphb1lLM3pZZDN3V053dFB1cUZOUmxqMUNoTWFz?=
 =?utf-8?B?RGNaRTlHcURpTlR0VktuZ1BUOXdpdGprclRnZXZLZ0QvMktRNEdHamFnejND?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e25b67-2657-4993-78a5-08dcce8c6165
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:50.5299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgYOz8Of8+xj/T/zRoiC4/5I+5ErebSlnie05fi9KcrEYyWpC6BKWyR2Keg8D7xmEmF57VHSEffQPYWqk8Vg1QVKzQnPuUqECItP0lC2uT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patches 1,2,3,4

 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 31d2f8994f85..56f87a603581 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -32,6 +32,7 @@ button-bios-disable {
 
 	aliases {
 		ethernet0 = &gmac0;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		rtc0 = &rtc_twi;
@@ -276,8 +277,25 @@ &i2c0 {
 	status = "okay";
 
 	fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
+
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
 
 	vdd_npu_s0: regulator@42 {
@@ -313,11 +331,6 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
-
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
-	};
 };
 
 &i2c1 {

-- 
2.34.1


