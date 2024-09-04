Return-Path: <linux-i2c+bounces-6144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003096B994
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8034CB23DB0
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804811CF7A4;
	Wed,  4 Sep 2024 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QSe57B4y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB061CF7C1
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447795; cv=fail; b=nEAN4kCbLTxZfiEp078EgYE/mEfJXdNfCq+U9USvM/SExfzzNn1LIVxDYB1ayC2WTLBvLw15+HD13Lfr4ZNZ4aVhK9qRQT+j7s7dbL+GWK3j6ef10xXUj8VGtmhmav2Bf5A3ecdqKDV7LespDwWdvmu7Xo/Q7b8qXc9cqRq+ynA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447795; c=relaxed/simple;
	bh=iAS6u+JvdghdtuCdW0ExMor5RNqiZVOCiovrYghdxw8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GQJhR4JFSMnwgowez1MeYgBPhlQyZ1GUTjo5antFtBumJ9ZAJGMOEbuBsEPVeE2D9L10CbiW0paFUjw7u2fC8ifTiNJg+Yvp/R/yGudwT67trzSr+oRLUOxsPgVO9uBwWUqzMA787oqnyIAi4oEghFoE1i6YpqbP8UrV6oHVuiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QSe57B4y; arc=fail smtp.client-ip=40.107.237.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWh9Y6AvyDpaZbqV7VswzDsXtFYThqnlCPWnj2ysvy7INQMH2RsBIUbmqADSUTSpeIRwu9/Kc6NBwp6lJlANo1iw3G5X7lz+C4x12ZATTjEDUluikERWzyy27sXfi9NfQZDaHzPi6BQ6OePlIqCjMcBXHKLflTkp3bETYcy1rhPZ9+WkpNNkEfFvRPLfQilsJRznnMoS4JiAe+I7jfk+7u8KwYn/ZISBAgAvl07k7SmVISYjnQ7kRRoGL9etQ7OoeYPsAnJ3gWMwFk7XG2NzPumJPB3dwc/rqEK6r528NkO+icIGSi1A7teq9vuAPhCzJrxrMWIaKJquT3IFp/S2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTXk627Ol4eRLB2QCraJ9DZGcIoUuzZbMTvlQX8L1K8=;
 b=ZSJ2evwRjKCqoKEzltFrr4Kj7CFNcgdu4YhA7Me7R+hG0ur0lnuIkOaOcNwk3aRE1GZncf8edaj34ldbRKdgIG45x/YE9U9XVncVT+24HlJ+6ZQXewXf+Lv3TVSpKSCQrMuJhc68O6XnF+PTlWtzJv3EYxDu4FaC/3be4OVvUAF+tQ0r10DaRbQF6lMF4tB+lBKpXZtprklgjV/iYN/5tjQ7KLj1obBw6rZIntRKlXMcQ+UVh9Myx6UDr6Fy1DaJ19QCsebJpmSB8OWLMb6QGckRo/yKYtu+1Pqwuv9hKfrZUb5esLztiE6YttuA561HnxMe7/Jh1V53qy2qPKTOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTXk627Ol4eRLB2QCraJ9DZGcIoUuzZbMTvlQX8L1K8=;
 b=QSe57B4y+X6jEnrNBqRXc4o10buF+1Yfzdv5t3g/8Hce5JeuGfz5QLpd6n01sHJpM3gkAACIQrkvG5onQSs77OhxHWMb8dKn+tE2M1gI/bgJ2x+DqQOZutXvkKty86knA/UEe12MUgEdX4c2oBU3MpfQWIWl6mW2n1gnGc0zoMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.22; Wed, 4 Sep
 2024 11:03:10 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 11:03:09 +0000
