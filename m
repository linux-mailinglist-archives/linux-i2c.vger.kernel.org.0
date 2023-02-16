Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0665699E8A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 22:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjBPVBp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 16:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjBPVBo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 16:01:44 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C36C505E5;
        Thu, 16 Feb 2023 13:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axcksnKXZ9UzXkabkDN6dJsYSMIu172GcsqQiB7Tf0t9FQhiOflYLSot+/0wyL4bCk0KtvPGVwr8dnqg0KMnxoAKkRNJotKQSFBKHTvbON85nd2ORDwSEFPtQViMiAdU0pI9D2PmhFKtnKoGoNCy98t9C0X/LS+00C8ZRfNc9lY8KpIGniXYkqqZkmosWCgtr1CTfcOuE3whw9g9KqpPqJ23OAgMpGPtsJPY5QFgZ3NukFhkZD48TkMSDCIbYji4RfMsEZ9cxnFv2Yj2ysXcpkiSf4gHN+VO0AFuXBtmQWEnVvTpVmJbFQ4YqAipQ7YGTUmMpnUEeNR0fyYekfDKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ca9JXoaqJYovGl7GhLsfH8JNomllbbO0a2Dc4Zh2ZA=;
 b=lNNa8pQiuGaSxG2xqRZZhJjkDfd8PZ2QhWip1hA3xtiZmGtb/EkvEi+m0ooOrHTgowAfFQwzo/wV4m3KGYteWbKPnWGZx+HRrZw2F+fvzcgwMzXZIQxOwpUGxVHTRstTxNBjwI2tqYdEF2b4QS0i0kUnU28FlsI4h4pglJcuswFzgbfV3Slpl1qVd1o9onUvmyjwZC8bZukJVbXXr0ws/ofE1INRgvlOTO8v+1gbNxYrPrbbd3y6cgFUCpvCLmTSu+8gPeWDCgchElBzo4OL2buxYSveeMNVFQaJLKV9LWJVpsrB6TsZ5YgeTKRefd9b0X+p/iD8nl+iuazNJkRCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ca9JXoaqJYovGl7GhLsfH8JNomllbbO0a2Dc4Zh2ZA=;
 b=GrwDTFkge1R+Y48PbhHIMshxjiR6XKD0neQsKpjjN3q1TSwO+s6LAjDDkmW0788JTPaxQOMfj4R8FO5cPk8muBM/VijuRZxAxgf3cDUzpkjh+wNw/oae4iwFjIPydiWIWeQENMtabv1MiZQQqDyCESZkSDVPvsQh6jm+F+xB82Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 21:01:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 21:01:37 +0000
