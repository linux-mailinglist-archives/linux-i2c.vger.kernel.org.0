Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221DD527257
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 17:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbiENPCk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 11:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiENPCk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 11:02:40 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2138.outbound.protection.outlook.com [40.107.20.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DEBC18;
        Sat, 14 May 2022 08:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4SyRIeWFLQF/LfGZiE3/Co6F/O2e9OksQG68DgXS2oSNwGIZo/Yt/i2vpXA//mAXEGQMtyyT475j2XBX3B+HiHmyCFt7VxR9C6Dsp1pGCYCctDmUnQWHFMFjR/iEhHn+oA7wNv8VtTPV0uzQjMxXpPMb8Dq6pTi01uvIsmJN9NNl44lXOIL0xzXEdjIoh+o+/8RnswWn624CNAXVbxUnoHxnLwe4Yuv0veOSgDCSKO3sBrntwFjTnOKGH5YnRfx++0Bj0yFQ2P6kx4Ky8MHBMx4Ha0dKzPlEvNCCjIFeYYUaGfC0zZOAzvsfquUWbNpeOMOmp2zuPfnPzxYlkDG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLPOsi9X0W0yDkgHNElpkCs74mcPyOQHjMpWqP4lDPY=;
 b=nX5PCwukEH69xzzl51Pf2yaelw+UGTaLHaBejLzEUdbl280wXqWaT2TBhko5PZGSSYJW4uCDw2PYHyCQyoP171Pg2plCsYkElR+04csgew7/XX3Byj0b1TkeH8tJHXxLZf236ssZ1OGO9nxTMJy0MVEM+NNWDSvYvNQzQFtaa5nphHs20if2Pgwg78wk6IegRcu0Xnn8YB9UIuORITiTOYqNar97/mLJJNS9WjO5FV3qHYaS48tNKFZX6MydHU4QlWTW55l7Wlo4eLc4siVfwSa8POngWWU71ZMaxaXpnCv+wx/rJAOfTe+zgenzKE2HWyxXDqpqbe7uUU/68kMYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLPOsi9X0W0yDkgHNElpkCs74mcPyOQHjMpWqP4lDPY=;
 b=H0EPfhikrk69hVHUK/8AI8Zr75Q9kgg9tk1WSAYXba5gp1rkj5HzJHTPUe8j2/semDdQnSJB7V3Ds8b8/ovVqesKslOQWG2ZMM/EZTwNOxTVjefqWeBxqWBbrCNxkGV2p2G5IOLFso1wZ60qnU2dqukeQqMuL7oIVm95mC8hnE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR0201MB2269.eurprd02.prod.outlook.com (2603:10a6:800:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Sat, 14 May
 2022 15:02:34 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a%4]) with mapi id 15.20.5250.015; Sat, 14 May 2022
 15:02:34 +0000
Message-ID: <0569bb70-e2dc-de85-268d-30ee7c9491fb@axentia.se>
Date:   Sat, 14 May 2022 17:02:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/2] iio: humidity: si7020: Check device property for
 skipping reset in probe
Content-Language: sv
To:     Jonathan Cameron <jic23@kernel.org>, devicetree@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Eddie James <eajames@linux.ibm.com>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, lars@metafoo.de, miltonm@us.ibm.com,
        linux-i2c@vger.kernel.org
References: <20220512162020.33450-1-eajames@linux.ibm.com>
 <20220512174859.000042b6@Huawei.com>
 <4fd44316-689e-1b72-d483-2c617d2a455d@linux.ibm.com>
 <20220513174531.00007b9b@Huawei.com>
 <b2761479-50fe-0dce-62a2-3beff5cdef9d@axentia.se>
 <20220514144318.309be1ec@jic23-huawei>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220514144318.309be1ec@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0035.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::9)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 675c3af1-5691-449b-afc6-08da35bac672
