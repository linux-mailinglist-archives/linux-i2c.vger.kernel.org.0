Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE622125A0
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 16:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbgGBOIa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 10:08:30 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42999 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729363AbgGBOI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 10:08:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qzt0jn3b440yDqzt4jeqgH; Thu, 02 Jul 2020 16:08:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593698906; bh=YbrKDKDrYrRzvVj8n7Fz5eB1BDFoNuvmIvPFBVetx9Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fMVopOQiTMtcetcuVUrXIKdiyuHJYWb2h+XCm34OU4yIsyexCv59J4LW+5gg4iPsO
         4BSdRwNVmhTK8E4P765G/SWvetZeYOTxEuqpvYOq2acLhjIyFoCW9uECiDIAizm4g8
         82sx7B6mV5NTWJL/UWqBM+1b4QPhN/Btu4C5rwaIozQMtiUEr06huW/Afu/G/67zxC
         4om83V3w4RKr9hyUSmyGwNjwR1H0G7UVnvA1jC20azZS/vuoeLZpnpn3lsh88yJrCx
         lFo3H0h/1muwcrKC6LyJ5ZrwCqVMknWbUamYT3ggPp9SrkHGkW4k4eM04bnfHBsTks
         S0PW4m76ZCx5w==
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
Message-ID: <68d5b863-2ff1-203c-bd30-9ad0dcdf76f7@xs4all.nl>
Date:   Thu, 2 Jul 2020 16:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKPAXFkDnxoSLDYBjfJeoAAFc03OoAuvfRzpQ+w2Y7O+lm0lkCJAlJOnu84ZS64EIo04hA8CJAGMfyEhYrpWdSlgjVb3N+SjvJpXIdu0M/gFont2G2qx
 picHlkg04U3RYKtrnCHQ9Ex6yD71nqZdpejZu1m3ooqZ592K/DFkDJL3HrYJO+XT3wNso3mGMkKTWgAkyjrEDOg1ZxwxsYo9IHlQmDYMCFMj0et5TzbOftCf
 V666qozCduFdQv7SNApaEe+6976AbQL9B65DUc3Fz16s+J0e2OsRFPWk1noD4noynZNehvHtXf6L6cclabYamnGMTdFU8ViHRljuOFZ6sQ5LHVbeXLrLrXGi
 u73lZirlaAufMoqi7oRj2R5J3YVskfj5cXAPQiOmmLEdJf0ISZWP+1rx1ZoePCu4CAn80VjbIAH0Jo9dcdRldP5p9QO0DLA5G0lrEcxOYsLIBuE99liOus+9
 ji/F0Ebh+FZjfuc4ZQA+3G0jm4iij/NxWVqJpDeWhDti0EW7srLsQe+Slj8aSbs20sPVzuu4S2Qvy5IkJ/Brnfj6Nscbv7x0mA6piml/gpPkQwuW/sfCHWRQ
 KHK4F08RjRXmh7fhMiu+vCjKIaWi7FDMi/mPUzc93zvKIlIGUN+1gaJvGC4z8FRTWwQ0S3URxz3jjy1lZ3u6Lg/s
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sowjanya,

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

I tested all this with imx219 and imx274. It all looks good. I'll do a last
code review on Monday.

I posted a few imx219 and imx274 patches to fix v4l2-compliance issues (also
updated that tool itself since it had a bug).

There is one remaining compliance failure with the imx274, but that is also
due to a bug in the imx274: it's missing a bunch of enum ops and it is doing
weird things with the COMPOSE selection. I think that's completely wrong, but
I need more time to dig into that.

Regards,

	Hans

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

