Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE1948BBF5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 01:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344323AbiALAk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 19:40:57 -0500
Received: from mail-bn8nam11on2059.outbound.protection.outlook.com ([40.107.236.59]:3960
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234326AbiALAk5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jan 2022 19:40:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/2AQ1FcMFtS5SSYmD3cn0Aqa6GzE6RtuVT/fextbhM4gze1ud+8qXQCaAQCkENJhPpW5JiHySo+cRlsXnmnjzVFej7950Gz72yWmPH8myAQ7gCGmLU85pDGCeETtNFoU6Y8md1+P430YT8/cvSbtFEgUCAuofvuE7Fi5QU6RZIXe01VCHEvWfZp3C1+fdLrFMWhXMAgR4mNhm6tXjhBO28c9jZLiPQ3/9y64XY0AlBVg2WQoI7eCzeveQ72MukNtsKFUURYFjDeEwXyli70lbwp2k+YVZOKBCXLvAthawu08/sZBUGw0uQmqCrwdP3QhbU8DTkOCfVB/y1adHFXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/TbkJ/6ANX/hDZ3/4ypEhGzV5JTffQl2r/QK4rLBCc=;
 b=h+KWumxLJHkz69gL6hthy80NhjMLYHmCe9xXXWflpOQ1Q+sE+ww1GCP2sOnFxqB0Yi087uSXFE5muWevUJC1Q2rxS6nY/z91gY5m1JbAGzRTC4MN0nYc42EAp9FYKNb0e3kKCua52RJ07A2Cu3+oM+SqHqra4wrH7cxEZg5TWZ8lRd5FXC/SP48NHJmrW46Bm40q51qCAuOvRHlL4DD+bua+G+nsMN+4TbjXZwAE+p0flHGmaa0RnYTcO61WoVtwJop2DsgKRk89OLfErbOs/0OH4EOpYMoqwyVtsJJRjLvjcdPACURSh5GVf8s6pgFgJ5cWN91NxH6FV/YVSJyx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/TbkJ/6ANX/hDZ3/4ypEhGzV5JTffQl2r/QK4rLBCc=;
 b=u5Vuh8ul4Mo7Wg9t2lHhP7qZfo8RSqcjMGpUW9BznQ8hbNEQOBXiaaDI6WtNrUKMwlEGxIkpmC2GpfoSbgz9DZUqRSNdK0YKKmGqlcZkO8kGjSt9jIo4uReLfvPNLgG9U9msE24rrGeI+D+/Mdekj+4paGYb1Ef/G9v2t6pHDAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MN2PR12MB3550.namprd12.prod.outlook.com (2603:10b6:208:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:40:54 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa%8]) with mapi id 15.20.4888.009; Wed, 12 Jan 2022
 00:40:54 +0000
Message-ID: <57683695-ac56-d099-c347-635eff9ec649@amd.com>
Date:   Tue, 11 Jan 2022 18:40:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Reply-To: Terry.Bowman@amd.com
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion> <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
 <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato>
 <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai> <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
 <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
 <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com>
 <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
 <CAHp75Vee4yeGLz-ErS-fVmv2c5mxC7nLVzqTnPnOP8guN4TGCQ@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <CAHp75Vee4yeGLz-ErS-fVmv2c5mxC7nLVzqTnPnOP8guN4TGCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:805:f2::20) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36c0973-3899-4bc2-84e2-08d9d5643094
