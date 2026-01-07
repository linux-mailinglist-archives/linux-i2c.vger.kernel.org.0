Return-Path: <linux-i2c+bounces-14955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30473CFD0DD
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 11:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC8CF3005F01
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 10:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B346D30AD0A;
	Wed,  7 Jan 2026 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVv6kspq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF038309F0E;
	Wed,  7 Jan 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778659; cv=fail; b=FS0VNE4CS5Zv195ViudMOoG/tncCvb5B/IoIpYRwl6NDTc4wnHR8wh+x4GiScXge7q99WeqSTvh/qc4U3WNIKAra6gxPP+f+DcpyEjva22oUybOSOclFHoyi0hMDefIAbjA0vWtUxTvxLKvDmu4a9H4+KamgCRJkI0NLF4QZGWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778659; c=relaxed/simple;
	bh=mnMiEHi6A4Cfit240lNHGHeTRu+JXbgUC0yw546OrAE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TuEWsOCMKts9+o8PCnPm6sKokxXQl0VHiVHUYHDwDRjdiErvCQYthOmVABlsbYWidd310yCCXQpK8x/DjaXb88Y8vfKpuihlqpcu3Wp7dL4U1qlN1xJvnRWt+iEpRznrh6aRx4bGLRqMlie6J13y18qaf/QeE7VSqarFWvDnujY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVv6kspq; arc=fail smtp.client-ip=40.107.200.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr7i2xGSHRbUwdNHTV/j3l4iVZc0aQ0FfHco8Pm0IfPm1RAXx6T8D9pEnQHjLj55orheab7Z7VKPOy2pcLS1qz8JZUe24ZI0bB2ChXzVsevGZCFHr3wQFRO9F1Noq9C3Yujl+QH4mwJWwPts1mQxAxUKt7blWJrN8w9GZaigzxI2W/y3B1lygoMcEGU5pXkDIT8LIxAw3hYQIihD2mVTmQfBNdlju7VUQTl29jS5+hCH+z4d8RkvkW7BUHYZoqNJrbCDq9rXLmzJuH4FKvOrdhwc2h0+9nZ95JepJdj0wD09fVCFuQcFekdwDXv/88javOQdB4OgoarGrKiwsQNBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVoD0SIRrQTqUDEzQzO5SYLRZ9XGky/cIy77OI4Ts+Y=;
 b=I0/9yvNTOUxkyDMeWz0HkhYmcMayxUoZZyN8cgpNPw3Nqb2s1m0pwrxC4yCxYZVHSzv1bUfecJkGHJ14YMHqI/WK+jzexfquPgX+PvMEJvE2p8ZxomMyq6CEBaOtKaoL4uDB2A5smwvh5Wrn3g4x5qjymsrVaR0hoKL1dyFePcPjO6iIwGEnu/jUppvOzKk7oOjSX3JA8an6vgLFczVAilyKrKp3SQcIuC1AiGiWS7OIQHozd10Ov2nujeFSrRGKOpPYb/rgYm6SfvP0Nvy7VaVAWCGGg/kp2VCzbHAOvtfbOs6SzfrW1EjgiEEXTH6r5n0CRzvwcBvGzTuiIOXXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVoD0SIRrQTqUDEzQzO5SYLRZ9XGky/cIy77OI4Ts+Y=;
 b=bVv6kspq3q05YQKYI3b2t3hOqqouaLqKtVPvaJxF5ZUjYUth4P0MCuOlHfCe7Nj+XGsRIE/V6Wfq9XPEqJo5VioRa6Juyn8M4o9HVgxcsFo7Hzr8Yl2qMka3yc7BgDmr+Is1re4K26CFSz9FxZRIuuivcVbImR2gD9/T3t96vjIK1mVcASbtIn3FyKSc+j1mEZHoszWX4nbjY0R8QyPlycgcBac/uHMQ8aFZpSea1pY+ehagiQyw4yFa0bc1EVAE16eHaFGwP48Hc6z0TXkuNgszV8TxEgvS94gvK6c7ufm0xa+JFJkwRXMSq1qYwz9uxMgQ0ev8aaRbb1gUIjVDSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:37:33 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:37:33 +0000
