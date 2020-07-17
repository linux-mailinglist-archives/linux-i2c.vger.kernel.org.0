Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9575A2239CA
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 12:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQKyf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 06:54:35 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53885 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbgGQKye (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 06:54:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id wO0YjChHrNPeYwO0cjaQH4; Fri, 17 Jul 2020 12:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594983270; bh=ZO22z8Bx+Muk8AAJpt6+r35FG7vq2qgvgLxH4gHMSCA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pR+g11Y+AlPLGM4DOCXBSpMsCG4j/uWCBJ36fD47eLtD8nDX37OI/HTWZoB1fHkcl
         21S/S3MF5/a6058PX9GWj3BD/yVSWU2ZsuS2dwjdu5TjBE7Ydy9X/jf+Odu/T9hTH1
         U9yW0OnxQgJQ5ObAXoFB2+1fFpN20GfBCS5uhEyjMPHBJ3spVK1SkajpKeqA2HpE9E
         2HZQDLHjIDEIPLXINd6gD96Kp4KrV0kIYBe3h3wezSwSSqWHDA6pYV19uJuK/5NVYn
         eZmx1BzAPeLqhEZA8Kp9WL2vr0IdNHAzHFvL2kEBwIiyZZ5idGD/FdSpVNNjsQtlJN
         yrOD9dpwGwPdQ==
Subject: Re: [RFC PATCH v3 00/18] Support for Tegra video capture from
 external sensor
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f03bdb89-df7c-e9e8-1512-d57e5d2332bf@xs4all.nl>
Date:   Fri, 17 Jul 2020 12:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLi4ECYNdhlVjfMh9FEzQqx/iiu2UDdquQTrds7M9X35sLdjjXO6CBrTnU9icGrBVrBxl7/I+aWpZMKYALjhdb30Nc0JO//K0SDPHBd6noFw8wwLkPPD
 G3WAMzlx3QaTsra3sqH512PRgIgh3cq03Njpqpsl5qcFB3zrhXvgbfdZrYxNPUVj53DfT2Z7BKm4QHXXPhqmfXggTiAcpptvIvBaLlr5HCZydyyz5+IAOooX
 L1mj1SzCSNYI0SYYL0k1sae6/Bk+JR461toC10Qo4NhrfeXsn8+LWsbMybISV7ctZb/oYCG7AOOqqQqAWZhZDEU43gdn1VXw2yq8ZeSkb1q7EA3ybp3w+A/a
 LIAMgoJDmKAYfU1OmyM0MTXpNzXs/i8NDPSiKPY/9T1bCaO+13s0559rup6/yRmqKmTXmT/oEq8a9zRnaFYBZjqyt74E3JqqYF/4Q8sPGfbMuein5iY4SZtx
 2JcUfGAbOUXi91E3XXGnT7Oyv9+WBAdpeKpl+cOtTVXznDBtm/FlhgA2t7YXbU6MqjFyQVqokBNYgTBFvGhORvnyW9LtTanL5GiSc8jRK65Vko6c6UngiRaj
 Pz2koosDsb66MV6Nc7VbRDApkDofRF1OQa37ttRnSjPBcxTegXxSwuYmleNwywvB4+CUirbvx1yXIB13OyzqKglg
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sowjanya,

On 15/07/2020 06:20, Sowjanya Komatineni wrote:
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

I'm doing a bit of stress testing with:

while true; do v4l2-ctl --stream-mmap --stream-count=1; done

and I see that the imx274 has often streaming failures:

[  172.025144] IMX274 8-001a: s_stream failed
[  179.025192] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 3132 = 870 (2 bytes)
[  179.033575] IMX274 8-001a: s_stream failed
[  226.525378] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 3130 = 878 (2 bytes)
[  226.533761] IMX274 8-001a: s_stream failed
[  227.029325] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f6 = 107 (2 bytes)
[  227.037758] IMX274 8-001a: s_stream failed
[  247.025218] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f6 = 107 (2 bytes)
[  247.033658] IMX274 8-001a: s_stream failed
[  293.025517] IMX274 8-001a: s_stream failed
[  309.024727] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30e0 = 0 (2 bytes)
[  309.032969] IMX274 8-001a: s_stream failed
[  309.529506] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f8 = 11d2 (3 bytes)
[  309.538103] IMX274 8-001a: imx274_set_frame_length error = -121
[  309.544102] IMX274 8-001a: imx274_set_frame_interval error = -121
[  309.550243] IMX274 8-001a: s_stream failed
[  314.025561] IMX274 8-001a: s_stream failed
[  329.025586] IMX274 8-001a: s_stream failed
[  340.529567] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 303a = f0c (2 bytes)
[  340.538009] IMX274 8-001a: s_stream failed
[  347.525627] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f6 = 107 (2 bytes)
[  347.534008] IMX274 8-001a: s_stream failed
[  365.033640] IMX274 8-001a: s_stream failed
[  437.525788] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 3038 = c (2 bytes)
[  437.533997] IMX274 8-001a: s_stream failed
[  456.029780] IMX274 8-001a: s_stream failed
[  472.025862] IMX274 8-001a: s_stream failed
[  498.025861] IMX274 8-001a: s_stream failed
[  500.025905] IMX274 8-001a: s_stream failed

where v4l2-ctl returns:

                VIDIOC_STREAMON returned -1 (Remote I/O error)

I don't see this with the imx219.

I also see this occasionally:

[Fri Jul 17 12:51:42 2020] video4linux video1: failed to run capture start kthread: -4

Something is not stable here.

Regards,

	Hans

> 
> 
> Delta between patch versions:
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
> Sowjanya Komatineni (18):
>   dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>     power-domains
>   arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
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
>   gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>   gpu: host1x: mipi: Use readl_relaxed_poll_timeout in tegra_mipi_wait
>   gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>   media: tegra-video: Add CSI MIPI pads calibration
>   media: tegra-video: Compute settle times based on the clock rate
> 
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>  drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>  drivers/gpu/host1x/mipi.c                          |  37 +-
>  drivers/i2c/busses/i2c-tegra.c                     | 101 +--
>  drivers/staging/media/tegra-video/Kconfig          |   7 +
>  drivers/staging/media/tegra-video/csi.c            | 247 ++++++-
>  drivers/staging/media/tegra-video/csi.h            |   8 +
>  drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>  drivers/staging/media/tegra-video/vi.c             | 793 +++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h             |  25 +-
>  drivers/staging/media/tegra-video/video.c          |  23 +-
>  include/linux/host1x.h                             |   4 +-
>  14 files changed, 1242 insertions(+), 154 deletions(-)
> 

