Return-Path: <linux-i2c+bounces-5065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3ED93C2FE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 15:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E6DBB225CD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 13:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E1719D889;
	Thu, 25 Jul 2024 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="jE/7Pgjp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021098.outbound.protection.outlook.com [52.101.65.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7019D068;
	Thu, 25 Jul 2024 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914109; cv=fail; b=dR7EgHDc7YrlktN5vJsfOyfaalP9ptjF1jJa77Gee/PYeIP6QYZU2dTGc4w8r6G9ITFfQg7F15PfEcUxzCiExXy2LjJF+s6EgVL5cmnxlwAgRYh1pVQWqGqmuz8FrwXy49ZxwdaIwiBjnaVIhS2adoUiuqEISdqCHgFGxPrbIhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914109; c=relaxed/simple;
	bh=z4FqVvzL9gYCTOPTU7KsKuOHbjSrV8y2DJ1eaJqNdZY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GMQIjl2XTAyYR6sJxRFtlxwJ8Il5Y63wP66hSYnJ6p60Gb46yheXP/qScocRN8WfxLQYJUXtivr3wZ+0b9mgEMWyQOFg0bTmsfLwU16NDBk0uOJ2lqBFUhNuTic6gpD0j5Ff2nGlGSnYwkLOdWcq13fzgjPtbi3rb5+KRyJi3nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=jE/7Pgjp; arc=fail smtp.client-ip=52.101.65.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0Sp0XhLdLNrckxTmbjApHCY+d/YUiXbdIVzf7lN+/XpGD1POh9yPVnmp5Z4if2EYKWH3ESyRM9gRwWfQ36J2eoIUoXH33ayNAwTcWkM22jovbJTEVksTfxTiKUo+PlQ67998YHxeoI27M9QHlUfmPH7Rf7L0s5KK1MilG94Spcx4+bf0GFTxdmXLy0+vtcTsFoA2uwjO6JHRsW2QDS7CG0OhGVjMVay7sEP9IgpgA5f02rI4aIPMK+pc0aRlpY8lmqDEzUYYG5BRjN1jtqX8EpxqL/NYR5j2+t9VZL3AROFbqhwqSP1b4Fnqr/J6lmjUXnmOKxfS2fx6xvkdUBZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOz94KksZbowomQ61lp6xZjrFFg4NqyshzZRPsQz5zg=;
 b=n+RamgmhlreBpj7mar/fxBw1oSZ75Gzys6SGSFkN27bVSsMb7u5Pg/QtgMPGszcDJ/3OkXntryjLEo+MINcPZgsuNDLIKIMW8Opx1CgfL/ciOAuGcVU60Uryrkc1/cpH9v2kQJYVpm5Nsd14HTNFzEPvWqQgZRjoSFYoBF5NQdhVDvds7Hi0QattXLLZjROT2OUoY2EUrpbZVGkiJ2G0HA+WX36OLkgGAw1/BS9ZHmwM1JxArpeAexe963f7PNLJs3TAoTCE7ogZtHK/TPyX6h9yDNyd6RDqcdFmzE3qFXgH1lRQg/Vbb0bxoQWNeU9apC3Omfg6t6TTkFgxeS737Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOz94KksZbowomQ61lp6xZjrFFg4NqyshzZRPsQz5zg=;
 b=jE/7Pgjpb95EQ4PckqINBhdxwSINTa9AoAwx8XRwuVyCSA6CqECxGWz9WUtZtY3W9XDkkDja5J4gAapdrXrd3eNaFBAdrN1unWmeO+U2bIcNwa+6G3ZKn49AsaFVsKCrLbAWAajSQ8ZPLl95481mcuVdiKRQVjMWpUlu1ndp7D8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DU4PR04MB10670.eurprd04.prod.outlook.com (2603:10a6:10:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 13:28:19 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:28:19 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Thu, 25 Jul 2024 15:27:51 +0200
Subject: [PATCH v6 5/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-jaguar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-dev-mule-i2c-mux-v6-5-f9f6d7b60fb2@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 93471893-51cf-44a9-6490-08dcacada5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RThjdXJ4UHFzZ2Fvc050V1A4YTB5VjZIU01VVGVkVXcrMGFOVi9OaWliVzZt?=
 =?utf-8?B?b3pYQU5OMjhUdFdxVjJBTGZoNjZJeGhpUG9TaHZBdi9JMlZUMG53VWNseFFT?=
 =?utf-8?B?anJIV0dmczhyd2hXdDRTcEZIYzlHdmQzZ0dzTXhvMkpCNWlLWnpSQ2NsaWVx?=
 =?utf-8?B?bmt4a1plbFQwL0NycWFUR3l2cTYrczJMazh0OUNFM09TOVpiWWpoVy9BM0V2?=
 =?utf-8?B?Z0dkNit5eDNsbzlVNVdNVG8vUHRqaVJaRDBOY3BYQnAvRE5PR2VkNk9iK0FB?=
 =?utf-8?B?ZkVVbHdKb0ZnT281U1VTcUFoZkxUTVJWZnJNZkd0enFKUGwvanRHRFd5NDI4?=
 =?utf-8?B?RWtIQmNjY092L3JKNWMxOXB6NEpXczV3QU92UVZoTmxLZEFWQWVCa1dkRnJi?=
 =?utf-8?B?QTExMXMvSTMvMHBjL0dsVDJSQnZxaHNYVG9LYVRhbTdQQks4UnAxV0pCd2tP?=
 =?utf-8?B?RjRlOFRrQkx1TlYxRjhCTWhqWVFLOHJEZGFYTkh2UzlJWnM1NnFTcEdoSnNT?=
 =?utf-8?B?ZHN0elN4Z2xPNyttSktxcU9ENEwrSERzNmdhR2ppdXlLakRsSzcxaElRMHNS?=
 =?utf-8?B?dDJLdFhwVDVVeGpCUmx0Z3ZEV0JIV0tkbjRCSjJ2QlN1RnFoM2dUTjNEUkpm?=
 =?utf-8?B?R2xFQkZmb3I1UUIyN2k5Q0U5cEJsRXN2TWRqbzFRY0RjZ1dtL1hseHcyazFZ?=
 =?utf-8?B?UzEyTnAzdEZvZWVmc3BOZXVBWWwyc3B6M3U5SkVQdjRXaE5xZzE1TW9nQk1s?=
 =?utf-8?B?cHplOUhrRFFqWmIxWm81aWxJK1NGWGJxc3ZtWlNsZ29VS0JuOGdFeE9EaWY0?=
 =?utf-8?B?SVplTnRQWlRYYUU5SU5DTFFzWjdqL0M1V2ZuckVmbDFmaE9wTlg2aDlSOHdu?=
 =?utf-8?B?c1c4cFdyb1JnUHNhakdxenNXTXl2YzNNNi8rb3BFbGhvNW5ZNE1Ea1JDMHVv?=
 =?utf-8?B?ditrYTEyVFRFVUdkZTRUVGZrZkQ1TjcvM0Mya1pQZ2s0ZUJ5WEJuMDJBcS9L?=
 =?utf-8?B?c1pjU0NrazVURyszc0t4ak5kZUZVakZrQ3orUDBLeENGL1pueGRseEJ5MFFa?=
 =?utf-8?B?OFp4bm4xSEVRUnRHajVrSmR1OUxKNkQwOTNKbThtbTBFcDRCdXZhSldrY1JU?=
 =?utf-8?B?Y1Z2cGlXU012cXdhVmFuVXMrbENrTmtPTklTYTEyQkh2bkNIMUplMERHTTNl?=
 =?utf-8?B?KzlsYmp1Y2RzZzNiMVM2a3ZRQndUc1BMM203RmFrdC9hSTVBc2pLWHhmZStn?=
 =?utf-8?B?R01pV0x1UjVGNEtGMzJTWTRGRm94N1BSdEZ0TDFvcERGbnNFTm9CdCtBNWg1?=
 =?utf-8?B?U0tBU1NGTGZlUWFkS2ZMeWNSeVpmN0RVcVdFZjF4RWFUUWxrcmhEZlpubWZm?=
 =?utf-8?B?MEZXL2ZtN1k5TzM2WDlhMU9RVkNna1IxdUJXVGNZMWZTekNFeGZvTmZENHFs?=
 =?utf-8?B?RXNzSGY0MmVZUGVjc1M3eCtiVDFmSXJlRFBic011dnpiT1M1d1RwbGk0NmZu?=
 =?utf-8?B?N2ZkWVVsMHo4QzRUVUc1WUxHNFY5Z0JacmdWU2RIUnM1M3l2Q1hVY0lZV0xZ?=
 =?utf-8?B?bzdqUWhBZHRVUjlxblZqRkdjL1hhOUtSc0ZQamJna3h1bVV4Y1d1WGh2Z1hy?=
 =?utf-8?B?aTBsNmhoMWNYM1VpVE4wQk9UTEtMY01menZwYWpqNG5FU29LSTgxdnJOVlVz?=
 =?utf-8?B?eUswa2tnMEoxVmVsZWtMMlZTYXNQNlZteG1uR0lHSElqbVNxVElwQTFaUk41?=
 =?utf-8?B?OUhnKzJUSU0zNDdQSHRRb2x2YkU5MVdVVDB6STdjbzlLbmNpZEFnTWFuQlhl?=
 =?utf-8?B?TzIzdUlvZHR3Tmh0NG00K2pCRXNJWGtoRGt6UmZtalNNOUtNMkMyNUpzME94?=
 =?utf-8?B?T1hXY3o5b1creStuSC9aaFhkcHNPWVZwNDVqajIvV29XT0NVV3pHcThUZkU1?=
 =?utf-8?Q?OE8zW+xQcTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWRRSmMrTEFDNm1yNVFmeWVyK1E2ZW1ZQXUxOGQ0NWpVMTMrNnNTcTZ0T1N3?=
 =?utf-8?B?bXUzdnRYT01iNjFiMHhsQk9oZGJhdEIrcUNXaGtob2tQaTM3R3VHMXBuRE45?=
 =?utf-8?B?L3EwaVgza01zZmZXVFEvd2I1VEdGYmJRazZOdkZzZG9oWW0rTGYvNHptYUNI?=
 =?utf-8?B?bURGV3RZK3p3cjlvU1J6Z2VDSjBLcXRkS08wc2czVzcwenU0c0VGTUpjMzR5?=
 =?utf-8?B?R3JuRmNRa1p4N0Q5MzFCQlNnRHN3cUxSdjBrS2FFSWUyQW9jeWJlYWtaUk5u?=
 =?utf-8?B?b2NJYko2S092emROQnRNTi9HK0dyK3EyK3FZemltVFRZUjlQYWtwMGQzYVFx?=
 =?utf-8?B?S25KNWFETHJGVWdiUksxMEM5TU0vUzRmY1IyU2l4allEYjVoRWc0bUVYc09j?=
 =?utf-8?B?S1pqOGNRVjEzSE81U2hnaVp3VXRJQmIwUUltcnZsbzVYZ3RXbzVGZEhUZXRJ?=
 =?utf-8?B?bWNUN2c5N1Bhb2pwVWF6Yno3Q25DNjBvVENXZUl6bWxZSjUvYlVBRG9TcHRu?=
 =?utf-8?B?YTJ2ZXZlM2Q2Rm90VWNXUlpPa0VqczFvaFRVTktiU3drMzY4czArUVYwMDND?=
 =?utf-8?B?ZkdwOEVnNm5lK0ZuOHNCMXVnK2FvZEI5Tmc0WWViSG1XTGZpd25ZeGs3ZFJy?=
 =?utf-8?B?Rkx5VUJjWk5jMThSRXBhOHcyaTVIMGJDRG9SNFFGb3RCaThhYTE5UVpqelVL?=
 =?utf-8?B?MmUrdjA0bzhsN2QvakRmelpaR3Q4Wnp6c1ZrcW5CaTRLWFJtY1JzNTVLSmtR?=
 =?utf-8?B?Z0s2N1FkUGVpcmN1ZnNMTyt2U3E1K2prRUFmcnE4SWtoSk4yWDlIT2dkV3oz?=
 =?utf-8?B?ZGVGbHZQWWswZTFoQXFITlM5WURBT091YjRsMXZGL1FBcUJUZGcvYld1YXNY?=
 =?utf-8?B?Z2sxWHRTTUsvclJiazkxMkV2dFlYbi9wY0tQY3lZcnJlY2VUanMrZk16Q1c4?=
 =?utf-8?B?dndKUy9pOWl1QXZQVEgzR2lvRXJKM3h4TDlKeTNZaWxpY1l5MGdqV1dqQUhh?=
 =?utf-8?B?S2huN25IVlo3ZWNDNVYwbzY0MUpyTmt6dkhleVpHWjVzRXZMVnBEQ2xVTk8v?=
 =?utf-8?B?ZThJUXlOclhjOXg3cVAvVjA2bkJmUTNPV2Rkc0k1Rzk0Q3owRHRpelRIeXVs?=
 =?utf-8?B?WmhWS1Z6bGhUSUtXL0NiaXg2K0ZCOVllMDRqanV6dFJiYjZiK2pDYUhIVkxN?=
 =?utf-8?B?SjA5M3FXNEwvc1I5aUJ1MURDQkFDVWVSaW12bVJmTytxd2t2VEJQeGxEdWsw?=
 =?utf-8?B?enpTaDJTSWFzM29MTm5qTVRMclNzWDZzc1FKdDBwRUs5MXQ4WGRIVTNzNmRL?=
 =?utf-8?B?akJzTnlBeUNFQk5vWkxmMEt0bzdta09KVmVYTE90MFNlYjQ2SlkzRjMvVXJY?=
 =?utf-8?B?bVhCb0xvV0ljeE5EZ25ZNHQxRGlkaUJkTmIrbFFPUmhvVk00U3d3VjRwOEU0?=
 =?utf-8?B?R3dZOW9uai9FMXpCdDVBaDJqbVN4TUNvVy9ZNFA1TTBuN3V3UTZKMDAvNmJi?=
 =?utf-8?B?VE5uSE1ydlRFU0RjSTlESjQ0M1VXU1VkUnpLQnc3L2Fsdm5LTDR5ZThSN2pa?=
 =?utf-8?B?ek9odjIyc3IzZzJUR0Q0blVWQkdCdXY2SFpyNFBhNktYRW9qWmFKbXdmTkxm?=
 =?utf-8?B?QTI0aXp2U0svbVd6V0c5MlY3OXBBeHhsUFBXek5qSFg2TnFzdEhxYzA0SlNR?=
 =?utf-8?B?T1Jrc1loSzFnVEg0V1dNMkR0bmRvWE5uWC9WVHVMSTlNby9ZN3g2MjF5OXRj?=
 =?utf-8?B?aDRNZ2FHSHF5MWUvRGVlNndEVmVuWEJOV2R1cWp2bGkrK04yWCttRVQrOS9D?=
 =?utf-8?B?VWJZS0FGdFdZQkRMUzJ1bmNBNHFXZGttODl2MlM3QTROUFJOMVlkbnRjaDNh?=
 =?utf-8?B?NnppRWk4WllqT0pJM0JRZkJRN2EvSE9UY0lPU1pRSG4yRVh2OGNSYXVQaVZX?=
 =?utf-8?B?cnAra05BOCtDV05RK1RTY3hUblpNN3QwRURCN2VKQzZUekdCNjJJWVNsOVJW?=
 =?utf-8?B?eTJodWhwOUN2RGhTWjZPbW5ZRTZxR2JOODFKbG1nQmpDZ2pZNGtyZlZqeU9w?=
 =?utf-8?B?ZVZjblZWaERsdGVDeDkrZHprN0hpK3plNVE3TFFWaVRIYVFjQ1dFaHFNMDA5?=
 =?utf-8?B?YmtzS3lzTkNhYzVNM1B3WnJvaDR5THlKWGdXUFdZRzFYTmtSM29aZ0NFR3pX?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93471893-51cf-44a9-6490-08dcacada5fe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:28:19.5078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbbVxIiLDU2+yLDLgSgTnJBsAFDloeBXUU8Pp6lTaog9e+uSA3TKMDlQLNSjvRdWo+iC92VfV9wZ/gVDlO4U52/1yb+NdNJ2ao88kmRyGXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10670

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
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


