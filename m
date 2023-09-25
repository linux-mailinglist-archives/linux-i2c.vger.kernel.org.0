Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A3B7ADFA0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 21:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjIYTj4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 15:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjIYTjz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 15:39:55 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2109.outbound.protection.outlook.com [40.107.243.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05D4101;
        Mon, 25 Sep 2023 12:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWaVhUv14yV+LErS54idVnjraGVv0C/02yKI1497BgbgqH+BvNw26LWIxIoKuuXjGcwNa1jEHNpGiAxAVKL7ZbnY/ueYIJKimVc7SnEwUl7q7kBDW1O26U0Z6Qbk8ruulbuvjMb1ugUfCc3p89q0n25vS466utBA8cQtj4gZlSJ/p1zV+YFbw2fXXuelQLcJlTj8kg19/reD631SSt2IsBiII0+z5CMxt3I7Hm+Xy0c51+LuSG1V0YxO8l4SzlYXp6W+kDwzqVh2E8WAoCTAomV+G12XZvFu4q55tHScBWkRHf0bCEV84d9xxJhBLAYXZupB35xHmKwUuV2My8vC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj48+E4aOK/l0kOzm6FkIKJMInG9qNAXgroUL6YTyWo=;
 b=Lj03qhCH3jM35b5QnC7r7s4+EMZ6/+BdDLdENCUgCeAI3g0JHvzj1j+vbrIXBZfYYxaxeRle1vuXSAFnSv2RuJra0k/P/NrhoJsD0EthK4OPVgorrZXfMzwYQnxCSygFg4A7FmDQUtn/RdvgC/aGZV8pzrXB2kd0xTqdmB2Yh8KJr7C16mvbVgGFysMKNZGIAEZUlRZp+NvCATxiIkg8TrwgDeB0wTUkRRGYrifSae0QWvwr5bmw8m9UOQ0qt6lVG74PB3HXyEZuCdgBCQsXhZNz1flGEODiO9BbMiC3XNykJeycp8Jmk4gSOs2Vwstgqu6342K4UvAm6ZBjM5NmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj48+E4aOK/l0kOzm6FkIKJMInG9qNAXgroUL6YTyWo=;
 b=gmHMKZlT2AVN5zwX8lj6XYgPoqAFxDFuNGo8htNThVSGHNfRh0it7D7Q4ZSTH2XRmqEKVk8kvEqgBpf09WEgBQ763PrnX1btcRMbDxSoNFr3PkkHJLkRNnP8c5EFq8ltckGlQLrIVIQEu+JwTydY4ZNDdXgUdHdqTjqGB+Amv7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 SA1PR01MB7357.prod.exchangelabs.com (2603:10b6:806:1f8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Mon, 25 Sep 2023 19:39:44 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::e565:f57e:a8c5:5fd5]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::e565:f57e:a8c5:5fd5%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 19:39:44 +0000
Message-ID: <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
Date:   Mon, 25 Sep 2023 12:39:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Wolfram Sang <wsa@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com> <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:610::16)
 To DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|SA1PR01MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: fba58cee-d6d1-42d3-bfe6-08dbbdff2b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdLFu4bJIixg3iAZtldx6Zf/FiJ9EaNuQas5VZiHNUGDG/norsalzwj2hg2LjDAPHIpi4HoUYqoZ8gzqgD/yb+2u7KGSPcnal6Q8VMjAeTyEWOOZzoFtxOR4OoOyABVY3L9rQb2dDAjYnjV7r8fmoVd4elKSqsPh0KyNSzyJDAKKxkvUxk+5q7cLKZE7vHCpbhTqhRNQJOHP8WefQW/d31l17Zv+margJ4mPVkG9ngxOlyXjph8wm6IKYA7boVlkqOi3IXWKHHQT+LZ1nQ1+4yetuLvtksvx0VenrfSBVKkCQUB2gKMsxaEybBA/7fEROxgDm5IyMvH37+Q+VUBc0YniMCA0tZvmTLk5fcLfIIIFy+/U8e6zyyouRaAEpWLheyDWYbo3Gl4v4pnTWERjpnJ/Wa3ahpCRYhH5xN3PPbCH+VqGU+/qrI82ozSO5M/NeQY3o0H5l2LiL9TVZx6on31cwCll6yd+o6VuOp9uHTaJ/6HIFzK2uv6gFh4iQCNOY6B2guxARRaLdJ9NsFssZz5ciCcLi1z68I6ITNYjvEIskd4aG9CY359PaVhDGcGq7mBRTKSsQhTjPsmEBkMZgNsC3o13Y58eh/3k0FwHTBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(366004)(396003)(346002)(230922051799003)(451199024)(186009)(1800799009)(31686004)(7416002)(53546011)(6506007)(54906003)(66476007)(316002)(5660300002)(4326008)(8936002)(66556008)(41300700001)(6916009)(8676002)(2906002)(83380400001)(66946007)(2616005)(6666004)(31696002)(86362001)(478600001)(6486002)(26005)(6512007)(38100700002)(966005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2N1ME5IeGlMT2p3VWdCV3NiWno3Uy9YNG9oRmllOThQMTdEcC91MDVhek8w?=
 =?utf-8?B?WlI3SzVubVkxVXpOaWIrUmk5VDIrams2T0kxUm5HdHdNNTBOY2dDSDcrZ3Ar?=
 =?utf-8?B?SkxwaTV2SFdXSFU3RHdmYWRRN1pZRHNaVDFnblFjOWprQXAzV3VXQUFjZlNJ?=
 =?utf-8?B?M2FKRGExd05IbEFjcnBZcmY2WTh5YVpQeDJKdkxPUzlVcVJaZVgzazFiL3dv?=
 =?utf-8?B?V1lwSjlka0Zsc1BKczlyQmdFNlZWdzFaZmdscVJpRDcwNkFhVHhyY1pPQmtk?=
 =?utf-8?B?TDc2V2h0YldQby9Za3VWajF5My9LeGVGR2x4UURpUXc2d0VoKzFZa3JrN1Bx?=
 =?utf-8?B?V1Q4QkxGanVmRDdNT1JIQnZ0bWZwUjIvMDdMcUUrQ1pCYklkUXAvM1RvNmM2?=
 =?utf-8?B?UGk4YWFUZUJXbHU0NlRTalhDeHJpZjVDeXVPQlZWVEw4ck9ra2p2Q0lxVG54?=
 =?utf-8?B?VTZsUzZIaUl3OEhEMVRYajFOK2NwRjhBUHluUnpWZ2U0ODZPUkFQMnUxOXRJ?=
 =?utf-8?B?Q01CcHFXQXhKSXdCekR2bXVvNEg4d3ZsTDhwQ0pFTVhONE9lRWZxMzh5ZmE5?=
 =?utf-8?B?OEtKQTlsd0QrYzIzMnBPb2xSOXU2TmF4d1FjdEZrc29MS0Vsak9yRUNqMlJN?=
 =?utf-8?B?YmUxaitBZkZyWXA0Q2VhalF5Q2EzcGljMDdMamhvTGQ0QnhnWEY2WGN6Rm05?=
 =?utf-8?B?OC9YWkxSWXJiZCt6cklhcXFvbUxPdmtscUFnRmQycSs2UE43TWhaNk5PN3BR?=
 =?utf-8?B?QlJQaHVPTUt6N2grc0JQNmdRZDhQMTRhMkpsWHRlNUZDcmpZOG1UajIzSGlC?=
 =?utf-8?B?YldaNWhVTnJwR053bEhqT3pLdkE4OUJacmx2eGRCK3VhU0NDWWhaTHlEekZ0?=
 =?utf-8?B?aGZERTJORWgwRnNJQUhCWDhFNkZXMXBDOUJMWGNBT3h2SEpUcWgwbHkwd1Iv?=
 =?utf-8?B?Yk1PZ21YRTE3WndQbm42Ym5qYURtSjZtMDNvSjZ2MlA4OU41YmJmS0hvNms3?=
 =?utf-8?B?cEtKT3VLbHFtVFVCNEJ5SGIySEFsRVBaaUtWZnRIcENYVk1vK2xUYkpyOWpH?=
 =?utf-8?B?VWJxai8rT2tzSzAxZHRYK0prbmx0TTRBSmpxQzFWRTl2VGsrenhZM2dZbFB4?=
 =?utf-8?B?UlFUL1ZvcUU4aVdqSVN2Ynl5d0hiWFMrNGFwaUJGeGdMc013aENKMUYxWFNT?=
 =?utf-8?B?b0owU2k0WlRZVnIvSm1SZmJCblg3STRSa2M4QURudUxOdEZ4RWg4bGE3c1pT?=
 =?utf-8?B?SFNFYXo2SzNtaU1oUFN5WlJGNVgwQTAxcnFydnNmOUxOUFRqbzVtQyt3Tm1j?=
 =?utf-8?B?dWJFUVVzVU1WU1NDaXRjUU10YThzTXIvWGNtRk43OUh3WUt4cHo3Yys3WE1D?=
 =?utf-8?B?YzlKNmFFM1NGcnprM3ByeGNhSWZITkFvbjA5Q0RtRDkxblljZGxBWEZsY2Zz?=
 =?utf-8?B?SXY4RE9qSHcveW9YWW0wVHFEMHdmUzBhelZwSzVubldkelFzbTU5K1N4SC9N?=
 =?utf-8?B?Z016QkgwWG9lbnB2NmFySDk2c012TVBzNlNaUndDTjJxVU9KUk5tNWxhRFAz?=
 =?utf-8?B?UUNWSXFjaU8xdXVqOEhtK2pzNkFZOG1rWStZZmFUaFBrdlY3YmNyQ3ZJZ3Zi?=
 =?utf-8?B?dW12bDFRK0NZdHdac2Z3ekdHS1dUNjZUcHhSNFR5bGk4SmZiTW5VMEdCZlNI?=
 =?utf-8?B?NDVaOEduSXVKUU56UGhLeXcrV2JUNXJDd1RNd0ZzNjduTDNMNDdwVDdxUk1Y?=
 =?utf-8?B?VDdPTy9PaXFYbXIwNTV3dG1aZmRNSHpoSUl1TUVDMDVtczFZL2l0UDFBTjg0?=
 =?utf-8?B?anpRMzFmSHMzNVl2UVpNMkVLeGE3b25UUElYRE9pdVgweCtKRWwyOHBlMFBs?=
 =?utf-8?B?d0JRSmRBQjc1SW5vYitHaFVYWGVxc3hIMmwyeEE3aVRGQlNKOWhlZDVsWENF?=
 =?utf-8?B?YTdIWnFDUnNFcWFwUlRzWkFLVzZkamdoWWMrdCtwWGxEbXpxbzlnanJkUWFQ?=
 =?utf-8?B?a0VIeDgwUGdlMUdGRUdBaGtQNGJxajNoeWp1UFgxWVpCRjVjMmIrSXpJeEdU?=
 =?utf-8?B?T0xLMXJRQzBNWStFajZyVzh0WjROblliSkhMUWE3dTEvdlp3VWVDRjRvbDVt?=
 =?utf-8?B?UnlRendIQjdhS3JVSktOQmY3ZFJWZVlXSmxudENXbVJlend1eXFjY0sxRlBy?=
 =?utf-8?Q?zl4gyZPRMeIuDgOjww5Ql5w=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba58cee-d6d1-42d3-bfe6-08dbbdff2b00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 19:39:44.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJaaELHpCp4zVsZmdmH2/PZHKOimICGJWlnaGC8iusGzJwcWnhLyEqcO4V4QiMzatIxEUe01RG5X0iCJ4xWXDhddRF9rQrtDVexUc1i/euM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7357
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/25/2023 5:54 AM, Serge Semin wrote:
> On Wed, Sep 20, 2023 at 12:14:17PM -0700, Jan Bottorff wrote:
>> On 9/20/2023 6:27 AM, Yann Sionneau wrote:
>>> Hi,
>>>
>>> On 20/09/2023 11:08, Wolfram Sang wrote:
>>>>> same thread." [1] Thus I'd suggest the next fix for the problem:
>>>>>
>>>>> --- a/drivers/i2c/busses/i2c-designware-common.c
>>>>> +++ b/drivers/i2c/busses/i2c-designware-common.c
>>>>> @@ -72,7 +72,10 @@ static int dw_reg_write(void *context,
>>>>> unsigned int reg, unsigned int val)
>>>>>    {
>>>>>        struct dw_i2c_dev *dev = context;
>>>>> -    writel_relaxed(val, dev->base + reg);
>>>>> +    if (reg == DW_IC_INTR_MASK)
>>>>> +        writel(val, dev->base + reg);
>>>>> +    else
>>>>> +        writel_relaxed(val, dev->base + reg);
>>>>>        return 0;
>>>>>    }
>>>>>
>>>>> (and similar changes for dw_reg_write_swab() and dw_reg_write_word().)
>>>>>
>>>>> What do you think?
>>>> To me, this looks reasonable and much more what I would have expected as
>>>> a result (from a high level point of view). Let's hope it works. I am
>>>> optimistic, though...
>>>>
>>> It works if we make sure all the other register accesses to the
>>> designware i2c IP can't generate IRQ.
>>>
>>> Meaning that all register accesses that can trigger an IRQ are enclosed
>>> in between a call to i2c_dw_disable_int() and a call to
>>> regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK); or
>>> equivalent.
>>>
>>> It seems to be the case, I'm not sure what's the best way to make sure
>>> it will stay that way.
>>>
>>> Moreover, maybe writes to IC_ENABLE register should also use the
>>> non-relaxed writel() version?
>>>
>>> Since one could do something like:
>>>
>>> [ IP is currently disabled ]
>>>
>>> 1/ enable interrupts in DW_IC_INTR_MASK
>>>
>>> 2/ update some variable in dev-> structure in DDR
>>>
>>> 3/ enable the device by writing to IC_ENABLE, thus triggering for
>>> instance the TX_FIFO_EMPTY irq.
>>>
>>
>> It does seem like there are a variety of register write combinations that
>> could immediately cause an interrupt, so would need a barrier.
> 
> My suggestion was based on your fix. If it won't work or if it won't
> completely solve the problem, then perhaps one of the next option
> shall do it:
> 1. Add the non-relaxed IO call for the IC_ENABLE CSR too.
> 2. Completely convert the IO accessors to using the non-relaxed
> methods especially seeing Wolfram already noted: "Again, I am all with
> Catalin here. Safety first, optimizations a la *_relaxed should be
> opt-in."
> https://lore.kernel.org/linux-i2c/ZQm2Ydt%2F0jRW4crK@shikoro/
> 3. Find all the places where the memory writes need to be fully
> visible after a subsequent IO-write causing an IRQ raise and just
> place dma_wmb() there (though just wmb() would look a bit more
> relevant).
> 
> IMO in the worst case solution 2. must be enough at least in the
> master mode seeing the ISR uses the completion variable to indicate
> the cmd execution completion, which also implies the complete memory
> barrier. Moreover i2c bus isn't that performant for us to be that much
> concerned about the optimizations like the pipeline stalls in between
> the MMIO accesses.
> 

I did stress testing for a few days on our processor of the proposed fix 
that makes writes to DW_IC_INTR_MASK use writel instead of 
writel_relaxed in dw_reg_write. The problem we were seeing is fixed. On 
our system, the problem was occurring when many ssif (ipmi over i2c) 
transfers were done. The stress test was running "ipmitool sdr elist" in 
a loop. Without the change, multiple errors per day from the driver are 
seen in the kernel log.

I'm good with a change that just has that one change. Also applying 
non-relaxed to dw_reg_write_swab and dw_reg_write_word was also 
suggested for completeness.

Does anybody have concerns about other cases that may not get fixed by 
this change? We did have hypothetical cases, like with IC_ENABLE, that 
could have the same issue.

So my next question, is the change to dw_reg_write something that I 
should write and submit, or should someone else submit something more 
generalized, like option 2 above? I don't own the i2c driver, I'm just 
trying to fix one issue on one processor with minimal risk of breaking 
something. I don't have the broader view of what's optimal for the whole 
DesignWare i2c driver. I also don't have any way to test changes on 
other models of processors.