X-MS-TrafficTypeDiagnostic: MN2PR12MB3550:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3550B29C2E5CCF61DE68F8BA83529@MN2PR12MB3550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UKW3pUazCXXtwCmOEV4ZGyzyozjPsXN0if6WUzHGFSnAYKh3MQsrIvN8w1YBj/aXUUvpSSgq9xixzjgV+zn8tI25NmMhC6N8C4qryJ29UiV8AcgRM7fVC0Jwg6z09yBKyy0YeGzLH6RlKAZvOaNTU7hclCx6CDvMnRXR+cqmAmxzwLXYY4/wdu5gwKbKn5Z06zzsmgbOXiRAdDSsYUPH8qzCS79WyqhJZLBh7NVnrAuVRvY16kTf+gRtacslbkYjjvQ20MYUAbEfHiTdK2p7bRFCcm1uHZmRqim3ckNPDnovBRMFNDj0NrPf/4T417ae+p0xH1Pmz4ag50GHUUz/JhMi8W/XweH+dVC61RP1ZTVfaJEQiFAh33P4MLX4nnY1u0BFBEmXC2WW68RhtKIvm/bomNbT7EFSxgfTh37jbZfEDTfdirF+4gyDNtSdc9u5XIbOdsE7QEMMprEPKMXmAJ3CONIEmNnVO26oHlJHsGqDUIOKrt/sHJOUIiAfhq1PN6uRbp+aRItuxo+a4c93/lGEHNPk2G/XsLTWsyNYN1lVn0wi7QL8G+kE800t/eJf+axGUlTWyBhkoFFu8KKqWcuUKqzM60J8bWm8S0sD33GvDP8Lc9v4UhGYfyaImtQsJ2Y05vVKviixlbFkU9tNZi4yAI7mKphFahKySFlDGgpNRVoFqMQNa/0QjPn663NFhC5ehaUrdvp3k1xRgnF5hTjiNqGHtIUUspcoelwvLehk++pQzq/YPErrbse8w0wWFpvzBfnj0rphra0BnHG6wi54hwb8P+4jxaMX67wJgtSLDWhvfzkRKnhnm+sVoDcEgM2uGSQduE2uO22Kp3V3/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(83380400001)(186003)(31696002)(38100700002)(5660300002)(86362001)(8936002)(8676002)(2616005)(45080400002)(66946007)(6512007)(508600001)(6486002)(2906002)(4326008)(966005)(3450700001)(31686004)(36756003)(316002)(54906003)(6916009)(53546011)(6666004)(6506007)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmZBekxoajJza1liR0xwNkRVbUsrM05Lb3BsZTJoZTE3YVBGREYvYnI0YXY2?=
 =?utf-8?B?UnBLSWtjc29sbnlPeHc5Z0t4MzF4OGM1bU9HS1Ruc2hJMWhHLzA1N3dNempw?=
 =?utf-8?B?SDVVSkU4eDBqajFiSTRuWHByd3pUa2VMOHZkMDlHN3NWZEdaVFVwaGk2Wkpn?=
 =?utf-8?B?Zmp1aXA3U0F6Y2dNREx1RjhER2RraTJYYkJOV21RejhnZVVTejc0czNQNitU?=
 =?utf-8?B?VGVCaXpBUkl0L0NDNGxKcUJMbENKK2kvV1FSRUZLTnIybmc5TFMzM0FxQW4y?=
 =?utf-8?B?N3M3N055WnRzcTc5MU5YZVRGMHFmblhVdmdkWEczeUs0NzRNdHVOa1ptQnlp?=
 =?utf-8?B?Y29RSkpIT1hyVzRrSmd4d1hPcWRHb2U3ODdwRnh5YzFhODdLb0FtU0IvYjdF?=
 =?utf-8?B?d3ZtVXRvSldSbzIxK1lLaHRsOEVKcWpwV1BUamU0LzduRno1aWZ6T2pwNUpG?=
 =?utf-8?B?UUZVS2NDUE41azhZazlyaFRMVm0rVXNJdi95anU4UnhvVHZzWGdUY3ZsVCt5?=
 =?utf-8?B?b3JKUGNmYzNmR1UzL1BxcDNkWTdLc2NIWVdnTUVBVW1mTjZvQ0tMRFZQZm5I?=
 =?utf-8?B?Y3JDMS9BWXdsUGt6cS9jMVRucWd4OXhpdkhuMEU1b1U5RGlQaGxxYXZXZW1s?=
 =?utf-8?B?VFFpRnhuUEg3bU5CYjBNMkJQeENEVUg1WFp2T1c0dGEramZVZGVYb3FFdjdo?=
 =?utf-8?B?Y3hvYVZwRGVuM3NLNmtmMzRrQjc3UUNJdlV5RXZlMVVJRmZoMlU0OEQ3OWFn?=
 =?utf-8?B?MnVMZ3dNditDRFpYVmhxQU9IdzZFN0FGN2tjYS9vMHVZT2xpU1czTGZKbHl3?=
 =?utf-8?B?Vm13TXYzcm9lNjI4NVJxL200b0dPMnJsaCs4YmUvWE9IU3Z4MUNrYTd4dUgy?=
 =?utf-8?B?dUhBRG53RVJXS1EwTFdvV3Nac0lKc1R4dHQySDdiZjBYL0FtK2hvRXdZdEpo?=
 =?utf-8?B?d0R2WnRpVVZWLzZKdUhBc2RGYkJTT0lGUVAwczZvQVYyVDlURTUyNWdodTdu?=
 =?utf-8?B?Z2MzbUQxVFRtZEs0aHIzdkNNZGNlWklWSEhhcE8yWGgzblpzOEwxYWdFVFNn?=
 =?utf-8?B?b29lRXM2aFVJN29TUGptTHVsQmdSYy9MdnNoNi92dmtFeFNuNnhFdGNRZU8x?=
 =?utf-8?B?K0ZCdUJRUTdHMy9vRkJrWHdxMWJLQ1RLRnhML0RUVUs0TVE1bFNUTVVMQVdz?=
 =?utf-8?B?R3Brd3o4cTJBMVVDTTZYK1VQQS93UVBkaDZCTkxzUkh0UW5IT3pzUEVRQnRs?=
 =?utf-8?B?WUVFajViRjhWNFJ0L2FXMk9RN0kzb2lYK1FJeVZGWmhnU2RSUTlJRHRZQVZr?=
 =?utf-8?B?MlphNWZNZ1VqVDRla0NYVE5IamZya2lvMnJzMVlKYVp6M1J5OXhCQVpnNVRo?=
 =?utf-8?B?MHhIOGpHMThyOERVQ2dKLzYyK2xBbUFZWWJ2WjlJeGdSa1RKNFl4OGRRamF3?=
 =?utf-8?B?d2t5YW9xbDdFdThiaFdZMndMQ0h5bDhSOVhvWm1qc0xMakU4RnNZbWlsK3pZ?=
 =?utf-8?B?VjVrOGFRRERnRHd0Y1dFbzdoVmJOVVl2S2pkYXh6a2xtSHpFME9pbXYybXYz?=
 =?utf-8?B?cWZCdDUyVEtVczh4TVRoLzd1N3l3Zmw2U2JWbWhMWUxFZm9aSC84UkFMMFZY?=
 =?utf-8?B?SkJUUUw2V01DUjh5eGFDT0pTaWxQbGhIRFpkTklScTdma0U0K3g2WmVTbnRr?=
 =?utf-8?B?a2IweTVpVGx4NU5iUEp3RVJoWVFnckl6TUlUZWNrQlBrQzRwaldQdTVqdDJh?=
 =?utf-8?B?K01Bb3hldGZpQjZvU2Y1bG02UG5GT3Fsb0FZK3FldWRIS3hCTHNxYklWOUJh?=
 =?utf-8?B?YXM5OEg2LzR0dG9nMmN2NjNaZWUxdDg4b0ZLOURtZmdKakZPWTFjWlBtS3lD?=
 =?utf-8?B?S2VmUlp6RHVFYUF1b2ZhdytmdmNBRWxDVFgxZSs2Skg1YXhkUGhlc0dMRW9K?=
 =?utf-8?B?UEo1NUdvTjRvNWpVUG9oQmlTSkdnV2dUQ2tiN2M5UGFiZi9TSklVZExiRWhw?=
 =?utf-8?B?cWwzQ1pkUTNmNyt3UTRob3ljdUtFcER3OWhkeXBVcmpwNVg1Vlk5K09jMDk0?=
 =?utf-8?B?Z1VIaEdOc1RCZUhIeEdmZzkxYjkwTk1xdFFrdEpERDdDM0EybjFCOFVIUVZi?=
 =?utf-8?B?YVJVU1ZYNGJYbnVPMUx1OHNwTGVCbU5qai8wK0ducWwvUXNFM3FLYTRTdlo5?=
 =?utf-8?B?bGcvd0QxR2VUWUdrV1N6cndCa3FQbjUrVVU5L1RCMlhNc0MrSTJsMkFwcncw?=
 =?utf-8?Q?TWMeUL3E/LQU9aTWgI7MA2higDaT9LeBvxKdhWrTSA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36c0973-3899-4bc2-84e2-08d9d5643094
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:40:54.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNMOXnApQZBCsVc4D5UtpK2DuLr7qpm6tgygZPOLGoPFerjhjRZC2g5zCZCEYk5c3q5Wag7BWbTfdyGJIQcbWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3550
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/11/22 10:17, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 5:50 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
>> On 1/11/22 8:54 AM, Andy Shevchenko wrote:
>>> On Tue, Jan 11, 2022 at 4:53 PM Andy Shevchenko
>>> <andy.shevchenko@gmail.com> wrote:
>>>> On Tue, Jan 11, 2022 at 4:13 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
>>>>> The cd6h/cd7h port I/O can be disabled on recent AMD processors and these
>>>>> changes replace the cd6h/cd7h port I/O accesses with with MMIO accesses.
>>>>> I can provide more details or answer questions.
>>>>
>>>> AFAIU the issue the list of questions looks like this (correct me, if
>>>> I'm wrong):
>>>> - some chips switched from I/O to MMIO
>>>> - the bus driver has shared resources with another (TCO) driver
>>>>
>> Correct
>>
>>>> Now, technically what you are trying is to find a way to keep the
>>>> original functionality on old machines and support new ones without
>>>> much trouble.
>>>>
>>>> From what I see, the silver bullet may be the switch to regmap as we
>>>> have done in I2C DesignWare driver implementation.
>>>>
>>>> Yes, it's a much more invasive solution, but at the same time it's
>>>> much cleaner from my p.o.v. And you may easily split it to logical
>>>> parts (prepare drivers, switch to regmap, add a new functionality).
>>>>
>>>> I might be missing something and above not gonna work, please tell me
>>>> what I miss in that case.
> 
>>> On top of that I'm wondering why slow I/O is used? Do we have anything
>>> that really needs that or is it simply a cargo-cult?
>>
>> The efch SMBUS & WDT previously only supported a port I/O interface
>> (until recently) and thus dictated the HW access method.
> 
> I believe you didn't get my question. Sorry for that. Elaboration below.
> 
> The code is using in*_p() and out*_p() accessors (pay attention to the _p part).
> 
> My question is about that.
> 
>> Wolfram pointed out some AMD laptops suffer from slow trackpad [1] and
>> this is part of the fix.
>>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2FCAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ%40mail.gmail.com&amp;data=04%7C01%7CTerry.Bowman%40amd.com%7Cded2c3a486854ef44c3408d9d51e0cad%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637775147318596002%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=lKNVA1xFkS5bIxDS4%2BdCXVPKlrIOY9PV%2BW9sLtnR630%3D&amp;reserved=0
> 
> I see, but still it never worked, correct?
> 

I was not familiar with the trackpad issue until a few days ago. According 
to Miroslav's post, one of the issues is resolved but their is an interrupt 
flood still to be resolved. 

>>>>> On 1/11/22 6:39 AM, Wolfram Sang wrote:
>>>>>>
>>>>>>> I have briefly read the discussion by the link you provided above in
>>>>>>> this thread. I'm not sure I understand the issue and if Intel hardware
>>>>>>> is affected. Is there any summary of the problem?
>>>>>>
>>>>>> I guess the original patch description should explain it. You can find
>>>>>> it here:
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinux-i2c%2Fpatch%2F20210715221828.244536-1-Terry.Bowman%40amd.com%2F&amp;data=04%7C01%7CTerry.Bowman%40amd.com%7Cded2c3a486854ef44c3408d9d51e0cad%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637775147318596002%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=oNfdc6ozDE57vqwnEH4n2KQfXdxcF9rAiI9R592CKv4%3D&amp;reserved=0
>>>>>>
>>>>>> If this is not sufficient, hopefully Terry can provide more information?
>>>
> 
> 
> 
