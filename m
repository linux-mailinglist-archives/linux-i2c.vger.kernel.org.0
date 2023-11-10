Return-Path: <linux-i2c+bounces-37-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 300167E82CB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D76EA2814CB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E583B7A9;
	Fri, 10 Nov 2023 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4emFbpLz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278A3AC24
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:35:11 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E51CBEA;
	Fri, 10 Nov 2023 11:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmzJFeBReC/LrS4cpwVja8h24Ra83ERiTTHM5EHEhYbPI9+Nfsa98aR0hUaYHGRgEGXvfNat2oe5ddWkZ+liMLdYqe6Yf7GP3EEGA4oe6M8jplSdNM08VCSS2jxKUNnCezx9XEfHREE5lzd0ZyHCDfGJUc0s7eTEBNPSySjSBqY776lRTjQkpKNpKt2zwFR+TIHUyTfABaZlI4q18dlidjv5cEHGGt64OhiVjL/OghDj1iXyZdG0IfQqSfFANhWmi7ZH0sg0vXy7NXWFjmits0Mt0WrycLGbmeLfIILzl9F2BUpoPo8bh5I1OyB4xcQj3T2T2ZVG3MOrDit9F0l/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNriyK82rdMHYkGAu2d2nxk3DoFjIOYlJcXsBLU8iIU=;
 b=cujZLyUFFNIt8kKokdP5BersprPmF2ILpd+bjmKV7jCqk1YTyCWEN3htza8i5mFSKCV4Jx08/cfHIpkyjq5JC6byzIsBfUIDbGHec2/UYtwAZIlJGrYqbPg8INwFKT8+UK5+CCjDY+N3UHQXJRH4Nc38nLDmClrOqCxEW42o3VJYH7Xz52iufdec2hqex8fYg+qMZoaVAbnvRmywzkHByH4fvxkozqV8wnXIbmFTMH5Z/2yGoDcg323DR8gSqOjVe5Gi7kcDBJZL7if6DtZCKgTqZOg3S3DuxOxMs+hBgaeuiHsF7A1YAGqtxYXf5AfQTYFaFaj3h318KNexATDsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNriyK82rdMHYkGAu2d2nxk3DoFjIOYlJcXsBLU8iIU=;
 b=4emFbpLzxApqinz7zujKkHlyUrK6W+jQiwVQCWrOb7rdt1C1BLyLspiEemMhJNqCJDgFIW6Vf1txVhydLL5YAnF6kJhHhoFheOEGvJqTWkutIR7j6+08zwfn10o7elZwWo4cxryommuQ5jiKlcmmPwZnPZEjbUczhVlZz+Bmz08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 19:35:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:35:03 +0000
