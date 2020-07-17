Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAA4224186
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 19:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgGQRIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 13:08:48 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42495 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726938AbgGQRIs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 13:08:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id wTqjjYlvOyPEdwTqmj5cLp; Fri, 17 Jul 2020 19:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595005725; bh=ApOs8h9kU+UTFe8B1nLcj9Ymq5XtVxCN3wWSgVQTmG4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DLL62Ttm2JZvs66xt33qYP1XbaMBp/lGoYkcn+N0bEovIWHfjMum4T0M9aGPiuP1d
         y+QvRItSCgkJzI1fTW8EKGsGhwhxLMToDK4rorAzmChfu/z/a/U5zSh2QAR37UVWLN
         t74eBu03o6ZjLum9MK7Zq5sywJX5gft/ttlWJsgfwFWqcJe8lrDnlOmHFuWdGTRyHQ
         vHL2COGz/a1qTEzlz+sAnNmq8Sutt7Zr9dud3qOgH5Tt0va4hOEjs/LXIzozr7sIG2
         wxzvcSnIyS0g4zaz64qKHH8w1s6sqa748f8SqSbAp7FitP9ppziEwRWjAftZk09i2b
         E+cwBVTA7lMAA==
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
 <f03bdb89-df7c-e9e8-1512-d57e5d2332bf@xs4all.nl>
 <d258fb56-14f6-a091-64e9-48294073c696@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <458db01d-3c9c-1aec-0d28-edcbf0265aa4@xs4all.nl>
