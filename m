Return-Path: <linux-i2c+bounces-3304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 161758B5DFE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 17:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F31D1F21C32
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 15:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193CB82883;
	Mon, 29 Apr 2024 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="L520uDBT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2108.outbound.protection.outlook.com [40.107.241.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129381745;
	Mon, 29 Apr 2024 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714405622; cv=fail; b=Tn7aYA3VRInjG6O2+KvAVaQsgQYQSsIyRN3RSM4EKKodWvLCW9BDpzXh5m5cdTUqpGd134HEM/QE9AdcG8spaGFHfKdThr6GDt0/YhIfbDeSd6jja29pYchw44yNHpn+zPtafEkf+5GfXNbonftiSJB395QibHHRt6JHtmhNULQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714405622; c=relaxed/simple;
	bh=bTsWW7tX0oZSKm/WAL9q8rnv7YnYWwkzdfMtZ4uVLS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JyjRIXuA6wafqKwkYalAYEgLxKq0idhYE8NJgack5ajxtBnyjhFQaJTQt0N40xYhaq7Rca96MF3ZnxnaRyQZrfzOlbsI8P7e1b0nDAGN2zFEABOcFFUHYX4fzya+47LyA0qL8oTID1D7xE9fZrKdY0jNb4U3RcYCunmYS+Mx9hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=L520uDBT; arc=fail smtp.client-ip=40.107.241.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWRgZXtSR7bEfGwZ27ttgH2Dc8xb7sHIYD+Cd7wgYAxJXp68wLpWiamdko9xchPResjqSeT6muAe2kkboCufVeIA4kifSMkHmJmrLdzB4Cm4mgaXb+AASMJlaSbVwCPjwRr84939yQgUKs5xBJ+5gm30H4XDHxMZ/FSZDuNMA7AKe7U3z/3Dy988TZ6BFBkqFKzAtKPBPvFTEBvcNFAzilp0yETTaFd0a+HVu1pZCj44wuGFHR4PnJwGLOazcCXEwyfEpW77djwpHHk2hlTp5g0a2D1UDEFxhSvhYkObtvmRS8xmWxw+s1VxVe+2QVWZ5F8aKei8E/Pue/acnsQSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De9QzribIa9LbsfGZUabvrmYQ2NGdB7+6Gyh4H/B1Lg=;
 b=hBMDR2qwurdI/WIYTh4ub8uscXiWZKaCy2AmZetnoZxcbDAt6EChKTVb07Ks8oRUDey19mDYgiYp7GnSho7/mxO2KokiLhl6SWI1EOjy6cW79yyFw/f9uFBCcfkbeSekfYDywR0wxIO5jp2CvBsVnjy7pirsK95sGyQ0UNc9MbrdFp4pDtcE2UBj4oKpzM/0kK4rV6uO6UhNwzcIstc3v5LGlEXAeMasbftwQXkGXejbWBK5uap9278i6mcpgZsZ4nGwVAbKXTxfU2gSynPj20E6MNZzeFgTh9krWrr8pWH4zRODpYFonuHQTRcl9uHdZiAJ9nKLGYK9JfI0Cq6llw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=De9QzribIa9LbsfGZUabvrmYQ2NGdB7+6Gyh4H/B1Lg=;
 b=L520uDBTO0HeoLr3H/b39G+zRDhhsrljCkS4oQWHnI9jQu6HN6Jn6JHgWGBdVXPy+S0XB+ncmihx+7TvFEpM/ufRrq1QaXBJeaLB/XUit+DG0ophAzMVXhUUlkxLa0rszM/kg7UlZvGsNHrru7RLpVwex0hf42IoMy2rzUkM0pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by GV1PR02MB10622.eurprd02.prod.outlook.com (2603:10a6:150:15d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 15:46:52 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 15:46:52 +0000
Message-ID: <f7ddc503-21c6-10b8-3326-398de65bd6a8@axentia.se>
Date: Mon, 29 Apr 2024 17:46:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/7] i2c: mux: add the ability to share mux-address with
 child nodes
