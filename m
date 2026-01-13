Return-Path: <linux-i2c+bounces-15126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B008D1A578
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7703B301AE1E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85E0312810;
	Tue, 13 Jan 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lxhk+vA0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF76C2FDC5E;
	Tue, 13 Jan 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322443; cv=fail; b=l5CrcCaXgdDv9CUzKpHPU1Nq8vjV0hLF0qEyvXxmOP53CKI9vkQy8OgtxXdnK88RR4xE5ouxMMVhg2HBVs5Q58zI1CvS9KbGqjs8sUZDtdF+pfPIXEAjq1/ClwenTie9jETIv/ij2adYneB9myS+lhiNBmUkYpb6Vq9G49M8ANk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322443; c=relaxed/simple;
	bh=nnyzklJ/pS04nuVi9/Ivg2hn9xzPlayNXFclWLnamR0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z2pK9XF2jCls2HCo9vK7VQJtKzqTW8P0ZffTkmvT0WnKeevTPbnPMwliwc0DW1eFOgZ0xy9oSSTUphikj36i0NXz6Dyu8Myj93QdgXNWDcHLz3A65Max3QOj6dgy25w9CE9CSH5lTA5cPiMAlM+GED0jVBX/gkeNFeQUoqOPa0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lxhk+vA0; arc=fail smtp.client-ip=40.107.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5wbUsoektXCLFx/68WrhLCa13J9WWEY5CBogZ/YZpxACxPemwSH2UJIkMi1PQbxtFcTO5pFtkPIDNtjKsuhhepfrZx5NsX5GIZsce1q77Af2HIa+zOF4VZu6V//3uBc+GOXJvjqf99/XN7GrXoS2al0Ag/37hCQWkg7jDEjW4W+dzcXYvMrbEuTg11T9r0v1iLd2d3qWwMGy4Ii3ZF+a4q11SRL4vyMNBlIsjUcVEGRycGXuVhe3pZsY6p5wIrvEydXCPeCW1kDsDgaoLqGF8hwfEx7v80U+oR0VzGo9VXzfDoxQ49AC7VBMEXVQkRCq+usgBiyj2V0ot9Zg4G9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apG0tfvG+vvt/K+un/if8NYXJ7FECBirQLbvlvxSnck=;
 b=cXlVa5s2ae0NjYj8dGAzhDK6O7cdU4LLu989JavWWGTRkVvEb+lfKPdW/p2p3G9d5nGXO8JzPXhnJ2Pvt6k5srZYMPq+B1pkHde0mGPMA9bxqv2JxoCZWT5UToJrN7kLKMlEecZ/rFMQRyHizi8zaHfd2kuZAQW/MlJia0H+alSyjefyIO56vAJGSkzhn0rp5KYDUC/4L2WFCPkLioeFBzTYBaz0SAhy3RG0w3H8M7MrY1uqxC9sxoC+btrCX5VRTpHk2puS8S7F2F6azancBeMT+aY9i8F84LVqrH4avnrcueycqnw8juaOMaIAaO4iPaurKMAbU2Pjfs8j2rnVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apG0tfvG+vvt/K+un/if8NYXJ7FECBirQLbvlvxSnck=;
 b=lxhk+vA06kwtU/N+r32saVT/leftRJ412nnTjEK8kfZwx/hAfBD/GMbaQYRfBwqe/hCCJCnKZNFIEF12GD6dys2GBwhi5tP/rsEMpAqCjk0GGw70vKyMYhh8/dENrfWU/vD08pIq7yEpqBan8VKpLCetyNexcxu0fYrqS7yzOcgMLuobJDGNdkDwugCBEv3PCtxRcZZc8+Q0LVrfKLwPM0DiSuZnKLo2LQy/58TchbuZlqWAr8Ah64zji0KTTnmGNl2bZK5G/Z5PXyD0H/SjOkAmnRqzesyeXwNbKL3Mmsxih/GJct84mS/a37Ocg0JaCpoPmQKFn8TKP2w0dC0O8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:40:37 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:40:37 +0000
