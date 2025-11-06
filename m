Return-Path: <linux-i2c+bounces-13973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D38C38B21
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 02:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525AF3B4C12
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 01:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6E5221F24;
	Thu,  6 Nov 2025 01:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="IwMboWY4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010023.outbound.protection.outlook.com [52.103.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5AB221545
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762392377; cv=fail; b=ltj9SYgd15JXqsh5pRStmVbOLwl102/F+0qLXoUeDrx0sjCbpCLOJCEnysINcSjyCC6P+KCcGmLdoVb5hrvTORXUvlzQmcGQ5+y+EWKNKr2R9YcCbk9XgJ8cVd/OWoDFegk23bBT0hnNepB24vP93KzVaw0rET0dY5vZuqp7G48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762392377; c=relaxed/simple;
	bh=YQeThj4V+7xSYzxp6XaZ9kqO2crsRWAumer1k76kCso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LJzU2LZU99tX1NLGpyuWC70YE96hzogha9jdNufXbvKKQ9ejGL4M2CtkHRh2DXiCQ0NcTUnXEG1RuebuTOoo0Co5zvNuvJR4uDqUIjWt/1QVJU4O9/cw2/C+WgTnfT8Mnoz/SamJAIXIXa9B2Nz0pzF9l+CV0tph+VBNEGFi09A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=IwMboWY4; arc=fail smtp.client-ip=52.103.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEkXODEq7HDVf8zqIfKBONBfWS//nQfML7v5yAs0cGMjhL/pKQGl4QHYfRCXM3ugdnfyj+sBpZqTlCg3Du5BtsQucY5xMRBuSDWzaVh7T76YVtW4GV8UjUXgq2YbUCKlW/VuQFl4t/wlbvB2oML8bwehQ8VwxHcV5caXq3A130a74WxB1M1+0fnXdXmYzvXQ2yn0fnjuL8advR/p2UgZA0J7aul3AbennMqAflCMuqPI1uDy622WaHfVyjb+ks8ecnzv286oMQaqi9INXzWaibo6nxhrhg+KVhUaJW4sgtDseK4PjLF9FErMmRas7sHImCNHPUc4EXbs7YUw5l8ghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZjg0FOytupNYkkqgVY3SdH4fjtXaQD3BI3RPch+ESQ=;
 b=MJK1OFVl46FAtLyQjVUauALhw6PxuAiDipDT6Ja5B8/EZrS3b4b0O67zyoA/ACHNtUnSaMc0/YpsQvudSzF6TEarzWN1CQc+fOjYtUspmLy78HX+UHm14l8Tz/7NOdaUj+U2yY7L6mt6FWV5ffAlc5qUwT1289MfdSfABN5VRAwI2MVG/EVlwn8z63ikCrJJkNkCghwtA6Is4+B6uXCtAvEeN7YMa07V/sdQzA6K/NPekWz18vSw2Z15WmWzKKrOWsOaBgu0xtMNxSLLbCSqES0O2vYPjZ7+azXn8nwcI56JfacdCCLvOMtkkLK+QplQE5U2s8cTbaOQ9DY0ayXBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZjg0FOytupNYkkqgVY3SdH4fjtXaQD3BI3RPch+ESQ=;
 b=IwMboWY43vz9OmfI5kzrEptfVGQ+Dm5KOslxGT3gRjTFvh//ZPdCcansAxKE1BTFKW1CMIAi+JBBG4y5Q4J1rU6Tj8ZRjMrPVKmK4UpRRIcTT2dmpa7mcxTGU25+7KGsnj0/pR/b2FJOhgntoHBP15L73xAxVCJQZqwg4zQPCCaEapAGes6qaP913s6+SarVq8EhyaihelkwQlwNGsZl/nXkyclYuGXHfoYQeCN57jzTQV3WnHe3X0ft0SJa+GCaHot2dtc1vjOKsn9i6rxwAT/4qEzwkyPg5GKzEQqw2O3PxbwAvq39cOpGTN/tdO7AYZUpYMrk/ZjUNcU23skSLQ==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by SY4PR01MB5882.ausprd01.prod.outlook.com (2603:10c6:10:f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 01:26:12 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 01:26:12 +0000
Message-ID:
 <SYBPR01MB45864E0B85A6AB0B157E0FAFC5C2A@SYBPR01MB4586.ausprd01.prod.outlook.com>