Message-ID: <77e95133-a5b0-4c75-9df8-34bff49f0217@amd.com>
Date: Fri, 10 Nov 2023 13:35:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/25] i2c: designware: Fix spelling and other issues
 in the comments
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-26-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-26-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:806:d0::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de95e37-7f0c-445f-332e-08dbe224228c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPfF0R8yBNZ4duS4ZENCGqO1y1OTV/VAGM8ustxhc0cAsRq+/VAhyaBRrEPz2sGnqzJ2E5QMGVyqfGTmgVhbAmd21hM5NtrSS6uhk4reytBcrUjOnktZhyAp0GVhdPjWxzhyjmKaiYM00X6+PFl5OW9ly3gcZ+fbxTPszRlNgCYoLLi1wQQTa0zFdNy+Psv8B0jqoJmgXFYjfD7d/Gjf/nzb86GVVfzeT+TmuNYvY5c+vNpd806xdwpAtsZqiHnsp7q/H2XnFB6apG92//5VjK5IAwRWflfqcJ10iwwyxEh3QwSXWeiK6AWCEncvxzskd80Mn+SZSWvTv51gSkQEBxQ72ZimE7Zzuio80JkxZTc7bWbxZMDoE3hDnAEJBAAiqduITcuu/XyLLfjkWVUPKXuFY1jiJDiZS2PMucOSG4jbb+dFbR1dV3Ng2i/NuhFZgrPTts934y/GxI/iOrO2m41HdXMsIp6FZ/8ezxVAA6Qp+kdn52lIuivDQPW7WXDsZQKTHd4d8Pc8SpP+V2gFktBAb9MAnPbB+KuxFphm37IggHq3/X3W8VFLl1Z75B55UdXUZ4AiLQOuqg9si30tHtI53sMWlsxSzsP3SphH2xx6kuCqXpHeFdqKglMDH/bpjMXMOdRnN+xEy9YeLFm25Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2616005)(83380400001)(66946007)(26005)(478600001)(6506007)(110136005)(66556008)(6486002)(53546011)(6512007)(2906002)(4326008)(8676002)(316002)(36756003)(8936002)(41300700001)(5660300002)(38100700002)(31696002)(44832011)(30864003)(7416002)(86362001)(54906003)(31686004)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L25XYitIZFc4RTZKK3ZQSkVxZGpKOWlKek9WYjE4SFp3Y0V1VmlDT0NIY05P?=
 =?utf-8?B?ejVNTVFUTVhlaFF3aEhCMStRRmEzc2xHRDJubVVvS01Sc0hlbmtZSlZQZWgv?=
 =?utf-8?B?blBzeHFhbDl1YUxpQ3hhVU96VWpUcEJudU1La0Erd1dHdUl0NXdzdGxxVlhu?=
 =?utf-8?B?a0VuQ21RMUtPK0hpNnBTbkVVVXdwbTJtWkJYRUxpRDRpMmt2QWEwOHVWYVhr?=
 =?utf-8?B?cDFrdDNjSDZ4c2FHUEJiei9rVmNRNW5nTXkxWVVlQVRtUWRIdHRsVi9XZjQ5?=
 =?utf-8?B?VzZ1MW9mbkdYZ1BnR2RuSW4yUlVrWDVMVG9zK1dQRHJ2SVROdlMwNXd2TFp4?=
 =?utf-8?B?NWlIYVcxUXl5bW83RjYrV2FKam9uOFV6U2ZmcVBTa3JJYnZtWUtnR1dZWmlm?=
 =?utf-8?B?dXl5a0RUV2syaXJRTEhmQWJtUXk5MHFMSmk4VEo5blhBTlpQdWZsdkJhckFK?=
 =?utf-8?B?WStWWVc5ZEJGWTgyazNRVnQ3S3lBOFVUam9xVjU3NktoeTU1U1YzTGlSQUZw?=
 =?utf-8?B?Zm5NZnVSV3hHTy9JcU0xWlBFNnZ5SkJkOTlWTVFweWpieUVIRi9WS3NRWDdJ?=
 =?utf-8?B?SU9Da2J0MmJ2OVYrcUVjZEhlMjR4UXR0WXNLUW0xNVI1TXVnS0c3MWtUMGVD?=
 =?utf-8?B?TStTY2VzdDJNNGI2eUR6UUV3QUoxYWxvaFdsNU1pMG9rcUtyWlVUZjRtWDhG?=
 =?utf-8?B?Y2QzZVUrMDBKTnExTXVJc2E4b2FSOUMyb3lNNEF0VW43bkJ3R2VOZksxVW5I?=
 =?utf-8?B?SnhGZFI1UjhoOUFiVWRZV0I4QnNZL01NL0NrQ2ZNWWE2Sm1tU0VaTGZQeVk3?=
 =?utf-8?B?WExjR3lKc09oTC9JN2Y3SDNId3hVK0xzblBGWUtRRmpmdDFnbHlHWTNxZE9x?=
 =?utf-8?B?UkN5RVg4bmxwRG5RMWFEcUtrWUhKMU5Idi9EeklwUXZSejFSQlE3KzFwR3hq?=
 =?utf-8?B?clRLN1ZsS1NFYjJubm8zQUg0ZWVHeXozbWVVLzZqQXBHSXFmTWZ6ZGE3eDhh?=
 =?utf-8?B?RjhuVzRQdk9PL0c5aWwra29rbVZ4YmZsVVRtcUNsRVhVQm9mSlhPNDlKZXl1?=
 =?utf-8?B?OWd4VTY0L0d2UG5zRGNmZ3ZMMTUwN2MxUWIwK3NMVmlHSlhCVFRkUkVhZzcr?=
 =?utf-8?B?dWU5ZWw1ZlkrcGhrTGs0eUs1cEs4K3hGelRQNzJIU1Z6a3JoNkZyTlNwd1BP?=
 =?utf-8?B?eWRIL1R0aXVyZE5tc0RYQU5ETm5MWGNGMVk4TDlwdFpTSURvL3hZRVFOSGNX?=
 =?utf-8?B?UTFKNm1ONnA3TjRnWXRBbEdqQjNjZnMzTWthSTUxY0lTeEJVMnVEOHBqeHI3?=
 =?utf-8?B?clJ0Wld4a2RmUmJHWlpVeWVPQSt6REZFQWFPemR5YkMrczQ4RExvZGZVRkow?=
 =?utf-8?B?UGd4dXYyMHdFUSt6MDRMM2tVbk9ucDV4T2JuTkExVFU1bFpHbG55SUNRNmk3?=
 =?utf-8?B?bmQrZVVMbzJreHpPd0xtaVlibjg3cCtrTlBSL2lEcDQ5S3Q1WkNPTEk5LzIw?=
 =?utf-8?B?Q1RNZkhGZlVtYWYxV1FHaEhWb0lzWFRLSTZnZjgwZGhvYUYrblA0SzlrcXBN?=
 =?utf-8?B?SXI1RlNRVVNHQ3B1aGI3MVNKaUVRbW1KaVZGb2RzWEtWVXp5bndRUWdWUlEr?=
 =?utf-8?B?U2V0Y0tPZUx3MDZ1WTFDOERoVkNvRDk4Q3F1QnVZUk85b2xOTHFnelBVMUNR?=
 =?utf-8?B?dHh0enVoU2RZR1loSUlpaGloOHl1M0pDR1BFZHJ5Mkc3aWl5bFhvWFVJcnZL?=
 =?utf-8?B?S1ppeXJWMzZNdkVKZjkwZmpCemE0TTZJSG1DL3d6VnJhaDlUTzJCeWI2Y2Nh?=
 =?utf-8?B?RHRaZlRtSEExdyszMUo3Nm53L2Z1SnMxNkZnZFk5Q1FiWExSRTBXL295aW9N?=
 =?utf-8?B?ZGpWRFF2Sjh1UHBkT1BYbFZMOTBoOTF0b3RYWkFZZFMwNWFBUWhsckNJQzJ3?=
 =?utf-8?B?QldTUHZKOHhyODVBSWVLZ2k3ZkhMVUc2Z3E3NXVWamtYWUdvUXB3ZUZLS3BO?=
 =?utf-8?B?dE5BLzZOWXpzOGNxQW1NNmIxUHIyZ1lZc2JyOVBZWU1HRkR6S0hIV2dXT2tk?=
 =?utf-8?B?OE5rcXRVdW42RUp0U3hGOUdHekd1TnhTRzNhSVZqQk9SVU9YdWRQZWkvWnpS?=
 =?utf-8?Q?+jufBx45+foEHa/hNHH0gD6+I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de95e37-7f0c-445f-332e-08dbe224228c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:35:03.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9EjEuH3Wx2Uc9A3wh0KV33DwCbZViGCEgaVB/QQUFVmBXzvFAXQw55KorbAHFyqMaF5nN4HLH/w1hVMBZWg3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613

