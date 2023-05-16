Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607A5705909
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 22:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjEPUo0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 16:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEPUoZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 16:44:25 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAC3102;
        Tue, 16 May 2023 13:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKyL4ymOWE3bsvtppSWy8Pr99ZcsQW9fYqX4Ldo6YO0E5u7/f4VF385nV+WhQ7djZP9ia5Bmma2FX0YE0PUqik3KddkU/GNwojk+zZIuiH66unhLEAcGJhGrM2xY3peIuESTgqnw4EkRM1MkqVEsh6BNjqfR7T6/1ScoCPNr/1PHBz3lgOhyQJszQfr1tUAp6K0CQ3He+oftxun5JCbllgMcKobNU//MLysD6zXS8VbxVz0EiGzyfpYN1INzON+DNXA/N1lR7pAszuDW/ov+FWPk6OfRQWSgw/IcsydKtE6YvRu/sicL0+Y8/nZXn49CG8T4LH5XTYDwIJcQA5eUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mtAYDYtOf1iI2UU3mnWLg4ODLoZGW+uU1VkGRi/HBI=;
 b=EwAIzoQHMaJcig4oxN/3i8SlPmVcvyF9QzlF/ndhYkgS12+cBeKnebjIpYv9TSAaR+TSMjIBK30W1MvCr4FIcTJ82E5gu5UVZgGk6FAZpkHtNcyE1h50e2jyyN/9tND2Uf1B+Xg8ZS8FxcaiD61vTeoI6uHjZpiPuNbu4J9d0hrtbrCcfG1AXBeeHif67hAkzB+QL3pEgsiKP+SH8XgHDFM1EQjTNbS9yYfOgUZnkuLzg3gQkuCY+bpE+gvUoSFZD8ah54b9buF7GpJMU/vHUA1TSOODmV2u6k+X87tIYLumLUsHJ7V4W356Brn6ZZhKZeZWEZcSjAs49/UlYYZMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mtAYDYtOf1iI2UU3mnWLg4ODLoZGW+uU1VkGRi/HBI=;
 b=Ez0wq58gbBAtUG+gvEj8W0X1+RFamMzxIs5m9Jyt85Z5Qm3+/3X4qoZfKU9InNPLHWNnA8X2vMilz+HT8kbdmHVshtfZImjLVz4iakDzPo0qE0EWAiV5wFycXMmFQhoC7C3T6LeQ4FTSO52ALFhV3Q+uS7HKfw0f6qTH4IrUvW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 20:44:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 20:44:21 +0000
Message-ID: <8cd8d02f-f4b2-3ad3-a3e5-f9857d8519e2@amd.com>
Date:   Tue, 16 May 2023 15:44:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] power: supply: Use the scope of power supplies to
 tell if power is system supplied
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     heikki.krogerus@linux.intel.com, rafael@kernel.org,
        ajayg@nvidia.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Evan.Quan@amd.com, Lijo.Lazar@amd.com, Sanket.Goswami@amd.com
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-2-mario.limonciello@amd.com>
 <20230516204114.vv5w2vmcyulmhmm4@mercury.elektranox.org>
