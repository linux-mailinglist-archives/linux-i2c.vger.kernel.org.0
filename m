Return-Path: <linux-i2c+bounces-14505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5FCB5AEC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 12:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02DFE3012DE8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 11:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB142DA743;
	Thu, 11 Dec 2025 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NDOveKpw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A7306B09;
	Thu, 11 Dec 2025 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453427; cv=fail; b=VBv4y94U+lZ+/YRyEIg9YHjXMA5sckbOrhgw9vSiM4FWeUToFxwQ+LbCUpd+IjFQVJFjIIoYu/a77nNc0XR4GDabkqOHcwHSnFo5t0WNjKpJt45FgdXKwaOmC3FeIWAEryNYHxdvXZmHDiJxXLucwamZcKzS6P8NFyK3c589Pq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453427; c=relaxed/simple;
	bh=ooq/+fggRIzy/LIhusiqNEDI7gCSG51gYiHKXvrWHM0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=puZ6hdQEMh29mQpVq2HNQFe3/w5nqID0UJbllzDwMb6WHpny+LIW6jY+IZbqw4QjW50HGDey6zzbfMWFGZWNnYpIAtKBAUxiugZwb22K660KvR56WQHc649CuKc60Xhsn0skLdPdPSCE367wuZ5j4mvE7JdHJSZabzLCap4UEGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NDOveKpw; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2p2I2xL80+kb5BBAA7bamPl+Ht7R5Kuh/hoMJ+tjWplY2hhRkkLqOUu1u1kv3L3jUkEN1ywWVCj6V67RplXvpZDGDzi7/7b4f65uGb5Oa+k5xp5dQwbFK6EHiYIAdLTI/83ISykd9pGYuUAT+zzkhKjFSnU76LCTLdBlwZ7LFi/guf6Z5fAaG8HwuK1qBgBEXaQPNpBctX7CtflrvLGTifNNVu0j+1BmaltlfZI/ZEdAxGBipLYbZLnXN0tXqzvN9a1gNNvDe74b3RwmZn6C1/hf3ghLeMFHrCdNv7HxpXR4BNKJvXFQMkJeCMJBwO67bg5QPGohO3XHq8E2u/Pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k37It62KxzxDGTOJNSzDpWMIehF2XUTslqS9cU4n5VQ=;
 b=buobMzUZS+nOWpn4bLPPMf4MYXr3KP7Z9U9rldCVEAYMePzoKSEajJAxl0dNJl2SCGYWOh5hpPOjUDbHmTxHWQsNaM8iXsKCOvYiROtdS9JF3Vs+iU8FSqXLkPJbO0oNDT/0knzwfXrKc5ULiShLSh6wT4xu0uHouy7cekd1I1hQF52BLLIYu1EMGI/7OHiSAtVT3anwcp1Af2wH3mVgWAlpnBb3P8oBrhxWuaazribVc+svXLDvDtapVwJkUtofxoA2Xe6mDVXdwGZtxmuXsInyJIT/igZSSIpA1dUMXImYTyaDHBBdyTyX5jZ9uFeWnCJXMn1asyT6hYRs5zBRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k37It62KxzxDGTOJNSzDpWMIehF2XUTslqS9cU4n5VQ=;
 b=NDOveKpwkXKy3U9Kfm6aar30W5WOU9bGH4QDyjgpaxn4NOaZB718ZCPOnoh/W4suUQEnOC0whkZ8lZh3Djm8vwEGwl8tec/ZF0sKDWKrmiGx5/1i40ZpHH976ElTBckgOJS+ybq0F1gnS+Mcb19QoqjWJBd53Y6YeUFWGZdSplo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 11:43:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:43:43 +0000