On 11/10/2023 12:11, Andy Shevchenko wrote:
> Fix spelling and other issues, such as kernel-doc reported about,
> in the comments. While at it, fix some indentation issues as well.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 10 +++++-----
>   drivers/i2c/busses/i2c-designware-common.c  |  8 +++++---
>   drivers/i2c/busses/i2c-designware-core.h    | 10 +++++-----
>   drivers/i2c/busses/i2c-designware-master.c  | 15 +++++++++------
>   drivers/i2c/busses/i2c-designware-platdrv.c |  4 ++--
>   drivers/i2c/busses/i2c-designware-slave.c   |  6 ++++--
>   6 files changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 63454b06e5da..8fbd2a10c31a 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -155,7 +155,7 @@ static void psp_release_i2c_bus_deferred(struct work_struct *work)
>   
>   	/*
>   	 * If there is any pending transaction, cannot release the bus here.
> -	 * psp_release_i2c_bus will take care of this later.
> +	 * psp_release_i2c_bus() will take care of this later.
>   	 */
>   	if (psp_i2c_access_count)
>   		goto cleanup;
> @@ -210,12 +210,12 @@ static void psp_release_i2c_bus(void)
>   {
>   	mutex_lock(&psp_i2c_access_mutex);
>   
> -	/* Return early if mailbox was malfunctional */
> +	/* Return early if mailbox was malfunctioned */
>   	if (psp_i2c_mbox_fail)
>   		goto cleanup;
>   
>   	/*
> -	 * If we are last owner of PSP semaphore, need to release aribtration
> +	 * If we are last owner of PSP semaphore, need to release arbitration
>   	 * via mailbox.
>   	 */
>   	psp_i2c_access_count--;
> @@ -235,9 +235,9 @@ static void psp_release_i2c_bus(void)
>   
>   /*
>    * Locking methods are based on the default implementation from
> - * drivers/i2c/i2c-core-base.c, but with psp acquire and release operations
> + * drivers/i2c/i2c-core-base.c, but with PSP acquire and release operations
>    * added. With this in place we can ensure that i2c clients on the bus shared
> - * with psp are able to lock HW access to the bus for arbitrary number of
> + * with PSP are able to lock HW access to the bus for arbitrary number of
>    * operations - that is e.g. write-wait-read.
>    */
>   static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 5e28f50e4ce6..91bdedbe1a02 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -127,6 +127,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
>    * Autodetects needed register access mode and creates the regmap with
>    * corresponding read/write callbacks. This must be called before doing any
>    * other register access.
> + *
> + * Return: 0 on success, or negative errno otherwise.
>    */
>   int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>   {
> @@ -174,7 +176,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>   	/*
>   	 * Note we'll check the return value of the regmap IO accessors only
>   	 * at the probe stage. The rest of the code won't do this because
> -	 * basically we have MMIO-based regmap so non of the read/write methods
> +	 * basically we have MMIO-based regmap, so none of the read/write methods
>   	 * can fail.
>   	 */
>   	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
> @@ -336,7 +338,7 @@ static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
>   
>   	acpi_speed = i2c_acpi_find_bus_speed(device);
>   	/*
> -	 * Some DSTDs use a non standard speed, round down to the lowest
> +	 * Some DSDTs use a non standard speed, round down to the lowest
>   	 * standard speed.
>   	 */
>   	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
> @@ -532,7 +534,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>   
>   		/*
>   		 * Wait 10 times the signaling period of the highest I2C
> -		 * transfer supported by the driver (for 400KHz this is
> +		 * transfer supported by the driver (for 400kHz this is
>   		 * 25us) as described in the DesignWare I2C databook.
>   		 */
>   		usleep_range(25, 250);
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 7479cb3a450d..5405d4da2b7d 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -141,10 +141,10 @@
>   #define DW_IC_SLAVE				1
>   
>   /*
> - * Hardware abort codes from the DW_IC_TX_ABRT_SOURCE register
> + * Hardware abort codes from the DW_IC_TX_ABRT_SOURCE register.
>    *
> - * Only expected abort codes are listed here
> - * refer to the datasheet for the full list
> + * Only expected abort codes are listed here,
> + * refer to the datasheet for the full list.
>    */
>   #define ABRT_7B_ADDR_NOACK			0
>   #define ABRT_10ADDR1_NOACK			1
> @@ -201,7 +201,7 @@ struct i2c_dw_semaphore_callbacks;
>    * @rst: optional reset for the controller
>    * @slave: represent an I2C slave device
>    * @get_clk_rate_khz: callback to retrieve IP specific bus speed
> - * @cmd_err: run time hadware error code
> + * @cmd_err: run time hardware error code
>    * @msgs: points to an array of messages currently being transferred
>    * @msgs_num: the number of elements in msgs
>    * @msg_write_idx: the element index of the current tx message in the msgs array
> @@ -236,7 +236,7 @@ struct i2c_dw_semaphore_callbacks;
>    * @release_lock: function to release a hardware lock on the bus
>    * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
>    *	-1 if there is no semaphore.
> - * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
> + * @shared_with_punit: true if this bus is shared with the SoC's PUNIT
>    * @init: function to initialize the I2C hardware
>    * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
>    * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index bd3c8db521de..4ef4160db01f 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -168,12 +168,14 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
>   }
>   
>   /**
> - * i2c_dw_init_master() - Initialize the designware I2C master hardware
> + * i2c_dw_init_master() - Initialize the DesignWare I2C master hardware
>    * @dev: device private data
>    *
>    * This functions configures and enables the I2C master.
>    * This function is called during I2C init function, and in case of timeout at
>    * run time.
> + *
> + * Return: 0 on success, or negative errno otherwise.
>    */
>   static int i2c_dw_init_master(struct dw_i2c_dev *dev)
>   {
> @@ -314,7 +316,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   		/*
>   		 * Initiate the i2c read/write transaction of buffer length,
>   		 * and poll for bus busy status. For the last message transfer,
> -		 * update the command with stopbit enable.
> +		 * update the command with stop bit enable.
>   		 */
>   		for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
>   			if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
> @@ -421,7 +423,7 @@ static int txgbe_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msg
>   
>   /*
>    * Initiate (and continue) low level master read/write transaction.
> - * This function is only called from i2c_dw_isr, and pumping i2c_msg
> + * This function is only called from i2c_dw_isr(), and pumping i2c_msg
>    * messages into the tx buffer.  Even if the size of i2c_msg data is
>    * longer than the size of the tx buffer, it handles everything.
>    */
> @@ -459,7 +461,8 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>   			buf = msgs[dev->msg_write_idx].buf;
>   			buf_len = msgs[dev->msg_write_idx].len;
>   
> -			/* If both IC_EMPTYFIFO_HOLD_MASTER_EN and
> +			/*
> +			 * If both IC_EMPTYFIFO_HOLD_MASTER_EN and
>   			 * IC_RESTART_EN are set, we must manually
>   			 * set restart bit between messages.
>   			 */
> @@ -949,7 +952,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>   	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
>   	adap->bus_recovery_info = rinfo;
>   
> -	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
> +	dev_info(dev->dev, "running with GPIO recovery mode! scl%s",
>   		 rinfo->sda_gpiod ? ",sda" : "");
>   
>   	return 0;
> @@ -1053,7 +1056,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>   	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
>   			       dev_name(dev->dev), dev);
>   	if (ret) {
> -		dev_err(dev->dev, "failure requesting irq %i: %d\n",
> +		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
>   			dev->irq, ret);
>   		return ret;
>   	}
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 02dc1d1001f2..fa9c0c56b11e 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -72,7 +72,7 @@ static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
>   		return ret;
>   
>   	return regmap_write(dev->sysmap, BT1_I2C_CTL,
> -		BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
> +			    BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
>   }
>   
>   static struct regmap_config bt1_i2c_cfg = {
> @@ -304,7 +304,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	adap = &dev->adapter;
>   	adap->owner = THIS_MODULE;
>   	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
> -					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
> +				       I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
>   	adap->nr = -1;
>   
>   	if (dev->flags & ACCESS_NO_IRQ_SUSPEND)
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 5abd5ec41954..21d80fe81cfe 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -32,12 +32,14 @@ static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
>   }
>   
>   /**
> - * i2c_dw_init_slave() - Initialize the designware i2c slave hardware
> + * i2c_dw_init_slave() - Initialize the DesignWare i2c slave hardware
>    * @dev: device private data
>    *
>    * This function configures and enables the I2C in slave mode.
>    * This function is called during I2C init function, and in case of timeout at
>    * run time.
> + *
> + * Return: 0 on success, or negative errno otherwise.
>    */
>   static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
>   {
> @@ -264,7 +266,7 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
>   	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr_slave,
>   			       IRQF_SHARED, dev_name(dev->dev), dev);
>   	if (ret) {
> -		dev_err(dev->dev, "failure requesting irq %i: %d\n",
> +		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
>   			dev->irq, ret);
>   		return ret;
>   	}


