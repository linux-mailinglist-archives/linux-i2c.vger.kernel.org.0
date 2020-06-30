Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD4720F98A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 18:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732642AbgF3QeO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 12:34:14 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2651 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgF3QeO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 12:34:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb69540000>; Tue, 30 Jun 2020 09:33:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 09:34:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 09:34:13 -0700
Received: from [10.2.167.193] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 16:34:12 +0000
Subject: Re: [RFC PATCH v2 00/18] Support for Tegra video capture from
 external sensor
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
Message-ID: <a606ac84-e0bc-aa85-5799-eeeb544d130d@nvidia.com>
Date:   Tue, 30 Jun 2020 09:34:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e8a8a678-e9e8-e941-8dcb-0e747616ba59@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593534804; bh=PWBaDihnXUkhqgEp7eQw5PvGQIG295oKjcUZ9voI88k=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=FPNBZp1isbBVgoD5K5uZbx5d+6WZN/KVsRyb16g6lwAYO+36o4GMb2wgDPLqfTF8K
         B49GPfBVf5HgHluBd8RmRSxPkztp1oNDj3C9nK3YSF9MfwZ+/mX9GRfYo5WVbboTEc
         JeQCuSpSmkgn5xwHgDFjB9Z1N3BGpBXjuY+WJpeHi6kGPAi7ymAoXCHJlKQ7s1cTN+
         PFEBtCqIZMZ0WcHs9DCe8alCrcK5DOT+kEzTSKduPA+tsvg9R6dGrn7XCni/h80IZ2
         DJzBL4T8zmlu4tA4VDk4eHVaSulbHp8T7z0FQibE6Jxk3v9mF4DsYfvaqogwhEY3TU
         uqUR0vQ4EwNXg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/30/20 9:17 AM, Sowjanya Komatineni wrote:
>
> On 6/30/20 8:44 AM, Sowjanya Komatineni wrote:
>>
>> On 6/30/20 8:13 AM, Hans Verkuil wrote:
>>> On 30/06/2020 16:58, Sowjanya Komatineni wrote:
>>>> On 6/30/20 2:21 AM, Hans Verkuil wrote:
>>>>> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>>>>>> This series adds support for video capture from external camera=20
>>>>>> sensor to
>>>>>> Tegra video driver.
>>>>>>
>>>>>> Jetson TX1 has camera expansion connector and supports custom=20
>>>>>> camera module
>>>>>> designed as per TX1 design specification.
>>>>>>
>>>>>> This series also enables camera capture support for Jetson Nano=20
>>>>>> which has
>>>>>> Raspberry PI camera header.
>>>>>>
>>>>>> This series is tested with IMX219 camera sensor.
>>>>> Which tree did you base this on? The media_tree master? Or the=20
>>>>> mainline kernel?
>>>> These patches are with linux-next base at the time I sent them out=20
>>>> which
>>>> are on 20200616
>>>>> I now have the imx219 detected, but if I try to stream I get this:
>>>>>
>>>>> $ v4l2-ctl --stream-mmap
>>>>> <[=C2=A0 512.840944] video4linux video0: MW_ACK_DONE syncpt timeout: =
-11
>>>>> [=C2=A0 512.972975] video4linux video0: frame start syncpt timeout: -=
11
>>>>> <VIDIOC_DQBUF: failed: Input/output error
>>>>> [=C2=A0 513.180770] video4linux video0: MW_ACK_DONE syncpt timeout: -=
11
>>>>>
>>>>> And then everything hangs and I need to reset.
>>>>>
>>>>> I'm testing with the media_tree master with your patches on top.
>>>>>
>>>>> Regards,
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
>>>> Are you using same device tree as I sent offline? It uses CSI A for=20
>>>> IMX219.
>>>>
>>>> Does you setup also uses CSI-A as x2 for IMX219?
>>>>
>>>> I tested them on Jetson Nano + IMX219 rasp PI module and also on=20
>>>> Jetson
>>>> TX1 + IMX274.
>>>>
>>>> I did not see any issue and am able to capture from both.
>>>>
>>>> Will try again on my side with today's latest linux-next and update=20
>>>> result.
>>> Please use the media_tree master, that's what I use as well.
>>>
>>> I did some more testing and there is something weird going on.
>>>
>>> I have a Leopard Imaging camera expansion board (LI-JTX1-MIPI-ADPT)=20
>>> with
>>> three camera connectors. See here for the datasheet:
>>>
>>> https://www.leopardimaging.com/uploads/LI-TX1-KIT-IMX274M12-T_datasheet=
.pdf=20
>>>
>>>
>>> The first connector (with an IMX274) causes this error:
>>>
>>> $ v4l2-ctl -d1 --stream-mmap
>>> [=C2=A0 599.265885] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>> [=C2=A0 599.473883] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>> [=C2=A0 599.681904] video4linux video1: frame start syncpt timeout: -11
>>> [=C2=A0 599.681909] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>> <VIDIOC_DQBUF: failed: Input/output error
>>> [=C2=A0 599.897884] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>>>
>>> Similar to the test above where I had an IMX219 connected. Except it=20
>>> didn't
>>> hang with the IMX274 (I'm beginning to suspect a locking issue in=20
>>> the imx219
>>> driver that is causing the hang, I'll look at that tomorrow).
>>>
>>> If I connect the IMX219 to the middle camera connector, then it=20
>>> works fine.
>>> I think I tested this with the IMX274 as well, but I'm not 100%=20
>>> certain, also
>>> something to double check tomorrow.
>>>
>>> If I connect the IMX219 or IMX274 to the third camera connector,=20
>>> then I get this:
>>
>> Would like to know CSI port mapping to connectors as mipi calibrate=20
>> pads cells need to be updated in device tree based on CSI port in use.
>>
>> Will see if I can find that from DS link you sent above.
>>
>>>
>>> $ v4l2-ctl -d0 --stream-mmap
>>> [=C2=A0 820.513866] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>
>>> [=C2=A0 820.525354] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>
>>> [=C2=A0 820.536780] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>
>>> [=C2=A0 820.548222] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>>
>>> [=C2=A0 820.559639] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> <[=C2=A0 820.646931] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 820.658355] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 820.669797] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 820.681216] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 820.692601] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> <<<<<<<<<<<<<<< 14.50 fps
>>> <<<<<<<<<<<<<<< 14.75 fps
>>> <<<<<<<<<<<<<<< 14.73 fps
>>> <<<<<<<<<<<<<<< 14.80 fps
>>> <<<<<<<<<<<<<[ 825.517854] tegra_mc_irq: 133437 callbacks suppressed
>>> [=C2=A0 825.517874] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.534395] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.545833] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.557280] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.579346] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.590764] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.602188] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.613649] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.625075] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> [=C2=A0 825.645983] tegra-mc 70019000.memory-controller: viw: write=20
>>> @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>>> < 14.64 fps
>>> <<<<<<<<<<<<<<<< 14.87 fps
>>> <<<<<<<<<<<<<<< 14.89 fps
>>>
>>> Something is producing EMEM address decode errors. But it is streaming.
>>
>> above memory controller errors may be due to access faults and not=20
>> sure why these show up on your setup. I never have these with my=20
>> testing.
>>
>> Also I am using CMA alloc of 256MB and not sure if low CMA alloc size=20
>> is causing this. Can you try with CMA alloc size of 256MB?
>>
>>>
>>> If I enable the TPG then everything is fine.
>>>
>>> So I have currently three different behaviors for three camera=20
>>> connectors.
>>>
>>> Do you have a datasheet for your Jetson TX1 camera board? It could=20
>>> be useful
>>> to compare the two.
>>
>> Yeah we have and will send it offline.
>>
>> Also based on connector mapping to corresponding CSI port,=20
>> mipi-calibrate pad cell value also need to be changed.
>>
>> Below is for CSI-A
>>
>> nvidia,mipi-calibrate =3D <&mipi 0x001>
>>> Regards,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0Hans
> Connector-1 is CSI-AB where you had timeouts.
>
> Connector-2 is CSI-CD and this works for you.
>
> Connector-3 is CSI-EF and this works for streaming from above but=20
> there's memory access fault errors (EMEM address decode errors)
>
> These EMEM decode errors are not related to connector but its just=20
> they showed up during connector-3 testing I believe. Can you also keep=20
> CMA size to 256MB and try?
>
> Not sure if CSI-AB issue with FS and MW_ACK sp timeouts are due to=20
> some HW/setup issue. Streaming should work on CSI-AB ports as well=20
> just like CSI-CD/EF with proper device tree change for port index and=20
> mipi calibrate cells for corresponding ports.
>
> On my setup that I tested IMX274 is on CSI-AB.
>
> Will update my side test results with today's linux-next

Hans,

We have this module as well. Will try to get this today for testing and=20
will update just to make sure of this combo as well on my side.

https://www.leopardimaging.com/uploads/LI-TX1-KIT-IMX274M12-T_datasheet.pdf

Thanks

Sowjanya