Message-ID: <d8c512e3-09c2-4a29-b678-56d81c942b77@amd.com>
Date: Thu, 11 Dec 2025 17:13:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-mp2: clean up amd_mp2_find_device()
To: Johan Hovold <johan@kernel.org>, Elie Morisse <syniurge@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210040258.60106-1-johan@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20251210040258.60106-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a60001-e6c4-4e19-6405-08de38aa8932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1VkWmZXM0V1Y2NsdGtUU2c0SnpnOURqUW1xVG9HQll3VHcrUEdzY3d3Mjhp?=
 =?utf-8?B?M0NPZlFzUU1jSzNKc2dWTDBOWkNEYng3VDF6MVFGVldHNzFVSnNxajdzU1hX?=
 =?utf-8?B?dThpazF5WHdaZ1RkNFltS3ZkOWJIQkxHYkdHMHpIcUZBQlhhYkQzWnNIY1pE?=
 =?utf-8?B?R2U1SXVTbzZ4UFBJY20rUjVWdEpOM3pvdWpFT0paTkZ5YkZzWldlb0VOckYy?=
 =?utf-8?B?VUxXWW5QSmlZcm51b0ZCZXBsOE5jOGpSa2kweVlLOC9nQTIvMC9CQ0RqRlpD?=
 =?utf-8?B?V3orMlFyekhrT3N3MEExZTJpdWZXeW14SGpSRXhrcTErc1Z3aWYrNlRZODNH?=
 =?utf-8?B?eUlFRU56dmJ6empiQUVTUXBaUnNhK1ZsenN0aUNtbS9wTlRZRkpMR0VMa29H?=
 =?utf-8?B?MzVYTmh1Z0lSWDViMGhGV0x4djR1UkpnTXdhUENyd1ZEZ1Vud2R3QkwxdFN6?=
 =?utf-8?B?azdjRHNuZmsyL2lOaTFKbXdwRWFqbDBOUWppc3oxTEZIK1luOE03MXNOS3N6?=
 =?utf-8?B?aEp2ZHBFZnMxTGlLMk1OR0VVOUZ5MVNnVS9hNFZESXZjdlJhR2o3a1FaTHhB?=
 =?utf-8?B?RzF2TzNaRHFTQms3NmNKaUJQc0xZcWxGbFZIcU9oYWZYZ2hYZXh6MjV6SWZt?=
 =?utf-8?B?MDRqNEo4L3NFeHk5SzBaL1A2MkpmMHFOMjRsZ3JyamZDbjUwdk5HSDU1Q05r?=
 =?utf-8?B?OGZwcFV3ZFdzVG5nQ0lGdHpmZTViZVB5UW9pbHBDRDlDZWZsd2YwdGlqVFJs?=
 =?utf-8?B?L0RHb0FzQ1M1NWJ6cVgvVUYrS3pPSUc3dWY2T3dFNWo0Wm1xUnc4dlZtb3RO?=
 =?utf-8?B?NldlbHdRdmVsV1VJKzJtU2tYOWRjZFR5MEc3K3JveWFMVUpWMTJaRGZuM3Rq?=
 =?utf-8?B?TThvdDZEbXRxVFAwcE0rb2tibnBwRjNxbVdEVTJoclQ0eWlvQy9sRnVZTTk3?=
 =?utf-8?B?TWx5QTRZL0Q4ZXBxblovb2JjV2hITlVHVEZ5cndZUVZrcEhkN3VaVGxVekh4?=
 =?utf-8?B?REdma0d0V2NMV1MxeHFoRVZqcFpGeGdZKzNaaXdnZmtVS21WNGs0N3VCK29a?=
 =?utf-8?B?RTRWVVlKaWt0cEplVHR3cXlBOUNmc3BXTTBjQkRWNjlQaEFXNEtOUFN0UmJk?=
 =?utf-8?B?d2Y3c3MwTHZMemY4TmQ2WWdkbkNORzdZc3FETEdWa0QzUFRMYVFpaDhuYkRt?=
 =?utf-8?B?U1U0NGM5N0pjZUlOa2ZGWDFKRWdJWHNqS3RFWllRL2xjTE5TVWRONGVGOWla?=
 =?utf-8?B?TkpyeWVyTmdIVlhSVzB0YUI4bkVmVksrZVVvckFMamRhSlFaU296N0hpaGdv?=
 =?utf-8?B?YW9JajBKMm9qRW5UVkROVmxubU5QQnJXSmpvVUJGeklQbktRc3FwQnlhQzl2?=
 =?utf-8?B?SXdzam9QZURBUWROU0dyVnpEeEJBcEhnZG5Ub2NzL3kxMHFsSXhkTXRUaGNS?=
 =?utf-8?B?Q3RrVDhlbVhSU2RwTUVHNnBhYkxkVDRuOGxPSmZ5M2VGMEZrNUtqVmJUUkhn?=
 =?utf-8?B?alg0VFFmUmJ6d1NMWCtpNk5yU2FmeFFTS1FCNUNpb0twSk9BeEdYVVhRcW9K?=
 =?utf-8?B?R2xFdWxSNkJKUDVISGljeWZWcWRHcHlqbkQrVmFMRnhmaU55YzJTS0VoMEpF?=
 =?utf-8?B?eHVPcGVrVmkzM2pRWmV4cEhTcTNBbi9MdVd0bVVwKzBzcnFsRW5tQ3lkc2t2?=
 =?utf-8?B?UW9qbWk1dDF1YkxCWFRHVmJxT0JKL2RnWUF5S2NlOFNBS1hYTStIbmhqZFJh?=
 =?utf-8?B?TU5vV1dnN3lwZUVwbEl1aFo2ekJxQ2NmRnpEREdyMW16YVVlV3EwajZyWUlV?=
 =?utf-8?B?cC9oSEVPKzlBSm9MNFArdU4wVjlSbmlvVDdWTk5BUTRTQ3pVVm1lVlhMK0Fr?=
 =?utf-8?B?OVdWaFJIczJ5b1loVkVuanBTMmg5S2NBWmY2ekRjR2VESnBCczNiaFpzaTVp?=
 =?utf-8?B?UWRDSlh0dGFkejRIMFlhMjYwYTluQVJ1VzZTVGwrNklFZmhrbCtjREdBU1lI?=
 =?utf-8?B?ZC9rKzIwVUFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3VkT1AzVGxSZnVLK2tRMXYrbGQ3QnVDNHFFWEszaUxEUlRJQVEwWHhCMVZ1?=
 =?utf-8?B?WE1rQUZ4V3Fsb05nWlpMQkJZZitXSElHemRKV2M3eFBLaVo5QUUxNkJvTGhW?=
 =?utf-8?B?ckZqZ3hWSHJDVjd5Wk5lQ3daVzQyNWdlSUFhcjdaQjdlbGgyWDdPdjV6TzB1?=
 =?utf-8?B?VUFhWXJtaFA5Y1NqbUJIaHQ4NXBiQlVyUkwzZGNHb0w1UWxzazNXSURVT3Fs?=
 =?utf-8?B?YnNBcVhUTFQ2VVFzMlEwYTBtbGM4SXM1WGw4c1dVZktrcUtlUEpDbm9hYUJJ?=
 =?utf-8?B?WnlWR2xQSHZTL1VYRXJBTnBxem5CUWtxSTUzT1dJa3U5aEFZYklybnhUQUNk?=
 =?utf-8?B?Wmh3KzlwOTRnbXQvZG5kNmZGRDdYME8zY3U0NDgrTi80dExUNGEyRE1QcGdm?=
 =?utf-8?B?TlEvakU2Q0Z4bGpMRnE4empaVW9wYW9PaFlnZHBOenE4cEpXL3cwdFdZc09U?=
 =?utf-8?B?TVF3ZFRYWTByUFJ2Z1RoNk5hZUl3dDl6YUVEVEtqb2JLNVBsSHVvSGhyUXcy?=
 =?utf-8?B?YjBQUGt2c0k2ZTRzUE83cjlDNDFudktzUVBjU1BCdmE0WDVzZTdBd3M1Tko5?=
 =?utf-8?B?Uy9Fa3JBWTNUNmVFbFJyY0cycGlHOFlBVW54WHBZQTc0dUdiMXdzZVFMRjh1?=
 =?utf-8?B?cDcwby9ZUmRwQUN6ZGl5Y05tbitvZks2VXhFVTZPM2t4MGFMSitUQUFVREE0?=
 =?utf-8?B?NjRRYk1Kbkw0U21KZHFaU1MvTVZWSVJhM1E2WEFBMWR4U1NoUWpQY0lod1Vx?=
 =?utf-8?B?RFdRYlFFNWRYd3VlZGZEc3lseGlybGZlQzBMMkFXcHV4TldrdXVhdURBSi9C?=
 =?utf-8?B?TGFLKzQ2Uk4vb2tMZ1hScTE1Y0MzdWRNYjJSd0Jkd2tZS2xWOEFZeER5c3RO?=
 =?utf-8?B?M2RrMU5hY21vdnc2aFN5OWU3aGE4NFZBdDhPTmFvQzBvVTN2R0ZRdm41WUIz?=
 =?utf-8?B?L2JPWHUrOUlBUmYweU1YcmgwOUNSZmFpb0lERTcxME5HVVk3RHNTQjhEOVlj?=
 =?utf-8?B?YlV0SFdCNG81eUJkMzE4SUhRRG0vVHp5K2d3SzFNWEp5SEZMSW11NHlnOXk0?=
 =?utf-8?B?RzJmSHhFYloyek4yUERKVTEyd0RWYkI5c21oUFI3OXM2bTRib2FqVExZaEUv?=
 =?utf-8?B?N1pPdVQrc0ErK3J1SWptbXlEbHNYTHppUjFEMFpRUVFmN0tDLzVqcEZvTEJK?=
 =?utf-8?B?RXdSZExWVmN2VGdFNUdrSGQ3ZjJoVzc1aU9qazIvVHdYdHdIdnBoM091eHlr?=
 =?utf-8?B?VFJ5ZzMrQzZ6MTBGTzA0dlNVWmluZk5OVzJ5NEx3TVladGUzc2E4eXBlOWNv?=
 =?utf-8?B?SHhuTnI1Unozc0lqQ0dhcTh3Unh6cUpiZEMyQmJiN2dmeitkYXlNQ3hyUEtR?=
 =?utf-8?B?RW4rWU53MG5HS1pPdU5KWHRCKy9yanRiblczQVJOYVFkL1A2L2JBYzFtaXFu?=
 =?utf-8?B?NTJPMkVUVUgwekZYenFWNE84MzJwQ2hiRHFnWmQ1dDVBcHQ3RER6MVUrKzBy?=
 =?utf-8?B?VjdlQXZkc0MvaXlIUkdiTUxiMkVVTm8vZmtRNVlVWXhydjViRm55MkJzSEsv?=
 =?utf-8?B?WEtXS05uUGhDMUZicEYzQUllVVArcmhKVmVJbmEydFk0SzZXOWlMVjJTdmYv?=
 =?utf-8?B?ckdHMVhJZ1Y3MlozNUY5ZzJqRjhEbThJNDVqNjRVU1ZjZEdYNFMvRWQwazZU?=
 =?utf-8?B?NDNnTFRyREZpcnExQ0ZFdlZRZk1vYnlLcjB1c0xBdzZTY3NaeUlncnZPenJ2?=
 =?utf-8?B?YzF3TmovbkRVM0I2cFpIOEhzVzMvZ0JtYU16d1VzdFMvd3A2VVJkZEtrV1U5?=
 =?utf-8?B?VHlPWWZjRVJtOVJoNmRSQnVtRG96L3lvdzNmcW93aFVLYWFCYk1UdkhKYVBK?=
 =?utf-8?B?REhrR3J2eWJocDV4cEpkUVBPT2ZteExqcUJ4TkNscDVBVVJwZzRtcTZmakRH?=
 =?utf-8?B?Qyt0RUR5TDBhQmpRaTZqOVBORU1UdTFmR3h4UTIxTFA1Y0FLK1lZSzhNRity?=
 =?utf-8?B?OEp2QlgxOUFQWmxGOXJXSS9WeG1jd0dtK1NyTWFpcHh2NHVKcUpFTHB1cnBn?=
 =?utf-8?B?TVl4cHdNM1NmODFuY2t5YUlBc2NmQ1VQREIwS05SdjVlSG5iNHI0M1VSTy9w?=
 =?utf-8?Q?lQ5ho5bBgj78JQcCbbvL5vBzV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a60001-e6c4-4e19-6405-08de38aa8932
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:43:43.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGXOdccxgD/jVH6vuRLOseSsAlQPZBTKZDL0ZRtOg9sV5Oql5p3/uwxAnVMMyTZxwuPm4LAn8QPYGmnpIHh2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487



