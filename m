Return-Path: <linux-i2c+bounces-42-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5787E82D2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB106280FD4
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6E43A265;
	Fri, 10 Nov 2023 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="is1rgOgz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295F2F86F
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:41:01 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A9293D4;
	Fri, 10 Nov 2023 11:40:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbE/P/nPvj1/l4O+kwYcmsmWrZCKqp14lK2MQqVYpurAHJosxJXeiPdwdqGlKfBd45XvaToQsJzb5CS/d88jQCKhu0s8qvmu2SNXC56tL+xj0cmy9zhZglS+pJLu0xinZh5+PatUhBSaypfqzlfwk9FQByvU20/NhrIUdDn1KBCI6EUbu9lWBusSSMrenSmOtP7uistButUOvEVNft0PhbfhiS/IcSw+YpdvxALcWpkomDtTebUU0HYIc0ExlnGIIHfGI/XHm3RRnt+2y/aY2qnrhpDCPdemj0CQhZD5tAHZfPZZrMLiL3AsfeBpCrqd69QJv67DE+BTvoJ992tSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0g7qZwftRDaZMEDdDHJ0S1tJyMiUusXZIzqcQlRamo=;
 b=BKPIOGw8gn2b9C6caATM7G2F40S/IDbzwA3mcY7y3MYQi4uld9MEgBNheN5J1OHDedhuueLJKr9LxwfYsH2j82MyfayvXXdq7XWos+z+Glh6t1R/KMCmtsUnhxo+Je1UxmZ+AU/gEHN9lyjveTqOAO41AnO28BtEh5ceuml1hLgdJGiGzO41ww6a6/8FF4oeJJvgLu7ODTdkA52wkQ3VQFG6JNlTEhRYi/4WnAuwVYy5+fok/38FwdXOC2jEQKVZLG0hIbcnmn+Z3MtyvcXqs/qR87gLSR+SKHrHXXKB5ri26GwQ55l33I/asmo2mIfpzko+Rg6kPvFuJrvfDSTAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0g7qZwftRDaZMEDdDHJ0S1tJyMiUusXZIzqcQlRamo=;
 b=is1rgOgzMeJG+tbPtGT/PaThAqsKicPEfkcxI8hJ8ARU8bqLPHefZXAOFOToSdTrdXARK2Wc2FmUcp8HHYVK12EliailPiCoEaOWlVfyQJTy5iQ7YgAtEBWWL6X9tY/VzCkU+mRyW0yN7JQD6lIKKtWgzzAAufGmEq0Xq1Bxb7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 19:40:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:40:34 +0000
