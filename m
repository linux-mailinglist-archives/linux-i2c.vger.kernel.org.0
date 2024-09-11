Return-Path: <linux-i2c+bounces-6588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD379758A4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 18:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A756F1C22D4D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42CF1AE86D;
	Wed, 11 Sep 2024 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dd+8o5Jb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14841B012C
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726072678; cv=fail; b=GRogCALuaK3RWx0XX80TIyjFhWLPIcFlSKImhNtdyRm92mYUjiirmVhIAJ8vJ514IcK/gCNR2QJk9mKBMk+fBpYeVRjL5RZ+0Xeea7cwMthXYs751OJXHEP7aPKHngZbr+lwTJ4MsYFyQEgLCIP4hF05EW1ghQdVOqJ6nrwz83o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726072678; c=relaxed/simple;
	bh=yIHazgmtS+f9gnQIWh3+kDVlqdobcw+xdzZs6MEXjVM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=askiyqTc0YUJLU4gOqoxuRC6/LGFJjpnMBYaka5KvLZVXYwG01OFMZMG6CWNFCiIj8v2ycYWvWzB4QmZEuandVjZjrzCZmp2URhGp+WvmJ3NwFlW/eiqwxysvSGIBjik4hIspTFRSe+29a3tVVLvmiXw+YTlPxambFkhxtmpCsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dd+8o5Jb; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTTJoENO2LJ8ipbnzcX3idkM+B+VACiCv7D5QWWOm2zHDIDq7gP1GRQRYff5Oa5gTtztz2YVO4RiCfD/Lg656XYUi0reD1rh4+sfqIGb2DONtGQzFhcr3G705i4SKeh/pUBXGgfwNY3lEuI3jNDQvFrOXn7Exz56JFb/LOuARCIDQom2g/kFTGvkKGOSVog9g10MNUJxtUS9Hg4YHnA3tRlMluu8RB4Xc8d+EZrfBjhoTDoQdpYCn776lq95RAR6Nvvyr7BMbCo+OoaScmL8orHA8nFfvgMAfw5Lh3DgM/UTRBdqZrGhowPT//QYJRoIbyQsz6EG15hiVOfHH9UXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHjLAqKo/kvv10g9eXJvmJRC2as0NgAI1vyMkB8/fNo=;
 b=hJcj2gRIXh/qnxpYKk/+aFRrEbk8iv3LkxKVGgtzE4YeaCoOaqiQsK+pJMeDKkhNpwYPLWFtQumCj4Z/Y+DlbBOpmkZGPZy/Sfw5Qsu+yE+K0gUbTls1hWF5yUseRAnErJpTr+rjD5YNmd8x2fVK8NV++qWX3B4HmTVLDkijnaD/8ZvXmOobZx4BnyG4/P0u1h9JvbDZO1YtZsxEVjPMn1GkAUVL5n029rzDAKOoeIn3vogFoLaT05ziz39ygFI+o5XEjhEA6SuLf3NGBRPdSt5GSKzbCvVFRhcXcZC076ZGUwjXl3QDY5shJnkfZWqLtMEbOnNrYmCsVxqHcA+TkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHjLAqKo/kvv10g9eXJvmJRC2as0NgAI1vyMkB8/fNo=;
 b=dd+8o5JbDL32CAxFYW3UlMnpOTKlPfG6KO+N7s0p7070G5WnbEqq7H8+EKDpWH1WjRUFGMJTxqhTsO8fwGbLgavBIMTP2GqlQn3Mk5DcLEm9GRx3XdWT53ofAeaJ4Z/Yi/OJ6RgHw265fCYRWiUqgbik18PTUc5jib37nOv5aSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB5640.namprd12.prod.outlook.com (2603:10b6:806:23e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 16:37:52 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 16:37:51 +0000
Message-ID: <d80434a2-d997-4db6-aff4-14211612f2fd@amd.com>
Date: Wed, 11 Sep 2024 22:07:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-5-Shyam-sundar.S-k@amd.com>
 <ZuG0R6rLes_s3lWt@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuG0R6rLes_s3lWt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB5640:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be8292a-4b82-4071-97f2-08dcd28013a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXREQlBwQTVLQWtONk1ld2hiSk55ajROSzJTZG1kVUo3ZUtZRUxEcWM1OTZp?=
 =?utf-8?B?VEdDVlpLZTF0WXBLRzA0aEMzMTNWM21lR2pHWUlhRDNvaDNCcm9WZFQvaWUy?=
 =?utf-8?B?anBaQlFOR2g4TWtkVTRGeURoS0JZVktqNFBHbU9neDIxRUlyOS9BbU9BaW9z?=
 =?utf-8?B?cXNsbHJZYUpHdTZqbSsxQnZVWGprdlhQQmlSVHo4RDJhQXdZRmVaTUl4SlUr?=
 =?utf-8?B?REdhZll5RXZhcVFzMXEwNEVLWlg5Tkd2WGhSTWZRbFZoR0tMblRKdG9SNnRn?=
 =?utf-8?B?Q1hOQ00rY1ZQTVJmNHJ6SkVDWHFCT0lYSW5UTVNQdEx2MDhTOGROb0crQ092?=
 =?utf-8?B?YUxKSjdVb2JseGNld3lybitNZ2p1UDAyb3BDNmJxYnUvMit0LzlzMTNoMTVy?=
 =?utf-8?B?NG9LT3cwandiVlRYblN6YmpjQVdZeUlWUUxCeFZXQkxPV1dGdmlDb2Myc0hx?=
 =?utf-8?B?MXdlZlBOZkhRVVp2YVFmQ0Z3bkNZaDZQdHpPak9SZllmblNuMmhXMk1jbjB0?=
 =?utf-8?B?aFVBREdUWlFJeVI5YjBrNUZMbFIreXVmU2ZJOFQ5WFhxd2RqZGd5RHBmYjhF?=
 =?utf-8?B?MUhJZ1VxeVcreVdpMGRnaUxtZlptek1iWitXMzk5Q3hXYUprZVRpeURkZDJr?=
 =?utf-8?B?aFZTdERFaG13QzhKeXdmSUd3K1RhWXlFOHFESUZyTjRsZU1DRFl6Tmt2ZGF2?=
 =?utf-8?B?UmljVmtlZ0IzTGR6RUVzckdsZlNxcDB1NFRKa3MwaVlvTU8xSDBVSXZIVmN1?=
 =?utf-8?B?OVJ4QWhoUnFLcHU1Y3ZCakw5L0JFY3A0dEt6Qzk0Q1BmdmZsY2JPbVhhUGZl?=
 =?utf-8?B?Q2p0NVR6WERVOUxWRUJNQkdReG1ic3VkQ2dPTEkrT3R1dWQ2NWpROGJ6L0lJ?=
 =?utf-8?B?c2tSZC9LbHFJWmwyUXBmRG5BSTU0eG9sYVIrYjBkVFdSUGRDV2I3U1E2UmFR?=
 =?utf-8?B?RjFKOFdMdWZ6UEs2VG5VZU5EVThrQkJCZVlyS08wdFdMNDN5UXVxWUhRK0Nl?=
 =?utf-8?B?K3dVMmx6d0ZoeWt5YW5HK3lSV1dsZ3RnUWhNY2wxY1JDL3l0cnF5dFVaS3kw?=
 =?utf-8?B?L3dMRlk4ZVJtRTQ0LzZCL0dCY3NDL3JKZXl2VzcySzdNY1psbGJCUUdFRTRH?=
 =?utf-8?B?U3JnR0dRa2FQTEVpYjlrWVJHVXc4Z2xGWEdDYWRTcGNCVGNwNXlPYzR0K3Jo?=
 =?utf-8?B?NzYrdWEvdFJrcFRvdWJnQ1IvUllpYVJTTGlJOHhaRWNLbUM3VWxjSFJMbHND?=
 =?utf-8?B?akFvOGFXVGpNaXpMQ1JtVFhRSlNmbnFjZEpqNi8zQmRBenFUVjdpN1VaTjlQ?=
 =?utf-8?B?dDdkbkhaVElBMU5wNng2UjdvQTNrZTQ2STExbkJ0eUpZNlN1cyttcUgwMGNU?=
 =?utf-8?B?UTk4bzRnc3FNSTB2QUxtS2UwOHdMRnVqYnd3TXdLZlFLdjNzdHViRjdieHNF?=
 =?utf-8?B?aGpBL3QvOFR0SmFwTXozL21wcnFxWmhYQW5lL3YwNUdYTDNhVmdxN1hqVWcr?=
 =?utf-8?B?Wk5JdHVUQmhZaGdHajJwcTZyTHdFeGd3OFJFU2g1T1paMDMzVklnc1hjSmdt?=
 =?utf-8?B?RTZvaEpabUR2eUcyUzFnYU0yRVhzbUpyT0xmdGdRM3lhcmpEMERHVmpOOEVx?=
 =?utf-8?B?dXRMTGtUaUk0Q2Fscm9nVEZWMVpCRlowTXhiRm12ejVBbGlUM0JGaFZxTkk4?=
 =?utf-8?B?R0tETVBRWkZ0dlc0NFU1NGphMG5lS1RaRVNJSVFOYmNpL2Z0RGM1RFY4T3NI?=
 =?utf-8?B?NUNqMWRWZ3JueHprZWZaL25DRWRwclZMMXdxcFVFQjBPNGRVSkl1UkZ5QVpZ?=
 =?utf-8?B?dTNFTXNjVWFwdVBSOUE2Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ay9WS0hLK2R3TzZDbCtqaVhzeTY5Vzk0a0FQK0RnZndYM0NkTDNaUDNIVVpw?=
 =?utf-8?B?U0RPU0FzbE5iMjZFZ1MrT2o1QjlFT244TGxDbjVFVlJkRnVEK2l1YmVyQ3ZY?=
 =?utf-8?B?eDBYb1RVYVdHKzlrV2RZMTBuYjZQQndaR05IVXQrTHZVbTRrWjZ5Qk9xMmZ2?=
 =?utf-8?B?djNuZERGK2hSVk94dkdzSTcrRG5tNkd1ZEE0bGZmUFQ2SEZtYi9aamE5K2Rs?=
 =?utf-8?B?eExLTEkxTk9lRXJDTlFsTnJEbU93Qm5MbjRZdlRsY0xLMjVGZ0ljNjBhN2E1?=
 =?utf-8?B?REdVMHM1OTBhVEt1bGFBVFdBSnJZMFk4bmtlUGdSUkdXMm1JWTRvOGJNSHhN?=
 =?utf-8?B?Y1NIczI4ek1kcitLOUM1Mm9UTW1KaUtJQS9VdGgvTWVDdFFyNEd2ZzZ0RVZu?=
 =?utf-8?B?Q3JCZjZnOVNjWTQ2V0o4T0ZIa3ZQMG12azNyOWdrdm5XVUJ1dFpsNG9tOTJU?=
 =?utf-8?B?OWdZU0JnWHdzUnQ4OU1Ua1BvVWhjZXFnQzVwSThtRzlWSXVnMEE4MU5MaCtX?=
 =?utf-8?B?SXVPb1RhZE1BSU5mcU5hK05kWXJrWnBYb2NJb3J0YXRXNElWSWpMNkJsM3VH?=
 =?utf-8?B?bTB6QVVGZlUyRDQ0V01iV1IvdjI2SHcwSU1uSWt3cE1zOEkyR2VLMzQ5Qjk2?=
 =?utf-8?B?NW5Xa2hHcE9RUTdZSXFmR2UxYkk0RmdKd2libWo3MDh3bEx4WDc5QzZFU0N6?=
 =?utf-8?B?b29jYUxtN0ExNnppREUwQ1NoeVZFeWFxODZrbW5xajlMcmV1REUxTithcjJG?=
 =?utf-8?B?OWRyeHdZUlFodVltMWFEZG4wb1pJa3JZQnMrLy8wUmRJTVlNN2VNbm5Jcnov?=
 =?utf-8?B?SjU4TkcwYWNyUVBsQTE4aUlrWnMxMi80ZUFKU21sb2ZMZW80R3lqNkVjamY0?=
 =?utf-8?B?WEpZUWxZVVhUN2xlbGRwMlY4YVNTWGQzVk16akRFNTBWVEdaYitBL0x6bEVh?=
 =?utf-8?B?K2o0cEo4QjlqM0gyM3NyZ2d0Sm84VnY3VEhVNWhiRzlRakI2ZkxMbmtuQW1y?=
 =?utf-8?B?cnk3THpFY1RWdnQ1K1lMbDIvT1JZOFpRbkVEZ0pJL2c0VnNOYzJQa0JvQ1Vq?=
 =?utf-8?B?b201QVYzcFJmUDVzZGdEQUFFOXJlMDhuNFdoODdGWTJSaFZFc2FBTG5RTXhY?=
 =?utf-8?B?UnZhZ2tZSTMyQXJEZTd2OHpwOHlJSFdBeGh0d3ViR2VPM1h2QlFQTGJCZ0hJ?=
 =?utf-8?B?S1FDOHdyRFNhcjV4NE5NNHJYaytkYzhqbjU4dVdxcmttcVV0Yk9BZC9aM2pT?=
 =?utf-8?B?bzVyVE12bzRJZ3daK2ttdnpLOXFDeGdhQmc1d2ZDcWZ0ZlJhMmhsUmxLOGs4?=
 =?utf-8?B?NlBNblFWU0VYZUhSc2dLS2xNZHR1bG9GbXdtMnMrOFE3UFh4L000SFZwTDB4?=
 =?utf-8?B?ci9TL2dkczBTR3lZUTNxNllTWjdUNGlENEhhZFBCaU5EYm5meUhtN3RCUmJw?=
 =?utf-8?B?Q2xDbW9US1RwZ01hUW5aaFk1eFk5NFdndnJrdXdYNjRGdTV1bTh0S0c2aHRW?=
 =?utf-8?B?OFRkUTNOVmQ4NkZhdVZkWEY0eHNsTzQvNlZQQnR0SjJLVFdYU0hrN2lmcDE3?=
 =?utf-8?B?UWdRZWhmcDlZZ1ByY3NPNDFRWXlUN09IUnNpVTVETmRkdnh4VTl2RHBQUnlM?=
 =?utf-8?B?RkltMGRWNE5FVFhvSHNWeUc0MUpyRUVwdXZTc3V4Y2lUUWFOQVltVnk0eVUr?=
 =?utf-8?B?d3VtdVlySUlGTTBhWXM2T0hHTnRCRDh1bzA2dW5hOTB6QklwR0swQnMrUksy?=
 =?utf-8?B?UGFPMVdjeGtXVERtRVBmZWcwYU4rSEo1RXpTdXRnbWxnbGxwZmhtZDBoQ0VJ?=
 =?utf-8?B?Y2ExOUhadUN4djU1QXlObGFDUDlhVE1NNXBMSVBiUDZoVEN3ZkVVZm4zZWR4?=
 =?utf-8?B?bEhuTkczTUxiMlFaNWFaRDNUazB1amlvbzVlQWFjVHAydjQxanNLTVF5ZzR2?=
 =?utf-8?B?a2pmNWtYeXVDZ3lRblV4Y1BXOWpkTmlMN2p5anZRNlhJUVFMMnhPNEpUMDhi?=
 =?utf-8?B?aUl2cXQ1bHAyTzRQQ3pxYWxkSXREaFR5UHRFL3RtMmN5QkJNd1RCTnZkbTRs?=
 =?utf-8?B?cTJmNkpxMXNrR3BjM0RFWStnbjRIRVgxQjlYN3Nzek5tNHRHaC9NN2hEaitZ?=
 =?utf-8?Q?0aBksJOqZRhHbb7vajTYjqVPX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be8292a-4b82-4071-97f2-08dcd28013a2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 16:37:51.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqB6Yvvre/72CDG5xtMOfFwStxO/hxpeyXe4wh6gzyKy/MJpf30r0elxpwIn3uBL9zaWxjXPgqlVPLf8PBSmwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5640



On 9/11/2024 20:46, Andy Shevchenko wrote:
> On Wed, Sep 11, 2024 at 05:24:03PM +0530, Shyam Sundar S K wrote:
>> The AMD ASF controller is presented to the operating system as an ACPI
>> device. The AMD ASF driver can use ACPI to obtain information about the
>> ASF controller's attributes, such as the ASF address space and interrupt
>> number, and to handle ASF interrupts.
>>
>> Currently, the piix4 driver assumes that a specific port address is
>> designated for AUX operations. However, with the introduction of ASF, the
>> same port address may also be used by the ASF controller. Therefore, a
>> check needs to be added to ensure that if ASF is advertised and enabled in
>> ACPI, the AUX port should not be configured.
> 
> With brief look this is much better than the previous version(s).
> Thank you for rewriting it this way!
> 
> Some comments below.
> 
> ...
> 
>> +#include <linux/acpi.h>
> 
> No need (see below)
> 
> + device.h
> + errno.h
> + gfp_types.h
> 
>> +#include <linux/i2c-smbus.h>
> 
> This should be i2c.h
> 
> + mod_devicetable.h
> + module.h
> 
>> +#include <linux/platform_device.h>
> 
>> +#include <linux/slab.h>
> 
> Not in use.
> 
> + sprintf.h
> 
>> +#include "i2c-piix4.h"
>> +
>> +static const char *sb800_asf_port_name = " port 1";
>> +
>> +struct amd_asf_dev {
>> +	struct device *dev;
>> +	struct i2c_adapter adap;
> 
> Make it first member, it might help if we ever do a container_of() against
> this.
> 
>> +	struct sb800_mmio_cfg mmio_cfg;
>> +	unsigned short port_addr;
> 
> What you probably want is to have
> 
> 	void __iomem *addr;
> 

I will address the above remarks in the next patch.

I believe this should remain "unsigned short" because

- it is defined a unsigned short in i2c_piix4
- this is just a port address (like 0xb00, 0xb20) and not a real iomem
address.


> and use devm_ioport_map() somewhere (see
> drivers/pinctl/intel/pinctrl-lynxpoint.c, for example)
> 
>> +};
> 
>> +static int amd_asf_probe(struct platform_device *pdev)
>> +{
>> +	struct resource_entry *rentry;
>> +	struct amd_asf_dev *asf_dev;
>> +	struct acpi_device *adev;
>> +	LIST_HEAD(res_list);
>> +	int ret;
> 
>> +	adev = ACPI_COMPANION(&pdev->dev);
>> +	if (!adev)
>> +		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get ASF device\n");
> 
> No need. You will get here only if enumerated via ACPI (or if it's out-of-tree
> board file which we do not care about at all).

Not sure if I understand your comment correctly. But I used
ACPI_COMPANION to retrieve the acpi device that needs to be passed to
acpi_dev_get_resources(struct acpi_device *, ...) to address your
previous remarks.

> 
>> +	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
>> +	if (!asf_dev)
>> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
>> +
>> +	asf_dev->dev = &pdev->dev;
> 
>> +	platform_set_drvdata(pdev, asf_dev);
> 
> Is it used?
> 
>> +	asf_dev->adap.owner = THIS_MODULE;
>> +	asf_dev->mmio_cfg.use_mmio = true;
>> +	asf_dev->adap.class = I2C_CLASS_HWMON;
> 
>> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
>> +	if (ret < 0)
>> +		return dev_err_probe(&pdev->dev, ret, "Error getting ASF ACPI resource: %d\n", ret);
>> +
>> +	list_for_each_entry(rentry, &res_list, node) {
>> +		switch (resource_type(rentry->res)) {
>> +		case IORESOURCE_IO:
>> +			asf_dev->port_addr = rentry->res->start;
>> +			break;
>> +		default:
>> +			dev_warn(&adev->dev, "Invalid ASF resource\n");
>> +			break;
>> +		}
>> +	}
>> +
>> +	acpi_dev_free_resource_list(&res_list);
> 
> Now this is a duplicate of what ACPI glue layer does. You have these already
> available as platform device resources.

looking at drivers/acpi/resource.c acpi_dev_get_resources() mentions
that the caller should call acpi_dev_free_resource_list(). Is that not
the case?

> 
>> +	/* Set up the sysfs linkage to our parent device */
>> +	asf_dev->adap.dev.parent = &pdev->dev;
>> +
>> +	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
>> +		 "SMBus ASF adapter%s at %04x", sb800_asf_port_name, asf_dev->port_addr);
> 
>> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);
> 
> Is it used?

