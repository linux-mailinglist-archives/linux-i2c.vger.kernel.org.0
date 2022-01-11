Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B4048BB4D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 00:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245485AbiAKXPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 18:15:50 -0500
Received: from mail-mw2nam10on2068.outbound.protection.outlook.com ([40.107.94.68]:16104
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233147AbiAKXPt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jan 2022 18:15:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcuFhpZJEMwc5gQ1nWHR4he4Jv0O+BF0anmfoCCFtv09lMzuG24OuioYe0RMBWGO8lU56PSwQvPWGaD/eLXGC0NVbvrPviwtSWwMAlWlHZOUKIjNDIZjXnowLp2GQqub1ChNlzmM1PcwHlIILwWTHPyt49OcXAuxCglBvMKTZEqtNEL9e7fZbVMz45ElULIhWdiR9i0g2h3KdCLprh+kFhgCgUeamCWM6inztZBNJ5f7GPdDE3QpBKVeAYpXSnx3EZ+JF5y0Ub0r5XVc/U4ixvipalMYMQq0N1OhaNHmPESXkB+ZCqRCf1iuHYMHjpPWO4IFQF3L2kCNBd9yypq4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkc/B0Kxqsy0HTGdZnftDQoMhhx4ortXoJEZNrvmu2E=;
 b=OTKY2g6HDC0RUXozUjK726bEbpEux4dcmudsnrDAkRJHlGhwP0mM3JeBHqtfOaVxv/JtUTw5V1zrEEwbEfMGk9E21hePZVfUsyba0KzxzeDtNQlAK3a8mIb/l0X6/aklDe26x/V1YR/1Ym/2TDpltjTd2LjfSbu2RXqJvcj3Z5owdaALesjXRB0Dcr4j4NzoYuSPmY6rgDscVEzuWQRIsaKAwqsr9u3mblj7xK2IM1hbMQFKuEoX4IlKnFWUN43VY2bncQ6NLDXbfuPfC7ZsGnQeqXzVKFMOuQaC6j7iNVJRaQCcbkh6+P2S7Aj1L5gHbcUV5TVf1cF21lrdRtOqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tkc/B0Kxqsy0HTGdZnftDQoMhhx4ortXoJEZNrvmu2E=;
 b=kTxUzyk0TJHCWIF+3/zTIpcy87SPmRhT2p3k2IgipnraO/LZpyrmmuAO1/jMNDJDORyxQXOYy3Tlx2MRsP5Cx/t1p870nrXyOpPOBfv3jJx3JX+EQSBwf6FBn8ikpR/4HRA3um0DcANQ6CuSQSil/WGqm4OZUFBgH1DjE8ZIq0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BL1PR12MB5351.namprd12.prod.outlook.com (2603:10b6:208:317::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 23:15:47 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 23:15:47 +0000
Message-ID: <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com>
Date:   Tue, 11 Jan 2022 17:15:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22713f20-013a-49fd-b087-08d9d5584ce3
X-MS-TrafficTypeDiagnostic: BL1PR12MB5351:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5351C2C6A70681F4975E8F25E2519@BL1PR12MB5351.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWBaeo4iUbM4YsG8JQxjcGVBaRvyirM2R0J5oW5WAYW5HjBfkTBxZrYrNGw1DJVU8eXuVqa8tu+cktDb7Yybd9Mu4xH7/MEKklNzReDxdMlFSxoYzsiL7UWq4N+9sstz8SmaY2HCl5Fi8VTooIaToOz66Rr9Fn9CU76AUHLwfVfIKJamLa8vwitEmJjwOSA1T0/4ATyIqI4puKQEL4j4Wl4BbXEzPXFTgKpuXJ6iaD2l/s5ssNidDSNuNd7uShkfM14jSa8Vs7ttu/OFWetw/wyyD3st1EXEv4yhd5r39oQiZedmXy5smWBusoxKuoPLzeoBIuRKIkqLPe2OD54doEImh05uGjMgHxeaMsNtiA7vqTe4Br9IkXot4OculI0tVCtAoyXauYVW9kGmnuUQ3iOF3lZ+r1dNl4YeRIC2UCgaOaBy6OG1a6J2iXswwLPdr49ryO69KNRWIuX47o3/xdw6l7t/3zY7d14eu+NKOeXm3cNVE/tq+T18JIa4AziHl0rNixeg4rcZFQsBbC67eu9gf74jsqlLQLA/w2gDJ80wikyJkgCDRTjCb/LV+aLW82bdWW/ZeayCmznBYLZE3wtQfYNkEr36K3fdONX76knI2L4L79kxOafJTM0KGSxLUcP2EEhNI+ucuI7GTer9w8A1zsNUAjXi9B0AT1a0fVGaOE0ZH8fHMI8wIboM99rDg2oL3IxYEMmbb+kiac+pHasT2S6GnOoesauJrwxDQFnJcfPI2D7eSeOToViSPxaJpTM0Quo78jIxO2z8V+FuVZeeDJKoLuIMVP6UqAa/SvvrTwmzA3W9TFweaWvh8MBe1n46CUNvJQ9s3OgzMzLHfKBNxhDhcEWbmHtv0ik7jwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(54906003)(31696002)(6486002)(31686004)(38100700002)(26005)(186003)(508600001)(66476007)(8936002)(6666004)(8676002)(966005)(66946007)(45080400002)(110136005)(2906002)(86362001)(6512007)(36756003)(66556008)(83380400001)(6506007)(5660300002)(316002)(4326008)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFQwQTJGbUd4V3BLMmExdnlmQlR6QzJoVkliSnVYd2tZRU8rYmVaditoMmlX?=
 =?utf-8?B?eXo5T0ZLWnplTDFZdWxBZnBnOGt2Q090UmVpUGpTUWI0TmgvNVF3b29CdlRG?=
 =?utf-8?B?bmdHcUhTeXgyUFBKWWRQK2lBdE5pM2IzdGpOVis3RE9TZS8yTGF0UXZDckpB?=
 =?utf-8?B?U044dnRkMDhPMFFmZjlnVlB3Tmh4Slo5ZTd6VjljbWl5UjFXS2NiWFdML3lJ?=
 =?utf-8?B?K2FBa2srQ3ZSQzN1cFd3Y2Q4ekdONFhkZ0VuUWt6a3A4MFI1OUg4bGZQMGpu?=
 =?utf-8?B?RFpCa1NPbUlSYytDR1ljaDUrQU1xUll3QyttUzdOcERPUERTU3Q2YUhZaWpN?=
 =?utf-8?B?QTJXTHRmcStFcDlQamQ2eFRNUHRXVXRYbklZZ3pFNWtMM3A3b05kM1Y3NGdO?=
 =?utf-8?B?Mzg3YW00SGtCQTRadGg1NVhrM05RMzl6YzdDM1p2d2JaRko5QTlXNGsvdnQv?=
 =?utf-8?B?eS90L1EyeElkbHJaQW1USEwwbVlSU3hmRXVITDRQSXhJVUVROGJ2bldMY0kx?=
 =?utf-8?B?V2tYQURBVkV5R09aODlkaThPdGM1d2FUdlE5T1UrVHU3V1hmSDUySU5XSGdw?=
 =?utf-8?B?NVhkbmsxOHh5aXhxNHlPUmhxNDVJbWhWOURoV0xJSWo1QUw2SFhlZGE3bEpM?=
 =?utf-8?B?Tmx5RzdCR3pwcmhXK3J2MTBxczYzVXZOeW1OeFlvbklxOXZvZEJ4bEJzT2hm?=
 =?utf-8?B?WjF2SEtnZkdwYy9ML3VGZlVEamFEWnlyZ1ZYeUJ5WnkzYkpTd0ZvTndMbmNB?=
 =?utf-8?B?RjY3aDBaYlp4UWZ3U1hYZitPZW5aU050ZGNONTdIdmlqMzRqbFMybFcwK3l2?=
 =?utf-8?B?Wklub3piRDlIekd2cDRJckxmVmtFdXN1UWlLQnk3VVo0UlJQaFJMZDJPTGxm?=
 =?utf-8?B?YUFoT2hSZDRHMjBkTEwrSThsOFhMZVhsQXhXTFdpUytjRUd0UWQvMTYrTFNK?=
 =?utf-8?B?QlZEdkZNVzhlZzZOU2NQNk9GVjR1TW5SSUZSNmFMczBtQmpLMGsyaVVxdll1?=
 =?utf-8?B?cFZGZnhRSVlacU9jdVpiZ2kzcHF5eEt3RWFZTTJlZldnbG5GYThvdzlJZFhT?=
 =?utf-8?B?a2FHQlFwYysrSVVkQ2pUcndFVzBxa0xaL1J6bTVtdXA5YXZMSlBqcFpaSHFn?=
 =?utf-8?B?dnF2QmJUK2lsdUp3WVdYUjZDdVdPeWJyZkpVbkhUTUtCT0ZVODVBczJKMWRE?=
 =?utf-8?B?b2phOEM4WE14c0JaRnZQdlpKWlp5eEZGQ1Bod3A1YVFCT3Q1b2NxUG5OdUc5?=
 =?utf-8?B?RHRzM2dkbXdtSWN5c09KR2dSOHlpQXdNcC93a0xXbURrbzB5bG1LLzViVXBG?=
 =?utf-8?B?dVB5Z2FBVjVYMmNmTGhkcThRdy9qeTBMbUJSaWtXMkNuZERPU1VtT2xXb2p6?=
 =?utf-8?B?Z2psVVFkM2kzaThLSzFNdDdyQlZrNFB4RGdXUnIxSlo3TnJvSUdNY0ZKeDB6?=
 =?utf-8?B?eUVpWDNGOTNNQzRzUzlVWCszNWswTHM5cDY2eVl0WE80QXVKdk5pRjUrWW1S?=
 =?utf-8?B?V0FYbUV3S09aS2dBRjdIZVhTaktjUkFpdXF0NWFPK21WeWVXRWhQbFJ4Qmp2?=
 =?utf-8?B?ZVhSQXlXa0Vha2JxMG15c05EamVQYml3V2p6OHI2YlBXdzVodDFkWEM3aWhh?=
 =?utf-8?B?akhkREV1OTRMRFE1OWtFVDFnYXVSaDVCaSttd0gwUGR4enI5SUlBQjVPYzdt?=
 =?utf-8?B?Ykh4YjdBbmlNdWc3MnNYY2lURmZwWlBSVmJQdkgzS3VjRHJVSkNRRmt2ejQ1?=
 =?utf-8?B?NDhzOHFLWmhPaWd1RURjTXUrR09LNjd0S1IwRXpnVzdTcmJZUCtHcXYvTGxH?=
 =?utf-8?B?YUVjOU44VWRicm16eW45TkZlTDcyaG14SG02bDZXTU1vWS9Kc3pXUXZNTTEw?=
 =?utf-8?B?dnIxYmZrUmpGTTFuaGtkMGdhQzBmeldDaTBwSG5FQ1laQUI0bDE0citrbVNU?=
 =?utf-8?B?enZraHR6RGh2cWMybk1uQUNUZnlYNSsrOUI1SDA0V05yd2pDUXN0OGFxK0lO?=
 =?utf-8?B?ajYvYTIvTUN1ZmV4RmFlck54RzFRY25pUUE3bElvMkNaSWJyTktvVE1pVG9n?=
 =?utf-8?B?cEtabTU4eTZkQTF5YmJOMytUYTZRSVZueDhRdmo1RWVkYS9VUDRMNXR3OHMv?=
 =?utf-8?B?MXpYaHNqK0p5eTdDK3d0ZFdBSUZ3VlU1NWpzSHRJK3VwTGhnZHJNb2NuS3p0?=
 =?utf-8?Q?sUjcTW0KpaRl+Vu1fGt19MY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22713f20-013a-49fd-b087-08d9d5584ce3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 23:15:47.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+VPX+63qQymS/nyMx931M2SMT75RUfnSAMM6cHA3UoRZ6CuG4dE+LndinDDe+blJVAnkgRgvqu/cuWTWmgL9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5351
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ Nehal from the AMD platform drivers team

On 1/11/2022 05:13, Benjamin Tissoires wrote:
> On Tue, Jan 11, 2022 at 11:34 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Wolfram,
>>
>> On 1/6/22 14:14, Wolfram Sang wrote:
>>> Hi Hans,
>>>
>>> bumping this old thread because there might be some progress and it
>>> still affects quite some people.
>>>
>>>> But I must be honest here, I don't see much progress being made
>>>> on this until someone with a significant amount of kernel / hw-enablement
>>>> experience gets it hands on one of these models. Either because some
>>>
>>> So, I am quite optimistic that Andrea's issue is the same one which
>>> Miroslav Bendik dived into [1]. I will surely try to help with part of
>>> the PIIX I2C driver, but I lack the experience with the RMI4 driver. I
>>> wonder if you could have a look and maybe share your thoughts?
>>>
>>> Thanks and all the best,
>>>
>>>     Wolfram
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2FCAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ%40mail.gmail.com&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7Cc0a66169619743575d0008d9d4f36227%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637774964813744208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=2PEWQqq%2FqAl3WkxoaKYP5bqpeYoUqvgXwLxHtI5rEOQ%3D&amp;reserved=0
>>
>> Benjamin Tissoires really is the export on the synaptics PS/2 -> switch to
>> smbus mode devices, he did all the initial hw-enablement for them.
>>
>> Benjamin, see the email Wolfram linked above. It seems that on AMD
>> laptops we have synaptics intertouch devices connected to a plain
>> PIIX4 compatible I2C controller.
> 
> Oh, nice (looking at the thread). IIRC last time somebody tried to
> communicate with those touchpads it wasn't working at all.
> 
>>
>> So we need to either add support for SMBUS host-notify to the
>> PIIX4 smbus driver (at least for AMD parts) or we need to support
>> OOB IRQ signalling in the rmi4 code, assuming there is an OOB IRQ
>> at all.
> 
> If the touchpad is using SMBus, we need to have Host Notify. Google
> gave me the following datasheet for PIIX4
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.intel.com%2FAssets%2FPDF%2Fdatasheet%2F290562.pdf&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7Cc0a66169619743575d0008d9d4f36227%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637774964813744208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SkwEfI9PxDidXisredOxjP11u%2FGwdq9UTwqqp4EOTZY%3D&amp;reserved=0 and it seems we
> would need to enable something in the section 7.3.9.

Nehal - can your team please look into the lack of 
I2C_FUNC_SMBUS_HOST_NOTIFY?  This causes SMBus touchpads to be unable to 
function out of PS/2 mode.

You can find many more details in the analysis that Miroslav did on 
what's missing in this thread:

https://lore.kernel.org/all/5fc2c68d-a9df-402a-58b5-fdd531f86b55@gmail.com/

> 
> However, without the hardware it's going to be tough for me to enable :/
> 
> For regular I2C touchpads, there is an OOB IRQ we can set up, but when
> the devices are presented and enabled through PS/2 first, they are
> using SMBus only AFAICT.
> 
> Cheers,
> Benjamin
> 
>>
>> I've also added Mario Limonciello from AMD's client group to the Cc,
>>
>> Mario, we can really use some help / insight from AMD here, both with
>> the problem to detect the IO addresses of the AMD PIIX4 compatible
>> smbus controller as well as with smbus host-notify support, see:
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2FCAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ%40mail.gmail.com&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7Cc0a66169619743575d0008d9d4f36227%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637774964813744208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=2PEWQqq%2FqAl3WkxoaKYP5bqpeYoUqvgXwLxHtI5rEOQ%3D&amp;reserved=0
>>
>> Regards,
>>
>> Hans
>>
> 

Hans,

This thread has splintered but it comes down to two pieces to this puzzle:

1) Systems returning SMBUS address 0xff

The address can be potentially be returned using port I/O or it can be 
done using MMIO.

There is already a thread in process to add support for MMIO, but last I 
heard it's waiting for review comments.

https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/

Besides receiving a review and modifying for review comments that patch 
has to spin at least one more time to extend AMD_PCI_SMBUS_REVISION_MMIO 
to 0x51 or later instead of 0x59 or later.

2) SMBus host notify (support for handling interrupts from slave device).

I've looped in the lead from the platform drivers team Nehal to comment
on adding this feature.

Now something else interesting - the SMBUS controller in these laptops 
often is listed in the ACPI tables on IRQ7 with a _HID of SMB0001.

That is adding an ISR for SMBUS Host Notify support may also potentially 
mean needing to revert 2bbb5fa37475d7aa5fa62f34db1623f3da2dfdfa

And maybe if we're lucky 
https://bugzilla.kernel.org/show_bug.cgi?id=201817 gets fixed too.