Message-ID: <91144915-1ca1-475f-9fc7-5eea18bdb39e@nvidia.com>
Date: Tue, 13 Jan 2026 22:10:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Jon Hunter <jonathanh@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113090457.41689-1-kkartik@nvidia.com>
 <20260113090457.41689-4-kkartik@nvidia.com>
 <2084e4ee-f984-4c39-95dc-1e2291a815e5@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <2084e4ee-f984-4c39-95dc-1e2291a815e5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::6) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: e2317c4c-785a-4399-17ed-08de52c27af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3o4NmE3NWFmZHdCL3hvMlducjJ6UG1ZVFlVcGpWWkNlM0FMRVlvQk5jOHdx?=
 =?utf-8?B?bWcwZWNhQTMxZW1lVlZvb3FwM0ZESjVMaGRqOGdFR1Z6ZzhINjVZYjlRdUZl?=
 =?utf-8?B?M0V0RGhYdFRwc0Yya3lYZHhRZ21EMEVIL0RISm9GMFQyVVFPZTJGZ0tRV3BV?=
 =?utf-8?B?SnVWeWpRUVgzNkpYZUpsc0lOSmRvNndDOHJ6Q0ZxUmdUSHdTMWRoanl3cENl?=
 =?utf-8?B?OGVkdjZjU25QN3hDRE9hNWwvcUEyako0R05TYUhPeW5rNWd2T3drazFWUXpv?=
 =?utf-8?B?R2xERnNXb2VBdXE1NiswNnVJeGlXYTIwSU11eXdubnB0UjFGZ0lla3dRVEEr?=
 =?utf-8?B?b3VhR1RNdzF5aUhFNDBRYjFnZ3pZRFVPdVBxYldQOVVJZTRIbnhZVnZNU3ov?=
 =?utf-8?B?VGNjTXBRTGpDMWsrNTVsbXZHSzBFYStTTjRVbThTcUxzNHhaRDB5V0ttU2V0?=
 =?utf-8?B?LzJ1MVNRS0tXWjAzaUVObjY1eWZ4R0Z3SytYeVJTS3dhTHVWUHBjSFJ3OHBH?=
 =?utf-8?B?UzJUMC8wV0FtUmZtbXcwcDNaSFNzbHJvSDBQLzJFRyttblUvM2tISDlOSWRY?=
 =?utf-8?B?QnFhY1QwVkxDVmluUHUzQTRrT0lOR3BsMnpnSUhPdzJmRUMydXQ5SVg3aW1x?=
 =?utf-8?B?d0h3aWFXOTVqenlBU3YwY0F4VlI4UEVYL2pFMitGQUJmZUJGYVQ1ZkZZeko1?=
 =?utf-8?B?Q2pNdjhydE5sUXkvY1B3V2JMeEFSRHg4MnNHeVJndFNIaXBISjlwS0phdS90?=
 =?utf-8?B?TW9qbFV5N3F6OERkZ1hUdENLOFB5OUFrNkwyQUtxS0lCYjNPdkQ1aGt1S1lM?=
 =?utf-8?B?bG5QL1RkTWd2YnJpS1N5cGFxdWxoZi9zaG1sL2FTR3lPellkaTdrUEZVR2ZL?=
 =?utf-8?B?cDl3VUg0R01RM3RKNjJ3TENDV3N0cSt4clJnZ1hVcVFHemFsT0tvRGEydDBS?=
 =?utf-8?B?OUp2QnpTR1BxRlVaYWQwcE1Bb0hsWFVnbC9LNEdqTWdIeG5JSDFIY0NHN2Va?=
 =?utf-8?B?QTZkYVp5N0plaCtsUXVCQmhDUHZpUm1xb0c4d3JkWHlueUVLbEdoeE1sdERR?=
 =?utf-8?B?TmZtL25EWTdLS25qdGdZVzFVMDFCcmhWVXptQ2YydzVLdnd0UDlrV0F1bHFH?=
 =?utf-8?B?SDFhUGNpWlo1RFB2dEhUMEdyNVlpdzdsOEVtU0F0N1VtRHJDYkRvVGk2SWNi?=
 =?utf-8?B?dDlycmNNNC9Db0wyZGVoQjRVU0ZLS29CcG9sM0N2VTY2NUNiT2h2dk9yRHZF?=
 =?utf-8?B?aTh0RVUxSnZwdUFkYmIzUHo2dlhLaXYyTTBaZWVvM3BFckJpcitUcjBRa0s0?=
 =?utf-8?B?eTFIemhWNHQ0UmdsSUJndXRuZ1VjWDYxNVFlcEVrWTlqTDRyakkyd2hhOXRN?=
 =?utf-8?B?bFpLTlFzcDd3anJ3Q1IrS2orNHZzUjl6N1cyTjdEVzZ5STI2VGlXakh0c0U1?=
 =?utf-8?B?NnEraGd3M1d6azA2eUNzUDBiclpTUmZTOWJtMTB4SVNGdWRsbjV0cFRGQVBr?=
 =?utf-8?B?bFhSM3Z4YVlOa2ZoQTR4YUxZUDVJQmM3SGtRcjQwQjZkVWRETmRpM05FdklN?=
 =?utf-8?B?UkRTNEdBRFR1NjFtQ0hQekhadG9nNWRGMVpMVHdVM0FRNEpFSHI0bjBKaWxo?=
 =?utf-8?B?aFNiaEcvZVIzcHNBZmQ4OGJiRVQ2TXluQWk5N3hHczBTZVpMMmtsaXJWM1R4?=
 =?utf-8?B?OW1rTDFwajQrRGR1UU85aFI3ZUx4bis3bFIrejhjd3E1Q05paTZQUnpUdVNZ?=
 =?utf-8?B?Z3dWT0toYy9oUElSMStlR0NJSC9hdjN1MElkeGw4LzdjYjhYL1FtOGlURHNv?=
 =?utf-8?B?dUR5SW5ScGZKVnQvOC9xVm9jWkdLNitoWUNmU3ZTd3kxZ2JHdXNqckY5dzZG?=
 =?utf-8?B?ZzBzbFV3VDRHbDRSMkw3elN5MURNNjRMMzlJTi9Vem9hTEN6Q2lkZnNURGtV?=
 =?utf-8?B?MFQ2aE1HeDR3N3FVanZ3Tm5DNjIwd2xIb3ZtNGg3YklickFEZ3VGZjZTNDZD?=
 =?utf-8?Q?7kPXNSU6TAeLpuKvRSy7OyPZu7aY5M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VThiaUdYaGk1L3BCRDg2bjZ2RHE0a1BlbS84VHR5K3FJblRLVDE4ZlcvV1cr?=
 =?utf-8?B?ZXFibjV6UldBNnZyUFVqRkk1eldIQ2x1Ny9Odm5pSWpuMzdwYUZSdk5oOHNT?=
 =?utf-8?B?Q3JqdWhzeXNXMnd1c09zcHhDLzMzL3VDUStwd0lvVkQzRElMTENtRURxM3Bu?=
 =?utf-8?B?SjVoK0h1bEFoU3pjU2hGSVFZNGdGcnY3aWJmWUk5b1p6N09nc2lJZXlSR1Vs?=
 =?utf-8?B?amRCb2g4bURRUkRsMkJINEdZK1BxQ0hlZGN2T0h1ZXVjMEtNUnlURkh0QjRM?=
 =?utf-8?B?R2dueXJnL09iMGh1V0lkTnRDT245NDBwNTl1ZEFtZnlQdEIxOGJKNW1COVVE?=
 =?utf-8?B?cW1nZHBic3NDVi9Fc2toTEd2Zlh4QUtzcHJPTzlBRGx0a25COHRWVXY4azNp?=
 =?utf-8?B?aFNvQ1I3TWVGMnV3WDlIRy8xd01pVGNGZ1dKQVFCSTF2TEpicDNoYk0rdXFi?=
 =?utf-8?B?cTRla215NVJicVFBNHk0MWJ5WDRzdVlRaGNPZk5jQ09CQmVYcnA3ZjNqZHhC?=
 =?utf-8?B?RWp6RStGL1cySEV4RmxQVVVhYk5pQVM1b0poRWpzZ3pHWFNOcE9pNno5WFoz?=
 =?utf-8?B?bUQyOE9vRmJWckpoQTAwN2grU202Mno0UzdCbnBYNWNnS3Z6K3h1TnI1RnR0?=
 =?utf-8?B?VjUva1RrMGdzbEs2OFMwVDFYcFBmTGhFcFluRTVpRWJqQlB2S2FQQzN6QlhR?=
 =?utf-8?B?d0w1WUsrUFlSb1hYSWpEWlY1NU13U2N2WXdMbEMxekJJTHJDWHpMVGN3R29I?=
 =?utf-8?B?Ri93bjRiUGZ6KzJRZi9NRm1ENlhMSTJSejZLRlJvZnM5aFFoeDI4SHdPK1lo?=
 =?utf-8?B?Nys4K3hORkEwUEpLRW1iYklCVW11RVBzc2twYzhsNjgzWjBFbXJkZjZHODNO?=
 =?utf-8?B?aHhuOWgrV2NISGtPQ3E3ejVFbG1Za2traktxU0hKZlBka1VOa0F1T1h2YlBo?=
 =?utf-8?B?WURVRXpHM3hQQ1lpZHBtZGpnZTVUMjNHQXh6eUd3SXFWQTNaNjdhTFdqaXZY?=
 =?utf-8?B?dWVZQjFVcTA2elBNNDBTcjRMWjVnZUVyYXA0anAvUTRGTmUzYVJkZVlKZE5Z?=
 =?utf-8?B?c1NFaXNtSGovd3dralJSQWZlUXVKZ21iMUdwcXE1MXJGQ3lRc0xHU1lxWEor?=
 =?utf-8?B?TjdsRFpiTlZaNzNKOHpIOUx4Q2I5T0tTMnkvZEI3SVJJejc4blhNWU1HU0h6?=
 =?utf-8?B?T0RRak02eWVKZTlYTy83SmxmSEJIY2NPb0hVdnpHYzFNb0g1eFNwQlYvaXcr?=
 =?utf-8?B?WlIxaTBqcWl2YmpjbVRpUEFSN3ZTN1JjNU81VmsvVEQwcWdzYzNndVQyQnhQ?=
 =?utf-8?B?SStHem1CUmIySWV2azh6YnVrbkRQTDZNSk5RaStvRFpQbkk4UWpRL3VXNXJY?=
 =?utf-8?B?QW42Z2RIV1RHTDZrSXIxWGFZelBiVE0yRDVEejF2MmlQdjFONnZkS3JFVXJx?=
 =?utf-8?B?YklPVEt2blVkWTByVUZzb1lmRjBlNFRLeU1lQk5oWE5ja25qQmpqdk9zSS9X?=
 =?utf-8?B?TmlRZEtkQ09Fek9TVEIxSUhpSXNxWGtyUXhJTTZhK0pLSUZPNGVlcmlVaHpB?=
 =?utf-8?B?Qjg0UzNPamo1dGx4QW5yTGc1QmxVS3JXN1lsSmlQb3MzSXVNcTM3MEdMSFQx?=
 =?utf-8?B?NjU4Y2VBdzVtb3FJMVlFSFlrM0FydWhsMUtCNjc3NktSOU4yaEZVK1NRdlFF?=
 =?utf-8?B?UGhnOTZtUW5jNkxaZ1pSamZLbEtwdytZY2Fac3Nnc28vRUNwR2VVK1RiTFRv?=
 =?utf-8?B?ZTliQUFGdk5STTF5N2c0MnhZNHlZWG1GVEFUQTRsa3haNDVDU2RUemdrZGtt?=
 =?utf-8?B?S0FIY25jcDh0TnZMUk1BNXBZUDZTUk1TK085ZXl2OTdUUG9ibkV1U3JZaTdv?=
 =?utf-8?B?WTVXQnVkWW16RnpZdU1STDFzcWwrYmtWaFR6VW5RdTVFTWFtZmdYbTI1QVVm?=
 =?utf-8?B?NmFqNG43OTBORjhSTS9aRnZSZnVoQlkwZ1NzWHJUZCtJQnF4T1NwbE4wQUpx?=
 =?utf-8?B?WG00V1dMbEJwR2hmT0ZNSVpNRXZudWpJM1VYdEs5Y2l6VGZTUlZMbU4wSlJW?=
 =?utf-8?B?bXVTa0UvOCtHTWRGM0cvQkFraVFtZ2IvVG1mV2MzS25NV0JnbFBNNmZKM1g2?=
 =?utf-8?B?bWwwRVZPU1ZybEo4TUViTjN3Ukd5VXNaSUhMeHh5akdLL05wWkZmQ0JmLzdM?=
 =?utf-8?B?dytnc1crNFhVelBFTi9TTGNjcVlvQlVHMzZsTENYSW1iRW81YzdPS1V2Y0hu?=
 =?utf-8?B?UmxTM3JVeDh4S01qZ3A1VGg5Rm1BY05rNEN1SGsxaTdwancweDVNK29EOHNm?=
 =?utf-8?B?OFY4RHlwZmQ2M3FIcFN2VC9tRHNxSUNQZzBzc21UU2VtdFhBdHF0QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2317c4c-785a-4399-17ed-08de52c27af3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:40:37.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Dofz5Qpsmj3C2tYgaHcuylELGpROvLTin8WQkAsCemzHFD591lCF4BS45QS9hNwut9+BsNrAK2YY37WiQkrDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527

