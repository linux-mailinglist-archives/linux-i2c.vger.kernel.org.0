Return-Path: <linux-i2c+bounces-14001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BBC3C32E
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 16:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD3742164B
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 15:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F65D33C531;
	Thu,  6 Nov 2025 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d5w73PUt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C230E0F7;
	Thu,  6 Nov 2025 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444355; cv=fail; b=W1v5mavkgRHu4gsZJJUpcD1yoYW8pfDBNUNxDNieXP6DYEh8psEsYKjt7JC+OHBpqZif8ylGbFU7kjOVkOHl176Yrdf1V/N3CfV7mIa93aa0qlq8BQQoxQaCM4hK3s3D/+YrHR4smwlEVQY/9NI6jv0ta3R7VINam9nnVNsUYJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444355; c=relaxed/simple;
	bh=JYNx0TDbycLhIe6/UzdRsFrfP9P1I49cGGwmirP4b1Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uAK3OQ2dNKkmbs6sutTeNojVxt9wOCSgl1yJZ8jBkwt1+rcOQqnwxZpD3jpCsLEP5sL7meQ57b8oCj9ZF3s2PDzMvyG9aTITCPFCtHuWLYwLSWzgeKJod2TefRvN0PUNlNxYRtGA8MC7026z6NrBbBKb/Qhif3W+nPuxnoFBfqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d5w73PUt; arc=fail smtp.client-ip=52.101.61.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO2NnvTINXNTz3hvWbTnprm2pBVZ8WuP2Vn/QyBdWb9xmj0BuKbn1CyuWwk9wlJgDsJyFRBRIOilsgpTnUuomSLG8STGJPEwuYaPMwgdK9pNGx+1B+zdMhSf7sLmLlbE5U3Vj+gNHDrhTr7xozn9uC/k2oiZydvMgwfEVGv2+hyb89shEkslFYhZ//xc6U+PcymZNhXhtpBdnkawNBkTEOp5TjPdPPFMAZ1Na98OyXKiQNTx70zdUf2pN7oKNjhC6lFfqWWpOsh6wtjySXP8G8PisVF4krRUPu8bJbEzGrquG3Fx8OBYhVczMnA8+1XnGmztZyJRZYM3Z4O5VH1tcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmJU8MBtJgPGvH1J7TZ6wU4CGefrR52z4qRoZgLOFKY=;
 b=hICzqEYf1zbSgNkvPdQSe7xHoJfNtHXGSq8pr4oA//xzCL18Qcm+C7hcRe8ZdJep6pb/UBM30w3qunA5Iunhbsh5WqRffjnqyKbSr/XTejXj5aFv9eQ5RPz9KZegXmHSksiXTj6ByQTl+uYy4Q5i0e0W5sLZpx6lZTMPVaF64tw8+zH4buXKxVsWfBK2bNpehr6Zp9TfXzUfL7U7KXig0YXO4rhbHpS8L6m6uYH3DDjfcF43TlZ966VDXNhTY6Tz9pzzhKxTTAT7wUoI3dtiuQvqrD4pzY8NR3Lc4MrlTNEmPZ5QmU/U2aIaYwSEAxYe3QuWDVgZHbE2jNzyFfj88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmJU8MBtJgPGvH1J7TZ6wU4CGefrR52z4qRoZgLOFKY=;
 b=d5w73PUttESO/NyfCaC62M9LU+wBD1gXY8xKJUxtacddybfgrfozF9tWheT4aw5LRk0BAEHaOLu8LAPgftY0MfcXJB5iWStyyTq0tW8rMMh6zAXTPxZOpe68UPVw3WHq82TfuP5gIdHSxcvEnOhp2gIECBtE8TFhbEbcrixYv5owvC8CwWbxrGmZbedr27Pkw/3lHm+5sxR1frwosjI+PM2LF2bQSKlI4GFPVsu7mNb3Hxy9s7HTKP4/Atg0bNIfLWpV6ZzsCMz8RRbrE15o7jikGjfbnXvO7ZoZg8U9A6szGZgqMVuLENkJPS6VK+LDQuHhwVArD50iHaBSYD+kAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 15:52:28 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 15:52:28 +0000
