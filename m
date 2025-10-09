Return-Path: <linux-i2c+bounces-13432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF5FBC86FB
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 12:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0B43C6DA5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEF92D9482;
	Thu,  9 Oct 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KNYFwvdK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49558B67E;
	Thu,  9 Oct 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004973; cv=fail; b=oJyO32FHrcTYTkenXLgDH0Sg6ghRuJ1bJQcLThKvXmzz71SXtAOn+c0lmCzMaMLKm/5JzzCwaN1zp0z6oFZ/PR28+YUDYIEB2PRJCixMdPnNGl+IZhgxH8XMuX0zlJ9RQrSmxyeY4eDM4J0MLJOlJPqOKmWM671Xj4OmVxrLEYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004973; c=relaxed/simple;
	bh=UpCWJ6v46SRW+Rzd18kvGe4ucZtsOPj1YnMHnB15Xiw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e4ZMOSxqYLmimyGgCYEb1GySx3nLAiui7ezIJShJGOORJRxy4IYxe7NGpcy9gmzyM/OSMtPfPLDxJnB4GZqHvFzeNOxJDELgjM+PN+j+whIvatRRpPJHB2HxejaLm+v8z7IRKmpOYIGPd3dcQcMZiewnjLJwgCOtfncqGWkaUgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KNYFwvdK; arc=fail smtp.client-ip=52.101.193.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9hlUtRYeyy5BqEEdWTZj3fovn2dOIUf5NGeZsW5aB71l5w7BtoAQ/gXSZpdlObtj2nNdbpiYS4qLsfTf6YMLaXbW6Sz7ABxh2jwxW7p6JWHffms/qMIxyjx39RKDg0bP8wH6jSVv9xamsyw3GrM9DRBazwKre2vyLyxbW/orolABl1U1xeF+Cai+2BpoWCUMMQPNeekdWei/8IB0iPLAAKXHF6rttABTsHCH6Grud6QMYJsMZGL+d4yrKaNd8OKOI4pXXda6y33lhilhL/p6HaRS+wmhnDWj5dq1zFfj8/fYM13jeWn2b3NyJkyG9H96JEjnduvn98NnmqjcEOPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGK1RFcn3gVAojy32+3aOcbbBp5ZuCORr54b3dufe9M=;
 b=cVCVxBFaNyoAV/CSjblOuubvJ9xkdV+A/KQPUCnu71x+GMM4AeetxvqL3Ir1Yy6c621/sejQbJXbMLwBnUL9vrdb8793nhmU1jvFLiaZruikft4syRGv7cyAGFiZg21iSjCpT+dMmzxmJo8tduI5bkYIto699q0qQtu25LFabY3KtnOa9TElIF7VubpVT6ajMTnpWVbBhg57pVhQF/Bk/0+HQM8zuuuBmhTbYFIpufnLrt6MveIISq/9alREOBq+PrGlwQUdY4fV9ea5yLWp5954RR8eQgdgZK1NHdxay+aT8yPrH6g268D/6CEtQqj9LknE2fJiIQN4YgChwhRn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGK1RFcn3gVAojy32+3aOcbbBp5ZuCORr54b3dufe9M=;
 b=KNYFwvdK6rTUZF2Gu2JZ23AgHVRpXQOgRIw2/IzS9MKjm+tzLRdzjqj7bKQ+uzh1HLvXlgsipBmi0wZp1A/40ujGva0s+OzjUSui6A8W+FQgjsFYc17BJYjQf6L5I8DrAavnDEol2FvN4zc93XDbe+S2gmjnc7Altdu7AtamBeYVexgZ38+3zELwK/polWAW4epzleY+TjoKzgusPJQ5Twl7KJ4Swj98XkBHPMrEvvh3H2QRLOEX78GqRPy7LSwtN5qE9VBJNRwDmRWmKG7k8q6UXO7zdDIH6Zxp0uASjrR1PHcGmi8l5mTl8MxnEzjoBi9bTlij5vWvYr1h7sIfqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 10:16:05 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 10:16:05 +0000
