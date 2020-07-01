Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D394211151
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 18:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732475AbgGAQy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 12:54:56 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:48503 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732563AbgGAQy4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 12:54:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qg0Vji9RJ40yDqg0YjcTtf; Wed, 01 Jul 2020 18:54:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593622492; bh=3JheUqnQKh25pAgfWhVQE5bBDzkbNv25CYMJniBVjoA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ffQq/SEyUNIbpPjIxzOGXKWO8+h9NMOUQp/CKdc+xiEQxkcemzVzUW6cQsmZCZrDR
         pDtvt3KxYnu9JLvX60hVHEWACk059HlbBugZcjjWo8cYmkb3AW0FM1jC+et87qmLIL
         GiVK7fDDq1EVdGvc+mEV3wy5svSnUhwddR2kEu5niAUHlrrxlmaHLIgGY8KIfDapwa
         LaHf2Rcl01PsYSRBwtSqdTrlJnENctkK1VZMWyvB/4iVPfXc4zEFa3eXeQJe6xLU/8
         V+Q8Cgj81B14ubmLGuEpQkQMLjYGnLDi1yx0yoJEvhRgAwjAWptITMemJMwCHyILpy
         unE47uKy2o/DA==
Subject: Re: [RFC PATCH v2 00/18] Support for Tegra video capture from
 external sensor
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <b3f63f3f-50b2-e818-2c59-8009c31a9825@xs4all.nl>
 <f5c84071-46ad-aa6f-0820-1813d4a907c9@nvidia.com>
 <a60d8f80-312d-fce3-61f5-328e7f2a7a64@xs4all.nl>
 <72ca3b09-7ca6-7421-4a9d-98326d1af087@nvidia.com>
 <e8a8a678-e9e8-e941-8dcb-0e747616ba59@nvidia.com>
 <a606ac84-e0bc-aa85-5799-eeeb544d130d@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <92f25457-f4e5-78ea-d453-2b5cf8f272e8@xs4all.nl>
