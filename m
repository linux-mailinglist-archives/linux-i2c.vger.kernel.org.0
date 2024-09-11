Return-Path: <linux-i2c+bounces-6590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A0E9758E6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 19:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24A7BB22A41
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1F21B1507;
	Wed, 11 Sep 2024 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jyFWZtTa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE031B142E
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074004; cv=fail; b=Q5jOwNJ4J7ngchhXG4Poa0NiVEjVs0l+ibUNgq29QVfBedc2L039nfdmA/yL/qFhtcWCHpaFxIiN0kjjCPYz/RxXVSTfKPsj6qajkqeglQsh9KpsUipCxFAvF5ZWVfP1Uvc2Hy8Tg8lJatN7nKCxarrIC8B7Bw5tyGGmxWMGgDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074004; c=relaxed/simple;
	bh=qwzxW3C1zvZakp1wURCC6nT4gOqOyGjw8RZ5Skyut14=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B1GawegMKDRcd/rrJ5kQeJVVlbXmX2xlg78e3MYScM2JjU4oiyTWjYaTHbM0KAicxfWqo0qrdFq5oRj4vUyLLfOqH0JPn/78crYVcLzYAjW4llpJJYw2LdX1CtfDbVGRsMw2dbZdpTnxTUxr5mwk+UIWI5Kydtu6raDwCaHDcrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jyFWZtTa; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbC3ghEvF8HOOkHAt5RlDonDrUHCFtP+Lo5nK31nx+EthGsZ6glcBimEJpGCCClXKgihqafq6HO0AN0TbVdNxTsX0XdQuHafPyoh+LfhvDy9rgv1YUfwDatDmmMbnVun9QqaVRckcyyhph1GZurnxhvaWVXZk06YMXrjqGUV15iFU+NzpDEhP+BBUG00e/7vlwyxrJo+2gsylUKt7/iihKyNqzOeQKNHAklDOe4/BOA4z92kdan6Id7uF1syANeg0Mr87Wcx+d4OPy7jQ4Zi1fq2uhMX4c7DjMh+31zdo3aoKk/BiNmgBfHdVSmqGtn4yJRB+VPYC1hGbJ78TMxltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyyxi0t5ixyNLwPL468y+laO6TefCT2A4q01qPbhb+0=;
 b=CWOWR51ZmPJ8mqYayEkt1kpCduSibzyQnJI7AJASdwntfgfzwM8cZclE4BnEHH3TNf6EERXdNs/HI56rvkSyYqxUQYIlJFz5qzfYZqk2J6T+Sts7ZUnUmSnbhXUeAcmWhyU/YLpo46eULA1SO4C2zGNi8y0a8adKVaJ88SdMPx4/M4Qkqb2eUBaWl0+SduJUR4ih7+gsv5vQd2p5+8El6+jnsBRV3UwFFNgcKjr+veGOdPIDnQggYtRQnjYyNgmpgWNxxwZwV5bLzER+unuDgfc0CP4QTLrulL76pOctXF3m3VldOBcRexBAzvH9PSSZkjxmtDvQFyBMJ+EICb2U4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyyxi0t5ixyNLwPL468y+laO6TefCT2A4q01qPbhb+0=;
 b=jyFWZtTa05Wafh8adGaecLWhEUxlMfbp+xzkGx5UGL39fKH/nfBR7pH0BhTQRpw+ifQczRAzFOZtLiBvBHvAd6UZwKXawOmQ3YuDWI9coYp7OPkPECQODe3du7cuUqEHSdUUteZsjOU7jdUr0HKjGBXg1E60H9Yr0ix++D21RGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 16:59:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 16:59:53 +0000
Message-ID: <62936d90-51e2-4aed-bc06-ba3646bf9a1d@amd.com>
Date: Wed, 11 Sep 2024 22:29:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-5-Shyam-sundar.S-k@amd.com>
 <ZuG0R6rLes_s3lWt@smile.fi.intel.com>
 <d80434a2-d997-4db6-aff4-14211612f2fd@amd.com>
