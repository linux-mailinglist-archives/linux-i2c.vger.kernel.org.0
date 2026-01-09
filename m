Return-Path: <linux-i2c+bounces-15007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD541D08527
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 10:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24B4C300F255
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 09:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97A8334C1B;
	Fri,  9 Jan 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UkKBQv31"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74323BF9F;
	Fri,  9 Jan 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952227; cv=fail; b=XPkb8GsBDSQ6+akno3Lnv2qfev5IWau5PysNbqS/o7W76fZNf6YsQ87CWKwupcuJxvjTRT1V22bl9OGYBJ2IGnaka0IkHMK/OVhxKPBwoUDz74CNk4b3fpwwRQYMUFGg5ftWvTZuZ0Qe7IiDK39jbFjySAO1OmyiKxLBqEVX82g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952227; c=relaxed/simple;
	bh=KqGK+2yXPYji54t/8ap/2VLSccGtGwSr708HWqsoURg=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rxUZUFWB20fT0+SuQC/9ccmztkQrag6vkeINY/kXZmBSbuzs7Mina6QM/3YzdD6nxYAO1UfRAYcnDKJBdjy2dOovyBmLL/UJJ2K3vtNcJKw0wnLCE9ksTPfbJuhK7tE7nbT8Ah47LCF/bH8yVzJ93ZyJ0Wyrzwmat0NbW1MbLso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UkKBQv31; arc=fail smtp.client-ip=40.93.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdXdDHL9rhxcHrTcvzgd1IhC/HBKpj4BUO9Z5xOCy1Ip0ieocxu17CXmp7DToGC/Oy38gzUujvhF/PV/3A7hy3EyC1k0GPjjiMBOtHp5l3AYMm+V6fSAWGc5KfFjb2iHEVnBgP5mtB0/5mLXP2A4ELASc+A+w3E8X2BNp6eTqYMcQnQW1AKnSP6EpRrTurnba4iZ+0fjapC/D5qXh3xor8brQW3vVwZLt3gVv926O6QEHNtxsG4z5NPlZJfxNVHmPTFksJjm6rGJr+iycl7NbQBMJug01IDnehlrDArSkJOBVP0U7rkLIsHD16YCZvaTwauJ8ACe4FXES6OvjGUNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CVffb4hSIP2DurL/APpQZCh2VbjKG+DOPGANHqMgx4=;
 b=pJ0plmPDA+m18nW9SnbmVqdog1lLB3RCgE3VLvSCNw1crw0Ho1XkAX3pZSvgp79X1jEdf9I3Lrw9ls/duNoMePyqpb5CuV9jMr8FSdynogEO9tvtW9EaMRLc8GpxilWwkVriTooNiJ24hlmzeWOgj/1M4vZJR4UmfzkR2AxrVoObRZs9zwz2ICEKcsP6JIRK88X39OJ7UJGH348XeAvZQ7+UJk9EtXMniNhpMJmkdnN8GgMBghHyawtV6A2QcuL4RCD5LHW5wtk3AVkxt3haohYelmDA/hLWmnIg+y4E6OEJ4QBCd0hmMFOHyAJnkNupYu4fjR7QMD0/b7UPuinIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CVffb4hSIP2DurL/APpQZCh2VbjKG+DOPGANHqMgx4=;
 b=UkKBQv31ybJ+9iGODSYGQCwN2szaUyQmt684oLLX+/S8I9nPxJY9nMNM4CAiIn9qQm7QLha8ujn++kaUjfYxTFBIpSALQ+FZIB3LWpuoNouGLnhXWl06nNpFxzKxndyPzDKaZgUY+leBgT/a85Hqf2A9PxGvGFPHB+fbiPiLgl+8Qcj+AObPsQi0E2PSZSNTnp9luNBfteVZVdPFXInasXQyA23OwMIWLwXuqvy1hgfIuFt+HXh+HaF6L2E3s+VemUs8dDpAwXTaDZKXtAxbn+pRpiti8R+y/odTGRG+aOavp9a8TshSD6/+Ey2SoVzOCNauCS9MfxB9c1imyK02Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY8PR12MB8242.namprd12.prod.outlook.com (2603:10b6:930:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 09:50:24 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 09:50:24 +0000
Message-ID: <650d72a0-cdd2-4c24-adca-40196b265c7b@nvidia.com>
Date: Fri, 9 Jan 2026 09:50:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] i2c: tegra: Add logic to support different
 register offsets
