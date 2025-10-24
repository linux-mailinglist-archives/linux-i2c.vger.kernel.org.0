Return-Path: <linux-i2c+bounces-13793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C2C06E54
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35983B15BF
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B617322C99;
	Fri, 24 Oct 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mnYl3VbE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4CB322A1F;
	Fri, 24 Oct 2025 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318817; cv=fail; b=OQH4i79WyVseEbYrowVq3mgdiPr7en3peSAyopW6Ck2/kt8j4D5OCrH6Zv3J3jNcpVj01hF4iXbwCPGxou8pevcoNSLQt941FKj9+yrdM4Zq2HD4yAgVSEIiE0n9lZa95KaYK+p08LArak5MTqv9gpg7as4wtjXpxQyQtGbMZRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318817; c=relaxed/simple;
	bh=xUFqaguhwskDzWz9NJ5v6QswgpTMx2reKfZZe5ZPeec=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oCqgh/xVdZ0dV0SFoaDrbn+B9izMzthUdBokKBfjtJpCKYw8cL0gD2dCMx49DPC9qOgbqx9BG6L2bJBqItMAOQKJbbBTpdO1rKNMmyDF+7QIQq7j/RDU549JJK7H7/tLjQ6E8KISDGMx8Rv5FUzXKZeCJWYYNaSZzzW49KfRLcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mnYl3VbE; arc=fail smtp.client-ip=52.101.56.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xu1viedeSsA3LX+kIS8A8IR5q1ewv4ays9oXwP9xm5E6hFMfIXB/JFHucPOd7bIx/N4cW42WnX1jeOD/8y2G6vtgSifIEpHKPGPBU6gqO9q6QXfTopzG415RGJGrJp91G2Jj2QbbKj9SO4cvCEMYOnHNe9bjpZvLBdsVOe+Eohx6bYlCfKHCeLEJa6W9FHrIYd9pWCRY2Ev892SP4xb+a93VRGamvbE+icq5+bfQ1desvWz75ivVgPuGzLdcWuzaytxdy0378bpHeNiBc001PMhw7Q9ksk8IUvF+MyqyHvPwDiNnHjuQ1iLI1EWSz3PaVWjLUF7aCYQLFmuckoSZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW1LH8gGeBeHC8nivHBSpT+CcsGZhFugiXPGedUYy2U=;
 b=fsbh+CscfkuZ2zVTwhAL6CAE74hy/M/MttG32PZsLGqorl2/LsSQOCC0sfxOsrJW3aWoiQ3MPEz/XFtybDQn1BxNokM3nWgpvTiTWycKDy8RXT2p03pIIoZEzDEr16WVSBeZS98hwQ1HTcgQhVHlnljK3fxLKq6f49iZwh9QamrF+JhyjoVrLTqN70MUKACqxSg9FlnEX14frb1JSRGcM2nSrNJkjAg9krysOKbWVyZolZzh6wkCwJKYJjmoAljcaGOQMC6k1GPlrnrZFtu7hKZtpOqC4GlIaxxehX3ZAwAABT3x/0y74EEhEvZ++FYWUwwILKYYvzC5L8RiZnqDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW1LH8gGeBeHC8nivHBSpT+CcsGZhFugiXPGedUYy2U=;
 b=mnYl3VbEVI3qU+bbrvxubFLtHFXvXuz59LEy4E8jZjj9/BhhyLKHLpVXF67dbpgg0bssCGaF/y9Ebiynn4DioXYyOXyZiaRMGhW43fIOuvvrCNZPALa9wdOAGhnhV69PdV9FtY+oAubYqC+scwBWx2s4kTHm6tT3zqkU8LQHKJM5hi8EvY6x8EfRVjTSZs8TasnWp1NMMjTEuS+DQt2C5iiECab2/XxB4JyppDJOci5olNf9TxDKbgIF/IjKNcReej1Qq2QFrGuCNw4tANbPok25cqWob/DEsqos5W7erM8kLci6VZ/LWXmakA/YuI4+qUGssdzYiA7YhXMRO7kJ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:13:33 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:13:33 +0000