In-Reply-To: <d80434a2-d997-4db6-aff4-14211612f2fd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::25) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 013783a8-0d70-4d28-310b-08dcd2832783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTRmUDNxQ0orRkVhTWVLWHQyRk5XYkNMNVc0N1BObTIrRTFKSEh1WG1rZldi?=
 =?utf-8?B?UGdOdkhFUDdrMTQrU29OVE9wT1ZRWFhmTUxRVTE0ak9IVkZRL29rZ2pNRm51?=
 =?utf-8?B?UHl6VkZCdTdiUGtPc3BwbjY4elNqNnBRU0wxUnRkZ0VLR0lrRGdWNFhGM3d2?=
 =?utf-8?B?U0lQUnVndExEVjZtM0ZhWi81ZTdKdlI1cnltUWF1QmRMSzV1Z3FuNmd1WnVy?=
 =?utf-8?B?RFJMYzI4KzdGNTdBZUdsV2RtczlNZkJHQlZZTFN5QjNyWmRsL3dlTGxWUzBo?=
 =?utf-8?B?MTBxVzVreXluR3VpUHYxWC9hWkQ5dnU4M1RNUXhWQmtvakgwME5wS0lTamxO?=
 =?utf-8?B?SUsxNlRvQjJLQ2Z4cEdwL0ZQVVFEM0gxSmFmMzAxMzlZR1hzTHlBRnpoeXRF?=
 =?utf-8?B?R3RXeHcvUnBTYkZsTS9hRUNqZ05mUml1ZDZ6bXcrS2lwYmp2YUxqdzJ5NGpK?=
 =?utf-8?B?QmJxWVVYdWhSK1JjM0d2ZVdxbHdjS1NZcS8xZG93NHE3RE9ZSm5BbzJSdk5K?=
 =?utf-8?B?cDhpUkVxU1lyMjRaWFBxeTVoQzJuY3pia3F6bU04SjJhZkFRMkxnd3lSclow?=
 =?utf-8?B?Ym1PK1Zrd0dHcVdOemhqTUQ0cW5JT0dxWERzUHB1dC82aTZYUmJITzVBZjV4?=
 =?utf-8?B?MTA4bUkwOW9ZS0Zab1Q1R0M0UmhXalVFUVZWREIrN1ZIdTc1KytqYUYzUHVP?=
 =?utf-8?B?Q3lXU1lCTkJoK2Jlek1xZkdob080THNkL3VMQVBKYjI1WjVNeCtXRFpHQzVZ?=
 =?utf-8?B?bFh1eWFhZVFickozc25JcW5FLzMrMkIrbzAvaUI4Nml6djdVQW9FYnpjd0h2?=
 =?utf-8?B?NlZXUG04dW91WEpMdTZCU0dMQi9LZmN6N29yRmI4Nk9MZ21EWXpSdDMrb1Br?=
 =?utf-8?B?aGlWRkFUNm9MU3NwSkdqNGcyZnRwZFZpUnkrek44b3pDc2N5ZlUzYUVBZElX?=
 =?utf-8?B?WGkwWVhzZTRRUGs4SStVZkdoTDFwcWhhQ2swZFdrcTByZnFjSGtma3Jja0Uv?=
 =?utf-8?B?aXROTitQMzNaZUNBOHZOVUxhODVwVkVaOEt0dm9rZXo4SHNXazZ0RVBldmkr?=
 =?utf-8?B?eDg1c3gyWGQrSVVidTNDSzdwMkdaRTlSUUExL2kxa2tReU5LUnhvRnZFajNi?=
 =?utf-8?B?M2toZVRUelliUEt1YlVmM1ZMb2Rsa1QzOFBNWFdST0F3KzEya1RKUWVONlBN?=
 =?utf-8?B?c1cwQnhIMXUyYStVb2xvY1pyQUN0N3RLTXQ2MFpXRkQ4RUt0MDhZTk5BL3NF?=
 =?utf-8?B?c0R1d0kwbWRicGE2QVkySEpRajlhN1RJcXVOUWhVanBGL0JxTW9NcmxTQ0NB?=
 =?utf-8?B?QzUvb2FPMW9Va2ZXZ1B6eWZsWGRnYk5SanJqN1JlVzdZRmRpcmpsQ2NTeTNI?=
 =?utf-8?B?U24xRTB2dUYxQklqRU9ka0tvMkw2Q0gzMVNabXlRKzBLRVRCUlpWWGN2NGxS?=
 =?utf-8?B?OU5LcVJTek0zVGgvQXVBVDhPR21NMHFrL2tZS0ZXZ29yVStWYktLVTZpZG1Q?=
 =?utf-8?B?ZG5SeXNtUU5PUE1zdnpFWi95RVJHZURZQVVNWHlDcTlsRzg3SDlmT2J1bXIv?=
 =?utf-8?B?ZFZ0VWhIYW5aSWdhNHFua3E5cSs5Q3dlY0ZneXBJZFlKaWFxWGhxK1BSOTIy?=
 =?utf-8?B?VmdEYzF6dk0rWm8rczF0ZlM4QzhQdjZ6MklDTVRaU09keW54eE9USlR3TmUv?=
 =?utf-8?B?bitTZXQwTUJOL3hzeEV4eUxnQlU0RjZ4K3ErQjRUcjhIME1PeHRBS0VHbklt?=
 =?utf-8?B?Q2hxSy93ZjBKYUZxNitNY2tPdGpnWUFBSjF0T1J2K09TM2E3OEFFT0N1a0pY?=
 =?utf-8?B?VUIrdHM2N1EvOFJSREJwUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0h6dUtBRlpRWUkwV0tLWC9UYUo3eXQ5MUJENW5OazZkZkdKTGFzWER2Mm9U?=
 =?utf-8?B?RWhOd0V4VGl0SUxWM1B3SS9OZlBWN3E0VUlHa2w1SHg2dVkxUHBOMEg2L0xr?=
 =?utf-8?B?ejNqSWtvV3R4SjYxRHBoMDAwSGhwdENIY3JvUHpUR3pRdFBMNlFhNE9ub3Fl?=
 =?utf-8?B?N0toZ0tyR3FZVG5hclhtN2QyRTVNdXoyaTZnQUx0Q1A2b0xhcEE2OXd0cW51?=
 =?utf-8?B?Vk5vN3BJODhhT0lKTlBZZTl1MXkzbkdMQ2h5OExSMW5PT3NLaEZHbHR1WFFa?=
 =?utf-8?B?bDdZb0ZvTHR3NUNVcFIyOE1tWFlUcjRBR01KT1ladG5lbmhXajdYMkxMMTI5?=
 =?utf-8?B?YTduako0WGhWeGhKWXRsZStLUmZqTmE2d0VLYUUydFo4bjhXdjZMZTVHQzhl?=
 =?utf-8?B?Z0QvdGcvc3NrVzFyd3J0ak00dGdySXNwZkIrL1kyNXk2YnUwbVoxWjZsTVpV?=
 =?utf-8?B?RzgrNlhRa25iSDNwTDNZeWF0VXdwREVXdXRNc0EzVzV2L2YzaWg3Q2FUR1Nt?=
 =?utf-8?B?UXhYQU5STzJkNkxjQkRMR2pBRzc5aDBqK0xPbGJmb00wTXFuT2FXdGVJdlNG?=
 =?utf-8?B?d2grcmpTaGNtVml0S3FJNEkxM3FFUTkwNWtlYlBhV3VhVXIvMmsvdFp2bzlw?=
 =?utf-8?B?OS9FRUlOMWhtM0RERXFmNlowN29oa29XbVNkbUVHbGhpTHNIVzd2aE9xKzA5?=
 =?utf-8?B?aml4WXl5Zk1aMlBQUDgwL25PbEJDK3VSYlJ4YWtkZStRdTFWTVd4UUFTaVFi?=
 =?utf-8?B?NU0rbmlER2VibkJPQjZxRGVpL0dPeldraDdpek8xMkxrOFpBOENLc09rSmZk?=
 =?utf-8?B?Y2RURXhhQzdYZ2h2RUZTbTJNSms4dWppZllNRXlGdEJ0cHRqNTlkS1p6YXZF?=
 =?utf-8?B?Q2pjQTVWSXU1V01Ba29BU0VJZzJ2SmljS21Qd2xtS3RZTFZDYUE1VllKeXE5?=
 =?utf-8?B?TVd5RjR3ekt5bDVFeXB4L08xa0hYWU10TDBydzViS2VNNm5mYlRONHorV3hX?=
 =?utf-8?B?Z1lGQTk1S1NHbVZiUTRQRmtXY3hLZkxLaUY1dSt1MEh6SVJGTTJhUVhCWE1l?=
 =?utf-8?B?bkJNam1OR0hhZXUzM0J4MkM0R3BDQ3pDRFhGSCtsQ0FLcy9BV1JEaUZtcWNR?=
 =?utf-8?B?eHZibC9yZkhFQjZSMVNWSGtjaHpIVGJOSjYzbE5ESzBRdGdDK1lyUFR3ckhV?=
 =?utf-8?B?T0k0TG5nRnk4Sk9LNkZST2FOU0RLVXVVNGJpbzQ3bS8rVWExSGlVWVdERVIy?=
 =?utf-8?B?cW8zTjNDWE0yUXZwdW1SNUpoc1lSRG9iWUZPVzY4TkczMWcxNlpXbnF3Nk5z?=
 =?utf-8?B?NjQ5a1JrT1NZc0F5V3d5Y1dQeFhNV0R0aVBmVlFBa3RxaVRNRldKUlcvVkdO?=
 =?utf-8?B?TzlKSGRZaVp2dit6dHFqbit5VVlwcWpnQmZTSzlTOFlkRm5TbklROGZtY1FW?=
 =?utf-8?B?NUU2V0tMYW1oR2FCTC8vU2tVeWVmMUJRaEFHbFVEUEhVdXFWd1Y2TnNnZmpy?=
 =?utf-8?B?Yll1RDdpVWhZTlhBcjBzVmxFNlNDMHJDWk16SllLMy92ZytQNjlvTVp2SS9N?=
 =?utf-8?B?KzBVVDVWcXdRTG85RWxFWndqNHlPTkYwbGJuSTZBVjZ1UVM3aHArQlJzUEpY?=
 =?utf-8?B?Nk5GTWVvSmF5NEV1clhpbml4RXFUbWI4V2dmNzVHYTJtUXhTSEFhNVVvQWVh?=
 =?utf-8?B?UFcrKzRYSzdmbFpSbWUvS0c3T2tNYUQ4aVY2SWRJaEdORllPUWtuZDdCZmpP?=
 =?utf-8?B?eVFodEZybjlMWjhQS1Y0ZUcyRFpRTkJEemNjRXcwNU1Oa1F3NEhsS3U2Z0da?=
 =?utf-8?B?clIwbDY5WnF6Z24xSDJzeXhmUWIvQmJXSjQwNHF1bHFEbFJkdjRZM1ZlT082?=
 =?utf-8?B?M0lSVTgyeTBoU0JZaWtKemdMd1ZOMHByL2pOU3lMZjJ1TGRKYUVWTGdDTS9a?=
 =?utf-8?B?RzJCQ3lOdmVvMzJMcksrNmFBbTAxTGFwQjBLaWRqSnYySGFoS1ZiSWE2bkVn?=
 =?utf-8?B?cDNwN3JVdEsvQVZyOHFmN1NuMnpxdk1HbkVQSjh5NEhwTUJFYUJJNlVwY01z?=
 =?utf-8?B?OFg4YTEwdVhFSjBWYzJnamlBb2RHSUFUT3AwVXJwUWlXM25hR2tZNjRwYzZM?=
 =?utf-8?Q?zfncVd3F33oiLQGo20H8X2z2c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013783a8-0d70-4d28-310b-08dcd2832783
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 16:59:53.0672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cmix2m9yc/eraUW01EtQASMqmXo37F0b7YEofi47wGD3wutU0aHVaokquZL6+EKpM0z/vge2D1xjKpI+OSbgIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694



