Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711F16C51F6
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 18:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjCVRMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 13:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjCVRM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 13:12:28 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4975D462;
        Wed, 22 Mar 2023 10:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvizN2cxQZcmA5U4bM8lCGlZeOsjsGDN0HlBXhb5YB9f2F8NZdnPNz8RAa+p0eI8T3+nlgM130tXG3TuiSV2JI5k3Kkk4BiPcPG6Z9GONxLf+XKye1V7HzHt5d/tiOoYkSH6fRHcok7WswtBaH7Oegz6DwyoEbhZT6+E4qr1/pKjLZ9lUG3F6DAw184qQyszulxD5dGxhUBiPxu1es9XtApC1k9j5WFH1YoMAJlBjp2BlTTJdaYZzGUioKZ+b3RM4Q6+ycOY4aSjh7s4/JW89P49Lw2F0C9cPwqxvfpNPqD31c0d2/k7q7w3lrg9qVhHlz7litGjmxGHbvnlgIYm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZUKCyKSx8JzLiSnExOUXsq3vqvPuEdmVHNI/do8q0o=;
 b=Cmq5Tdx/bh0z3NDih6iFVyxX4hW28HbVKVhJA90kcwSL9+inhTy6/9XMLxOu1un4xtAXKLu8W9hbgsmQxZqQNvPzshd1d5phLhyqVtnwnYRtHwUFibsWtkEkCHkpp31Rr7RU3pitsRJBIOcOhyPSgXJo3pfO+BCGqCAHFA/q+e84Agd8fnmi8F1JscsuLrTkXnMC12ERlDNO76RlFhyV83kSLs4+MkoFywZmizBiyr9F4ORz3y7fpOtR/w4QV0nqq1s7bEqKOMC8qv8HQBJZDdvgbHD6sk9n9lLwQ4QLTlHf3/CTa+WirFF/ux1zNghS45SGwmo5/eSE9j/X7f7T9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZUKCyKSx8JzLiSnExOUXsq3vqvPuEdmVHNI/do8q0o=;
 b=myeVJJfu5szW12NPS4pRxPl8joJEv37FF7zTfLlr5DUTHBS/eugaKdS2P9ZP4bNNli8ZCtcbYfiZckvbs1SZ8zPUFm4pTUHTdRaeWjweyFPYk1r/Ox8xEdZKNdvARSEYLsory54EEeJuyNCo9gc7U4CSrLiNUXtd3lErHafcZSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 17:12:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 17:12:24 +0000
Message-ID: <a9993ba0-ddfb-5ed3-c997-e9eea797cfc3@amd.com>
Date:   Wed, 22 Mar 2023 12:12:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/3] i2c: designware: Add doorbell support for
 Mendocino
