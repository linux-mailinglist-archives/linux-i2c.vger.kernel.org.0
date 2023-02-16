Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB6469974E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 15:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBPOYz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 09:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjBPOYu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 09:24:50 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDF14AFE1;
        Thu, 16 Feb 2023 06:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOoBj4RkyVw8ORkZVWfSQVPGuWg65nCSMnmNn6BNhCP93UNMXhNug3GfjJHFjukUrAxZruwXFR30BMeRSEjJCxbZV+4UgZeHXxuuReLXVTgE+vCgeEDgJnesmFfc2wdMxaXiHHQ2MyCNtZI65AKUb+UkWkm5aPE/3Sz2BNWBnpt+ASgDGlFXlxzQNmLnZQxBOzAlDebDkTLIbNmSSMjWkPaqHNLJ+zgDEKEMkGLJ/seM8FjHqCDQrHenyP6QMcECOm8ai/i4Zfea/W2AOU7ddFSez98p7+UmbzyQEWg4C8yPpyZM+1CJ5GomeKsr9VB62dgKdY7uA8Oa1Atkl7xknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE3DVXgzSZMSuugj3L4nmvN4LG9u57qlil3DsSTiKcw=;
 b=FydOvc/wdhLCneDEVPsXWiwpxsaMAvNcq1hP/YErkp6FMAkYc8y0hSfxqwW/GFhtUthwSfSRVU184LQvddBxD0QwkZn8/a+OJCu4EbkPk43yNriDdFYl8VQ+ovHwQVZvmMzDNsAdiFLbwpMXV6YNz+9EVo+l3jVA3RMINoQ5xHe6BQO6WCsncMvRT1Q3CDPFElgsCssiyTWPP/9w1acZM6KXQeQoG904jyzyGbdTymoNINQIFMXtjdzjnX4nOohFb7s2Eh86hpMfVQ5WC3NIrH1tKiOxcsmQ/gmHfuYNXMWBrj/Ub/th4pjS+WSkWFMWIacMUy4WfboGeyIsd3vNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE3DVXgzSZMSuugj3L4nmvN4LG9u57qlil3DsSTiKcw=;
 b=PzumTOOw2XcgtayBunmHyB72n1Zq8IUpQyLjyW1TaXGkCmzzZB5oAOSXl+MOjZ5CbJzFngHH12IBYZG8CTKNWfaG6Js8nKxfh1zuuFGKT39Dyp/+skL/h9QJKf6H6a8qqgUfE1eQBKzi0wvKJfZn3q7x4LnwJi6IsDFlCuvpGTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by CH2PR12MB4953.namprd12.prod.outlook.com (2603:10b6:610:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 14:23:05 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 14:23:05 +0000
Message-ID: <d86181b5-bf73-13e3-08f7-6cab43cb3398@amd.com>
Date:   Thu, 16 Feb 2023 08:23:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/6] crypto: ccp: Move some PSP mailbox bit definitions
 into common header
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "Allen, John" <John.Allen@amd.com>,
        "Singh, Brijesh" <Brijesh.Singh@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-4-mario.limonciello@amd.com>
 <CAOtMz3PuzpcrqQb-L9kzY1be4xwhp72fqNqSWnRvAE0Nd4d3qQ@mail.gmail.com>
 <MN0PR12MB61017A594AF2CCD1D75EC798E2A29@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <MN0PR12MB61017A594AF2CCD1D75EC798E2A29@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::9) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|CH2PR12MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: fc093cdb-9021-4dab-4da4-08db10295162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKPI5I/+5yLhbiToehQNQeskUymvcm4k8oWOb1bmEIh8tNVm7ZtvcTeET7/7ssHBI/dYT4ykeVb+/Bn3SA5DSa64sa/LTufqP+UPiu5AkE5lVHQB3RwFkCuUVdLJCLiNaRWYdCVhhNc/I8hdUFHM8hnw6xlaQIrd/7XA87+rB/Di9Rr44AFehFE+nUMUzrlbgfKlPg8uNi3NHF4pKxToYrNO9RPnbHEmuVcZPpogWLDss2igu75M/7/WNOChqqiW8UrSVTHQvMevhWM+r5lsCYDm0HSzmtlbgqTL2G0Q/0kQuNRRA8EhOfvPrS+BDQIgMUB96cj9IKChWFHUU4sUJHexaqOmIxrzlkBGRzsOCIYBanPhCw035wS6P4MK3MVUqnom77dWWuQz3xPx9NTPw+N2JzENa0FYb/uIr9dh00gARTGRpRw7HqIT/1G2LaMaEsOGhT8K2VCAYqcjzO1F9EgGG7MxMHo+Z2Gv30jf0zcAIVF4tpKGhuGHXPiYdlEb3s6AwCx0A0rFiHIzITZ+0oPN+Gu2TowFSvh2cviGJz865b9ENeBojaBZRZpqpKg9uUmTj/5NrKvf3UkEPJXJ6UTK7BjAZ+9aiGYq5a2Ch6TgaiiLoQKom4xXthb2h4BdT6Gs3SF2wJR/je05z3WQ5pTKC3ecAqZe2gMGamOCtOq4AhYZmCg00csSKE3fTt3Yl/x5YaMNklze0K2ie3V3AQOFOw3HKmiir6zctc+iDh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(83380400001)(15650500001)(31696002)(8936002)(86362001)(4326008)(41300700001)(7416002)(5660300002)(8676002)(54906003)(316002)(110136005)(66946007)(36756003)(66556008)(66476007)(38100700002)(6666004)(31686004)(186003)(6512007)(26005)(6506007)(53546011)(478600001)(6486002)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXorMFlodzV0YWpsYit1VzFyalZvSkc2aUk3YWtGdk1DTG9yUEY3dUFrcDQr?=
 =?utf-8?B?ck43VDBNMm9IRGhsV2xnTUdCNXFMN2ErNGhDLzBuelUrUVlXNDhtSGwweWFu?=
 =?utf-8?B?OURlYzEwR2FNdFkwS2xLakM0dVk2RGNtcGdhbm9RQ1BRTFBiKzFJd1RwaXoz?=
 =?utf-8?B?WUhDaE9GM3IwYVNnUkF6eHhBRkRobTNNbkRyU0JrT3NrWmhYWURGVUhmK2Rq?=
 =?utf-8?B?cmZvT1dhb3dybFRyQzRNWDdtczRZQ0JiMmx5VGJmTVMrOE1jSXRWQVpybGNS?=
 =?utf-8?B?ZnpGaTJLNEFoWUxzNVNpb241M0xmdUc4YTJnWkU4ZVZmRWRwdVZsMU01dkov?=
 =?utf-8?B?dGVoWWswMlV6MnBxNjhDZEJjQWEySVkvQlJzRDEyTVdteUVPQjZaVmFFMVBx?=
 =?utf-8?B?eDFjQ3ZPUXlTY2E1Z24zWGRFZ3BKVTM3VXBsWjAwUUdSdGlVZ2wyNnNxV0t1?=
 =?utf-8?B?anMvRUxMNzRoTnVLVlFUVmZxTlhiSU96VFd1QnJpSFN3S3NuUGdYUUpKZk50?=
 =?utf-8?B?NkR0L3FIQktaTjZVWWxwVy9mMEp6SXF6aHRJQUVGK1lRdEExZk9tSWdVOVJL?=
 =?utf-8?B?TVVncU9QdFZBdTYzT1I5TFdPVHZlRzJYYWVFSmJDZUNjdWcvNmlETWt4MXJ5?=
 =?utf-8?B?ekJJL295M3JUTTNISnBEcFN4ZE1TWGlUS0Y2b21CMEloemRpRmpCUE4xcy9T?=
 =?utf-8?B?TU82amdtLzZOajNhRG5paU5Zbjdtd3d2WHR2Um1PQ0ViWkNSMWJUMVg2UVZD?=
 =?utf-8?B?aHlhREFBQWpKZGowdGF1cW9lZkVnMFVOUjNWSjVyZ2xyN0d0aFFvTkhtUHlE?=
 =?utf-8?B?d1Q2b0ZqdkRNajQzMVZabnBEMTF1SEdjZmlQNXFHWVlFL3hDcElxVDdOQXhj?=
 =?utf-8?B?NTRMemp0VDR3aGVDMGRTQTJsK1lTZDMxUzZYT25rUXVnTG1TOGtZbkEyRHJm?=
 =?utf-8?B?WHpTVVhRVTh6UGJWT1pMNVFnU3R0eDZ5QlVONVFOSHpWa1llMWJOWC9oN2NZ?=
 =?utf-8?B?bEdsRnNwYnE4Tzl0NWZzTXRPL0J6VUhoZlhROXM1ZFhTK3N0Snk5TnNEbTAr?=
 =?utf-8?B?Rm42YUo5VlM1NkZZQjJFbDVWTDFFNnplQTBJWUVrRGlnbFZic2doczkwOGE4?=
 =?utf-8?B?ZHZZb1YwR0R6ak8zWE4vUndIVHFnOEdnbURXZ0ZKaHhBZWpwWFBXRytVS2Rm?=
 =?utf-8?B?Ky94ckNjUGxjK2NLSGhKSUR0UWdjWXdYekdvbHBIT2Y3M1B4V1liVnU3ZWR6?=
 =?utf-8?B?SUNuNFdUQjYzR3lJajFlMFZvTzNJSVVVemJ0KytHdWUyVVdUNGRaR2ppckYy?=
 =?utf-8?B?MkV2WnRwRHoxZWM0V201WW5nWFQzVlVyYy9xb2pZSzA0UC92WkpJRVRmcC9k?=
 =?utf-8?B?KzdnQ1FjZ1dVS041WE5DazNNVjRZeldwZzJKZk53WG9qaEJoZWMrdy8rRUQr?=
 =?utf-8?B?Z0FKNXU1ZjVMdnhnZVN6K204ZDJtUlNUZFcxdXg0ZVVPOUNTZ0Vldm9HbVRZ?=
 =?utf-8?B?Q1ArVCtUemFpbi9RVmZ1Q1hhK2ZuMHdzb0NpR1Q3UXdPOXR1Sk1UZkNqc1JD?=
 =?utf-8?B?ZnFFTkt5WlJoWERJQnd2Q2N2SGhKQlFYK05XenhYOUVZK1M2dCtNcTFlTzMr?=
 =?utf-8?B?eFdKam1ObmhySVlZOTBpM3UwS2M4VkRpMVBaM2l4YlhFaEdoemJmS000Smcw?=
 =?utf-8?B?ZXcwVUNmdTVvSU5YdklId0ZMRjduTWpCMGorV0VsdHY2WncvRDJ2Z1pES29r?=
 =?utf-8?B?bFB1SW9Yekt4VTBDWGliNWdwVzVCRHR1bENNaGtKY2E0Z0J4Y2tHYkhGUlJS?=
 =?utf-8?B?QXU5YXg2VUppU1BlUm4wWUFGMTIyRGQ0bmU3T0w2UGpNemluSVB1SUZlUFZt?=
 =?utf-8?B?NUIrRGprMmJyWUo1ZGNyaC9EQm81ME41TTBuU1hUaCtlSGExOTJuUTVUVVhM?=
 =?utf-8?B?UkkwSzRsdE42M1dCMFNqSCtCeDJlTVpwcGFMRW4xUmx4THhOZ3RZRFdPQlk0?=
 =?utf-8?B?bzhpckRVeThmNUttMUZqMllsZG5qNUZoa2NsR2RhaU5jQlhENngrbVYzbjFY?=
 =?utf-8?B?VkxTMlZPaGwvSzI5LzBFSEh0MmhDcjByaHRWckgrbVAwSmN6RFc5eGZ0K2pN?=
 =?utf-8?Q?kMLWZeO8mJHxYRZN/WIu/WzdA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc093cdb-9021-4dab-4da4-08db10295162
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:23:05.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEdTdzzWZyL2XEE9gTO1AV3rER429BWps6UZEbwea9szGY3VVnJzFSffn1sQXNO2qNrgPBqtriK7/BeEbb3l8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4953
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/14/23 16:05, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Jan Dąbroś <jsd@semihalf.com>
>> Sent: Tuesday, February 14, 2023 03:04
>> To: Limonciello, Mario <Mario.Limonciello@amd.com>
>> Cc: Grzegorz Bernacki <gjb@semihalf.com>; Thomas, Rijo-john <Rijo-
>> john.Thomas@amd.com>; Lendacky, Thomas
>> <Thomas.Lendacky@amd.com>; herbert@gondor.apana.org.au; Allen, John
>> <John.Allen@amd.com>; Singh, Brijesh <Brijesh.Singh@amd.com>; Jarkko
>> Nikula <jarkko.nikula@linux.intel.com>; Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com>; Mika Westerberg
>> <mika.westerberg@linux.intel.com>; linux-i2c@vger.kernel.org; linux-
>> crypto@vger.kernel.org; linux-kernel@vger.kernel.org; David S. Miller
>> <davem@davemloft.net>
>> Subject: Re: [PATCH 3/6] crypto: ccp: Move some PSP mailbox bit definitions
>> into common header
>>
>> (...)
>>> @@ -99,7 +93,7 @@ static int psp_check_mbox_recovery(struct psp_mbox
>> __iomem *mbox)
>>>
>>>          tmp = readl(&mbox->cmd_fields);
>>>
>>> -       return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
>>> +       return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
>>>   }
>>>
>>>   static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
>>> @@ -107,7 +101,7 @@ static int psp_wait_cmd(struct psp_mbox __iomem
>> *mbox)
>>>          u32 tmp, expected;
>>>
>>>          /* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
>>> -       expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
>>> +       expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);
>>
>> What's the meaning of "PSP_CMDRESP_RESP"? I see that this new macro
>> name is currently used by other drivers, but in my opinion "READY" is
>> more descriptive. (It is also aligned to the comment above this line.)
> 
> It should indicate that the PSP has responded.  I think both terms work
> to describe what's going on.
> 
> Tom - What's your preference?
> I'll either adjust all the drivers to use READY or fix the comment for v2.

I think the comment should be changed.

Thanks,
Tom