Date:   Fri, 17 Jul 2020 19:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d258fb56-14f6-a091-64e9-48294073c696@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGVq1Fw8bGGRbXmObvdDwWdi7iGgCESaSLxc/OwFM26Fo8M/PVEh0XTWucY8WYH2T4Nv78nTkSbOaM9nVDDxoqRHbNzgAGB6kt7qqf1Zv1MI7SIbqAf5
 H4mpXe364EKsxC3g/l5XoBtzFdnYsgCEfhjt96glEJEXbBYOrwyZEjiAScpbH0lXI17fvPh3SX6mafaR2CmwXk+WNQBrxkCx2LQOSM4mSI9/4u4E+6yCBtzn
 C5fE3l+z+jPhnxhADEAMj08mwxkoifowQNJUS1x1o0UGz4IY4oC+3dJXmuGwna9JUhrCt/HmYlzLQfJDzdZoE97WNKaXeTM+0RUXwSarWn5MxAsN8O/1z1PJ
 tYV70wABQ3oz2ZVE2MbS31AK43KfFdMuxwJDNVxgz1KCpVPzI7fOlBqG87++6QX9RDd444ELVYaExcFWp5+VI9naEdwQsuE04PfcIYaMZ3IITeRdRnKFUk0L
 qpi4sbONrcpn8u+RrP4LImt+TI5G9T0GvvIs7/+FUlkaqpqRCyVwhgZBga7C5d7J9WOpbgu6C8L//FGvqbfNPdZz03fkMLbYpPFaciTAy+6+u68OT1I/ptnT
 6kmRiVO7HIqfAqrtKFp9J9RmlK3Z8vSknoJS6elAph6E35h0xk5PCjSuNUAMFkUq6gY15bRm42VjttHYFy9NUI8K
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/07/2020 18:34, Sowjanya Komatineni wrote:
> 
> On 7/17/20 3:54 AM, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 15/07/2020 06:20, Sowjanya Komatineni wrote:
>>> This series adds support for video capture from external camera sensor to
>>> Tegra video driver.
>>>
>>> Jetson TX1 has camera expansion connector and supports custom camera module
>>> designed as per TX1 design specification.
>>>
>>> This series also enables camera capture support for Jetson Nano which has
>>> Raspberry PI camera header.
>>>
>>> This series is tested with IMX219 camera sensor.
>>>
>>> This series include,
>>>
>>> VI I2C related fixes
>>> - Camera sensor programming happens through VI I2C which is on host1x bus.
>>> - These patches includes device tree and I2C driver fixes for VI I2C.
>>>
>>> Tegra video driver updates
>>> - TPG Vs Non-TPG based on Kconfig
>>> - Support for external sensor video capture based on device graph from DT.
>>> - Support for selection ioctl operations
>>> - Tegra MIPI CSI pads calibration
>>> - CSI T-CLK and T-HS settle time computation based on clock rates.
>>>
>>> Host1x driver updates
>>> - Adds API to allow creating mipi device for specific device node.
>>> - Splits MIPI pads calibrate start and waiting for calibration to be done.
>>>
>>> Device tree updates
>>> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
>>> - Enabled VI and CSI support in Jetson Nano DT.
>> I'm doing a bit of stress testing with:
>>
>> while true; do v4l2-ctl --stream-mmap --stream-count=1; done
>>
>> and I see that the imx274 has often streaming failures:
>>
>> [  172.025144] IMX274 8-001a: s_stream failed
>> [  179.025192] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 3132 = 870 (2 bytes)
>> [  179.033575] IMX274 8-001a: s_stream failed
>> [  226.525378] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 3130 = 878 (2 bytes)
>> [  226.533761] IMX274 8-001a: s_stream failed
>> [  227.029325] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f6 = 107 (2 bytes)
>> [  227.037758] IMX274 8-001a: s_stream failed
>> [  247.025218] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f6 = 107 (2 bytes)
>> [  247.033658] IMX274 8-001a: s_stream failed
>> [  293.025517] IMX274 8-001a: s_stream failed
>> [  309.024727] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30e0 = 0 (2 bytes)
>> [  309.032969] IMX274 8-001a: s_stream failed
>> [  309.529506] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f8 = 11d2 (3 bytes)
>> [  309.538103] IMX274 8-001a: imx274_set_frame_length error = -121
>> [  309.544102] IMX274 8-001a: imx274_set_frame_interval error = -121
>> [  309.550243] IMX274 8-001a: s_stream failed
>> [  314.025561] IMX274 8-001a: s_stream failed
>> [  329.025586] IMX274 8-001a: s_stream failed
>> [  340.529567] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 303a = f0c (2 bytes)
>> [  340.538009] IMX274 8-001a: s_stream failed
>> [  347.525627] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 30f6 = 107 (2 bytes)
>> [  347.534008] IMX274 8-001a: s_stream failed
>> [  365.033640] IMX274 8-001a: s_stream failed
>> [  437.525788] IMX274 8-001a: imx274_write_mbreg : i2c bulk write failed, 3038 = c (2 bytes)
>> [  437.533997] IMX274 8-001a: s_stream failed
>> [  456.029780] IMX274 8-001a: s_stream failed
>> [  472.025862] IMX274 8-001a: s_stream failed
>> [  498.025861] IMX274 8-001a: s_stream failed
>> [  500.025905] IMX274 8-001a: s_stream failed
>>
>> where v4l2-ctl returns:
>>
>>                  VIDIOC_STREAMON returned -1 (Remote I/O error)
>>
>> I don't see this with the imx219.
>>
>> I also see this occasionally:
>>
>> [Fri Jul 17 12:51:42 2020] video4linux video1: failed to run capture start kthread: -4
>>
>> Something is not stable here.
>>
>> Regards,
>>
>> 	Hans
> 
> Hi Hans,
> 
> Running the same single frame continuous loop for more than 2 hours now 
> and I don't see any failure.
> 
> Above failure shows i2c bulk writes to IMX274 failure due to which 
> s_stream also failed.
> 
> Not sure if its due to i2c mux in the path to sensor on your module 
> causing some issue when there is more i2c write traffic as we are doing 
> single stream in continuous loop. Also IMX219 does not show on your side 
> so something specific to IMX274 setup probably.

I'll take a closer look next week. Good to know that it works fine for you.

> 
> 
> Regarding kthread_run failure where kthread_run() returned -EINTR during 
> capture start thread, I always see this happen at the point of stopping 
> the continuous single stream while loop by pressing ctrl+c after few 
> loops of execution.