Message-ID: <ab204023-1c45-4c67-9a90-d854da937ee8@nvidia.com>
Date: Fri, 24 Oct 2025 16:13:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: tegra: Add logic to support different register
 offsets
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001153648.667036-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8fa719-bd4d-4d10-e146-08de130fe566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sm9WNmtHNUkyZVZtM0llSHpYclc2aWJab1ZKajk5eExYSVVjRWRiNkV5ZlUx?=
 =?utf-8?B?aFFwVGZJZFBsck53L1dvQmJKR292eHBVK25vNktLNmdDTEhLWi95MHFMSVMx?=
 =?utf-8?B?RDhZK3pySDJ5SWh5Zm5MbktCZ21HclFDYmFuSStPNlQzUUJiZ2RWRnZCb29W?=
 =?utf-8?B?cm1WWlJjRXhUMnNyMW95eDA1ZzdNd0lmMWVweThLRE5DUFF5Q0s4SXE4blhD?=
 =?utf-8?B?T1VFTUEyeUx1aHkrSWZGa1JiUVY0aGs4UzlTNjVadXBWZk44QnhweG5sVTBl?=
 =?utf-8?B?bmRMakF6UUkwaFdwdjJOUG4xNGJ1UGttYTFZS3VQSmZNNzNZV0d2di85MHJP?=
 =?utf-8?B?UktpZ05PU0p6YWxmTHJxenZRSy8wSHRJbW13a2NzYTBSaUQ2bDM4VGRISisw?=
 =?utf-8?B?VUR2Y0F4UXdDcDdnVmIvZ2hoR0k3Y0xQQk1QQ1g3ekhzSFlEN0RMSDh4ckJ0?=
 =?utf-8?B?MUFCRklITUlsbUh2QS9wb3ZBS3p6cUQ1aVVVdVM1UFVWTWVPaWE0WjcwcThQ?=
 =?utf-8?B?TzRNbk5oZ1ZmSkFYRzgwZ2FBTk9ZYTg3L2V5TzNYM1FFOEhITGJWZnVxZ0lB?=
 =?utf-8?B?a29QQzkyYk1qUGJ4S2VqbnBvSDI0SEV6eDlsdnVUU3YveVFJU1BCa1pPSG10?=
 =?utf-8?B?V3JIZzJCS1Iwc2kxdDZyUkhwZ0lXVDY1K29iWU5pY2hNOTJ5UjhTUHJsakt5?=
 =?utf-8?B?WG1Mb0VpemsxcTNKOGhicU5GdzFzQzRHcTdLck5wMVJ4a0o2SFdNcGE0UWUx?=
 =?utf-8?B?M3dLRHEra2EwQWpBcktnM3dCR2V1YTFSbUJYR2NMUXV6Vk1OZ0wxWmNrbmpr?=
 =?utf-8?B?eVUxOXhkSmljcDI1ZEc1dkdiWU5RT05GMGs2Y3hWNHpIcStPb0JKc3VoK2Vm?=
 =?utf-8?B?aUs1V3A1N3JQMGZyeHdQSmI1cWFORVBXY0JuK0o3a01WRTlINTh4Sm5tT3RE?=
 =?utf-8?B?N0Z1MU9XWHlPekZib1VoRDl1aFNpSW9EQ1BIa2RsUHRnL3pSZ05pNjBBcmI4?=
 =?utf-8?B?YU16bWh2eFRkUktMdjRxTC9DZ0s2aTlLWFF0Q0hoRUYzcFNHL1pERzdsN2kz?=
 =?utf-8?B?Tm5kUHlNM1cyNEpYYlNWSTRJU0JmdFpocjlQemZZOVRKNzlxb2xCcEhsbS9H?=
 =?utf-8?B?dDYwanF6ZmF1eTFXM0pFRkxCcDQ1SFdmTzhYTCtNRlY2Wkd0V0RBMC8zS0Z4?=
 =?utf-8?B?MmdXMmt0dWc5ZTRaaysxOEhFdEFPeDFXVVdFMko4OVFGTDduMVZpMWl4b1E1?=
 =?utf-8?B?dnhKaWxPcjdJbktHOHdYN3gwRVBtOVRpNlNlOHBsYlZ4Y3lnVnNkRzZWUEs3?=
 =?utf-8?B?Sm9uL053OHcxTUdtcTArQzJnZm1oR25VTlo5ZjNTLzFmait0c1FCeHk5RGZ3?=
 =?utf-8?B?Vm45QXEwUVkreGZwU2dNUHZiUVIzdit6VWpBKzVMTDNvaUFRYStqVk5DZHQy?=
 =?utf-8?B?R0F3UWVWcmxHRHU2aEVtZzdBYkpLc3AwcFd1ellDd29OUWs1YzQva2VlRDJH?=
 =?utf-8?B?YXFrQ3N2L3puaWZGb3BENnd5WjVwTm1lVVB1STRrK0dQdmE4V2N0QTMrSU1D?=
 =?utf-8?B?WVBsR1E3SUpWOUFtTlVJY1IwdUJJT0FWdVNPSlJ4WlFGVW1IS210UDBISDdM?=
 =?utf-8?B?TXpuRXhmZWNhbFFHY3IyaFNxVDFreUtjVnhLcXltN3F5K0UzSktWaGkvWlM5?=
 =?utf-8?B?REEwYVRVaFBtbXRnT1FsVU5SdWo1UEQ1MFRMMUZVaGdKcDlDTzNDTjM2WDBa?=
 =?utf-8?B?M2JVTVZiZklhR0UvRzFOaFpLZE85MG1ram1Dc1pnZ3ZaNlJ0R1ZTWWNUWHZr?=
 =?utf-8?B?SlJndnRLMWpLb1ZpdHp6NS92ZGswVjNOY3NFdERNWkg1bXZEUy8xZm8rdGdB?=
 =?utf-8?B?UFFwU0hqeWpHY0RpM0l1QnBMNmJETGxHNzNEYnlMY2ltQlNFSzJ2T0poNlZH?=
 =?utf-8?B?UHVmcXRJRzJYUy9ONmVzU1Z2MzlYY0tMNitCK01JMkFpUlVzc1pPdmVicnZa?=
 =?utf-8?Q?+0ghx8Q4bLWEsH0+etP4PKMbZxm9AE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFlSdTdWRHVrRWFSY2ZRZE51MUpFbnlqRzVJTlE2QnpTU0NjOWtXNUZmQ2Nx?=
 =?utf-8?B?bkZHdlA4VHRvQ3RZVWRQSTczbWJnaGVLdGFNQmxUeFVlMEpTTFp1NjQ1eDlY?=
 =?utf-8?B?L1U4bzA3N1U4N0s4TGU2VHZTWDVvb01aUnpJUmRFeEZpT01zQVU0M1Y4bDlK?=
 =?utf-8?B?UG5WNm9WeXozbnNCSVIybWpFeUN3VEVPdlZmM242ZU5sQXZMWVVjSkRvRzNK?=
 =?utf-8?B?UDNPaHUrR0ZCcG05d3JsSGNlbVVhdXo3Y3VtbUp1cU5BaUFnSVdrUkYzeDg5?=
 =?utf-8?B?U3NPWjU3MUNreWFBWUZXNE0xWlVwbU5qVS9ST0JndG02VHVMNVVtMnh4cXM5?=
 =?utf-8?B?QUdVNVE5RnlaT3FFL0FzWW1VRENkbXYwaWJQS0FNVFpFU0ZsNTdjU0ZzTEJk?=
 =?utf-8?B?dW9DZSs3RkRPY0lmQ213YTB6Zk44dVRVMzdaNVlmczh3UE92WjBOcmhMcVZ6?=
 =?utf-8?B?VHozZFR1akFkUDY2SkRRa0dYOG1zMmRScEQyZER1V2Fla0ZqTS9lblk2Nmsv?=
 =?utf-8?B?NGpTbTlJcXRVVDY3V0VabHNTZU41M3BZdnA4T2pDK3B2N3pxZU4xZUEvcWtD?=
 =?utf-8?B?MG5USTNLYkUwQTdERE4rQ3J1NnZsOU9VUTZyMldHMWlxSWIxR2dDOUtiUUJJ?=
 =?utf-8?B?OS9ZR0ttdjBFM1phemIrbjZhWnRhcGlubkJIekVaZ0wvWmxrWWhvaktuSWZN?=
 =?utf-8?B?dmtiUGd4RkRxdHZhM2ZpRWI4b1pyeVJWMlhFT1A5bDEweFMyQ2hlWTY2Rk9u?=
 =?utf-8?B?ampVQ0NOYWhXcVU1dm53ZEQ0NzJJanZZR3RvcmVzZmpZV1c4QkR2cEVZdlEx?=
 =?utf-8?B?YllZNGZqL2tOL2Jzck9uOC83bnRDNFFGRk9qN3FiMWFnc1FDajFCcTlmRlhY?=
 =?utf-8?B?WWREakVVQVhLZU1XckM1UjVnUXl2cW1UWDV3WnoyWTF1TlFyOTRYQVNwQm1J?=
 =?utf-8?B?Q25PeDNJR3pMa213QUNqb3VVSG90Wm9wMkFGbEVQOXJiMVBvbGlycWw0aktZ?=
 =?utf-8?B?dWNjRmpYVHMyZUdVeFhwRlR2aHdUejUyL1FQZzJPTGFGVlE2MGRpWUphZzhh?=
 =?utf-8?B?WFpBUks1U3hrendMcXVJbndwK2xWTHI1RllRZ2p4UnRaK1FQYmsvT2lYMDhT?=
 =?utf-8?B?ZG4wSzBrbkQzVHJLcjB0TXladitUQWJNemZCajdOMlBRNVQ1aXpSRE5FZVBB?=
 =?utf-8?B?K3NoMG1FMVZyVXV0a3l4bEM3ZldJZ3o0aVRqbURQbm0xUk1SLzFZL1RnWTNS?=
 =?utf-8?B?OEFONG9VRytzTUdYMk1zaXlJV01Sdno1QUhzbEpEOEZ2UGhKZU5EMzROZGZW?=
 =?utf-8?B?TmxmL20yMU50clVWdVlOc1QrYnoxZittK0l6ZHN6em9lalN3OHdpK2dSKzc4?=
 =?utf-8?B?K1IvTXowMEgzWWVQaUt3WnJDL0tnbzAvQlJuSVFiUHNYQkJpY2Flc1BBTVox?=
 =?utf-8?B?WUdZQ2NQOFNRaVBJU2Vma044dXBqMFhsdmEydTlsVDFUellKa2JjOUdtTFdH?=
 =?utf-8?B?ZWJXamx4aUhsbFVmam5CUjN3bkE3SS91NzgxdXprSHlXek52alRxU1VQNGFC?=
 =?utf-8?B?QkJUd2liV3UvQ2VmU0ExT1FpQTlVMW4rdzlIMFA5amJEeDd3dFBiOEtjRndT?=
 =?utf-8?B?dzRPZDl0NC84eDg2SUE2ZUlzbEsrS2RiSldFNnhQV1M1TlBUb3FZZHNqZVFl?=
 =?utf-8?B?Zkl6SS9TU2laMWVxVkgwaWtDb0s0bTZUVkhKUHV1anA5TEEvQmIweklYVStu?=
 =?utf-8?B?a2hCcTVFbU0vS3QyKzQ4TE56RGVuMUZMNGhFeFN0d0Y1NzRDcUg1a1RRZUdX?=
 =?utf-8?B?RmgySzl5M2J5UWFJRmRNaWVrTmNuRDB0THI3RkV5UkFmK2FBRGExQXVPZmZS?=
 =?utf-8?B?RktOU1FHUEowRUpqTlQ1VTc3ZFhRcEc2ci9KeHUwN2k5WUtNdDd0UnJYY0py?=
 =?utf-8?B?RTBPd2lVOUU5MUtjUGljczBHNDBWRG1LU1UySHN5K1Q2Z05TeVpsOFl0dlBJ?=
 =?utf-8?B?aW9CbWZYM2tHYWVHY0kyVW5LOFBOZm4wSiswWUQ3bjdzOUxJL3l2emVaUi9U?=
 =?utf-8?B?U0V6VWJJbUJMbm54ZVJOL0JlWkI3MGt3Q0pmdWU1TGZka3VaWHUxYURFQitM?=
 =?utf-8?B?eG5ibDFheUkxcnUraXo2blNZemhLZmJrbTc2QUhYWGNKemZ5NWNDRjdNS3Bk?=
 =?utf-8?B?dEo3VGV4ajRaTjh3bHFYRTVrWndZZmxNL0Vlcy9WclN4UFNBVjNIS0pDK3RB?=
 =?utf-8?B?Ly9tVGVCWFhyQjFJVzFQSExjQzZBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8fa719-bd4d-4d10-e146-08de130fe566
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:13:33.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fZZE5Ygc97TED+N2mxvIILXI+rlqopZfSWv7l9UShnSisTlf262p3itv8Y0hAro1t4gFbXIDLUKdgZ+RxfKDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394