Message-ID: <6b7d1191-c692-4377-a37e-c087bc7215b3@nvidia.com>
Date: Thu, 6 Nov 2025 15:52:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] i2c: tegra: Add support for SW mutex register
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
 <20251001064759.664630-4-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001064759.664630-4-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0211.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b50814d-8288-47d9-cd37-08de1d4c7ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnhGTWg3MExsdDlOY0tqd0t4UmJMNkFFOVplZGZyME9NVFBtUm1sVy8zT2Jp?=
 =?utf-8?B?aVR1QzNlc3RuSG1xZzVEdS9VcnZCUk1TTnY0MjZadFN3ZHlsaFVVZitBQVJB?=
 =?utf-8?B?TmEzWlk2WlJFc3loTGJsK3IxWmJYWkNrbXNsdlFkWUZqY3NSZDE3N01pTTlP?=
 =?utf-8?B?OHB3V1lXenk2a0VteWQ5clZNb0xTd0UySkI0QTl1SS9HN0xURnVWVFZpME16?=
 =?utf-8?B?UzB0TXZxZVExTVBOaDVIMmlZZmNXRGdRNWthcktoTG8zZC9ISVUwQlNodGkx?=
 =?utf-8?B?bE5icFl0V0tDQzByYW5IR0Jha0V0ZFBERmFWTThIam8wbzZYeUJWeS8wTThv?=
 =?utf-8?B?eHV6aTRxbUIwRloyS1dGR0hEem9IS1lzMUViYUFmTThvQUF5bEJGaEZ1UktG?=
 =?utf-8?B?cFFiOFRvRExkS0NRcmtpQW1KL252bENyNTlGZE1ISnBXT09QZmRUNGR1dWJy?=
 =?utf-8?B?YUx0Um11UDRsUkV5ejIzNDZJMFJwYTNCNndPZFVwWDI0UGdMcFhIRnRBZnpu?=
 =?utf-8?B?bTBQYXQ0QzJNd0QvWHk0MmpBVG1GWk5vdWtSdHhMOS9HSUhqUTRMT2dvTjRw?=
 =?utf-8?B?RkpvbzNVNnpqVUx6aUlGTkhKalBHczRNbmtkSmdmWW52bytJVnhLaXZENlo2?=
 =?utf-8?B?MVJFVTNudmN1TXNONi9XTDZaQmdzcUY0dFlBZ2VCSENBUFZ4ak1iT2dqSXN1?=
 =?utf-8?B?ekIwQmMyU1ltcUZXamhhRDlsd0taVGlvaS9ndml1WmFwK3AzTmx6ZHlVaTRJ?=
 =?utf-8?B?ckZSbStobUhvS2hnZ1J2L0ltekNPK2JsbTJwRjFaS2NZR3JYZTdPUGY3VlNL?=
 =?utf-8?B?c1Z4aTl0bDNrQy8yZlMxemRBOFNPbVh4MFpROThiSnJZT3Q2WkVSZkNrL3hk?=
 =?utf-8?B?UWRnQU5PNktTeU9CaEtNN1NBdkdZNzRLTXQwTi9uRXRmaEpvLzN4aVk3Znlo?=
 =?utf-8?B?bzFhNmZrWjdzUHNpeU5HbWFSbGkyZXVuRnNPckpJVW9JM1ROdnMxUnExM1JL?=
 =?utf-8?B?VVRYMUhOak52ZmgzOEVNaEp5bUY1ZEdEVXhpTUd1cDVmbjBScXVRbDA2RFFO?=
 =?utf-8?B?V0I5QnZIdUpBN3l3UjM4SkZFWndBTy9PYXkrb1Jad3V2ckRvSWRpZEh6V3A2?=
 =?utf-8?B?WWNhYnBMamtHSndtWlNnTkU2aFNJMzJVci9jVkllSUx4bi8wSjhSWUF5c0or?=
 =?utf-8?B?MVRXVVVjYk1CMVpzM1h5bDIyV2F5SnBPalA3eVZJbDBlWFNSMUxqRUloWHRt?=
 =?utf-8?B?ZWVvcGwxdGR5SUhSbFYwY09Oc2JkSVphVGdBUU9WeDRSRlNyNmYvVUg3aGNZ?=
 =?utf-8?B?NXh4ZkNMZ3NGS2NUWnV4THRHVUFwbUZVcFpJbWxVQ0I2Wjhzc09NM1lhVVph?=
 =?utf-8?B?U0RrT3RkZVVDdUg3RnlSU3hwVE9TVVVLdFR6ak5iMGZXZ2lac2l1WGs0ZU1R?=
 =?utf-8?B?M0RhMGpQT244ZTJIYUJLSEx5a3JuNE9oOFZGaS9QbWpFUWlIYlJTREd2QWRS?=
 =?utf-8?B?bTVrWUljVWYwaXRqSEhHTjVMdjFJd1NURTE5dUlra0M0UW5IajZWUlhTN2xE?=
 =?utf-8?B?Z2xFazVEMEFjazdEcjM2QWd3MDRkYm0xSGx0MkJiV0U4T0pYbHBnZ2JrNnpP?=
 =?utf-8?B?QVhvYkxWeUd5QXdqOUd2UlFmdGpSM2lhWVFLcUNBN3o2S3ZLaWpnYzQxZkt4?=
 =?utf-8?B?TFgxRHhVWmdXYWg2RHJYN2w4R29vOVdENGhQZEdHcDBlSFFuYUlTWDhqZVFZ?=
 =?utf-8?B?N1lTSDczemZ0alJjcTRiQ2lEeGhvdmNybExKaUk2UzNHYVR1b05qNEVQYnoz?=
 =?utf-8?B?SzQvMEthQS9tZzY1OGg5NWNmbFo4ZWJLR0hMQlVxcGtlQkhJNnI5M0dTU21v?=
 =?utf-8?B?Y3FIVW1ReDQwZllOUTdYSUN4S0U0K2RsZW1XL1p4cVV2Qkl4c0JBbEVEdDRB?=
 =?utf-8?B?MVQzTVVoMnlZQTdrVVhEdURWYlh4cURoK3J3RzM0OTFMSFI0eHY5UVoyV0kz?=
 =?utf-8?Q?I/9nzT29amAJZYp5QDayqLn5VaXuoQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yko1QmpadDNFM3p2cFArYzZTWXRQTC8vaFR1U1F4UDIvOFJhN2pOa3dpd2R6?=
 =?utf-8?B?bGhqZk8xVjVGQm1XQ1J5WlpPL1NyV2NCMkFhUnMzSGJFd2V3c1VDS1lGWE9U?=
 =?utf-8?B?SE5MYkJIMGxjUTNpcmFYZTNBUFBOYmVjQnVjSW9aSVhkdVp0ZVc5M1NuY1d6?=
 =?utf-8?B?RkVoSUl4bkZrdzdRMkdZeWtpWUZobjRmWENsS09EVWIvS3NQQzFUWHB0RERu?=
 =?utf-8?B?OUZFdzg5SjBaaDJ2RzZEYXRFV1RQTGlpMVRwOEhQa041VERZZ2RNZzZYL1I1?=
 =?utf-8?B?RkdHdSs2TDc5V1IvaGIzdjVucklwQ0NLeDR4a3RpTFdiOU1CZk0rOE8xWXY0?=
 =?utf-8?B?V2k1ODhEdFlubk9KazlvQzlBSGhWRmM1dDlwYSsvVHhzWU9oT1A2cExyNU45?=
 =?utf-8?B?aWFTMnVkRTNYRm5rLzlmVWZ2eG5iaDg1Q0xISHg4cG5FUzBrRFIvUENzY1dS?=
 =?utf-8?B?UUdGZkMrcy9nOWYyVGRUZHQvVFhRQVRGcUFSOHF1empwazdYd1VKbWE4MFdV?=
 =?utf-8?B?b25tM2QwbWxmdlh0eFRObXpNZGljQWxpM0hkcTRTbXdsK0FNaTJDb2FjMTZ4?=
 =?utf-8?B?aFg3V1Z6K2lJeVFIejVZMlRYNFRhaHlHcmJRYVdSazFFZmJwb0FkOFZEMWp6?=
 =?utf-8?B?RFFpYURubEFMcmJEVTJWNDloWExwbWh3VDdBVHRpR2dNUXE2bk04WG9FL0Fp?=
 =?utf-8?B?MTVVSkNvYmhQQzRYUWdRRG50RmRlWVJCRmwyQ1ZBMUdpb081OUMwSXZGWnFE?=
 =?utf-8?B?cEtXRVROcVRRcUV0VEUwVy9YZGVlVGcrMzg0cXVGb0tqVjBXRHNJSUhRNUE4?=
 =?utf-8?B?ZEhzVlRVRmFIYzdNbmFVaWY5YXVRUisrMUZJL0h4VHRyRkh4KzVreng1UTE1?=
 =?utf-8?B?OE5kR1hYazhlTHV6UFd4S3FGN1JtclUxMjU5M0wvSEZoQUJRSDJiZThnTy9w?=
 =?utf-8?B?OUlna0QvTTNrR0xXM1U3RHJVMDFvS0U2ZXJnMnFTdU5OenBEaDZ5dVBENnh5?=
 =?utf-8?B?dWE0OU0wcHBjVGRJaTFSaEJGNWswMUxqeEFyZmROeWNrNVRSSTZzRENjVTF5?=
 =?utf-8?B?WS9tb3FDMFVQRHdHNFl5NHhKOEVib3IzK0tnam1VRkhOVUZ2UDU1SE84SC83?=
 =?utf-8?B?WTRWU09ZRGJpalQweFlzT0cxbHlYb21HTE80d3kwSnM2bGdXOVlyQXRGT3VY?=
 =?utf-8?B?amRaZUxKbElMU25VbjE0ZUtCcUdpdG12Tm9qMkdRaWx5VThmOFBKUDkvMWs0?=
 =?utf-8?B?eGYrTWRzalFPbFdMZjBPbWd1ZjhXemhvT1pGT2IyejF4QUNES2trUERQM1d4?=
 =?utf-8?B?eUVRMGpHMUt0RTB5SE54NHVWZUhqRitBZ2dkK0JuWDVoeEJBTUFRV25iRGY4?=
 =?utf-8?B?eEcwMXFBako3eURibFNDYmFkYUQwSVZYbHd0QWR2MHJnT005dEc2MWlxWXIw?=
 =?utf-8?B?N0dyakREVTJjbWVNQTZNVExjaW9jaXhMVjZjTkxBS0lBMDI0WVdZUFZtOWtG?=
 =?utf-8?B?Uzc1UlUzd25VN1VHM2ZydUNITUJKQWhMWjZlTnNvTi92Vlp0cjZyMWxiZGZn?=
 =?utf-8?B?YU1WcDdWZ2t4NFkvUnE0VW03TmlDT3p0dnd6aU9TS2MxSnExKy9ySWlmUHpX?=
 =?utf-8?B?NnhrNnBTZlRMREVGNEZ4OGl1QmZmTFpIb2NwVHB1SWtFMndCZW00U0lHdnZ5?=
 =?utf-8?B?dnhJZUtmbUI1bFdPc3RhZHN5dFQ2TUhnRDRraVROTFNua3NMOHE2RTlTaVNJ?=
 =?utf-8?B?eTVHVnU5TEJhbUdrSTUzbkREQ1BNTjFFVy84cS9lYThQNVRQRVZjMkp0R0Nr?=
 =?utf-8?B?WFhPbHp4WGgxY2tnTStJMlh4ci9UVjFsYkE0STBVeGo3KzJ3cXFUMDkyaWtN?=
 =?utf-8?B?ZUo3eGptVVJjeER4Vk9WYkJORzBrK3FzaXFTOStsTS9RT0JUWExJTjdCdnVp?=
 =?utf-8?B?SGRhaEdyOEZXN2tzTytnNkk3RncxRDJiOCtLOWZJam9vaGhZZnp0MCtWNXI0?=
 =?utf-8?B?NC9QdUk0bXpkQWFycDFwdzVkaDNoWFRMRnZtdThzZTE1Z01ZQnRqYmJQb3Iz?=
 =?utf-8?B?cmdyTmNoam9HanhlZXA1cTJLVE1Qa0VTSjhNTUtQb0hYNC92ZGc4SGwzM1Vs?=
 =?utf-8?B?RE56MEVtcGlJSDdkS283bVRpN3A4RFQyUnU3emtvTVpVdW12a2pwSVdpcmRB?=
 =?utf-8?B?TW1sRi9RUnRWQUtEUnJrZWlHS2xYdmZNSHFEcEtMeklpZnBRMHpadGpDcFcz?=
 =?utf-8?B?UE1XN0ZpdUlkbW92N0pQM2ZhdHVBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b50814d-8288-47d9-cd37-08de1d4c7ca1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 15:52:28.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yc6UMjfg8ZTzfYOJfDPn6xE5hwtJhFA5Dex4Pb8GlsUjyQZjuDHtM1p+iO9p7UvtAH9pRFjOdDybbOYwIoL7cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284