Content-Language: sv-SE, en-US
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-1-045a482f6ffb@theobroma-systems.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-1-045a482f6ffb@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BBC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:16) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|GV1PR02MB10622:EE_
X-MS-Office365-Filtering-Correlation-Id: b9691d7f-de97-461f-8b36-08dc686396f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODNuL3VGbEpVZ1E3dU1aOVpUek01d29NOFdqL0JRMGhSZ2tOWVBHeUd0TzN3?=
 =?utf-8?B?UnRsakwxU1lVQ3BlUlE5OWtNb3U1YkZsOHloUW5YMGkzR252Uk1FNU1jb0tE?=
 =?utf-8?B?cTFRY2lqOUVlL204ZXRoY1FSalBpNVFEY1pIVmtmdnQ5MlRncGVmSHZFT0tu?=
 =?utf-8?B?b1NyWEV1aEhKYlJzeUhwSC9rdklhOU0rT0tpOTBoRkxnKzVBeGdaYTBFUVlN?=
 =?utf-8?B?UzZzdzFHaDB5Y0xDSUk3eEwzZkNraTJmdysyNWFuVEQ0VjlKQ2NYRllVcWJw?=
 =?utf-8?B?U3E0cWhiVHlxTWdOSlBvRWM5TklYSzBYLysxbDM5aWJiNHhoeks2K1hlbVVZ?=
 =?utf-8?B?L1g2UXViaU8zV2ptRnVBbXNNejZhUm5DRkZsSEdwNFdQM0dqV1RuTDJMUThR?=
 =?utf-8?B?SjlJdmdWeWhjWU9oNzdwTHZwbFVQQkpUQ3Znc2dYcFV0MFJGc1lmUEx0Um4x?=
 =?utf-8?B?SjlRaTFDcHltK2JrM3orL2wvcDBrRUVBeExrQURyVUpyQndLR0NueTQ3dks1?=
 =?utf-8?B?N3hvSVJ1MXoxMVlsQXBqb2xHQ2M2dW81dUhFSkU0dEcxZE8zUWY0Qk5QL1Bw?=
 =?utf-8?B?bksxaFlqUkFuOHFnT0o4U0tqbmhKbUJ6WFB1UXZ3eHppbEZIOEFuUE1uTW5K?=
 =?utf-8?B?NXk3NVpCejVZeVIvbmZXVzVmT1FXYk9WMk1ySW9iTmpsMXlGUEhLQjhVM2py?=
 =?utf-8?B?MHVTMXFZa3lZQTMrZm9KUTFuTnVTdnpXNS9DRjhUbStMeEt2b3RPaXFzWlZI?=
 =?utf-8?B?RldHQkMwV1Vkb0pGSFJXaGtkdXk0R2J5Uyt3eHowY3ZtUENXWktWNDZReWNZ?=
 =?utf-8?B?OE9tczV4MkVnUlk5cHRlNkdTTWd3SHI1OSs3Q24zMDJvWjlTOU11eTdOZG5q?=
 =?utf-8?B?YzB0VVExVFg5SDJKRTJmUkg3Z2pCZFRIeEhLcEg1bUViL0xjQmpwTU13eWI2?=
 =?utf-8?B?cFVpaUNVNUV2N1ZpTXRjK241bmRpMTEvalhydDhXTmxkUzRDZXgyeW1scmVk?=
 =?utf-8?B?SkF1dnJLTmVpZklNOEQ2OVRkcSt6eTk0Vms1QkxSUHZJanlicjFlL0h5WldU?=
 =?utf-8?B?M1FWc2lMYlIwQ0ZOL00yK2E2dDY4eXE3aXp3RnAyekJQZXl6VU02QUx2dDRy?=
 =?utf-8?B?Z2VXRmUzYTRLaFlWbEI2NWpoN0FOTzRuS2FKVGVFYjF4djgrTEptUE1LZ2Er?=
 =?utf-8?B?QzNaaTR0bGIwMi82WVlLTFhaNDM0SkN5VzhWWUpNN3d4QzRhOHNoaElUcGJM?=
 =?utf-8?B?RUtlbk5IS1BsUlJGZ3lQaThYb0JOaFdtVTU5SEIwN3ExK0gzaCtsRFFORDhM?=
 =?utf-8?B?aVV6Y1puNm4vUFZ4VHNiQXFVZlNOWUpqNEpQQTJabURIWG9OVkxDZVNYVEJG?=
 =?utf-8?B?eTJMZm9iL0xVc0xRUUF5U0FzVFF6cHZHVE83bVhMek5WeGJUNmFLa2JCeGFi?=
 =?utf-8?B?SzBFckxWb3ZJOXZWTGJLTFBwNzVYR2xPWlRVcXdNcjlYdVRsYWdzbzZrd3hL?=
 =?utf-8?B?NUlRMmRzMEduYlZKODJOTXdwNktwbUhsK2daREJWdUtMSEZKWngyMVRXRE0w?=
 =?utf-8?B?RjVNN3dNamY0bktja2FEYndubWdJUDNmTmtkZkVIQ3VMdzh6bFEyUTRwTDdQ?=
 =?utf-8?B?TnN6bUNGSXQ0eUdST2VxTGcrY0NaeXFxbVNNY2NLTEd1K240aEJvNmpVMEo0?=
 =?utf-8?B?NVc1RDhCUEZ0TWZTS3hYR0lGcmhtblZOTVVRcTNEVGRMUkJLSmhXbm1RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHdSSE1GZmcwM2UydDZhem5zaFZHTm5BQ0JnSFQya2xnMmJiRmRaUFVEci9y?=
 =?utf-8?B?RFpmS0k4bUxFM3lxZmo0N3pkeFlMVWFNWnFJK2xGUGdEQW4rM0k0RkgrWGNj?=
 =?utf-8?B?c090WFFyUmdIM25CNXpVU0JOM2lObnV1elF5NndtekFJMXJOYlZ6ZktpSHRm?=
 =?utf-8?B?QXRxdnRVSVFnM1Bzamo0alRqdktDVFluRkxFMEpySkgyQ3czWEhlbVIyb29C?=
 =?utf-8?B?bEUzS2lEbHZjdDlNeng3bkFFa0szckh4bkpwMnVzNTJ5VVdKa3U2NGhhQTVB?=
 =?utf-8?B?a3Fsa2NZOUlsMWJNY0pTaWpmSjJWbHZjaUpLaC9tODNZVzlEeUVBY0VKa3U2?=
 =?utf-8?B?a1Y1a21Nc2kra05QVitMbGpZWWdEdkttenVqbFFsbnRlcE5XRXRXOXRSM1Iv?=
 =?utf-8?B?OTJEZ1dqeTVwUGNxMHlDUjRJazFZQzl2aCtLWTRzNjBySi91cUdudW5YR2Z5?=
 =?utf-8?B?VWdkZG4zSDF1d1hDQmZNYVFDMXIyTm1KQlM1SU9NekJ1QlB4K0ZneWY3QXR1?=
 =?utf-8?B?cTVNQ2FvSlRyZ09nbmxzQWI3UXB4aXhRQkVaUnNnTFZwbVQrcTI1cHNXVEE5?=
 =?utf-8?B?NzRjK2Yvc05TS0ZMb1VkdVAwakFtaHg4NUluaHBJNW9UZVJLczgzck5QdVlN?=
 =?utf-8?B?bmxiUUVmU0g1WjZudUhGVm9CSy9mdW9vZVluK2orbXNrTU9nTHBzcm5PdmRH?=
 =?utf-8?B?L0VkeXlXd1MycFFuZlYyZmJuaG44MnBjZklpMldKRC9NeXAza2lySGxaQkRR?=
 =?utf-8?B?VTFrREgrUFY1bjhGL2FSQndBN2VDK1E5MDRsOGdQQVF5MXhGWklkUFFpM1B1?=
 =?utf-8?B?YXEzV3JsaWFOclFzNWNZKzh3YUJqdURPU0RiNHAzaGhabnhMaTdzSjBzcHdv?=
 =?utf-8?B?RmZsMEc3bDBFVUk3MkthQ0ltbEkxdFl0SlZaRmN2VGRvRS95RnE0VENHdUhh?=
 =?utf-8?B?dGZWMmhPREZtT3p1U0JlTnhvcDVDOUExRlh2S3FWZEJmYy9BQng5Mjlwd2Rl?=
 =?utf-8?B?QlFVTzNhUjEzaVNwVEU0Mkp4YXVXK0VSeWtRQkZnQ0t5YVRDenVnb0J2bVdw?=
 =?utf-8?B?bDF2TzJCMnBjUHpaTmlIcmpzcDI0YWhOd3FwRFE3WWQzd3BWSWxMVnRZRURX?=
 =?utf-8?B?V3VVNHp0NlN6UWpoMTRvTGdjaHpFZzhrTTgvSTI2TlpIS0xXMUxIKytpdGR6?=
 =?utf-8?B?a0p3QmZpNjZQdEl2Wmt1b2NQWlVnQWU4aysyUGFpOEthczVPTloyMzVzaUdK?=
 =?utf-8?B?c3hrTjBkMVBUT3pHVjYwd1FEejh0SkVLOWZYZW9zL2RjSnBBYVJ5VDlqWmV2?=
 =?utf-8?B?bGVGampQOXdac1ArMXowLytJN3lNRDNoQUdrcG53TmxLREVCSzUwUUdMV2s4?=
 =?utf-8?B?ZjVuYXMyZTduRTRyNUI1RGlxdXdXK25RYmFDSzlRT1JEbUhtaXZlR1pkSVdi?=
 =?utf-8?B?VEZSSVFyMkdDRWR3eWcyUjMwV1BNSGhUcnE4cXRRNnU1U3cySzNkbDE5UXBl?=
 =?utf-8?B?U01mU2hycDNLT2ZIZk5hWWJqTHovM3FVNndTK1doRmwrWVlRcjdEbkdMQkg5?=
 =?utf-8?B?eXpiVU44NHVlWDZFRHFQVCswWlppbko3ZW8rZ0pXMEdiVU5aL0dDMldWWkcy?=
 =?utf-8?B?b0xkU2tuVjlLWDNxYTZNVnBrTDRrbXpyNldCcGFYclZOM3dhV0xmc1Eyb3h0?=
 =?utf-8?B?V3U1VWlTTVk5WmhCQlowanNhMHJ4U05jL0FNSVp6OUdwK3FpRm4yTDZ3Wmtv?=
 =?utf-8?B?L3Z3TFNwWEgvTDkyZkorL3hvb1M5S200ODZwMEVpbXNsUVJUaDFOZlBNS3JU?=
 =?utf-8?B?YjE3TksrYnZycXNyMC95S2JrbTQ1cnVqeVJnenZYZ0JtU0dHUzI2alhYRUpa?=
 =?utf-8?B?cnFTQUtwbWxVcjFNTlBOMlpSZ1ltZVNMNUo2L2djenRSWWlaZVN4eUI4bHJw?=
 =?utf-8?B?ejlNMlJsRDNaenUvd24xM0ZpdkllejgyaHJlaGhsbGZ0UmFlell3clRGUzFT?=
 =?utf-8?B?N2s3UzZTc3JtYTBodTFDR2M1dENZTjF0dENJZ05maDJZMnBLYWRjUEkzTWwx?=
 =?utf-8?B?bFp1VENxdjBRTWgzdWlHSHFCaU1Pb2JETFhvaEJLZXllWHhrSmg4cWhKbkRy?=
 =?utf-8?Q?w1BJD7L39gPEexh8BQeMTkpAJ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b9691d7f-de97-461f-8b36-08dc686396f2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 15:46:52.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae0UUO9e3zu7b7S4bYPWSkaOWLM65vvfUXMQMiBCjimK2TnAyKr7gW0j6kP3MS9B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10622

