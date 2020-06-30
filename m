Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA4D20F8B6
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 17:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389674AbgF3Pns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 11:43:48 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15501 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389655AbgF3Pns (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 11:43:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb5d810001>; Tue, 30 Jun 2020 08:42:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 08:43:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 08:43:47 -0700
Received: from [10.2.167.193] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 15:43:46 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <72ca3b09-7ca6-7421-4a9d-98326d1af087@nvidia.com>
Date:   Tue, 30 Jun 2020 08:44:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a60d8f80-312d-fce3-61f5-328e7f2a7a64@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593531778; bh=Awb4OZIabXTvu1FWi3MWChEmL15hnuFJ0Nq97kg1ETs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=o8Mb8XrNExe1mOsfRBwLYJhxbCBvOHqFQBhg0hdfQcvrmKkj+iXgqerAJYgKQPdpz
         DAfJnvLS87E8V2C1so1VxhjniLTCPqo6XuvQhRnL4pzOcaKGign0sLGLDZij5GKs3n
         afw93lqS+cRCKWs2A/BhGhBQaqZFgllCakBRVNYe67r0JstZ80bxQMtL6pD2ny3ygY
         zkFVBllnGihHper0iJ27Cpf0JxpZ+y1ejErgn/qumdxh9lj+KgwGV2MMegoJUSM6W2
         x/oAzwMW73OYUkqx/rWn1b0l1EsWwHmH+CqlyXrwrsymmNd4zSDSnbXvPkNIs+8p0Y
         5mW5icd2i5Tzw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/30/20 8:13 AM, Hans Verkuil wrote:
> On 30/06/2020 16:58, Sowjanya Komatineni wrote:
>> On 6/30/20 2:21 AM, Hans Verkuil wrote:
>>> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>>>> This series adds support for video capture from external camera sensor to
>>>> Tegra video driver.
>>>>
>>>> Jetson TX1 has camera expansion connector and supports custom camera module
>>>> designed as per TX1 design specification.
>>>>
>>>> This series also enables camera capture support for Jetson Nano which has
>>>> Raspberry PI camera header.
>>>>
>>>> This series is tested with IMX219 camera sensor.
>>> Which tree did you base this on? The media_tree master? Or the mainline kernel?
>> These patches are with linux-next base at the time I sent them out which
>> are on 20200616
>>> I now have the imx219 detected, but if I try to stream I get this:
>>>
>>> $ v4l2-ctl --stream-mmap
>>> <[  512.840944] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>>> [  512.972975] video4linux video0: frame start syncpt timeout: -11
>>> <VIDIOC_DQBUF: failed: Input/output error
>>> [  513.180770] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>>>
>>> And then everything hangs and I need to reset.
>>>
>>> I'm testing with the media_tree master with your patches on top.
>>>
>>> Regards,
>>>
>>> 	Hans
>> Are you using same device tree as I sent offline? It uses CSI A for IMX219.
>>
>> Does you setup also uses CSI-A as x2 for IMX219?
>>
>> I tested them on Jetson Nano + IMX219 rasp PI module and also on Jetson
>> TX1 + IMX274.
>>
>> I did not see any issue and am able to capture from both.
>>
>> Will try again on my side with today's latest linux-next and update result.
> Please use the media_tree master, that's what I use as well.
>
> I did some more testing and there is something weird going on.
>
> I have a Leopard Imaging camera expansion board (LI-JTX1-MIPI-ADPT) with
> three camera connectors. See here for the datasheet:
>
> https://www.leopardimaging.com/uploads/LI-TX1-KIT-IMX274M12-T_datasheet.pdf
>
> The first connector (with an IMX274) causes this error:
>
> $ v4l2-ctl -d1 --stream-mmap
> [  599.265885] video4linux video1: MW_ACK_DONE syncpt timeout: -11
> [  599.473883] video4linux video1: MW_ACK_DONE syncpt timeout: -11
> [  599.681904] video4linux video1: frame start syncpt timeout: -11
> [  599.681909] video4linux video1: MW_ACK_DONE syncpt timeout: -11
> <VIDIOC_DQBUF: failed: Input/output error
> [  599.897884] video4linux video1: MW_ACK_DONE syncpt timeout: -11
>
> Similar to the test above where I had an IMX219 connected. Except it didn't
> hang with the IMX274 (I'm beginning to suspect a locking issue in the imx219
> driver that is causing the hang, I'll look at that tomorrow).
>
> If I connect the IMX219 to the middle camera connector, then it works fine.
> I think I tested this with the IMX274 as well, but I'm not 100% certain, also
> something to double check tomorrow.
>
> If I connect the IMX219 or IMX274 to the third camera connector, then I get this:

Would like to know CSI port mapping to connectors as mipi calibrate pads 
cells need to be updated in device tree based on CSI port in use.

Will see if I can find that from DS link you sent above.

>
> $ v4l2-ctl -d0 --stream-mmap
> [  820.513866] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>
> [  820.525354] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>
> [  820.536780] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>
> [  820.548222] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
>
> [  820.559639] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> <[  820.646931] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  820.658355] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  820.669797] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  820.681216] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  820.692601] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> <<<<<<<<<<<<<<< 14.50 fps
> <<<<<<<<<<<<<<< 14.75 fps
> <<<<<<<<<<<<<<< 14.73 fps
> <<<<<<<<<<<<<<< 14.80 fps
> <<<<<<<<<<<<<[  825.517854] tegra_mc_irq: 133437 callbacks suppressed
> [  825.517874] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.534395] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.545833] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.557280] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.579346] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.590764] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.602188] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.613649] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.625075] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> [  825.645983] tegra-mc 70019000.memory-controller: viw: write @0x00000001b5fd08c0: EMEM address decode error (EMEM decode error)
> < 14.64 fps
> <<<<<<<<<<<<<<<< 14.87 fps
> <<<<<<<<<<<<<<< 14.89 fps
>
> Something is producing EMEM address decode errors. But it is streaming.

