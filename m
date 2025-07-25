Return-Path: <linux-i2c+bounces-12037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A40B11ABC
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 11:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 783177AB1EB
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 09:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050F52D0C75;
	Fri, 25 Jul 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AND7/Vbv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD977081C;
	Fri, 25 Jul 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435230; cv=fail; b=an0fMbn68iOiEGfCACY5UpH3YUdMVjwP6Ok8dbFIH+8DV7Fkej9nv8SQ3Dh9lJk7GpO2KsDQLG5K1Yql6NLGdqvud63AwVvTvnvzdXQxy+tGg2J/y7IM3tZyxVuhCD1/VOPBIRYqqgORNiABcrXckYbcQMCUkLd0nk6nY2H7fIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435230; c=relaxed/simple;
	bh=tI22pI33/0CtkCfkpLDG1zAXI6iaS5gywsjJ+90d/Uc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BPxDB07JLMxdYq8rIZB5u5Bfe/I4FVMpgaI1w9SnuRgPDhtDlEkqu+TDG4BsiVwNo/opOmgtS4Soega2TmZul0PsyVuKHXv15o4EHlNDNmo8rWFGbGqGpjbxAXHOoJcav76TH9MfsTGyjkEIdp1UlxgaKpIqz9FfSUmaPfWMUCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AND7/Vbv; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6RpNAWPwD6sYa79MpkjLDcF2cvyRhwBLEqE26dSD0o/K0aNk8yrdtvyvZx0OJNGijuSfz1nIG/NdW/jCtucmABefoXHLIfo4L/HU6heWQ47bxHjX7/jaY8mlVlwqoxV0BTAsnLBA6JURxv/E9w+1LMqt3XjE36P1ttHxhdRTMj0o77WGNYmVdY3xYs7c+VSbg96ICPfPyW+pYq7Xlm0EHLVAUmZz6i6AcjpbBpttXCTKj7v+xh8ESwVct8Ivupq8qO5nhSXLb24Ko/PsEs7TLKyLHj6zFD/yLgw7UEOh6yfvYYzKj537QlQmIF1mdnPN5meSeg5uAJoum9xhgpE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsHqYhR2HKc83uKbpk+SU2Xl/sjA+2uoBQ/5jdh668c=;
 b=UtZ5eXMMZQ0mklNbkDgan9Lxw18C7BTpNzw04CYxNS/8/+sa2jssXFn+tAUwYAe4cHp3qtK9yKveXC7Ldn7rZkJCwlilk2eb+iV2ajQtQ6TLWuMBNxYP6kQUKom3TLrcQyyV22Lh+OGd/Nucg6/BRqDwcBv0obAWzBJp95l3GSg2qrxLoDlG412bEl8tHnowKa1nL4+2BH2uR3htvHlCBiIC+UKDNeXAAFs/eJVuwkkRa2V4S1b5bx42B3OQm1vPOp2p8aUW9YgodD3vltRA5JxSfv3ritB09s5NurOI0ddJHeq48p67tzLp1Y224sToBUukwwd+AICfhfnbRAab6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsHqYhR2HKc83uKbpk+SU2Xl/sjA+2uoBQ/5jdh668c=;
 b=AND7/Vbv4oiAdmAx20jJW7eFAWBuKabjop8jbD8rT7iWto30pf2tfkap7G6SY2+pkOwLzWoceXoyJVh58ZE9QcqeR+RWH//O6ntSXwHfqFfSRwe9OUJS1xBL5DO3e1sr0337my3xRiQNh07YBm6lfxVR/XTil1gd5Y/ltFzVl3VEJUoe2hcRc4Avw93dKhfyv34ZdJ5ozNDYGh15g+LxX1aOTyAUCiC7ma33JJYf4u399zVTQozQJ4w1KIvW31ynyi79LhANh10s+DoZD5AiiBcsYz805qtqg7arZ7PGsMJ8/Sck0bT6iU3/4wLrurG6+Xqok73l+Cx4VLq9Hh6Bvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 09:20:26 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 09:20:26 +0000