Hi!

2024-04-26 at 18:49, Farouk Bouabid wrote:
> Allow the mux to have the same address as a child device. This is useful
> when the mux can only use an i2c-address that is used by a child device
> because no other addresses are free to use. eg. the mux can only use
> address 0x18 which is used by amc6821 connected to the mux.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
> ---
>  drivers/i2c/i2c-mux.c   | 10 +++++++++-
>  include/linux/i2c-mux.h |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 57ff09f18c37..f5357dff8cc5 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -331,7 +331,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  	priv->adap.owner = THIS_MODULE;
>  	priv->adap.algo = &priv->algo;
>  	priv->adap.algo_data = priv;
> -	priv->adap.dev.parent = &parent->dev;
>  	priv->adap.retries = parent->retries;
>  	priv->adap.timeout = parent->timeout;
>  	priv->adap.quirks = parent->quirks;
> @@ -348,6 +347,15 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  	else
>  		priv->adap.class = class;
>  
> +	/*
> +	 * When creating the adapter, the node devices are checked for i2c address
> +	 * match with other devices on the parent adapter, among which is the mux itself.
> +	 * If a match is found the node device is not probed successfully.
> +	 * Allow the mux to have the same address as a child device by skipping this check.
> +	 */
> +	if (!(muxc->share_addr_with_children))
> +		priv->adap.dev.parent = &parent->dev;

This is a dirty hack that will not generally do the right thing.

The adapter device parent is not there solely for the purpose of
detecting address clashes, so the above has other implications
that are not desirable.

Therefore, NACK on this approach. It simply needs to be more involved.
Sorry.

Cheers,
Peter

> +
>  	/*
>  	 * Try to populate the mux adapter's of_node, expands to
>  	 * nothing if !CONFIG_OF.
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 98ef73b7c8fd..17ac68bf1703 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -21,6 +21,7 @@ struct i2c_mux_core {
>  	unsigned int mux_locked:1;
>  	unsigned int arbitrator:1;
>  	unsigned int gate:1;
> +	unsigned int share_addr_with_children:1;
>  
>  	void *priv;
>  
> 