Message-ID: <ee422fec-d9a4-4c0d-9c42-433f06104ac0@nvidia.com>
Date: Wed, 7 Jan 2026 09:37:28 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107042434.10587-1-kkartik@nvidia.com>
 <20260107042434.10587-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260107042434.10587-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aacb076-6415-421b-6522-08de4dd0623c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Umh4dDJvcERnS09BbTJqblhQdDFFVnhWMFlzYWI0TjFGYmFVUU9WclViMzZS?=
 =?utf-8?B?VytoUFRHS0hRUFRoRHNvZUhCYi80QkpqMHRIUnJlZXBycVZHdkpUeHVsL2VG?=
 =?utf-8?B?cU5pNm1DTjh3VU43Q1p6cFJrOGlOWlNHUDFzQ2xNdGo2WWh1MVJUWjF0ZmI4?=
 =?utf-8?B?cHEvMmlNOCtFS2FXbmhHcUZxcFJaOENHYUQ1RTlkRlJQN25LelozM2ljdURZ?=
 =?utf-8?B?WUk0ZDdOY0N3N2liR01FWGhHWDRhOGh6VzZQUlg1Sk5tc2JUM1BKazlROU93?=
 =?utf-8?B?VWV6OVM5TVJpSnk5VHJxYmZmKzc1eEhuc09vczF6Si8xdDJJWW51QnlaaTZt?=
 =?utf-8?B?bm53ZzF3K2NxdVhmSmNIL3MrTHRDNi9EQ3FoUEU2WTlaclR3N21sV1c0QVhP?=
 =?utf-8?B?S1RZcFRQOE1vbXRnMGpZVmtoRjBBQWEvbEd1akN5QzBqVFRhemFFYVd6NnZ2?=
 =?utf-8?B?eUZieXR0MlpWQm9takErY1VYc2NDTy9kZjRqSUZmVHYvb3JleWc4LzdGb2Fv?=
 =?utf-8?B?TVZXWnl3dUhtUGFLa2xLWUtwYVZzMUVPZFZnSzUwYm1MWEpNYXkxaEpNYk5N?=
 =?utf-8?B?VG5LTVo5clpsVzhvWmNuUVZGeFd6ZlhjUTNOSlVXdVFwWm45bVo5cFlWbXA4?=
 =?utf-8?B?ekU1blRPWlFkMEF5dXpIM3pHKys5TUNyTjJyTTdaODgwd0ZiNHVSTWlVRS9u?=
 =?utf-8?B?VE1UVnB1bWRUMTAyZElSMlZkR0hvQU1KZzZ5N3AxdU9qZXo2UFd3ZitaY0to?=
 =?utf-8?B?U2wrYjBacXMzT3lFRmxRU3g1RTJsQ1d5VERwTXRib1F5MnhZdUtteitwR29C?=
 =?utf-8?B?OEVYOFZDN0t6U0NNbk5SejFXYzYrb1Q4Y2tWQW5mVjNpQmRqcU54cjBQRkpI?=
 =?utf-8?B?SUZ2c3VBWVN0VVdNUkhGMGhJanNuTWVVNFcrTWxiZCtVNTAwQnA0RTFxd2p2?=
 =?utf-8?B?dEpFOGFEcjk3a0xYR1psRTcvTGFpRUcyNHNiOG9LRkk5SnFRVkN0RnRPNjRS?=
 =?utf-8?B?amc5Mjh6cFdqaytBb1JvamRZbnRzeTZXV0JwM1NLM3RDVC9Yc2xoV1E1SGxp?=
 =?utf-8?B?YmxUZW9EbXJkVlFad3ZkU3hEWkFuSHBpbmJGaHRONW8yZS92TVl5dVk4YS9R?=
 =?utf-8?B?VjB1ZDYvREMzc2pRZXdqQmJqRWhzNkNyS3pLaGZjaS9teHBFV2YyQUMveXp3?=
 =?utf-8?B?YTFRZjlWMnhUeGpuV1ZqZmNJU2EwQ0N4Rms0NjdEMndVN2sxTWloNjZzSXI4?=
 =?utf-8?B?SmQ3OHdPWnhvMys4NEhCL0JvN1pHdVlZeEZZN2lodjhwd0dFbVdNN2JOSGZW?=
 =?utf-8?B?cFEvWGhvaDlQalNLUFNhU3Z3TkZ4bFF6RVE4UXFiUzB0VjlWcllsMk01Q2hm?=
 =?utf-8?B?bGZ3MUo2bVQxTE5TOTV2QnFtSzdLQ0wwK0IyZ3hsSG5oazl1dXUrYnBVUTRa?=
 =?utf-8?B?S3hQOHordmFzVlk0bExDQ2ZudHh5bHNKZVFkUThrdTNHcGU4TVdxTm5yZzhN?=
 =?utf-8?B?bGF4MENiYXNiRGdrVHl3NGU3MXBqcVJnZnBHbXZqeGltZmdidG9JUnVpcHFp?=
 =?utf-8?B?Z2w5c3ZWREQ4MnBZaTNuQWkxU1Nka0lxdDE2bG9sN3ZyUHpGb0xIWGdEZnh0?=
 =?utf-8?B?UDFuU2k4ZVM2TmFPMSt6V1pqdXpCRFkxcDVxRGZwK09WK0V3cDBLSElud3Qv?=
 =?utf-8?B?SEpPU0J0dnVYaFpCZGROTG40dzdKT2ZvbGF6WnY5V2ZOcnFycUswQi9WeTlo?=
 =?utf-8?B?QkVocVdMOUZQVWZYZTJzcDNRUFpTNjE2RnpwNURhSnhiUnZ0WGFhUzZ5a28z?=
 =?utf-8?B?aXRESk5heTRBcWNIMWlzWUZEZW1mUWFGL3NZN29ZS1lpSTFTdWc0SDFMWlJr?=
 =?utf-8?B?dDFHWXFBdVJIbjkzREc5M1cvSlErYmZsYnFVNVNBK0lnc0dreXVkSDZYU2p0?=
 =?utf-8?B?SjV1bWdUQjNCdzdqK1dyTFhOUXpIKzVuck1Ta0g2VWYrQVNwcHViVnFjc2FM?=
 =?utf-8?B?NzU1QitydXlnSDExSzhrUzByM0RSOGhJZjRwK2w4TmhOYmpHbkNsT1VETjA3?=
 =?utf-8?Q?MqPjR/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXNqcTl1K2xVR3M5THZINHhrV1JIdGxrYTFocWNCK0JQLzNoL1hOVEZNTVpn?=
 =?utf-8?B?Sk9xejVzVzFyWE9uSkRQUDlhUDJYcTd2eWJVSFpiMEdjRm1xYXpSVUhIRFhN?=
 =?utf-8?B?aEtVWC9jKzBrTnRoMVZJRitVV2RNTUtwMG9uQ2xQQ2lCd2hOSGNvYUlheDFm?=
 =?utf-8?B?WjZmMEExNytwZE9Jc0p5elBZTmlIdlRReUxrUnNVTWpHWXhITUc5S1QyREN6?=
 =?utf-8?B?YTJ1d0lNajNYQU9OMzB5RC80SVFmSnpjN3RrZ0pUUDhzb3FzamdyRitLUUpX?=
 =?utf-8?B?UkV4eEJ6aXJwZ05VWnBZMEtHRlAzd3puZU9sZThwR0hDWU5qYmh0QmhPVVQ2?=
 =?utf-8?B?L1ZaTlovSGc5RmtUOEhqSlhlUnBNTVMxcXZmSkVDZzV0V2xDMkJCbTZYMDhl?=
 =?utf-8?B?OTZQNE12K3FJWWU5WUg5TC9UK2l0SmhDMU5pQjYvZVB3Sk1lK2Zjc3FBT25J?=
 =?utf-8?B?S0U2dzczc3FMRWcxL2xCSXZRblZCWGFmNGVrZko1anJXNzgvK0JuRzAzK1g5?=
 =?utf-8?B?cVkvbU1vZlBRbHNVVWRReVp3a0RvbnJETmlONXRabTMwaTRiWEthclRWajJu?=
 =?utf-8?B?dmM3eDJLOWVhSG1qOXE1Q29nbUJGaHl5RUxhSjBmNFUrN1M5eFVCTXhYODV2?=
 =?utf-8?B?Yzh6aERaWlhVUnBYT3Q4QWsyRXdOQ29YcFE5YWtCQjBtZWlvREVOVE9xclNL?=
 =?utf-8?B?eHJlOVB3cUlwT2xjUWY1Z3VueWo4YXptL2o4Vit5Tmx0V1dEUE4xaXRxblhs?=
 =?utf-8?B?OWhVNEYvUVZjNDd0Y3JSd0EzRXYrbUZOckpWckdZT0w0NTBWdExOaVB6UGdM?=
 =?utf-8?B?U0hRUGk4Tnp2eVRVcG5seFhOanJUK1ZpUlhiOWgvTUF1cTRpNEJla3h1Zm9o?=
 =?utf-8?B?TFMvOXYrRUJXaDFFN1N2alIrNFhTdm80S1lrdnNUMGF3Z2tHKyttblJTTHBq?=
 =?utf-8?B?UFNHa0wzc0gxS0tGa3VOUGIxZEhseWIvbHlSVjJqa3Y3U3ZKRktkL1RhOE1l?=
 =?utf-8?B?UU1Mc2M5aXJzTVF1MG5JeHowMVg2d1BPOWx3Yzk3aFJHQnBubk5ac1MrR3VS?=
 =?utf-8?B?OVVQdWRnSy9QSTErUm5aL01IWWVqTTlIQmdmeWRZZW5ZUWdCcENRTEVzdUNW?=
 =?utf-8?B?eE9WbFphK0VHN2VzUE1LK2Rvb1VwVC8zZFd4RWRESFFvdVZwOWtTTlVOM3RO?=
 =?utf-8?B?SmtQY2w0UjNYOXgwaFVjQVpqcWRZckdtd1pEZHdlK1UwZENJVFhPOVhvNXp5?=
 =?utf-8?B?Mmd5MVlQQlRTZzF5d1JMY1JRMWlpc2gxZmd3ZDFEMzJjOFg5QkVoTHcyUUI1?=
 =?utf-8?B?SEc4dXYvS0NmR2ZzbWl1MndHYVhyMTVHVFVhUmNqMndibEM5NzBOdE1pRWMx?=
 =?utf-8?B?SE5oTWxpb2wyM0swbGx0VWJuOWd5aEp2emsvSXlrYnp4RHJKcnozUGtvZk5t?=
 =?utf-8?B?ZVdDWU10b2FOcG1VcWViTlY1MUdXME9Zc0ZjcEZvc3RRcXVCcmVENnYxZDZB?=
 =?utf-8?B?Nml0aEFWSjNOUHdBZXROdmhRNWJaQ0h5dFZlQ200dHh2Y1ovVkVUQTd6NUFz?=
 =?utf-8?B?Zlp4V0crWjNhVEkxZ2ZDdzVuT1ZmdUU0NnlmcWdOTXRDVUh2S21OOHJPN1o5?=
 =?utf-8?B?VVVFbWNNUlI4elpvSXljc3BTL2tuK3J0TXd4cDE1dFdmM25uL0U0S0hDUUR0?=
 =?utf-8?B?UUJnTlU3b0dUUFZtdGxnMGIzeEtXTWNaejc1VU1Va3JoY3V2SFdkTG9TZHds?=
 =?utf-8?B?R1dycnkrSkk5ZGVoN1p1M21tQXJUbWh6UzdQZTVGbnU5U3pyZE9CRTJMRHpC?=
 =?utf-8?B?d29RRk9CeFR3RzZWQ3FHN21RZmtEUDFrMXloOFBaVndIdG1XRXpKZytFYWcw?=
 =?utf-8?B?czlCeWdHNU1EN3hEeXZZcUprcmhkZDV3aUx0SUNucTBLdU9SM0EvUGpxZFQ4?=
 =?utf-8?B?aUswUWtXUDNMSXg3c1Z5dlBQZHdVL3pMUk9UT0E2bXVEYXljTjMyUWdtcUJi?=
 =?utf-8?B?WFhqL1NrODlaV2pqaEdMSmFRRDhVcFQ5RmVaK0pEcHA3Zk4wRGtmVTdzOFA4?=
 =?utf-8?B?OTM1VStNd2QzZ2FhWnVTMUxsNnEwOS9ubWZiMm5TYklBMzh0RHBJL2RaUnNX?=
 =?utf-8?B?cXNIMFRvNmM1ak5xU0ROSDZyMWUyb01CVGpvYVNhSCtNNnhaaVhySnkvZG4w?=
 =?utf-8?B?ZHZVdzZRdUVZc3haaVVMUTBnR3Q5aHY0QlRCbjE5RGY2S3Radyt4T1VWV3ZG?=
 =?utf-8?B?dGpRWERIME5ySTIzMVlVT0pOemp5RnRHZlo4YmVYdWM0Mmw5c08rb04xeERM?=
 =?utf-8?B?NFFlb0p5bjZ6Uk5vVTdFQmkxd3lPNFBDSGxhaWNIZVU0dVQ3b0lDY0pDVkhU?=
 =?utf-8?Q?3kkFMMhI/k//wbRfjC2iNo3YNyZg4qOBdgiEC9OwmX3OG?=
X-MS-Exchange-AntiSpam-MessageData-1: 8YnxMgqj/YgqIg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aacb076-6415-421b-6522-08de4dd0623c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:37:33.2766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkbYybXoMJKYOVTFvKxw2Ah0UvTUCVWO/PS0daurHJ2zdFYaP0Q7xjZaickGa7ZaWBLrUW2cebyrCGL7KqRH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729



On 07/01/2026 04:24, Kartik Rajput wrote:
> Move the variant field into tegra_i2c_hw_feature and populate it for all
> SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
> "nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
> from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
> the redundant config checks from IS_VI and IS_DVC macros.

Thanks for updating, but now you need to drop the last line in the 
commit message because this is no longer relevant.

Jon

-- 
nvpublic