On 9/11/2024 22:07, Shyam Sundar S K wrote:
> 
> 
> On 9/11/2024 20:46, Andy Shevchenko wrote:
>> On Wed, Sep 11, 2024 at 05:24:03PM +0530, Shyam Sundar S K wrote:
>>> The AMD ASF controller is presented to the operating system as an ACPI
>>> device. The AMD ASF driver can use ACPI to obtain information about the
>>> ASF controller's attributes, such as the ASF address space and interrupt
>>> number, and to handle ASF interrupts.
>>>
>>> Currently, the piix4 driver assumes that a specific port address is
>>> designated for AUX operations. However, with the introduction of ASF, the
>>> same port address may also be used by the ASF controller. Therefore, a
>>> check needs to be added to ensure that if ASF is advertised and enabled in
>>> ACPI, the AUX port should not be configured.
>>
>> With brief look this is much better than the previous version(s).
>> Thank you for rewriting it this way!
>>
>> Some comments below.
>>
>> ...
>>
>>> +#include <linux/acpi.h>
>>
>> No need (see below)
>>
>> + device.h
>> + errno.h
>> + gfp_types.h
>>
>>> +#include <linux/i2c-smbus.h>
>>
>> This should be i2c.h
>>
>> + mod_devicetable.h
>> + module.h
>>
>>> +#include <linux/platform_device.h>
>>
>>> +#include <linux/slab.h>
>>
>> Not in use.
>>
>> + sprintf.h
>>
>>> +#include "i2c-piix4.h"
>>> +
>>> +static const char *sb800_asf_port_name = " port 1";
>>> +
>>> +struct amd_asf_dev {
>>> +	struct device *dev;
>>> +	struct i2c_adapter adap;
>>
>> Make it first member, it might help if we ever do a container_of() against
>> this.
>>
>>> +	struct sb800_mmio_cfg mmio_cfg;
>>> +	unsigned short port_addr;
>>
>> What you probably want is to have
>>
>> 	void __iomem *addr;
>>
> 
> I will address the above remarks in the next patch.
> 
> I believe this should remain "unsigned short" because
> 
> - it is defined a unsigned short in i2c_piix4
> - this is just a port address (like 0xb00, 0xb20) and not a real iomem
> address.
> 
> 
>> and use devm_ioport_map() somewhere (see
>> drivers/pinctl/intel/pinctrl-lynxpoint.c, for example)
>>
>>> +};
>>
>>> +static int amd_asf_probe(struct platform_device *pdev)
>>> +{
>>> +	struct resource_entry *rentry;
>>> +	struct amd_asf_dev *asf_dev;
>>> +	struct acpi_device *adev;
>>> +	LIST_HEAD(res_list);
>>> +	int ret;
>>
>>> +	adev = ACPI_COMPANION(&pdev->dev);
>>> +	if (!adev)
>>> +		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get ASF device\n");
>>
>> No need. You will get here only if enumerated via ACPI (or if it's out-of-tree
>> board file which we do not care about at all).
> 
> Not sure if I understand your comment correctly. But I used
> ACPI_COMPANION to retrieve the acpi device that needs to be passed to
> acpi_dev_get_resources(struct acpi_device *, ...) to address your
> previous remarks.
> 
>>
>>> +	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
>>> +	if (!asf_dev)
>>> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
>>> +
>>> +	asf_dev->dev = &pdev->dev;
>>
>>> +	platform_set_drvdata(pdev, asf_dev);
>>
>> Is it used?
>>
>>> +	asf_dev->adap.owner = THIS_MODULE;
>>> +	asf_dev->mmio_cfg.use_mmio = true;
>>> +	asf_dev->adap.class = I2C_CLASS_HWMON;
>>
>>> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
>>> +	if (ret < 0)
>>> +		return dev_err_probe(&pdev->dev, ret, "Error getting ASF ACPI resource: %d\n", ret);
>>> +
>>> +	list_for_each_entry(rentry, &res_list, node) {
>>> +		switch (resource_type(rentry->res)) {
>>> +		case IORESOURCE_IO:
>>> +			asf_dev->port_addr = rentry->res->start;
>>> +			break;
>>> +		default:
>>> +			dev_warn(&adev->dev, "Invalid ASF resource\n");
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	acpi_dev_free_resource_list(&res_list);
>>
>> Now this is a duplicate of what ACPI glue layer does. You have these already
>> available as platform device resources.
> 
> looking at drivers/acpi/resource.c acpi_dev_get_resources() mentions
> that the caller should call acpi_dev_free_resource_list(). Is that not
> the case?

Ignore this. I understand what you mean now..

Thanks,
Shyam

> 
>>
>>> +	/* Set up the sysfs linkage to our parent device */
>>> +	asf_dev->adap.dev.parent = &pdev->dev;
>>> +
>>> +	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
>>> +		 "SMBus ASF adapter%s at %04x", sb800_asf_port_name, asf_dev->port_addr);
>>
>>> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);
>>
>> Is it used?
> 
> Yes, in the subsequent patches.
> 
>>
>>> +	ret = i2c_add_adapter(&asf_dev->adap);
>>
>> Use devm variant of this casll.
>>
>>> +	if (ret) {
>>
>>> +		release_region(asf_dev->port_addr, SMBIOSIZE);
>>
>> Why?
>>
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>
>> 	return devm_i2c_add_adapter(...);
>>
>>> +}
>>> +
>>> +static void amd_asf_remove(struct platform_device *pdev)
>>> +{
>>> +	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
>>
>>> +	if (dev->port_addr) {
>>
>> Redundant.
>>
>>> +		i2c_del_adapter(&dev->adap);
>>
>> With devm this should be removed.
>>
>>> +		release_region(dev->port_addr, SMBIOSIZE);
>>
>> Why?
> 
> My bad :-( Will remove it.
> 
>>
>>> +	}
>>> +}
>>> +
>>> +static const struct acpi_device_id amd_asf_acpi_ids[] = {
>>> +	{"AMDI001A", 0},
>>
>> 	{ "AMDI001A" },
>>
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(acpi, amd_asf_acpi_ids);
>>> +
>>> +static struct platform_driver amd_asf_driver = {
>>> +	.driver = {
>>> +		.name = "i2c-amd-asf",
>>> +		.acpi_match_table = amd_asf_acpi_ids,
>>> +	},
>>> +	.probe = amd_asf_probe,
>>> +	.remove_new = amd_asf_remove,
>>> +};
>>> +module_platform_driver(amd_asf_driver);
>>
>> ...
>>
>>> +	status = acpi_get_handle(NULL, (acpi_string)SB800_ASF_ACPI_PATH, &handle);
>>
>> Does it compile with CONFIG_ACPI=n?
> 
> I have used a explicit 'depends on' ACPI to this driver soon that LKP
> does not complain with a randconfig.
> 
>>
>> Also don't you need to include acpi.h for this? Or is it already there?
>> (I haven't checked).
> 
> acpi_get_handle() is defined in acpi.h.
> 
> please assume the rest of the unanswered remarks as "I agree" :-)
> 
> Thanks,
> Shyam
> 
>>
>>> +	if (ACPI_SUCCESS(status))
>>> +		is_asf = true;
>>

