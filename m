Return-Path: <linux-i2c+bounces-6006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D403968C41
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0031B21934
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEBF21C163;
	Mon,  2 Sep 2024 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="G/yPXcN+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D720FA82;
	Mon,  2 Sep 2024 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295131; cv=fail; b=OpA+xx91ShKgd2KDNtj6Yqd0xLzC75V1HJ57eOKVJutX95EyxHScWlHtw+aXZtvaelD7m8qY6ZxjalD4LA9cUyb9mT0/ulvFT1ObeDduqLvvAvySRQxYwK6DtJNnKhrzAvRy7rOo256Lp0ldgfHseYdNxOFDwOlM450NPaIIviE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295131; c=relaxed/simple;
	bh=i/M8yJPcY03Ki2kkWdHjugHPVbN0du7sMp9K4aXl/4s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kOe/FuAY93fFct38KMk8PaDA5ygzRPs2JP0bIGrPgszoIvNArrosl0CNy+IOeSSIznTit5YesKMWlD8JucFvRDPho9mDGXYmcKxCnPDCN5vdQbFb66j7wutMmy+ylOKGhu+zx0bAekf0UGZpi+dkvKxATSnc379D6AuCRaRbKp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=G/yPXcN+; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDL8witCXTi4T+cx0gXcQlYQJyg1TIXkhLPizY22zEeRail/OnnTJhzRn/38QQrMbWVGBpG0zEpX9SLiwJcXEE66xRD5++1nITZC0IoOqoKbjaeXFpgq6lUljMXcIV/lHf0CJdyHOgS+8NdXCLCkfF8LG0iOwKzxifLNJID0tzh4BzRM6K42CfYfoJSqc6llYtyMfbTeQ71ctorJziL09RoaBlzy6GpczyioE+AQUAjRYd0Y/fZRhvHTOXYUuDYzhp24tf5un40W9weexqFNuWOHWKim2Pf0KNt0x1pEWBJ/3Wc2FUROPEGtzta4EfTAV1Hg7O61zcf02g7Fyg5Q9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7X6VHwyc7ENIxUNFQ8H6ZqCtiExpK5STM8GkBAPxkU=;
 b=pAOIACtxHZOnF+4WmLtuQNaPLvfSZxhXAL01YfmxKmwWVrIpXmRPWb6iH7BSLI6d/LFCysRKpnpf6zyXl4vt6L2tEAZsN7UsHVdvqXNHbEXDPO+7VPpar2uB/UoDCnHJlAExk0m3QmGwHjWhMQVpRJUaZSKzk2Mmr3Ws6xMgURFA0wYDNz5ULp9yqiqyc46klgG9uu4lHQhqpIUGHH18bOWg0fl+MpJm7O/3zanwMllRGKGmZGGMuR8cGb4RLSSxy0bHkIYl2yAlAbg0wjo+K2VavmaGUTb6dtCGlFYf36fGsOB2ZxziTI5uxOi+WTRAKZq0v+lFYRir+0qsEEG2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7X6VHwyc7ENIxUNFQ8H6ZqCtiExpK5STM8GkBAPxkU=;
 b=G/yPXcN+ZWlQyuqP6WkTMlBIH7VTZx4+pfVJalBJVeL1V/DLh1uCRq0aA13VqjVrz0OcQbeaqfkE1z2aTpzv5aedIo1wcK6SytqxGP7eG6jTioXOxopTvTA/O2TK/ClM+Ye5yU+L79aYqqMQjKGnX7sgvTQVjAfX5ZVnTCyccJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:39 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:39 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:20 +0200
