Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9D8211193
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 19:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732633AbgGARGC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 13:06:02 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8637 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbgGARGB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 13:06:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efcc26c0000>; Wed, 01 Jul 2020 10:05:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 01 Jul 2020 10:06:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 01 Jul 2020 10:06:01 -0700
Received: from [10.2.167.193] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 17:06:00 +0000
Subject: Re: [RFC PATCH v2 00/18] Support for Tegra video capture from
 external sensor
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <b3f63f3f-50b2-e818-2c59-8009c31a9825@xs4all.nl>
 <f5c84071-46ad-aa6f-0820-1813d4a907c9@nvidia.com>
 <a60d8f80-312d-fce3-61f5-328e7f2a7a64@xs4all.nl>
 <72ca3b09-7ca6-7421-4a9d-98326d1af087@nvidia.com>
 <e8a8a678-e9e8-e941-8dcb-0e747616ba59@nvidia.com>
 <a606ac84-e0bc-aa85-5799-eeeb544d130d@nvidia.com>
 <92f25457-f4e5-78ea-d453-2b5cf8f272e8@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <77888877-969f-6279-b6b3-b77c7c5e9fb8@nvidia.com>
Date:   Wed, 1 Jul 2020 10:07:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <92f25457-f4e5-78ea-d453-2b5cf8f272e8@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593623148; bh=6t042SSwiTMkHkAYRX6tXLKdJDNCAX4qvSTvGAK8T/g=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=BBhu8NOZMj5MgK00nlxC05bRbLYUqau521GrP50sC7IoR3+67pCSgjjiVL59M0PFi
         F4ZBuMAoNj39LQEJaCndrPjrL6+9avfiy7vsMF7VUb61ou2UVv3MaSoN6w/pELKdUn
         0fItlFT+0JoOvbkPfC7WTOMp29gluGjn3KwadL/TRtVL+ihrbEr0yOItzPw0jlK386
         FMRm3SpJBS58QIyfqJWPDu/QSXUFWe7q8O7auc1cWaF88ecNyxh/32QfMOjlMZXItR
         ksymi8t/Yrexyzg96sIuQHG5jv6rh8i8/PwzUYNn+pJyuo6ekgDTbOCaKjJL4a22ZH
         48ecPki/y4nQw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/1/20 9:54 AM, Hans Verkuil wrote:
> On 30/06/2020 18:34, Sowjanya Komatineni wrote:
>> On 6/30/20 9:17 AM, Sowjanya Komatineni wrote:
>>> On 6/30/20 8:44 AM, Sowjanya Komatineni wrote:
>>>> On 6/30/20 8:13 AM, Hans Verkuil wrote:
>>>>> On 30/06/2020 16:58, Sowjanya Komatineni wrote:
>>>>>> On 6/30/20 2:21 AM, Hans Verkuil wrote:
>>>>>>> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>>>>>>>> This series adds support for video capture from external camera
>>>>>>>> sensor to
>>>>>>>> Tegra video driver.
>>>>>>>>
>>>>>>>> Jetson TX1 has camera expansion connector and supports custom
>>>>>>>> camera module
>>>>>>>> designed as per TX1 design specification.
>>>>>>>>
>>>>>>>> This series also enables camera capture support for Jetson Nano
>>>>>>>> which has
>>>>>>>> Raspberry PI camera header.
>>>>>>>>
>>>>>>>> This series is tested with IMX219 camera sensor.
>>>>>>> Which tree did you base this on? The media_tree master? Or the
>>>>>>> mainline kernel?
>>>>>> These patches are with linux-next base at the time I sent them out
>>>>>> which
>>>>>> are on 20200616
>>>>>>> I now have the imx219 detected, but if I try to stream I get this:
>>>>>>>
>>>>>>> $ v4l2-ctl --stream-mmap
>>>>>>> <[=C2=A0 512.840944] video4linux video0: MW_ACK_DONE syncpt timeout=
: -11
>>>>>>> [=C2=A0 512.972975] video4linux video0: frame start syncpt timeout:=
 -11
>>>>>>> <VIDIOC_DQBUF: failed: Input/output error
>>>>>>> [=C2=A0 513.180770] video4linux video0: MW_ACK_DONE syncpt timeout:=
 -11