Date: Thu, 6 Nov 2025 11:26:10 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] decode-dimms: Implement DDR5 decoding
To: Kamil Aronowski <kamil.aronowski@3mdeb.com>, linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
 <cdb56a48-8754-4d9d-9309-8a694c6f148d@3mdeb.com>
From: Stephen Horvath <s.horvath@outlook.com.au>
Content-Language: en-AU, en-US, en-GB
In-Reply-To: <cdb56a48-8754-4d9d-9309-8a694c6f148d@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0067.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::18) To SYBPR01MB4586.ausprd01.prod.outlook.com
 (2603:10c6:10:59::12)
X-Microsoft-Original-Message-ID:
 <46e765e2-a239-43fd-9be8-79617f8d6327@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB4586:EE_|SY4PR01MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: c769c0b7-fb89-45dd-9937-08de1cd3789a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|5072599009|8060799015|15080799012|23021999003|19110799012|440099028|3412199025|40105399003|39105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnJqcDRQekVHUFVDTDRnSTAzSnVnZTFtQkdNaXVDdEVWM2hpT05DaDc2aU54?=
 =?utf-8?B?WnBMR1hLT3krTWErZ1hIYkhVMGlaeUNPK0ZhM3VLcjhCcUUzRGplR0dIQkNU?=
 =?utf-8?B?a3Q2YU5NN3dBUUtRUktsMUFzRmM4K2REZU1sL3o0YlErYkl5bWdJZ21GWER1?=
 =?utf-8?B?VTd2YUhSYmxFM2lsZTdXaE1UQUlRNnlCVU9iZ0FnV1dRT0tjR01ORnlnNEpD?=
 =?utf-8?B?SUFKWTZ4S3c2TTN6ak9MNnZ1UGhPSlkxZEo4K0luOXA0MmNZMFo2Zm9jN0JK?=
 =?utf-8?B?cFM2Unl3WWhVbHdMbW5jYkY0anpvcnV2YUZzYU96ZHJlZDNvNVNDOWpxekhB?=
 =?utf-8?B?TTJmTGdoOWVzcFd6aEIwQlhHY2IyWWY5Y25iNmM3ZEtMNWphL09RTThDOHZp?=
 =?utf-8?B?N2hxMFhIcXd2ODRWcWppaVdlNzhyU2VRS0VuTEFKQWlxK3FjcWZOR0VlSTFQ?=
 =?utf-8?B?Q0tFempIUitZcExTK2FJM0h0ZVJtZS9WZ3FCRjU1am1jMnd6U0J2Ym1JZ2dK?=
 =?utf-8?B?Q2Q1VFZEVER6Z2hvV3IwWXYxOU5xWWJMdk1BR1IwMHBVTFpiaEI3dEN4VVZw?=
 =?utf-8?B?YzUrbUZRSDArVVBFQW1kc0xOd1Q2eHBkZzhhcHE5OFhrUE5pS0xJZFkwbWJM?=
 =?utf-8?B?cXdIYmVWVlo0UG14MmttMkRjR1ZPY2tBa0RVKzdqa2tySXJLU2JCZ1lMVjM5?=
 =?utf-8?B?RGJ5dGZBa3dPM2Vqb3VESFFFUTFxeXd2NDFqVS9vb3M3NktFT2xTRGFkdjFS?=
 =?utf-8?B?MVV0dFVhZ1I5UDVDaElmdlZxNHhkZDB1NUMxTmRMUCtvRjA5NjZXS0ZFTzRt?=
 =?utf-8?B?SnkweU1KaGdJbUdObnoyeXJWZUswQ2o0aU04RDVka1lBd2ZxQS9UTEY5M2dN?=
 =?utf-8?B?VW9WRUNzc09lbGJReFIzODVrRm0vL2UvQU9pNENtdnQvU3BoLzdtdk84M3dU?=
 =?utf-8?B?U1dkZVlkWFFpT0d3VG9NNVA5MDBKaUZIVjFPSytYRnREWVNSRnlWVXZGVnMw?=
 =?utf-8?B?aTd6RnFIbEFTSjhFVkN6MWxmVkdhdzNqNWR3cG1wenNDb2ZJZUtIem40endv?=
 =?utf-8?B?SmJWR3VtcjJKUEVxeEFidmRNUjhWSGNrbWxRQzhpRVhSNmQ5QmZaZjRqdGNY?=
 =?utf-8?B?RlRHdE9aRXRvcStGWTRrcEdPNUJPRWJVTTRKYk9MaW9RZVlWNHVYc1NJK3Q1?=
 =?utf-8?B?VnBzVjRCVFg2VzFWN2xXZzB6SzVKcjdyVXJkZDRPWXJ2OGZDZE9UUmh2clNH?=
 =?utf-8?B?eHJTdjBzVTZDU0xNc3FRaVVSdFhJcDc1R0hWLzVFM0huek1jWXhKOTNPU1BB?=
 =?utf-8?B?TnFHeTlmRzQ2Y2czakc0NThxM1JlRDBJY2FER2x0ZmZuYlhrUW9zY1VmNVh2?=
 =?utf-8?B?TmdicFN4NWFVV2RpK0tUVzhEUXdFelFtYk9STmFPTmlVeUV6T2g5ODNydVQ1?=
 =?utf-8?B?VzFpV0NPQVFqNEE1SjhDUnZnRHY3bUNIQWZvVEpCSmpTVDFyVlZGdDN4Wldm?=
 =?utf-8?B?bkF0V0kxWUk0M2JuUUhzekhFeFl6eHJPUGxFYWdkd1JRUGViL2NoSzllRUI0?=
 =?utf-8?B?d1orRERwczNiN3RqT09VNU9rd2F0UW9FY0NyUC94ald0WDNBWm4xNjN5R09B?=
 =?utf-8?B?N3l3S2R3bjliMHJNY3h6ZFVvWDJ5aFE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1l4MXpOSHM2cklxMWk0Z29WU3BtTUE2THJ4NVBSNHdtKzEwUHVOQjZZWk95?=
 =?utf-8?B?bmxkcTBhek80ZC8xb1pCMTE0cDdvOGtzTmQvKzNqaTlrNGNYNk9kbVYrWVdn?=
 =?utf-8?B?RUpuSXhMclplUU14WEhZVk9hOUdqelRCejVNT2k1eXVZTCtkcmlPUzRoc0Qz?=
 =?utf-8?B?aVFMOUZXdlRJbExYaGxHZnNEbXJmV0t0VDNZOG0zcTAyZGJoRFl4YncxQ0Nx?=
 =?utf-8?B?KzVlUmxUSjRLd2pGUFZQREhsWU54M0xYTElNK09QSkl3ZE5IaWhYT2xyV2Nh?=
 =?utf-8?B?c1pqeXVzcStMdEVlaXhjckE0QTBidEFYT09WQ2cvQU4rRC9MY1krQmdpUDA0?=
 =?utf-8?B?TnQ0L0JWUEVNREM3QlJ5K2srQUNoalJPNnkzMlpBZVdEd3BscXgxVHdnOE03?=
 =?utf-8?B?dVZldVN2S282eFdJRHJ6UXQxZUltQzBFUWhuTnh3WU5MUDRCSXZ0RWRoSlBX?=
 =?utf-8?B?Qlo0Z3N5eWdiRlJGZ0tnUWxMOFVuTnZnUEp6ZlF5WDJneTFXQkc5YWlhQnBX?=
 =?utf-8?B?Szh1dkJ5UFRVdXJ5TjNBNGU1aVVaaG5kS1dSZnl4R0VQRE4wMW1xTU16THhl?=
 =?utf-8?B?dXA5VGJXRmZtalFsU3YxOSs5bHhDTi9RbzJ5S0ZMV0hNak1LUU5ZZGZXcnJv?=
 =?utf-8?B?SytjRkdzVTdtYzdvdDdKMEF5WjBKV0RuMjl0QVJKOEpQMjMxVmM0Y1BuUllm?=
 =?utf-8?B?QmlDZ3BRRXM0YkJObzhkTXRYOUdnK1F2OWxqbXpIV0ozaWJHdk9VSWtJc0NV?=
 =?utf-8?B?Q3BLMnMycGVGRytrQktjRWVGQWZybWEwUkFaVVd0MStVV24rQVYwR2NNazBO?=
 =?utf-8?B?bUowL3haUU1ZeWRHejBQOFpuTFdRTTdDRFMzU0M2ai9PL0V3L2M2TjhubE04?=
 =?utf-8?B?NFEzeG1QYVAzRHJ5SmEzUG9qRjBucTU1MVFaZkhXajdBdCtadlM3S0lvRXRL?=
 =?utf-8?B?MkdXTW03cUEwRmx0M0YwM2E2K3YrR1RSVTBFb2h4WnNtWjVQRHhpK1hrY1lR?=
 =?utf-8?B?Rkk0UmFVUmpWQmRRZlJJUUUrUmdUOXp3ektlM0poZndpVDN6RGxrZXpQRDhq?=
 =?utf-8?B?WnZnZmJMV1JiOG1MbDFmMTIvOHA4K01XMjRQOXl0aUpJRlJOV1RmSTl4OUZV?=
 =?utf-8?B?QUdrTzUxVWxteWx6NEpkOFA2YVdLZis1RzFBcTluQmE2NnFhL1AxWklOL0g2?=
 =?utf-8?B?ZENNZFhtN2tCTzZGejA4U3lGODhhUTV1amVoYURLeWY3OWtCbDhwQXFxdWhh?=
 =?utf-8?B?cFBEVmNMNlN3bkhBMldGYjhaeUNuNmh5Y0trckVXL2FlRXRlbGlGNFFpZXoy?=
 =?utf-8?B?aE1uWGY5V2dXVTBOQzhUU3JMaUFROXVjOWFySTBWbnBVSmp0Tld3VWVONUlZ?=
 =?utf-8?B?Z3lrRGJMNUNIMXBteStKaFJNSE9vcVNPblZXSXZWMW5idW9aMjhlRnc1ZWU1?=
 =?utf-8?B?T29oSXR0N1ZpYXBsV2hScTM4WjQ4MnMwL2c5RThiUmlGNFlBL2VneU5rc3hR?=
 =?utf-8?B?VVpsR2ZDWGI0cVZMa3kvT3JKN3k1UE9Qbk5QL3VWQktML1pUb3BsMDhPT0x5?=
 =?utf-8?B?VzFyMk1nQ2tiUlU0M1pJN3NCU29xZEN0MzE2TmhWVWNuWko3UVd5WVNPdTBn?=
 =?utf-8?B?LzdOcFlvaUliRG15QXRaWlRFODFHa09FeHZGbnRGb2JBeHIxbEE5NUhRYXlI?=
 =?utf-8?B?dStONllVNHEwMEJoOFVmSmQycE5POUhUTENSSjFMb3dxZGVTbExBb2FyR2U1?=
 =?utf-8?Q?awoLjNQ+zJ2sOqh0GuAOpu5kSDihF3swkCKIl+l?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-64061.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c769c0b7-fb89-45dd-9937-08de1cd3789a
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4586.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 01:26:12.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB5882