On 01/10/2025 07:47, Kartik Rajput wrote:
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs. This involves following steps:
> 
>   - A firmware/OS writes its unique ID to the mutex REQUEST field.
>   - Ownership is established when reading the GRANT field returns the
>     same ID.
>   - If GRANT shows a different non-zero ID, the firmware/OS retries
>     until timeout.
>   - After completing access, it releases the mutex by writing 0.
> 
> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v7 -> v8:
>          * Use `bool` instead of `int` for `locked` variable in
>            tegra_i2c_mutex_lock() function.
> v6 -> v7:
>          * Return bool from tegra_i2c_mutex_acquired() and
>            tegra_i2c_mutex_trylock() functions.
>          * Move `has_mutex` check inside tegra_i2c_mutex_lock/unlock
>            functions.
>          * Remove redundant empty line added in tegra_i2c_xfer() in v6.
>          * Fix pm_runtime_put() not getting called if mutex unlock fails.
>          * In tegra_i2c_mutex_lock() simplify the logic to check if the
>            mutex is acquired or not by checking the value of `ret`
>            variable.
>          * Update commit message to describe the functioning of SW mutex
>            feature.
> v4 -> v6:
>          * Guard tegra_i2c_mutex_lock() and tegra_i2c_mutex_unlock() to
>            ensure that they are called on platforms which support SW
>            mutex.
> v3 -> v4:
>          * Update timeout logic of tegra_i2c_mutex_lock() to use
>            read_poll_timeout APIs for improving timeout logic.
>          * Add tegra_i2c_mutex_acquired() to check if mutex is acquired
>            or not.
>          * Rename I2C_SW_MUTEX_ID as I2C_SW_MUTEX_ID_CCPLEX.
>          * Function tegra_i2c_poll_register() was moved unnecessarily, it
>            has now been moved to its original location.
>          * Use tegra_i2c_mutex_lock/unlock APIs in the tegra_i2c_xfer()
>            function. This ensures proper propagation of error in case
>            mutex lock fails.
>            Please note that as the function tegra_i2c_xfer() is
>            already guarded by the bus lock operation there is no need of
>            additional lock for the tegra_i2c_mutex_lock/unlock APIs.
> v2 -> v3:
>          * Update tegra_i2c_mutex_trylock and tegra_i2c_mutex_unlock to
>            use readl and writel APIs instead of i2c_readl and i2c_writel
>            which use relaxed APIs.
>          * Use dev_warn instead of WARN_ON if mutex lock/unlock fails.
> v1 -> v2:
>          * Fixed typos.
>          * Fix tegra_i2c_mutex_lock() logic.
>          * Add a timeout in tegra_i2c_mutex_lock() instead of polling for
>            mutex indefinitely.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index cc75340f6cb5..1c8c24ae54ed 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -137,6 +137,14 @@
>   
>   #define I2C_MASTER_RESET_CNTRL			0x0a8
>   
> +#define I2C_SW_MUTEX				0x0ec
> +#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
> +#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
> +#define I2C_SW_MUTEX_ID_CCPLEX			9
> +
> +/* SW mutex acquire timeout value in microseconds. */
> +#define I2C_SW_MUTEX_TIMEOUT_US			(25 * USEC_PER_MSEC)
> +
>   /* configuration load timeout in microseconds */
>   #define I2C_CONFIG_LOAD_TIMEOUT			1000000
>   
> @@ -210,6 +218,7 @@ enum msg_end_type {
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
>    * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
> + * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -237,6 +246,7 @@ struct tegra_i2c_hw_feature {
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
>   	bool has_hs_mode_support;
> +	bool has_mutex;
>   };
>   
>   /**
> @@ -381,6 +391,76 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>   	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>   }
>   
> +static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	return id == I2C_SW_MUTEX_ID_CCPLEX;
> +}
> +
> +static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
> +		return false;
> +
> +	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
> +	writel(val, i2c_dev->base + reg);
> +
> +	return tegra_i2c_mutex_acquired(i2c_dev);
> +}
> +
> +static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	bool locked;
> +	int ret;
> +
> +	if (!i2c_dev->hw->has_mutex)
> +		return 0;
> +
> +	if (i2c_dev->atomic_mode)
> +		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
> +					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
> +					       false, i2c_dev);
> +	else
> +		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
> +					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
> +
> +	if (ret)
> +		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
> +
> +	return ret;
> +}
> +
> +static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	if (!i2c_dev->hw->has_mutex)
> +		return 0;
> +
> +	val = readl(i2c_dev->base + reg);
> +
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
> +		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
> +		return -EPERM;
> +	}
> +
> +	writel(0, i2c_dev->base + reg);
> +
> +	return 0;
> +}
> +
>   static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>   {
>   	u32 int_mask;
> @@ -1432,6 +1512,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   		return ret;
>   	}
>   
> +	ret = tegra_i2c_mutex_lock(i2c_dev);
> +	if (ret)
> +		return ret;
> +
>   	for (i = 0; i < num; i++) {
>   		enum msg_end_type end_type = MSG_END_STOP;
>   
> @@ -1461,6 +1545,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   			break;
>   	}
>   
> +	ret = tegra_i2c_mutex_unlock(i2c_dev);
>   	pm_runtime_put(i2c_dev->dev);
>   
>   	return ret ?: i;
> @@ -1537,6 +1622,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
>   	.has_hs_mode_support = false,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
> @@ -1563,6 +1649,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
>   	.has_hs_mode_support = false,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
> @@ -1589,6 +1676,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
>   	.has_hs_mode_support = false,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
> @@ -1615,6 +1703,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = true,
>   	.has_hs_mode_support = false,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -1641,6 +1730,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
>   	.has_hs_mode_support = false,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
> @@ -1667,6 +1757,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
>   	.has_hs_mode_support = false,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
> @@ -1695,6 +1786,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
>   	.has_hs_mode_support = true,
> +	.has_mutex = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


