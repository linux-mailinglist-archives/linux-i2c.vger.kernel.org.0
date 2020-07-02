Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAEF212EB8
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 23:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGBVTw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 17:19:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3159 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgGBVTv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 17:19:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efe4f440000>; Thu, 02 Jul 2020 14:19:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 02 Jul 2020 14:19:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 02 Jul 2020 14:19:50 -0700
Received: from [10.2.167.4] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 21:19:50 +0000
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
 <68d5b863-2ff1-203c-bd30-9ad0dcdf76f7@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <f7e82e1a-30db-a7cf-f559-499decc11c44@nvidia.com>
Date:   Thu, 2 Jul 2020 14:21:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <68d5b863-2ff1-203c-bd30-9ad0dcdf76f7@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593724740; bh=2v3TmEMwjb9chwHNLWyTimKbgFOtDLJfTVDLii03Xv0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ZqOxxu5fNLPIywaJm0GqC0hXdNA5D/P6yw3Q+5UaTzcycJ1jxyZqA8FYNbK12v3Pj
         tIlkIfxy4LomRAYJhk9DltNiqdGcxly+jjdWWxdySnp25qRGAevcBiBo72mqL6N9Nd
         mnUqEhy3KRq+bCcrCALwNTeTOAbtLSLkoUclLPYeplWFOSXe8DWsv5w2n4ph0MyPJ/
         jntlueEb0OXnZaX6LuDA3VybI9vfPIcYeDIirSw1G27cjcnLqnZuuN9RC6AAZPwBKS
         1h+LXtGqGjzcgKKcUf/UE/RUY2/HbPlplWw4p6cXzAN2bWSYppwvzZ4Unw/7I78ErK
         8NdrLlUm7A7OA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/2/20 7:08 AM, Hans Verkuil wrote:
> Hi Sowjanya,
>
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
>>
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
> I tested all this with imx219 and imx274. It all looks good. I'll do a last
> code review on Monday.
>
> I posted a few imx219 and imx274 patches to fix v4l2-compliance issues (also
> updated that tool itself since it had a bug).
>
> There is one remaining compliance failure with the imx274, but that is also
> due to a bug in the imx274: it's missing a bunch of enum ops and it is doing
> weird things with the COMPOSE selection. I think that's completely wrong, but
> I need more time to dig into that.
>
> Regards,
>
> 	Hans
Thanks Hans.
>
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