Hi Kamil,

On 5/11/25 23:31, Kamil Aronowski wrote:
> On 11/14/24 07:37, Stephen Horvath via B4 Relay wrote:
>> Hi, this series of patches adds DDR5 support to decode-dimms.
>>
>> I'm not too experienced with perl or the JEDEC specs, so there's probably
>> going to be some questionable choices here, but I'd love to hear
>> feedback.
> 
> The patchset doesn't seem to work out-of-the-box. When running the patched
> `decode-dimms`, an error is thrown:
> 
> ```
> $ sudo ./eeprom/decode-dimms
> Cannot read /sys/bus/i2c/drivers/spd5118/16-0050/eeprom at ./eeprom/
> decode-dimms line 2940.
> ```

That sounds like it's having trouble reading the eeprom, not even
decoding it. I have a feeling this might be related to 'SPD Write
Protection', does your motherboard let you disable it? It's often
enabled by default on Intel, and I don't think it exists on AMD.

spd5118 needs to be able to write to the SPD in order to select which
page to read.

Otherwise, are you able to dump your eeprom and send it?
e.g. `cat /sys/bus/i2c/drivers/spd5118/16-0050/eeprom > eeprom.rom`

> I've checked with more than one machine to confirm, that it's not an
> individual
> case.
> 
> Modifying the patched script, so that it reads one byte in a loop does
> seem to
> fix some things, though, at least for the first 128 iterations:

> Nevertheless, it still doesn't work as expected. A (trimmed) listing
> shows only
> the following, except all the trimmed warnings:

I'm fairly certain it's just reading all zeros.

>> The first 4 patches (1, 2, 3, 4) add the essential information to
>> decode-dimms.
>>
>> The next 2 patches (5, 6) haven't really been tested on hardware
>> implementations so I'm happy for them to be dropped if they're not
>> useful.
> 
> Was the patchset tested on any hardware or some other intended environment
> outside of my use case? The latter is about the most recent revision of
> Fedora
> Rawhide with the spd5118 module on various DDR5-equipped laptops.

The first 4 patches were tested on my desktop with Kingston DIMMs and
laptop with Crucial DIMMs, both AMD. I don't have any sort of fancy
environment, just consumer grade stuff.

I've made some minor changes since originally submitting it, so I'll
submit a v2 shortly too.

Thanks,
Steve