Date:   Wed, 1 Jul 2020 18:54:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <a606ac84-e0bc-aa85-5799-eeeb544d130d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPvLGuP4WB3X1eOKFzM4vKUcvprLLd9B95q67ByWk9PLr/06/kcnKA6M4hL1C6yGiisCH9W93rJw63mxQVmkiEeV6lmNeD7xQP+hIBUAhXEzQmWwq90L
 AaOiEOnrHUFQoaXTMIQlHmH9ymDlQOzw78NWHkhHS0yu3FO+FCiFh0VVMWds8/Y13bM/tn/7OPiVgJ68epKIyPfplerOoyBVqGgt3UihDtKRrgBTJSOmQe1S
 a/X0Q2u8XcsmNDQ0ZZb2djQeVB/5vxC6ctTcWH5DL4L5g5Y+sw7RxcifWgTAaJI35sGBM6VCK6BUxXL8JH0AdNAVezhvUPJ9fvAqfWXTllfZKm6iofq3CppS
 Jbiv7+N1GLBzFSUZSfEtgSIyP4AI4X8Hbhi4qnihJbL+IK5gx27Jk/uqXuxKebUEMJVq8bln8JJkoGTnRJ9T5qQS3btwZUzNpLuxuhiFPkiO33kWbPozeXJ3
 FWWiItfl6QnqF9oKu6w7pijTmw+AUT8GqCVf576xxY/qwMi1jO1tKAstPYGHkvliFkmHXFf+xPL4qsJTpEBLDxRae+p0Uu5RKWSIm4ntlq0aWD2TJ0DV/11z
 p0p3C0mPzcC87Z+/Zug7+rbpJlHqZwcmrtOr9/ysWFCk0Js6dFbDGz4XPupqeNDaKt0i+Lbi2kKoPOIqE/dkdN7Q
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/06/2020 18:34, Sowjanya Komatineni wrote:
> 
> On 6/30/20 9:17 AM, Sowjanya Komatineni wrote:
>>
>> On 6/30/20 8:44 AM, Sowjanya Komatineni wrote:
>>>
>>> On 6/30/20 8:13 AM, Hans Verkuil wrote:
>>>> On 30/06/2020 16:58, Sowjanya Komatineni wrote:
>>>>> On 6/30/20 2:21 AM, Hans Verkuil wrote:
>>>>>> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>>>>>>> This series adds support for video capture from external camera 
>>>>>>> sensor to
>>>>>>> Tegra video driver.
>>>>>>>
>>>>>>> Jetson TX1 has camera expansion connector and supports custom 
>>>>>>> camera module
>>>>>>> designed as per TX1 design specification.
>>>>>>>
>>>>>>> This series also enables camera capture support for Jetson Nano 
>>>>>>> which has
>>>>>>> Raspberry PI camera header.
>>>>>>>
>>>>>>> This series is tested with IMX219 camera sensor.
>>>>>> Which tree did you base this on? The media_tree master? Or the 
>>>>>> mainline kernel?
>>>>> These patches are with linux-next base at the time I sent them out 
>>>>> which
>>>>> are on 20200616
>>>>>> I now have the imx219 detected, but if I try to stream I get this:
>>>>>>
>>>>>> $ v4l2-ctl --stream-mmap
>>>>>> <[  512.840944] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>>>>>> [  512.972975] video4linux video0: frame start syncpt timeout: -11
>>>>>> <VIDIOC_DQBUF: failed: Input/output error
>>>>>> [  513.180770] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>>>>>>
>>>>>> And then everything hangs and I need to reset.
>>>>>>
>>>>>> I'm testing with the media_tree master with your patches on top.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>>     Hans
>>>>> Are you using same device tree as I sent offline? It uses CSI A for 
>>>>> IMX219.
>>>>>
>>>>> Does you setup also uses CSI-A as x2 for IMX219?
>>>>>
>>>>> I tested them on Jetson Nano + IMX219 rasp PI module and also on 
>>>>> Jetson
>>>>> TX1 + IMX274.
>>>>>
>>>>> I did not see any issue and am able to capture from both.
>>>>>
>>>>> Will try again on my side with today's latest linux-next and update 
>>>>> result.
>>>> Please use the media_tree master, that's what I use as well.
>>>>
>>>> I did some more testing and there is something weird going on.
>>>>
>>>> I have a Leopard Imaging camera expansion board (LI-JTX1-MIPI-ADPT) 
>>>> with
>>>> three camera connectors. See here for the datasheet:
>>>>
>>>> https://www.leopardimaging.com/uploads/LI-TX1-KIT-IMX274M12-T_datasheet.pdf 
>>>>
>>>>
>>>> The first connector (with an IMX274) causes this error:
>>>>
>>>> $ v4l2-ctl -d1 --stream-mmap
>>>> [  599.265885] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>>> [  599.473883] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>>> [  599.681904] video4linux video1: frame start syncpt timeout: -11
>>>> [  599.681909] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>>> <VIDIOC_DQBUF: failed: Input/output error
>>>> [  599.897884] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>>>
>>>> Similar to the test above where I had an IMX219 connected. Except it 
>>>> didn't
>>>> hang with the IMX274 (I'm beginning to suspect a locking issue in 
>>>> the imx219
>>>> driver that is causing the hang, I'll look at that tomorrow).
>>>>
>>>> If I connect the IMX219 to the middle camera connector, then it 
>>>> works fine.
>>>> I think I tested this with the IMX274 as well, but I'm not 100% 
>>>> certain, also
>>>> something to double check tomorrow.
>>>>
>>>> If I connect the IMX219 or IMX274 to the third camera connector, 
>>>> then I get this:
>>>
>>> Would like to know CSI port mapping to connectors as mipi calibrate 
>>> pads cells need to be updated in device tree based on CSI port in use.
>>>
>>> Will see if I can find that from DS link you sent above.
>>>
>>>>
>>>> $ v4l2-ctl -d0 --stream-mmap
>>>> [  820.513866] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>
>>>> [  820.525354] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>
>>>> [  820.536780] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>
>>>> [  820.548222] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>
>>>> [  820.559639] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> <[  820.646931] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  820.658355] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  820.669797] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  820.681216] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  820.692601] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> <<<<<<<<<<<<<<< 14.50 fps
>>>> <<<<<<<<<<<<<<< 14.75 fps
>>>> <<<<<<<<<<<<<<< 14.73 fps
>>>> <<<<<<<<<<<<<<< 14.80 fps
>>>> <<<<<<<<<<<<<[ 825.517854] tegra_mc_irq: 133437 callbacks suppressed
>>>> [  825.517874] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.534395] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.545833] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.557280] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.579346] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.590764] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.602188] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.613649] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.625075] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> [  825.645983] tegra-mc 70019000.memory-controller: viw: write 
>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>> < 14.64 fps
>>>> <<<<<<<<<<<<<<<< 14.87 fps
>>>> <<<<<<<<<<<<<<< 14.89 fps
>>>>
>>>> Something is producing EMEM address decode errors. But it is streaming.
>>>
>>> above memory controller errors may be due to access faults and not 
>>> sure why these show up on your setup. I never have these with my 
>>> testing.
>>>
>>> Also I am using CMA alloc of 256MB and not sure if low CMA alloc size 
>>> is causing this. Can you try with CMA alloc size of 256MB?
>>>
>>>>
>>>> If I enable the TPG then everything is fine.
>>>>
>>>> So I have currently three different behaviors for three camera 
>>>> connectors.
>>>>
>>>> Do you have a datasheet for your Jetson TX1 camera board? It could 
>>>> be useful
>>>> to compare the two.
>>>
>>> Yeah we have and will send it offline.
>>>
>>> Also based on connector mapping to corresponding CSI port, 
>>> mipi-calibrate pad cell value also need to be changed.
>>>
>>> Below is for CSI-A
>>>
>>> nvidia,mipi-calibrate = <&mipi 0x001>
>>>> Regards,
>>>>
>>>>     Hans
>> Connector-1 is CSI-AB where you had timeouts.
>>
>> Connector-2 is CSI-CD and this works for you.
>>
>> Connector-3 is CSI-EF and this works for streaming from above but 
>> there's memory access fault errors (EMEM address decode errors)
>>
>> These EMEM decode errors are not related to connector but its just 
>> they showed up during connector-3 testing I believe. Can you also keep 
>> CMA size to 256MB and try?
>>
>> Not sure if CSI-AB issue with FS and MW_ACK sp timeouts are due to 
>> some HW/setup issue. Streaming should work on CSI-AB ports as well 
>> just like CSI-CD/EF with proper device tree change for port index and 
>> mipi calibrate cells for corresponding ports.
>>
>> On my setup that I tested IMX274 is on CSI-AB.
>>
>> Will update my side test results with today's linux-next
> 
> Hans,
> 
> We have this module as well. Will try to get this today for testing and 
> will update just to make sure of this combo as well on my side.

Sowjanya,

A quick update: I had to update my u-boot and I ended up reinstalling everything.

And now the problems I described just disappeared. Very strange.

I have yet to verify if the issue with the third camera connector is also solved,
I'll do that tomorrow.

But for now you don't have to take any action.

Regards,

	Hans
