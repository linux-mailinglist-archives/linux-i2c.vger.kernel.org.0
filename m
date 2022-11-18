Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6C62F7E4
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 15:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242391AbiKROl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 09:41:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242400AbiKROlF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 09:41:05 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E26891503;
        Fri, 18 Nov 2022 06:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABFAle4zcXu2ovj/AECVWzCyLY69ECjLXH71O3iLAKpDAqngcl979ujVOFW4mRjhjf6L4gtrglRMQ7UE6mspdTCP+tU/G2JeLjzGJp7e+LszzQBY55Nz4FvjkLXsTpNo5UnQIGDTq7KdeF4rMABSwcHXWho5RMUKiSUPdx0RRmcODCTlh2pMP+E5sqZThzCe3VlcFfI7qE77OJZhB+sr5ieQc7SJkmnOg2K9xalbxPQ9pmynYtHEOiRHpeyfGhVI67C9VtUd+2jQL2xZESLl3wPzZ5kNgSJ/2m5xlbMVnRaOqitgE15WQ4BkxeXLTzDu7VfIS6klitl+7iTR1XIq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlR7+/Y0lsexJDtGMYqB5DHKg5VlSI9IPD6WFzdwiJI=;
 b=DNjdYXDhfw96kJhszY6qAO4wkfxYzMDHL4hNQkW/agUuV+MwOrvM34a0WpaNbeHqMkpmL3qKkbM8dHZCKu7JP7Tt88eCaSNF2pQQgHux47yRsvomBg21tr5lFxj2qzkdI1f6CSaK/fEiGV3NELnNlr83o3/C/in7J0c4ar2zBrQ6WjQ8r8YzRsK/eVB1MqlKdD8YR1I6Dd0iN9aPxxxVWzWrk0Wc0XMA1S2X00eyPwyXG2+zib3KUboa56nMHRAT2D6hmRywdUIf7x54mRYQeltqhAwCvHTyOU+ZAldYo+ipABnNt22mKDtWmvgdgf7Iww6ul6oW7L9I0OialSLCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlR7+/Y0lsexJDtGMYqB5DHKg5VlSI9IPD6WFzdwiJI=;
 b=iKcLgqG/9uWl0oZy3xX9jkFCN/bbvBUqnDZj8Bl/uIBXWJBYR9sx/kmHWyEwwdgRyaNCDZjK+luxkPZddPpDL+dRtdIJRop++0UnRqIxvSbiGpToj0cbMmZspa5WQJLo7VHw9yaCdaQwu78W4V2tn6sYU9XJmRphj0pmgpB2C7lM3x5b6G4gP/dXfnYWFwSFUHznR73FKZs6QhoQGMXyxkWOacU5xy7ZyS9/fiaTs0C9fAVenCIpErlTYfDs0Ql80imJxrmaGqRWhFeizWz7lxEg3aen07kxds2t6W2f0gUc256jebOkiF8VP5PaQ2m1nghEtFZ6d9lpxw/txQkAOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 14:39:42 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 14:39:42 +0000