Message-ID: <041f2fe4-30a3-47cb-952b-1f0029fde27c@nvidia.com>
Date: Thu, 9 Oct 2025 11:15:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
From: Jon Hunter <jonathanh@nvidia.com>
To: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, andersson@kernel.org,
 sjg@chromium.org, nm@ti.com, Chintan Vankar <c-vankar@ti.com>,
 Rajesh Gumasta <rgumasta@nvidia.com>, andi.shyti@kernel.org,
 ulf.hansson@linaro.org, thierry.reding@gmail.com, kyarlagadda@nvidia.com
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <0784441c-9859-4418-a4a7-85ffe3ecf860@ti.com>
 <d619df1f-813d-4be5-8d24-295455f956de@nvidia.com>
Content-Language: en-US
In-Reply-To: <d619df1f-813d-4be5-8d24-295455f956de@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: efe8561c-e3db-4463-d345-08de071cdb2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alU0VEx6YlBtVUErOXhaUWJCWmY0ZzRpdWpSelYrQ3ZRWEY0RSswLzY2MUtx?=
 =?utf-8?B?R1V1WHVpUGNaTGpqWEMvTVB2QmoxRzdESUI0SFV2TG5yYVhXS3FCUXE5aDJo?=
 =?utf-8?B?b0ZJZFh3Nitzc3I3NFFFWEZZc1V0dzAzb0hscHF2UUVEaGM3dnRXN0JtUUhY?=
 =?utf-8?B?c3J4MEp0UkFVMmlaalMrOHZOa0lHNjd6bmhPamllZUM3WHFFSGc3Yy9TVmhW?=
 =?utf-8?B?MDVPMnZ3ZUJzbk0rYmNHZ2FvcENvb0RqanNlOHRRMEs1V3ZzaEk0eVljQ2kx?=
 =?utf-8?B?RWVja3l2M0JUL2NMQTFQSWVxRFNJbGhNWnFobi90WkI3azdCRzVJbmtRMDhl?=
 =?utf-8?B?VnFZUjBUcmxYSjhwbHd6U2w0a1pzWU42Rk5lUTkvQzlBdTE4bGNRcFZNbUVP?=
 =?utf-8?B?M0dZTitOQ1lLYnd6ejRjNnduODdHWEMrVVovTS9lSVE5TUozZ0hqV0hzS05y?=
 =?utf-8?B?YTNXY3p4QTJ3M1ZUSThRRVM2RysyTW5VZURhZ1ZndkdGZFk5YjRpU0w0eUxM?=
 =?utf-8?B?WHRIN1NIRSs4Um5zZ3pyRFBVaW8wbXlFUU85cElPRDFpU0tac0dXNEhDVlRs?=
 =?utf-8?B?dEJQWFk1Qm1NTzNSY2h2OXhZaDJ5VmVWQkxaQWg4dCtnMG04MWdza01SZnc4?=
 =?utf-8?B?WGhvNldZcVZiekJIamZIRlFoSEVBOWpOQWxGVmZMV0tCcm1Lakt3UkorcXlC?=
 =?utf-8?B?bEs5bUZ6Zm9EMVVFL1F3bG9WRnYrVDZ4VnBUN3kwQzdaOTArMW5ZZGNmNEVn?=
 =?utf-8?B?Sk5WRXRlMzNZU1hodncySktVQ1dCRlE3QzdSQ0NwdktQcUFrS1ZuSUF0NlNH?=
 =?utf-8?B?ODY1NHhtZWJkM3dXaHFia2huZ2lySEkxQzdISzRVQk10MU1rbFczYVpjSndQ?=
 =?utf-8?B?UVlJTWdLcjRNdXJtU3QySzR1SlpRZVQvUmdlY1AwNlArbzRiOHVrMGVSdnFv?=
 =?utf-8?B?cnpQa2NSR1pOSVZWV1hlOUMxQ3pRRnJ6WkpqZDFHMXFIOE1LMDVURnN1L3My?=
 =?utf-8?B?M2RMVTBZMUlZZ09TY1A0RXVPSVBmSFJLQ0gwUFgzaEVlQWxDTXI2ZVlyUlM5?=
 =?utf-8?B?QUIzcjl3eVNEdUU4aDZ5OWpDM2NPSUc2N3hZNzhtNXVFeVRBQnBqVFVPY3Jv?=
 =?utf-8?B?NTI4VFh2emxMTlFpcjdOdUR1UUxjd3BwT3k1dE9ENTdOSUkvczhmY1FZODBQ?=
 =?utf-8?B?UERvQzJncjhvUnJHcjhXWUdZTG5OMVJqT1R4ZmE4K2NXalN3ZTFnNzhJWkFm?=
 =?utf-8?B?cEJzdUpBMmRlTE5Ha2pXTE1GbXM5UHZuTjErODFXNUhoTUVSd21OeHMycURy?=
 =?utf-8?B?cTAzaWc0cVl3OTlpZm1tcVdoeFRqY0VwUlR1aFRYU2xHc2hNSHhlYjM5TFpk?=
 =?utf-8?B?VGRxaHN5NjlmNC9zQnlLTGloS0V5empWT0pQTzdHdHZHeDJJajNDMXJBZnU2?=
 =?utf-8?B?R2lIcXNuVkI2MHVxNnJyY3lqOGNWcUUvOGgrQU9jOG1wVzZva3Q1M0cxNjdo?=
 =?utf-8?B?RnpVZGcvZG81MG4ycG5OSU9XMjlMNUg5R1VEVG9BeE1yVlpVdWVZdjFITUt4?=
 =?utf-8?B?RFhGeWp5dWFOMFFCaXVZblZ6eVUvNmk4L0tmYTl6OVdNcWx3aytuQm51cURI?=
 =?utf-8?B?YTVJVkVaUkxLdmVGZ0F5cGtieTAxTVdVdDI2UHg5cGVuaUV6Q3pCaFBtK1JE?=
 =?utf-8?B?clNMZDZvd2VYY0xjNGN3WGZGVUNoV0I5MENqM1lCZUwzaGJVenZUdTN3azRZ?=
 =?utf-8?B?NzBMQmFPekhJbkdDV1ovQTR1eGJxWHpNWlcwRUtpdFBqcjNINWlYa3piaExh?=
 =?utf-8?B?dzFUNms4UndTSEtVS1Y0dDE1OE5LQ1ROUVJGK2NtbStUMTRiR2RpN2xTWWZn?=
 =?utf-8?B?eW5UeDBTck9YVGRxVzk1M3dqcUVJSkkyTEpqOHNTdm1uNldadTdKa0M3aHBR?=
 =?utf-8?B?SlYvbUpKTEhxQUl2RlJ3RmRteUFKeXMvY2VBRHVJL1ZSczh5eVIyU1FNNzBl?=
 =?utf-8?B?U04xRXVNMlBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFR0dGRlQzBaUDNpTE92N20rMmZkcVc5WXduUlFVQzFGdVFJa0NsemdqdEhp?=
 =?utf-8?B?bWU0TEcxNFFMRThHMzEvamE4d2UrL0tsbDd4aVoxenJ6NWR2MWM0bEFjQ1hH?=
 =?utf-8?B?QkxFSDlQTHZMcC9HMGozRTF2Wm16ZWY1U2JBc3ZIS05HTkFLZ1ZnRTJKM2U2?=
 =?utf-8?B?MVp6UnpsUXp1dEZaMGM0ZmUrV3I1S3ZtekxIZ3doQldzckM3amlxaGdwQWNU?=
 =?utf-8?B?eWxmbUFNZGtxMEt3eXJ5T1ZWYmw2VHBOb0YzVmhSdiszNnBPNlh6b1oxNmVl?=
 =?utf-8?B?djRaNWpFckVoZHVPZ2trTUVIWFVRRDdYWDdQYVhCODUwQXcvMVRiejdVUksr?=
 =?utf-8?B?Z2M3WjhQVDFWa2plT2RWZ3VEZnArRTBSZnBlZEpVZTg2YU45Q2JmRGx5MXRS?=
 =?utf-8?B?bzNvWVdtdzJmSU5sOStGNkFsVTRqdnpjcityQ0dIbSt3UStDOFQxY1d1ZkJq?=
 =?utf-8?B?YWNLZEJQZXFFOFNBamxlTE93eFRoVXAwV1ZidmYrcEdweGhYYS9LT1E1aUts?=
 =?utf-8?B?dGIzVkwrSVlyWnZQZm5hZWhYclJPS01VMmh4MkJRcHNMZXpOUEJJVnlnTEJl?=
 =?utf-8?B?NUNORnVjbVhZSHREQjRXNzMxN29jRzZ3ZXB2ZFlkVk9wNmlvMS8xSnJ3YmUv?=
 =?utf-8?B?MDZqWmJzam5kYVpaQW1vOHpUQStnVDVYUTNNN0FzWEswS0ZaRDhxUm9GZ0lu?=
 =?utf-8?B?U200QmZoejdjQjFjcGRoVkw1Nm9uc1lLUWJDblBuTGZjcFlwV3ZhQlRHRlg1?=
 =?utf-8?B?SFNsdENsV3J5MkxHeFdObG8xRldWenkwbWVWMlI2Q1dtUXc5ZUlkVlZuaDJJ?=
 =?utf-8?B?RHY1RU1XZjIra2FvTGdONWovbGRaSmVwZUM0SlhvN1JkVHE5TkRsQWV0MUpH?=
 =?utf-8?B?eWFicmRCSVFlb083OTA0RnBGZmlLakRkdElFQkYyanMyanpMU1NVNk02c05W?=
 =?utf-8?B?TDlybXEydWdBMlZLcFNoTThsQ1VKRjBwVVRZRzlKeG9QWWVYT3hmV1VTV1Ay?=
 =?utf-8?B?U25Ib1JtZlhJSnNxTFg3NlhEYldMVzlxSVFRUHdLRWMycmhLdUU4TFhPdXJL?=
 =?utf-8?B?M3Fqcll6aGpGUjRmaWEram5SK1NiaGgyZy9BVWxRMVY5bFNwOW5rcXhyTWw4?=
 =?utf-8?B?UTNjSWpLQVo5MnI4T2xoWTVObnRNblNnUWpNb2VNdjFqSmpWdHZpcmhhWnIw?=
 =?utf-8?B?ZDN4UXNWNythL3NURzk3cnlDSkFoUHYwREgyY20rbkg1bkJzdzZ1dTNsNmFj?=
 =?utf-8?B?ZDUyV3NscGdZUTlGcGw4aHRJWWpJZGdhMDI3OHhLam1FZC9UT3lURmZRamlW?=
 =?utf-8?B?UVRId2huK0pBY2hnRHgzUEQ3V0k5YmxiWHZFZmRvS1VSOHYrVEhZdnJvUjl2?=
 =?utf-8?B?bmdzUzkrOVpDYzRkbFJrRW5aQkFqVXZsTWZnemVBMVdUUEJ5Vlk3Rkg4VlVr?=
 =?utf-8?B?Y1B4amRjRnhQOFVhbmptd3F6dkRFeE5IM3JadEFkS0VDdTV5NFJ1a21NNjBL?=
 =?utf-8?B?SGxsYThxalRYNGZOUFVpMEhBN0RlbXc4UEFTODd0Z3l5VmxzQWQxTnlzckVS?=
 =?utf-8?B?SzNYVWR2eDY0YmxHRnBGUlQrM2l3ajhhbUJldUQxMFdHcXkyRW9xM21pc2pS?=
 =?utf-8?B?Tzlsd1cyK01udFdQVEdvSFBEWkhzb1RMUDRFd2d3R0d0S0t4MHFoYkVjTm1O?=
 =?utf-8?B?VlhtQUY4R2F1L3lQNS9NOEZKRDJsdXhtbEM3eXBmcmF1QVM0QkZoU3kxTVdS?=
 =?utf-8?B?d1RFSUFKQU9xQW9LTndSblZaUkZ6Mmd3K1doM3ZMaUdZbkN6WTJWRHVERFBQ?=
 =?utf-8?B?b1lFZDRmNnZLNUZkRmlEUldMMXY1YXJrTVpVZk5heUhJbFZ1b3A0NU4vY1VO?=
 =?utf-8?B?ZGl4M09KMlYzUlNpN2JveHhnYVl3Q2svUWlBZ0g2K3JCL2Q3Y2RRa3lOUjBI?=
 =?utf-8?B?azM2YTl2eEhHWkxIN0dvRjBGbUorM0gyOS9hRGJZRXFyeDJEOE41YlpDcnhQ?=
 =?utf-8?B?M0FaTVIrUzVTSmJWUERXbDdBbi9JdzJRNEdHVitwYTRjZE4xeml5QnU2bU51?=
 =?utf-8?B?SlE3blpqTFpGNWRNRUN6dkRhNGkzZVkrYVJpSGEzQ044SWQwbGJkSllRTStt?=
 =?utf-8?B?RzErRlArRnRXRWNYT3l6SFpLbm93cFhCZHU2Y25KWTZ3ZEh6b2hiRlJ1SUJz?=
 =?utf-8?B?YWRhbzN6djczM1NqenVrZklwOWRYdFM1QmN4VVVCdk10UXpPZWtRNSsrUklC?=
 =?utf-8?B?Q3d1TC9QWmthNUVCWDc5RGtnSWJ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe8561c-e3db-4463-d345-08de071cdb2c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:16:05.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7pgEDcwSf1WXPcy14aYsdlnZgk0imQLz9wxfFhr/MkgLa9qEL14Hz+LPsY8JZJEhIInTyJASDPlwzoJFHsm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118

