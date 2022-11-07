Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9AF861EE63
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 10:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiKGJLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 04:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbiKGJLi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 04:11:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC2717078;
        Mon,  7 Nov 2022 01:11:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9075B60F61;
        Mon,  7 Nov 2022 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BDDC433B5;
        Mon,  7 Nov 2022 09:11:31 +0000 (UTC)
Message-ID: <66518e88-5193-cf21-f2b9-869ee6a1024f@xs4all.nl>
Date:   Mon, 7 Nov 2022 10:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
 <20221018140338.7080-3-tumic@gpxsee.org>
 <4ec93bdd-8b3d-2e3c-a7d7-7f3cd12520e7@xs4all.nl>
 <8023f2f5-638d-e83f-ea27-d135202725f3@gpxsee.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 2/2] Added Digiteq Automotive MGB4 driver
In-Reply-To: <8023f2f5-638d-e83f-ea27-d135202725f3@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Martin,

On 04/11/2022 15:41, Martin Tůma wrote:
> On 04. 11. 22 12:14, Hans Verkuil wrote:
>> On 18/10/2022 16:03, tumic@gpxsee.org wrote:
>>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>
>>> Digiteq Automotive MGB4 is a modular frame grabber PCIe card for automotive
>>> video interfaces. As for now, two modules - FPD-Link and GMSL - are
>>> available and supported by the driver. The card has two inputs and two
>>> outputs (FPD-Link only).
>>>
>>> In addition to the video interfaces it also provides a trigger signal
>>> interface and a MTD interface for FPGA firmware upload.
>>>
>>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>> ---
>>>   Documentation/admin-guide/media/mgb4.rst      | 342 ++++++++
>>>   .../admin-guide/media/pci-cardlist.rst        |   1 +
>>>   .../admin-guide/media/v4l-drivers.rst         |   1 +
>>>   MAINTAINERS                                   |   7 +
>>>   drivers/media/pci/Kconfig                     |   1 +
>>>   drivers/media/pci/Makefile                    |   1 +
>>>   drivers/media/pci/mgb4/Kconfig                |  17 +
>>>   drivers/media/pci/mgb4/Makefile               |   6 +
>>>   drivers/media/pci/mgb4/mgb4_cmt.c             | 243 ++++++
>>>   drivers/media/pci/mgb4/mgb4_cmt.h             |  16 +
>>>   drivers/media/pci/mgb4/mgb4_core.c            | 628 +++++++++++++++
>>>   drivers/media/pci/mgb4/mgb4_core.h            |  65 ++
>>>   drivers/media/pci/mgb4/mgb4_dma.c             | 120 +++
>>>   drivers/media/pci/mgb4/mgb4_dma.h             |  18 +
>>>   drivers/media/pci/mgb4/mgb4_i2c.c             | 139 ++++
>>>   drivers/media/pci/mgb4/mgb4_i2c.h             |  35 +
>>>   drivers/media/pci/mgb4/mgb4_io.h              |  36 +
>>>   drivers/media/pci/mgb4/mgb4_regs.c            |  30 +
>>>   drivers/media/pci/mgb4/mgb4_regs.h            |  35 +
>>>   drivers/media/pci/mgb4/mgb4_sysfs.h           |  18 +
>>>   drivers/media/pci/mgb4/mgb4_sysfs_in.c        | 750 ++++++++++++++++++
>>>   drivers/media/pci/mgb4/mgb4_sysfs_out.c       | 734 +++++++++++++++++
>>>   drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |  83 ++
>>>   drivers/media/pci/mgb4/mgb4_trigger.c         | 203 +++++
>>>   drivers/media/pci/mgb4/mgb4_trigger.h         |   8 +
>>>   drivers/media/pci/mgb4/mgb4_vin.c             | 665 ++++++++++++++++
>>>   drivers/media/pci/mgb4/mgb4_vin.h             |  64 ++
>>>   drivers/media/pci/mgb4/mgb4_vout.c            | 507 ++++++++++++
>>>   drivers/media/pci/mgb4/mgb4_vout.h            |  58 ++
>>>   29 files changed, 4831 insertions(+)
>>>   create mode 100644 Documentation/admin-guide/media/mgb4.rst
>>>   create mode 100644 drivers/media/pci/mgb4/Kconfig
>>>   create mode 100644 drivers/media/pci/mgb4/Makefile
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_dma.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_dma.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
>>>   create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
>>>

<snip>

>>> diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
>>> new file mode 100644
>>> index 000000000000..3ec394e46bd0
>>> --- /dev/null
>>> +++ b/drivers/media/pci/mgb4/mgb4_cmt.c
>>> @@ -0,0 +1,243 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2021-2022 Digiteq Automotive
>>> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
>>> + */
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/kernel.h>
>>> +#include "mgb4_core.h"
>>> +#include "mgb4_cmt.h"
>>> +
>>
>> Erm, what is CMT and where do the values in the tables below come from?
>>
> 
> The CMT table is used to set up some FPGA PLL related registers. For different video signal frequencies (FPGA input signal frequencies), the FPGA PLL stuff needs to be adjusted to work properly. The
> values are precomputed based on some formulas given by Xilinx in their FPGA documentation and those formulas are in turn full of some magic values/tables. So the answer to your question is that no one
> (not even our HW engineer writing the VHDL code...) really knows where these values exactly come from, but they have to be set for the FPGA to work properly with the given video signal.

OK, that will be good to document. And what does the abbreviation 'CMT' stand for?

<snip>

>>> +u32 mgb4_cmt_set_vout(struct mgb4_vout_dev *voutdev, unsigned int freq)
>>> +{
>>> +    const uint16_t *reg_set;
>>> +    const uint32_t *addr;
>>> +    u32 config;
>>> +    size_t i, index;
>>> +
>>> +    index = freq_srch(freq, cmt_freq, ARRAY_SIZE(cmt_freq));
>>> +    addr = cmt_addrs_out[voutdev->config->id];
>>> +    reg_set = cmt_vals_out[index];
>>> +
>>> +    config = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.config);
>>> +
>>> +    mgb4_write_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
>>> +      0x1 | (config & ~0x3));
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(cmt_addrs_out[0]); i++)
>>> +        mgb4_write_reg(&voutdev->mgbdev->cmt, addr[i], reg_set[i]);
>>> +
>>> +    mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
>>> +      0x100, 0x100);
>>> +    mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
>>> +      0x100, 0x0);
>>> +
>>> +    mgb4_write_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
>>> +      config & ~0x1);
>>> +
>>> +    return cmt_freq[index];
>>> +}
>>
>> I'm pretty certain that you didn't run 'checkpatch.pl --strict' over this patch.
>> Please do so for v4!
>>
> 
> I have run 'checkpatch.pl' without '--strict' over this patch and ignored all the "too long lines" warnings on the tables as I think they are more clear this way, and all the "change name suggestion"
> warnings as they are IMHO wrong in this case. Other warnings did not come up. I will try it with '--strict' when I post v4 patch.