>
>>>
>>>>>> This series include,
>>>>>>
>>>>>> VI I2C related fixes
>>>>>> - Camera sensor programming happens through VI I2C which is on=20
>>>>>> host1x bus.
>>>>>> - These patches includes device tree and I2C driver fixes for VI=20
>>>>>> I2C.
>>>>>>
>>>>>> Tegra video driver updates
>>>>>> - TPG Vs Non-TPG based on Kconfig
>>>>>> - Support for external sensor video capture based on device graph=20
>>>>>> from DT.
>>>>>> - Support for selection ioctl operations
>>>>>> - Tegra MIPI CSI pads calibration
>>>>>> - CSI T-CLK and T-HS settle time computation based on clock rates.
>>>>>>
>>>>>> Host1x driver updates
>>>>>> - Adds API to allow creating mipi device for specific device node.
>>>>>> - Splits MIPI pads calibrate start and waiting for calibration to=20
>>>>>> be done.
>>>>>>
>>>>>> Device tree updates
>>>>>> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to=20
>>>>>> Jetson TX1 DT.
>>>>>> - Enabled VI and CSI support in Jetson Nano DT.
>>>>>>
>>>>>>
>>>>>> Delta between patch versions:
>>>>>>
>>>>>> [v2]:=C2=A0=C2=A0=C2=A0 Includes below changes based on v1 feedback
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- dt-binding document and the driver update =
for device graph=20
>>>>>> to use
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 separate ports for sink endpoint and =
source endpoint for csi.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Use data-lanes endpoint property for csi.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Update tegra_mipi_request() to take device=
 node pointer=20
>>>>>> argument
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rather than adding extra API.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0- Remove checking for clk pointer before clk=
_disable.
>>>>>>
>>>>>>
>>>>>> Sowjanya Komatineni (18):
>>>>>> =C2=A0=C2=A0=C2=A0 dt-bindings: i2c: tegra: Document Tegra210 VI I2C=
 clocks and
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains
>>>>>> =C2=A0=C2=A0=C2=A0 arm64: tegra: Add missing clocks and power-domain=
s to=20
>>>>>> Tegra210 VI I2C
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Don't mark VI I2C as IRQ safe runtime=
 PM
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Fix the error path in tegra_i2c_runti=
me_resume
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Fix runtime resume to re-init VI I2C
>>>>>> =C2=A0=C2=A0=C2=A0 i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra2=
10 vi i2c
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Fix channel format alignment
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Enable TPG based on kernel co=
nfig
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Update format lookup to offse=
t based
>>>>>> =C2=A0=C2=A0=C2=A0 dt-bindings: tegra: Update VI and CSI bindings wi=
th port info
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Add support for external sens=
or capture
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Add support for selection ioc=
tl ops
>>>>>> =C2=A0=C2=A0=C2=A0 gpu: host1x: mipi: Update tegra_mipi_request() to=
 be node based
>>>>>> =C2=A0=C2=A0=C2=A0 gpu: host1x: mipi: Split tegra_mipi_calibrate and=
=20
>>>>>> tegra_mipi_wait
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Add CSI MIPI pads calibration
>>>>>> =C2=A0=C2=A0=C2=A0 media: tegra-video: Compute settle times based on=
 the clock rate
>>>>>> =C2=A0=C2=A0=C2=A0 arm64: tegra: jetson-tx1: Add camera supplies
>>>>>> =C2=A0=C2=A0=C2=A0 arm64: tegra: Enable Tegra VI CSI support for Jet=
son Nano
>>>>>>
>>>>>> =C2=A0=C2=A0 .../display/tegra/nvidia,tegra20-host1x.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 92 ++-
>>>>>> =C2=A0=C2=A0 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 19=
 +-
>>>>>> =C2=A0=C2=A0 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi=C2=A0=C2=
=A0=C2=A0=C2=A0 | 41 ++
>>>>>> =C2=A0=C2=A0 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10=
 +
>>>>>> =C2=A0=C2=A0 arch/arm64/boot/dts/nvidia/tegra210.dtsi=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +
>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/tegra/dsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +-
>>>>>> =C2=A0=C2=A0 drivers/gpu/host1x/mipi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +-
>>>>>> =C2=A0=C2=A0 drivers/i2c/busses/i2c-tegra.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 39 +-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/Kconfig=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/csi.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 245 ++++++-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/csi.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/tegra210.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/vi.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 770=20
>>>>>> +++++++++++++++++++--
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/vi.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +-
>>>>>> =C2=A0=C2=A0 drivers/staging/media/tegra-video/video.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +-
>>>>>> =C2=A0=C2=A0 include/linux/host1x.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +-
>>>>>> =C2=A0=C2=A0 16 files changed, 1251 insertions(+), 100 deletions(-)
>>>>>>