Hmm, if this is normal behavior, then should this message be a debug message
only? Or perhaps only show the message if the error code != EINTR.

Regards,

	Hans

> 
> while true; do v4l2-ctl --stream-mmap --stream-count=1; done
> 
> when we stop loop with ctrl+c, v4l2-ctl terminates but loop does not 
> terminate immediately and probably SIGKILLed  is seen prior to complete.
> 
> Using below can help to terminate loop as well when we stop ctrl-c and 
> with this I don't see any repro of EINTR error from kthread_run when run 
> in infinite loop.
> 
> while true; do ./v4l2-ctl --stream-mmap --stream-count=1 || break; done
> 
> 
> 
>>>
>>> Delta between patch versions:
>>>
>>> [v3]:	Includes v2 feedback
>>> 	- Uses separate helper function for retrieving remote csi subdevice
>>> 	  and source subdevice.
>>> 	- Added check for presence of subdevice ops set/get_selection
>>> 	- dropped vb2_queue_release from driver and using
>>> 	  vb2_video_unregister_device instead of video_unregister_device.
>>> 	- video device register should happen in the last after all video
>>> 	  device related setup is done in the driver. This is being addressed
>>> 	  in below RFC patch. Once proper implementation of this is available
>>> 	  will update Tegra video driver to use split APIs and do all setup
>>> 	  prior to device register. Added this as TODO in the driver.
>>> 	  https://www.spinics.net/lists/linux-media/msg172761.html
>>>
>>> 	Note:
>>> 	Patch-0012 has compilation dependency on
>>> 	https://patchwork.kernel.org/patch/11659521/
>>>
>>>
>>> [v2]:	Includes below changes based on v1 feedback
>>> 	- dt-binding document and the driver update for device graph to use
>>> 	  separate ports for sink endpoint and source endpoint for csi.
>>> 	- Use data-lanes endpoint property for csi.
>>> 	- Update tegra_mipi_request() to take device node pointer argument
>>> 	  rather than adding extra API.
>>> 	- Remove checking for clk pointer before clk_disable.
>>>
>>>
>>> Sowjanya Komatineni (18):
>>>    dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>>>      power-domains
>>>    arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
>>>    i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>>>    i2c: tegra: Remove NULL pointer check before
>>>      clk_enable/disable/prepare/unprepare
>>>    i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>>>    i2c: tegra: Fix runtime resume to re-init VI I2C
>>>    i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>>>    media: tegra-video: Fix channel format alignment
>>>    media: tegra-video: Enable TPG based on kernel config
>>>    media: tegra-video: Update format lookup to offset based
>>>    dt-bindings: tegra: Update VI and CSI bindings with port info
>>>    media: tegra-video: Add support for external sensor capture
>>>    media: tegra-video: Add support for selection ioctl ops
>>>    gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>>>    gpu: host1x: mipi: Use readl_relaxed_poll_timeout in tegra_mipi_wait
>>>    gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>>>    media: tegra-video: Add CSI MIPI pads calibration
>>>    media: tegra-video: Compute settle times based on the clock rate
>>>
>>>   .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>>>   .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>>>   drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>>>   drivers/gpu/host1x/mipi.c                          |  37 +-
>>>   drivers/i2c/busses/i2c-tegra.c                     | 101 +--
>>>   drivers/staging/media/tegra-video/Kconfig          |   7 +
>>>   drivers/staging/media/tegra-video/csi.c            | 247 ++++++-
>>>   drivers/staging/media/tegra-video/csi.h            |   8 +
>>>   drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>>>   drivers/staging/media/tegra-video/vi.c             | 793 +++++++++++++++++++--
>>>   drivers/staging/media/tegra-video/vi.h             |  25 +-
>>>   drivers/staging/media/tegra-video/video.c          |  23 +-
>>>   include/linux/host1x.h                             |   4 +-
>>>   14 files changed, 1242 insertions(+), 154 deletions(-)
>>>