Yes please, the media subsystem uses the --strict option.

> 
>>> +
>>> +void mgb4_cmt_set_vin(struct mgb4_vin_dev *vindev, unsigned int freq_range)
>>> +{
>>> +    const uint16_t *reg_set;
>>> +    const uint32_t *addr;
>>> +    u32 config;
>>> +    size_t i;
>>> +
>>> +    addr = cmt_addrs_in[vindev->config->id];
>>> +    reg_set = cmt_vals_in[freq_range];
>>> +
>>> +    config = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.config);
>>> +
>>> +    mgb4_write_reg(&vindev->mgbdev->video, vindev->config->regs.config,
>>> +      0x1 | (config & ~0x3));
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(cmt_addrs_in[0]); i++)
>>> +        mgb4_write_reg(&vindev->mgbdev->cmt, addr[i], reg_set[i]);
>>> +
>>> +    mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
>>> +      0x1000, 0x1000);
>>> +    mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
>>> +      0x1000, 0x0);
>>> +
>>> +    mgb4_write_reg(&vindev->mgbdev->video, vindev->config->regs.config,
>>> +      config & ~0x1);
>>> +}

<snip>

>>> +static int fh_open(struct file *file)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +    struct mgb4_regs *video = &vindev->mgbdev->video;
>>> +    u32 resolution, padding;
>>> +    int ret, irq;
>>> +
>>> +    ret = v4l2_fh_open(file);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    resolution = mgb4_read_reg(video, vindev->config->regs.resolution);
>>> +    if (resolution >= ERR_NO_REG)
>>> +        goto error;
>>> +
>>> +    vindev->width = resolution >> 16;
>>> +    vindev->height = resolution & 0xFFFF;
>>> +    if (!vindev->width || !vindev->height)
>>> +        goto error;
>>> +
>>> +    irq = xdma_get_user_irq(vindev->mgbdev->xdev, vindev->config->err_irq);
>>> +    xdma_enable_user_irq(vindev->mgbdev->xdev, irq);
>>> +
>>> +    vindev->period = mgb4_read_reg(video, vindev->config->regs.frame_period);
>>> +
>>> +    padding = PADDING(vindev->width, vindev->alignment);
>>> +    mgb4_write_reg(video, vindev->config->regs.padding, padding);
>>> +    set_loopback_padding(vindev, padding);
>>
>> This doesn't look right. Just opening a video device shouldn't cause
>> any state changes, and that's what it looks is happening here.
>>
>> I.e., if I just want to query the device (v4l2-ctl --all), then that
>> shouldn't not change anything.
>>
> 
> The MGB4 card is quiet special in this case. Unlike in "normal" cameras, the video signal may change over time as the user can connect different video sources to the card. This is why I set up some
> video signal related stuff in the open() call. When you open the device, you "configure" it for the current video signal and the signal is then expected not to change until the device is closed (such
> change will not break the driver, but will break the image). Additionally, the open() call must fail, when there is no signal connected to the card.
> 
> If you have some suggestions how to handle this "dynamic" behaviour in a different way (properly?) then I'm open to them. But the fact, that even the video resolution can change at any arbitrary time
> will IMHO always lead to some "workarounds" like this one in the open() call.

This is not special. We support HDMI receivers today as well which have exactly the same behavior.

Typically the way this works is that such drivers support the Digital Video Timings ioctls
(VIDIOC_ENUM_DV_TIMINGS, VIDIOC_DV_TIMINGS_CAP, VIDIOC_G/S/QUERY_DV_TIMINGS). The driver
stores the current timings as set by userspace (and initialized to something at probe() time
by the driver), but typically userspace will query the actual detected timings, then set them.

Next it will allocate buffers, which will fix the timings. E.g. an attempt to set new timings
will fail with -EBUSY. If the hardware detects a format change, then it will raise the
V4L2_EVENT_SOURCE_CHANGE event and call vb2_queue_error() to stop streaming.

Userspace detects that, stops streaming, frees buffers, and calls QUERY_DV_TIMINGS again to
get the new timings.

Key here is that the timings are locked when you allocate buffers (vb2_is_busy() will return
true at that time). Buffers are allocated based on the framesize, which is based on the timings,
so if timings change, then buffers typically need to be reallocated.

Search for these ioctls to see how other drivers do this.