Hi Rob, Krzysztof, Conor,

On 30/09/2025 16:01, Jon Hunter wrote:

...

>> Following your series, I would like to bring to your attention that
>> Texas Instruments SoCs also have a component which requires similar kind
>> of configuration, named Timesync Router(TSR). It enables the
>> multiplexing of M inputs to N outputs, where inputs can be selectively
>> driven based on N output configuration. A detailed explanation of the
>> TSR and our attempts we tried to implement TSR can be found in following
>> RFC series:
>> https://lore.kernel.org/all/20250605063422.3813260-1-c-vankar@ti.com/
>> https://lore.kernel.org/all/20250205160119.136639-1-c-vankar@ti.com/
>>
>> To implement TSR, the relevant registers must be configured via the
>> device tree. We initially assumed that the device could be handled as a
>> mux-controller and could be extended in the same subsystem, but it was
>> ineffective. Having explored both the approaches, we now plan to
>> implement TSR within misc subsystem, which aligns with the dt-bindings
>> that you have proposed in this series.
>>
>> The purpose to replying over this series is to inform you that we also
>> have a component requiring configuration as outlined in this series. Let
>> us know if you have any suggestions for this.
> 
> That's great! Thanks for the feedback.
> 
> Rob, Krzysztof, Conor, have you guys had chance to look at this series 
> some more? We are open to re-working it as necessary to address any 
> concerns/comments you have. However, this appears to be stalled at the 
> moment and I am not sure what we should do next to push this forward.


Please can you respond to this? It is unclear if/how we can move forward 
on this.

Jon

-- 
nvpublic


