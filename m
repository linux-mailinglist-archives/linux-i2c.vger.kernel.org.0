Return-Path: <linux-i2c+bounces-6004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F9968C36
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749BE283AB9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0488A20FA81;
	Mon,  2 Sep 2024 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="H7pI6ddo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF671C62B8;
	Mon,  2 Sep 2024 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295128; cv=fail; b=Nra9OJr8wkzrmMD+3olFhp9qhn+/vkPlVVYlwxnV3ePwx/I/qtp0dUSfIbufMZDsZM96Z+tx8MTtC1US1EYV06NFySA027BB3NyWTn+BRgdMwwd5McR7x6qrtTn7QmnEVlbOILFgeSH+Lbqyz4M4s4sJXpMMvulIOpzPkdAGiRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295128; c=relaxed/simple;
	bh=S7s9qDoMVXGaFywXlkhz+h2UHx51YfqZuzNCpBeo5no=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mNF+QeRcalRtqPkszOW8ZEbq2hhw9bzHAbTWa3j30I7gSzvDoLXJCc9fmy8/YV/N57aoXkO+CHssSp65c/Iri9QbJDbptj38RUSvGkxwFpu2N8ElLgt2DVya7+tDF1M9bqDKNyE5tA2cDiVlOjcs39FjidDTJ7ow09WLDZHe7N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=H7pI6ddo; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvW1t7WVBF/N1dCcQdKVx5F9YNKYLsaYCyLbPqbtySgqgh/LY7U2JxaJUU64JvkiyuHaUVVYl4oAHJjGjpHn88HKC1IU6k0kKGLud2eS70T7N0wqD5o4vN6vVsMd/hoX/17eP5tR+WWxCdQQzA6n7UKAfKxmiR9667JG6tmY1ndc5VsE6O4tSbRDyMjghNH9v6YuiPn0R1t3Q5n/K9gnGWUoi2aE0+LBmaTMQmLx3vVMCs3jT48qQ8VuuqeByriLkXAbrqiFA4Kv9fAodvIOKBoFE+Y8HeOyZ0/w+eIHvCW5u5UQw/0ouVW1Bi1g23N8mXZWOePjsmNPKE72Tqi9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25dGd0E5AtCR8zFuoAAzxvVQNaW8OT1xvILoEmM433I=;
 b=aJ0wt7Hi8JE8hmOXwgwr4EyCNxj10DaRaMUhaRD6kX9fr3pxXlXcoBtljkjyRLdAHIJjNgtALsH1jz8a+dNs7O8jAiE3av9+2J46UOhq+E5VlIPzaGHqIbHPHB3xoipWKJVzSiz/OoIy/7fJ6/1aGeTx3G87FMYtvUH7jGGYSTmejVJRTVlwj5ttvN/yi1m07bXxNH3ZLpA1NQ9gnAYcuVCRfhduJ8qXYdXKebQJ56v3LWJGc1lD7bodRsDvnhatPHV1Hz9p5wdVPfukoDzFlNTkuQsR3XF6MKRNXNYgz3wrFk1meH3kl/tG2E/d2KOF5B+eV9v65ySbcdNQQqt0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25dGd0E5AtCR8zFuoAAzxvVQNaW8OT1xvILoEmM433I=;
 b=H7pI6ddo4MGggt8gJjF6Jg5u0EMEyAyZAfH3Q3yF72k5alUGBlblPAbPrBStHceIe5NBQ+U7BhzC4ZnsVPpaYsb9Mp39CZExB4Ertjxsx8qWJG9jOIWsBkp5w6XpyUALRJa3TL2jV4ZKYRHX0iwebxlo6068KIVaE+lAadAHRds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:37 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:37 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:18 +0200