On 01/10/2025 16:36, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
>   1 file changed, 334 insertions(+), 165 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 038809264526..1e26d67cbd30 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c

...

> +static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
> +	.cnfg = 0x0c00 + (0x000 << 2),
> +	.status = 0x0c00 + (0x01c << 2),
> +	.sl_cnfg = 0x0c00 + (0x020 << 2),
> +	.sl_addr1 = 0x0c00 + (0x02c << 2),
> +	.sl_addr2 = 0x0c00 + (0x030 << 2),
> +	.tlow_sext = 0x0c00 + (0x034 << 2),
> +	.tx_fifo = 0x0c00 + (0x050 << 2),
> +	.rx_fifo = 0x0c00 + (0x054 << 2),
> +	.packet_transfer_status = 0x0c00 + (0x058 << 2),
> +	.fifo_control = 0x0c00 + (0x05c << 2),
> +	.fifo_status = 0x0c00 + (0x060 << 2),
> +	.int_mask = 0x0c00 + (0x064 << 2),
> +	.int_status = 0x0c00 + (0x068 << 2),
> +	.clk_divisor = 0x0c00 + (0x06c << 2),
> +	.bus_clear_cnfg = 0x0c00 + (0x084 << 2),
> +	.bus_clear_status = 0x0c00 + (0x088 << 2),
> +	.config_load = 0x0c00 + (0x08c << 2),
> +	.clken_override = 0x0c00 + (0x090 << 2),
> +	.interface_timing_0 = 0x0c00 + (0x094 << 2),
> +	.interface_timing_1 = 0x0c00 + (0x098 << 2),
> +	.hs_interface_timing_0 = 0x0c00 + (0x09c << 2),
> +	.hs_interface_timing_1 = 0x0c00 + (0x0a0 << 2),
> +	.master_reset_cntrl = 0x0c00 + (0x0a8 << 2),
> +	.mst_fifo_control = 0x0c00 + (0x0b4 << 2),
> +	.mst_fifo_status = 0x0c00 + (0x0b8 << 2),
> +	.sw_mutex = 0x0c00 + (0x0ec << 2),

Why do we define all the above with '<< 2'? Seems odd.

Jon

-- 
nvpublic