Message-ID: <b07c59dc-40bd-4c95-b897-e40ec42b6119@amd.com>
Date: Wed, 4 Sep 2024 16:33:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
 <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>
 <34a01d4c-cf05-45e4-924c-e2453ff5f6a3@amd.com>
 <ZtdsVvU90WOgyBNr@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZtdsVvU90WOgyBNr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 7618e77a-fec6-4f24-0480-08dcccd128fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzZtd1ZxcmdkVUxSWksxaXlqWnJVTmpYQmhTZ0QybVJXQXR1Wkl6ZVdSR3Fa?=
 =?utf-8?B?WGtUbDI2NHBTRUNuUk1qbmtQUFBGMjUrK1NmeUJTOHZHRWhiMXJEcjhDRDhH?=
 =?utf-8?B?MDlBdjNmM0hhdnA2M2V0dno1SFRHUlcrZmdGd1RINlZQekhkdU5FcmdsbldO?=
 =?utf-8?B?SUQ3Lzc5djF6OXdjRHoxTHZUSW5ZN0tHRlRYQjMvTlBOK2FsNzJ4c3N2QUND?=
 =?utf-8?B?U2dGUVdRa1dBL2w4V3BpTEcya3k1TERYQlBCaDQzN1l2RWJMaENsRkxWVlhW?=
 =?utf-8?B?U0dBT3FMVGdYMWpKbjVkdTVWb0RWQncxZU5WSVh5N3VKL0E4cXFhMTM1OU9o?=
 =?utf-8?B?NGpFcEhLLytmTjZLcmYzYURCWGxMYU1IU1NOcmR5VVR2RzdUSHFXNzgrTG1m?=
 =?utf-8?B?SUYzNHc3bEFzRi9GYXlMU1pnWWR2WG9LYW9IWE9QbHBLbDdwaVNvVHJvdlRi?=
 =?utf-8?B?UXJYbGJaenJiTEltbHV3UFp4Vmc5Zk9zOERsOU9PYXp3eDdsTW1ic01WZW9S?=
 =?utf-8?B?OTZnK25ZY2U4cmhESGE1R0hMZzU5K2tzRzRrSlZNWExRYmFhQkdOU1ZLdjYy?=
 =?utf-8?B?a0hlbUYrdUFCUWVPSjRKa0JLZ3orZUJFVFlaU1VLRUtOaEtzNFBSUytEZjRa?=
 =?utf-8?B?VE1KWU1OVFg4NnlYSHphQlhDT2VjcGx3d2VPOXFPcENpVU1kVDRoblNxbEYy?=
 =?utf-8?B?QWJIZ3JXeWJxOFdRY2tsQWVsNzRzS2hiVmE2Y3pPU1BtSFIrN2ZMdXBpdldt?=
 =?utf-8?B?Z2ltaFRMOHhpUUZRSDU5RFVpQWNmTm84SGo4NlZRbGZIcTYzRDFuQ29DT0gw?=
 =?utf-8?B?MnozSUtOTkZ4TVNSbWRjOGNReGo3clJXL21aQ29vSkIyMDhUTjFZWUkwU212?=
 =?utf-8?B?WEQ1SFJnTGNGbU0rWVJiUHZmdEpITThETUw0R3A4QytOM2ZqYzQ1U1IxeTk2?=
 =?utf-8?B?Qy9nbG9DUnBra0Era1BPZXZxOHZkNkt0SXorWnBUZjRMNjZmcHZYVVBuTzRt?=
 =?utf-8?B?TjdWdThFaVhOOTl3eTNldTRjVExTbS82OWhLSTVqRzZPTEFpSUdCNWNpVDBo?=
 =?utf-8?B?ZnN5TXNaZ2YwNVprNjJSc1JIaFk0YWU4ektFYVcvMGlVNHJtSFhwRnp0aXVk?=
 =?utf-8?B?Qy9Gbm5YTDh3U0pFbWdCYlZFZFMvRkVEbVNkSk5mUWNGc0hWaTFmQ01DRGFy?=
 =?utf-8?B?RktGcmhtYVBPeVVzRHFEcmVKejE4cWx0a0hsMjJiU3AwRXhFMWlqZlIrR3By?=
 =?utf-8?B?ejJlMWNOY21xYUhjc3dIdzhIK3lPRmhzYW1hWkZFQUdLOFZBMHZFTnpTajZl?=
 =?utf-8?B?RWh2QmNxV205dmx3RVN0N0JrUFZGbUg4WWVyYndBQmpmWklaM3kzU1ZCN1h5?=
 =?utf-8?B?N0tWejFkbCtPWVlrWDhvQTljL1JsdEc1YmRNVllpUy9WR0M5NnA1RWdIZVp3?=
 =?utf-8?B?M2I2K0VaZjNaV01LdjYvTDUvTVRlMDRjU3JCUkM1UDhWNUtPLzNYSGNibVlz?=
 =?utf-8?B?WDlIQjZWdXh0VEJvUnovRytjL2NCbWxmWmZiQjgrYnJTVVFMeXBnd01IZjM3?=
 =?utf-8?B?NDB4UmhpK0VvRHIzUnRqR3BIVGVoMXRjZHlHbitkV3lqaEp1QXJLRklpM1JD?=
 =?utf-8?B?eWZRcXo0TEg3aVFHUVJOSnZTRXBvR2Q1ZzNHT1FDdnZERHBoVUNpaDU2ZlB1?=
 =?utf-8?B?bGVGajF3YTc5MUxrcjN5UHMyYUZvTXFCVU5jK05JUFRQNENIc0pFYko3NTJv?=
 =?utf-8?B?ckNLSVpvYmdxVUhLUlZqUXgzNDlyVzZvWkdQcDBKajJmODJMRitRS0l6Qkc1?=
 =?utf-8?B?TG83eVdWdXpwZVdodHRRZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXFEVjNZR2ZGM0MzQi9jcmZWYmR0d0c2WGRVZWpUbDl4TGxYaDltd0paTWZI?=
 =?utf-8?B?Rk14YXVtYThnL0QrTlk3Q0pORmt2bnp3a0RycEp0OEp1dEM0RHJoekQ2ZjdC?=
 =?utf-8?B?TVVKa2xIaktGNThUTmZkcDZBTlY5L1VXLzZGS3huZ0NPK1VUZEFYUnY4RTRC?=
 =?utf-8?B?c2FoZVFDckVGbTNFQUVXMGxMMEhVR1pIZTREbmZZRFo0MU5ieVJXVjhXVlM0?=
 =?utf-8?B?K3N6VTVJMXM1UkVXRGg0Q2hpWTRwTjNrL0VMUXg4YklrYUV1MVpTOVpDbGJW?=
 =?utf-8?B?Vng1R0QrWm5EbThGaXlvTjhOMU1McUp3ME1oVzMvWFhZaWlGTTBNVXFtdXdF?=
 =?utf-8?B?aEV0UkVLTmdOMXhFdzlHeHRxbFprMVl1UnVyNmNDc2VZSTdQWFU1Ni9XZjlh?=
 =?utf-8?B?M1ZOaUUxOFhSK01tVWtGaDVXVFhYb0c2NFNiWk1DVk5aMTJSN1ZscThSbndN?=
 =?utf-8?B?OTNHTnUxSk9kdWpid3k2TlFGa1ZsUUovS2s1MGNvaVhtMi9la1RqeDMvMFFB?=
 =?utf-8?B?a2YwSFl5Sk5VNWlVank1YnhCcWxvY0x1amlrQm02RytxUTlOdGZHTnhqQ3ZV?=
 =?utf-8?B?R2VTdFBkSWdpV0RKTm1GVTNmbUczUFNzOEZ1amJvVWpSRWVNWTBCMGRHLzkx?=
 =?utf-8?B?UFk3ZlBiOXJhcXBpZm4yNlBmbGdtTUw3V3lFeUM1aW5ybVFuNjh6TnBSYm9x?=
 =?utf-8?B?cDVNSWNxMjFTWmljbHc5YWRFNHErRTFMWlZmR3BVOUpzM2Q2dUJEQUs1YUNo?=
 =?utf-8?B?TWN6Wlo3T1VPR3pVSFluMUJFU1c1aDRKY1NMMndrVEpYMDdnTTdtMmVTNi9X?=
 =?utf-8?B?R3Y1RDQ4anBnb2tlaGIybWJKaEdtV2RhM1pnMWE4RVlCczN4RzZMM1hXZ0pp?=
 =?utf-8?B?NnBhQmFreDIwczJvOGQ4NmdrTjBvQldvWWt0MjJwY2JOM01pTGpjYmc4VDVn?=
 =?utf-8?B?OW4xZENreG1qdUowSGZXMkpYRDk2WXRBQkR2Tkp4QWhmNHEzWGdUbHY0M1F3?=
 =?utf-8?B?TXYzZVFleDF2aGF0M0NqY3MzZjJTUVJNMW13TWE0ZC9zWFpiVWRJbWk1QkFR?=
 =?utf-8?B?VEhmVlJpMktKc2FLQk0zL3JERm1oVy9TOWxXQnZNTW9zMmtRMmlCU2ZyZTQ0?=
 =?utf-8?B?Rm92T2xhaWxYL2VyakNzdkhaVzQrVGNaaXlJY2tVeTROb1FLbEo3Z0tYRGV5?=
 =?utf-8?B?NjZRTk5IMnlIQ3kxaFVNV1ZZMXlDbGx1a3Z5VlFKZTUvSFNFTy9aQlRWWXFn?=
 =?utf-8?B?NVpCMFV6NWdJK283RSsrTmY0UHJkb05GMjhNODNEWEt4U2VOVXFwcStzTG9s?=
 =?utf-8?B?VEhHSjZxQ2pzZTg5KzAvVmoxTWpDMHFBWkp6dTJzQVY2YjNBaGRSckpSWUlL?=
 =?utf-8?B?VTNZbFJvZEZJYm1xODFQdmFON25zYU1KaDU5MmhjWUdZSXYxRC9sSUZlR3FZ?=
 =?utf-8?B?bUppOXUrK3BUanZUbG81ZWw3Smo1WXMzeWlvTEVOaTdtVHZsbndhaWliaCtv?=
 =?utf-8?B?WFpTVnc0S0JsMkV0b1BMQVpCeDdDellzNDJ4K1J3bE5lQmZHTThSQWtIWTQ0?=
 =?utf-8?B?OVo3b2lHYWZkbXhuRHdDMWltcmxNaGFKSVZSTi94Ukx2cndaUnpTb2cxc0dF?=
 =?utf-8?B?TXRPcnFmWmxYYlhtY3ArYSs2OHo1b0Z2UitPOFQ5cUFBZ2hKTWl2QjkyQ0t2?=
 =?utf-8?B?czIyYzZrcjBKSFMrWnZNZjJXUzFhUkFCRWRLcEhhb0k2NlMyTHdueWFGR3Zi?=
 =?utf-8?B?RHlsRXZwdGY4TE1lOUJObHRwZDRIM1Q4amEvVHRzQlp5WnhWYTNmVUI5RzVl?=
 =?utf-8?B?ME0va3g4NVFhcjA2MFA4Uzdva2QzbWFudHY4ZGk5OHhNazROSU41ZlNvQVQz?=
 =?utf-8?B?aFc1WXhZL0ViV054bFFaU0NKYUNOWTR1WGRXZHhFOVhTbzQ3MW53SEtKUnI0?=
 =?utf-8?B?MzZlTmxaYWdxNFloelBlTDl4Zm81Ymg3cEY1S1hlWldkbjU1ZkljYzVEajdi?=
 =?utf-8?B?akNoQ2hyZjFiSktIMzVCVkVMbFFOY2J3OC9NZFl6b1B3TFAxeFc5YXdzejRr?=
 =?utf-8?B?WnZLK0cxMnZPWUExNXFaNUxhdWVOMEgvbEVGclFQVmF2RlMyOVVGMFE5UHF0?=
 =?utf-8?Q?vl4IlS5QKYF3ke4rgR6W2wnhz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7618e77a-fec6-4f24-0480-08dcccd128fd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 11:03:09.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnBASm7dN+mpyYThW6VKUaDjPuqGcS3U1yHN0UQ9twRbZ8VVL4zFDjXznRpyWvRN8mJmadwbzYs69v8GwIs7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290