Subject: [PATCH v7 5/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-jaguar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-5-bf7b8f5385ed@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 6a88b850-c54e-4e3f-f59e-08dccb6db19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2NnOVpwMXpkZzkrbHlVKzFqelZMTkJLaEF5MkVXRCtrVmdJUjk5RHRjcWFm?=
 =?utf-8?B?Sm9rb0tnaE9VT2I4eXJ3T3YrR245bUhBS2Q4Y0tOMUNGaXh0MVlRNVFPRGps?=
 =?utf-8?B?R29MS0hlcWdkMGE4VkJNeVJWYVhoUjNra21oSEl1UXE1WTdXb0FzME9lRitC?=
 =?utf-8?B?WHlTRk9OZXR3NjRlczMwcnFXWmdBeTdCNXl6dnNQYWV5M2NmRFBoR3pyM0Fl?=
 =?utf-8?B?NEZUN2puak5hOTRvNjlQNHM5N0pFWk5DN3lNWFBYd1dObERyUHBBSEdUZFFz?=
 =?utf-8?B?c1pDa0I2RGJYZnF5dkV4aEFWaU5yODc3RlIxNkNsYlMzdHliV2QwR2xScnJW?=
 =?utf-8?B?YWRCUWVSQjNwSFhYUllmYVp2NmVsSC84Q3FjZUE2MHlIQ3NCekFwNXFnN3Rr?=
 =?utf-8?B?S3ZxRGxIcWhkRlJod3YrUVgrSEduWklYV1BiVG1yUWM5MlRMUGk1aGlGbUQ4?=
 =?utf-8?B?RDZ4QlVpcnh3SnM3ZURYcjdhMGdiVjgvdHNmZHJJa0J5QkJXeGQzTEpQM1BP?=
 =?utf-8?B?VEpDZ2xMVU9UL1AwK204N0h6SEtqQVJLZ1BzUmlrZUlCZ1kzditVaHJWc0dB?=
 =?utf-8?B?WFBhRm13OElhQlhXb3hoTjBQMC9zT0F0VjlQNFdYUHhaTnVpUVpnNzBoVkYz?=
 =?utf-8?B?akw5VDdMK0tFMGhGMms5VWcxKzEyL0xZcWdNSzBubm1RdnFzRGdObFAwT05I?=
 =?utf-8?B?dUU2YTdqYjQycEJaNVBzR05tNitLazVrRThRaEsrTzBOTHA0R05iaEh1ZGVT?=
 =?utf-8?B?ai8xSVRTU2pTVTR3RzJMQjZtc2pHSUdoTmgxRmRBSlEzTW9LU3lLN0x3ZlZV?=
 =?utf-8?B?YjZkN010WkJseHlwZ1JzK0NrWkVLbU50aitIdGZZNlFLRTJTejhMSitoVS9B?=
 =?utf-8?B?ZjJPRkpxSjJYUjNvQkdiVktLQTFBOW9wcUtmSDZXc1lrZ1pYRE5WLzZHQ05Z?=
 =?utf-8?B?cGdFTkdJblNndWtHcGQxczFFNlM2ZmU2NVZjYWtlSitSdEoydzFLRDRXMjA0?=
 =?utf-8?B?RkxQdEJwM25mNERUamhUbXJFcytGN1R6OUJ4aWlla3RLVUk3d1JsTlpEbklP?=
 =?utf-8?B?cVFsOU1iSWJYWjVBemZjMDVPakJMMGRDRzRUKy82MW55b3JGOFFNeEZJTTkw?=
 =?utf-8?B?M0FzYVZXdzBwS2J2UWIwV2NCMWNzQU9TRmhRUWRhU242ZW1MQ1NMNkNLUEpz?=
 =?utf-8?B?VGROa3dQNnZ6ZEJVRGJkR090NStJdS9TWEw2S0xUZmg4SEJQK2NSV281czJJ?=
 =?utf-8?B?d3QwYk8yNHM3Z09JNm93WktOeGpoeWNVSG1vRjZFUTNyMmt5MmFBRXhiYkVq?=
 =?utf-8?B?RGYzdGk1NGFLL25vK1QxeG0rMjNoNEZJSVhUbXdlUk1ScFhYWHRFMlVmTEZD?=
 =?utf-8?B?dEplS0NmcUpVaSs0eFpKQWJxdUt3dkFSdCtYS3ArODBVTzVQUGk3TnNqTFdv?=
 =?utf-8?B?UVcxSENuQnN5YkRrMmV5cHNhZER4WjQySnBWMlp2b1RLZWU3Wm9Jc09MTHFX?=
 =?utf-8?B?bUo3VUpkMnROTU85bTdPcXBMY3luaW5UeFRUemoyN3Uvc04vTkw4VFpCMFI3?=
 =?utf-8?B?N1h1UDFjZGgrL3NrY2RIVkQyN3JZdVVEbFFtT2RoS0dXVjJZbVFia1A1Uksy?=
 =?utf-8?B?dmtReUdHKzA3ZXZ0Y2VIRzJvMW9WYUJVZHh5ZlJPcys4RUFoL1gxRWFKbFZ6?=
 =?utf-8?B?NFRzZ1BqYlhnck9QNzhHT014U3VhNy93OXJ0V3ovbVM5WVRmMkRRODVHSXRN?=
 =?utf-8?B?alJVVHJWZDFlYjlmNWhid3JYcmNoaHFwSU53Um4xUnErNUI4Nmg3U0JVYW8y?=
 =?utf-8?B?QUZ5d3ZubS9HT2E0azBEcUkwMFJOVWlOUlpyM0lIb0FBenVXTVFJT3dxMmJp?=
 =?utf-8?B?eSt3Y0MyNDZva2svb0lOM0RtTElFRmhhMGhWektVRXFsbytRMHc2WnVDdGFW?=
 =?utf-8?Q?awm0V14FJvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGhJZzRQTjhVcDVLRnJRVDFES3hScDNKcE9NTmlkd3dvWC9SZ2VKQ2t1UmZr?=
 =?utf-8?B?MEVKR1NpeGhvQmE4M2IrcXRLVDlxNGpaY3BydFFaKzU4ZUV5Y2NNTG5oZnFI?=
 =?utf-8?B?ME5RYnE4a1g0NGttU2pkelRabU82RnM0UWRscXlJb2hWUlNWdkFkZWxGR1py?=
 =?utf-8?B?aDc4T014STFTb2NXQjJUV0RaMVZmUlVEQmhCWFJzSFZhQVBELzBCdFVJeDNH?=
 =?utf-8?B?M1Rab3I1NEJtSkQrcVBTOUtCL1NsdFNLMVcwRE8wWVRQQ2wvcWRLaHBKTnlE?=
 =?utf-8?B?eUZxU3hkczBKY2JWYlVhemxoTUdYQnJuMkNtVkhLaWo4MS96bTN1OUNoeW9S?=
 =?utf-8?B?VHpTejhBZFd5Ti9ySlc2Ty9zS05zVVNYSTdJaWRSMXJLUzBHRngxREo2YUNv?=
 =?utf-8?B?WmRUQWZ1QnpRUjNXZmxCZjVURys3aWpzbDBPVS8wMlhSUkRlb2xjczJHZ09z?=
 =?utf-8?B?dG81Y09tcVN1cC9vTVJFT2JHdm5BNjlyQkEzVDh3M2NHSlg3ZGFxZWFEdEU5?=
 =?utf-8?B?TEJlTUhIRkQ0cXczSDBqYVRmNEdXN1hBU0p3TS9SV2FXQit1R2xtbTVOVkdp?=
 =?utf-8?B?a2VhVHVYZ3VIM2IyOFlGTDZkYVVHaUFTczVja2svQ3V3d05EMkQ3eE4vL2k3?=
 =?utf-8?B?c210blFMdGFrY1kzWXZRYjRJQ1ZwN1FKMUdTYVhnSVZKSWdXeXlXNTZxL3p1?=
 =?utf-8?B?am4vVW52OVl0VDcydHJPTkJWLzY3MVl1N3JPRmdISkpaOGsxTzcwSURkYjNv?=
 =?utf-8?B?SG1vNGpWdUltUFl2Kzc5eGp1N0JnaGNCL2ZFd0oxTzB3emoxcTBibThNS3Y4?=
 =?utf-8?B?eUljMWpydDg4QjVwcloxU0lDMHdaYmtwUVFoNDBTZnhZaFhzWjVCMmNrT1NN?=
 =?utf-8?B?TFZzUkZYcGoyT2FQU1NqejBzVU5DaDlBalVZU3MwYTFIYkxJM0VOSGpjV0tR?=
 =?utf-8?B?eUhCYkdYekwveVdKVzRTT3lYd0RwUjdpUnRoZlNmRVBPTzJjUDVmWnpWbzQ1?=
 =?utf-8?B?TmVaVjRxZFlUekZUWWJ3bThaT2JqWDB0Nzd2TXlPbWd5WjV4REprVEhQNDFn?=
 =?utf-8?B?eU0vMjRqQ2NnVzExZWpSZGlQZlZTeWpkRDY5bklGNVN5V3l0NWhYd015L2k5?=
 =?utf-8?B?VCtTRzhLbndJcGVOVEtmeWt2OVNJNVVBemV0VUNyNG5HWjNCNjMwOEZvUVlM?=
 =?utf-8?B?VnZZKy8wUWx5YmtzTm0wVkc0eW91WVI5MkhHeXpXRnRsbHlPMHlxcjV3emRD?=
 =?utf-8?B?cWtzWXhGVWdPZzhKcEdiekpDYzlMcGZNQmxSRThkZXV3eGpqcVZNTTA5QnlW?=
 =?utf-8?B?cS9OSHZDQmJDYXREajEvdzNZWGRtU0hSQVpnK3kyeHNveTQxN3h2SGZuTEJD?=
 =?utf-8?B?MHZFNkZUVWJhYVljUE5yYjNxUzI1Vjc0L3VkTDZaQXorcnh1VGUxUEFWQ0xv?=
 =?utf-8?B?RmRlditDV1BjSzdTbmcycEpnQmdNNk8wbjhHYXlHbVZHSW8zVXRLazJ0QndI?=
 =?utf-8?B?ancyeXFzQW15cXVRdUhkcDRJb0MvMTVNT0hCVWwxejJHRDVVdjJiUEVBcXZ4?=
 =?utf-8?B?VmdHcXJSQ0pBL3JueGZxNmQyVE1QTkRhS2lnMDNuY1RaSnJjTkxoYy9nZldz?=
 =?utf-8?B?OXg5b1RCWEE2ZGd1bFJYQm1HQlFMUWlrTHlYTGN0K0F1K1g4UHd1SWNlQkwv?=
 =?utf-8?B?U2NnYiszc1RxRFFQeGJMaUJ2SnJpV1Q2ck5rL1JROG5icHRtaXNkbG95Q2I4?=
 =?utf-8?B?NTFjL05xUzJVcDVUU00rUlRXbHVXZ2s0R2Z3NHc0QkhFUzZwOXNiUTIydmNL?=
 =?utf-8?B?UmZya295RnBwRXZZZURpcGN3SEU0VjluUy9Jb0k0aHhVWEFQY1h4b3RDRUh4?=
 =?utf-8?B?N3lFdGE2T1ordzIwYTZZblpkVzZHNmhDTEw2OVd3bTROS0VpaWc5UWwxcjVs?=
 =?utf-8?B?OHJIRU9hcmlKTXR3ZENIYlczT0gwS2N4dlp5cVlwdVBUbG9zK2p4RlBJSklD?=
 =?utf-8?B?M3I1Vk9xcFlNSjBEWXp5ZmdlbjVPNURVOVEweW8vN2k5NCtlR0YwbmlWMzBq?=
 =?utf-8?B?a0VtbEg4NnZOWmFIeWl4SWJtdjZqcGVuakYwbEhiM1VMSEF3cENKSWoxNENq?=
 =?utf-8?B?dENjRGFwbXZwN3pxTE14ejZhRjFROSsrVkRONlBTVU15Mk55aTlwY0tFRHZD?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a88b850-c54e-4e3f-f59e-08dccb6db19f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:37.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQFY6Ir3nFGjqASOr7ONLLiVWFzusqKiMRz/q0ZesrHA3ufMgs5QyWI39tUVane8AW0O6UP9eUAZKqIcuLzo8hNuidbdRaww6LtdbmvkR68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

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