Yes, in the subsequent patches.

> 
>> +	ret = i2c_add_adapter(&asf_dev->adap);
> 
> Use devm variant of this casll.
> 
>> +	if (ret) {
> 
>> +		release_region(asf_dev->port_addr, SMBIOSIZE);
> 
> Why?
> 
>> +		return ret;
>> +	}
>> +
>> +	return 0;
> 
> 	return devm_i2c_add_adapter(...);
> 
>> +}
>> +
>> +static void amd_asf_remove(struct platform_device *pdev)
>> +{
>> +	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
> 
>> +	if (dev->port_addr) {
> 
> Redundant.
> 
>> +		i2c_del_adapter(&dev->adap);
> 
> With devm this should be removed.
> 
>> +		release_region(dev->port_addr, SMBIOSIZE);
> 
> Why?

My bad :-( Will remove it.

> 
>> +	}
>> +}
>> +
>> +static const struct acpi_device_id amd_asf_acpi_ids[] = {
>> +	{"AMDI001A", 0},
> 
> 	{ "AMDI001A" },
> 
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_asf_acpi_ids);
>> +
>> +static struct platform_driver amd_asf_driver = {
>> +	.driver = {
>> +		.name = "i2c-amd-asf",
>> +		.acpi_match_table = amd_asf_acpi_ids,
>> +	},
>> +	.probe = amd_asf_probe,
>> +	.remove_new = amd_asf_remove,
>> +};
>> +module_platform_driver(amd_asf_driver);
> 
> ...
> 
>> +	status = acpi_get_handle(NULL, (acpi_string)SB800_ASF_ACPI_PATH, &handle);
> 
> Does it compile with CONFIG_ACPI=n?

I have used a explicit 'depends on' ACPI to this driver soon that LKP
does not complain with a randconfig.

> 
> Also don't you need to include acpi.h for this? Or is it already there?
> (I haven't checked).

acpi_get_handle() is defined in acpi.h.

please assume the rest of the unanswered remarks as "I agree" :-)

Thanks,
Shyam

> 
>> +	if (ACPI_SUCCESS(status))
>> +		is_asf = true;
> 