On 9/4/2024 01:36, Andy Shevchenko wrote:
> On Wed, Sep 04, 2024 at 01:06:16AM +0530, Shyam Sundar S K wrote:
>> +Andy (this has some ACPI handling that adds AMD ASF support to the
>> existing piix4 driver for SMBus)
> 
> Thanks.
> 
>> On 8/22/2024 19:51, Shyam Sundar S K wrote:
>>> The AMD ASF controller is presented to the operating system as an ACPI
>>> device. The piix4 driver can obtain the ASF handle through ACPI to
>>> retrieve information about the ASF controller's attributes, such as the
>>> ASF address space and interrupt number, and to handle ASF interrupts.
>>>
>>> Currently, the piix4 driver assumes that a specific port address is
>>> designated for AUX operations. However, with the introduction of ASF, the
>>> same port address may also be used by the ASF controller. Therefore, a
>>> check needs to be added to ensure that if ASF is advertised and enabled in
>>> ACPI, the AUX port is not set up.
> 
> ...
> 
>>> +static acpi_status sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *context)
>>> +{
>>> +	struct sb800_asf_data *data = context;
>>> +
>>> +	switch (resource->type) {
>>> +	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
>>> +		data->irq = resource->data.extended_irq.interrupts[0];
>>> +		break;
>>> +	case ACPI_RESOURCE_TYPE_IO:
>>> +		data->addr = resource->data.io.minimum;
>>> +		break;
>>> +	}
>>> +
>>> +	return AE_OK;
>>> +}
>>> +
>>> +static int sb800_asf_add_adap(struct pci_dev *dev)
>>> +{
>>> +	struct i2c_piix4_adapdata *adapdata;
>>> +	struct sb800_asf_data *data;
>>> +	acpi_status status;
>>> +	acpi_handle handle;
>>> +	int ret;
> 
>>> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
>>> +	if (ACPI_FAILURE(status))
>>> +		return -ENODEV;
> 
>>> +	data = devm_kzalloc(&dev->dev, sizeof(struct sb800_asf_data), GFP_KERNEL);
>>> +	if (!data)
>>> +		return -ENOMEM;
> 
> Why can't it be on stack?
> 
>>> +	status = acpi_walk_resources(handle, METHOD_NAME__CRS, sb800_asf_acpi_resource_cb, data);
>>> +	if (ACPI_FAILURE(status))
>>> +		return -EINVAL;
>>> +
>>> +	if (!data->addr)
>>> +		return -EINVAL;
> 
> This is reinvention of acpi_dev_get_resources(). Many drivers are using it, you
> may found a lot of examples.

Thank you for the quick feedback. I have submitted v2 addressing your
remarks. Kindly take a look.

Thanks,
Shyam