On 12/10/2025 09:32, Johan Hovold wrote:
> Rename the driver data pointer for consistency with the rest of the
> driver and drop a redundant cast.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> ---
> 
> Changes in v2
>  - rebase [1] on current mainline where the reference leak has already
>    been fixed and update the commit message to reflect that this is now
>    only a cleanup
> 
> [1] https://lore.kernel.org/lkml/20251121113714.4080-1-johan@kernel.org/
> 
> 
>  drivers/i2c/busses/i2c-amd-mp2-pci.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index 60edbabc2986..5b41d18b62d3 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -456,18 +456,20 @@ module_pci_driver(amd_mp2_pci_driver);
>  
>  struct amd_mp2_dev *amd_mp2_find_device(void)
>  {
> +	struct amd_mp2_dev *privdata;
>  	struct device *dev;
>  	struct pci_dev *pci_dev;
> -	struct amd_mp2_dev *mp2_dev;
>  
>  	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
>  	if (!dev)
>  		return NULL;
>  
>  	pci_dev = to_pci_dev(dev);
> -	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> +	privdata = pci_get_drvdata(pci_dev);
> +
>  	put_device(dev);
> -	return mp2_dev;
> +
> +	return privdata;
>  }
>  EXPORT_SYMBOL_GPL(amd_mp2_find_device);
>  