>>>>>>>
>>>>>>> And then everything hangs and I need to reset.
>>>>>>>
>>>>>>> I'm testing with the media_tree master with your patches on top.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0Hans
>>>>>> Are you using same device tree as I sent offline? It uses CSI A for
>>>>>> IMX219.
>>>>>>
>>>>>> Does you setup also uses CSI-A as x2 for IMX219?
>>>>>>
>>>>>> I tested them on Jetson Nano + IMX219 rasp PI module and also on
>>>>>> Jetson
>>>>>> TX1 + IMX274.
>>>>>>
>>>>>> I did not see any issue and am able to capture from both.
>>>>>>
>>>>>> Will try again on my side with today's latest linux-next and update
>>>>>> result.
>>>>> Please use the media_tree master, that's what I use as well.
>>>>>
>>>>> I did some more testing and there is something weird going on.
>>>>>
>>>>> I have a Leopard Imaging camera expansion board (LI-JTX1-MIPI-ADPT)
>>>>> with
>>>>> three camera connectors. See here for the datasheet:
>>>>>
>>>>> https://www.leopardimaging.com/uploads/LI-TX1-KIT-IMX274M12-T_datashe=
et.pdf
>>>>>
>>>>>
>>>>> The first connector (with an IMX274) causes this error:
>>>>>
>>>>> $ v4l2-ctl -d1 --stream-mmap
>>>>> [=C2=A0 599.265885] video4linux video1: MW_ACK_DONE syncpt timeout: -=
11
>>>>> [=C2=A0 599.473883] video4linux video1: MW_ACK_DONE syncpt timeout: -=
11
>>>>> [=C2=A0 599.681904] video4linux video1: frame start syncpt timeout: -=
11
>>>>> [=C2=A0 599.681909] video4linux video1: MW_ACK_DONE syncpt timeout: -=
11
>>>>> <VIDIOC_DQBUF: failed: Input/output error
>>>>> [=C2=A0 599.897884] video4linux video1: MW_ACK_DONE syncpt timeout: -=
11
>>>>>
>>>>> Similar to the test above where I had an IMX219 connected. Except it
>>>>> didn't
>>>>> hang with the IMX274 (I'm beginning to suspect a locking issue in
>>>>> the imx219
>>>>> driver that is causing the hang, I'll look at that tomorrow).
>>>>>
>>>>> If I connect the IMX219 to the middle camera connector, then it
>>>>> works fine.
>>>>> I think I tested this with the IMX274 as well, but I'm not 100%
>>>>> certain, also
>>>>> something to double check tomorrow.
>>>>>
>>>>> If I connect the IMX219 or IMX274 to the third camera connector,
>>>>> then I get this:
>>>> Would like to know CSI port mapping to connectors as mipi calibrate
>>>> pads cells need to be updated in device tree based on CSI port in use.
>>>>
>>>> Will see if I can find that from DS link you sent above.
>>>>
>>>>> $ v4l2-ctl -d0 --stream-mmap
>>>>> [=C2=A0 820.513866] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>>
>>>>> [=C2=A0 820.525354] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>>
>>>>> [=C2=A0 820.536780] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>>
>>>>> [=C2=A0 820.548222] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>>
>>>>> [=C2=A0 820.559639] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> <[=C2=A0 820.646931] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 820.658355] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 820.669797] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 820.681216] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 820.692601] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> <<<<<<<<<<<<<<< 14.50 fps
>>>>> <<<<<<<<<<<<<<< 14.75 fps
>>>>> <<<<<<<<<<<<<<< 14.73 fps
>>>>> <<<<<<<<<<<<<<< 14.80 fps
>>>>> <<<<<<<<<<<<<[ 825.517854] tegra_mc_irq: 133437 callbacks suppressed
>>>>> [=C2=A0 825.517874] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.534395] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.545833] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.557280] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.579346] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.590764] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.602188] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.613649] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.625075] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> [=C2=A0 825.645983] tegra-mc 70019000.memory-controller: viw: write
>>>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>>> < 14.64 fps
>>>>> <<<<<<<<<<<<<<<< 14.87 fps
>>>>> <<<<<<<<<<<<<<< 14.89 fps
>>>>>
>>>>> Something is producing EMEM address decode errors. But it is streamin=
g.
>>>> above memory controller errors may be due to access faults and not
>>>> sure why these show up on your setup. I never have these with my
>>>> testing.
>>>>
>>>> Also I am using CMA alloc of 256MB and not sure if low CMA alloc size
>>>> is causing this. Can you try with CMA alloc size of 256MB?
>>>>
>>>>> If I enable the TPG then everything is fine.
>>>>>
>>>>> So I have currently three different behaviors for three camera
>>>>> connectors.
>>>>>
>>>>> Do you have a datasheet for your Jetson TX1 camera board? It could
>>>>> be useful
>>>>> to compare the two.
>>>> Yeah we have and will send it offline.
>>>>
>>>> Also based on connector mapping to corresponding CSI port,
>>>> mipi-calibrate pad cell value also need to be changed.
>>>>
>>>> Below is for CSI-A
>>>>
>>>> nvidia,mipi-calibrate =3D <&mipi 0x001>
>>>>> Regards,
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0Hans
>>> Connector-1 is CSI-AB where you had timeouts.
>>>
>>> Connector-2 is CSI-CD and this works for you.
>>>
>>> Connector-3 is CSI-EF and this works for streaming from above but
>>> there's memory access fault errors (EMEM address decode errors)
>>>
>>> These EMEM decode errors are not related to connector but its just
>>> they showed up during connector-3 testing I believe. Can you also keep
>>> CMA size to 256MB and try?
>>>
>>> Not sure if CSI-AB issue with FS and MW_ACK sp timeouts are due to
>>> some HW/setup issue. Streaming should work on CSI-AB ports as well
>>> just like CSI-CD/EF with proper device tree change for port index and
>>> mipi calibrate cells for corresponding ports.
>>>
>>> On my setup that I tested IMX274 is on CSI-AB.
>>>
>>> Will update my side test results with today's linux-next
>> Hans,
>>
>> We have this module as well. Will try to get this today for testing and
>> will update just to make sure of this combo as well on my side.
> Sowjanya,
>
> A quick update: I had to update my u-boot and I ended up reinstalling eve=
rything.
>
> And now the problems I described just disappeared. Very strange.
>
> I have yet to verify if the issue with the third camera connector is also=
 solved,
> I'll do that tomorrow.
>
> But for now you don't have to take any action.
>
> Regards,
>
> 	Hans
OK. Thanks Hans.
