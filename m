Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A6220F7C0
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 16:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgF3O5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 10:57:45 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18855 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbgF3O5o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 10:57:44 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb52840000>; Tue, 30 Jun 2020 07:56:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 07:57:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 30 Jun 2020 07:57:43 -0700
Received: from [10.2.167.193] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 14:57:42 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <f5c84071-46ad-aa6f-0820-1813d4a907c9@nvidia.com>
Date:   Tue, 30 Jun 2020 07:58:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b3f63f3f-50b2-e818-2c59-8009c31a9825@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593528964; bh=bGQktMPXKmKPHg7RRyRI9hGVJzUghw1Ix53luSEWxdA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Jp48+hgj584dM8h98lPevHpPOjPEjWy3eycIEwlqetvMBvD+zzOQUGCDDmuu3mpm3
         76LH9a//OWseaS3jttweVakuYW9DDgSG6pF0U3il8PlO+XVb/QSCU9Qbuy/ioCGbWI
         f5eEyPPfu3JWQLwXoIc8HudD41CEg8QxAdt2a2NMGhC1S/nW5TUatdjt3zcU4qfor1
         xVu+O/CoHIAljuBTFDJU0vvsore9y7553R2rpEsbiY2Gc99TuxBTHM84oMorwhDAEG
         qTXBiqAB9HM1Ia8XIyZh6J2NuBXf1kZ9HM+BV/6LI9N/B9unNonB50rNOyOHUDl1L5
         eYjxucg/gE3wA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/30/20 2:21 AM, Hans Verkuil wrote:
> On 17/06/2020 03:41, Sowjanya Komatineni wrote:
>> This series adds support for video capture from external camera sensor to
>> Tegra video driver.
>>
>> Jetson TX1 has camera expansion connector and supports custom camera module
>> designed as per TX1 design specification.
>>
>> This series also enables camera capture support for Jetson Nano which has
>> Raspberry PI camera header.
>>
>> This series is tested with IMX219 camera sensor.
> Which tree did you base this on? The media_tree master? Or the mainline kernel?
These patches are with linux-next base at the time I sent them out which 
are on 20200616
>
> I now have the imx219 detected, but if I try to stream I get this:
>
> $ v4l2-ctl --stream-mmap
> <[  512.840944] video4linux video0: MW_ACK_DONE syncpt timeout: -11
> [  512.972975] video4linux video0: frame start syncpt timeout: -11
> <VIDIOC_DQBUF: failed: Input/output error
> [  513.180770] video4linux video0: MW_ACK_DONE syncpt timeout: -11
>
> And then everything hangs and I need to reset.
>
> I'm testing with the media_tree master with your patches on top.
>
> Regards,
>
> 	Hans

Are you using same device tree as I sent offline? It uses CSI A for IMX219.

Does you setup also uses CSI-A as x2 for IMX219?

I tested them on Jetson Nano + IMX219 rasp PI module and also on Jetson 
TX1 + IMX274.

I did not see any issue and am able to capture from both.

Will try again on my side with today's latest linux-next and update result.

>
>> This series include,
>>
>> VI I2C related fixes
>> - Camera sensor programming happens through VI I2C which is on host1x bus.
>> - These patches includes device tree and I2C driver fixes for VI I2C.
>>
>> Tegra video driver updates
>> - TPG Vs Non-TPG based on Kconfig
>> - Support for external sensor video capture based on device graph from DT.
>> - Support for selection ioctl operations
>> - Tegra MIPI CSI pads calibration
>> - CSI T-CLK and T-HS settle time computation based on clock rates.
>>
>> Host1x driver updates
>> - Adds API to allow creating mipi device for specific device node.
>> - Splits MIPI pads calibrate start and waiting for calibration to be done.
>>
>> Device tree updates
>> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
>> - Enabled VI and CSI support in Jetson Nano DT.
>>
>>
>> Delta between patch versions:
>>
>> [v2]:	Includes below changes based on v1 feedback
>> 	- dt-binding document and the driver update for device graph to use
>> 	  separate ports for sink endpoint and source endpoint for csi.
>> 	- Use data-lanes endpoint property for csi.
>> 	- Update tegra_mipi_request() to take device node pointer argument
>> 	  rather than adding extra API.
>> 	- Remove checking for clk pointer before clk_disable.
>>
>>
>> Sowjanya Komatineni (18):
>>    dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>>      power-domains
>>    arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
>>    i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>>    i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>>    i2c: tegra: Fix runtime resume to re-init VI I2C
>>    i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>>    media: tegra-video: Fix channel format alignment
>>    media: tegra-video: Enable TPG based on kernel config
>>    media: tegra-video: Update format lookup to offset based
>>    dt-bindings: tegra: Update VI and CSI bindings with port info
>>    media: tegra-video: Add support for external sensor capture
>>    media: tegra-video: Add support for selection ioctl ops
>>    gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>>    gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>>    media: tegra-video: Add CSI MIPI pads calibration
>>    media: tegra-video: Compute settle times based on the clock rate
>>    arm64: tegra: jetson-tx1: Add camera supplies
>>    arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
>>
>>   .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>>   .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
>>   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>>   drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>>   drivers/gpu/host1x/mipi.c                          |  30 +-
>>   drivers/i2c/busses/i2c-tegra.c                     |  39 +-
>>   drivers/staging/media/tegra-video/Kconfig          |   7 +
>>   drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
>>   drivers/staging/media/tegra-video/csi.h            |   8 +
>>   drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>>   drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
>>   drivers/staging/media/tegra-video/vi.h             |  23 +-
>>   drivers/staging/media/tegra-video/video.c          |  23 +-
>>   include/linux/host1x.h                             |   4 +-
>>   16 files changed, 1251 insertions(+), 100 deletions(-)
>>