> 
>>> +
>>> +    return 0;
>>> +
>>> +error:
>>> +    v4l2_fh_release(file);
>>> +    return -EIO;
>>> +}
>>> +
>>> +static int fh_release(struct file *file)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +    struct mgb4_regs *video = &vindev->mgbdev->video;
>>> +    int irq = xdma_get_user_irq(vindev->mgbdev->xdev, vindev->config->err_irq);
>>> +
>>> +    xdma_disable_user_irq(vindev->mgbdev->xdev, irq);
>>> +
>>> +    mgb4_write_reg(video, vindev->config->regs.padding, 0);
>>> +    set_loopback_padding(vindev, 0);
>>> +
>>> +    return vb2_fop_release(file);
>>> +}
>>
>> This looks wrong too: if I am streaming video, then in another shell
>> I call 'v4l2-ctl -D' then when v4l2-ctl closes the video device this will disable
>> the user irq, presumably stopping the video streaming.
>>
> 
> Maybe there is some "is_streaming()" check missing. I will rethink the open/close logic. There may be some better solution, but due to the "dynamic" video signal, there will IMHO still be some
> constrains...
> 
>>> +
>>> +static const struct v4l2_file_operations video_fops = {
>>> +    .owner = THIS_MODULE,
>>> +    .open = fh_open,
>>> +    .release = fh_release,
>>> +    .unlocked_ioctl = video_ioctl2,
>>> +    .read = vb2_fop_read,
>>> +    .mmap = vb2_fop_mmap,
>>> +    .poll = vb2_fop_poll,
>>> +};
>>> +
>>> +static int vidioc_querycap(struct file *file, void *priv,
>>> +               struct v4l2_capability *cap)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +
>>> +    strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
>>> +    strscpy(cap->card, "MGB4 PCIe Card", sizeof(cap->card));
>>> +    snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
>>> +      pci_name(vindev->mgbdev->pdev));
>>
>> No need to set bus_info, recently the v4l2-core added support for
>> that. See v4l_querycap in v4l2-ioctl.c.
>>
> 
> Ok.
> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_enum_fmt(struct file *file, void *priv,
>>> +               struct v4l2_fmtdesc *f)
>>> +{
>>> +    if (f->index != 0)
>>> +        return -EINVAL;
>>> +
>>> +    f->pixelformat = V4L2_PIX_FMT_ABGR32;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_enum_frameintervals(struct file *file, void *priv,
>>> +                      struct v4l2_frmivalenum *ival)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +
>>> +    if (ival->index != 0)
>>> +        return -EINVAL;
>>> +    if (ival->pixel_format != V4L2_PIX_FMT_ABGR32)
>>> +        return -EINVAL;
>>> +    if (ival->width != vindev->width || ival->height != vindev->height)
>>> +        return -EINVAL;
>>> +
>>> +    ival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
>>> +    ival->discrete.numerator = vindev->period;
>>> +    ival->discrete.denominator = 125000000;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +
>>> +    f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
>>> +    f->fmt.pix.width = vindev->width;
>>> +    f->fmt.pix.height = vindev->height;
>>> +    f->fmt.pix.field = V4L2_FIELD_NONE;
>>> +    f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
>>> +    f->fmt.pix.bytesperline = BYTESPERLINE(vindev->width, vindev->alignment);
>>> +    f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_enum_input(struct file *file, void *priv,
>>> +                 struct v4l2_input *i)
>>> +{
>>> +    if (i->index != 0)
>>> +        return -EINVAL;
>>> +
>>> +    i->type = V4L2_INPUT_TYPE_CAMERA;
>>> +    strscpy(i->name, "MGB4", sizeof(i->name));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_enum_framesizes(struct file *file, void *fh,
>>> +                  struct v4l2_frmsizeenum *fsize)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +
>>> +    if (fsize->index != 0 || fsize->pixel_format != V4L2_PIX_FMT_ABGR32)
>>> +        return -EINVAL;
>>> +
>>> +    fsize->discrete.width = vindev->width;
>>> +    fsize->discrete.height = vindev->height;
>>> +    fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
>>> +{
>>> +    return (i == 0) ? 0 : -EINVAL;
>>> +}
>>> +
>>> +static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
>>> +{
>>> +    *i = 0;
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_queryctrl(struct file *file, void *priv,
>>> +                struct v4l2_queryctrl *qc)
>>> +{
>>> +    return -EINVAL;
>>> +}
>>
>> Huh? Why is this needed?
>>
> 
> I think this was required to "silence" some v4l2-compliance tool warnings/errors. I will recheck this.

If there are warnings/errors with the latest v4l2-compliance, then let me know.
It would be a bug in the compliance tool.

> 
>>> +
>>> +static int vidioc_parm(struct file *file, void *priv,
>>> +             struct v4l2_streamparm *parm)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = video_drvdata(file);
>>> +    struct v4l2_fract timeperframe = {
>>> +        .numerator = vindev->period,
>>> +        .denominator = 125000000,
>>> +    };
>>> +
>>> +    if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>> +        return -EINVAL;
>>> +
>>> +    parm->parm.capture.readbuffers = 2;
>>> +    parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
>>> +    parm->parm.capture.timeperframe = timeperframe;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct v4l2_ioctl_ops video_ioctl_ops = {
>>> +    .vidioc_querycap = vidioc_querycap,
>>> +    .vidioc_enum_fmt_vid_cap = vidioc_enum_fmt,
>>> +    .vidioc_try_fmt_vid_cap = vidioc_fmt,
>>> +    .vidioc_s_fmt_vid_cap = vidioc_fmt,
>>> +    .vidioc_g_fmt_vid_cap = vidioc_fmt,
>>> +    .vidioc_enum_framesizes = vidioc_enum_framesizes,
>>> +    .vidioc_enum_frameintervals = vidioc_enum_frameintervals,
>>> +    .vidioc_enum_input = vidioc_enum_input,
>>> +    .vidioc_g_input = vidioc_g_input,
>>> +    .vidioc_s_input = vidioc_s_input,
>>> +    .vidioc_queryctrl = vidioc_queryctrl,
>>> +    .vidioc_reqbufs = vb2_ioctl_reqbufs,
>>> +    .vidioc_create_bufs = vb2_ioctl_create_bufs,
>>> +    .vidioc_querybuf = vb2_ioctl_querybuf,
>>> +    .vidioc_qbuf = vb2_ioctl_qbuf,
>>> +    .vidioc_dqbuf = vb2_ioctl_dqbuf,
>>
>> I'm missing vidioc_prepare_buf.
>>
> 
> Ok, will add it.
> 
>>> +    .vidioc_expbuf = vb2_ioctl_expbuf,
>>> +    .vidioc_streamon = vb2_ioctl_streamon,
>>> +    .vidioc_streamoff = vb2_ioctl_streamoff,
>>> +    .vidioc_g_parm = vidioc_parm,
>>> +    .vidioc_s_parm = vidioc_parm
>>> +};
>>> +
>>> +static void dma_transfer(struct work_struct *work)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = container_of(work, struct mgb4_vin_dev, dma_work);
>>> +    struct device *dev = &vindev->mgbdev->pdev->dev;
>>> +    struct frame_buffer *buf = 0;
>>> +    unsigned long flags;
>>> +    u32 addr;
>>> +
>>> +
>>> +    spin_lock_irqsave(&vindev->qlock, flags);
>>> +    if (!list_empty(&vindev->buf_list)) {
>>> +        buf = list_first_entry(&vindev->buf_list, struct frame_buffer, list);
>>> +        list_del_init(vindev->buf_list.next);
>>> +    }
>>> +    spin_unlock_irqrestore(&vindev->qlock, flags);
>>> +
>>> +    if (!buf)
>>> +        return;
>>> +
>>> +
>>> +    addr = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.address);
>>> +    if (addr >= ERR_QUEUE_FULL) {
>>> +        dev_warn(dev, "frame queue error (%d)\n", (int)addr);
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +        return;
>>> +    }
>>> +
>>> +    if (mgb4_dma_transfer(vindev->mgbdev, vindev->config->dma_channel,
>>> +      false, addr, vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0)) < 0) {
>>> +        dev_warn(dev, "DMA transfer error\n");
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +    } else {
>>> +        buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>> +        buf->vb.sequence = vindev->sequence++;
>>> +        buf->vb.field = V4L2_FIELD_NONE;
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +    }
>>> +}
>>> +
>>> +static irqreturn_t vin_handler(int irq, void *ctx)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = (struct mgb4_vin_dev *)ctx;
>>> +
>>> +    schedule_work(&vindev->dma_work);
>>> +
>>> +    mgb4_write_reg(&vindev->mgbdev->video, 0xB4, 1U<<vindev->config->vin_irq);
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>>> +static irqreturn_t err_handler(int irq, void *ctx)
>>> +{
>>> +    struct mgb4_vin_dev *vindev = (struct mgb4_vin_dev *)ctx;
>>> +    struct device *dev = &vindev->mgbdev->pdev->dev;
>>> +    struct vb2_queue *vq = &(vindev->queue);
>>> +
>>> +    u32 resolution = mgb4_read_reg(&vindev->mgbdev->video,
>>> +      vindev->config->regs.resolution);
>>> +
>>> +    if ((vindev->width != (resolution >> 16))
>>> +      || (vindev->height != (resolution & 0xFFFF))) {
>>> +        dev_warn(dev, "stream changed (%ux%u -> %ux%u)\n",
>>> +             vindev->width, vindev->height, resolution>>16,
>>> +             resolution & 0xFFFF);
>>> +
>>> +        if (vb2_is_streaming(vq)) {
>>> +            return_all_buffers(vindev, VB2_BUF_STATE_ERROR);
>>> +            vb2_queue_error(vq);
>>> +        }
>>> +    }
>>> +
>>> +    mgb4_write_reg(&vindev->mgbdev->video, 0xB4, 1U<<vindev->config->err_irq);
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int deser_init(struct mgb4_vin_dev *vindev, int id)
>>> +{
>>> +    int rv, addr_size;
>>> +    size_t values_count;
>>> +    const struct mgb4_i2c_kv *values;
>>> +    const struct i2c_board_info *info;
>>> +    struct device *dev = &vindev->mgbdev->pdev->dev;
>>> +
>>> +
>>> +    if (MGB4_IS_GMSL(vindev->mgbdev)) {
>>> +        info = &gmsl_deser_info[id];
>>> +        addr_size = 16;
>>> +        values = gmsl_i2c;
>>> +        values_count = ARRAY_SIZE(gmsl_i2c);
>>> +    } else {
>>> +        info = &fpdl3_deser_info[id];
>>> +        addr_size = 8;
>>> +        values = fpdl3_i2c;
>>> +        values_count = ARRAY_SIZE(fpdl3_i2c);
>>> +    }
>>> +
>>> +    rv = mgb4_i2c_init(&vindev->deser, vindev->mgbdev->i2c_adap, info, addr_size);
>>> +    if (rv < 0) {
>>> +        dev_err(dev, "failed to create deserializer\n");
>>> +        return rv;
>>> +    }
>>> +    rv = mgb4_i2c_configure(&vindev->deser, values, values_count);
>>> +    if (rv < 0) {
>>> +        dev_err(dev, "failed to configure deserializer\n");
>>> +        goto err_i2c_dev;
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +err_i2c_dev:
>>> +    mgb4_i2c_free(&vindev->deser);
>>> +
>>> +    return rv;
>>> +}
>>> +
>>> +struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
>>> +{
>>> +    int rv;
>>> +    struct device_attribute **attr, **module_attr;
>>> +    struct mgb4_vin_dev *vindev;
>>> +    struct pci_dev *pdev = mgbdev->pdev;
>>> +    struct device *dev = &pdev->dev;
>>> +    int vin_irq, err_irq;
>>> +
>>> +    vindev = kzalloc(sizeof(struct mgb4_vin_dev), GFP_KERNEL);
>>> +    if (!vindev)
>>> +        return NULL;
>>> +
>>> +    vindev->mgbdev = mgbdev;
>>> +    vindev->config = &(vin_cfg[id]);
>>> +
>>> +    /* Frame queue*/
>>> +    INIT_LIST_HEAD(&vindev->buf_list);
>>> +    spin_lock_init(&vindev->qlock);
>>> +
>>> +    /* DMA transfer stuff */
>>> +    INIT_WORK(&vindev->dma_work, dma_transfer);
>>> +
>>> +    /* IRQ callback */
>>> +    vin_irq = xdma_get_user_irq(mgbdev->xdev, vindev->config->vin_irq);
>>> +    rv = request_irq(vin_irq, vin_handler, 0, "mgb4-vin", vindev);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register vin irq handler\n");
>>> +        goto err_alloc;
>>> +    }
>>> +    /* Error IRQ callback */
>>> +    err_irq = xdma_get_user_irq(mgbdev->xdev, vindev->config->err_irq);
>>> +    rv = request_irq(err_irq, err_handler, 0, "mgb4-err", vindev);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register err irq handler\n");
>>> +        goto err_vin_irq;
>>> +    }
>>> +
>>> +    /* V4L2 */
>>> +    rv = v4l2_device_register(dev, &vindev->v4l2dev);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register v4l2 device\n");
>>> +        goto err_err_irq;
>>> +    }
>>> +
>>> +    mutex_init(&vindev->lock);
>>> +
>>> +    vindev->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>> +    vindev->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
>>
>> Please drop USERPTR: it's not something modern drivers should enable.
> 
> Ok.
> 
>>
>>> +    vindev->queue.buf_struct_size = sizeof(struct frame_buffer);
>>> +    vindev->queue.ops = &queue_ops;
>>> +    vindev->queue.mem_ops = &vb2_dma_sg_memops;
>>> +    vindev->queue.gfp_flags = GFP_DMA32;
>>
>> Is the DMA indeed only 32 bits? It's a bit unexpected.
>>
> 
> The addresses used by the card are 32b. But maybe this is not what this constraint means and it can be removed. I will check this.