above memory controller errors may be due to access faults and not sure 
why these show up on your setup. I never have these with my testing.

Also I am using CMA alloc of 256MB and not sure if low CMA alloc size is 
causing this. Can you try with CMA alloc size of 256MB?

>
> If I enable the TPG then everything is fine.
>
> So I have currently three different behaviors for three camera connectors.
>
> Do you have a datasheet for your Jetson TX1 camera board? It could be useful
> to compare the two.

Yeah we have and will send it offline.

Also based on connector mapping to corresponding CSI port, 
mipi-calibrate pad cell value also need to be changed.

Below is for CSI-A

nvidia,mipi-calibrate = <&mipi 0x001>
> Regards,
>
> 	Hans
>
>>>> This series include,
>>>>
>>>> VI I2C related fixes
>>>> - Camera sensor programming happens through VI I2C which is on host1x bus.
>>>> - These patches includes device tree and I2C driver fixes for VI I2C.
>>>>
>>>> Tegra video driver updates
>>>> - TPG Vs Non-TPG based on Kconfig
>>>> - Support for external sensor video capture based on device graph from DT.
>>>> - Support for selection ioctl operations
>>>> - Tegra MIPI CSI pads calibration
>>>> - CSI T-CLK and T-HS settle time computation based on clock rates.
>>>>
>>>> Host1x driver updates
>>>> - Adds API to allow creating mipi device for specific device node.
>>>> - Splits MIPI pads calibrate start and waiting for calibration to be done.
>>>>
>>>> Device tree updates
>>>> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
>>>> - Enabled VI and CSI support in Jetson Nano DT.
>>>>
>>>>
>>>> Delta between patch versions:
>>>>
>>>> [v2]:	Includes below changes based on v1 feedback
>>>> 	- dt-binding document and the driver update for device graph to use
>>>> 	  separate ports for sink endpoint and source endpoint for csi.
>>>> 	- Use data-lanes endpoint property for csi.
>>>> 	- Update tegra_mipi_request() to take device node pointer argument
>>>> 	  rather than adding extra API.
>>>> 	- Remove checking for clk pointer before clk_disable.
>>>>
>>>>
>>>> Sowjanya Komatineni (18):
>>>>     dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>>>>       power-domains
>>>>     arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
>>>>     i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>>>>     i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>>>>     i2c: tegra: Fix runtime resume to re-init VI I2C
>>>>     i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>>>>     media: tegra-video: Fix channel format alignment
>>>>     media: tegra-video: Enable TPG based on kernel config
>>>>     media: tegra-video: Update format lookup to offset based
>>>>     dt-bindings: tegra: Update VI and CSI bindings with port info
>>>>     media: tegra-video: Add support for external sensor capture
>>>>     media: tegra-video: Add support for selection ioctl ops
>>>>     gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>>>>     gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>>>>     media: tegra-video: Add CSI MIPI pads calibration
>>>>     media: tegra-video: Compute settle times based on the clock rate
>>>>     arm64: tegra: jetson-tx1: Add camera supplies
>>>>     arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
>>>>
>>>>    .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>>>>    .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>>>>    arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
>>>>    arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
>>>>    arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>>>>    drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>>>>    drivers/gpu/host1x/mipi.c                          |  30 +-
>>>>    drivers/i2c/busses/i2c-tegra.c                     |  39 +-
>>>>    drivers/staging/media/tegra-video/Kconfig          |   7 +
>>>>    drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
>>>>    drivers/staging/media/tegra-video/csi.h            |   8 +
>>>>    drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>>>>    drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
>>>>    drivers/staging/media/tegra-video/vi.h             |  23 +-
>>>>    drivers/staging/media/tegra-video/video.c          |  23 +-
>>>>    include/linux/host1x.h                             |   4 +-
>>>>    16 files changed, 1251 insertions(+), 100 deletions(-)
>>>>
