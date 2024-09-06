Return-Path: <linux-i2c+bounces-6322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01096F7E7
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4BF1F21E2B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7171D1F69;
	Fri,  6 Sep 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y9bZxew7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AAF1CCB2C
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635491; cv=fail; b=QMHHoEkZxZ5Jc7LfquqmS39/0J/rEwxjm+XBN9mQIkpsAaPWUEvHreSqTCc9eGTM8QZxG7LxZsa3UC7RTzF4hzi+HMIrbxYlS043WBHEOCsl5zWE5mHB4aXxmyO0I9CaSwVTfCVMzTZCatPKy4BQIuUuv4Kpli6XqknYgTuO4V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635491; c=relaxed/simple;
	bh=BBTvK8N15AzmgCaFTaTGGlI3fqKU07MChmdjU1gdPnE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mikfSR6KxkNDINqfPp1chf8Jc28mbr6lLVr28wFxGTT85FQpUoOK/C6T9x6vU0B0CrTDY2bkLGtS4b2aQldyAmSh5zOn583d27O39mXQiV3sVpWjRPWfgCPyAX5JuFw2lCDdwSGLKMmwhZba3oJ9qUkAhRNoLv4mgBQNRHGNAXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y9bZxew7; arc=fail smtp.client-ip=40.107.93.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbFfusjY8FWqyrka3RWIj8FSi4VhILB7ALymfXoS8uVn7Z6Sq6TPraQeLooxhMGJAcb38spZSHuDqtbDQsuvbjcpQ56mhyU6A4pRLYCoUGTva88JwJY7sxorKmK7bTyj2fYUSHIi+rZthuO0jAqZYTuiTtyXZrjwPcUXPYCfCaV1SUCOuysv/bu+qDNuTJlII4CTY3R1Ytr+kS833j2la7UV8IduKuzNqSSfCJ8RjibkEB6Uqqet+hiII7uZpbhEmibHQmVuPHg/gN6dtp2UZO+i39kLJ8bbH/UT4Rhh5y3XRdAJ/XtDJc4KOcQg8y2Iur60wwiUYtzp1vGXM7fgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3aIyISBRABomZby5PUvz6FHY4IUg79Be4niJIyeqBM=;
 b=IR/3dE2tGdZaGa7Qu8eHmVz6TU3l43p8GvHZZ/BvZzXEloxcC9XbZ+c0wBeRbVtHh3DmnKapHvozpikNvrSBIuE/WJVUrTzJQThy3H60c83HEqf1ABi7QNc+o1m6HJFdx6CDzL+7Q9jvqGH3tZYLr8/xk1k/9vGaxGlGCzsnqmwPlsQgrb8l8qcrkbimAp9b4Mo1vPQHOvRh7dkQepWJMb9pZ7kpCL7huuw1lPvNYhVusZOVCQg07Qx5Ds2/CCLYli9O3mU0oViYzTZFW07A1G9rBwT01BMhWuAQfpThLJUdO/keUQrproKowoimtqf4v3SV7TGPIbilYza3dNu/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3aIyISBRABomZby5PUvz6FHY4IUg79Be4niJIyeqBM=;
 b=y9bZxew7XcVsg4yLWzNRpgRLz4/mIjZJhk4TslTUYaiLZpfCyeuGxs9CfA9HW6fCI0MnlERmUXnvqMNZppD8RbfQARSs3mVc1BupCTARwjRZELhrCp2oVz2sA8AgV5bwEiHfO+BNWhl0Ac6xaA2RJ2tWeBCctXkZ2ll3OHUof1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.31; Fri, 6 Sep
 2024 15:11:27 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 15:11:26 +0000