Most modern hardware has either 64 bit DMA support or an iommu. If it is
truly 32 bit DMA only, then this is OK.

> 
>>> +    vindev->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>> +    vindev->queue.min_buffers_needed = 2;
>>> +    vindev->queue.drv_priv = vindev;
>>> +    vindev->queue.lock = &vindev->lock;
>>> +    vindev->queue.dev = dev;
>>> +    rv = vb2_queue_init(&vindev->queue);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to initialize vb2 queue\n");
>>> +        goto err_v4l2_dev;
>>> +    }
>>> +
>>> +    snprintf(vindev->vdev.name, sizeof(vindev->vdev.name), "mgb4-in%d", id+1);
>>> +    vindev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE
>>> +      | V4L2_CAP_STREAMING;
>>> +    vindev->vdev.fops = &video_fops;
>>> +    vindev->vdev.ioctl_ops = &video_ioctl_ops;
>>> +    vindev->vdev.release = video_device_release_empty;
>>> +    vindev->vdev.v4l2_dev = &vindev->v4l2dev;
>>> +    vindev->vdev.lock = &vindev->lock;
>>> +    vindev->vdev.queue = &vindev->queue;
>>> +    video_set_drvdata(&vindev->vdev, vindev);
>>> +
>>> +    rv = video_register_device(&vindev->vdev, VFL_TYPE_GRABBER, -1);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register video device\n");
>>> +        goto err_v4l2_dev;
>>> +    }
>>> +
>>> +    /* Deserializer */
>>> +    rv = deser_init(vindev, id);
>>> +    if (rv)
>>> +        goto err_video_dev;
>>> +
>>> +    /* Set FPGA regs to comply with the deserializer state */
>>> +    mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
>>> +      1U<<9, 1U<<9);
>>> +
>>> +    /* Module sysfs attributes */
>>> +    vindev->alignment = 1;
>>> +    module_attr = MGB4_IS_GMSL(mgbdev)
>>> +      ? mgb4_gmsl_in_attrs : mgb4_fpdl3_in_attrs;
>>> +    for (attr = module_attr; *attr; attr++)
>>> +        device_create_file(&vindev->vdev.dev, *attr);
>>> +
>>> +    return vindev;
>>> +
>>> +err_video_dev:
>>> +    video_unregister_device(&vindev->vdev);
>>> +err_v4l2_dev:
>>> +    v4l2_device_unregister(&vindev->v4l2dev);
>>> +err_err_irq:
>>> +    free_irq(err_irq, vindev);
>>> +err_vin_irq:
>>> +    free_irq(vin_irq, vindev);
>>> +err_alloc:
>>> +    kfree(vindev);
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +void mgb4_vin_free(struct mgb4_vin_dev *vindev)
>>> +{
>>> +    struct device_attribute **attr, **module_attr;
>>> +    int vin_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
>>> +                    vindev->config->vin_irq);
>>> +    int err_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
>>> +                    vindev->config->err_irq);
>>> +
>>> +    free_irq(vin_irq, vindev);
>>> +    free_irq(err_irq, vindev);
>>> +
>>> +    module_attr = MGB4_IS_GMSL(vindev->mgbdev)
>>> +      ? mgb4_gmsl_in_attrs : mgb4_fpdl3_in_attrs;
>>> +    for (attr = module_attr; *attr; attr++)
>>> +        device_remove_file(&vindev->vdev.dev, *attr);
>>> +
>>> +    mgb4_i2c_free(&vindev->deser);
>>> +    video_unregister_device(&vindev->vdev);
>>> +    v4l2_device_unregister(&vindev->v4l2dev);
>>> +
>>> +    kfree(vindev);
>>> +}
>>> diff --git a/drivers/media/pci/mgb4/mgb4_vin.h b/drivers/media/pci/mgb4/mgb4_vin.h
>>> new file mode 100644
>>> index 000000000000..4b01b61c3f90
>>> --- /dev/null
>>> +++ b/drivers/media/pci/mgb4/mgb4_vin.h
>>> @@ -0,0 +1,64 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2021-2022 Digiteq Automotive
>>> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
>>> + */
>>> +
>>> +#ifndef __MGB4_VIN_H__
>>> +#define __MGB4_VIN_H__
>>> +
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-dev.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/videobuf2-core.h>
>>> +#include "mgb4_i2c.h"
>>> +
>>> +struct mgb4_vin_regs {
>>> +    u32 address;
>>> +    u32 config;
>>> +    u32 status;
>>> +    u32 resolution;
>>> +    u32 frame_period;
>>> +    u32 sync;
>>> +    u32 pclk;
>>> +    u32 signal;
>>> +    u32 signal2;
>>> +    u32 padding;
>>> +};
>>> +
>>> +struct mgb4_vin_config {
>>> +    int id;
>>> +    int dma_channel;
>>> +    int vin_irq;
>>> +    int err_irq;
>>> +    struct mgb4_vin_regs regs;
>>> +};
>>> +
>>> +struct mgb4_vin_dev {
>>> +    struct mgb4_dev *mgbdev;
>>> +    struct v4l2_device v4l2dev;
>>> +    struct video_device vdev;
>>> +    struct vb2_queue queue;
>>> +    struct mutex lock;
>>> +
>>> +    spinlock_t qlock;
>>> +    struct list_head buf_list;
>>> +    struct work_struct dma_work;
>>> +
>>> +    unsigned int sequence;
>>> +
>>> +    u32 width;
>>> +    u32 height;
>>> +    u32 period;
>>> +    u32 freq_range;
>>> +    u32 alignment;
>>> +
>>> +    struct mgb4_i2c_client deser;
>>> +
>>> +    const struct mgb4_vin_config *config;
>>> +};
>>> +
>>> +extern struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id);
>>> +extern void mgb4_vin_free(struct mgb4_vin_dev *vindev);
>>> +
>>> +#endif
>>> diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
>>> new file mode 100644
>>> index 000000000000..542ff059c67f
>>> --- /dev/null
>>> +++ b/drivers/media/pci/mgb4/mgb4_vout.c
>>> @@ -0,0 +1,507 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2021-2022 Digiteq Automotive
>>> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
>>> + */
>>> +
>>> +#include <linux/pci.h>
>>> +#include <media/v4l2-ioctl.h>
>>> +#include <media/videobuf2-v4l2.h>
>>> +#include <media/videobuf2-dma-sg.h>
>>> +#include <linux/dma/amd_xdma.h>
>>> +#include "mgb4_core.h"
>>> +#include "mgb4_dma.h"
>>> +#include "mgb4_sysfs.h"
>>> +#include "mgb4_io.h"
>>> +#include "mgb4_vout.h"
>>> +
>>> +#define DEFAULT_WIDTH     1280
>>> +#define DEFAULT_HEIGHT    640
>>> +#define DEFAULT_PERIOD    (125000000 / 60)
>>> +
>>> +static const struct mgb4_vout_config vout_cfg[] = {
>>> +    {0, 0, 8, {0x78, 0x60, 0x64, 0x68, 0x74, 0x6C, 0x70, 0x7c}},
>>> +    {1, 1, 9, {0x98, 0x80, 0x84, 0x88, 0x94, 0x8c, 0x90, 0x9c}}
>>> +};
>>> +
>>> +static const struct i2c_board_info fpdl3_ser_info[] = {
>>> +    {I2C_BOARD_INFO("serializer1", 0x14)},
>>> +    {I2C_BOARD_INFO("serializer2", 0x16)},
>>> +};
>>> +
>>> +static const struct mgb4_i2c_kv fpdl3_i2c[] = {
>>> +    {0x05, 0xFF, 0x04}, {0x06, 0xFF, 0x01}, {0xC2, 0xFF, 0x80}
>>> +};
>>> +
>>> +static int queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
>>> +               unsigned int *nplanes, unsigned int sizes[],
>>> +               struct device *alloc_devs[])
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(q);
>>> +    unsigned long size = BYTESPERLINE(voutdev->width, voutdev->alignment)
>>> +      * voutdev->height;
>>> +
>>> +    if (*nbuffers < 2)
>>> +        *nbuffers = 2;
>>> +
>>> +    if (*nplanes)
>>> +        return sizes[0] < size ? -EINVAL : 0;
>>> +    *nplanes = 1;
>>> +    sizes[0] = size;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int buffer_init(struct vb2_buffer *vb)
>>> +{
>>> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> +    struct frame_buffer *buf = to_frame_buffer(vbuf);
>>> +
>>> +    INIT_LIST_HEAD(&buf->list);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int buffer_prepare(struct vb2_buffer *vb)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vb->vb2_queue);
>>> +    struct device *dev = &voutdev->mgbdev->pdev->dev;
>>> +    unsigned long size = BYTESPERLINE(voutdev->width, voutdev->alignment)
>>> +      * voutdev->height;
>>> +
>>> +    if (vb2_plane_size(vb, 0) < size) {
>>> +        dev_err(dev, "buffer too small (%lu < %lu)\n",
>>> +            vb2_plane_size(vb, 0), size);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    vb2_set_plane_payload(vb, 0, size);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void buffer_queue(struct vb2_buffer *vb)
>>> +{
>>> +    struct mgb4_vout_dev *vindev = vb2_get_drv_priv(vb->vb2_queue);
>>> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> +    struct frame_buffer *buf = to_frame_buffer(vbuf);
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&vindev->qlock, flags);
>>> +    list_add_tail(&buf->list, &vindev->buf_list);
>>> +    spin_unlock_irqrestore(&vindev->qlock, flags);
>>> +}
>>> +
>>> +static void stop_streaming(struct vb2_queue *vq)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vq);
>>> +    struct frame_buffer *buf, *node;
>>> +    int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
>>> +    unsigned long flags;
>>> +
>>> +    xdma_disable_user_irq(voutdev->mgbdev->xdev, irq);
>>> +
>>> +    cancel_work_sync(&voutdev->dma_work);
>>> +
>>> +    mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
>>> +      0x2, 0x0);
>>> +
>>> +    spin_lock_irqsave(&voutdev->qlock, flags);
>>> +    list_for_each_entry_safe(buf, node, &voutdev->buf_list, list) {
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +        list_del(&buf->list);
>>> +    }
>>> +    spin_unlock_irqrestore(&voutdev->qlock, flags);
>>> +}
>>> +
>>> +static int start_streaming(struct vb2_queue *vq, unsigned int count)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vq);
>>> +    struct device *dev = &voutdev->mgbdev->pdev->dev;
>>> +    struct frame_buffer *buf = 0;
>>> +    struct mgb4_regs *video = &voutdev->mgbdev->video;
>>> +    int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
>>> +    u32 addr;
>>> +
>>> +    mgb4_mask_reg(video, voutdev->config->regs.config, 0x2, 0x2);
>>> +
>>> +    addr = mgb4_read_reg(video, voutdev->config->regs.address);
>>> +    if (addr >= ERR_QUEUE_FULL) {
>>> +        dev_err(dev, "frame queue error (%d)\n", (int)addr);
>>
>> You must return queued buffers with STATE_QUEUED on error in start_streaming().
>> Same as for the capture devices.
>>
> 
> Ok.
> 
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    if (!list_empty(&voutdev->buf_list)) {
>>> +        buf = list_first_entry(&voutdev->buf_list, struct frame_buffer, list);
>>> +        list_del_init(voutdev->buf_list.next);
>>> +    }
>>> +    if (!buf) {
>>> +        dev_err(dev, "empty v4l2 queue\n");
>>
>> You can set min_buffers_needed to 1 if you need at least one buffer before
>> start_streaming should be called.
> 
> It is set to 2.
> 
>>
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    if (mgb4_dma_transfer(voutdev->mgbdev, voutdev->config->dma_channel,
>>> +      true, addr, vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0)) < 0) {
>>> +        dev_warn(dev, "DMA transfer error\n");
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +    } else {
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +    }
>>> +
>>> +    xdma_enable_user_irq(voutdev->mgbdev->xdev, irq);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct vb2_ops queue_ops = {
>>> +    .queue_setup = queue_setup,
>>> +    .buf_init = buffer_init,
>>> +    .buf_prepare = buffer_prepare,
>>> +    .buf_queue = buffer_queue,
>>> +    .start_streaming = start_streaming,
>>> +    .stop_streaming = stop_streaming,
>>> +    .wait_prepare = vb2_ops_wait_prepare,
>>> +    .wait_finish = vb2_ops_wait_finish
>>> +};
>>> +
>>> +
>>> +static int vidioc_querycap(struct file *file, void *priv,
>>> +               struct v4l2_capability *cap)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = video_drvdata(file);
>>> +
>>> +    strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
>>> +    strscpy(cap->card, "MGB4 PCIe Card", sizeof(cap->card));
>>> +    snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
>>> +      pci_name(voutdev->mgbdev->pdev));
>>
>> Can be dropped.
>>
> 
> Ok.
> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +
>>> +static int vidioc_enum_fmt(struct file *file, void *priv,
>>> +               struct v4l2_fmtdesc *f)
>>> +{
>>> +    if (f->index != 0)
>>> +        return -EINVAL;
>>> +
>>> +    f->pixelformat = V4L2_PIX_FMT_ABGR32;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = video_drvdata(file);
>>> +
>>> +    f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
>>> +    f->fmt.pix.width = voutdev->width;
>>> +    f->fmt.pix.height = voutdev->height;
>>> +    f->fmt.pix.field = V4L2_FIELD_NONE;
>>> +    f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
>>> +    f->fmt.pix.bytesperline = BYTESPERLINE(voutdev->width, voutdev->alignment);
>>> +    f->fmt.pix.sizeimage = f->fmt.pix.width * 4 * f->fmt.pix.height;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
>>> +{
>>> +    *i = 0;
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_s_output(struct file *file, void *priv, unsigned int i)
>>> +{
>>> +    return i ? -EINVAL : 0;
>>> +}
>>> +
>>> +static int vidioc_enum_output(struct file *file, void *priv, struct v4l2_output *out)
>>> +{
>>> +    if (out->index != 0)
>>> +        return -EINVAL;
>>> +
>>> +    out->type = V4L2_OUTPUT_TYPE_ANALOG;
>>> +    strscpy(out->name, "MGB4", sizeof(out->name));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int vidioc_queryctrl(struct file *file, void *priv,
>>> +                struct v4l2_queryctrl *qc)
>>> +{
>>> +    return -EINVAL;
>>> +}
>>
>> Huh?
>>
> 
> This is the same story as in the INPUT case.
> 
>>> +
>>> +static const struct v4l2_ioctl_ops video_ioctl_ops = {
>>> +    .vidioc_querycap = vidioc_querycap,
>>> +    .vidioc_enum_fmt_vid_out = vidioc_enum_fmt,
>>> +    .vidioc_try_fmt_vid_out = vidioc_fmt,
>>> +    .vidioc_s_fmt_vid_out = vidioc_fmt,
>>> +    .vidioc_g_fmt_vid_out = vidioc_fmt,
>>> +    .vidioc_enum_output = vidioc_enum_output,
>>> +    .vidioc_g_output = vidioc_g_output,
>>> +    .vidioc_s_output = vidioc_s_output,
>>> +    .vidioc_queryctrl = vidioc_queryctrl,
>>> +    .vidioc_reqbufs = vb2_ioctl_reqbufs,
>>> +    .vidioc_create_bufs = vb2_ioctl_create_bufs,
>>> +    .vidioc_querybuf = vb2_ioctl_querybuf,
>>> +    .vidioc_qbuf = vb2_ioctl_qbuf,
>>> +    .vidioc_dqbuf = vb2_ioctl_dqbuf,
>>
>> Missing vidioc_prepare_buf.
>>
>>> +    .vidioc_expbuf = vb2_ioctl_expbuf,
>>> +    .vidioc_streamon = vb2_ioctl_streamon,
>>> +    .vidioc_streamoff = vb2_ioctl_streamoff,
>>> +};
>>> +
>>> +static int fh_open(struct file *file)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = video_drvdata(file);
>>> +    struct mgb4_regs *video = &voutdev->mgbdev->video;
>>> +    u32 config, resolution;
>>> +    int ret;
>>> +
>>> +    ret = v4l2_fh_open(file);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    config = mgb4_read_reg(video, voutdev->config->regs.config);
>>> +    if ((config & 0xc) >> 2 != voutdev->config->id + MGB4_VIN_DEVICES)
>>> +        goto error;
>>> +
>>> +    resolution = mgb4_read_reg(video, voutdev->config->regs.resolution);
>>> +    voutdev->width = resolution >> 16;
>>> +    voutdev->height = resolution & 0xFFFF;
>>> +
>>> +    mgb4_write_reg(video, voutdev->config->regs.padding,
>>> +      PADDING(voutdev->width, voutdev->alignment));
>>
>> Same as for input: opening a video device appears to have a side-effect.
>>
> 
> The same reason as in the input case. You can have different displays with completely different video signals (even resolutions) connected to the output at any arbitrary time.

It's similar to the input side: use the DV timings ioctls. Except there won't be a
QUERY_DV_TIMINGS, since it is an output.

But how do you know what the display supports? Is it using an EDID? In that case you
need to support VIDIOC_G_EDID as well, and probably some of the DV controls:

https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/ext-ctrls-dv.html

> 
>>> +
>>> +    return 0;
>>> +
>>> +error:
>>> +    v4l2_fh_release(file);
>>> +    return -EBUSY;
>>> +}
>>> +
>>> +static const struct v4l2_file_operations video_fops = {
>>> +    .owner = THIS_MODULE,
>>> +    .open = fh_open,
>>> +    .release = vb2_fop_release,
>>> +    .unlocked_ioctl = video_ioctl2,
>>> +    .write = vb2_fop_write,
>>> +    .mmap = vb2_fop_mmap,
>>> +    .poll = vb2_fop_poll,
>>> +};
>>> +
>>> +static void dma_transfer(struct work_struct *work)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = container_of(work, struct mgb4_vout_dev,
>>> +      dma_work);
>>> +    struct device *dev = &voutdev->mgbdev->pdev->dev;
>>> +    struct frame_buffer *buf = 0;
>>> +    unsigned long flags;
>>> +    u32 addr;
>>> +
>>> +    spin_lock_irqsave(&voutdev->qlock, flags);
>>> +    if (!list_empty(&voutdev->buf_list)) {
>>> +        buf = list_first_entry(&voutdev->buf_list, struct frame_buffer, list);
>>> +        list_del_init(voutdev->buf_list.next);
>>> +    }
>>> +    spin_unlock_irqrestore(&voutdev->qlock, flags);
>>> +
>>> +    if (!buf)
>>> +        return;
>>> +
>>> +    addr = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.address);
>>> +    if (addr >= ERR_QUEUE_FULL) {
>>> +        dev_warn(dev, "frame queue error (%d)\n", (int)addr);
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +        return;
>>> +    }
>>> +
>>> +    if (mgb4_dma_transfer(voutdev->mgbdev, voutdev->config->dma_channel,
>>> +      true, addr, vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0)) < 0) {
>>> +        dev_warn(dev, "DMA transfer error\n");
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +    } else {
>>> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +    }
>>> +}
>>> +
>>> +static irqreturn_t handler(int irq, void *ctx)
>>> +{
>>> +    struct mgb4_vout_dev *voutdev = (struct mgb4_vout_dev *)ctx;
>>> +
>>> +    schedule_work(&voutdev->dma_work);
>>> +
>>> +    mgb4_write_reg(&voutdev->mgbdev->video, 0xB4, 1U<<voutdev->config->irq);
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int ser_init(struct mgb4_vout_dev *voutdev, int id)
>>> +{
>>> +    int rv, addr_size;
>>> +    size_t values_count;
>>> +    const struct mgb4_i2c_kv *values;
>>> +    const struct i2c_board_info *info;
>>> +    struct device *dev = &voutdev->mgbdev->pdev->dev;
>>> +
>>> +
>>> +    if (MGB4_IS_GMSL(voutdev->mgbdev))
>>> +        return 0;
>>> +
>>> +    info = &fpdl3_ser_info[id];
>>> +    addr_size = 8;
>>> +    values = fpdl3_i2c;
>>> +    values_count = ARRAY_SIZE(fpdl3_i2c);
>>> +
>>> +    rv = mgb4_i2c_init(&voutdev->ser, voutdev->mgbdev->i2c_adap, info, addr_size);
>>> +    if (rv < 0) {
>>> +        dev_err(dev, "failed to create serializer\n");
>>> +        return rv;
>>> +    }
>>> +    rv = mgb4_i2c_configure(&voutdev->ser, values, values_count);
>>> +    if (rv < 0) {
>>> +        dev_err(dev, "failed to configure serializer\n");
>>> +        goto err_i2c_dev;
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +err_i2c_dev:
>>> +    mgb4_i2c_free(&voutdev->ser);
>>> +
>>> +    return rv;
>>> +}
>>> +
>>> +struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
>>> +{
>>> +    int rv, irq;
>>> +    struct device_attribute **attr, **module_attr;
>>> +    struct mgb4_vout_dev *voutdev;
>>> +    struct mgb4_regs *video;
>>> +    struct pci_dev *pdev = mgbdev->pdev;
>>> +    struct device *dev = &pdev->dev;
>>> +
>>> +    voutdev = kzalloc(sizeof(struct mgb4_vout_dev), GFP_KERNEL);
>>> +    if (!voutdev)
>>> +        return NULL;
>>> +
>>> +    voutdev->mgbdev = mgbdev;
>>> +    voutdev->config = &(vout_cfg[id]);
>>> +    video = &voutdev->mgbdev->video;
>>> +
>>> +    /* Frame queue*/
>>> +    INIT_LIST_HEAD(&voutdev->buf_list);
>>> +    spin_lock_init(&voutdev->qlock);
>>> +
>>> +    /* DMA transfer stuff */
>>> +    INIT_WORK(&voutdev->dma_work, dma_transfer);
>>> +
>>> +    /* IRQ callback */
>>> +    irq = xdma_get_user_irq(mgbdev->xdev, voutdev->config->irq);
>>> +    rv = request_irq(irq, handler, 0, "mgb4-vout", voutdev);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register irq handler\n");
>>> +        goto err_alloc;
>>> +    }
>>> +
>>> +    /* V4L2 */
>>> +    rv = v4l2_device_register(dev, &voutdev->v4l2dev);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register v4l2 device\n");
>>> +        goto err_irq;
>>> +    }
>>> +
>>> +    mutex_init(&voutdev->lock);
>>> +
>>> +    voutdev->queue.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>>> +    voutdev->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_WRITE;
>>
>> Drop USERPTR.
>>
> 
> Ok.
> 
>> General note (both for video capture and output): while it does doesn't hurt to
>> support read() or write(), it is unusual in modern drivers, and since read/write
>> support involves a memcpy for each buffer, it is also quite inefficient.
>>
>> You might want to drop support for that.
>>
> 
> I would let it there as I have seen code using it...
> 
>>> +    voutdev->queue.buf_struct_size = sizeof(struct frame_buffer);
>>> +    voutdev->queue.ops = &queue_ops;
>>> +    voutdev->queue.mem_ops = &vb2_dma_sg_memops;
>>> +    voutdev->queue.gfp_flags = GFP_DMA32;
>>> +    voutdev->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>> +    voutdev->queue.min_buffers_needed = 2;
>>
>> Ah, you set this already. Then the check in start_streaming of whether there
>> is a buffer queued can be dropped.
> 
> Ok.
> 
>>
>>> +    voutdev->queue.drv_priv = voutdev;
>>> +    voutdev->queue.lock = &voutdev->lock;
>>> +    voutdev->queue.dev = dev;
>>> +    rv = vb2_queue_init(&voutdev->queue);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to initialize vb2 queue\n");
>>> +        goto err_v4l2_dev;
>>> +    }
>>> +
>>> +    snprintf(voutdev->vdev.name, sizeof(voutdev->vdev.name), "mgb4-out%d", id+1);
>>> +    voutdev->vdev.device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_READWRITE
>>> +      | V4L2_CAP_STREAMING;
>>> +    voutdev->vdev.vfl_dir = VFL_DIR_TX;
>>> +    voutdev->vdev.fops = &video_fops;
>>> +    voutdev->vdev.ioctl_ops = &video_ioctl_ops;
>>> +    voutdev->vdev.release = video_device_release_empty;
>>> +    voutdev->vdev.v4l2_dev = &voutdev->v4l2dev;
>>> +    voutdev->vdev.lock = &voutdev->lock;
>>> +    voutdev->vdev.queue = &voutdev->queue;
>>> +    video_set_drvdata(&voutdev->vdev, voutdev);
>>> +
>>> +    rv = video_register_device(&voutdev->vdev, VFL_TYPE_GRABBER, -1);
>>> +    if (rv) {
>>> +        dev_err(dev, "failed to register video device\n");
>>> +        goto err_v4l2_dev;
>>> +    }
>>> +
>>> +    /* Serializer */
>>> +    rv = ser_init(voutdev, id);
>>> +    if (rv)
>>> +        goto err_video_dev;
>>> +
>>> +    /* Set the FPGA registers default values */
>>> +    mgb4_mask_reg(video, voutdev->config->regs.config, 0xc,
>>> +      (voutdev->config->id + MGB4_VIN_DEVICES) << 2);
>>> +    mgb4_write_reg(video, voutdev->config->regs.resolution,
>>> +      (DEFAULT_WIDTH << 16) | DEFAULT_HEIGHT);
>>> +    mgb4_write_reg(video, voutdev->config->regs.frame_period,
>>> +      DEFAULT_PERIOD);
>>> +
>>> +    /* Module sysfs attributes */
>>> +    voutdev->alignment = 1;
>>> +    module_attr = MGB4_IS_GMSL(mgbdev)
>>> +      ? mgb4_gmsl_out_attrs : mgb4_fpdl3_out_attrs;
>>> +    for (attr = module_attr; *attr; attr++)
>>> +        device_create_file(&voutdev->vdev.dev, *attr);
>>> +
>>> +    /* Set the output frequency according to the FPGA defaults */
>>> +    voutdev->freq = 70000;
>>> +
>>> +    return voutdev;
>>> +
>>> +err_video_dev:
>>> +    video_unregister_device(&voutdev->vdev);
>>> +err_v4l2_dev:
>>> +    v4l2_device_unregister(&voutdev->v4l2dev);
>>> +err_irq:
>>> +    free_irq(irq, voutdev);
>>> +err_alloc:
>>> +    kfree(voutdev);
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +void mgb4_vout_free(struct mgb4_vout_dev *voutdev)
>>> +{
>>> +    struct device_attribute **attr, **module_attr;
>>> +    int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
>>> +
>>> +    free_irq(irq, voutdev);
>>> +
>>> +    module_attr = MGB4_IS_GMSL(voutdev->mgbdev)
>>> +      ? mgb4_gmsl_out_attrs : mgb4_fpdl3_out_attrs;
>>> +    for (attr = module_attr; *attr; attr++)
>>> +        device_remove_file(&voutdev->vdev.dev, *attr);
>>> +
>>> +    mgb4_i2c_free(&voutdev->ser);
>>> +    video_unregister_device(&voutdev->vdev);
>>> +    v4l2_device_unregister(&voutdev->v4l2dev);
>>> +
>>> +    kfree(voutdev);
>>> +}
>>> diff --git a/drivers/media/pci/mgb4/mgb4_vout.h b/drivers/media/pci/mgb4/mgb4_vout.h
>>> new file mode 100644
>>> index 000000000000..902b6b8deb21
>>> --- /dev/null
>>> +++ b/drivers/media/pci/mgb4/mgb4_vout.h
>>> @@ -0,0 +1,58 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2021-2022 Digiteq Automotive
>>> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
>>> + */
>>> +
>>> +#ifndef __MGB4_VOUT_H__
>>> +#define __MGB4_VOUT_H__
>>> +
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-dev.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/videobuf2-core.h>
>>> +#include "mgb4_i2c.h"
>>> +
>>> +struct mgb4_vout_regs {
>>> +    u32 address;
>>> +    u32 config;
>>> +    u32 status;
>>> +    u32 resolution;
>>> +    u32 frame_period;
>>> +    u32 hsync;
>>> +    u32 vsync;
>>> +    u32 padding;
>>> +};
>>> +
>>> +struct mgb4_vout_config {
>>> +    int id;
>>> +    int dma_channel;
>>> +    int irq;
>>> +    struct mgb4_vout_regs regs;
>>> +};
>>> +
>>> +struct mgb4_vout_dev {
>>> +    struct mgb4_dev *mgbdev;
>>> +    struct v4l2_device v4l2dev;
>>> +    struct video_device vdev;
>>> +    struct vb2_queue queue;
>>> +    struct mutex lock;
>>> +
>>> +    spinlock_t qlock;
>>> +    struct list_head buf_list;
>>> +    struct work_struct dma_work;
>>> +
>>> +    u32 width;
>>> +    u32 height;
>>> +    u32 freq;
>>> +    u32 alignment;
>>> +
>>> +    struct mgb4_i2c_client ser;
>>> +
>>> +    const struct mgb4_vout_config *config;
>>> +};
>>> +
>>> +extern struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id);
>>> +extern void mgb4_vout_free(struct mgb4_vout_dev *voutdev);
>>> +
>>> +#endif
>>
>> General note: add some comments at the top of each source explaining what
>> it does.
>>
> 
> I will do that, but except of the CMT module (where even I do not know what exactly it does ;-) ) it should be clear from the source name. But maybe in some cases some info that is clear to me can
> help to others.
> 
>> Regards,
>>
>>     Hans
> 
> Thanks's for your time to review the driver. I will prepare a v4 soon with the changes. Except the open/close logic it does not look as much work to me at the moment.
> 
> M.

Regards,

	Hans
