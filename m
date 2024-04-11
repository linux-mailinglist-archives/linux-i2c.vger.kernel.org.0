Return-Path: <linux-i2c+bounces-2883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6908A094C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 09:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A48D6280788
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 07:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2226313DDC4;
	Thu, 11 Apr 2024 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kc7iw765"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA1B13DDA6;
	Thu, 11 Apr 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712819379; cv=fail; b=KLp5l/anuee/y/6RE2KjER38Ej2QAFw62ReW3mS9pT+O9p2YbbwsRJSmedtMwBd/K2Lg3tGoCEWSRunqnX8HAItlZvEy3Aw9a1KVN7OKBBK5/ZA7Fcj3zzbLQpfMencbIcF/fXSBVaA4DBv1e3NdmG5h3Og9FVdWc0KNODHPxYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712819379; c=relaxed/simple;
	bh=JOFpVK9j4bxbawmqWnCkJd/GOb9ZBnHd4anIOOWBuOQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pTfos5jOPQmpNYRTi0jJkGjIzIAiujUGUgWhTFVlGBA3jZkT+DiEFbXU2t41z0LNfy34Z//wUgjc9U3/6Sy3de73VSenANYzY6dojH5I7l9UQ3H/5DHenXffCyHXoCFuKDXMJr4Ezm/wgdeL+m6hI12Q8AJXYLRZi2ifv1FdQXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kc7iw765; arc=fail smtp.client-ip=40.107.102.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pud/S+KQrPzfLfe6bIXsndJKfSsVq+2lEUzEUosNZoKq4QmF1OgiMClukjszJ60JQqcJ8HiCIgsCHH61yvx7GbApqOYkRjUfO9vC+FSxWUzED7ZKZGNWxGXWSKdkjmAtoqbCNsAaJ9BIhbJdtGQkEF6dQHzu1s9BLjqh8Kqm3LiEhctrjKO1s551nqxemFJ2CRWTkId9zPvjM0Tbvl6jOexyOH6gnOhNkmOCXYY1/0LF/ngyISMTuWFWV2qhe29iOJUWL8AjazVoJmEREnhT5SPS/bFWy7Wg39zsdVwZIKTvKLS4s6FgJ0usy0mRM3wIjTeOe7An3JkBHXdUTHtMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StBsLQX2M1KkLmjTiUK+JXXm01mK/QQBG6ij8NWp2dg=;
 b=ctcUa5Ht9EOvz32SFFsBKaeszfe89Ns62KvsdE+D5y6hBfvBfGDGONLJ9ccOCEorZqlS8V66CFQHrPgXaUFcvdkKYgE1hEs2/gc2CqncsJ14XgnFRE/atW5Q1LR2qOpvpS73OHrbqC/DW2tc0ZEWmlesdJrG3BVWDO04HupJ/BCDCEmZzr5/KjM58LkAXMLgymVkensqNxzzS8H6GypK4rAJ8mO4TgkYQqB5srNiL+fSz+w6CrecXDTLQ4AgkjcKNSn/wvyiEm/ALm4PwwqkVvhd8SqGxG2mOwEKlEidQcWjGSxDPktk4vpZOsKs7W6yqeHdxwnMKbkeKm2lataO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StBsLQX2M1KkLmjTiUK+JXXm01mK/QQBG6ij8NWp2dg=;
 b=Kc7iw7659NtMkfKdIs73+u/n2eEJqPDsouMlV5GjTJCSlGfo22SzkCmv5nfTSNK1YnL+2LfRpd2ZdMo0XxuSPi6sALgnRl0R7rqIc+vTz2gqYtSFoeHkU6qeIsCCjycIB7OpLLyjiPUMae14CjMBR7jHOuBAwRRPZkHzfgBA4yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 07:09:35 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::6622:ec76:9367:3907]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::6622:ec76:9367:3907%2]) with mapi id 15.20.7409.046; Thu, 11 Apr 2024
 07:09:35 +0000