Message-ID: <37bc0819-1022-4141-bb1d-c7ee98be6654@amd.com>
Date: Fri, 10 Nov 2023 13:40:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/25] i2c: designware: Replace a while-loop by
 for-loop
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-7-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:5:337::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: bfeb469e-c8bb-4eb3-28bb-08dbe224e81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U5uzkISeJkI2RbxAdC2Qfq4U6UBw1BACoeCma8/32UzOkQrzBd88TN56H0XGkTAWlZA1lm3/SUSDvQ0T/1z9EvWWKiVvscS/1wUUtajFoF+7cUsuQwwJ6zDnsoqTcjNh02yNZ0PokZgZeHYchE9auS6BP3YmHCqzuZgdRX5rUbqwvJ5zER/Z0BXMmUWOW0vwK0dXPOkvAx7zjyW7Ikz7e/Xb2d3qggTXv/fmg8sG4FRXdaRDpfIRvWnCJsFp4Z58jDUYAvVRSiQItBsz+wZCmpjVt5AG+u/Tn2r0TnPYk/SoI+MzgP0uu5cYXPcp21Zhuvu8JX5yasBvcP4wCVjayFyfs6LzxN++W58pUH2Il9XLtEsbo2AwGK/hvBaNpXo83GemYDCEGRslzfy+Lb+20ugLCSJMfZB/9MNdI8/UVNR5m0Ge4TANKh8Oubvg750ku9aQa3lXPOgBEilgU/AAsrQ0rQDOFdBnX4PwYar9TQMpGyXzaQULngxUzUO1GN61Dqn+9N1czIsR2a88EaTJL0KrypjuHy3VdcbjuMYUivvDCXM6eZEQaShYaJjAswZCoZuzDtIgvRif41hXuWsjG1P+7mm7PJHAwmaF23Oy0df92K1rFzeumGw9AFMgjq+WJg0ZMvMu1zKVDkcIHcoZEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(83380400001)(66946007)(26005)(478600001)(6506007)(110136005)(7416002)(41300700001)(66556008)(6486002)(2906002)(53546011)(6512007)(38100700002)(4326008)(36756003)(8936002)(316002)(8676002)(5660300002)(31696002)(44832011)(86362001)(54906003)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVLbENNUEx3dXhENVB3WU9heitsa2hmVTR0dDJxcUtmcjhoN0p5QnJUbHZZ?=
 =?utf-8?B?S0EzelNuUStaOFBVS2ltcWZCQmw5VzNSazJlaFZDb3pUYlJRRVgvNm5zOXJ2?=
 =?utf-8?B?dmw2WXAyRnRjRkU1ZFZJUWY5YXdMS01Fa1dYcHRwalpFWWlOZlZGTVgwSGc5?=
 =?utf-8?B?VEtwNVBpVWw5NUpiWFpDWWlzT3JXZ1hMUnB5V1pweDA5RFl0N0RCbE5EWVhj?=
 =?utf-8?B?cVZRdlVNemNsaVZMdml1cWFIZnZOWUxVZjBVM3JyaXhTOW54VC9pRDNZeGdF?=
 =?utf-8?B?d2NFRUlVWXFZcnZPQnJobW5JcThDN3Z0VVo0OHV5T2tDelB4bjFYdFdNbUo0?=
 =?utf-8?B?bDhPSktmM0MvaTVTRXNxN1VSYjZocUdIZjZ4OTkrUEowZ0FVbGZIL0N1NkQ3?=
 =?utf-8?B?TFk4Z2kyZFppNXYycGFVeDVlM1VnZk91RlFyNGZ3aUxhNlR6dFlVcEt1RkxV?=
 =?utf-8?B?by9COXExaXNBckd3UkRxZEw2Qit0aGE4bVN0OE1nZnZjR3N1NGN3TGZEeDcw?=
 =?utf-8?B?SnprdjFjSXVvd0p6NVI2QVRuM1J2SHptb0VKQmh2TWdjaVp1d1ZJSDNSQmJx?=
 =?utf-8?B?Nm90MGpCRkhvWFVHaXNEQ3NsakJVYXhGb3ZMMU92aWVtMWtFSHdYdC9kZGJU?=
 =?utf-8?B?dThjcDhsVTZJK1BGY0VYR2ZBYVpxRDFheGJycHdleXlBU3p2YTlkRE81TEhP?=
 =?utf-8?B?VDRod1lNOTIzWlM1SXp5UHVTVUVwa3VrR0lWckpUZWJtOFI4UmYwVlFJV3Nx?=
 =?utf-8?B?UkxvY3ZDYUQwUC9NVHJ1VEx5ME9hMVVVNkZLUlFDUGlYZlZ3Qkp1RTJINU5s?=
 =?utf-8?B?dUY0Snd6SlZNWk43dnl5d200VjB5WUEraFBHNUs0R1poN2trM2RKRVJvTU9p?=
 =?utf-8?B?b1RYbEpMckFnclh0MUZERGI0QVYwVGlLaktoM1lweU5qQUI5MU9FazVSSjBT?=
 =?utf-8?B?b2JNUWdXbk5CeDRIUWZrRDlGL0hqV0lldVdVWHZFZmRuMi9vWm5KR3FxRm50?=
 =?utf-8?B?NnNWS09iQnNGR1FGZ0ZtbVVBMXc2SFF2TThMM2xFaVBOSHlwVC9UYW1JcUJV?=
 =?utf-8?B?UjlRbWNBNUtOR1p6cDlMN2tMWk94dE1LRFJqUUpvckxFRGcrVkhOdWNFb2lH?=
 =?utf-8?B?dDdITkwxN2lGUnF1cFkrQjJMWkJMTXFvN3J3bUo4dUZUN1l1U2lnckk1Tk9S?=
 =?utf-8?B?MXdWbDloRUxhVDh6cWRTRmFYcmZHZE5PcUV2MWxWTStQalAyaEFwYXVVRjM4?=
 =?utf-8?B?TDNLS1A2aElBZXoxQWhhWGZxNDU5c1gvcGxrQVMwQnpSOVJzVC9obklkSGFQ?=
 =?utf-8?B?TTRYenprb0QraVdmdWIwZVFSOHhWOURyVGFPMVV0VFp6K0YxYkJGOGZGRjhX?=
 =?utf-8?B?RW52WkNIdThZY0Qxb09vekMvemx5c25LQm0xUDN3c3AzOVZkT1NEMml1L3dq?=
 =?utf-8?B?cUlpRk5YdjZlRkoxbi9yM3VwSW55U1pBOWVZSUF1RVB0ejkySEd3K0ZHRGox?=
 =?utf-8?B?ZkJNSGVLanBtM1lkWVJ4VnRBWWwvbXdIZURxUmtsYlNRYnorY1ZlZUx0eXBx?=
 =?utf-8?B?ZklrbzV3Ti9kQ1R6ajJUbkNralFUeVJJamFXSzdHMUkrMW1jWmlMZTY0Q1pX?=
 =?utf-8?B?K3M5UGZlTm9jcitlRWRKcFM0OG9MN0VKZ250R1JmTDQ0cGIxRWZYQlRnb2FQ?=
 =?utf-8?B?SnVNdGVLZ3JJNGNYZGRHbk9MY0VlOUpEZmVMVFJBbXg4d1M4eER0d3d1aU1K?=
 =?utf-8?B?NzlTc3ZsOEFpVC9Ib2N5dHJIdTZjMnBGU0FkODlPZnlCUGREaHdVa3FtSUxn?=
 =?utf-8?B?UGdlRlRWWk1hejhlekZ0clJOL2lRQXJ6R2xicm5qY1FaUytyU0dKVm5uRVZP?=
 =?utf-8?B?OGp3M0MzMzZCZ0FoUUl5OGw4MjVUZmlVL210QjFvb2pKa0tSWDBOQkUyWTZY?=
 =?utf-8?B?VURTdE9Eb1hHNHo0TTZnY2g4ZEZVNjR4TmtSQTJpZTBpeW5ET1pkenBvVkNO?=
 =?utf-8?B?QjhyR1pKVkc1VGVqaDhia0NYdjdPeStHVktLRENteEZ1dCtlNVcreGxWWHEw?=
 =?utf-8?B?UloyNnFvVFNJcTFnUmR6SmRyb2xFOEN3S1J1TmRacTBKbkk0UnpsRkVhdTRN?=
 =?utf-8?Q?GKSqea8AaG7CN0/DNMObYCkw2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeb469e-c8bb-4eb3-28bb-08dbe224e81f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:40:34.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzYoTxv/2FdKY0GMdUPwz+c847RkT5JCSwdQZEsQSK9l4jnx2U1R4e9yMIQHCs3ZTTFDN2L5HihqtjfofJzKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925

On 11/10/2023 12:11, Andy Shevchenko wrote:
> Replace a while-loop by for-loop in i2c_dw_probe_lock_support() to
> save a few lines of code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 63cc3cdca2c7..cb954f11540e 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -260,11 +260,9 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>   	int i = 0;
>   	int ret;
>   
> -	ptr = i2c_dw_semaphore_cb_table;
> -
>   	dev->semaphore_idx = -1;
>   
> -	while (ptr->probe) {
> +	for (ptr = i2c_dw_semaphore_cb_table; ptr->probe; ptr++) {
>   		ret = ptr->probe(dev);
>   		if (ret) {
>   			/*
> @@ -276,7 +274,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
>   				return ret;
>   
>   			i++;
> -			ptr++;
>   			continue;
>   		}
>   


