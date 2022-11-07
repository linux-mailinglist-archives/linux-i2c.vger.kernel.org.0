Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F10F61F1FA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 12:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiKGLiw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 06:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbiKGLiv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 06:38:51 -0500
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2086117073;
        Mon,  7 Nov 2022 03:38:49 -0800 (PST)
Received: from [192.168.4.25] (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id D938730462;
        Mon,  7 Nov 2022 12:38:46 +0100 (CET)
Message-ID: <47e66164-9a41-997d-70eb-59f2650235d6@gpxsee.org>
Date:   Mon, 7 Nov 2022 12:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/2] Added Digiteq Automotive MGB4 driver
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
Content-Language: en-US
From:   =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
In-Reply-To: <66518e88-5193-cf21-f2b9-869ee6a1024f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07. 11. 22 10:11, Hans Verkuil wrote:

>>>
>>> Erm, what is CMT and where do the values in the tables below come from?
>>>
>>
>> The CMT table is used to set up some FPGA PLL related registers. For different video signal frequencies (FPGA input signal frequencies), the FPGA PLL stuff needs to be adjusted to work properly. The
>> values are precomputed based on some formulas given by Xilinx in their FPGA documentation and those formulas are in turn full of some magic values/tables. So the answer to your question is that no one
>> (not even our HW engineer writing the VHDL code...) really knows where these values exactly come from, but they have to be set for the FPGA to work properly with the given video signal.
> 
> OK, that will be good to document. And what does the abbreviation 'CMT' stand for?
> 

Clock Management Tile, it is commonly used in Xilinx's FPGA documentation

>>>
>>> I'm pretty certain that you didn't run 'checkpatch.pl --strict' over this patch.
>>> Please do so for v4!
>>>
>>
>> I have run 'checkpatch.pl' without '--strict' over this patch and ignored all the "too long lines" warnings on the tables as I think they are more clear this way, and all the "change name suggestion"
>> warnings as they are IMHO wrong in this case. Other warnings did not come up. I will try it with '--strict' when I post v4 patch.
> 
> Yes please, the media subsystem uses the --strict option.
> 

Ok.

>>>
>>> This doesn't look right. Just opening a video device shouldn't cause
>>> any state changes, and that's what it looks is happening here.
>>>
>>> I.e., if I just want to query the device (v4l2-ctl --all), then that
>>> shouldn't not change anything.
>>>
>>
>> The MGB4 card is quiet special in this case. Unlike in "normal" cameras, the video signal may change over time as the user can connect different video sources to the card. This is why I set up some
>> video signal related stuff in the open() call. When you open the device, you "configure" it for the current video signal and the signal is then expected not to change until the device is closed (such
>> change will not break the driver, but will break the image). Additionally, the open() call must fail, when there is no signal connected to the card.
>>
>> If you have some suggestions how to handle this "dynamic" behaviour in a different way (properly?) then I'm open to them. But the fact, that even the video resolution can change at any arbitrary time
>> will IMHO always lead to some "workarounds" like this one in the open() call.
> 
> This is not special. We support HDMI receivers today as well which have exactly the same behavior.
> 
> Typically the way this works is that such drivers support the Digital Video Timings ioctls
> (VIDIOC_ENUM_DV_TIMINGS, VIDIOC_DV_TIMINGS_CAP, VIDIOC_G/S/QUERY_DV_TIMINGS). The driver
> stores the current timings as set by userspace (and initialized to something at probe() time
> by the driver), but typically userspace will query the actual detected timings, then set them.
> 
> Next it will allocate buffers, which will fix the timings. E.g. an attempt to set new timings
> will fail with -EBUSY. If the hardware detects a format change, then it will raise the
> V4L2_EVENT_SOURCE_CHANGE event and call vb2_queue_error() to stop streaming.
> 
> Userspace detects that, stops streaming, frees buffers, and calls QUERY_DV_TIMINGS again to
> get the new timings.
> 
> Key here is that the timings are locked when you allocate buffers (vb2_is_busy() will return
> true at that time). Buffers are allocated based on the framesize, which is based on the timings,
> so if timings change, then buffers typically need to be reallocated.
> 
> Search for these ioctls to see how other drivers do this.
> 

Ok, I will look at those ioctls and try to implement this part using those.

>>>> +
>>>> +static int vidioc_queryctrl(struct file *file, void *priv,
>>>> +                struct v4l2_queryctrl *qc)
>>>> +{
>>>> +    return -EINVAL;
>>>> +}
>>>
>>> Huh? Why is this needed?
>>>
>>
>> I think this was required to "silence" some v4l2-compliance tool warnings/errors. I will recheck this.
> 
> If there are warnings/errors with the latest v4l2-compliance, then let me know.
> It would be a bug in the compliance tool.
>

I'm not sure what version of the v4l2-compliance tool I have used that 
time, but as I have Arch linux on the devel machine, I suppose it was 
quiet new. When I get warnings/errors after removing this callback with 
the 1.22.1 version, I will let you know.

>>>
>>> Same as for input: opening a video device appears to have a side-effect.
>>>
>>
>> The same reason as in the input case. You can have different displays with completely different video signals (even resolutions) connected to the output at any arbitrary time.
> 
> It's similar to the input side: use the DV timings ioctls. Except there won't be a
> QUERY_DV_TIMINGS, since it is an output.
> 
> But how do you know what the display supports? Is it using an EDID? In that case you
> need to support VIDIOC_G_EDID as well, and probably some of the DV controls:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/ext-ctrls-dv.html
> 

There is no EDID or another type of autoconfiguration. In the cars, 
there is simply always the right display connected to the radio 
(infotainment system) and the values are hardcoded on both sides.

In the mgb4 card (that must support arbitrary size displays) we solve 
this by the sysfs configuration - see the "Common FPDL3/GMSL output 
parameters" in the documentation. You set the display properties in 
sysfs (usualy using some udev rules at boot time) and the v4l2 part of 
the driver then uses this values.

M.