Message-ID: <a4525896-8eba-4927-bb18-fcba1432f0e0@amd.com>
Date: Fri, 6 Sep 2024 20:41:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
 <Ztr0alsDWrBodtyv@smile.fi.intel.com>
 <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
 <ZtsUZfxeE8Tqf1OD@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZtsUZfxeE8Tqf1OD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: b22edb00-0375-4a94-0bc3-08dcce862d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmNiSnNKZ1FIK2g4L1RkNlYxeGl6cEljRzYyblFZeWcwdk9xN2Q2YUR6NHJM?=
 =?utf-8?B?VTl3QVFJNCt3UXIvMm1TODEyb1hrSEFVdTZ0dFFWakpKdXd5Mkc2VUlvV2VO?=
 =?utf-8?B?S01Pc1AwbnFSamlHVThmWGVKTmFLWnhteExVaVZ3QkRWNTF3MjhzYlo0aWx4?=
 =?utf-8?B?aEUrVmFTa2I1THNGUkFObU42blRPZEtERlY2YjlJaVREc3dsbktWWWxHaisw?=
 =?utf-8?B?aWovV1dRYWtRV2M3SE5XWkhSODIyTXpNTkNuaEV5NmM5eHVvdnhSSDVJRDFw?=
 =?utf-8?B?ZWlMZU15YXM0bDdkOVZoQVZINE96aE5LZDhtaDhjL1A5UVNDdnRBWkozUXl3?=
 =?utf-8?B?blNxaVd1SzRWVis2ZVN1WXV4K0RzQm16ZFZ5RW9WcnNsTVNqZ3hzRUZ6RGF1?=
 =?utf-8?B?QzBBd1FLck55VUE0M3U2Sjk0Q0FHcnRpb1NVWS81ckkrREpFODZFTlhNK0NC?=
 =?utf-8?B?L3NhdDR1WGdTZFZJMExYc0dwUHpydHhCQ2lEZFZ4OHZSOHUzbTBEckNqcm1q?=
 =?utf-8?B?T3EwMU0yYVpmUm1PeVZPS1R4VnpOcE1pRkZjUm93blZHTmNLSlRzbGRQbk9a?=
 =?utf-8?B?K0Nja0dZRi9DcVFtenlXS004bDhuZ3EvQ3J0U2krUnBiald6ZS9ac1RuTVFr?=
 =?utf-8?B?NTh3OEdibzZLYlRiMWJTdzMwVVVJVnl1TWEwRDFQRGQ0bTBhVzNNMTlybmFn?=
 =?utf-8?B?U1h3c2FxV2dFUlVQNStYcHNEdVQzVHhGSko0VGpkUFEzejBNeGZFa0hYNWdq?=
 =?utf-8?B?YXVRQy85NTNReEVGc3U3bWtVeUZEQ0d6dkJvMnFsV0ovMTUvTUkxSmZPT3Va?=
 =?utf-8?B?Tm9sWFh0SEY2L25UenJUN1hOMmU5SzAyTGlSR3VOVERDc08zdFNTZytGZWNW?=
 =?utf-8?B?SE1NdzUwWWM1cmZ2MzU5Slkrbm9FYnpkYUcySTBwc2l6VnorV2U3UnhVd283?=
 =?utf-8?B?N3MxaThzbXVCWVdMOEZNUk1SMVIyMWVZcXY3UWxNcTkwUkgxZmI0QTJxbjNM?=
 =?utf-8?B?bkROOVAwNWdBRGFlUGVWWURDanFvRlk2OXZYV0JYR25lYjhqSzdRU05nWHBz?=
 =?utf-8?B?bXBvOHVQY245T0d6UWtHMXlqK1RKVHRYT1RVMnRCaWNtSFh3Y3BKSmMyUEJt?=
 =?utf-8?B?ZTQrYlJRcFVUOUFlaWFia0daVGNkeCs5SDFpZzI3N2gzcmhuenRHY2pUV3k1?=
 =?utf-8?B?aVRVRHFoWVlvZlBYY3ppTmdyaE9BRHBMUHRPTHdLejI5SEMvd1E0L0xKWGZZ?=
 =?utf-8?B?d3FFU3Nxc3BqaloxLzBFd1hIeEFmWlhxZmNJY3ZWaFhPMFRLcW9ISFBLSmtL?=
 =?utf-8?B?WnR0cE13MHZoM0pVU3p1dG1yWEU1VThOMzBGNExDWUhvZlVHMGQzSUtUd0ZV?=
 =?utf-8?B?T1VEUnFMc1Y0ZmpQWEtYbGhLRllDZnZsbWhQOG9vZ1Q1d1ZrdWhlU091Ykw1?=
 =?utf-8?B?L0dEbnV1SHdkSVFrRVh0SmRTWnk5QVJQMEY2K2dpQlcxYUJ4NXRIVzFiZ0px?=
 =?utf-8?B?azVXSkFiOVdxellNaHAwVWdINlRodVdySVRxczlZeW41YWFxYm83elhJdXU1?=
 =?utf-8?B?K2FtVTZ5QW1ZSGxKUDRlZ0tyL0c2YTJHT0VpZDkrUFkyR0tIZ21GYzEvZVNQ?=
 =?utf-8?B?SUJKYWk4YkkvNVRTWnNZM1pDZkpYL1NLdXAxcUFzeVlxVU9hMytKKzJUQXRX?=
 =?utf-8?B?ZXdJVEFhdEYyT2NJcWxNd3Q0WCtWN0lkSXNEWktXc0s4NExONmlNeWFHN1lQ?=
 =?utf-8?B?Z2l0aEdkcC8rbUtPZzljQmpXcFlGZzJoMS82RTJyUVNWeG1NZi9yZCtYdkYv?=
 =?utf-8?B?c3Y0NzU0UGZ1amFtc282dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVdxQXVoNUI2V1FFRFl1K0JLd1NTcWp6bVBabDBhcmwwUm1wdEdycUltclBq?=
 =?utf-8?B?ZTVKNFNXdHpVY3FWUlNzdzJNMVJNUzI5OVVLRUVoZEZrRHhnQkxTUC9BRXZZ?=
 =?utf-8?B?eS8rb2ZEZ3N5SmFTbWM2VExpWWJwTm1wZGxwVkJGWlFyYjJ3UUM2U0tXT3hM?=
 =?utf-8?B?U0RER2F3d2RYNlZHU0taWWxVMy9GeWJSUVBYamZhbEN0WkR6Vjg5ZUdCSkNP?=
 =?utf-8?B?Rk5keHpiZkNIMTJYYTd4MnF2VG1DcnB3azhwbXdFdXFMWHoxZXRsbHFNSklZ?=
 =?utf-8?B?c3Mwa2VkbnhxM1BkcWV0NXZxYmVYZ1NzN3RrTXlDaHBzU1JVTXRWMlZQWmVI?=
 =?utf-8?B?MG9HYWxwNHNSd0VDbnoyTDFCTTF3d3lVZ2luOUp2WDl5eVdiek56ejlFVUgv?=
 =?utf-8?B?Uy9SVFl3R0NpVDhNUDZlQ1ljSkQ2bGdoalNvaWdMK0FKbWxQOWlwZDdRdEpN?=
 =?utf-8?B?WmpxVCtNak1ZRGs4d1dUL2ZBZjdPdHJJQlFjcnJ5bWR1UEFZR1NVanYwcnAw?=
 =?utf-8?B?YlA1MVhzTmJzUkJjTlhPdGxqU3ZMczlIM1k1UUdHeUsrcGZpNmF1L2Nuek5Y?=
 =?utf-8?B?cXhrcUJhYm1nY1NUbzFHK0FqcDVCbWFJSndYME1rM08xTXRxclg0MWxkSll0?=
 =?utf-8?B?eXZtVGFZclM2dkw0aVZneElUZzRWKzRDRkFsSFRCbEhTQmtFdFI1R1VMTktk?=
 =?utf-8?B?YzB0NDlqWWFma3Z2aFhORFRVMTFaa21NdU5GalVaeWNWT2dubmVRa1JaOTQ4?=
 =?utf-8?B?ZFlEb0JJSGdJSWV0bU5ZZEcwUVFsbGs2eXdFOWU3Wk9KeENTVEZsTlRvdUtP?=
 =?utf-8?B?a2ZnMlBTSU53dDkzUzBZS0pYdng0NHBNSE04WE9TT0xqVk5USW56b1pWMWMx?=
 =?utf-8?B?V2hLaFpWUzBxU2tZd3lRd1pPeTN3ejczWDdBTnNrY1BqZ0s0d09GYTMydGM1?=
 =?utf-8?B?cStMbHRCVk5hYmQ1aXp3cXVkWVN0NGNEejBVcGZzbE9IZ3hsZ1dndG1FVThR?=
 =?utf-8?B?bU1hRFZPK3JwWEg1UzF4SG41NlcrbXpnWDc5bi9EbUJPeWcxNUlDb2paWEY0?=
 =?utf-8?B?TjFTMjFZdWU5aHFZUklOSi9uZ1AyRXh4VTdjZHpEZXVydUFIMDBMK2ljU3pn?=
 =?utf-8?B?SUV5YnB5bjRiaFB4ZG1FcUZzY3VRUzJZTFg3eVFtaXVPNFIzTHRrR2dqU2lP?=
 =?utf-8?B?Tml3NzVyOENGRGI3c1JnSWxwYTBKc1pZZGRITXpwY3ZxdWsxUGN1SXRyekJO?=
 =?utf-8?B?QnNJMGJJV2M4Yk1aYXk1eVZXM1UwRzVNcGVNRlRZNU54WWoyUkJzcFkxVkdi?=
 =?utf-8?B?MGdUZFlubWpWVHIyVi9TNkp2TGhjVFN5RklvN2ZHY0hVNFNNMDZRSmNMVmgx?=
 =?utf-8?B?YXIyUW5hd0hwSzZZUFJ2c1BxVUFJZ0xSTG5xR3VFcEFXK3JNVnpyWWMzdkZK?=
 =?utf-8?B?Vnc4OHRLWXZYakxIT2FTNEdmMjlwbzg1bDhKaEFlRHdLaVMyUHFBNWZ5RlRy?=
 =?utf-8?B?akE0UmVIQWFiNUJPNk5wRU5BV0I4dUJsR1pUMkJPQUtJM3JEaTB0QzRYTEgr?=
 =?utf-8?B?UHBNRzAxSk9BL1lDZVkwWDBYd0s4UzU2NWU5elVXTU1VQmMzUEdPZDg4MGJm?=
 =?utf-8?B?V2sreEduVzBiWU5pWTRDSG5pc2ExaHhtSlZVZ0xDVEZ1dmk5QXcvWHM3TlpG?=
 =?utf-8?B?TkxYRmJDU2JkdGlIZGU5UVp5akYxZG5INDNtVEdlWmcwSEcrd1RtT0ZMdStl?=
 =?utf-8?B?WnlrTGk2TmdUa3UwNUtpQWhrSEk1S0pQcnBLS3A0bHlxdUxaTmZHTG1ESkti?=
 =?utf-8?B?UlV1YmwwdnRmYTZ1UnlQRnhDNTNUZzNIQWd1ZjBhdHVmSU5tMk9ZWnJmQ2pQ?=
 =?utf-8?B?QWFRTjNlbmJ6OGxGaGRkV1FJeXk1Rk5GOTlnODZtV3VTYy8yV2ZpbEwrMUM5?=
 =?utf-8?B?SlNrd0FrVXZsTHpjamRrQjBTRlFnOEZBZFFWWG9BdVlWaHhsNXVrbHB0R0lr?=
 =?utf-8?B?a1pFWmh6Q3pvN2FsTWVhRk9GSzJDQzQ2d2srL2tZZVhzbUhXT1ZQMW5WNWhJ?=
 =?utf-8?B?OVFQK2JlaVJVL3hiTlNRZEsxbVZsdEtIdm8zbU82bkFGMC9WcVgxS0VhRE1N?=
 =?utf-8?Q?QW5NdtyPqkNWUWU3OJs4X/xvX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22edb00-0375-4a94-0bc3-08dcce862d90
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:11:26.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5wvY44xkIwfRDMBP7ubukiW/gE9/8EGBixFNFwFrkrYuIF/ThzohwK4NOPsG51R2NrnvtCXouh2cq8OczlIqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387