X-MS-TrafficTypeDiagnostic: VI1PR0201MB2269:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0201MB2269DEF84DE3FE05296B1FE4BCCD9@VI1PR0201MB2269.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hETpMS+cfhB0k7r8ifZhlg6uwAgGT2hOiHzb+ILTrT4Y/MuoknrAshAznJBkWPjCOzcYGjilOWfk7YZ5YjSaGnmARfkVU9TWO9OqA0C1hJrov74eAGeECxN2gzJJta390mAhYZME9kvmhYAO08AVn3l1v0TWX9WyOE769hWgPWstgPbYGMB9E6RTDn/2Stc7uwJJik2/QxnW1e409BLE2SSYRzbZk+VS+QOMHvQM5DBbq6BLXj9J71vmHTzbyqTui2i0biNK5/OHP1HHMzH3WWFd8EhdgMgbBHGKU3+NOO7JEEAn7SQ4L8cdQgEUegJfrV80aDDNSKqi+TUYn7b121eYwcsHpmEZhBW+cE/lXCdKyeAERUfAbAyekl/6raZXZb32NlJ/cpqQvy6zOVd06kULVzroLXpT1l6f56g3mRcdisAA6gStQ8cy4cCsPMjRuQ9atgaS0rRDEwH67V4Q+T0800l9QT3JKZ30bqaJePP580chvkkesnG57VvQeRePkdZqPsC9R+aOFzxsGdOyFw0KwwUeEKtD7bQq1U67IHHpO9MqIR5cXpPHUjsf2FznqNMaVBtbjx22eQidXf1eGUEbIwDs0YtxmRUcwmBd5x1Qu/8KTUD3Kfkg6IcIXzBv04O/TO6RT8/N2rhQ7iyLOnyq9vV+Np4/5UJKYdKHmufV+jTbZO60b6jCAthPRRDG6f0ZtrfCf4IxshtWDQg4zps3iM+nakCYuRNZXIlofP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(376002)(39830400003)(396003)(346002)(366004)(136003)(31686004)(86362001)(31696002)(38100700002)(7416002)(5660300002)(8936002)(6486002)(2906002)(508600001)(316002)(54906003)(66476007)(4326008)(8676002)(66556008)(66946007)(83380400001)(6666004)(26005)(6506007)(53546011)(6512007)(2616005)(186003)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekNwUmxMMGo3bWg0N0tTcXFJSDlnTGYybmhYemxCSmVXM0s1SFpKQTVkbVNT?=
 =?utf-8?B?akg0bFNpYlRNMVpjSDhvNWVRQ2pDRjFzUmhsTWJrWHNpTGx4ZzRnWWdheXpB?=
 =?utf-8?B?c2dFVnBOY3RuaDB2Z2xNUHBsajhPWllJSlNVdlMvK1JSSERzWnc2UThoc29C?=
 =?utf-8?B?V0xVY2syRWhnYXQvbXk5TVRTckFZcjFOZldzbmtFbzByRXl3ODFBcUwzWldV?=
 =?utf-8?B?c1dhUjFmSFNvUWtSdGhCdmZsL015R3lrbVFURFhJT3B4OExtZENna1c1OXVF?=
 =?utf-8?B?bWQrQmFBOWxSVWtiRVdOWFh4eHR3ZXFlQUJjZTBwVkQ1MC9HZ2NuNnQ5NU1m?=
 =?utf-8?B?TEluc3M4Y3hPMUxzUHYvdVRLNFl2QTdGWlJ3WmEzUzVjTHpTZjgvdVR2a00y?=
 =?utf-8?B?NFAvemVJckZEWFl4T0IvYzdKTjE0OW9ybVNoZHE4dU0yRjlaQncrQmt6ai9n?=
 =?utf-8?B?WXN2NHlMRElXc0pBN2lZT3FJbURsc1VpSFhySnZlUFM2MWg5MDFsU3QyaVla?=
 =?utf-8?B?U2duc0tHamZjb3p2QmtOYVliWUQ1RWtIK2hqR2hxdUZzV1Uzd2Nsc1Z1SnhB?=
 =?utf-8?B?czdmY3Fibk1pSXN0RHh4YVlyUFhWODVBWEdwVTYrU0NDdGxwVjRSelRhT3BQ?=
 =?utf-8?B?V1pSaVRqYVRvOEQ1WHVXRzhoWkhUOC9JQ0NWTmNRS2xxMDNXR1lZaWc2UGFt?=
 =?utf-8?B?c3JBbFZ0WjFBbGlvZENlS1VvUVNxN1BXZWF5N0lMbTFHTkZHZHJhWmNBdnJk?=
 =?utf-8?B?QlZtZTlNMU1LNnF2T2pMSG5oaFFBS1Q2bG5XQnhMSmpIOENSbVIyVWM3M3RV?=
 =?utf-8?B?ZGpRbDZSMml5a2xSdUZmTCtCd2cxT3dodU5JWGtCRFJQRElyUy9DRTZqdnF5?=
 =?utf-8?B?TzliajBoak9xUVNCRlFkcGtHNUoydHo2R1FmTjlmZ3h3WGNDVkdpK0l2MVZT?=
 =?utf-8?B?aERTMkVnU2d0c1dRZXlCb3RDekVsWExPVkJLUmRVK1h1UkczY3FLQy9Pd2t0?=
 =?utf-8?B?TDhKcUFHWTN1OU9lTkdyVmV1QlZ3cUNndEZmOFdROGx6K3doSEVINDVqTGpl?=
 =?utf-8?B?UStCb29jNElxK0dWUVlpZ3lMQnYzT01mdUVYQlV4anpBRzdjK1VKSzFTcjAr?=
 =?utf-8?B?blhSV2NTMXh2RXMvQWxwRVp2M3RpbW5EK0svdTFVb1I2aktQUG9aSnlDbFda?=
 =?utf-8?B?eGZVaythSFk5ZjgxWlF2YlhPZ2d3Vnl3ZWVUSUtYeG9PMUoxK2NOT1ZQMENS?=
 =?utf-8?B?REV3dVgxaHkxNmNUeFZJa3BIVzYvVmF2YXI4ekhDbklsUnNBQTZKQUQzNGh0?=
 =?utf-8?B?dDZDN0lpa0FXVnRyK24zUEZadlUzKytDRUM0SFJObmczWDllOW50bUtUeS85?=
 =?utf-8?B?by9wM3BqWVhPRzZFSDRMcW8rckhiVmZFeStUM2NIcDA0Q1dIZko2SVVPN0l0?=
 =?utf-8?B?czllSDh3SDNDR1BORnEwN2d0K1lDZjlTekhua2tFd1hnSXJxVjJsNlQ4by9a?=
 =?utf-8?B?cEJ5UjcrTmJ4QzBEMGRHc1dKWldtVTRSRzByckRmUmllZkFjQnRIb0tFQUZV?=
 =?utf-8?B?TTE5aXkzYXpvZ2NWN0F4SlJSSU1hem1ud2lUeVhneUFlVE9pYmhINWNuaFVs?=
 =?utf-8?B?Y3RtN3NPNk5sZ1dLUXdhdktpTG5aWW1uN2gzbWgzeDhidUw5d2pOdFdER2lq?=
 =?utf-8?B?OG0reUNsbXAwU0FVSHpGRTVNbklqQjlhVkhCVmN3WlI3TW1odmpydlIwT0RB?=
 =?utf-8?B?dG5UK2V2YVJxeEhVS3FmVFNVOWJnT2dqWlZqcDNIbjZtcC9KUlJTUndUOGxB?=
 =?utf-8?B?ZE5iS0IrWElZSUhpMForNVpjSjM1Q2k1OFhpeWdqWVE2RWhQSnJYSlYvZkl4?=
 =?utf-8?B?VUFlQnloVklwZ1NsWDFNckpPa0luSkNRL3JqMHJlSjhLclU0dHgzOE5EWjFR?=
 =?utf-8?B?Yko4ZitqaXNyaGx0bVBoNXlhNzZ3dlVXdldqbWFxU1E3YVJ0K1VLTGtEcGJo?=
 =?utf-8?B?clVnalRuK0dWZm5ndy9sNVVLdXdsbERXc1dvNmY4L0UxWXRleEtyR2N3T05z?=
 =?utf-8?B?ZnRFOVVpWmVodklzVXJmVUJ1R3RaUU56eGx4ZGhWclRwN2p0L0Z1RGt2UHNN?=
 =?utf-8?B?ZFZNOWp0ZUFwY0pBa2RmZDI5aEIvbHo4c0ZZL1N4UmQzUTFWZWxXT1hibG1k?=
 =?utf-8?B?alo1eHFXUVZyQjVEWW1wVzhWclQyZWxSVVN2WWh6L2ZDOC9zeDR0cHF6U3Iy?=
 =?utf-8?B?UEYyZmRvU2dJMkRKQXVYOWRiSVU5RjdNOE9mVUxYUGg3RnNLY2NQNXMvR2FN?=
 =?utf-8?B?NUptT3dVd2Q2R24rbFBxa1VpQzRCcXpvSkQzcGJ6OUNpZS9BMWFtQT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 675c3af1-5691-449b-afc6-08da35bac672
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2022 15:02:34.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHFh+KBkWZRmPU9BGLI8xwROAjjYhLxijRXUvRDR5sBbtvykCQ4PUkVytmir5xZt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2269
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-05-14 at 15:43, Jonathan Cameron wrote:
> On Sat, 14 May 2022 00:48:51 +0200
> Peter Rosin <peda@axentia.se> wrote:
> 
>> Hi!
>>
>> 2022-05-13 at 18:45, Jonathan Cameron wrote:
>>> On Thu, 12 May 2022 12:08:07 -0500
>>> Eddie James <eajames@linux.ibm.com> wrote:
>>>   
>>>> On 5/12/22 11:48, Jonathan Cameron wrote:  
>>>>> On Thu, 12 May 2022 11:20:18 -0500
>>>>> Eddie James <eajames@linux.ibm.com> wrote:
>>>>>    
>>>>>> I2C commands issued after the SI7020 is starting up or after reset
>>>>>> can potentially upset the startup sequence. Therefore, the host
>>>>>> needs to wait for the startup sequence to finish before issuing
>>>>>> further i2c commands. This is impractical in cases where the SI7020
>>>>>> is on a shared bus or behind a mux, which may switch channels at
>>>>>> any time (generating I2C traffic). Therefore, check for a device
>>>>>> property that indicates that the driver should skip resetting the
>>>>>> device when probing.    
>>>>> Why not lock the bus?  It's not ideal, but then not resetting and hence
>>>>> potentially ending up in an unknown state isn't great either.    
>>>>
>>>>
>>>> Agreed, but locking the bus doesn't work in the case where the chip is 
>>>> behind a mux. The mux core driver deselects the mux immediately after 
>>>> the transfer to reset the si7020, causing some i2c traffic, breaking the 
>>>> si7020. So it would also be a requirement to configure the mux to idle 
>>>> as-is... That's why I went with the optional skipping of the reset. 
>>>> Maybe I should add the bus lock too?
>>>>  
>>>
>>> +Cc Peter and linux-i2c for advice as we should resolve any potential
>>> issue with the mux side of things rather than hiding it in the driver
>>> (if possible!)  
>>
>> IIUC, the chip in question cannot handle *any* action on the I2C bus
>> for 15ms (or so) after a "soft reset", or something bad<tm> happens
>> (or at least may happen).
>>
>> If that's the case, then providing a means of skipping the reset is
>> insufficient. If you don't lock the bus, you would need to *always*
>> skip the reset, because you don't know for certain if something else
>> does I2C xfers.
>>
>> So, in order to make the soft reset not be totally dangerous even in
>> a normal non-muxed environment, the bus must be locked for the 15ms.
>>
>> However, Eddie is correct in that the I2C mux code may indeed do its
>> muxing xfer right after the soft reset command. There is currently
>> no way to avoid that muxing xfer. However, it should be noted that
>> there are ways to mux an I2C bus without using xfers on the bus
>> itself, so it's not problematic for *all* mux variants.
>>
>> It can be debated if the problem should be worked around with extra
>> dt properties like this, or if a capability should be added to delay
>> a trailing muxing xfer.
>>
>> I bet there are other broken chips that have drivers that do in fact
>> lock the bus to give the chip a break, but then it all stumbles
>> because of the unexpected noise if there's a (wrong kind of) mux in
>> the mix.
> 
> Ok, so for now I think we need the bus lock for the reset + either
> a work around similar to this series, or additions to the i2c mux code
> to stop it doing a muxing xfer if the bus is locked?

I think there might be cases where it might be valid to restore the mux
directly after an xfer even if the mux is externally locked prior to the
muxed xfer. But I'm not sure? In any case, it will be a bit convoluted
for the mux code to remember that it might need to restore the mux
later. And it will get even hairier when multiple levels of muxing is
considered...

Maybe some kind of hook/callback that could be installed temporarily on
the I2C adapter that is called right after the "real" xfer, where the
driver could then make the needed mdelay call?

I.e.
1. lock the bus
2. install this new hook/callback
3. do an unlocked xfer, get notified and call mdelay
5. uninstall the hook/callback
6. unlock the bus

The hook/callback could be uninstalled automatically on unlock, then
you would not need to handle multiple notifications. But then again,
there is probably some existing framework that should be used that
handles all than neatly and efficiently.

Me waves hand a bit...

Cheers,
Peter