Message-ID: <2fb5426c-56ff-4882-8b2e-c68fbc723c8e@amd.com>
Date: Thu, 11 Apr 2024 09:09:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/18] i2c: cadence: remove printout on handled timeouts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-24-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240410112418.6400-24-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 533e89ac-f775-4ba5-e72d-08dc59f657ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kShT80+q6VSjeGh9Mt5IuE/3W1hdTmogesP+UlDGIbIgNbQqGj1dH/M4Cl3wr2e26QieH2X7GFC5OCek2fFhGWmt6YWlIAKPpDeP3KJHXdUnOxLqt7xKXWJO1q0xn2ehm3jufuhxz0//Bygxu0cNtgPpAmIVjGZ+b8ugIozBsWQy13vl3lr3NygaYfs4N+lqWFJ6KvzUlUpw1BC5jaHv1bCt5BPYLGvxT3GgJhLmz61jEgU65PsH2x2CDe7iTzOIOevpLfHxS/2GKFP7xEaJPhDED7w7dZiPrpaZRmDoDK1DQlrbpq1wqE10uyauK+pbKJ/cswBmbnVpd81y+P+CnCgWETsLquyL7O/ZKifj+VE2vx3NBTN6Dx+zYlvSlK9uwrj0NrRHn66aAKw8OKwtLxK4I6aXHUS7dt1c46xyE5oh7Ym9QAb4V33k0VyyC770SUECwwzVcFOMoFSCn7oV+igda8iK4hejxbq/GF9zN4IgoxjZnq1+D7LptEbPXgjGljtmwFgLkNVxI01QQQm0SoRIvOIqEc2Ma2z0gyixDfUPr/FLAo4nRB0js/p+2XzxhsULIVUhsZApdm/TyK6deI1Gra00L5dM5JSWXYznWzYFbGc+LlZ2/c05w04I6XzwRIB8mJzUzmusJatj1IuB+N61HaC8wuUx8c5k5GCq9gE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1nQTVJVjNrZ21JQU1MQ3ZxV3ZKQ09DQ09iUHBFOUJzWnFQOWxaei9WK0Er?=
 =?utf-8?B?QjhzOGt5bURqVjExMUorMTJpM0MvQzlYV3NQdlNKYlJzS1pseG9vRWZHYjJz?=
 =?utf-8?B?dG5XT3NJM2Nzc2hPMzJTZG9qVm1mb2N3ZXhnSDlBZVA5RVB5ZlV4WjgzckNn?=
 =?utf-8?B?TzN4RnRTMFVnekVzNHBtK0FLSTFydEdnU0FsRFBvRGNQd29SSS9zd244aTRn?=
 =?utf-8?B?YkxpeTg2RjUyTHA0WGpaSzdDdjZybGhMZXczeTlidmhXbXlIUGJ1RUhCUE5t?=
 =?utf-8?B?K0hpUG5POUpmVmU2THc5UThJdzV1S1djdXJPaDFPUjYrLzlUQTJPZlJXbEF6?=
 =?utf-8?B?Y1llUkF6NHlHK0VzYWhqUjNLNURRNklSRkdsekRMenEwSVRCRnB6OG5xMGZG?=
 =?utf-8?B?RUxld0M2dnVhcDV6QUFFYWIrWWtqZHd2RXpPWmVZTHcwTlN3Um92WXU3WC9s?=
 =?utf-8?B?eHNML2EzYklNUjg2QVQyQTMrbEFYa2s5UHdOc3h1UVJYNDNKNi9iYjk2b3Zx?=
 =?utf-8?B?aWtoMnBqTC90K1FTWkdIQUdWZk1qTkhncXJZbnFrcnpwSWh6d3dodEROVkNJ?=
 =?utf-8?B?K0JJZjltakJWaEFvbkVTRDZOb0dwd1JZYVBrMlZRaEV5RVl2R2tFeWx2UXlU?=
 =?utf-8?B?LzEvN1RMUitJQlZPWW5kRmFQcEFnZXJxQkZRVkxmUDgwcnkxZm9xTDQ4R2FR?=
 =?utf-8?B?UXVoNkd0VEV6UEhHaFhpVDkwRGIwb1ZVZFRYODJ1dmJ2TExUaUcwOG1KdExt?=
 =?utf-8?B?cnNtdFdoeXZUaHdMOWJTRkd5LzVvOTllREg1dmxQdGJ1ZnR3ZmVzN0xKditS?=
 =?utf-8?B?bUFYZzQxTlVERnU3UlJmOUo3anJWSXNVQ2lHU2VmMUZ5S1BQVlNKN3BQeVFM?=
 =?utf-8?B?VUdNaUg2dmpNYk44WVdLSStqNGNBbDFEbCtCNUM3SlltbTFyTmxmYVc2YjFi?=
 =?utf-8?B?YWlXT2dvc0xlbEZkMDQrS2VUM0M2NWI3akJrRnlMcGlWS0RpUzBjZk42dTI4?=
 =?utf-8?B?QjNpN2F6Y01UeWlYbVVWUDNpSGt6RUhIOGpJNEh5eXJBb2xIdXBRWUI2WXR5?=
 =?utf-8?B?ckVEWkowR2prNGNFbkI5dDlFVGQ1ZjdCcXpFOFhOcThaYkxyR29WeGxtcFpN?=
 =?utf-8?B?aHBOQ0RBckRKSStkWkFvZzFkaVBBTC9FUWNLV3FtZ2dUMVI5VVdTeXdzaXhZ?=
 =?utf-8?B?VFF4djZmdmZ4MjViMitiK0dRSW5kc0VGQWtaQTFRSXIyV2V2QUY1YUVyUkIv?=
 =?utf-8?B?YktNY0U5MlQ0T0dXYjVTQ2g0NUt6Umg5U0dyUFZoK1dQbDM2M3V2VzJKVjhi?=
 =?utf-8?B?VHpRdEJ6bEM4cmJmamczbkcwUmxEcURxM2lwVGk4N0M0aGtWeEdNNGQrK0VF?=
 =?utf-8?B?WU1ncmhERDNvNzZnQm1FbTRMaVFTbFdJZ1EvRTRTd0JkRkJTTTdiZWMrM2xo?=
 =?utf-8?B?NHFuenR4b0tDUThlTkdBOGJ3UFFUN2RqVTl3cVRiUk9Gc2cxbmo5R21QT0s2?=
 =?utf-8?B?QXg2VWFBa0VqeFdIYXJPOFVoVkdJZDRaSHJXWGhod0l6SWZrRTlpTXh4ZXF6?=
 =?utf-8?B?czBweWtIbXlNVVgvdUFNWFdEVFpXd1UrZHFmaTFFcHB6M3FaZXBoSUhubVZh?=
 =?utf-8?B?V3dSUFBJYWVNNERqZVNtWDlBQ3BPWHFjaG9uVFhEaUJNcGNsaTRrem1wYitC?=
 =?utf-8?B?a3lVdWVZTkJKWVhpa2VCaDJGS0pSZkVBMzQ3KzNEQTBsN1NkR2JQbTVNZlhi?=
 =?utf-8?B?ZWhFd2hqS1JVcWVBeUZKV1pMZ2l6WEVxRlBtb3FjY0NQS08ydVZUaFZVM3dq?=
 =?utf-8?B?cVcxaVhrSy82eHRDRS82Y3Y0VWRFRXdiMjVCMnkxYlJWT1FGNXNFVjd3SG9m?=
 =?utf-8?B?cmlFd2tpcHlmRU1WMEZXMjVGRXBXTmp1NVUyVjFpR3ViQi9Nbk52emtBMG1B?=
 =?utf-8?B?OXJYVW41alIvMzRIeXVIM0lScFNCeGs0MHJsVDY0VSs3KzJzUkRvUVhCTXdK?=
 =?utf-8?B?NkljbmhqZHNObTBGZklEWFhQQm1LdEduemwrYnluVjFXWXdUR1RPSUJONnJJ?=
 =?utf-8?B?bFVodnoyeGxuUnBKUTJ1Q2xleHVzZDY0ZTIvdFk1UHpmZ1AvWEVGT2x4ZEZP?=
 =?utf-8?Q?tDTTSrwtOT5+rL77PCNa4NnSr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533e89ac-f775-4ba5-e72d-08dc59f657ca
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 07:09:35.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/T9WnPAsQ83iqRD0dNAYstNEIpOssFBDlbgErU62SwqA0eNEBcGlQnWOMrcnTCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735



On 4/10/24 13:24, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 4bb7d6756947..1b0006e3b95c 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -789,8 +789,6 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>   	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
>   	if (time_left == 0) {
>   		cdns_i2c_master_reset(adap);
> -		dev_err(id->adap.dev.parent,
> -				"timeout waiting on completion\n");
>   		return -ETIMEDOUT;
>   	}
>   

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

