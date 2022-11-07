Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E6161FC86
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 19:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiKGSC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 13:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbiKGSCI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 13:02:08 -0500
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF9BF2717F;
        Mon,  7 Nov 2022 09:58:20 -0800 (PST)
Received: from [192.168.4.25] (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 2B29F3047B;
        Mon,  7 Nov 2022 18:58:18 +0100 (CET)
Message-ID: <d1b241b3-73ca-5069-2542-1b44c6e37d7f@gpxsee.org>
Date:   Mon, 7 Nov 2022 18:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/2] Added Digiteq Automotive MGB4 driver
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
 <20221018140338.7080-3-tumic@gpxsee.org>
 <4ec93bdd-8b3d-2e3c-a7d7-7f3cd12520e7@xs4all.nl>
 <8023f2f5-638d-e83f-ea27-d135202725f3@gpxsee.org>
 <66518e88-5193-cf21-f2b9-869ee6a1024f@xs4all.nl>
 <47e66164-9a41-997d-70eb-59f2650235d6@gpxsee.org>
 <588804b7-d275-ddbe-0ad0-f8d59ecff18a@xs4all.nl>
From:   =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
In-Reply-To: <588804b7-d275-ddbe-0ad0-f8d59ecff18a@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07. 11. 22 13:44, Hans Verkuil wrote:
>>>>>
>>>>> Same as for input: opening a video device appears to have a side-effect.
>>>>>
>>>>
>>>> The same reason as in the input case. You can have different displays with completely different video signals (even resolutions) connected to the output at any arbitrary time.
>>>
>>> It's similar to the input side: use the DV timings ioctls. Except there won't be a
>>> QUERY_DV_TIMINGS, since it is an output.
>>>
>>> But how do you know what the display supports? Is it using an EDID? In that case you
>>> need to support VIDIOC_G_EDID as well, and probably some of the DV controls:
>>>
>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/ext-ctrls-dv.html
>>>
>>
>> There is no EDID or another type of autoconfiguration. In the cars, there is simply always the right display connected to the radio (infotainment system) and the values are hardcoded on both sides.
>>
>> In the mgb4 card (that must support arbitrary size displays) we solve this by the sysfs configuration - see the "Common FPDL3/GMSL output parameters" in the documentation. You set the display
>> properties in sysfs (usualy using some udev rules at boot time) and the v4l2 part of the driver then uses this values.
> 
> So for output at least the values do not 'just' change, it is something that is configured
> via sysfs. So the driver knows when this happens, and G_DV_TIMINGS would just return that
> configuration. You can choose (if it would make sense) to support S_DV_TIMINGS to set the
> configuration instead of sysfs, but I don't know if that would be sufficient or if it
> even makes sense.
> 
> Changing timings when someone is streaming is also something you need to think about:
> you can either refuse changing timings (return EBUSY), or accepts it, but then the
> driver has to call vb2_queue_error() and raise the V4L2_EVENT_SOURCE_CHANGE event to
> signal that the format changed and userspace has to take action.
> 

Yes, the output case is simpler as the source of the events can be 
controlled.

Changing timings (or resolution) when someone is streaming is not 
allowed, there are checks in the sysfs properties code that do not allow 
the change (you get EBUSY when writing to sysfs when the device is open).

In general I want to let all the HW setup to happen in sysfs as there 
are a lot of properties that are not a standard part of v4l2 and I want 
the configuration to happen on a single place, not something in sysfs 
and something else in v4l2. Moreover, the properties must be set 
correctly to get a working input/output stream so those properties are 
not some "options" as usual in the v4l2 controls.

M.