Message-ID: <d8a11223-36d1-a3bd-bfa2-a1c67b9ef250@amd.com>
Date:   Thu, 16 Feb 2023 15:01:35 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
Content-Language: en-US
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
 <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
 <Y+6ZMEoQ2UoH7SxD@smile.fi.intel.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <Y+6ZMEoQ2UoH7SxD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:610:cd::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c7597d-d004-47dd-c017-08db1060fe91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +sKAi61gfO0GbqFlbbghuCheX9MlNZvqvPcTagficUpx5k6MnX/Qlyj0yGgWLI0vKbH4CG2trJ/2CC4nBvCTdHyYPDxXH7FxiNL0ZJ2xA4zjpej5mlIwpE+hfCrGCfhprEGVEw/sO+sxSgUEy1XijHw0t9RZbaTlFbKu89e5VcDy0on8/gllunMfzFzTVNEGx1CFKIQ/0JdC1uPM+bZvT2+o9sMpxbeDWIP8KECGnoVg7Ms+XFq6yeHSLGXoZ/RXH1QtgBuM8TcYgeC1Tb3xGQRuDc9r6WE6Z/rZ3Kw+UtubL2ItxUR36GC3W3KOICerheVUnSjUuH1hBGi6oQ3SYZoJhyppAiw1DCcS5kqyLMeWVrhuWuHgh3FsrX0RLmI1Tjnmkor7vypiZygqLzhNcr96GYUQtNvjtdQLFoYI45HO7JpI7MqPxIcvlUjun17GvjKIY7EhP1R58E2bA8cUmiHKs4Dinb1HEFZLPQTS13W6sHg7tgIOapuNgLrbaUOjSOJeMSbluS4ZdpAaeKhdZHBLuuOkQ4FhUNGNcN58Q3i9hgjr/oFwTgjBkXC6yERCGUbN+h0LuwuMOSjBm15YwTAMDKIUaBCgn1HphRDwUxF60KbvhpDG3gK+RAo93La9lsextlnTuN8WgzEVuYlr2FML4b6DesH+FQepn8vgTHp/QmEjqrNZ9ZGbmiueFK3j0KGUv/GXiWxj+xQ7+N7m9YRFf8CK/sBBmuC4MSU3Ovg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199018)(6512007)(6506007)(186003)(53546011)(36756003)(26005)(83380400001)(31696002)(86362001)(38100700002)(2616005)(4326008)(8676002)(66556008)(66476007)(66946007)(6916009)(8936002)(41300700001)(5660300002)(31686004)(2906002)(6486002)(966005)(478600001)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9Iek5WdjNSbmtDalB3dlJ0T1pKZzV4WmRsRXJWL056Vm5RRWJKNjV5eDlN?=
 =?utf-8?B?cFcwRWJlRVpuNE5xVzhNTDZVeDZjZWFZN1o3MEZweGovVUJNSXY5N0h4RHR4?=
 =?utf-8?B?a0pRbGpUOVNVM05ORlBCOFRjYk1xdUtOU0IzWnl2Y1lidTZ2TEU1RFdPUnNo?=
 =?utf-8?B?bjhTamcxc2pnNGpudEJWRnljR3hxODNJbzBrY0NWRHJjMDl0T2V5TW1TSjdU?=
 =?utf-8?B?aEx5WFJkZjg2MHMxKzVibHhMWXNsbGpsVFJQL2VvNjRVem9kY3JuOUpwLzFH?=
 =?utf-8?B?SWp2YU45VW83eGxTQ21KMkZ0OUtIUWU3UGdHZ3ZyYlZmNFdTV1JETnpFS2Iy?=
 =?utf-8?B?b2tGcVRkSGxncFhpTTlOK0FiUEhJTTNBblpRTWtJbmlySC95NXlRZUViaVdE?=
 =?utf-8?B?eWlPWGRkdVR2c1MxZTFLYUF5RWFYMVR6OWFEQU1hNkdVb1FzUTdRbk1MM1o1?=
 =?utf-8?B?dVdJUU1WZnR4ZXlBSUxvaWtNakkwNnozQ2k0dWdXRzVWb1hvYVYwcHBhNEw1?=
 =?utf-8?B?QithNnBOdVpENkV5K1ZVNldxcjRxM1VCZTFrNUVYa3NJbGE1V0xna1cvbFRH?=
 =?utf-8?B?SGhEUnZlaHpONWM3R09oRjNwQUZQQ0hyZzl3WSs4Qjc2em9pSHdzbHp1TGtH?=
 =?utf-8?B?WnM2enFQZWlLUVpNVHM5ZkY5ZDlOa0oxMEdUWlI2YzJGZFFFSnloQmlzQmlt?=
 =?utf-8?B?SGg0M2xYWEFlNHZibnZQanBmc3RkUkh2MU1DOXM1K0htcTNUME9sVHNxWGx5?=
 =?utf-8?B?WUxGbDdoVmhRT21qOHRNSVo1cmVGMDQxNzVFcjNtaC83MXFlS1EzaS9QUmVZ?=
 =?utf-8?B?ekdTTENmZTJXVHZGZUQ5ZzhxLzBrTWZyMExiT0s0dUJpbEEvZEJQZ29peTY5?=
 =?utf-8?B?emplbExKazBMSllEZlRUcDVmbGdrZEV1aWkzR1FDT1Y0WEJUSldPT20vd2dq?=
 =?utf-8?B?ZHlKMU93cjJGSEE4WCtCQVhiV043WUc2VU9GVUlyL2svbi9ISGtrUW1EenFS?=
 =?utf-8?B?alRndVl4NHhaUmh6cXVvMy9Td2xpczNreVRRRVNmaTVuSjN5N3pWd1IwczBF?=
 =?utf-8?B?MFdhZDBEZkRrQ3l0cE50TVB4aWtCV2ZuWjdYMXo1WEhyTHpSZ1QrS3MzU2du?=
 =?utf-8?B?c0QxTHJDUGttYm0rQ1htMVA3cXRXZnZib01hb2tKNVdsZW5nMHhlaitDUDJU?=
 =?utf-8?B?dCtyMyt1RTFFVnRtTWNwbWkxVDRibDNTc1Jpd09HS2djQk5DMHJWZ3Q3Qktj?=
 =?utf-8?B?ZjlHbmROSWRVc0VhamNLVDhaOUFQZHBjeitLQzZ5U3pQN0xrWk9pU1pjMjVn?=
 =?utf-8?B?QWRqc05HS0xkNGpDTEhNRXZzaHJIaGVWdnVvRG1jSVpQYnl0S1lQMG1nS0x4?=
 =?utf-8?B?QzZNcHBMOXZzcjQyMVBKVUVHNUZyQmhoRHVCRUZRQlo5aUpHeXllUnBtcVRp?=
 =?utf-8?B?aHhUSVlVRHFsbG9jNG15UDdzZDNQd3RhcHZIU0llMktEbGZiMG9ORDNuUi9T?=
 =?utf-8?B?dW4xOWJ2blhldlJ4L2FRWkNDTzh2c1RrSU9qVHRiMkV5ZE96RE9QbjVaU0t3?=
 =?utf-8?B?YlB6eGtINHFLSEhhZUhzT284NmxmYnVodWNacEtkVVZPYnpKY0k0WnRuMkcw?=
 =?utf-8?B?OXhnM3JjZXc4MFY4UXBRdXp0Q3k2aVM1ZXNTZHMvNGk4em5qcE9maTA0SExL?=
 =?utf-8?B?SG1YYjdDa001cExxeG9nN1lKT051a1grU1RDczRtY3EzNUtVRlhPcUJvdW05?=
 =?utf-8?B?TW5iRjVFT1Z3ZG9KckJiSnVkZVdENHA3ZEhtOGdXNFVGc0NLU1BOS3hyMkto?=
 =?utf-8?B?UGQ5VFYrNWlOTGNWWkpYS1pDdkxhdjMzeUk1QU1ra1BReEFlbitqbXl2b3l6?=
 =?utf-8?B?ajhlSlNBNGgxOFBhU210azlBbEpqekpBZTlleXkrT2txWWZvUENhMG1BSzRO?=
 =?utf-8?B?KzJ0VWVwQWx1VGpuOU1RSWU2YUNHWTZXNlRhZERURXBsM1lMRVBFRkNGZkNt?=
 =?utf-8?B?Z0M1TWRUSUw0RnJIZ2hVWElDdzFWb2RqUDFLMzE1TUhBZEVsZmY3cUFLRjVF?=
 =?utf-8?B?T0VaK0xoRkYvUi94V2ludHYzejZUa25RUzdXaEx6ckoyZUVCR0JmUUd3MUJW?=
 =?utf-8?Q?qek7zvqrZsZ5wH55SV/LVBKQQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c7597d-d004-47dd-c017-08db1060fe91
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 21:01:37.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvXGtUI/hrHo7Ig0WtkRr2T4ibuYVIdG4Zxt0+3cfObw7/mCA6Z8EZhR9WCEyITNGgStG0hpEySjr0pbMwTe4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/16/2023 14:59, Andy Shevchenko wrote:
> On Thu, Feb 16, 2023 at 02:55:07PM -0600, Limonciello, Mario wrote:
>> On 2/16/2023 08:56, Andy Shevchenko wrote:
>>> On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
>>>> On 2/16/23 07:27, Jarkko Nikula wrote:
>>>>> On 2/10/23 00:38, Mario Limonciello wrote:
> 
> ...
> 
>>>>>>       config I2C_DESIGNWARE_AMDPSP
>>>>>>         bool "AMD PSP I2C semaphore support"
>>>>>> -    depends on X86_MSR
>>>>>>         depends on ACPI
>>>>>>         depends on I2C_DESIGNWARE_PLATFORM
>>>>>> +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y &&
>>>>>> CRYPTO_DEV_CCP_DD=m)
>>>>>>         help
>>>>>
>>>>> Would this look better if split? I.e.
>>>>>
>>>>>       depends on CRYPTO_DEV_SP_PSP
>>>>>       depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
>>>> Yes, thanks I'll change that for next version.
>>>
>>> I'm wondering if this is homegrown implementation of 'imply' keyword?
>>>
>>
>> Like this?
>>
>> config I2C_DESIGNWARE_AMDPSP
>>     depends on CRYPTO_DEV_SP_PSP
>>     depends on CRYPTO_DEV_CCP_DD
>>
>> config CRYPTO_DEV_CCP_DD
>>     imply I2C_DESIGNWARE_PLATFORM
> 
> Looks okay, but I'm not familiar with this code. The documentation about
> 'imply' can be found here:
> 
> https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#menu-attributes
> 
> 

Yeah I found that, but this was my first time using imply, so I was 
hoping someone who has used it could validate I interpreted it correctly.

Following the example CRYPTO_DEV_CCP_DD would be FOO and 
I2C_DESIGNWARE_PLATFORM would be BAZ so I thought so.
