Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22C022C283
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 11:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgGXJnj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 05:43:39 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47307 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726114AbgGXJnj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jul 2020 05:43:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id yuEojKP2FywL5yuEpjSoaW; Fri, 24 Jul 2020 11:43:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595583816; bh=X/ey0vlyUrrkiB6fZ9SxASsWxncNKA0zs37XFPKq49A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=flyB4CY6QOHBAHH0IRDamDkAtGR2gZi9J9WE3NlW8BbgihYnOMSSYAIbskZlznGqo
         aJxKjPq1LOpgIevK9MCNnncq42dH2Hrvabn3feXSCVAr+ytLwlp0+d4PLR5SiKzZlI
         wAp5BshiPXa1hpHrmBb9eZI6nu24BQBemm1bgaTqts0DImHQgReBu/FXSZABXLg9ES
         2/yMIHdtOJdE0YWrsZpOg8hFbt5n1vHlFRwB7tbFQjTQSAHQOen20cx2zIuGd6UZ3o
         NEHQ8vo3A+8jUqBsmoCxrWey9RkyTpULvYCESRabtYiJuB2o3HqG/yPx6hbys4Ts+l
         k4t8ShT00IgCQ==
Subject: Re: [RFC PATCH v4 00/14] Support for Tegra video capture from
 external sensor
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cb080da3-5ae5-bb83-8f5c-65d1fe17cb67@xs4all.nl>
Date:   Fri, 24 Jul 2020 11:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEMMYYD6g+CSrxjATIbU9TbOSrXG7nUV0lk+4TmcECLEqZfNcuERiA4QsKgnUV9l/bvWF3A234GJlHJ0G/nWQ0m5NTzlgam9RS0rby+x0EP7WgIhdPC6
 Q31aCTIPiiOu8uXuXpqtkB8u3j71xcEbUlimy2syIgXILQdTM16PVGN5ADfSC9+X/cRxd9Fz474AJlmC3hOkR7x0vRS5D8FWzPS5E69IE/TLrbkuotxRNwFl
 07jZSalUTSJ+1v/vOtDtVlaWorHeEuvYy8fCZI2JDmITFjyuWtIY3gR4cTNYvDGVXW/HU/hfRtLwB0OUbhxP2yc6xItq1enCj8pBFmsQ6q3Y9rVGcZynqtoO
 2AXqjJMB5P0gmMM9SMhT7zCw76ONc+dXP5HIlCiqTX3HEaJv2SLjO/HHPXupSmU3lGMG2tesBjp2tbC5ipCArb11h6+kRuhyOqq12DP54YWEcEygMTxV4VJu
 0t/PwqzWH48wxifSpdsGIHgx1CW/wrNCLO84AqzddvhYmcZMPiY/9bslfTVjaGT9kVHvFUDDhZilTvwFmGpBA8WvWU2aw6RcyC1sObIQUYOnpqZO87+KTTwg
 14XiAWDxQNCR4fNGt31po35j/uqKFIbFFTdvwp/SZklqoyi8ainibTZlLOyxw+yCKaZ6tJx9GZlo8dpX4646BIKCVpLMIknh0CLo5YxlLDgQQhmQYul6X4aF
 Y/ICDoOPCFrAEf391QbwNyds/TEeBDsgXFO2N2N/fAeUCfbOqXtWww==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thierry, Dmitry,

I'm happy with this series from a media perspective. However, patches 1-5 fix
various i2c-tegra.c issues and patch 12 changes mipi calibration functions in
drivers/gpu that patch 13 relies on.

I think the i2c-tegra.c patches can be merged independently into the i2c
subsystem, but patch 12 needs to be merged with the media patches. So for patch
12 I need an Acked-by from Thierry.

I can also take the i2c-tegra patches if preferred, but there too I need Acks.
Dmitry, can you either take these i2c patches, or reply with Acks if you want
me to take it?

Regards,

	Hans


On 24/07/2020 01:50, Sowjanya Komatineni wrote:
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
> 
> 
> Delta between patch versions:
> [v4]:	Includes below fix based on v3 feedback
> 	- Patches are based on latest linux-next.
> 	- With split of tegra_mipi_calibrate() and tegra_mipi_wait(), mipi
> 	  clock is not left enabled till calibration done. This series adds
> 	  a patch to fix this by keeping clock enabled till calibration is
> 	  done.
> 
> 	Note:
> 	Patch-0010 has compilation dependency on
> 	https://patchwork.kernel.org/patch/11659521/
> 
> [v3]:	Includes v2 feedback
> 	- Uses separate helper function for retrieving remote csi subdevice
> 	  and source subdevice.
> 	- Added check for presence of subdevice ops set/get_selection
> 	- dropped vb2_queue_release from driver and using
> 	  vb2_video_unregister_device instead of video_unregister_device.
> 	- video device register should happen in the last after all video
> 	  device related setup is done in the driver. This is being addressed
> 	  in below RFC patch. Once proper implementation of this is available
> 	  will update Tegra video driver to use split APIs and do all setup
> 	  prior to device register. Added this as TODO in the driver.
> 	  https://www.spinics.net/lists/linux-media/msg172761.html
> 
> 	Note:
> 	Patch-0012 has compilation dependency on
> 	https://patchwork.kernel.org/patch/11659521/
> 
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
> Sowjanya Komatineni (14):
>   i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>   i2c: tegra: Remove NULL pointer check before
>     clk_enable/disable/prepare/unprepare
>   i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>   i2c: tegra: Fix runtime resume to re-init VI I2C
>   i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>   media: tegra-video: Fix channel format alignment
>   media: tegra-video: Enable TPG based on kernel config
>   media: tegra-video: Update format lookup to offset based
>   dt-bindings: tegra: Update VI and CSI bindings with port info
>   media: tegra-video: Add support for external sensor capture
>   media: tegra-video: Add support for selection ioctl ops
>   gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
>   media: tegra-video: Add CSI MIPI pads calibration
>   media: tegra-video: Compute settle times based on the clock rate
> 
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>  drivers/gpu/drm/tegra/dsi.c                        |   4 +-
>  drivers/gpu/host1x/mipi.c                          |  19 +-
>  drivers/i2c/busses/i2c-tegra.c                     | 101 +--
>  drivers/staging/media/tegra-video/Kconfig          |   7 +
>  drivers/staging/media/tegra-video/csi.c            | 258 ++++++-
>  drivers/staging/media/tegra-video/csi.h            |   8 +
>  drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>  drivers/staging/media/tegra-video/vi.c             | 800 +++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h             |  25 +-
>  drivers/staging/media/tegra-video/video.c          |  23 +-
>  include/linux/host1x.h                             |   5 +-
>  12 files changed, 1224 insertions(+), 143 deletions(-)
> 