Content-Language: en-US
From:   "Limonciello, Mario" <mlimonci@amd.com>
In-Reply-To: <20230516204114.vv5w2vmcyulmhmm4@mercury.elektranox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: 3807c1c3-a552-4f4c-90e3-08db564e532a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lr0uih1WZ1x/47dNJB1LrajjseZVezRIVsM6cgx3XLE9HbZXBaJQN5AfHPV4s1/OEpOKdvc8WRBFu1nEhfnEY76maWJ5dmapBytVYU4tOsygXEywlG79SPRhYRpe9RJOw1z+LOqOK2X46sxaJ9yeA/t/59HWpthtOg5Of8Z8hILKB4oZAyZvzmWQAXNaqK0GBXS9JCaRia1Jl9oybNYVFcHUPNV+PodattNtQ9zmbxi06KgHJvEQMbrlK5Z7m0Hm6bqZlAU9OMXwlHcs+5vfR97DB+YxJSM4Wt83c2pKrmSjOg+tl1kB/GdZovBodPD3FcYZ4/n8hmRERIB6R2AUiWl1l8wl7mAbOZnyVFh0oNtZcZujgnRvbV90sAH0v6Dok6qtkA8gBYw5RpchxL23mKz+wm1ndEpkMD/bqu+ZL0xWGVPURQFNLHCf/LNW30BlBiqTYqNc4UUS3gdB2GW2MzkxKaqo0faTZB02BChL/EerPzH1JaXdBALehrM4aqgHMrSLcpuwTEkIHv9n8ROL268U9IRPaUOznNFZTloYGTo71tIAWq/vNo1k1wZhByMYMYm7SBMcAQwduMEoM7nIVpFizCbR739lIZBAO/1VlsuzCzu+1AHnxxDwCFHiUqnrTZdw1UTGacAweWMmCQjFbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(31686004)(6486002)(6666004)(31696002)(38100700002)(66476007)(66556008)(4326008)(316002)(66946007)(478600001)(6636002)(41300700001)(110136005)(5660300002)(26005)(36756003)(53546011)(8936002)(8676002)(6506007)(6512007)(186003)(83380400001)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDl0SnFKYU9qdjAvSnFDa3hpSkZmcS8zSzZrVGRwc3ByV3JrZzZ5T1RTRUF1?=
 =?utf-8?B?K1NmcThqSTk3WDdGSVVBQWJOa2l5RzBjc0puTUxHY0RKWHBVY3hmNmZlL3lo?=
 =?utf-8?B?SUhGdzhJcW1wY3l3WUt4Sk1XZXhYeG9xODBtdzYzKzVYQmlsVENGdTc2MkZH?=
 =?utf-8?B?OG5lZU1Bbm1yR08xUXVNRytMeVgxK0QxeC9sQjR3amVadW1VekJMbUVXd0ZB?=
 =?utf-8?B?enRPRUYySmc3ejZxZTZrb3V4NkdRRkgzNFd4WG1xMGlvVkIwUjQwNzhUeXpQ?=
 =?utf-8?B?aUV1M0pNb3pQWVo5NWVUMGFleS9Fdm9OZS9FZDlqWUVuV21zOVdqaGI5YnRw?=
 =?utf-8?B?WHpueXlOZzlGVy95VlFIeFJYbkxYTjdxcHhLak9IN3FoVkgxN28rQWk3UE5R?=
 =?utf-8?B?SGQyUUx5OHVJZkJvcWlGdEY3bmNDVUk1aFBvVzZxaGFRamozbUxQOU5sZVZh?=
 =?utf-8?B?b3JpTXNaeHBxZzdqcTRmSU5HZVc0QWZOcWhBbDRqUnNVQ0VneGs5RzdrT0E5?=
 =?utf-8?B?MTJlTmhJTTBsVGtYcS9lc3I1YzgxOXE4RlE3T0pIcjAwVFRZYnJFaXBNc2xY?=
 =?utf-8?B?QWU5dG9ZaVRXQ0p6eXhZZ0FybWFZekdrL2FpU0lDM3ZCbVY2NjdxT0RaaUtj?=
 =?utf-8?B?ZzdUOHlCOVAvV3hXRzlYa0hZUEMxdHU2LzlUbTl2SzRLUUNHVEtFejMzU3A2?=
 =?utf-8?B?Q0ZOb1JjT1BPSHl4NUw3TlptMUhIaGFBNSt5cFZHM3ZGYXRnaUJydDhzL2Z4?=
 =?utf-8?B?M0tJUVFqaGhtaVlYdDJiMU1xQ01HcDg4UCt5dzZ0MWZidXJDUzVQc1BYQ2tw?=
 =?utf-8?B?Qk1mamcxOFZEVWlzSUJtR2ZMM0ZxT1BnTVg4Q2g3VFhicmFBN2RCaTNYNW95?=
 =?utf-8?B?b2VVU3MrM2w2b3NndnR4bk5aR3IzdkN6L1NtV3ZJdDc0MUxPVjhGREMyV2tr?=
 =?utf-8?B?TExBN3ZqMTRyb2prK2ZlR25uZkMvQjJ5TUtFWDR2V05hTGEwMTc3QXZCNWUz?=
 =?utf-8?B?SFdoaU5kYkxDTXZ0UDBvUktoakVlNDEzSU40anVhc3BQOUI3TXJJNDQvckQw?=
 =?utf-8?B?S1BqRHA2ZjZjUlY4azFtZHFVMGpqTTNwcno5K0lSeGtwNWMvQTMxNE9FMU56?=
 =?utf-8?B?V0FkMjkwUkFvOHU5cC9sWWNnb3pIMGlQanAyOTNST2RqUjFoS3JicFVYdDJ4?=
 =?utf-8?B?MG9MdUt6RUVRQk1iZlY5aU9qUkl1Ly93U2kvQnNFdWV0cnloUlo4aXUveEd4?=
 =?utf-8?B?NTVlMEd3YldGNlVZb3pDdWtQSGcySGo0dDN3WER5bXduRVhpS2lpdkpESUN1?=
 =?utf-8?B?RG5NRXo4dHQwTmpOTVA3ZFhjcW0vZTNhYlROaFZXdmJuaEk4bENuM2lvRFFy?=
 =?utf-8?B?dDN5N2FaTHhSVmpzYklKQktOVCtPb2VaNkY4d0tqelpraTJaV05LWWxHeHc0?=
 =?utf-8?B?ZklZdUMvT3cxSlh1VUVFTlJpbmZGQUR3QnFyQ2plbEh0QW5KMDFyNG15ZjRx?=
 =?utf-8?B?U3FXSjByMU1PUCtHdzd2OVV1SkhtVEpyaC9XQWNGcGNoL2VMVU5EODdjMXpl?=
 =?utf-8?B?RlBhNy9RTFF6RVA3cXp0NmV0Rlg3OEZBTkw0RUlIWTFvVEZET2N3MWdRdW9s?=
 =?utf-8?B?M1l3d1ZabGhaUGFjenN6cEw3c0VFcW1ZL0dWMllVQXpKSE1icHJ6LzRmZ1hi?=
 =?utf-8?B?TnhiY2ZvVy9scThEQ3RIY0xwTXM2YkI1ajhQQ2NvU041eTBSODNHSmtEamZQ?=
 =?utf-8?B?QzFyc0lwRE1mUm5vZkx0QUwzMzlmZGtuampIZE9RZWEwQU9uTS9jRllGT0p2?=
 =?utf-8?B?QW9hejYxcURiaEl6YjFJYytCWG54Y2N3dzNocmsyM0tMZC9lN09LYUFtemF0?=
 =?utf-8?B?NFptRCtOK0RmdHg1UkdFV3ZnY2FzaUZEb2F2M0NtMjVWY2FTaTlGS3R3L2ZL?=
 =?utf-8?B?MGhhWk9hK0dDWkpaNmJoOCtlZjZzVm1LU2NnSFcxdVdEdjFlcklIcmtlSTVX?=
 =?utf-8?B?VDVCRWFMVHUzV1o3Z2pqU01sNlQrRVlTUVZaRHhLNmd4ZjhBRkpZbjhSYXB5?=
 =?utf-8?B?U3hSamg0YkZrNnl5bjE0d3l6ckRCMHphdU4vclZlTnUva0xJMzRVdjBFTk83?=
 =?utf-8?Q?NNy5mflFpsxduv4oKGvvKRk2o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3807c1c3-a552-4f4c-90e3-08db564e532a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 20:44:20.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbL/38pSDaSOLlWFNnD/+M6f2+T+ZAoZQan/mIZ81HGJuuPqk98OC/fkxCUoOvrC2jA84tM4g/0HNO8aQeDk3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 5/16/2023 3:41 PM, Sebastian Reichel wrote:
> Hi,
>
> On Tue, May 16, 2023 at 01:25:40PM -0500, Mario Limonciello wrote:
>> The logic used for power_supply_is_system_supplied() counts all power
>> supplies and:
>> * If no power supplies found assumes AC
>> * If non-battery power supplies found uses online to determine AC/DC.
>>    - If any are onlined, assumes AC
>>    - Othewise DC.
>>
>> This logic makes sense for desktop systems that don't export an ACPI
>> battery, but it fails once you include a dGPU that provides a UCSI
>> power supply on a desktop system without any other power supplies.
>>
>> The dGPU by default doesn't have anything plugged in so it's 'offline'.
>> This makes power_supply_is_system_supplied() return 0 with a count of
>> 1 meaning all drivers that use this get a wrong judgement.
>>
>> To fix this case adjust the logic to also examine the scope of the
>> power supply. If the power supply is deemed a device power supply,
>> then don't count it.
>>
>> Cc: Evan Quan <Evan.Quan@amd.com>
>> Suggested-by: Lijo Lazar <Lijo.Lazar@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
> Good find; the current logic should also break with a desktop PC
> once a POWER_SUPPLY_SCOPE_DEVICE battery device is attached (e.g.
> a HID device), because it increases the counter.

Yup!

> I suppose I can just apply this to my fixes branch since there is
> no compile time dependency to the second patch?

Yes, that's correct.  I don't see a problem with the other patch going 
through
another tree.

> -- Sebastian
>
>>   drivers/power/supply/power_supply_core.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
>> index ab986dbace16..d57f420ba8c3 100644
>> --- a/drivers/power/supply/power_supply_core.c
>> +++ b/drivers/power/supply/power_supply_core.c
>> @@ -348,6 +348,10 @@ static int __power_supply_is_system_supplied(struct device *dev, void *data)
>>   	struct power_supply *psy = dev_get_drvdata(dev);
>>   	unsigned int *count = data;
>>   
>> +	if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_SCOPE, &ret))
>> +		if (ret.intval == POWER_SUPPLY_SCOPE_DEVICE)
>> +			return 0;
>> +
>>   	(*count)++;
>>   	if (psy->desc->type != POWER_SUPPLY_TYPE_BATTERY)
>>   		if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_ONLINE,
>> @@ -366,8 +370,8 @@ int power_supply_is_system_supplied(void)
>>   				      __power_supply_is_system_supplied);
>>   
>>   	/*
>> -	 * If no power class device was found at all, most probably we are
>> -	 * running on a desktop system, so assume we are on mains power.
>> +	 * If no system scope power class device was found at all, most probably we
>> +	 * are running on a desktop system, so assume we are on mains power.
>>   	 */
>>   	if (count == 0)
>>   		return 1;
>> -- 
>> 2.34.1
>>