Content-Language: en-US
To:     Mark Hasemeyer <markhas@chromium.org>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230321212822.5714-1-mario.limonciello@amd.com>
 <20230321212822.5714-4-mario.limonciello@amd.com>
 <CANg-bXANgkrF4T4X_VgeVejA2wH3GrUiFORyRC4AZfgYrE+7DQ@mail.gmail.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANg-bXANgkrF4T4X_VgeVejA2wH3GrUiFORyRC4AZfgYrE+7DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:408:e2::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: a7145cc1-3b70-4c0d-8368-08db2af89aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qA9g7Z939T2VqMJnJ8prn6BcCYRCQUKu0zJoFwmSu/uPA5PErLowx6DM1eEMabpfQag6AuthglXg4PO3EhmlDGe1T8/icu8uULmzQaiXAvQfawlPDs89Kt5L2tQlh+u7Eetdu35XsVApUj4kUkF/iuFRgR6Vxv5zcpWbM1M0k7DSaGdJsgXMela9k/785ESymJa8pgD1wQqsKys/C/gybrQyqa6LEPeix20lmsZDLfHNKfKyPRJrmcir17hXgUBnHQm1XzJbhO9N4jc9pWZDArkmxtRj45Kp/xl3VGiyD8NlRdIAppFvjDvBS5RDaKkAg9UWYMgSfl1yQFqk+MCPReTvkzWiY8Bis0vqt6GJHrDYzxoy9pi4rd8Osne8ZcHEUQ4RH1Si0T2ztFUwdj76bn/TwLVzx9zWaTRO5KYOGRp5R9FgjUeG1SdZwNhRIDIfIGSvl3cD5kyDpCzRtuV0mPdD056lPq5xlE7tmk9WD3ZNFB5FvdoFQcTVTWhGeDSBYqs2gDBLzHv5BIs0MSNx2LKyDZNhz4Z+NqtpxMD2BzMKcD7lO2AX1PQnUEnSJ6tC+vrcLhXPijwcOp2nGv8HznFiitOEJIy0mof4eVAm7hdYO3gj0dtLgzQkqhJMTcKwL4QdK/uHSOZ29ChUyWFPdUA+5lFH3boZXQJ1asqVIvbCTx+EbgxEkbCRVqreX218KESn5ktULwQ3fd4CoGQbBnZKdF+3lWpntV/cxDVv65I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(2616005)(83380400001)(86362001)(2906002)(38100700002)(31696002)(316002)(41300700001)(66556008)(66476007)(36756003)(8676002)(6916009)(66946007)(4326008)(44832011)(966005)(53546011)(6666004)(6506007)(8936002)(478600001)(6512007)(186003)(6486002)(54906003)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtVeGVrb1pwVlYvL0dqZW01OG5Od2h2NmRDdmRqRWRlUndnRGYwRkROSWQz?=
 =?utf-8?B?c0t4ZCszY2ZHMDFvVHF0eEs5emZqeWRmMVdvcXdyeHZFOFAvV0YzN3djVzRL?=
 =?utf-8?B?OTdNN3djS2tJMmdnVStkWW1Md2VieWxHMTFzSUhsUllOWTVtRDFBcHBiMFZU?=
 =?utf-8?B?eUpxOXlwbTAxa0oyN0UyTUZXVUVISUZCNFdVTGg4cWE0VU93a2pPbE93V0RG?=
 =?utf-8?B?dDN3bVhEREJGT0pEUmhDSjZrQ1IxMUhFcHZjQTFnNTVjWVJZUk52cFN6MHJW?=
 =?utf-8?B?QnNOTi9WU2ZnRmJZMFBHK3RhTnRyelRrbUUzZWxicktsbTQ5dG9qTHYzUlAy?=
 =?utf-8?B?SC9wS3FNUHZSMTZzc0J4NGZSMG9iMFBHUFJjWGN1UldCZDhvbEtKSHZZVFZM?=
 =?utf-8?B?VGhhTTl0TGRQSUVqSTd1K2QybzJEaVBhN1J6M1pJV004WlF2ejBPOUdqWCtR?=
 =?utf-8?B?aGVkMTkzb2NyRXM3emtzVmpuTlNuTVhjcXhXenF3dSttRUpSV0Ywa096MHph?=
 =?utf-8?B?cU1zblEwNUY4MGF5NUcrZ1FrT2JkUTJmNVcrYVVuNlRpOTJ4eWdvWGJTNE9J?=
 =?utf-8?B?SGZnbVpGRm1adTB2dWsvWGpmR3ZCZnI5YVY2WFBaQ3U3K2UvSmlpRUVmdDA4?=
 =?utf-8?B?TEVIZzlJZXl6T2NQV0tuOWFuNWNreXZKK1pHa3ZrVzdhdFFsYnlnb25HRDUx?=
 =?utf-8?B?Z1lMR05FU1pKclQ1NndwaUNYVHR4TXpvdlg3N3JwbWRFZEhwbjRhVjZSYWRS?=
 =?utf-8?B?anQ1V2l5Nmd1VUFVbW93WUhXdVhoR3MwQThRWm41N3F0UGdKS3d6N212OU0z?=
 =?utf-8?B?Z3BsZFBKRGFXS2FQVWp6YnR0MFBZeVErTFE0L2g1OGhnZHZCb21tbUtGZUpC?=
 =?utf-8?B?WGMvVnl6bW9paXZLYldadXNDd3FHWjZuZUNJZVJCVkV5WjBlelZjZi9wR0Zm?=
 =?utf-8?B?OW1xMkJYSmVKMEpIdDdDUE9PQ2tTbU81RG4reWdmbzRyODl4ZDNBQm1Yb0pu?=
 =?utf-8?B?VUVhOTFVdDJOaWhTemdDMW1jcWdkcy9rZVBmY21IQnVtQ24zUVlZeGJTOWIz?=
 =?utf-8?B?dVB4ZEtKSUIra0tvb2JCa0ZvQk52UXRhTUY3eld6SE1ySDVkSWI3THVVQ2lF?=
 =?utf-8?B?QVY5a293MDhUVzNkVjJSWXZDZDBQN3pxRXB4Z1F3YjZ2eHk0bVZ2bzYzNzI1?=
 =?utf-8?B?cFIySVhWRCtTR0pGMlpqbTUzYjZLRHlRbWhkbTFBUUxQUG5tMy9WQnZvSmU0?=
 =?utf-8?B?dVQvSVRnWDZNb0hiV2Z4d0RjNi9relhnRXZJQ0g3MU1Hd1NGVTZOTWJ4RnFW?=
 =?utf-8?B?RkJRNVNxTmJqMitSc3RYbnlmQ0c3WUdHSTIwREVwZ29PbDNpblpoY0p4cjg0?=
 =?utf-8?B?ejdQcHhPTkNyNXRYdDJtR2NEb1g0dVdHa1UvSUhXSmNkaHpwdmxLVFkvUmdY?=
 =?utf-8?B?NE91VFBIRFB3UFpkTWVxTnNUdWZMV1B0ekV4SEhpS0JyYTNaakNoMkpDc2Ra?=
 =?utf-8?B?WTFSUVRwWjFyZjdoRDdSbmFRL0lqL3NyNUFmMTJnQ0E1MzFlZ25Sb05hQU1F?=
 =?utf-8?B?ZTFRZUpiWFpHUDAxbkhqQ0lkOGo3K1pLYnpNTkpRemNyUUN2Nno0RDdNQks2?=
 =?utf-8?B?RXRaZEM0WS8vUHp0TEZVWVg5OXE4SFlWTnFOeUYzYm1mN28xVzZuQ3B3NnRO?=
 =?utf-8?B?NFlKNnRQS2RYTUJSWnEvV1J1cDdWNHhyYkorS0QybmFYNnFSTmtpSTZnMkpF?=
 =?utf-8?B?ckt6aE5uSEJqK3BYRDFMOXBUVkFjaE5rd0RhajhVWk5jcmFXUVV0UndlL0tq?=
 =?utf-8?B?azdjellQdzAvcWo1L2xzaENuYWpHZUN2MktmWTA1NUtqUXdKZG90L2V3TE5P?=
 =?utf-8?B?U1k2K05wVU5RT0FLOUVOeEFFT2NjVDJxek0yUWRsU0RjVDM5WStRQXplaWJS?=
 =?utf-8?B?QTc4SXYxOHhjTUt6QUViUURiVEJqQ2gwWHBrODg4c09CMms4Q01DblBzdndK?=
 =?utf-8?B?TkFubnZIOTdXZGtZZ2U0cnllMDVFcnkwOWxWbHprcmxsWk5NQ0NzMUpldnIr?=
 =?utf-8?B?YUpWWlhiR0xqSE5PNHM2ZHN4NUJFQm1vYURqUncrNTBtc05tMGNram0rcWNS?=
 =?utf-8?B?ajZ0bENZTEFteFJheHd6d1pOM0xHT2RjWnR4bThMdzYxaUVyaVFWb1lJdlBj?=
 =?utf-8?Q?ZLC0RbQK1bAZ1s4JeQgCZDC8F3wWuxzgZ7uWx9irYPKr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7145cc1-3b70-4c0d-8368-08db2af89aa5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 17:12:23.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdffdgbnhnVe05+PmWFYF8aDatXKo9hL00JypgB4G5QFLPbbN2gjx77tIhoMPHCvFm9X5ElxFZU8xYvLv+9Uxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 3/22/23 12:01, Mark Hasemeyer wrote:
>> +static int psp_send_i2c_req_mendocino(enum psp_i2c_req_type i2c_req_type)
>> +{
>> +       int status, ret;
>> +
>> +       ret = read_poll_timeout(psp_ring_platform_doorbell, status,
>> +                               (status != -EBUSY),
>> +                               PSP_I2C_REQ_RETRY_DELAY_US,
>> +                               PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
>> +                               0, i2c_req_type);
>> +       if (ret)
>> +               dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
>> +                       (i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
>> +                       "release" : "acquire");
>> +
>> +       return ret ? ret : status;
>> +}
> I think we need the value of the PSP_CMDRESP_STS field returned to the caller
> and its status checked like in psp_send_i2c_req_cezanne. Otherwise the function
> won't continue to poll when the PSP_I2C_REQ_STS_BUS_BUSY bit is set.

In that case it looks like psp_send_check_i2c_req isn't handling this 
properly
for Cezanne either in this series.  I think psp_send_platform_access_msg
returning -EIO is going to mean that check_i2c_req_sts never gets run.

So either psp_send_platform_access_msg should return 0 for that case
(expecting caller to investigate more closely) or psp_send_check_i2c_req
needs to special case -EIO for more investigation.

I lean upon the latter unless you have a strong opinion.

>
> FYI - there's a test on ChromeOS to stress test I2C bus arbitration:
> https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/tast-tests/src/chromiumos/tast/local/bundles/cros/hwsec/tpm_contest.go
> I can try to run it assuming the ToT kernel runs on skyrim.

I would expect ToT should run fine on Skyrim.  I'll adjust as you suggested
if you can please test it.