From: Jon Hunter <jonathanh@nvidia.com>
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107142649.14917-1-kkartik@nvidia.com>
 <20260107142649.14917-4-kkartik@nvidia.com>
 <85d5583c-a679-454e-959d-438e7726ffa4@nvidia.com>
 <69d4316a-f841-46a3-89de-6fa4412db25f@nvidia.com>
 <27c283ca-a7d8-41eb-8fed-0ee9d08f26c5@nvidia.com>
Content-Language: en-US
In-Reply-To: <27c283ca-a7d8-41eb-8fed-0ee9d08f26c5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY8PR12MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: c500620a-aa4e-47ba-bfd7-08de4f6482a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU5DQVJBK0pRNUx0WVRPT0VsdGZVVUg4V2NGRXNhcnZlNTkwSmRDbVArRnBt?=
 =?utf-8?B?RGFKTStJVkhXTG5uT1VKMkNOaW1CTVpkNk05YStwUlpOUUlZc2NGaXNSRmQy?=
 =?utf-8?B?elpvcVQwVU1hdEExbVIra29NK1M2SHE5SkNkakN0SzJ5UEkrTXF3elgyejVZ?=
 =?utf-8?B?bWJmY3E5cllNeVgwaXJyaklKQnl4YU14QjBpUmZlalNWTmFxOUMwcndZWnFx?=
 =?utf-8?B?c042QmxDeXA1elRMNXhzWGFjdDIvNGVvcVEyeHUxWG9Qc244Y3JiTUpuN2Vz?=
 =?utf-8?B?WTVpbHdETHBuSk9Fak5TT0gyRWoxVlhrcnF5c0srdlZEWGpEMERBemxMTjNL?=
 =?utf-8?B?SUJJelBmNXVCUkVGdlFKdXN2MzFqYkM1dzFUcGhEZi9qT0F0d3A3OUV6a244?=
 =?utf-8?B?SjRuVEpBN3E5OUN2QVFucWpnZzN4NnU3MWU5ajFkSWdHYlM3OUQveURvSlJs?=
 =?utf-8?B?Z3p3NXZnSUhEQnU4VnNGZlp5ZW9YTTdxV2hoWVNIUlVCT1VkK1JjMXMxUGVr?=
 =?utf-8?B?UmNCVDJyZmhaNVRKT1RKNEJNZ1pudFAwNDFHaStmRkVuWUJndmZEeXJlUjY0?=
 =?utf-8?B?dlV2WUZxVHZMeit4SkRlQVk0dnpnQnh3NFQ0QWU5NlVNME9kL09sQmo3Nmx5?=
 =?utf-8?B?eW9MbXpzdkdjWS9CdS91bUdVZ0ZZT1NSOE4za0JURitJYVA2REF1aTFSZDZG?=
 =?utf-8?B?c1NmTFZRdU1oRzU3Zmo5RW9GNHlmZEsveENzNGlraU0wa2Y1UlN4dEg0TnFH?=
 =?utf-8?B?aTVsa01raDdrQWhWYkJnaWxFaHppUWErUHR6cXlCSWVQMlZQR1VUNWVQQ2xX?=
 =?utf-8?B?d05SaFdtSGE1dVJ3Mi9IWnUrdFZNNHBwYkRZQlNtTXF5eU1TbUxZZEp6QjR2?=
 =?utf-8?B?eWI5bVdneEhua0tRZWhNVGllN2VpUnNpWlJ3NlRPNHJabWU5MHdsalYyT2Fm?=
 =?utf-8?B?by9LdXNWL055QlJIVG9jVEZqKzQwWUNJQ0E4bWhKSWxsMzMzU1RKdGR2a25l?=
 =?utf-8?B?QXhGUUxsUnU1b0dGdEVvSngvS0ZmL3I3Zlpjb2JVVVV1czQyZExKNERzVGpJ?=
 =?utf-8?B?Z0ZwYW1vSTFjV05WalRPMDZ6Ulg1cEVyTnprditkb1Rjek1ZT0VhdjdLUDBT?=
 =?utf-8?B?L0hDWXVURjdCYTk3NituM0tzT1RPTFJaQm4ySGE1VThWR1JHbzR3cHJ3bHQ4?=
 =?utf-8?B?MnhwNktWckJkRE9XczBNT25jVDFPK3crbUsraFNkUi9LVlpLa0UwWUdDSTl2?=
 =?utf-8?B?SEJDaHVjQ2dsamdmTkFRRm9xWTVOL2ltNFZPZlJWalFtNWxXTXE4VTVlcS9H?=
 =?utf-8?B?NE1BdnJCRzh3VTRZbFp4dnVZTldKTkFSWnkxcUZORnhtdU56NGkvd1IvTGZK?=
 =?utf-8?B?YmZ3MHF1UDhGV0tIUWZZWlJrZGxUUVlhV0ZZQ3BlTnR2V1psMXVzZmFtS014?=
 =?utf-8?B?elg5Myt0dkt1d3p1UjNGbnVaSlY4VS9ScXhWMllBd2NWeHVCVWtlZWtYQmJ1?=
 =?utf-8?B?WktteENMUXo3eSsrZlZBTm9oRGJncWVBNGR1UkV0enJyWS92aFNUWGdqV3lK?=
 =?utf-8?B?anVXV3FCTXVqR3BkdXo1ejNiUEExbmh5dVVyRmJSdkw3NUI1Vk9MVXNKK3N6?=
 =?utf-8?B?VEpMRVI3d2Rocy9OYWtvZkZxaVJ0SWFJSkpvS2JRSFlRRWFxUGRLSy9OK05j?=
 =?utf-8?B?bmZNNjkrMkV2cmp0Y2FNVndUaTlpb3VhZVVUVGY1Y3JtNklxbjArcGtBRUZE?=
 =?utf-8?B?ZHFTa3c5R200K3FtY3ZKU005SWxsL2UwS2RjL3JMMmlzcDN2N0FDSk1qS1RI?=
 =?utf-8?B?R2NYMHFyaktSd3hYTFpYek8xSjVRV0pWaTRwZlFRTVVaUnoyODViKzNsV2tl?=
 =?utf-8?B?UWVwZ3hteTk1NW1rRVJlM3Fidzd1aWhiTUVjQXRSTlpMZ01VQXFjVlhEQ1Z2?=
 =?utf-8?B?ZVdHU0RPc2hzM1VUOTZTbXpvSzltc0N3cDFRNy9zNzNabys5TWJZYXRKL1Ru?=
 =?utf-8?Q?xC2Lbcy0iIRqqW9qW7lPPQAycejkcY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ZDbUtaRWpHT0ZCOUtLMWtodHJQREJBK0VvbnVFN2szSExReXJtdUNqYjkr?=
 =?utf-8?B?RnVJUmtzKzlzUmN1TitKSGNIcE8vTlNBSjlrNmorYjNSOGxTZ0VkdDFVZGc3?=
 =?utf-8?B?dzN3YTFhbndkQU9UcHc2THNuY0d4eTVFcVJTbHpxQlhEdkpZTUltN3Y0NS9C?=
 =?utf-8?B?Z1kyd2k2U2xib21QMlBWN0FieXR6QkJiM2V6b1ZiNThxdXhwQzdpQWJqSkxh?=
 =?utf-8?B?aTMvY2ptR096OWF4eDdhSzZDVzE5S01LazV4SnZKclAxUFh5TGs0bnp4bVcw?=
 =?utf-8?B?VnM1WERFWEJhSWJlVytPNWYvNlNWM2JHdkxCbGZYWXM4d0VpbW9aLzdmREEr?=
 =?utf-8?B?aitOWjZ2blo5UTRWRjd2a1I3VUh5Wm5BSFlKNUlHZk5HR0Zja3BHbW1FaWdL?=
 =?utf-8?B?dTFqaDh3c2ttZnVYWWY2Wmx2dWliOGVZNUpxUk5iRHovaGZJRWVvbWhNV1lk?=
 =?utf-8?B?WUdEb1pkd0NJenhPQUhqT05qODByK2JEVms5Y1J2MUtiYXRsdGJKWk1tWUhL?=
 =?utf-8?B?dWFIRHhDME9iWVUzTVIvenVobUdrS3pzU0UrMGFIV2k4eUovU1BSdTNlQ1Jh?=
 =?utf-8?B?YU9SUU9LSVgwODNuNDhBbXp3U09nOE1lNi82aUhIbHAweDFIS0Z4VXNTc25i?=
 =?utf-8?B?aDJpOHlDMk1JMzhRZnF5dUxjZWxhQ3dwS2JFYnpDbzZMZTVHODFQN2tYdTl4?=
 =?utf-8?B?TDhxTFZ4T012M2RuWmNtUFBqZWhmQjkwNHRiSjk2YXRuKzhqY2tpRldmRnpu?=
 =?utf-8?B?NDdZZk1pL051YW8rR29lME9Mb1lCK1NqMFRUZzVFTUpYYlJQQ2pvK1k0N1Vk?=
 =?utf-8?B?QnhWTVAyUkNuNHNXWjNoakxhYVVRMzhYNXlaMVpsSE9zZm5hc0E0WTJrSkpi?=
 =?utf-8?B?N2pPMS81Z1hjLzVDS01kaDd0d0RUWjJGaTBVZGVuTUMzbFByQ2kzTEpEVmYx?=
 =?utf-8?B?WWZVVEVzYXNkQTRldEMveS9RWDYwbU80SHY4eWkxaW5TVjBCazZybVVQYXRS?=
 =?utf-8?B?bmwwV2JXbWg1M3ZrOFV4U2IvYVhaYi95dkg3Z2VEVXVJV2dNWmIra2hJY2xv?=
 =?utf-8?B?cG54NG1lZU5wY3pXc0hmNnMwYTUyRVJzUmlCVmU2cCs4TUFZbW9ZV3lPN08r?=
 =?utf-8?B?ZjlTQ1JENFBtc0Y0ZDlSeGV1NDk2Wnc3UVZoeGd2V0ZyM3dsRm41WXExT2FE?=
 =?utf-8?B?Yld0dStKMENTYWhsbTdjNVUvWU9EUkRDVmR3d2NSVmZITHNTMUJlYVJnM1VG?=
 =?utf-8?B?NXJIRlFUZVFndk4vSUVYRmpaSG9DdW5Wa3RodmEwSjcxWldBdUF6R2oyQ3JI?=
 =?utf-8?B?S2JISTdzNy9yZnFHMmM2RE40UGd2cEFaK281dkk1OC9YM2lxelhWMUFtQ082?=
 =?utf-8?B?WEtLbzk2QkQ3TU9uUkUvOUhzY21nU2pwaS9RSnJEWnBrdzl5TUVIZ242NTZ5?=
 =?utf-8?B?N2d4empnNk0yUi96dVdnQzJqVEk1QUl1OE80KzlyYTRkcUZDQ0FyeGtsaWdO?=
 =?utf-8?B?TUovay9oL2xwYm9FM3gwY3daWVpuR29Fd3BsUEpQdWIzQmpqM3VHbTgrT1VU?=
 =?utf-8?B?WWt5RkVnb3h2b0RkOVhlVUpNaWxQdWVsRjVBZ3kvMS91RWxJeU5LUjZJSGMy?=
 =?utf-8?B?VnppQXNjb0h2bFd0WHB3SWFGK1B3Z3J0V2t0UlJ6QUdPVi9MaTFhNzRqaEdN?=
 =?utf-8?B?K3dwa0w1bWJobWxRZEpnRTFhMlJkaHNaQ2dRLzA3SDg5bXB0eXJzV3RTekRG?=
 =?utf-8?B?aG9pTWpXdXhoWkZTY29mNldHTktkWFV2amlFTUo1WGU3UlRncDA0Rnk1OTlk?=
 =?utf-8?B?RnkvSWk1b2I1ME1lMGs2RUNJUDcxd04yYzZ6cmpCcnVSUmdJZUhMeTZ3bmZt?=
 =?utf-8?B?NEU3eHdYdXBIem92KzNXQWErR1JWS1RtYlVCWVVzZGcrVGV1Y0cxaEpLS1ZI?=
 =?utf-8?B?SEhSZFdpNGo2SERzRTZ3czFQQjlNWERWS1FBSnU4RlN1L1lzRFlOZmdYc1lp?=
 =?utf-8?B?d3FENHQ3SGpRM29TaXRmeTZCNSt2WnJCakNhVTl4V0lpR2pNdUV3Z0RHM3ZD?=
 =?utf-8?B?Q29MTUFBM01ETTBHOXQ4d2NXOXFsSWNJWnBTZ1gwUmlpMUJJU1hUVzNWWjdu?=
 =?utf-8?B?U1EvQVBSK0Y5Tkl2RmpGRW16TCtRZTBxdWsvdEJkVTZCOXFlQnZtZ2I4aXdk?=
 =?utf-8?B?N25QOWpXM1dYWWsySVh1UkNRc05CTEZUcGpmRENrV090ckdtQWZ1UnN0NTEx?=
 =?utf-8?B?bFFGZXNuWG82WGhOSTBYWnhPTk5XR2pJNTNJN0lqNW81dUxBNVRzYytkWmxQ?=
 =?utf-8?B?MmtlYUFocU5NaFgzaW9PN2xCUkVNZXNLUXBJalk1VmY2WHczWnpxanFyMGgz?=
 =?utf-8?Q?Cv0/KIRuYA3kB2y4F+Tlu9p/87qfNOwMHdLq79NT8Kgvg?=
X-MS-Exchange-AntiSpam-MessageData-1: wny+mQqAFbYa1A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c500620a-aa4e-47ba-bfd7-08de4f6482a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:50:24.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KA1rUDsGW54jvyEaFimRYOHNYJtuA5nxcd6CBwB+pkk6me0feSE0k3hMLcmTH19deXJdtEpLAtVswfMcPLRBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8242


On 08/01/2026 08:53, Jon Hunter wrote:

...

> Thinking about this some more I had a tough time reviewing this and feel 
> that this transition is error prone. I would prefer if we kept the 
> current definitions and then just ...
> 
> static const struct tegra_i2c_regs tegra20_i2c_regs = {
>      .cnfg = I2C_CNFG,
>      ...
> };
> 
> static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
>      .cnfg = DVC_OFFSET(I2C_CNFG),
>      ...
> };
> 
> static const struct tegra_i2c_regs tegra210_vi_i2c_regs = {
>      .cnfg = VI_OFFSET(I2C_CNFG),
>      ...
> };


I spoke to Thierry and his preference is to get rid of the definitions 
and use the raw value in the structure. That is fine, but we should make 
sure these structures are created with the correct data.

Jon

-- 
nvpublic