Message-ID: <c1dc1774-9f5f-fa60-fa0a-7d04b7abc06a@nvidia.com>
Date:   Fri, 18 Nov 2022 14:39:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        Zubair Waheed <zwaheed@nvidia.com>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
 <29db0e24-4f7c-e3dc-91ce-2decf6a253a5@nvidia.com> <Y3dcDCgC42QcMX3k@orome>
 <1edbceed-e5a1-460e-25a7-08f299e11c35@nvidia.com>
 <SJ1PR12MB633990D5330F8D320A08BC71C0099@SJ1PR12MB6339.namprd12.prod.outlook.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <SJ1PR12MB633990D5330F8D320A08BC71C0099@SJ1PR12MB6339.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 15346b5b-8d28-4e3e-2817-08dac972ba91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vyh52ais8Jv4ZKXMLOP0gKuc9Lc23nCUPI4jAyLl5LFixrfJUf94Wq7tn6tDlhcmbPDOdRilVuljfFx/e8czgZz4sKaWPeV0wz/mZroLxRStvLkczQ0PV4md9GrCqsTrjSUeIq1lngCiuMNET3nmpSnyn3MGU+SF09cj1oFIOFBmvYuiRQSC0drHjT+DqsKMmnF3jHPd0LZyQXKW9nbslz8IoER/d2zgpej5sqzuHgxUb2kud1pXHWE+hn+ZWGGDDDLm8dBgScg2CLkxXzWysXxfGgFFsmXCF9HesEv7T7XamKeZpWOvF8jvbYoA/T4Zzw46sZ+ImI2tmcuZ5Gk/x0zWC1Nm+yaMIIA76MyLiMyjiKgBAVmXGDJyZP7n0vhMRNBbNNPO+fROymJzCTOUNm7ElCI3jdBU5NcNyKMGEte/dBuTERfZ41qoHg/9rm7BAbdNxBb+TB5g9T70cA//u4uoc4SRKb4aX0eI/2yZmmXO2eVBdPDRTuzI+cMxoMxGrNQUO4fq6Ur0gQ5S0P0INV6CIqpgN0oJ8rfZmBReZ0GLWlyjpNIHokpI80QTjQCsxjRPrVD9jJxPckHp7ZqCBwVTc/o6y4ZuwnKAhGHqJkflXmgzhYwugqZdSSngCcshdRUgUgi39lfZK6SsBrD7vbo7E5yYMYvR2WpY2469gIE89DpT7qcKveZDJ1NLno9N+bX5ekoJlEpNyEFKHgm8zKMURRMtO7mqlBPuwau8PUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(31696002)(8676002)(83380400001)(66946007)(86362001)(5660300002)(66476007)(41300700001)(8936002)(4326008)(36756003)(110136005)(38100700002)(478600001)(186003)(6486002)(6512007)(53546011)(6506007)(66556008)(2616005)(107886003)(54906003)(6666004)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWVoQlVaZytxbTNoVlhwTE1LdmpZbVF5TGoyQkptTXhvSjJad1phWjU3RUEr?=
 =?utf-8?B?cG8wdUREMG1wZ25GNW1xck1QM0t5MEp5U084eFVObDVlcFduRW5JRVBNRHNl?=
 =?utf-8?B?NmlWY3NuV1RXY3QydG1tVXRBMHIxQ3I2U0E2V3RrZmp5YjNJanM0MjdiSnBL?=
 =?utf-8?B?clBQdWt0eHBra3ZIci9EUDlibFl4Uzc4Z2R4MTdGK3Y2NkpkL2g5eExXU0dz?=
 =?utf-8?B?cDFGai9QTWptYWs5Z2lpRlAvZ1REdjMrUnNNeTcvZUpqT3pJRk83bC8zNWtT?=
 =?utf-8?B?T1lSUHFHemRvZEt0OGFNdG1OWjgweFBiMDhlSmU2VmNIM01SRis0cUVqWUI4?=
 =?utf-8?B?MjVwRUYxUHFHdS8zcTdLaTdBZzIwampHQTRSK0lrV3IwcVh5OWZnK09ZZVFL?=
 =?utf-8?B?SldSbzMzbzFQMHB6V252ZXZ4TlE0a1dsOXpRQmZTYWJvc0JXUjF4aUpubDdx?=
 =?utf-8?B?Y2xZN0JicU1lMzJMZDJHZ01LcVFnbXNNc3BoMzlNSjVsYlZZN1kxU05pQWZU?=
 =?utf-8?B?TGlkN0N5VWRYd2k0aVJHbWxMQlNXNmEvbHJFRGVmMmg5NVV6NDdQQWM2Z0xw?=
 =?utf-8?B?bC9OQUVsSFh6ejJRSTlicmFoNnVrVEErUzljUHZubHpERlFmQTl3MytNTVBk?=
 =?utf-8?B?UVY5SS9TaFJ4N2tLQVFYZGF5dVBZdkYxS2YybGJLb0tBTXRxdDN2YzRmL0Yr?=
 =?utf-8?B?cVJpOTkyaFNxeDA5TUtqaTEyRUs5ZG16cnU2OXY1VmlqZTU5WkVXcjJVczk1?=
 =?utf-8?B?QkJFT0pQcFV5ZlFmRWQrK3J5N0VoWHBXc1FZeXEyaG9Pa0tZMXJyeVZDWUJ0?=
 =?utf-8?B?bHUrazJQQWtYZVhNYUJVdWlUV1NReHAyb3RYbUZRdDhhUmpTQ3BROWh1MUdy?=
 =?utf-8?B?eEtCUW5xemRqZmJYc2pHWk5XVHFzcHhkVlgxN3pveFhCOUx2U1I3d0d1ZmJp?=
 =?utf-8?B?TVZZOHBzcFdVS2svSkc1ekI1UG5LSVp1WUowdktOemR2OEcxYm50eng5SDRl?=
 =?utf-8?B?Rnp4MFBJYUdzMVpVYk55c1VoeERTMXhndU1lTklCYVVmdmNIcUEzYWpzcFdr?=
 =?utf-8?B?UGZXQ0xrLy9JVVdiYzZxN0FYcnY1OEo2cnU3aVJhOVNydk43L014dUc0NnBC?=
 =?utf-8?B?K3IrUnZBNHdXVTdhVjkzcHkxcmRWZlZPZ3pLaVRUUlhHc0dmQmxYdW4zVit4?=
 =?utf-8?B?YzAxTjVTY01zS0IzZTRDVHl2Nm1LSTF6aDVkZUlwZWl3dDFPNW1TQ1JMKy84?=
 =?utf-8?B?QzdQWi9XWHR3YnVSRmhYT0VHUUdpNmJsVnY4T1lBenNieklZRDMvaGwyTHZ5?=
 =?utf-8?B?YlR6Y0swVzhuNjVMcHZzakd0WVR1TVYwTUptamJTWnlkVk1RMHRHWWpqSitt?=
 =?utf-8?B?ZzBQaUFpZnVzTkVjR21kSlNHalIzNmlHbXJOR1NTb1dZTHQ5Q2FvWDROeTdV?=
 =?utf-8?B?MDduSUxmOVdxSW0yK3JYRk9ZVDdscU5MMkg4Q3lqMTRwcFd0UzZLby9tTnBx?=
 =?utf-8?B?R2E1SFhseFI0ckhSMTBMRzA5S1RQa3UrQk4rMEgvdlhNcjB3WFJVdGcyZ1I0?=
 =?utf-8?B?MGRwT0NvdUZhNzBla2pYdGsxNGRpWnBzTFprelZtUUxTZ3lwMU9LMWZyY01U?=
 =?utf-8?B?OHc0elpZUW1UQ2R2Z3BNbDBYcHVvMlc3REwreE5ycFdKMC9UaytVT2I1QkYr?=
 =?utf-8?B?YWJTTC9kMW82dmY4d1FPRWV3SWd5SWgzYjg1OHNNSVN2eWViOWxINkw2VEgy?=
 =?utf-8?B?SVdUNmVUY1djRzVudDVMK3dmeVk3WjIvRElOWmcrd0FVVmpLTE91NWxVbC9q?=
 =?utf-8?B?cnpHbXU3dS9GSG5pREhFQUxiV2tzZHRBZGs2dTVmSHNUZ1ovZk1YYmV2Z2wy?=
 =?utf-8?B?dzNwM0xqdGFGbWJnckNBOFh4aEtDMVI1U0N0bDY4dHI5YlI5RUEzZy9kQmsw?=
 =?utf-8?B?UFBDVHg0enZsWTZPdDFlTDRuZ1FycnhMKzRIOEdOWC8xc0lVME8ydVpvMXlU?=
 =?utf-8?B?UlNXNTRUc2lqTG9oZ2hqRU5QbEZpcFduSWVrOElzbDVIaElxQi9XTWxSb3c0?=
 =?utf-8?B?NXl0eFdUOHBmY2RLWnJJWkNGQ0pSTnpCOXIzYlh6UDlVZDQ5aVpaTnJ1MjBx?=
 =?utf-8?B?M3lwSkwxVm1YbGZuVUJKNCtJMUFwUW45bUs1RU1FdWNNdVhnaTdGR2k1Uksr?=
 =?utf-8?Q?hZL9pG68DO1KXrSdvobfWZmqQGrTLQrPVtKHfhp6x+mq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15346b5b-8d28-4e3e-2817-08dac972ba91
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:39:42.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5RkedpTfkHE2IF8y1iP9gbw5mD6hVMrYKr7LLR3ENS6L5S39z446RlOnuX51MsgSIknI9CdmR/ak452F6BrXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 18/11/2022 14:27, Akhil R wrote:
>> On 18/11/2022 10:18, Thierry Reding wrote:
>>> On Fri, Nov 18, 2022 at 09:38:52AM +0000, Jon Hunter wrote:
>>>>
>>>> On 17/11/2022 10:04, Akhil R wrote:
>>>>> Set ACPI node as the primary fwnode of I2C adapter to allow
>>>>> enumeration of child devices from the ACPI table
>>>>>
>>>>> Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
>>>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>>>> ---
>>>>>     drivers/i2c/busses/i2c-tegra.c | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>>> index 954022c04cc4..69c9ae161bbe 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -1826,6 +1826,7 @@ static int tegra_i2c_probe(struct platform_device
>> *pdev)
>>>>>     	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
>>>>>     	i2c_dev->adapter.algo = &tegra_i2c_algo;
>>>>>     	i2c_dev->adapter.nr = pdev->id;
>>>>> +	ACPI_COMPANION_SET(&i2c_dev->adapter.dev,
>> ACPI_COMPANION(&pdev->dev));
>>>>>     	if (i2c_dev->hw->supports_bus_clear)
>>>>>     		i2c_dev->adapter.bus_recovery_info =
>> &tegra_i2c_recovery_info;
>>>>
>>>>
>>>> Do we always want to set as the primary fwnode even when booting with
>>>> device-tree? I some other drivers do, but I also see some others ...
>>>>
>>>>    if (has_acpi_companion(dev))
>>>>           ACPI_COMPANION_SET(&i2c_dev->adapter.dev,
>>>>                              ACPI_COMPANION(&pdev->dev));
>>>>
>>>> It would be nice to know why it is OK to always do this even for device-tree
>>>> because it is not clear to me.
>>>
>>> ACPI_COMPANION() returns NULL if there is no ACPI companion, which will
>>> cause ACPI_COMPANION_SET() to set the primary fwnode to NULL. If I read
>>> the code for set_primary_fwnode() correctly, that's essentially a no-op
>>> for DT devices.
>>
>> Yes it does, but doesn't it is not clear to me if it is a good idea to
>> pass NULL to set_primary_fwnode(). It does seem to handle this but my
>> biggest gripe is the lack of explanation in the commit message why this
>> is OK.
> I saw ACPI_COMPANION_SET() as an empty function if CONFIG_ACPI is not set.

That's not the issue. By default CONFIG_ACPI is enabled for arm64 but 
for Tegra we typically boot with device-tree. So I was more concerned 
about the case where ACPI_COMPANION_SET() is not an empty function.

> Yes, I agree that I should have mentioned this in the commit message.
> Shall I send a v2 with the details added in the commit description?

No need, especially as Thierry has already applied. I am not familiar 
with this function and primary/secondary fwnodes so wanted to understand 
there is no issue for device tree.

Jon

-- 
nvpublic