Message-ID: <1a35d247-80cb-4b17-850f-1d3dba0e6021@nvidia.com>
Date: Fri, 25 Jul 2025 10:20:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] dt-binding: i2c: nvidia,tegra20-i2c: Add
 register-setting support
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Rajesh Gumasta <rgumasta@nvidia.com>
Cc: linux-tegra@vger.kernel.org, nm@ti.com, andersson@kernel.org,
 krzk+dt@kernel.org, linux-mmc@vger.kernel.org, kyarlagadda@nvidia.com,
 thierry.reding@gmail.com, linux-i2c@vger.kernel.org, sjg@chromium.org,
 andi.shyti@kernel.org, conor+dt@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-3-rgumasta@nvidia.com>
 <175342923470.141295.13172940562486185515.robh@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <175342923470.141295.13172940562486185515.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d60ab8-df50-45a9-231b-08ddcb5c7d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVRQY3Y5dzZaSk9KcDIwck9VU1pNck1SMzA4L1MxWjdEa2dlcjNOS0VaOTFk?=
 =?utf-8?B?U0ZFOUU5WEFXTGlZQ3ZJLzQwSG56cldHaXZocGRLaFBFcmhoaVUzNHNuSVFW?=
 =?utf-8?B?bE5PMkdDd3lzK0ZlZVJDY0tSU0k3bGJiUXRSUkNNamMxb2FSWXJ3aGRiZXV6?=
 =?utf-8?B?dEE2akI5dkc0c3dEK0xHQVpQVEtVQ1JaWmwray93QmlFaXBxZkhHeWx0Z1Ja?=
 =?utf-8?B?b0ZwbGhJOXJnSHZxNSs0VDZSalhtQ3RISDRHWWNja052TEVRbEYzZ0RXSCtv?=
 =?utf-8?B?dXAxTlM0dXVmZEpuOVkyRGQvUFVQRVVkbmt5OWFTSDMvWlFUQUpxN0pCYWp0?=
 =?utf-8?B?Uy9sb3hvc1lHcUY0SEtIUFM1QXJMMTZXN2dlVW1qWUNCRTZHNmxibFBaRldH?=
 =?utf-8?B?UmlaL2hOMVZTSkhoZ1pHMGJyaVBnYkQvaG1HUGNmZlhlN1BnNkY5dTRzR3Bt?=
 =?utf-8?B?ZXU3WUhMOFdpOERabnRSMS9rR0wzcUZJVWNmdHViL3YweS82MWZockZnWU5T?=
 =?utf-8?B?amhpMTlaTWxKdHkyUkV5OGIvTTd3NTlsdTRhUW93V2RwSzUzMmFHUUp4bFUz?=
 =?utf-8?B?VGF6SWhqcFpic3BjanVYUnd2d2h2eHJ3aHQ4M3VWMnJuUjdXUndZT1l2TFl1?=
 =?utf-8?B?R1k3ZnF3SGEwcmxCRkFOWXV3ZmdNdEFJUU5KU2E0dXY2QmorMmwwc2F5cVNm?=
 =?utf-8?B?ODVXKy82Mm56ejQxR3ZteXpWR3h1RVRBN2RwdWR5UU1KYkxsNFhlYXNHMk5W?=
 =?utf-8?B?RUZCc1o2M1RlbEVGaENsRHN5NzI5cGhRanM0UkRROG5NVEtaS0JpSkVvNnhK?=
 =?utf-8?B?ejdibWhKNUFudlRTeWRHdWdVSlFyM016eHZpckhxTFFoK3ZiUVRGQnV2cnVX?=
 =?utf-8?B?NXV1K3FFaXBTckIrVUhOYlZpbDU0bVBqS1JKaEJMdDV3S2syRVgzMkFWdzFn?=
 =?utf-8?B?UHppdk55SkhjRjhVNno2SWh0LzhvdVg5eEZxdVhEMUU1bm82REZoMUtDZWtn?=
 =?utf-8?B?TUN0SU5LV21zUG0xb2lsUkxaNU90aVJBMVhmSDFxYm5DQzYyaWJrdWJzSEMz?=
 =?utf-8?B?Y2xrR0RKNXQ0Wmg3Rk0vdHBPakR3K3pTT21yUDZnQW9HOG5VczJIOWV4ZlFB?=
 =?utf-8?B?TFRuVFM1QWRwZzVNeS9CT29vbER0Q0NYYS9YcEZCT2ZNR3hwaXd2UHB4VnlI?=
 =?utf-8?B?aGZMSjBRSW5DdWlrNTgxcWh6K0svMDQrSk1RSis1WmlZOFIrODY5K1RmY1VJ?=
 =?utf-8?B?WGE1NlVackVCZ1hVcDlpZ2tEdGoxOHlnYmY3R29nMDFJOTV2RkNNaUE0QXc5?=
 =?utf-8?B?RGtXOUZsTktSd3M0eXBUZ1l0Z0x1Q29ic0FkaVoybHBwdDZ6aG4veUFJYzNa?=
 =?utf-8?B?TjlNZHNyclo0eDk3b1VONFI0UjMzU01nYlNXYW5KSTBoY3RuMGxUN3lGM1pN?=
 =?utf-8?B?TjBnWVhwUUpvR2dhRjkxNlJOS0I4ekU2dW4xa1FTSUc4Q0RtQlQvR0g4S2FH?=
 =?utf-8?B?U05TOVN0eU9jVVE2YVhxS3c5N1hEa0QveHZjQ0tTeDROYURhR1Mvbmhpd1hm?=
 =?utf-8?B?ZGlvaUREL05SU0VBWld3R3FhcEpic2hHNFMyWTE3a2dOOTMrSWs4ZndLOFNk?=
 =?utf-8?B?OVBiUkxzY0cyRzhxblFaVzIrOU1Xc0l3YVYzSWVkUU5iYklKMkQ1VmQxRDdZ?=
 =?utf-8?B?ZytJK0Y0TkhRd2JuTWtEWGVUZlkwNVFhMk9ENmptdkZSenpKQlVqQnJqMkhG?=
 =?utf-8?B?REU2b1VRMmY2NDZGZ2JjQ2RCdU8vaEgyY0t2dyt4ZGFxTGp4eUxJekZGa1pW?=
 =?utf-8?B?SXd3N2VDa2JCYi9tTTlocWprK1cySW5nd2w2cUtGNEk2V290a01aT0tsSjJQ?=
 =?utf-8?B?Y0lhOWdiTDBnVnRrTklaMWxDSXhRQmFodk5pK0hvTFRSMkMzWW5lNDU2T3d1?=
 =?utf-8?Q?BuD+fzB5V+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFFLZTM0cUxoMytHTkRRWEorNFZNa2E3L3FPMkRjdk1TYzNoaUhyZCt4WWdp?=
 =?utf-8?B?ZGIxZDl1eDFNOU1NN1IvN090NEhwdWJEa1N6Z1dZTTA3blp3d1dVUmhCNzdL?=
 =?utf-8?B?N0g3SlhJRkN5OXpTVXJlQnVibTY2OXBWc3VxdkNDNFc2d2szb0RtNmhqNHBh?=
 =?utf-8?B?NjdweG8yb1YvdW9naytCRXZNZmZFaHFyQVM2UDdxcVJob252NnRScktOUFIw?=
 =?utf-8?B?SmsvSTJiVHk4c0xlSm5QeGl1aWQzcmt4NHFVejRvUHQ3emRJRFlXRzhtMkZQ?=
 =?utf-8?B?RWNtU05hdzBmMEdZUk5DaDhQU24zV1d4VHNrWXlxYStJN3A4QlZUU2pFT2ov?=
 =?utf-8?B?NjRCT3RseXBNZVJRN3FsbkFpVWE2MVdxNlpEQzgxT2xTTDFENmROa0RaQ09q?=
 =?utf-8?B?bVM4ZVZYUklQMDNVRUo2cGF4MXIyZndYQktRQzh5azdMSU4xVGpPb1hRTjNH?=
 =?utf-8?B?NDdSZlJvc1BIaHZhSmd1cll6YUVsdnJCTmE5aVNUK3NoMFlubXFFM0J3Rmdm?=
 =?utf-8?B?NmVLREx4UXVEelRGNzVwY0NNbTJVZ1FzRlpxQkFxU1dEOU0reUt1V1dBN2pZ?=
 =?utf-8?B?VllRNlYxcHFKbnN4UVJGZnZ3cmJIMW14L1hBUjVpZmRMdlYrOExFWWQ2WE5L?=
 =?utf-8?B?cWovdmgyaU9zZ3RCYU5KWTdpWHNSd29ZWTAva3pQcGtnT0U4bU9McHJlcHZT?=
 =?utf-8?B?eDFmV2tTRi9oVno1czVuVGhVVU9FMlRPMVdWT0RvbnA1SnBHN05KZXk1eHp1?=
 =?utf-8?B?V01FZGdUMW1uYzBSZVBVWnlibjBUeU1DRXFKTWl0RnZPTytrVW9wMjg0NXQy?=
 =?utf-8?B?UmpsaWJOdlRaK214VDBPa3lEUXJpVmJTQmJVcDNwenNYTHdjVSsvK2p1czVO?=
 =?utf-8?B?UGp6Yk50RXp2a01uWUNubm1CNnEvdjUwaEU3QWI3V3BaZmVTcmFpRVFVTUxB?=
 =?utf-8?B?djVmRzR3Vmc5R3BpWlJMa1FFdTNkamUrdmM0QVM0UEswcUc4N2I1S1dSenI5?=
 =?utf-8?B?Ty9BeTN5UVAranA4VjQ0a0svM1h3eHJ4dWcyUlhBdTNaUUlaNExyU29kTVBr?=
 =?utf-8?B?Y2U3ekVPUWphaUw0WEsxM2ZiZGV4dHh4bDRMUmZERVBraDFFbWZ4SmozR0g1?=
 =?utf-8?B?NHQzUngzbWQzbGhEL2hJWUNDM2VQUjRITG5jM1pPdThYWTgzU1FkbHMxRHgx?=
 =?utf-8?B?L3dXMkk2d2tGc2FqLysvZStZaGNnMDNXVlFNTWFRWFgxQ3F6UTFmQUV4cU15?=
 =?utf-8?B?RjVwM1RBUWdNanhYNVVPRU9CSXU4Slg4b0Y2by9pSXU5bFVCREliS2VUS2JS?=
 =?utf-8?B?dEt4R0dzbTJnc0lnakpPeDd0OWFiZXYwZ2JLWjl6ejU1YkRoYzMvOFcwRHBl?=
 =?utf-8?B?SjJsK1hjcWdkM1RMVzU0NUdqV21XdGpLY0tOMVRmZkVaUnZITHphK1gzYjZk?=
 =?utf-8?B?bnF1d1Qwb0U2b2NTVWhKS1NZSXBzRCszaVJ0TExackhjTXp0TzZZRTl2Nzhl?=
 =?utf-8?B?WEtmbXR5RDlJSVJHVU5nM3BhSmd2YUxEQytlb01jLzZpRWgzM3ZDMTloeG9O?=
 =?utf-8?B?ZzhtcnFJL1ArSlZjT3N1MnM1ZENnWS9jU0VJNVdhNUQ4eTVOUWVOaFc5c0R5?=
 =?utf-8?B?ZEFYQWZULzYvN2tWejltSHJBUER4UTB4WWgramtRa2VCTmlKbjhxcUdMenV5?=
 =?utf-8?B?UnZZVFpXcHpXcjFJZWE5Yk5FOHdIVHBjOVdCZEllREowQUF4WDhIVDVrK0tH?=
 =?utf-8?B?cmUxUmM5L0RKbnJsWG9EOWtQckd2L1I1VklCUlFMSHNiSndpSjQra3k1dEc2?=
 =?utf-8?B?Tm5GcmdFMGhzRG1wR0NBU0NjVmc4Q0pmY2tWWHJCakhZUmFNWkhlSHVsbmFF?=
 =?utf-8?B?ZTQ3Nk1kaVdwc3N2c1RsQ2pKcW9zVitUVHNFNGl4ZnYwd0IwbFFRUFRVNFk4?=
 =?utf-8?B?b3A5YTMxRnNjYncyZ0VIZ3RoV2E2N3hmRmFWdENPdTQvMy91bitiQW1BUHFX?=
 =?utf-8?B?YzUvdTI1UzRrbkpyc0hacWdqQ2FnK1dJeGJaSHpzdHQxMzRKd1ZTTzNLcS9L?=
 =?utf-8?B?NTVkN09YckN5MEdaNG5nRytVYlZrVHhPazVRZFNIa0YxS2ZKWHBVZXIzY2xx?=
 =?utf-8?B?U2lib1hsVVJJUXN6MUZkZ05zN2tKL0JKS0YxQWk5Q0J0SklnbStXdDQrdmUr?=
 =?utf-8?Q?IYViRjsYQNZBqMougNZ5iDH6nyUwbu/zAc/i37M5c4ji?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d60ab8-df50-45a9-231b-08ddcb5c7d9c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:20:26.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8QBI9yAtzWt3B4mZpWJdTx6Pp+HPj6T+1+FfH8+aNc9g2bdbkF84Wj+fDGxG1SXwpz5rSivIo2Xtqu9RwQJZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570


