Return-Path: <linux-i2c+bounces-6330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A496F8DC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE0A1F23226
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975DE1D5CED;
	Fri,  6 Sep 2024 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="BJozGZPH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E321D47A1;
	Fri,  6 Sep 2024 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638164; cv=fail; b=NqlDMar+yY3NMRCTswZl2koT/EBQuWopadk3cmJAUdhRX7x8MSktJbyiwyfcwXg4uJy6xCWdM5UimSfRNq77lH2W1OE2E1hl6W+JWmvZFcfLtc1ieHHO5PT5KdlAMPfnoInc/8K40UpQbe5l8ZSFCcXTVRIFLLBBwk5ze1SPP7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638164; c=relaxed/simple;
	bh=i/M8yJPcY03Ki2kkWdHjugHPVbN0du7sMp9K4aXl/4s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t5jgeA4Egba//zQ6jX7j1xayRt2VsL0WWfg/sCP2PYn+pNVTvux9bIWdCxcsKZs0G6Y08vhV0kSQFj+pXlnVFf6M7U0Pt8PR/IYlt0VnLKZfiDYbqP9fUjt6PLz5rLllqHedPuJ8bH1DFs+JcyNGgRYzTXkg86DXS6TGuz+kNBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=BJozGZPH; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDV8WwVykZ1uhLnsFn9oQM8PG2wAiOhK+GKo1GKxeBhHMMpjFKLNRD3OsLOGTWf7xPQCQVrNTsMH2xNX/BtonmMGdcTKuw5g3++lGHGPspEcxeYSCcqqg6y9ruHFTkeEW9Rc4CM2UGjo21+fOTZiXTH2D+ES9ACaBkLMjPFFCL9pHe0+b85KDFr7oTY1Fr3pdmJ9jR51EH9s257xY1tYabPoFik8mr9IZfvl8dyhTllTK05vTwbq75ZrtGlxfyMUNBwXnZEyuYGWsXZAvFcz+WukLI7YpoLFlnTubp26RfPmNz9RyZQoNyy16JrbChV++AhrhyrWhMNSW0KZp0BYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7X6VHwyc7ENIxUNFQ8H6ZqCtiExpK5STM8GkBAPxkU=;
 b=X8ZI3MzoIgvg6Ff8ZOg+ZcNBqr1q8uMy6dBpIJHtXWlB8VORtV88q5LcdMTOmPXR5+ROiKBzB9d2S7FIbYGbIjM1T9oh5JYc+/dPYJfkOfXDE6Dilco/ofc3FmaVJkZvQ/dlJ8nMuKNhvF+09qCUmNMhdrXARRatFqlf3W69RrmbZBJDHJDtt+PgAqmGWthGU+WnBvern5nLS2xlcnRY9U8ccNWxK6WDqHYlp58ymKAmAuM5tjwacDZbQ+dPFz21egd0iCvkD0rHjklbOfaTqFgJ6mkIs42zbYXrm1PKwMIrOPJf3QTzyOCMHOvL8Jw3+c7H/sY9MYsTBd28VP79UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7X6VHwyc7ENIxUNFQ8H6ZqCtiExpK5STM8GkBAPxkU=;
 b=BJozGZPHUkkcsXa0jW/NyBVpw3E5tebUb+dMiLK0AzpqVWOSFoQqrlzZd1XotVJTR3gT3U7F/la9LGutZ2ITMQjkc7VkGXrTtLCeY5xm5BMl+iYy+bZgUQ3b8gFv/J2Zym5cFkIF1/fUdvtKt4obhGDIIPksFjdcFpq3HBx0bgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:52 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:52 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:18 +0200