Subject: [PATCH v7 7/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-tiger
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-7-bf7b8f5385ed@cherry.de>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
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
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 44846e44-518c-4b8e-78c2-08dccb6db29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2ttZjJySHJIUVZWZkRydnZ0cU9OZWlpN2g5RXd5ZkZCRlhwVU82Nk12U0w3?=
 =?utf-8?B?clZtbm0yL201QzBNZ3lpU1A0UHFLOWlDU29HbElwbStkd2RZZ1pQcEJVMWph?=
 =?utf-8?B?c3BVOVE5WVZhei95UzlLYVlXcW9xNmFJVEg2MllSOE1wcGhnbFVqUnFHYTVF?=
 =?utf-8?B?ZlFJcXhBaGRKQWwxQmQ5YkxyUlZKZTJZclpsdUNKbE1VTElRS1picHhWVGN4?=
 =?utf-8?B?NXk5MUFYY2Fidnc5amJ6b0NqOHROb2pxUExPSGlmeDNrZmYvVTlwdkE5NjRo?=
 =?utf-8?B?QlZWZUJKd1ZRcHpvWmFYUHpIbFFxVEJBUTVvRVN5dE1kbDJ0NVVIYU01eG50?=
 =?utf-8?B?RjJpVk1odUtuN2RvZ3c4WVZWeGlzQ24rZUJkbWV1ZTB0MWgzZTRjUUduVXpD?=
 =?utf-8?B?dUFZVGlvOVk2U3VjZFUvbDQ5NmRITXNJRDUyejIzMFJnNW51alg1YWFjK2Ir?=
 =?utf-8?B?RVNXT0M0VlNYeDkrU0R5S1h4YXE5TjYvQUhpMXIzd1RZeDJCTXZuVS9xK1ZX?=
 =?utf-8?B?Rm1seTlxVmViV3RlWlVwR3lONkRYVWxVZWJ6S2h0Wkk5TFFPekZmcWtpTzZr?=
 =?utf-8?B?dEd1eEJkYzk1ZEdkRWd2bUY5S01PQkZSOXlDaHc3SDJLR2x2dTZ6aHJRcng1?=
 =?utf-8?B?ZThNeW80eFhicnJGVTlsdEZIU2w0Q0RMeSt1Z0ErTlJ6UElOQUgrMk40Tm41?=
 =?utf-8?B?M3dmb2M5RnJCQ3pnK1M5cWtBYmJTVUhsdWlWNGN3S3AyeU5qZUxxZkgrTEYw?=
 =?utf-8?B?Wnl6cDU4ZEJQNWpzaWVHdFNXOUdWUmdCUlB6bXduTEtEZjNWYnlEOGRhbXRu?=
 =?utf-8?B?NHJzdSsvSFJtVnUyTzR2cDJZN2gzaVA2YVVrUmhPN1hub2NxYmU5RE1NUEJR?=
 =?utf-8?B?UWNkblE1STIwRFhUNnZvTXhSZW1xT01UOTljVlRiK1RINmVPOG9qaHNnZzNz?=
 =?utf-8?B?ZTFLWWpVd2JWUDk5alpwQlZIU1VFaGpmZzhFZXZqSno4NVovTkdURndaSHMx?=
 =?utf-8?B?YjhLQ3Btd05FWUlWb1c0cVN0ZkFQVUtUSGFxU3oxOVc5YUFTUzlwQ2NLeStp?=
 =?utf-8?B?WkpSalVxVzdZUmdqaGp4c2Y4L3k4MUJTbW5jNm5Ia3JEUXZaZDdwdzJ3N3VD?=
 =?utf-8?B?TkphN09XNWZMVEp4TmpFV1MrQll2V1gxeHhiMDBYY2N2bTNac09pM1ByN2NC?=
 =?utf-8?B?RUVNbHh6RlV6N04waE43MFhsakRIaXovWXcyVCs1MFF1VDlsS0d4ODNyTk9p?=
 =?utf-8?B?Vm9UYVZTeEN1cnZtUUZSVDBpMjlnQUNWdE0vb09IQndyYzd6aVp2N3dENjVM?=
 =?utf-8?B?OVVDVEZLZEVmeHpCWTRZZFcwM1JOSWVBTUJoRzg5cjFpOEZLaUxSU050UkhH?=
 =?utf-8?B?QXBiS2orZGR6YnZVUHB5NFNNTmY3RmpISlIycFE3L2JPelc1cGhTOWRTWE5j?=
 =?utf-8?B?ZWxHWFp4M2ljV2g4S2FxaXlsQS9aaW9Ma0lyTDRFd3JCU3hnbnBhNkxkbjdL?=
 =?utf-8?B?aVdpWHdNZXYrT1ZGNHJKWUpYN3RLdWh0Nm1zVytOUTJBQndIYWI5ZXRZYXE2?=
 =?utf-8?B?YTh3UkZhR0xlb05RbVFBZXBCbWJLVkcraXkzZGJudi9VZ295K3VmTVhjQVI4?=
 =?utf-8?B?aEtsMmJqMnIvNVI5aTVnQU5IbEltZHdxd0FWbmVQY0doNzZxTldWeGFBdGZi?=
 =?utf-8?B?VzlZOWlQMXFQMkxaNXEvcmU0L0NwMFoyNjVKYVMvU2xQeUExSmtpTGl4WkVT?=
 =?utf-8?B?NUgyVUd6eGVXeVVZazVEZDdzcXFEVkNCNFRjdW01Qnk1eExjeUNFRDNnaVU4?=
 =?utf-8?B?Y29sM2tTaHZQTUpGaXRVak9sKzFLOFRJb1poeTk4eHFkSjJDTGlyYUtsWVN3?=
 =?utf-8?B?eVg4ZVJCMkN3YkhFRFNrNzFRTFo4a1ZBa1ZuRS9aZWU1eElxRTV4OG5mK1VW?=
 =?utf-8?Q?Bz+LVIS92lQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEc1dFhFK0RnT1ZWRHJSOWtkWG5KZm54MGZTd0FGdGdiZEREcUlGTks3VzBR?=
 =?utf-8?B?SlhZdGQwOVBPeUF1YmgvcmFDUHAwdmkvZ0dRcWVIak8zVTVXUElIZW5yZkNr?=
 =?utf-8?B?RlJrMjBoMStCWkcrd3JjZGpnQmpIMWlUMGh1dVE0TmV6TS9zcEtCZDhoM0xT?=
 =?utf-8?B?eE9vUU9aSVNJYWx1SGRvVVBTZlFpV0lLcHVPM0tIU0FKVVlURDQxUmpxTXJ2?=
 =?utf-8?B?eDhZWWtHNktsNG0wTGFzOEpVbFFTeDUxMFBZdk9HaFZCb3Rlc3JNNVExS2N3?=
 =?utf-8?B?dlQvRWZSRzFMZFFYUkxJY2Nwa1Q2NW83RnFwM2NqRXVTVkJURTlOUnIzMDNY?=
 =?utf-8?B?RnlNcnR0VXN4SmFnQ2J6cXlGaGduVGIrSGNiT2U5bUFmWmRETjVuY3ZjQ0Rt?=
 =?utf-8?B?OGp4VkdWbldBb3pwTWhrbjQ4L1crSHAyeHVWWEdkcmlTYWlQbTF4aURsWWRl?=
 =?utf-8?B?V2FwRmdMNXVuK1l2MmJDTERCbWxDRVNhVm1qMWlTaCtKN2taUjduMVZuZjRw?=
 =?utf-8?B?eTlObHduSEpyNHJFRW9ONCtUWFl1UC9Oc3orR2s2T2gvYlcvQW5PSG5Yd1pZ?=
 =?utf-8?B?ZndBaTJ1STdlK2lWTlJKb0VEdS9Ddi9sSitMUnpsRUw5NTk5aitSYkxmcC9V?=
 =?utf-8?B?QXhCaVZVNnhPQm52azErZmRJUzJxYUlCVWF5MWlPdDRjWElkdWxlT2dHUStJ?=
 =?utf-8?B?VHBTVGpEeVgvK0xqM28rWVFmUjRmS0QzTEEvVjdwdExzd3I2Q2NObGJnL2tz?=
 =?utf-8?B?cUNLYUdkcjZhNVBUSTZsdWhJcm5CKzZnU0xuTDNhMEczQjBCZGtGeU5OaW0r?=
 =?utf-8?B?K01ZOCt4a3hhOWVaYXAya3FoKzN3OXZEbzdqMmloNjNmc2JmU1JCdUVCMnRv?=
 =?utf-8?B?Vk1lL0NqWGF3cjZqS0xBNW5TcCtHQm4yVW5uSmoxNFMwWnluaUpRTUpQRjlS?=
 =?utf-8?B?dlJzaHBTZnViY2tMR3pSTGpVM0tqTUtsSlUvRGJYZkxYZmloMk8rTVFwYVcx?=
 =?utf-8?B?VVBjSldKZEFDVUl1Q01nWExuc2MyR0JneVJURktBc213ZjRVU0VKZ09MaVR0?=
 =?utf-8?B?TkpHMWw3VFYxQnR0VDlNRzc4aGF6TDNKY3ExNkh4ak5oWXZUdDRNYzhjZEFq?=
 =?utf-8?B?L0YvQWRDeHk2aDZpR3ZTSEZDajRZV1VlU0FRZ3YvSUpvWjVqRVV0M204WlIx?=
 =?utf-8?B?aXJhK3p5UW05K1dGVFpRZEZNUVVtSVZhTEZYOE5HQWdxRHp6UVo5WnJpUngw?=
 =?utf-8?B?Q2pEbkNtejFaTDg3Nm5wV2h3dlhFMDFBdURobytPZ0RqcUZ1NXk1bTZvdENy?=
 =?utf-8?B?K0hNblpFU1JPTGhJK0pyVUR6ekp5ODJjRS8wY0tsUVZkeldoQ3N4TnBnR1hj?=
 =?utf-8?B?Q3A0bHVSd0lBTk9HS2MxbjZrU1RFcnZpM1FyMWsrc0YySE9zZ203OWJ4aFJk?=
 =?utf-8?B?Wi9PUWJzMFJ0cEd5d1l1V2lZcXNWamFNQVF2eUM4b2s5WjR1SVFKZDN3a3hP?=
 =?utf-8?B?OXIra0QzSGhLcDFiVS9wSUJaWXZXaVpKbnd5WUNRV0RGSFRvRlczaW54emxF?=
 =?utf-8?B?dWR4Y2FNRVNRZDI4VGFzeHFadHY2MHltYzNpcDFDRk1ZNm55THFJTk5aa3lE?=
 =?utf-8?B?Ni96cXd1L09EVnhPWThVd0dZY2lzNytVc1YxNzhvd0hVdG5XU0VGSHNJZTBh?=
 =?utf-8?B?bXNjUmIrdXI0NjFRY2llSGJra244YWNvOCtwOGRncjdVcm5NeW9scUFZbm83?=
 =?utf-8?B?dWxaeEgrMTd4L2xNcWtzdmZOaGJGK3ljZVJNMHRXRlB4dzIvUHpWVXJQQTNT?=
 =?utf-8?B?Z3BHcUZFL0FQYjZkVXRRMVVvMnY5dmEyQTA4clp6WmZPL0tRQVNscTdkMGQ4?=
 =?utf-8?B?VGpKdDJ5cktNbFd6TS9ydm1pVFh4aFVQSGRlbCsvSzhsTm1yWldhSUNvVEdn?=
 =?utf-8?B?WGhITThlMUVSUWpHdWVFRzVkTVVFQ3ZvQXQxRk5BZWw4eTlQQjV6RzRQc01H?=
 =?utf-8?B?R21LZUlhanlodW0xZHpwODVrdmszWkszWkhFS2tJRXJHS3dmdU1zZHlkb0tC?=
 =?utf-8?B?MzNQbWhVbFpSREV6Rmp2dkJyZWMxYXlpSmtta0w3UmZ3bFF6YXZjOHBXUEpZ?=
 =?utf-8?B?a0x3WHNLMTl0YTV0dFRSbkF4anFQTkYvb254eVpZb251MldnazZHVEtiNkw5?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 44846e44-518c-4b8e-78c2-08dccb6db29f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:38.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahJrkzmjRPL+cqE7fNGy/a3q0Hm52r00s7IT75Vz2PZilgft4qT3nFgrvt21YDCcH4Gee9Yq2j7QdEcNoI83ZvcdN4cBcjh9P5eBNnSrY/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patches 1,2,3,4

 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 615094bb8ba3..a02f1178c60c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "tsd,rk3588-tiger", "rockchip,rk3588";
 
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		rtc0 = &rtc_twi;
 	};
@@ -224,13 +225,25 @@ &i2c6 {
 	status = "okay";
 
 	fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
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