On 9/6/2024 20:10, Andy Shevchenko wrote:
> On Fri, Sep 06, 2024 at 06:50:48PM +0530, Shyam Sundar S K wrote:
>> On 9/6/2024 17:54, Andy Shevchenko wrote:
>>> On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:
> 
> First of all, you haven't replied to some of my comments, I assume that you
> agree on them and are going to fix as suggested?

I agree with your comments. I have only requested further
clarification on a few points where I need more understanding.

> 
> ...
> 
>>>> The AMD ASF controller is presented to the operating system as an ACPI
>>>> device. The piix4 driver can obtain the ASF handle through ACPI to
>>>> retrieve information about the ASF controller's attributes, such as the
>>>> ASF address space and interrupt number, and to handle ASF interrupts.
>>>
>>> Can you share an excerpt of DSDT to see how it looks like?
>>
>> Device (ASFC)
>> {
>> 	...
> 
> Can you put the necessary bits for the enumeration (you may replace some IDs if
> they are not public yet to something like XX..XX or xx..xx)?
> 

Name (_HID, "AMDIXXXX")  // _HID: Hardware ID
Name (_UID, Zero)  // _UID: Unique ID

>>     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>     {
>>         Name (ASBB, ResourceTemplate ()
>>         {
>>             Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>             {
>>                 0x00000014,
>>             }
>>             IO (Decode16,
>>                 0x0B20,             // Range Minimum
>>                 0x0B20,             // Range Maximum
> 
> Typo in value? Shouldn't this be 0x0b3f?

Its is 0xb20, that is meant for ASF.

> 
>>                 0x00,               // Alignment
>>                 0x20,               // Length
>>                 )
>>             Memory32Fixed (ReadWrite,
>>                 0xFEC00040,         // Address Base
>>                 0x00000100,         // Address Length
>>                 )
>>         })
>>         Return (ASBB) /* \_SB_.ASFC._CRS.ASBB */
>>     }
>> 	...
>> }
> 
> ...
> 
>>>> Additionally, include a 'depends on X86' Kconfig entry for
>>>> CONFIG_I2C_PIIX4, as the current patch utilizes acpi_dev_get_resources(),
>>>> which is compiled only when CONFIG_ACPI is enabled, and CONFIG_ACPI
>>>> depends on CONFIG_X86.
>>>
>>> Yeah, please don't do that. If it requires ACPI, make it clear, there is
>>> no x86 compile-time dependency.
>>
>> You mean to say make the dependencies as:
>>
>> depends on PCI && HAS_IOPORT && ACPI
>>
>> instead of:
>>
>> depends on PCI && HAS_IOPORT && X86
> 
> Yes, but see below as well about the stubs
> 
> ~~~vvv
>>> Second issue with this is that now you require entire ACPI machinery for
>>> the previous cases where it wasn't needed. Imagine an embedded system with
>>> limited amount of memory for which you require +1Mbyte just for nothing.
>>>
>>> Look how the other do (hint: ifdeffery in the code with stubs).
> 
> ___^^^
> 
> ...
> 
>>>> +	u8 bank, reg, cmd = 0;
>>>
>>> Move cmd assignment into the respective branch of the conditional below, in
>>> that case it will be closer and more symmetrical.
>>
>> meaning, make the cmd assignment only in the if() case.
> 
> Yes.
> 
>> Not sure if I understand your remark completely.
> 
> 	if (...) {
> 		cmd = 0;
> 	} else {
> 		cmd = ...
> 	}
> 

