Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DABB48B14C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 16:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349663AbiAKPuW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 10:50:22 -0500
Received: from mail-dm6nam10on2044.outbound.protection.outlook.com ([40.107.93.44]:27343
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229868AbiAKPuW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jan 2022 10:50:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya5qWUtjSWJyQMv1aixwA2wIGMH7cXD44fHIp9d0zWkzn/yfDUjVsbnesAFPzP9EnGzD3UJ0E+/WGeT98pitl6vjZQ3Y9kCOY/F2iWE3jPGtMy8avXPwPk1IcpJ0UMtzHuVsQiStCfTq0F+YHfyFCvNVMp/qO2rioI8C+Kh6DoXubi3mO9FxQzffCLvOS562R3QWIwVISA+0sgnAGawLTaycTOmxWX4slm9hz4Apqu7x7emVfJ6B/H/FpP/54YWCijtdE6Daiz0givO1gWKM/5eo47NqrhZ/ZBXr1KlZh1GiCLpWR73jdgkXcAxHFOKe8nTO1PB7ZJGsrgSGbp2wuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GI7JMDXx7JUQAk00MDPznFrn4xmDqHg26QObm30SoSQ=;
 b=abTCsnae+bn9WVw4Q+SN5Vy0xjTFLjHboFiS2Ag8KXu5yWqiBB5bH6DLskd11nTXtCYIq51VG0GGXujsZygMiArptkquYHU/9DJJ7pE3CPz+LSIQz/hqookj4F/PRmGUo34tvt/tln4mp2kBTh/JwqPlFcJlMO4vmakmiu5CBgYeORz0XTP1My6GWiUI+CP3ZZHVTll06i1srxdY/34doTrq75y5zkP/u3uvBKwiGmW/boH6uJLPK1OmKZW0hQC5GVu5xr1wgTBH68cpF31AfzuIk0IJyZCd4GX/pWDLywH69ganD8WurcM5VHTPOIrwlML6OqFKKdICh5/q4NXcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI7JMDXx7JUQAk00MDPznFrn4xmDqHg26QObm30SoSQ=;
 b=n8RiOnlS+49FTOTFKCgS/o0Hw5C3H4uPOGXTW6sIFbjciwUzOg+I0DXHy5YfbCa+z+aYBUX63O+x9xgxwXEV6R/Ef0RNfCdi65i39egl8zUfi3jaY4phIqu4OdRqsCCc70bJUzjm/75VC7WWwc1sBup/yRkrRdn2IIu+2/LjAd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 15:50:19 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa%8]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 15:50:19 +0000
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
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
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
Date:   Tue, 11 Jan 2022 09:50:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:610:38::40) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e6a8e94-2eec-481e-3e75-08d9d51a11f1
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2618C1749623092CB4C12ABD83519@DM6PR12MB2618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhCuzvO7Leu8PDlBMlqH4ezTFxnM5dd3yGhJAwWAm/zJ8Ap5cqRAsZVGM32vmSrIzga+Yfwh8JTIrU/9CAQ/yLKlWs4vjyH2yYbVZ5G7BUgKWkmN2o1AYxoxQXqFWTvA2YBiPUWpXoj7wlpewCU3X+24OOaqg/rtAyRDtKrmfEsdlPx94MDPR2oTQj8iWLvr6qJgANvUWEixGge63JG9wc3AZngu1Lv07YKiqf9oc7MLDXA0QBcO6ayN7u9iLCHjf2/SZAqx+QYbRQNHG04Hfsnk9QVlXyCkuQTL0rFS24AyJugyrydWGC1AjhoWv2FGWotL23T8YWHPFPg1qaBt0LvOnRLlMNtNigmkd2K9Vy/ddF9+atRaOoIqt8sOyyrZjoIM55+GoX3nGR9moe1O362Kr3BvuGa+sWonr4Wx4hD38uQfqV/9oZ+qQ318Z2Cu3Xnf/gUXZQVE3/qLDupaRM5CAJRpafrdNFYo346qmooRlcV2J23JplaEB/BOYiNmMHRjPsIiAXezxHAv/GQq+tL3eXJFRqNUED06ub1/gHCrEv34VhyD9D6kuVncF+eBepRuTueVNhh8W7r98dKFsuw990iE646Ok6VH9dSHFZC5eTmShdZNlLirQN+SnuK/vIbPJy2LEWIVwa7+5P7qbFjSyqQVDxNwmcBdW3MykKBL4gp8LjwZxZHDAUWhRJ7xnghamYv8u6ZhOBBzIsQZN3MDISKdqjIsFSd3S3BwcSiuzzCNkvx4eEzU7Q9wQhdcA1583wliR1rWX7+vJd4VIlWN5UmspoEzzvBbt4FkefmZhME4Dl1wnO0sZbFfoIrOMQ3qaEa6id7O8/e7ep7NDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(26005)(8936002)(8676002)(38100700002)(31696002)(53546011)(6506007)(186003)(83380400001)(6512007)(31686004)(66946007)(5660300002)(2616005)(316002)(66556008)(6916009)(6486002)(2906002)(54906003)(508600001)(66476007)(86362001)(4326008)(45080400002)(36756003)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWtIMVRINW5vSGtGcmJnN0JlOXBsbTREa3orWm82eGdSQXRzUW13OW5aNkNP?=
 =?utf-8?B?U1AvaU9iTUVDYkpJdXgza25rcEJQVDBVYi96b2tFeHNDSHJoRnF6c2R3Y3pa?=
 =?utf-8?B?bThBd0VwMnFkdXkxRW9rckJsa3lKemJ4YkJYUHBwWTN0aEFNYTdpT1RyNDBU?=
 =?utf-8?B?RklDYThPU1VlSXNpUkpvbzRLalIxSmdvc09uLzhQK3BoaXRjUnlLU0tYT0Fo?=
 =?utf-8?B?OE12bVNIQm9kV21CSlNFdVVJalRLdVJwOVVUSjZZMHlqNjAxci9EZ1c0S1RF?=
 =?utf-8?B?Q1hiWG9qaHZ0WFVVYWVGRDJmb0N1MlZEWkwrcVlpRUNUYVQ1aHpRZzBMb3dX?=
 =?utf-8?B?dXZCUGh6cGkwdjMvZW8vcUhZbDhRaFlHTXhOckF0eERrbE9ET3V2MU5HbEVB?=
 =?utf-8?B?VVlSWVRRLzltckxmQUFHWlFHZ2dSZlFsVXIvOFIwNVdkSVFTT0FCV0hocmJ0?=
 =?utf-8?B?b2gzTjJFR0NqT2N3bjlCT2NibXNRbVcwUzc3bmVINDd3cUtxMFJBZTFCc2RW?=
 =?utf-8?B?dWgrTXBmM0VKb0dIZVdpVTJYcTVLMlpLMm9Bd3RQQis2SVFjUXNLK2llLytv?=
 =?utf-8?B?aTRYSUlvUHZoVTVrMGtjT2pTNHBaQ3V3YWpnaUp2ek14MTVWQkU3OThIYVF4?=
 =?utf-8?B?bmF0TEJIYVB4NE5YaGJqbGxMSjhrUEZQOGxMaEhWeFNIb0ZFalVtQ0FvZ3p5?=
 =?utf-8?B?UXkweTVxS3VyUXNUcjVhekhLbzNMTENOQ3hXZEVtWnMrdmFYUGQvY1V2b3pU?=
 =?utf-8?B?L2ZwMjFSbzN6RG9Kd3B3b1N2YnBPQ0hQQ0R5QkM4enZFVHM3UWtQUnFaNWo4?=
 =?utf-8?B?cStsSFhQYldJRWFlRk4wazBOa205RThPaFV0RithQ2VMZUJCOHBMejdRb3Ri?=
 =?utf-8?B?UEMycmFVellUMndvc2JlMWM5Y2FacVdtdzUvQkpUbkdFanVhVXV0Nzh2NXo2?=
 =?utf-8?B?bkVpU21NZE0vcXRyV1gzT2ZzOTE3MDdDcERWNEdrc1Y0aG03Y3VoMG52Skpx?=
 =?utf-8?B?dHUwdzZZbjBzNlBnZTZIVlhoc1hnUzVWZSt0cmZleVZqLzVRZy9abSt2Z1FB?=
 =?utf-8?B?aG9LNm04Q2xEb2RTNnNBemRIeVhZUWloeFFXRC93M1U2aW1tV1VjYTNTRVpo?=
 =?utf-8?B?L0hGREFGK3dYQ1RoUFQ5TEJIT29GMHN5emtsRCtVZFgwQklwYkU3ZStzQUNC?=
 =?utf-8?B?aHdGRkk4WUpKcnFQNEo5azZyYWZMVVdJUG42bGdDQ3ErQ2EwZDZadHk2elNE?=
 =?utf-8?B?R3p1NFBzRGdTSzQ2QXNaQnhYelJmNXUzekhGdUpCNTV5SzQ0MjJjUitMTnNT?=
 =?utf-8?B?QjFqeERQcXBxMlBlVE5JeWVNamV6V1VIR1VBdUt3RWx4bUJLYlQ1cGF1SUZl?=
 =?utf-8?B?L3pzSCs2T0V4UytVSnYzbk5vNDY5dUtuMlJIUzYrWE9kZDZ3YjRCeTMxd0sz?=
 =?utf-8?B?bzM4SXhBMjRWVkFCR1lSUEVCZHNianRaT3hoaHdWUysyV0lxYytNYyt5RTVp?=
 =?utf-8?B?cjZDQ3BEVDVZREc2ek1GbHZzVWlxOVc5Q3FhTU84THF3a3BnNXJHckhRSGkr?=
 =?utf-8?B?MElZYndBdXRBK0UyTHB5RWlwekp4UU5MWExKWVFaY29rVU1LdlprUktocTNZ?=
 =?utf-8?B?K1d4ZCt4UmR5V3RlUWdBT1JxZFd0Yk1kVjBlVi9VZUk0VDVWZ2Fsbi83US8w?=
 =?utf-8?B?UDVvMk5uRzdNY0s0ckVuWng0MUdlOFA0d29kN1dZQmMycmVQSTB0d1dSZHJn?=
 =?utf-8?B?blJXcXovWUlBQVRFc05OQUJuRDgrZExuTXZMUkJUWUh2TE1jNGFxNEJZdmFn?=
 =?utf-8?B?blZlNTF0bkp0M1V3bnZpcDZFWVROU3RpS0FQUnY2UVNsaFBScWpzb2luUDg3?=
 =?utf-8?B?VVlQa1c2MXFBN3hzcGJkQ0RIcTl2KzR0Q1FqbWRPNFpUT1RnL1VZeDhMSjA4?=
 =?utf-8?B?d3FkeGdpRmxmYmtJMEZ2US8wUi9zWGlET0NFQ2RoMDI3NnB3OEFJL1RBbU5t?=
 =?utf-8?B?SlQ4dXdmbWdmNURWd2Q4cEdnN0tCNFBkcDluOEtrUHUxd0ZnRGR0UjlrSWVX?=
 =?utf-8?B?RTdCT09nbWxqUkpBbFNVZ05XK09sV29wRFhGMmg2V3NpM2hZVDI0eUlTWSti?=
 =?utf-8?B?NXREeWEzSVdBTldKQkpsSHVPZXozck5SYXVkWGlzU3psVjR4TXlNc0VPNTJF?=
 =?utf-8?Q?Lnb0G5bGBIViLlIhBU5FIxo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6a8e94-2eec-481e-3e75-08d9d51a11f1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 15:50:19.8243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdjbjaiUjRvlIlOnjqiEWkf+es4HVsXrne4jXk+knLRV8Gq+Ht6rYoH+f/JCm/XzDoOXraDwaxIQHY0u654eEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2618
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/11/22 8:54 AM, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 4:53 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Jan 11, 2022 at 4:13 PM Terry Bowman <Terry.Bowman@amd.com> wrote:
>>> The cd6h/cd7h port I/O can be disabled on recent AMD processors and these
>>> changes replace the cd6h/cd7h port I/O accesses with with MMIO accesses.
>>> I can provide more details or answer questions.
>>
>> AFAIU the issue the list of questions looks like this (correct me, if
>> I'm wrong):
>> - some chips switched from I/O to MMIO
>> - the bus driver has shared resources with another (TCO) driver
>>
Correct

>> Now, technically what you are trying is to find a way to keep the
>> original functionality on old machines and support new ones without
>> much trouble.
>>
>> From what I see, the silver bullet may be the switch to regmap as we
>> have done in I2C DesignWare driver implementation.
>>
>> Yes, it's a much more invasive solution, but at the same time it's
>> much cleaner from my p.o.v. And you may easily split it to logical
>> parts (prepare drivers, switch to regmap, add a new functionality).
>>
>> I might be missing something and above not gonna work, please tell me
>> what I miss in that case.
> 
> On top of that I'm wondering why slow I/O is used? Do we have anything
> that really needs that or is it simply a cargo-cult?

The efch SMBUS & WDT previously only supported a port I/O interface 
(until recently) and thus dictated the HW access method.  

Wolfram pointed out some AMD laptops suffer from slow trackpad [1] and 
this is part of the fix. 

[1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com

> 
>>> On 1/11/22 6:39 AM, Wolfram Sang wrote:
>>>>
>>>>> I have briefly read the discussion by the link you provided above in
>>>>> this thread. I'm not sure I understand the issue and if Intel hardware
>>>>> is affected. Is there any summary of the problem?
>>>>
>>>> I guess the original patch description should explain it. You can find
>>>> it here:
>>>>
>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinux-i2c%2Fpatch%2F20210715221828.244536-1-Terry.Bowman%40amd.com%2F&amp;data=04%7C01%7CTerry.Bowman%40amd.com%7C89e551e0ebe94607beaf08d9d51288f9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637775097863907004%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=gvJ0FC9MVacQunc8uMJ6oJEw0pGcisu9muQkE8u4rxY%3D&amp;reserved=0
>>>>
>>>> If this is not sufficient, hopefully Terry can provide more information?
> 
