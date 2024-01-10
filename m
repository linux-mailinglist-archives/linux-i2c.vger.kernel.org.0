Return-Path: <linux-i2c+bounces-1255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C6829E1B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 17:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99BE31C269FA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8E44C601;
	Wed, 10 Jan 2024 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5uoxc+FL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADA3DBB3;
	Wed, 10 Jan 2024 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YES1pfgFrrRTuI/uWi1ah41qgDql6kITdpF0Lye3grWGBFcYkZikQniS1A4TSbhWQienCNwCaTjge4qGLZi9wl8gdjd2l5zTD3i/aUYewclk0w8VSIwRUqTTb+4ImVAhcylFQWqVfhRoZ6ZFgKvQ54QL1IrbRniV8fkrIzgsv0Fo6A3Gzv9KcE+NtQcHSTJmqYHt4qT4s3iYpl36ZMQymKiobn8lvP0EcWmEhoS/63G9BOe519gHzp8pjXchr00X3nl9/Kdeyq1XHcerURkJXonp/JCBivLLI7sz7Q+UKZ330YA67wxK9e61zcMiVZXEZxajoIWZP5MvmwFGKZO9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeXflxtORiT0VDR05zVQUDQKiVQntVyMeYxV1GjjtX4=;
 b=dR0DuEqwYdXzULQhwwFNmLapclkYWBOnUHzqTpxVTYLpLb/K7BPPE2G/as4y/KU5UqRwQkFzTrM9T7v0CPT+D4LSQlNe1R7Q26yP3pJDUg1VjNinYtSc6fF3miZ2jQn0VjXXk50nddfX33kpvXpDvI8qwdXnMaqiTY4AcXPc8/xVfeAG8I3dcxyfMBwZkfbrO50H+0L3V6NifbHaG/neUMePyYoFRT7JWG5gklKDKIsusBexD0v1FJvzUuR8CsAxO6wbHTGbtyX6/+GXFwLWeB7r0iLC3YzC7BvyrsnBuOGWrhkZzQB2ISURwUkkslnZmVDukYHHGVIjLz/BkqUq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeXflxtORiT0VDR05zVQUDQKiVQntVyMeYxV1GjjtX4=;
 b=5uoxc+FL0YhSSqhN0ubqGMhZi7T9w7LZbkxd2M5WN3pZ8QCgUraQJd32KlswQ8QgiTlyzA6cRWcD+xFViddJCzb/Ih9S2/alNfkdDv20JQAVJr6lDjEh1Ylf8p3/ObuXy5UBJdVE1uIi5XV4q+fBbdUHhTPjD7wzJ3EcEmvo5Wc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16)
 by DS7PR12MB6312.namprd12.prod.outlook.com (2603:10b6:8:93::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Wed, 10 Jan 2024 16:00:33 +0000
Received: from LV8PR12MB9360.namprd12.prod.outlook.com
 ([fe80::b8ec:c90c:f40:a4e0]) by LV8PR12MB9360.namprd12.prod.outlook.com
 ([fe80::b8ec:c90c:f40:a4e0%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 16:00:33 +0000
Message-ID: <7d85fd51-3e5d-40b8-a8d1-b17e9588337f@amd.com>
Date: Wed, 10 Jan 2024 17:00:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: cadence: Avoid fifo clear after start
Content-Language: en-US
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Andi Shyti <andi.shyti@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To LV8PR12MB9360.namprd12.prod.outlook.com
 (2603:10b6:408:205::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9360:EE_|DS7PR12MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: b44c5932-9682-4bf0-b138-08dc11f546e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bCoj9VUqlq/gK3e569cWvQhr3puZ2nnUKrwwG/7rB4Kbz7zbtl576C/AtECqr6G1ZyCXMVGbIEFEeN8UHwx+tkTbbckOPbkeIG8zoZ1eJHRJyXCU1D1uhiPCxuIHxb8OE9IDfCS2wKIsNuSm/H2+7WABlmFLnvmcL//KWhWOrecTxRDC2TvsgS59mc8gV3BNPk3DAHHicpH6+nUyLoaf/WDv7OS2gK/Q6jrz91WJuh/+ecvPWHU6J5BZu0Ln0V6HCbiBVsTmbUrkjY21i6cL1SvLYTk0ES/ECiSSFi2WGiNZJKwuRZU7/2RraLm6YkdPZm6joL+rXn/4daf0LtsJN3iCHiqbqARAT9oXBUXgQCZAKsba5s7//U8AkjYmKI3JhcAGeTCfRpp/cpxZTfDngHnOUDwVr9eMZ+6VD2Ovo5FJ8FNYTlyE3dln+EPw9si+TTQ3YShcoDJ311FteNNPO7RDs+FMe8FUn0WqFaiYcph3vN4u2QHyQXTbCqSO4FmOGojp1DVMixjApyf075yAtdRwXodMiFILg0h1IVeSYrg07VyLINaRKbg3vrdyyfbPgEYwoUPA+rh5+ZNL/sh6D9myMSjvGbO2KALeP9aX1IQi0ue1Gv1uvjQ/Ow6Lvcp2LK5ZMsrqxyWhkmbo7NfsMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9360.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(53546011)(6486002)(2616005)(6506007)(478600001)(6512007)(5660300002)(41300700001)(2906002)(66556008)(8936002)(4326008)(44832011)(8676002)(54906003)(66476007)(66946007)(316002)(38100700002)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFBvU21ZTjhIaU1NYjhGazFaVWlCb0FvTDE1dFI0M3dtRDdOeDJuQzZxY3pa?=
 =?utf-8?B?UXFFTGlWUENPa280eUJWYXd2aUdWUUZ0aUVDTVJuSGRJbmNpb3hUeTF2Smx1?=
 =?utf-8?B?U2hZNGVoL0lrYlMwQUZ1OG1mVTBsaWZKOGpHOHFCMHFJcVUyWXJ3elFlUDZp?=
 =?utf-8?B?NnpVcU45Z1pWSDJBZndEdWRsMlhSM21MQ1hISm1uVVpabFMvWHo2RUVEU1BQ?=
 =?utf-8?B?bDA2OUdFOFpOMDRoa2FySUp1dEVZUlNlTnJDWXpqZ084M3BlcXlNb3drRWV1?=
 =?utf-8?B?bHh2THBBTlN4QTQ5bFN1WCs3NXpnellNaFJqMGE4VzNrRFBiUUtnZHoyTGhn?=
 =?utf-8?B?RU1mYkYyWFExMWZ1azVISmFuOXd3bnErRWVhc3ZTT3phdDFBUzhCeDFZSm9z?=
 =?utf-8?B?N29pY1FxZERZS3VacC81UU5TL0ZlTDYzRUhYbkJxSnhTMVY0K3p6OG9IbkxX?=
 =?utf-8?B?QWlEQ2xyMkc5UXpWMkY1UTJkc1ZnK3RhV0w2N2hqZVlwbWtjUW9WWFlPN0xB?=
 =?utf-8?B?dXh2dkRZMW5Ecmh5aDRoVitEUWJmK1lEcEh4OEdLbXJ1R1hXMWpWc2VXRHY3?=
 =?utf-8?B?MnFvT205RWQ2SjNHUlJoQVppN0prMzlnUGZhWnljT2kyclY1Mk9QUzhmSmRk?=
 =?utf-8?B?ZFo4NzlRcS9acUMzOHNLWEIrUVJwbmxiQ0N5MlB4UzJ2NHhuWllDVHZkWkND?=
 =?utf-8?B?NUZpL2d4WlR6cG1KYWl3TEt4akExVTI5UDFYdE94alJjVlFoNHFESGxBVTVB?=
 =?utf-8?B?b3JRd2wycnRtSjBIU01IRkNBVzRPYjRmWWwyNWM5MEVncW91b2NtRHBQU21G?=
 =?utf-8?B?Q0hQQk9OY2RiMHR2SHhhdGlCdUlLZHArNUxOWllnWFdzdGY1MFBIZlJHd1or?=
 =?utf-8?B?OHR2Mk53VUo1d3NXeW5vQWNwTVMwSnMvZlBGZ0tXMUVBem9sWCtkcEkvN3lM?=
 =?utf-8?B?L1JzWW1uZTJ0QmNYN0ovdnlIS3E2OHRvN1ViZm1zWWV1UlduenptR1RPMytt?=
 =?utf-8?B?MzlrWWlzY3FJVkF2OUQ5NzR1OWpzNHJDVkZnWVVJdXpxdDFhZDZ1OGUySExM?=
 =?utf-8?B?ZmJnOHl1L0orV0JscnMyQ1llUjZSRzU5cE9NZUpwQTFaN3ZTTnJSVzY0Tld6?=
 =?utf-8?B?YmNkTFFWblM5b283SEVhbVBBVmRCajl1TnFRRVFhSjVJZm0wcGIwQWhkR0o5?=
 =?utf-8?B?RklMSU5sby9YcUlOenNrRkNaVU5HaGo4UGJtVXdHZjlPTkpuRENRUWFHQUtD?=
 =?utf-8?B?VFIvcTBEZGppd1BPOHpxem9TYzMxcDB2RUpnMzY5NjlkMFRQS1pmTTh6cXYy?=
 =?utf-8?B?WEJXR2VjL2J2em9TSGN0ekVQVDVMeDZybXZNZUNCUnl4NStTcDBsRUhGaGNq?=
 =?utf-8?B?UHRybWV3TFBnMy8rV1NPSnVzTWMxcHgxeld3c0hITWRFSytJU1I2Qlg0WDFW?=
 =?utf-8?B?aWJOQzYzMTFVLzUxaVNFZWY1RGFXby8xbU8vQndBUzdmRHpWbzNqUHFBbWNr?=
 =?utf-8?B?blRTTGY2R3pqZTcrYWx0NVRvam5KbUFDQ0Zqd3l6YWV2N3NKRHpDN0xkaEky?=
 =?utf-8?B?Z3kvaW43b2Q3UjRJM1pLVWxWMFNQV3dzeHpKVW5qcVVoaFc0ckF1RkllOTdQ?=
 =?utf-8?B?UFBVMWp1YmJHR2dHalNSejRzSkE0cS90cEhyOXFabjhMNlVJT1ptNy85UHdY?=
 =?utf-8?B?RlpjM005MWQvRjlMa1cvL2wvSklzVXZuZmxvY2pDVkNHMmxuWUdRdCtma1ly?=
 =?utf-8?B?S3BxSWZCc2FqOEh0TDZuZERNTHdMT09vTUlwdERCaWlYdXB6bDF5OGZ2eUpO?=
 =?utf-8?B?M3MyQkdqYzlkdWlKdHdNTTZaTjhzUDJzOHRyWHROSTBOSjlnSTNLV3JqZjl4?=
 =?utf-8?B?V2dHa0o2djY0TnpGWWVmYklMY2Z1WW5zcGNNNGZmc0x3dGZ6REJPS1BjaE9T?=
 =?utf-8?B?V2tIMjlSd3BTb2tSQUpQcGVyMlhtQWRMelB3bDJzQmxzUjNaMWJFS0dFYm1U?=
 =?utf-8?B?V0hWR0l2azZsWDIrMWNIZ1hsQkhvVjE2QmZ2bXFTNENFNTZCTFJDSVRlcDlF?=
 =?utf-8?B?TzN1TjFNbTJ6aElseDdmbkVNMVc4NXJqZU0zQXlzU3l1RERrNEdOWkZQRFp3?=
 =?utf-8?Q?8JH0kW8V1WouasfpA8yxWYfjB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44c5932-9682-4bf0-b138-08dc11f546e3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9360.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 16:00:33.5568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6CtBzwVWcnNNOzM1ONc225nF35qYV7gccgGJu1U1mZKzL0JecefEK8vAEXd5x3K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6312



On 1/5/24 13:52, Sai Pavan Boddu wrote:
> Driver unintentionally programs ctrl reg to clear fifo which is
> happening after start of transaction, this was not the case previously
> as it was read-modified-write. This issue breaks i2c reads on QEMU as
> i2c-read is done before guest starts programming ctrl register.
> 
> Fixes: ff0cf7bca6309 ("i2c: cadence: Remove unnecessary register reads")
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index de3f58b60dce..6f7d753a8197 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>   
>   	if (hold_clear) {
>   		ctrl_reg &= ~CDNS_I2C_CR_HOLD;
> +		ctrl_reg &= ~CDNS_I2C_CR_CLR_FIFO;
>   		/*
>   		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
>   		 * register reaches '0'. This is an IP bug which causes transfer size

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

