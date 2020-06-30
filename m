Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CEB20F179
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731583AbgF3JVt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 05:21:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47281 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727059AbgF3JVs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 05:21:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qCSTjdtkI0MRaqCSWjRdAW; Tue, 30 Jun 2020 11:21:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593508905; bh=gaF1d9JJOEjoI19ea8tyLBV7eKPAiiIxrw/bT2KcK/o=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=B0+Q3ccAoxkgTd5GuHtlwJOAExJEx1UopSd/+5kSCMD8u3FYwXp084Y9i+04GdWUh
         GgCajGMg4ZVd9HHusuYeXr0yZ9fhN1T5PddzE9jlu3FL6Mjhq/gE7aw3lt58FQzOe+
         r4Wmmun7oYwTEpCF+cRdWD66IJ87DB0ZzKspCPL3mEFP71RSH3G3EHEvvPJETg27g0
         pqd61Am23xaRYEMIDPW6dVLvaHjdTvxDi2W5qf8IRPVax3jZfFzf8zkqlH2z2QKBTa
         uoS0VJVzgY05tr3L8q7XBSIbtPc0nZU35xrfaorsT7X0HmrJ4lFRY3P5flgyfhiM8E
         9/Ab5OXUv0AjQ==
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b3f63f3f-50b2-e818-2c59-8009c31a9825@xs4all.nl>
Date:   Tue, 30 Jun 2020 11:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF6TQ9+EZpou77Jwe/DMX+zTfno34BJojRGC27/8y8grh/15A7cmvfY1obu6/DBLvznOg+JXOjdfDd9scWKbRpf4JqDmbYSdGPhwQYJZ+i7dGPTTtleQ
 YPXXDTHgft9Vkc8YEX/kSv8kAYsIbpQyiHHv43A8qnwl7hsc2+96KRDdouMmqx4HBhJq2/ZzOjDfgXGchaIfey4P/f9RcbjOjRFbj4RMJMhs4rzLUQhK9jgC
 WuuwpZUxyNxfF3jduQic7G/YD2AOTLWdKMoX/dTxjnULzUAF+Ui8sBEqmKgqZWCQmegXFW2xbM5YEA883i9PWAUCSD+L38AJ6b0htwNVjt8g/LcJBmTojpUc
 P7GaaCSu5D/rXzZmCVnk+ACaoG6gsxpNva1Fiy7+KqMLU53gv8hpDxC/1s4ovmpJEzVQh6FGa+1ae6DUOQLnfRz3PNcrYYYqjfkaSgILxiQs/x/c/B+b6vJq
 DlRB5vi9u29CozpSDS8DpiYLsrzFIS8Ah3ZcUQI02bdrmOKU0yEFgFQ/8kIkunFk570cwyVZoNeMmBF15/0EAOWevYdHNNSIi/qngMDV5nxUz+ugQ4Bohs/g
 UsrQKd7zeDuBny0zaoJvh64YCT0XGv3bHHnJAPQosT5QyK4XsUZVDIxxnO0yXeXtahLCNYqzWKv03aFhguHPGhax
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/06/2020 03:41, Sowjanya Komatineni wrote:
> This series adds support for video capture from external camera sensor to
> Tegra video driver.
> 
> Jetson TX1 has camera expansion connector and supports custom camera module
> designed as per TX1 design specification.
> 
> This series also enables camera capture support for Jetson Nano which has
> Raspberry PI camera header.
> 
> This series is tested with IMX219 camera sensor.

Which tree did you base this on? The media_tree master? Or the mainline kernel?

I now have the imx219 detected, but if I try to stream I get this:

$ v4l2-ctl --stream-mmap
<[  512.840944] video4linux video0: MW_ACK_DONE syncpt timeout: -11
[  512.972975] video4linux video0: frame start syncpt timeout: -11
<VIDIOC_DQBUF: failed: Input/output error
[  513.180770] video4linux video0: MW_ACK_DONE syncpt timeout: -11

And then everything hangs and I need to reset.

I'm testing with the media_tree master with your patches on top.

Regards,

	Hans

> 
> This series include,
> 
> VI I2C related fixes
> - Camera sensor programming happens through VI I2C which is on host1x bus.
> - These patches includes device tree and I2C driver fixes for VI I2C.
> 
> Tegra video driver updates
> - TPG Vs Non-TPG based on Kconfig
> - Support for external sensor video capture based on device graph from DT.
> - Support for selection ioctl operations
> - Tegra MIPI CSI pads calibration
> - CSI T-CLK and T-HS settle time computation based on clock rates.
> 
> Host1x driver updates
> - Adds API to allow creating mipi device for specific device node.
> - Splits MIPI pads calibrate start and waiting for calibration to be done.
> 
> Device tree updates
> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
> - Enabled VI and CSI support in Jetson Nano DT.
> 
> 
> Delta between patch versions:
> 
> [v2]:	Includes below changes based on v1 feedback
> 	- dt-binding document and the driver update for device graph to use
> 	  separate ports for sink endpoint and source endpoint for csi.
> 	- Use data-lanes endpoint property for csi.
> 	- Update tegra_mipi_request() to take device node pointer argument
> 	  rather than adding extra API.
> 	- Remove checking for clk pointer before clk_disable.
> 
> 
> Sowjanya Komatineni (18):
>   dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>     power-domains
>   arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
>   i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>   i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>   i2c: tegra: Fix runtime resume to re-init VI I2C
>   i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>   media: tegra-video: Fix channel format alignment
>   media: tegra-video: Enable TPG based on kernel config
>   media: tegra-video: Update format lookup to offset based
>   dt-bindings: tegra: Update VI and CSI bindings with port info
>   media: tegra-video: Add support for external sensor capture
>   media: tegra-video: Add support for selection ioctl ops
>   gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>   gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>   media: tegra-video: Add CSI MIPI pads calibration
>   media: tegra-video: Compute settle times based on the clock rate
>   arm64: tegra: jetson-tx1: Add camera supplies
>   arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
> 
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>  drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>  drivers/gpu/host1x/mipi.c                          |  30 +-
>  drivers/i2c/busses/i2c-tegra.c                     |  39 +-
>  drivers/staging/media/tegra-video/Kconfig          |   7 +
>  drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
>  drivers/staging/media/tegra-video/csi.h            |   8 +
>  drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>  drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h             |  23 +-
>  drivers/staging/media/tegra-video/video.c          |  23 +-
>  include/linux/host1x.h                             |   4 +-
>  16 files changed, 1251 insertions(+), 100 deletions(-)
> 