Subject: [PATCH v8 7/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-tiger
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-7-dbd28a150e41@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: e1030996-48a3-4e8a-36ba-08dcce8c6263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkxzT3BaL0p4aXhmT3pESkVucXpFVVRtZ2ZXUEJNWmM2dVdNN1p1Q3pjUWFE?=
 =?utf-8?B?L29Mb29LUHRxRERPTzFWQ2RqQmhtc0hDZjhObVdtTlFSUUJ2aWRVNGpKbGIz?=
 =?utf-8?B?OU1OWU15UGhNNGdVQnczWVJKcENDTk5taGg2Q0pjUExBcXhzelplNXBlcVJD?=
 =?utf-8?B?RnpaQUo0NHIwMVloblBTTUhpZEFQS0k2a2FsQXJmSHhxT2lmNFpYYzNaUTdN?=
 =?utf-8?B?L0IzQXpKbmNKOERoYmE3Rlk5T29DaGJPRm5IT01WdmtwbThacmgrZ1ErcFdJ?=
 =?utf-8?B?ZmpQUGpXOG9kT2RvK1ZGRFduT015VWtkblMrd1lBdDVpMXBRQ0I4MmpPamI1?=
 =?utf-8?B?Wkd4M1ZCcjFNSDgzWjdFa0xKeTZ0alVHYzF2Nmgzdk4zK2VkaEFPWlpPUU5w?=
 =?utf-8?B?ekptRmFLcTIvanNqNGJqZjhaU3BqbDBkTUNVcFN1SE5XYy9wMi8xZ0Z0bm9L?=
 =?utf-8?B?UVhjUm0yS0x2dHpuSENrR0VleWJYNDI1dWMzMk5BZVJHUExzeCtMTzQvODJT?=
 =?utf-8?B?bzhhU25RVzhnLzFNOUZPZmFvNkFrUzdnOHZKbytTRTZmRm5GazJoT1RsMm9V?=
 =?utf-8?B?Rk1jcDQ3UUlDLzdXdWVVTnVneVlrbXZITFk5b3JDdm9tY2MvOS9oV3VVcVpF?=
 =?utf-8?B?ZS9OSkZ2bmJJZHlzOXUrSkQzcE5haFRrS1J1UW95MEo3eW9NTjdMRjB6UVRa?=
 =?utf-8?B?eGh5YXI4bEQ3SmVkY0U3NEk0V3V3WTdib3NaQTRhYmZiaEYxUklRc20vS0lF?=
 =?utf-8?B?OGpxN1FPRXZIcm9FYkE3Nm9KMnNEWEhtNGFRVjZWWVI3QUdPUis3eXc4MTlw?=
 =?utf-8?B?S29BdFlHWmpZcnNFcEpZWkJhSThHQ0gwem1IUWpSTlo4aktuSnQrcUdjZVox?=
 =?utf-8?B?cmhYWVgzamc1Tm00anlRRUhscHU5Z2JoWFRYV0lTK1lUN0RnUlp0RnVLaEdS?=
 =?utf-8?B?YlozUkNDV0FYTUVqYnpIN3RKODBkK215NkgxaXNCMFpWTXBDNHY2Q1JHNVRN?=
 =?utf-8?B?TU9xVmd1YTZqSE9zL1ZMOGJoNS83QVNwU1JZOFppYlM2UTBEY3h3SGtOYkty?=
 =?utf-8?B?MkdMeVV2TVdlSU9DaHMyWEhMeGVnVTRTLzFoVEQ4TFd6K1Rzc1lNdFNTeWR5?=
 =?utf-8?B?aUdCODhFR1BMV2wyVTlCMkNxdEJOZE1SOVd4WGhzd25DbmVNeEZjREM0ZUtH?=
 =?utf-8?B?U3pqTGg4b0g1SEtJdDJhYVBoemhNT29lRjFQbGFiYnluMmtIc0dMZ2hKekkw?=
 =?utf-8?B?cFR1dHhtTkoxVWc4SEQvUTQzV2VCcFdyK29yaDFHMUgvSzdiR0lod1RVMUYx?=
 =?utf-8?B?MlZsWHQ4cEFqQnM1MW9TQUhSNWg0NEVxci9FRlN1THFPZDFpRzA1Uy9LUzV2?=
 =?utf-8?B?ZEpSV2YwTS9TbUI1elZMZlV2WEF0Y3lJNzlyQ3ZTMkQrdkJXN0oyTzArb1FG?=
 =?utf-8?B?alVFSm94Y1VDSDBNMGY3bmtHc3dQcXFnZEtGSDdHNHRGclRMcURaWWRiWVlr?=
 =?utf-8?B?emgzZ0tDQVBEM09pNzJlcGh5Q1k0U3d2cHJIRm83cTVQdHRMM0lkS3pnb0Qz?=
 =?utf-8?B?WXc1V2xEMFkzend3WUdlMmNOcHlrMWNqOTVaMEhScC9xSHBMZnNuTGFKQ3Rw?=
 =?utf-8?B?a3BWQUxmanZzUFlkeXoyR2pyMWFROERUNzhqNGZlNEdubDRNVlpKbHhPQXIx?=
 =?utf-8?B?YXJDTmxXeWNkOG5WOFpiWjczN2NaQ1JQQW1ZTXFTYUhDTVA1NW1pTDFhd0dv?=
 =?utf-8?B?d2plUmtKS1JWK1dxWVIrRnNCelFmWTg0czRnU2FWaTFsQ2laNHQ5UG9kMnNm?=
 =?utf-8?B?ZVorcnlIWFE2bUh2L2FYQUFERENlQ2RtaG0yanR6aGJmTVlIMmpWaFNieG9i?=
 =?utf-8?B?akQwMUVwckVLM1RHTmRnYTU1WWpoOWdqMXQ2Mjkvb0NFdVU0V05GWHRBalpw?=
 =?utf-8?Q?aG/m5GGXC0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGtyaVZqMmFta3RYYVJpYngzYmpybTA0bTR5ek9FcFJWSFM4Z0pESnBKTzQ2?=
 =?utf-8?B?d2FyMEwwU3RtbFl0OEFlZWl4SldkRWJwYXNFQVExcFBpenpteklvR2JWdVNP?=
 =?utf-8?B?TVN4QkZWd1E1a3ljSThUK3hBSE90QlRNdnNWVzR0MEtNRDFweVkxVHkxcEZw?=
 =?utf-8?B?NUU1Q1ltbkY0elBPODA4QTFwa1VjQ3BKUlYrdjIrcVlPZlJsRnlDLzZkd1VH?=
 =?utf-8?B?QTVGaFpMRlRjZGVUM21lVlVKUXRqQldWL25vcHM0Vkc1VjdMVE5jU2d4Mnlp?=
 =?utf-8?B?WmZRdmlPVnVtR01xbXZpSlZMSHhiNUhKWGU3WDloNGl2N0NhbEtVWHdVOXcy?=
 =?utf-8?B?dUVZSUVqSlJkMzZvNjVqV1JwaG9DeWp0TVBnMUp3eUdjWExDc25KcGxCdzRM?=
 =?utf-8?B?UE9QMGZzbFprQ0VxMmNvWFpycyt1N0crODN5dWpKZWI4bGJIem1GcmtqcHJr?=
 =?utf-8?B?Q0YxMThidTV4MWdHb2hsQ0IzRzIxZUc5MWhoemhrem5QOVovd2tRL1pYalU5?=
 =?utf-8?B?VUVqUWdaaWtncSt1SU8zQ1ZFZUhMZ0ppS0Y4eUw0a0RyU1hQcEQ3MFJLZ21R?=
 =?utf-8?B?eU50R1ZpWmxsSi9kK0Z6UzFSN0VTWkFkaVZHYktiNXBUWjFXckt2UVVTdmlS?=
 =?utf-8?B?WFpBQXl3VjlxY2YrakFpbWdnMzY2TldrOWJWZXJkOSs3c0VXTkNBRlhoRTRF?=
 =?utf-8?B?YkRhVEJ4Sk5mSkM5dklnSElJRDU1RkZBREF6a1FCYmNRbUZFN01Jd3B1Rmp3?=
 =?utf-8?B?NENqazJZaDZSRUU4aHVaQnMxU1BlckxNS3NWQkluZTJ5VHA5d0RxM0RtbU4y?=
 =?utf-8?B?KzZreXZjQlBDNkFFWWNIeUhvOFViYzJHMjVXT205Y2hWenNZSHBvVmsrZStq?=
 =?utf-8?B?cEtYZ0tiRHFEZ3F0clk5dXBYUkljMXc5MzdrVDRCeXR4eEszS2F3TWYvbFk2?=
 =?utf-8?B?WXJWcTlsYTI5RVpocmMraVJTNEkrQ1Mwc1F6NTgxcmw5UGhFRHZvOHkyb1dj?=
 =?utf-8?B?cWMyOUlldk41NTR5UnNlWUZGUFdVd2ZMcDVBeHZFQmdiTGFWMm9Rck9uN3hy?=
 =?utf-8?B?MFBEU1dEV3BRN2gvUHpoNHhQYlY4Q0NMRGV0N2s0N3QyVEtsWUpWdlVyVEp1?=
 =?utf-8?B?SnpnUnlENlhCMWZ2bDY5eng3VnJEd0l0Z29meXJVTVd3bU9XZkh4ZFl5c3BF?=
 =?utf-8?B?YTN3Qzd5YXZNR3BldmhhWFZMYU8ya2FRaERPVEtHOHIrZjlwMXFsdG1palF4?=
 =?utf-8?B?OGtXekU2Z1ZmNWxUVFpNWTZZTThMVmlBZkxxcE9jMmEyYjdxbkViWloyWmZJ?=
 =?utf-8?B?WG54Mi9HdWkxMmV2RVlEQTg5QS9SRzBYcW5aRSs4UnZUcytTcjZCa1BuUUwz?=
 =?utf-8?B?c1RjZVp5OFk5UEJ1Qjh0aG9SWmRJcXh4cllqeGc4eDJPOEhNMzkwNUtIZlB6?=
 =?utf-8?B?aFlpdXhSWURLOTVKRURkVk9mTzZXNXoyTVZJcXZxRnIvZ0Q5U0h6ZjZ2QmQ3?=
 =?utf-8?B?NEtNSGdYKzQ2dFJTN3RURW9ZRitWYjBTQ0FLVlFKTGxrcVhzNGpjWGNlZUJl?=
 =?utf-8?B?TTBWcFRkSGo2SEJISzFhalNIS1hOM3dMcGJCbEtSZ0kvYVc1VVVjOXZOK2Fj?=
 =?utf-8?B?QzJydDRCZ3NSMko3TVE2NjZyUm53Mk9yRDB6UU1rSFhwaWx3WHB1bVNlMHpC?=
 =?utf-8?B?a2pMYWJkOWV2dlVPUDhqcWFKczhVR01MYnZ4WG90bFlSZVZkMVgwSWNJMUpn?=
 =?utf-8?B?TFZKZlYyRDJ0dzdtempmcGhMZktGZytML0h4WjNTdVREMWFLd3JISHBtNjRZ?=
 =?utf-8?B?VU5LQTM5WGJqVVlhVkVFcm5NWmpBWmZvR0Q0clNPTWpWaVovZzNHWmlvb0th?=
 =?utf-8?B?MFhJNW5jYzlqTFlhclZueXhnbmluNjZNb0FWL0ZrazhDTEVXUm1jWWRaenFP?=
 =?utf-8?B?eU04MzV4T1dOTGVLcENjVmdqUWZaNEV4RmVFTjhnVVhtREpLaDFqcDFJMnhw?=
 =?utf-8?B?R2ZMWDdwbjFYWlBZKzFrMjdwZGJ1YWNzNVR4Qi95ci9PREZmenNJekNubWRk?=
 =?utf-8?B?QmE5TytWVVU1SDVXZlQ5UFFTdk4vTThDczJGWm5xcFdVUlg0VllXcTBNRnZ4?=
 =?utf-8?B?cklQMkNHZk5BWDcrdHBSeGVVTW1kZ0dJaU9zK3A3cCt6TW1hQXU0SUp5NmFZ?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e1030996-48a3-4e8a-36ba-08dcce8c6263
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:52.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwAAzsk/FgiFW5ZaUoXGd0qdTiwAG1ggJk7s/5Jl3gW/Sw2u3ZJon6DET6fK0ShJwjI5HFGdIJGXk/aWWhpgFGqIJv8bHcDv3Wx5LgEKc/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

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


