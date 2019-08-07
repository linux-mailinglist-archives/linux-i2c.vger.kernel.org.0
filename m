Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95FE854D8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729938AbfHGVAW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 17:00:22 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43082 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729934AbfHGVAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 17:00:22 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17so62236210ljk.10
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 14:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdyQIB/KtqLbkrxReJI1pmkcPRgrkGTJ0zpp1zrA0uM=;
        b=Bl0nn7FlJBoyy4Qs7uJhwEhA2VEs80kTaNBbbT66dcCFKpquazfHa9LcpHlEpdK5FS
         yixRDlRgU78vMScvsSq3ZMcoDKbBoNWG9tMZbUJqrcXyuJ8yKMOnwAzuNtJhmTPgGYXT
         I3MxbH0KAQRvjLwheU9z3yHmsMk0C+IYqRcgJPiHPADtSNfyoXKRLMTRQ8OmeKDWupuN
         Y7uaVptRcAeafj6b+sFXflwc3nT6i5fmAODsAqLeIrYKaWxsuyEqQANf5cXKWYm1EwMX
         qguVq0cEmQGgsfp0TqjxLckALW79bFl09ep6CfTar+7vGIZoDoD9+Rml9h/LWWbFA6vq
         ts6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdyQIB/KtqLbkrxReJI1pmkcPRgrkGTJ0zpp1zrA0uM=;
        b=c+aTWKGIdAuNSnTc2rf79Mr6BR+XrmGEnrUQBo0VnhaXUmudxT6gpSRrZwDskh+2l8
         fI0hfrGMctUZkZFD7UsfHLC7m2a6ov8wjJRkO+jWvFoQlxgLd/+6qVSTzoREZtkObRwa
         6nwZzKMPOv6NW6A81lKoEld7as26kTzPLRo4p8OtjVRL/dSmplWGxT0GJCf55Td8FoUg
         q2DCVo5/xiCnjCreqvCVJgufnSnVGybna4zXkCLzAhhS0kDrx2moatUTVrO67soRfBuA
         GNdIyoiR1MXKyD8cPryeipQf4peTyBd171ibdMXG0VMVbMt8YHi82ArSKSIbOitjmfcs
         Ti5A==
X-Gm-Message-State: APjAAAWAOKhpFSnk3kd/C+tdpRfQ+UDt8iG2IX+f36ojNwOb7+s+IkPP
        TDDMuC+J2o8K3jAmx3X+XdzqpMA2BMHFhijMENw=
X-Google-Smtp-Source: APXvYqxwxRU34uuW7TIHq3pIX4U7JpWKshUOSsV31TLRghqQ9aM2S6H2tYAB2uKQ3D30wTHXC+N/LTZ+qyHUvfFxe2Q=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr5626147lji.115.1565211620476;
 Wed, 07 Aug 2019 14:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com>
In-Reply-To: <20190807203153.11778-1-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 7 Aug 2019 18:00:44 -0300
Message-ID: <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 7, 2019 at 5:31 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> When booting with the DMA driver as module (such as CONFIG_FSL_EDMA=m)
> the following endlessly clk warnings are seen:
>
> [  153.077831] ------------[ cut here ]------------
> [  153.082528] WARNING: CPU: 0 PID: 15 at drivers/clk/clk.c:924 clk_core_disable_lock+0x18/0x24
> [  153.093077] i2c0 already disabled
> [  153.096416] Modules linked in:
> [  153.099521] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W         5.2.0+ #321
> [  153.107290] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> [  153.113772] Workqueue: events deferred_probe_work_func
> [  153.118979] [<c0019560>] (unwind_backtrace) from [<c0014734>] (show_stack+0x10/0x14)
> [  153.126778] [<c0014734>] (show_stack) from [<c083f8dc>] (dump_stack+0x9c/0xd4)
> [  153.134051] [<c083f8dc>] (dump_stack) from [<c0031154>] (__warn+0xf8/0x124)
> [  153.141056] [<c0031154>] (__warn) from [<c0031248>] (warn_slowpath_fmt+0x38/0x48)
> [  153.148580] [<c0031248>] (warn_slowpath_fmt) from [<c040fde0>] (clk_core_disable_lock+0x18/0x24)
> [  153.157413] [<c040fde0>] (clk_core_disable_lock) from [<c058f520>] (i2c_imx_probe+0x554/0x6ec)
> [  153.166076] [<c058f520>] (i2c_imx_probe) from [<c04b9178>] (platform_drv_probe+0x48/0x98)
> [  153.174297] [<c04b9178>] (platform_drv_probe) from [<c04b7298>] (really_probe+0x1d8/0x2c0)
> [  153.182605] [<c04b7298>] (really_probe) from [<c04b7554>] (driver_probe_device+0x5c/0x174)
> [  153.190909] [<c04b7554>] (driver_probe_device) from [<c04b58c8>] (bus_for_each_drv+0x44/0x8c)
> [  153.199480] [<c04b58c8>] (bus_for_each_drv) from [<c04b746c>] (__device_attach+0xa0/0x108)
> [  153.207782] [<c04b746c>] (__device_attach) from [<c04b65a4>] (bus_probe_device+0x88/0x90)
> [  153.215999] [<c04b65a4>] (bus_probe_device) from [<c04b6a04>] (deferred_probe_work_func+0x60/0x90)
> [  153.225003] [<c04b6a04>] (deferred_probe_work_func) from [<c004f190>] (process_one_work+0x204/0x634)
> [  153.234178] [<c004f190>] (process_one_work) from [<c004f618>] (worker_thread+0x20/0x484)
> [  153.242315] [<c004f618>] (worker_thread) from [<c0055c2c>] (kthread+0x118/0x150)
> [  153.249758] [<c0055c2c>] (kthread) from [<c00090b4>] (ret_from_fork+0x14/0x20)
> [  153.257006] Exception stack(0xdde43fb0 to 0xdde43ff8)
> [  153.262095] 3fa0:                                     00000000 00000000 00000000 00000000
> [  153.270306] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [  153.278520] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [  153.285159] irq event stamp: 3323022
> [  153.288787] hardirqs last  enabled at (3323021): [<c0861c4c>] _raw_spin_unlock_irq+0x24/0x2c
> [  153.297261] hardirqs last disabled at (3323022): [<c040d7a0>] clk_enable_lock+0x10/0x124
> [  153.305392] softirqs last  enabled at (3322092): [<c000a504>] __do_softirq+0x344/0x540
> [  153.313352] softirqs last disabled at (3322081): [<c00385c0>] irq_exit+0x10c/0x128
> [  153.320946] ---[ end trace a506731ccd9bd703 ]---
>
> When the DMA driver is built as module then dma_request_chan() returns
> -EPROBE_DEFER, so let's treat this case in the same way as
> "there is no DMA support" and make i2c_imx_dma_request() return success.
>
> Reported-by: Russell King <linux@armlinux.org.uk>
> Fixes: e1ab9a468e3b ("i2c: imx: improve the error handling in i2c_imx_dma_request()")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Just learned that Andrey has already submitted a fix for this same problem:
https://lore.kernel.org/linux-arm-kernel/20190609055658.3446-1-andrew.smirnov@gmail.com/

I think we can go with Andrey's solution.

Maybe Andrey could resend it with the Fixes tag so that it can be
backported to stable.

Thanks