On 13/01/26 18:04, Jon Hunter wrote:
> 
> On 13/01/2026 09:04, Kartik Rajput wrote:
>> Tegra410 use different offsets for existing I2C registers, update
>> the logic to use appropriate offsets per SoC.
>>
>> As the registers offsets are now also defined for dvc and vi, following
>> function are not required and they are removed:
>>   - tegra_i2c_reg_addr(): No translation required.
>>   - dvc_readl(): Replaced with i2c_readl().
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> Changes in v6:
>>     * Do not remove dvc_writel().
>>     * Keep DVC registers defined as a macro.
>>     * Correct Tegra20 DVC register offsets.
>>     * Remove sl_cnfg, sl_addr1 and sl_addr2 registers for DVC and VI
>>       as they are not used.
>> Changes in v2:
>>     * Replace individual is_dvc and is_vi flags with an I2C variant.
>>     * Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
>>       patch.
>>     * Use calculated offsets for tegra20_dvc_i2c_regs and
>>       tegra210_vi_i2c_regs.
>>     * Initialize registers only if they are used on the given SoC.
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 368 +++++++++++++++++++++------------
>>   1 file changed, 239 insertions(+), 129 deletions(-)
> 
> ...
> 
>>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>> @@ -1937,6 +2045,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>>       .enable_hs_mode_support = true,
>>       .has_mutex = true,
>>       .variant = TEGRA_I2C_VARIANT_DEFAULT,
>> +    .regs = &tegra20_i2c_regs,
>>   };
> 
> 
> Is this correct? Tegra256 sets 'has_mutex' to true but is using the tegra20_i2c_regs which does not define the 'sw_mutex' register.
> 
> Jon
> 

Hi Jon,

Yes, this is incorrect, we should be using tegra264_i2c_regs here. I will fix this in the next patch set.

Thanks,
Kartik

