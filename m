Return-Path: <linux-i2c+bounces-5061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BC93C2EE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 15:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50DFA282950
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 13:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFBA19B5AA;
	Thu, 25 Jul 2024 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="dBmgrh3w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020111.outbound.protection.outlook.com [52.101.69.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0D19AD9E;
	Thu, 25 Jul 2024 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914104; cv=fail; b=VHoe8OTJxa2lsRoeOMaS0PkV18YsZOuY8TQRs79E0N3QTLMsTqeIfNsH1LJPPrcKmVqOwXKRmaf2y/OjdCj48SuV9NkafHIeXiTIs00+8bk0k4c3R9URHTD1qJydCMGZG4/EUVzvOdK5FFJkjTFnFMw6s/lduhJ9n8jVVbkWd+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914104; c=relaxed/simple;
	bh=D9LNB1n//rGX4TqqfcxUKOKGzRce0TYHvIo+TD+JOi0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c2WaMiRRJZSZjXCh+Dl4BJQ5JGMHNQaFSTawlXGkmP52IKJOAs6j6r67eovK+ozdN2n/SSuLjWUvbaEPlEYgrNNwwlF4tpaSLTDUrm4X7ZFnp2jHHnA4p9sHhQUsldWI/9rR4x8uLtrDgZjQMZBaEsI0toYvjSUdZS6fVxDFq8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=dBmgrh3w; arc=fail smtp.client-ip=52.101.69.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQXKp4sw/wTFPPYldp3gMbk4RGEPIoiNvRhp4vlwiTfVpdfJl8KHmciNpmEipy7tEzqocWlhc8sV/hGVfs0+yEl6wokPOMhdIorbKWZmp0JjILNU/yz4htz3+CICFi9vjlWV4Ky+srOSx7yrtkAAPaaW+73MWIT15HrNKs52hU+4IVuMvQtws1nRys08fzPGoeS1QjODj24cWcnZypZcw0QMrhh0g7R4si69CBYBhpx5FKu/OMnl0hQN3gK18vHuyj7nJndjJB2SQqOlxmQ/U/lOIvNmq9piUbGPwF2m0UWOuSxOJBJd7cSAiswX4/MPcQ9h0va8z+Oul+Hpe/Jh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBpVZjh2NnQubKNFxCn0nUPLaAPSbgyPx/mM4ADWwPs=;
 b=NoMXVpbNf1xPo4Q4nuRhfLwhGO1CBeIZ+oVuOqoZU2yS6aj4JMPmxy5KGugl3+6vZFBwqXhm1R8mGif7bN1znp/1x74ff/jextYirWQUy/r1snPSi3M/Tp5FuseOwxTMA9WC2KqlG92cYmPP/csiMiCflpQ6XY8h1QP5ZiBv2cVdvW3tD96JG4PKw6Fg2R4vHYHwmEkrtuS5xiVkQ7uKnKAiu0tnSJ1nMfHZ6JlumPh9sUtHLLm0ZDD4Suk3vvn8C8vyjUgPfHk6NOcsXIfzjy50ItEdVYzwObv+PvGeOPpG/lpphWtrTBu8DMEnGqz50aCqNSMKQY7dkYe6dl7T0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBpVZjh2NnQubKNFxCn0nUPLaAPSbgyPx/mM4ADWwPs=;
 b=dBmgrh3w1IZsEyFg+W++/kfJC4H5ppP52jdYM/IsHon01nRhX2gDt9IEu4ZT8E6tW5oyUsq1ePfBRe7uNjH7VB4tgXbVl2BPPO+xX9dp31O/X0fiXy/aJgSpvV5OhuL11UIFFGuF6FpGwP9ko4Cta+jALVzRpEEdftngPI9/wCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DU4PR04MB10670.eurprd04.prod.outlook.com (2603:10a6:10:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 13:28:18 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:28:18 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Thu, 25 Jul 2024 15:27:49 +0200
Subject: [PATCH v6 3/8] dt-bindings: hwmon: add support for ti,amc6821
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-dev-mule-i2c-mux-v6-3-f9f6d7b60fb2@cherry.de>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DU4PR04MB10670:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a9be1c-1492-4a1f-fde9-08dcacada4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWI1TUpSMjVjYmtRREJJTUQ5SGZrZVhkY1lyaGNIckNyc0VQQUxwUkFRdWdO?=
 =?utf-8?B?cjZWTWg5QTIvWnhKQkF5Q3M4UktWaFdwbzFYYmM0OFNDSCtXM2RtN2tBUnR5?=
 =?utf-8?B?UlM5cHc5cDhiNzV0OStZNDV0em92dDh2ZE8wS05tWDdGdEFSV25yTXRTM1pN?=
 =?utf-8?B?dCswRFRwVWczTDhZUmo3MFVXVXpSMTVZTUwxdGtSR0lkUDI1ZStqRWw5YnVp?=
 =?utf-8?B?NjlIa05wYXdKSVNsN1JjMGRCd2taVlJHZ1RPN1IvRGhvUW9zd0t1S3NCNUdn?=
 =?utf-8?B?K2FFWGFlNWlUYktmSk41TWYveml4d2xtSUpxUGhQd3ZpVCtJZ2ZqUTNHcmo4?=
 =?utf-8?B?bjVkTEE0RlV1R2VPbldOSWdxVG5IcmhaanBzbUM5UTJ1TWpJUlNzMTZON1k5?=
 =?utf-8?B?NUpSTWNhVEdXQ0NnWVlzZ0FZY1lDd1FHM3VHS0ZWU3JBbm11SE5xY1FtYVg0?=
 =?utf-8?B?UHlRNkR6d0ZPTWgrbXdSK0JibTRhek9PZUIzMjR3VnB4TUYxTWp0cDJwbmgv?=
 =?utf-8?B?a1kzekZ6aGpPMzBCN20wblV6S3YxZjB0dy9SSXpqbDkwWWxGeFp5aFVFWmZx?=
 =?utf-8?B?RDZ1Rnh1ZlZxNHI0RXpOV1VZUzdwakc4TUlzbWRXZTRmNXRnbWkvL3JoblR2?=
 =?utf-8?B?MVdWNm1QdEVWMlB0ODZyNWRmT2VnUWhYVE1acnZvaXdKUmRTUDBLQkh0bUlJ?=
 =?utf-8?B?cFZudjZYV3cwTk8rQVFEaGdyb3Q0WVIzNmVMWitzNm9wa2NkVytYQkpaZXNB?=
 =?utf-8?B?djU5N0ZXK1hkaUpadFcxbU1lRzhPNXR4NG1TN0psSTd4RGs0OXJQbmoxQXQ2?=
 =?utf-8?B?RW9jQkQ5NE5MU0FwTlF4Zm1RczMvZHpqOVpIUms4cEIxcUlmZUNXc3JkK1FS?=
 =?utf-8?B?TWcxZHB2aVI5VTZWTGwvUjhQdkw0VWZxdXV5MHFBVVdXQlpCaW9jUEU0Nm51?=
 =?utf-8?B?MDNuOTgyb2dOZzg2TFBQa2hXbEtXVTZNZmM3N2pzMTRFTm9ITVFockZPeS9E?=
 =?utf-8?B?ZXRrVnFJOW1vdXlxQTVMVjB6anlKenduNTljYkZYLzZHSHc1WDluQXNEZkRE?=
 =?utf-8?B?SEFvdVJFY0dqUUVNQnRNTkxuT0daM3g3TWgyRjNscm1WdDh6MmdOd2YxK21U?=
 =?utf-8?B?RmtGcVpUZytiRUpBaGVTanZrWVV5L2dLMTFiWWlKZTJEc1hxR1ZqWU1QQml1?=
 =?utf-8?B?YUV3VzhiTnluZmZPNTgyL1NRREJtdmhHeG5VcXlmcXEzVnY1U1RMZ0l4MFRz?=
 =?utf-8?B?NWpEL2tiRTl2L3FPNmhqRWFHWTZDa2xEVUZxUWxSN2NSdlFoSm01WXdLSkhn?=
 =?utf-8?B?WjNLL0Q0MG9rOVRPZzhUb3VjNmsvMjhlRWRDSkVlS3JHcjd1S2VVVjFoaXM0?=
 =?utf-8?B?OEd1M3RBeUdWajdwemthZG13YXVINVB0WnliY3M1eU9OczB0WjA1NE9XMnRz?=
 =?utf-8?B?emxIUWZuN09wVHN6elRhOStldFhIeWdwcjkzTTlPd2VnWWZmZ0ttd0NRbzd5?=
 =?utf-8?B?NDJnWXNzbXBZSkRub2pyZUd0UXd5WDMvb2x2T2prVEkrSmZTNDBvRGRHVG5W?=
 =?utf-8?B?ZUJPa3FhM1NNZTgzcTJCeE9xSm5VSysxMTVMNlQwRUZBQXdINjZkR2xjNWdW?=
 =?utf-8?B?bzhOOHFFU1NmMEVqRFoyQWpDT1JETFl0a2VKeFhXekU2RitlVmlqU2o4UXBJ?=
 =?utf-8?B?cUtNRFRnLzB0U3pJbW9WNXAySlhKcXdsTE9TRmd1QnNwdytmR3l3TXlwRU5l?=
 =?utf-8?B?bk9STDFoNjRDMGdPS0xHMlVvVkRlR1lwbm5ibndCUlVRMzZucXUzSkYwREJJ?=
 =?utf-8?B?ZWQ4c2tlS3Zjd3pnY2JJT1JDTTVoaGp3bDVremN6RnQ0SW9Kb0p2US9oSHZx?=
 =?utf-8?Q?w0P4AJXOvXnPH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFtUW1ZVGJyREdOMEdQTXJmdDYwdytxcW5KbVo1YXlrTWd2bCttK3Eza1U3?=
 =?utf-8?B?MW9TL0M3ZHRMa0tVbkpySnk0K3ExQ3Z1OGwzbTRScHk0WEs3dzNST1k0OHNo?=
 =?utf-8?B?a0N6NHFScXMrdUdVWGFRZnRHWHNBc01lVkJWQk1sYWhPNHpyNG9BUUZ5Qy95?=
 =?utf-8?B?YkZHdW9lZmVFbk5OUStWZmNtLzY0RTBMY1lWQXRoRHozd0M4a3F5SkJYZ2c4?=
 =?utf-8?B?Q2htSlFwdTYvYjFSVnhtTWdrK0Z1MGtlamIycXB2Qm1Tc0VkSlFYR2RKRXQr?=
 =?utf-8?B?Y2pmSEZtWnBMRHpDZDg0NDcwZWl4R2VUU3hETEdYb0FJWi9reld0dTdYbjlq?=
 =?utf-8?B?Q1A0WmpYekNUNmRKRmxCTWVrTUk4WVd2V203OXd2TkhoVTY2bUk4ay9rSno5?=
 =?utf-8?B?MHB6cEpweVphcE1lbTE0K1dRZ0VnbEZFVlMxNzFTbGt4ZExFMWcycXMvamdt?=
 =?utf-8?B?L1JBdFNWZHh4aDhaUFRPTVBLZ1BpaExPSDlDeWJvU3AySkJkRTBUcTVVUjZa?=
 =?utf-8?B?MzhFcjZBWTNlaDNkMjdscHlPK2NqdmhBRnZmdEhHa2t0ajNjcDgwZ1Bqeldj?=
 =?utf-8?B?ZnVLVG9wVjRRRkxMVFZ5RUJMNHFBcGZOaklteFpiamliNmVDWTlDL2lnazJn?=
 =?utf-8?B?WEJvNGthZ0k1LytvNXRJZkt4S0FkTVZ6MklGV2Zob1ZQRkZid01wS3E1TFpF?=
 =?utf-8?B?R05VWEJlWnRURlpXaEJhdFBoZVhPMnFOeUR4dDFYT21BS2xWWjFhenprSTBy?=
 =?utf-8?B?UEF6RWczaUU0Mlo3Mmh3MnVGS3VOUEVhZVZWaWRnanZGY09iYWxaUXRkaGw2?=
 =?utf-8?B?NnZ2KytJRjFkSGNGUTNlOW1MTWkzb3NDNlJjMVlnRmlYWnZuZEt0STZyV2l1?=
 =?utf-8?B?a215NWVmWjRHY1o3RDJXMnliZnpoenFXbUhKN3hhVmROR2RPSjVPZUhnNUxw?=
 =?utf-8?B?dXNKWGJidG04K3F2dHZBWW03OGNYU2FlK1hzSlFka0JybTlLL3l3ZWlJSHhL?=
 =?utf-8?B?b3VlMmZ1ZzNpVDdxdkF3YlBScmRySVpRQUdyVXBrSk0xanowTGxKVmNMS1pl?=
 =?utf-8?B?VWlJdWVDY1RXcWsxUlBuUlNFVWx6OGUvb21uV1p4N3FiWlJGczdKMjFnZlBJ?=
 =?utf-8?B?Y24xc0x5dllzZEo2b2NCWERIMmRMQUMwQ0lBU0dzZ0FpV292ME94bG9IVzdo?=
 =?utf-8?B?bTE5aThXMVNmWkR6bjZyMDFmNGtqS2UvaGdHRzB0UEszdE5zRE14ZlRoRkFB?=
 =?utf-8?B?OWg2eldra0JXK2ZBZDc2YmoxdStwb25RREthSWlEd2I3OG5YODJ0L1ZGQXpJ?=
 =?utf-8?B?b2Y1TEVVc04yUmg0dmR4dEF5ZWhqYTkrbDlUVkh3VVlzaDdaYm9Qc09Jd20v?=
 =?utf-8?B?MXRVZDZJVC92cEhTbTVBancva0gwTEFSSGJsdTRvUWswSjloWFBjcmJpRDdw?=
 =?utf-8?B?ZHRpN0hqamZIb3Z1aHJtU1VmTm5TNHN2TU9xYW8xOTJNL1FkUXQzYzJ6Kzc1?=
 =?utf-8?B?RlhYV1R2cTFvVWptRG9VMkpuM3pacWRCcnpuOVBydERSdWdVbVQxZ2dvUFlP?=
 =?utf-8?B?d3ZkbjU2VGQ0aThYamRFOWdBSXJXVGV3NFo4VGNPYkpHRzdnWk80UzYvdzcy?=
 =?utf-8?B?NllEY3lZNlRMbVl1d0RlcW1HazVEK3o3VlY2Z2hnS1FSamw1Y0dXTm5GMml5?=
 =?utf-8?B?VFNxTzBvd1NqR0ltSEpHUDJhWWRpRVhDWGlRWXNteEZJNy9SRE41bkh6dkZn?=
 =?utf-8?B?d2FZK1dzZzJtYjEwYUJhS2d6M08rTDFWWmJUMWVOSHZIdThXdDFCdjl3YW5P?=
 =?utf-8?B?S29EaGg2aDBUSFViSFc3K09nY3pQajRTeHNXbU9WQWVOWU9zUVVTRjl6ZEpC?=
 =?utf-8?B?d3ZvaW91aG42MEc5YUJrOVJ1ZXZHUTByU01xUkRxemwxcFdiMTBkb3NNYWlx?=
 =?utf-8?B?SmNCd3laZE9ZdCtBZUVHbTlpaDd5V3dJRUpzcUlxV045VEdwWTkxcEd3bE9x?=
 =?utf-8?B?QlJzbWErcmJLUlRFbmJINHhCZkhPemhIMCtOZUJrd2NjL1BMRkFzVHpZZVNM?=
 =?utf-8?B?L3lHVHMrdXZBN1I2c2NESXhZdTI4WmZFazlBM2dZM1Zqbi9HTW1mQmNyUFdm?=
 =?utf-8?B?aDZ4WS9ub0taQitpNE84eWdKeWNWbVI4Tkg0a0RsZ1JlRFFCU204WmJSS1c1?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a9be1c-1492-4a1f-fde9-08dcacada4e8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:28:17.6511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nV14Va1gmMh6j/5rcK3V+cV/L60p3i7J5ZBkHRF9AD9xGPJ+VxLUzBP/GaqEhZPwGIuNxpKpzW7JgE9Xv3WaWdjIQGpfLr26Iy1B9QZ4XiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10670

Add dt-bindings for amc6821 intelligent temperature monitor and
pulse-width modulation (PWM) fan controller.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 86 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  2 -
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
new file mode 100644
index 000000000000..5d33f1a23d03
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,amc6821.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMC6821 Intelligent Temperature Monitor and PWM Fan Controller
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description:
+  Intelligent temperature monitor and pulse-width modulation (PWM) fan
+  controller.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: tsd,mule
+          - const: ti,amc6821
+      - const: ti,amc6821
+
+  reg:
+    maxItems: 1
+
+  i2c-mux:
+    type: object
+
+required:
+  - compatible
+  - reg
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: tsd,mule
+
+then:
+  required:
+    - i2c-mux
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "ti,amc6821";
+            reg = <0x18>;
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "tsd,mule", "ti,amc6821";
+            reg = <0x18>;
+
+            i2c-mux {
+                compatible = "tsd,mule-i2c-mux";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                i2c@0 {
+                    reg = <0x0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    rtc@6f {
+                        compatible = "isil,isl1208";
+                        reg = <0x6f>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 5d3dc952770d..24f8aca55f15 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -368,8 +368,6 @@ properties:
           - swir,mangoh-iotport-spi
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
-            # Temperature Monitoring and Fan Control
-          - ti,amc6821
             # Temperature and humidity sensor with i2c interface
           - ti,hdc1000
             # Temperature and humidity sensor with i2c interface

-- 
2.34.1


