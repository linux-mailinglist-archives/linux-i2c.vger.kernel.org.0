Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E8B699E5B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 21:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjBPUzV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 15:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBPUzU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 15:55:20 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC2F2942C;
        Thu, 16 Feb 2023 12:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVFMHxbnkksCTuFpAKQZI13C2DCZomyFb5yqRu8OdqbOjKCRhA3z8HcnZMZlUhSVgCz3m5GWgsp4avvWEJdVj5BY5fmkq4LzT6C5lPHUt5SgLEXJBywnrGdZsjDOF11x2K8lkcvHK0JmZCUpNaN1JA38xmqF5KtNAz8QDAFXenG6TLkg0ZWhilsyfyUZWiDaVQEKAxuOMQBb0RFFCU0ZKwFuFQM9O94j6te4QC8TfnNx4dk5YHl5i0B2Aq/I5ogJ1dqlnKt82fj5qWsTRlmpH6r2wzo3Vq7xsWvLoeahG752GLLdDh7NLsp2KPvcX/3xPz1zTXZGcYiBsqO0L/pGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILCvc8Hvz17nR4s5ucHvA4mGJYy5OnrhoS14BaLJIXw=;
 b=kk+5I40+j+S5VS1JUo9xygH+L02lz6e6/rJk3Ig0SKNLTCpDAGj9/hfBb/JWzAhLXfuA9pUL/dJvZxUSp4nuj7NbR/Die7E0ZtEQqhPKf/NM4d3zD1io2d+S6RzLkW4GtSdcUGyyiC2EatJ55je1VsVaVg3HFacf0yUGsGr+00+MX4oOFpUXKEmBXqW/jDhmjEln9AroFJwLJLMBz+z/TMKThiE9+3HRIL0g5qBcsAQ5Aw1hiL+DPtIgSg2CETqUtWHKGULQAw8e1X4Vhd2wF6RNpKd1WcBpqV6lQRqZ5Sg8Hcc70Mi0BUauaR+FNDWa0eAniJBSQJdyqN8HrTJHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILCvc8Hvz17nR4s5ucHvA4mGJYy5OnrhoS14BaLJIXw=;
 b=uSvNSr0ps/6PN5/V3s6m01Z0X7pajfFl1cu8BAGI2tabUkTRLD64BXPvJv1Lq44+4ZWaN1XqFZ9oOljO2etdBU4zA8tXv90LGmx0wbbomRcAT7MIzz7UODZyj68Cyhb/sflIK4SwviWwprSdXszECA8SC1U4yxzPXNRWorcCSa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5316.namprd12.prod.outlook.com (2603:10b6:610:d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 20:55:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 20:55:10 +0000
Message-ID: <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
Date:   Thu, 16 Feb 2023 14:55:07 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
 <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
 <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
Content-Language: en-US
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0129.namprd11.prod.outlook.com
 (2603:10b6:806:131::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 741b0053-cf0e-4892-4c08-08db106017db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DReA9Ft1W7ANOtPjHekTmskIcEGQSa6TyJcZPzUtyDsiokOJa8vMAHq+vnG9hRyF+wT0vCzTtUJO/BvW8h5zigafCPD94hNz3kA6GWHUHCU0HfQhAGSimbc7hhaJ4TZ3EjDdcnv3HBOsQdpURP5H/rB0yf2X2+PqsUSD2B/1a5Sn0Tt7VMg64jYt0hi82z4bvGKtWjhSkiSJRQJ3z+1ASW5s1rhYIVAG33EsbDe92LiqYxYluJWMMB1dBrnA5xbnYyCLCv/ughBpxo2W14WFbZTu1cqge3nQcrsv/uBjFu9gv7yFBqKPJxAZld+jllnzc6GBQ0sKwa1Ff8oiQgvMqKkIOVb3fjPzfh9weIAIt0aTvcaeCf1NpVp8lntbskqid9v0n0HJ29H21d3Uo+5WnDIFD2K9W1HaRm8K7uuN08GEXsfnG41T1qeVRuJEOHwsZE/IAjXhbV4gdjVMLLyVTWFb/cIk+WdRYdq+/3Lv0axHwWFLL7abukrRJQ+/fmT2CElQZLqnYp7WHPvilPKS/OUMfgXQfzAidGNDvg+BrzMNIEUQwjSmhxOn86vOFX1/PT3IE0FpqTLg44OQdFrNMuTgxu1eHJVye+KTLYYM1ZH+vL5EsOUxoIGwN/sP4WhWlyqaoN8MrLpNtXoGkMkT/V0ZYlnMKYKpos4zj+PtpZamCXwGtWVuBcMFa/3y+D/NMYWWQ/6OpBG0bMX3SDPG6yzbySxsSo/avdgWAnAvUu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199018)(4744005)(86362001)(8936002)(31686004)(31696002)(38100700002)(41300700001)(5660300002)(8676002)(66476007)(6916009)(2906002)(66946007)(66556008)(4326008)(316002)(6486002)(2616005)(478600001)(54906003)(6506007)(6666004)(53546011)(36756003)(26005)(6512007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVZVM29YbGFiUlgxTDlaSXdRNlVWNks2aGN4ajR2NlhIcW51V2ZtSXl2Zk1x?=
 =?utf-8?B?ZVNtNHJ3cGhTUEFMZGNtbmxKV1N1MElJL294N3krMmVtcWRqblRjV2U2dUNP?=
 =?utf-8?B?bEhPMUM5bGlUczNHc2dJR3daOC9peHBOWW9VTEh0S0h0SEdzQ0pOa0ljbG5j?=
 =?utf-8?B?SEh0RzR6VHcwL091QXo2MURvdU9reHJiYTB6YWtTb09nNFFWRnIzcHA4QllP?=
 =?utf-8?B?QVdNelZIVDgvNG1iS0MxbWhjd0R0RGFpUUJnWVl0RkpMYUpZMVNNTUIxa0dP?=
 =?utf-8?B?Ujh4d1Y3eEx4RUkwZkpBeVlkUmVyVGkwcGV2YnU2TTZOdk9hVTFzTVRqQzJk?=
 =?utf-8?B?Qi9Pc25DaVRpVWlGd1BEOS83UGx2QXFtNkpTWUpSbVRCaHJtc0VpdFIxNkNK?=
 =?utf-8?B?SWp5R1NNTmNMNkoxVzVaVUJUVlJudFNsOCtsVXlMZHhQSDRMVi9kZXNaN054?=
 =?utf-8?B?NGdReC9HMXdpY0sxbGJIMlYybVA0M2N3UVJ5bHJUQkJlWkh3UnovM0N3aWox?=
 =?utf-8?B?SXZJUWFOTFJuUm5yMUJNTVVFbGVxTzFKei9WbUxZMlBRR3pUSHVlbDBWK2Rz?=
 =?utf-8?B?ZXJReFpOTkZia3YvcmNpUGMvcTBFQm5YcXp5Nm0rU3VNT3RINXl1em1sa1g4?=
 =?utf-8?B?L3lDbldnb3FhRjRoSlQ1VE13VE40Vi9OOWVuQXprVWtPcmVmclBhVTVmT3Vx?=
 =?utf-8?B?ME93VkFmRnNWcGZEdkZxU1hMTXNWK1g4SFRWL0FIczdsTzdxUmx5cXdjZTZ4?=
 =?utf-8?B?WW9XY2Y0dUlWSWhLSFhkeUgybHRkQzVZbHlzQllORmFGRFY4aGtpbjQxakZv?=
 =?utf-8?B?YWVwVFROcTVXTHJQdzhOdjBkajJlZmJLL1JjbkZidjJiVDhIN0wyd2ZhOVM0?=
 =?utf-8?B?SGtxZVZyRHgvRXJ0Q0VYU1BZbmlacWlmamprZ09NUjNPK3VtL3dhQUJXZXRZ?=
 =?utf-8?B?NlhyV09rV3Q0VEZ4OFZpQ1JJUXU4bDB3cXIyRGZmYmZkclpHU2kxS3BkVzdk?=
 =?utf-8?B?d0VRcGFYQjh1a3BUTzFnY0dCSk1GTGdQUmlPdmVxOW9PODNYZ2xvMXBkanBr?=
 =?utf-8?B?dmNueDhQZDF3b2dza2l4UDF2NzBYU3h5YjVxNzZ3WkJxSDYxOXFRY2hSVDJp?=
 =?utf-8?B?dzd2ZTFIYzM1SUFHSTdoOWZXVU84ZUl2NzREQXd2YUVTSXF3amlLL2xaTFpG?=
 =?utf-8?B?N0FWSVZiajZ3VitHeE56SDc0Rnd6b0FDanI0TFkxVC8yVE1Sb3pBa1Faa0pJ?=
 =?utf-8?B?QUE2WVAwcmFieERGYmd6eTIwYXNrdiszU0piNGd3UHl4TXdEajZSeU1hM1ZE?=
 =?utf-8?B?SDlLRUo0SDAreWhCMFlzTkQ4aFdVbVJMOXhZbWsxUXpZR2o4SWtNcjBRRHc2?=
 =?utf-8?B?Zmk0cVQwMTFMaFB1enYvWW9zN3owTVNtcmx6TjI1b3gvYUhwK3dWdzRxV2tP?=
 =?utf-8?B?MnBUTXdydWdaRVFqSjRqbEdoRVY3bW1UWVplcC9nUGVnTUJmT3BTZVBKY2Qr?=
 =?utf-8?B?aWZsMzdrclJjR0dhSzJwWUNQM1hUOHliNjNNcEM5NDVOa0hsRy9zcFlORzJs?=
 =?utf-8?B?STBQOWpoOEw1ZVYwQllOTFF1WHdyakRMT1VRT0xsd0ZZaFFISTV1VFozOGVv?=
 =?utf-8?B?WnZUbno5WUUvSTU3YUJBY24yVnMyYTlGY1YwbytrV2V2Z2E3M0FhTStwS2p1?=
 =?utf-8?B?dUpGWVAyVzdzNHl0alc4NEJFT2l0eWRUV3VUdkpCb2RJMzFKSUxmUEd6UW5Q?=
 =?utf-8?B?ckpqUis0bXJGR2hQR3JEUVp6SU5hb2dkVWFWZDh4Z3ZUaE5sN3dzUU5mLzZS?=
 =?utf-8?B?L2ZPYjNCNjNXMHh1aHU0eHRCZUZyYmdTVXNKQ3MxWWU2MkVPRHNKMC84WFVt?=
 =?utf-8?B?VU5JYmluZjVGZzZDelkwWVNucExIQ0Zja1JmNWZPeS8xMGoxdjEwYklYclhx?=
 =?utf-8?B?MDFRaVl2UG9CRlN4a1dodE1YZ0NZWERIUUVxTFRUc3lnVTY4eFBwRS9jcUtK?=
 =?utf-8?B?cEpqcWhlcHRvQ25RSk1naVN1WGYvekJsYjdhSURVdUI5UDFtSDFTbU4zcjQ2?=
 =?utf-8?B?ZFRnakdTTU40QjVIY2hzdkU3QmdBNDd2UDZMTWN5QkFiVHdvaDJlOUlEeDlt?=
 =?utf-8?Q?5eItEMjo+ni/wEO/tmaRzJ5Z9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741b0053-cf0e-4892-4c08-08db106017db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 20:55:10.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VqsYstbSoG1hhfBMHLnLto3BanOBvna+sRC/owgCMDRxppKhEFFAK0rewbUf77B9m6+hyl12JTrCTNiDK4URg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5316
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/16/2023 08:56, Andy Shevchenko wrote:
> On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
>> On 2/16/23 07:27, Jarkko Nikula wrote:
>>> On 2/10/23 00:38, Mario Limonciello wrote:
> 
> ...
> 
>>>>      config I2C_DESIGNWARE_AMDPSP
>>>>        bool "AMD PSP I2C semaphore support"
>>>> -    depends on X86_MSR
>>>>        depends on ACPI
>>>>        depends on I2C_DESIGNWARE_PLATFORM
>>>> +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y &&
>>>> CRYPTO_DEV_CCP_DD=m)
>>>>        help
>>>
>>> Would this look better if split? I.e.
>>>
>>>      depends on CRYPTO_DEV_SP_PSP
>>>      depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
>> Yes, thanks I'll change that for next version.
> 
> I'm wondering if this is homegrown implementation of 'imply' keyword?
> 

Like this?

config I2C_DESIGNWARE_AMDPSP
    depends on CRYPTO_DEV_SP_PSP
    depends on CRYPTO_DEV_CCP_DD

config CRYPTO_DEV_CCP_DD
    imply I2C_DESIGNWARE_PLATFORM
