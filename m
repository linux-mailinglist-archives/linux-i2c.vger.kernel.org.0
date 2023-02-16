Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262B16995CE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 14:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjBPNaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 08:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjBPNaI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 08:30:08 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D33856ED6;
        Thu, 16 Feb 2023 05:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3G+OuhODXTXwrjfc38ebH0ZOoY0GOHKdqIP6rDIEnKOqaI6YLnI/7MGz6YovBXl/9WkFvoi6Xfe5NncvjjvhZFdhNOFBZEmYnAGEJ5pQFTVuLsMG3HqEZ4BBrPmzDLcpiKzAjdEpnA8jInlEmnxeYVnjThyZWfyuLU4dyT4AytWm/DvHcKbnZ2/P9z1O3V5I44gnmC0RR09bV8c3MKAUm25UkyRuQKa6gB1WU/6qln3PnBm+VOx8i0TKy8CXScuVx0dModB+ty2gM1Km1RXLmfgCQq6GAy/jZK0DmD737OyveAG0dqYoTMJ2h2GOkwDjkTvJCMlzfIqCurDZknj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZjx/RTanb1Nqf0gPitWhAbP6zsSg9PNowNOqkuns+M=;
 b=ZuIGXFusk8L71N3gHDooFF4nqdPoJeIqwuwzkgNjMTg+GTkaBBB/fxv70ejUUhX1yHKgF3a/Ya2MN+9t7AjmdrJ9J6FTs1fuljCUhr3QusU33+7ev7AuEORyPw2tZdJDC116FvoA6nrUQ+25Wnopm+IBOwcBpsDioIZe4QkgwwKUhr3cgS/q+lUytf0j0ZRYonKCNrYkq5vYCU/84BHiQz28ycIfqcZq3BQQ5JqdE3xL36clXqv/wT9dQkLF/rrmEBXbQ92iKogy/vyPnEZ2K0gzWpRLx4uFS8u0YZvVoWC1UB1XE5Bcc1ZT97f8XK92a8LO2wDvs7ipj8fleiZyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZjx/RTanb1Nqf0gPitWhAbP6zsSg9PNowNOqkuns+M=;
 b=rDMbwevIcvblsxlpPlGNPyBOvfzE679AJ4i3tOr4X1VrNwt0YOR5q84+qGJkop39NB4L1d57WokWegUshs7m5aM24kX2wiAZiK8ziAUTaPpIEHMhmHVw4S3bxMo7cWEcEladQwTkc3WSiyRO19mCmb4i1VyK37EHcZbsQYmGzIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5232.namprd12.prod.outlook.com (2603:10b6:5:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 13:30:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 13:30:00 +0000
Message-ID: <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
Date:   Thu, 16 Feb 2023 07:29:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:806:130::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebd5032-c262-4865-15ab-08db1021e783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RIUbEi/PwOtPt/khV50ffio8oIM43jdJEMtvlRmqfBfOCRTvvq5zSna+WRpJnW31GCOLiieFCqp8pTH9NQgzc9DV2tyoow7+uodE52AsDLIGkk9gZjF3r34N9LVnCdl4Y5zqKr9UjwWBDi6yQEo8ZK4cSjsiPTEeRMBm64grfwPZmZNPjubo8Dr2MfTltdChL6JCvLPj51rDy9wQcWrbSWDc1n47FPHqpdIZidhJqkkTMjn7ImwiPwUowQwBrZTyp/xvbfUOlhjCX3Q/4Qw/F+pQ2a8Dd1y49lhi7D2Iok09oKSa3D2nr4zalYvsFCkfYXKnITxlKJVzvRc8VNV4p+WnmypsLV23znY/fEZVSyZYBEPW/4eNq2qMRm2Bsb2Rg8cn1fatwa2ewfeVCDrgyyeVi3hCraBL4sO35rsoQHcTQSA0TK42xzpZsoaHXm1ZkRHz6+5A1R41shwsM/38Ba8z6clgJx5MTrmmR8ePJvGSkGVfJBUS+0A0YolPVZghzg7b6RSz2LNYYPp+jcE2+F3iW+4jtJKLGJPYSgym5AHcfkoLliN5H1qRPPA/6Jf8zdfecL3x+oa5cbTtYPKy4DAZOClwvhMLfOh1vmgvokkLowkGTSpRwSwIm4HMGaZouj5d7n0ugJMP9JsEJvpb6z3v8pWMM6ObJTcylVGD+ssa2nulTb+F2v0dKwu6kOPJNq9OoMiqUYTufPfP+QTFMYPv445iA7LNBmq8IvJGGqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199018)(44832011)(5660300002)(2616005)(6506007)(53546011)(36756003)(186003)(6512007)(6666004)(41300700001)(316002)(110136005)(38100700002)(66476007)(8676002)(66946007)(66556008)(4326008)(8936002)(31696002)(86362001)(83380400001)(6486002)(31686004)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9NbHBMbmIrNk0zLzc4ZHlwUVF1MEdXcGo2ZEdndiswaUlmN0U3QW5EN3BY?=
 =?utf-8?B?RjhJUWN6Q3BCWk5lQ2JRTFpqajcrYXNjcmRwMlNaRjRHZm8yRys4ZVBhSWtI?=
 =?utf-8?B?WFFhNlF4dW40eXUyd25JcDczNThENU5yalRXbzZqdXpGOXJSVUQwWG1YK1V3?=
 =?utf-8?B?NDlDRWNBWkZ0WDdvYUdBaWdZVWt5K09zdytVNFY3eEE1ZHBoZU1JYklrck1L?=
 =?utf-8?B?RXlUYi8rbWpITEpoUm5mNlVkeFZiTFhtMGcvaFBpcHJieXhvRitJejFXUjJk?=
 =?utf-8?B?Y3hhQ2R1R1lWSFo5TVVENjBxd2tzbE5XUlI0a1h6KzdteHhxSmswMGRhMU4v?=
 =?utf-8?B?c25yd3pMRVE4aTRmcmFiNVRtN1cwYWRlWXU1d2hNQjlqbTZ2bW5oYmFNTjA4?=
 =?utf-8?B?OWJraFY5cytZNmVZRi9uSUUvM2dxbHFRN2VJcTB0OExTcEFvbEJjOGNtOWl0?=
 =?utf-8?B?VU9LR0UzK1l1RVhNczRUWWg4YlhmNVovK2lqSW0wMGw4SFpqcEZGc28rbFJa?=
 =?utf-8?B?bTRHN0xLY0x3SUl3aWJsTFVqbjhWK1lGQ2Z6VEc1UW5IZUl1b1o2RHpCMmxE?=
 =?utf-8?B?VHlWM2dkUUx6WXZ1T3dyV2Q0Q25sY1RrZmZwUTkwTU9STUt6VDloeVdRSEdG?=
 =?utf-8?B?QnJINW8vZWJLOWFvUkVmSEF5VEc4QnZOMEJTMS85NTdESlpEb2VUZStWM3o4?=
 =?utf-8?B?Z1JSaDNSTDJVbk50S0J3aDFZWEtLOU1uZ2s2RDJPdjRSaTFtNnJUTXB2UkJR?=
 =?utf-8?B?aXI0eGdhWjdxQjR4NXgzYVdldTRrQ1JQVjZDSC9XeVpvZzNCdnJBaU1nWUkv?=
 =?utf-8?B?TW11dmozZERQeGlhSFcxVXhwdTVaZ21PNHNMRUE2alhQbTlCYzVySmZwRktL?=
 =?utf-8?B?V3NEZlRHejZ3T0Z0ek5vdlM0aGNyNFpJLzJsd1RhRVB5TFNBNGhXM3EvZDJs?=
 =?utf-8?B?MEUvaXVaa2RrejlFTFpMbTI3VjJSY1BOV3NtN1ZOVmtoMzJHMVp5ZmV0WmI0?=
 =?utf-8?B?UmxIT093eStoY3NXY2FENTVGbFlrV3EvS2ZHODUzMVZpYVlqcjY0MFZScHlD?=
 =?utf-8?B?T0xDVVFESFZHaThVZVR0MXlQbm9RS3V4a21LY2dWSzVUQ1JiNDJLRlEvdWFk?=
 =?utf-8?B?ZG4ycDBTdm12OXExQlM0c1VIOGNTeXN0RGlaZis4T20vcU9ZQmZqbVJ0QXZo?=
 =?utf-8?B?c2JycGNsNlJ5RlpidytxUDQxaWtKRTFkRTdrc1NMR0w3NlZyUjRwNEVFbHRs?=
 =?utf-8?B?SzZtelBBanNMYVhGaWduM1gzdERGS21xU0Z3dSt4L29tbHV4cDVIY21TTHFT?=
 =?utf-8?B?eml4MWFlbFh3Qzk2aXY3dU12TnI0cjhBMHF6ejVVUXV3L0tOUWdSaXpKQ0Vt?=
 =?utf-8?B?OWZmZk16ajByeGNONGZiODVJWFBMRWRUbjJBNzNiSllzL3NWS21paGpQaUht?=
 =?utf-8?B?SXFHaW5XV3E2VVpFOElGaTRNdDVyMWVJNDNqeWs4dEZJMkNsc3dUaFpLQ3F3?=
 =?utf-8?B?ODk4bHZLZjRlVll4WVJtVTZPMHA4ZDdwWmtwUnFWeXdtUjNRaU5qcXZmdDBi?=
 =?utf-8?B?dENHSjRGQkQyMEN3ZFdJOVNOM1hBbzJidzVkVmJMcld4eGRYUDZkVXZzWG9r?=
 =?utf-8?B?WEtaLzQycExEa2Nyc0dZNnIwV1UxRlJHS3N0UnJlcEpJRHNtSUFmRzhhYW4r?=
 =?utf-8?B?a1R3Uk42T1hVaWRQdkUweHpzWjVDTDhwMUxSSk5lT2cyYTI0cFdrdCtIUjgz?=
 =?utf-8?B?bHdJMXlVOGlaYXFRdHBUZ3BBcjROVXNGOEVDVFhNY2VMVFI2UUxNdmF2RUpN?=
 =?utf-8?B?TE5qRjJ1YVF6cE15VmNlVVQrKzM1Y25TUFA1a3FiVnZXck5OVlFVOXdWOTIy?=
 =?utf-8?B?TDVYaEdtSE1CeWJkc1J4N1FtUUR4b2FSL25CODBtWVQ4QnRydGRBOUN6Q1l6?=
 =?utf-8?B?RjlGTVlNd0hCWVhWck9aZSs2VEw3d2ZBdDYwbG9uZlhRNHdaeFBISHl1RC9T?=
 =?utf-8?B?eU53Q20wb2NVamVWZDdmejBOdDUxVlNQSlFaVFpHTk90SjdoRys4OGNXcytL?=
 =?utf-8?B?MTZkZXZiNENKMlZHN0p3UGhvVXprdi94R0F0MG9SMEthRVJwdVRFTitHMm90?=
 =?utf-8?B?dmN5QXNrVC9PekdLdlQzMnJ5bklNdVdBZmxnWXlOeWVWa0dYUmVoUGFrdmRL?=
 =?utf-8?Q?BlZimszZLkamgyEli8ozHiPMHD3viPnXQbgb/9c/7g4g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebd5032-c262-4865-15ab-08db1021e783
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 13:30:00.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isBevsVlvN5gNizNkpIptFxcod5nlT6fDEzzugJmF76p4qY/oD6Q0hfggrr1KBNnW7Z2aqtWc36a6tEeWGxqUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5232
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2/16/23 07:27, Jarkko Nikula wrote:
> On 2/10/23 00:38, Mario Limonciello wrote:
>> Currently the PSP semaphore communication base address is discovered
>> by using an MSR that is not architecturally guaranteed for future
>> platforms.  Also the mailbox that is utilized for communication with
>> the PSP may have other consumers in the kernel, so it's better to
>> make all communication go through a single driver.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/i2c/busses/Kconfig                  |   2 +-
>>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 141 +-------------------
>>   drivers/i2c/busses/i2c-designware-core.h    |   1 -
>>   drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>>   include/linux/psp-platform-access.h         |   1 +
>>   5 files changed, 9 insertions(+), 137 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index a7bfddf08fa7b..9e2202ca73ec7 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -566,9 +566,9 @@ config I2C_DESIGNWARE_PLATFORM
>>     config I2C_DESIGNWARE_AMDPSP
>>       bool "AMD PSP I2C semaphore support"
>> -    depends on X86_MSR
>>       depends on ACPI
>>       depends on I2C_DESIGNWARE_PLATFORM
>> +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y && 
>> CRYPTO_DEV_CCP_DD=m)
>>       help
>
> Would this look better if split? I.e.
>
>     depends on CRYPTO_DEV_SP_PSP
>     depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
Yes, thanks I'll change that for next version.