On 25/07/2025 08:40, Rob Herring (Arm) wrote:
> 
> On Fri, 25 Jul 2025 10:52:24 +0530, Rajesh Gumasta wrote:
>> Add register setting support for the NVIDIA Tegra20 I2C controllers. An
>> i2c-controller-common.yaml binding document has been added a top-level
>> binding document so that all I2C controllers can use this binding. This
>> new binding document defines some generic register setting properties
>> for I2C and some standard I2C operating modes that the register settings
>> need to be programmed for. This new binding document is used by the
>> NVIDIA Tegra20 I2C binding to enable the use of the 'reg-settings'
>> binding for this device.
>>
>> Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
>> ---
>>   .../bindings/i2c/i2c-controller-common.yaml   | 73 +++++++++++++++++++
>>   .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 64 +++++++++++++++-
>>   2 files changed, 134 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dts:24.22-73.11: Warning (i2c_bus_bridge): /example-0/i2c@7000c000: incorrect #address-cells for I2C bus
> Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dts:24.22-73.11: Warning (i2c_bus_bridge): /example-0/i2c@7000c000: incorrect #size-cells for I2C bus
> Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'


Per the cover letter this is expected and a fix for the DTC has
been sent here:

https://lore.kernel.org/linux-tegra/20250709142452.249492-1-jonathanh@nvidia.com/

Jon

-- 
nvpublic