Got it.

> ...
> 
>>>> +	if (slave_int & BIT(6)) {
>>>> +		/* Slave Interrupt */
>>>> +		outb_p(slave_int | BIT(6), ASFSTA);
>>>> +		schedule_delayed_work(&adapdata->work_buf, HZ);
>>>> +	} else {
>>>> +		/* Master Interrupt */
>>>
>>> Please, start using inclusive non-offensive terms instead of old 'master/slave'
>>> terminology. Nowadays it's a part of the standard AFAIU.
>>
>> OK. I get it ( tried to retain the names as mentioned in the AMD ASF
>> databook).
>>
>> Which one would you advise (instead of master/slave)?
> 
> As per official I2C specification. :-)

Thanks! I will change to controller/target instead of master/slave.

> 
>> Primary/secondary
>> Controller/Worker
>> Requester/Responder
> 
> See, e.g., a93c2e5fe766 ("i2c: reword i2c_algorithm according to newest specification").
> 
>>> Note, I'm talking only about comments and messages, the APIs is another story
>>> that should be addressed separately.
>>>
>>>> +		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
>>>> +	}
> 
> ...
> 
>>>> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
>>>> +	if (ACPI_FAILURE(status))
>>>> +		return -ENODEV;
>>>> +
>>>> +	adev = acpi_fetch_acpi_dev(handle);
>>>> +	if (!adev)
>>>> +		return -ENODEV;
>>>
>>> This approach I don't like. I would like to see DSDT for that
>>> as I mentioned above.
>>
>> I have posted the DSDT. Can you please elaborate your remarks?
> 
> Not that parts that affect this...

Alright, I have posted the _HID enumeration details above. Please let
me know if using acpi_fetch_acpi_dev() is acceptable or if there's a
better alternative.

I am open to making changes based on these clarifications.

Thanks,
Shyam

> 
> ...
> 
>>>> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
>>>> +	if (ret < 0) {
>>>
>>>> +		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
>>>> +		return ret;
>>>
>>> 		return dev_err_probe(...);
>>
>> I thought dev_err_probe(...); is called only from the .probe
>> functions. Is that not the case?
> 
> I assume you call this due to use of devm_*(). Either devm_*() should be
> replaced to non-devm_*() analogues, or these moved to dev_err_probe().
> 
>> In the current proposed change, sb800_asf_add_adap() gets called from
>> *_probe().
>>
>> Or you mean to say, no need for a error print and just do a error return?
> 
> No. It's also possible, but this is up to you.
> 
>> if (ret < 0)
>> 	return ret;
>>
>> Likewise for below remarks on dev_err_probe(...);
> 

