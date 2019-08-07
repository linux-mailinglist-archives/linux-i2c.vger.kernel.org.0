Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29ECD85502
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 23:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbfHGVNa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 17:13:30 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:57730 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730231AbfHGVNa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 17:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AVQvK5z9UwIY3XVvA1ir1NKZhNf7K5cpEzxXNZgDsl4=; b=TqB4uE997YqleGD6f62hHPivm
        d0NghaGKVBuZyi+cp68Cz1PfyRFtbylBPXEUzLc8ceqnPKazby7bTjtDzEcfYY5KQPByn6fq3HKj2
        aUqlcz4D45Wc+P794ETdBeazyTT4XPxh/oUGkDwZ5hNSlEu0IlBJlEHM3J2svIu/JZKISz4UlcuFZ
        nRMceQstT2subh+Z26uhVqVot+uJM/Wvbiel5enhkG7MoYZhZTUev7pur1txdwa6MusLEZkdmYjY/
        WArr26ghYfNhawkx38R/edcCG0U9qk4q6s1smDukoTv3rpT0t/NHyfuTB2BFJ9b2vQMipjWfTR74P
        HDFZsWPRg==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:49704)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hvTFJ-0008MX-B7; Wed, 07 Aug 2019 22:13:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hvTFF-0001mq-GT; Wed, 07 Aug 2019 22:13:17 +0100
Date:   Wed, 7 Aug 2019 22:13:17 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
Message-ID: <20190807211317.GA5193@shell.armlinux.org.uk>
References: <20190807203153.11778-1-festevam@gmail.com>
 <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 07, 2019 at 06:00:44PM -0300, Fabio Estevam wrote:
> On Wed, Aug 7, 2019 at 5:31 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > When booting with the DMA driver as module (such as CONFIG_FSL_EDMA=m)
> > the following endlessly clk warnings are seen:
> >
> > [  153.077831] ------------[ cut here ]------------
> > [  153.082528] WARNING: CPU: 0 PID: 15 at drivers/clk/clk.c:924 clk_core_disable_lock+0x18/0x24
> > [  153.093077] i2c0 already disabled
> > [  153.096416] Modules linked in:
> > [  153.099521] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W         5.2.0+ #321
> > [  153.107290] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> > [  153.113772] Workqueue: events deferred_probe_work_func
> > [  153.118979] [<c0019560>] (unwind_backtrace) from [<c0014734>] (show_stack+0x10/0x14)
> > [  153.126778] [<c0014734>] (show_stack) from [<c083f8dc>] (dump_stack+0x9c/0xd4)
> > [  153.134051] [<c083f8dc>] (dump_stack) from [<c0031154>] (__warn+0xf8/0x124)
> > [  153.141056] [<c0031154>] (__warn) from [<c0031248>] (warn_slowpath_fmt+0x38/0x48)
> > [  153.148580] [<c0031248>] (warn_slowpath_fmt) from [<c040fde0>] (clk_core_disable_lock+0x18/0x24)
> > [  153.157413] [<c040fde0>] (clk_core_disable_lock) from [<c058f520>] (i2c_imx_probe+0x554/0x6ec)
> > [  153.166076] [<c058f520>] (i2c_imx_probe) from [<c04b9178>] (platform_drv_probe+0x48/0x98)
> > [  153.174297] [<c04b9178>] (platform_drv_probe) from [<c04b7298>] (really_probe+0x1d8/0x2c0)
> > [  153.182605] [<c04b7298>] (really_probe) from [<c04b7554>] (driver_probe_device+0x5c/0x174)
> > [  153.190909] [<c04b7554>] (driver_probe_device) from [<c04b58c8>] (bus_for_each_drv+0x44/0x8c)
> > [  153.199480] [<c04b58c8>] (bus_for_each_drv) from [<c04b746c>] (__device_attach+0xa0/0x108)
> > [  153.207782] [<c04b746c>] (__device_attach) from [<c04b65a4>] (bus_probe_device+0x88/0x90)
> > [  153.215999] [<c04b65a4>] (bus_probe_device) from [<c04b6a04>] (deferred_probe_work_func+0x60/0x90)
> > [  153.225003] [<c04b6a04>] (deferred_probe_work_func) from [<c004f190>] (process_one_work+0x204/0x634)
> > [  153.234178] [<c004f190>] (process_one_work) from [<c004f618>] (worker_thread+0x20/0x484)
> > [  153.242315] [<c004f618>] (worker_thread) from [<c0055c2c>] (kthread+0x118/0x150)
> > [  153.249758] [<c0055c2c>] (kthread) from [<c00090b4>] (ret_from_fork+0x14/0x20)
> > [  153.257006] Exception stack(0xdde43fb0 to 0xdde43ff8)
> > [  153.262095] 3fa0:                                     00000000 00000000 00000000 00000000
> > [  153.270306] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  153.278520] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [  153.285159] irq event stamp: 3323022
> > [  153.288787] hardirqs last  enabled at (3323021): [<c0861c4c>] _raw_spin_unlock_irq+0x24/0x2c
> > [  153.297261] hardirqs last disabled at (3323022): [<c040d7a0>] clk_enable_lock+0x10/0x124
> > [  153.305392] softirqs last  enabled at (3322092): [<c000a504>] __do_softirq+0x344/0x540
> > [  153.313352] softirqs last disabled at (3322081): [<c00385c0>] irq_exit+0x10c/0x128
> > [  153.320946] ---[ end trace a506731ccd9bd703 ]---
> >
> > When the DMA driver is built as module then dma_request_chan() returns
> > -EPROBE_DEFER, so let's treat this case in the same way as
> > "there is no DMA support" and make i2c_imx_dma_request() return success.
> >
> > Reported-by: Russell King <linux@armlinux.org.uk>
> > Fixes: e1ab9a468e3b ("i2c: imx: improve the error handling in i2c_imx_dma_request()")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> Just learned that Andrey has already submitted a fix for this same problem:
> https://lore.kernel.org/linux-arm-kernel/20190609055658.3446-1-andrew.smirnov@gmail.com/
> 
> I think we can go with Andrey's solution.
> 
> Maybe Andrey could resend it with the Fixes tag so that it can be
> backported to stable.

Well, the question is what behaviour do we want.  The driver's original
behaviour prior to it breaking was to ignore DMA if it wasn't found
(e.g. when the DMA driver is a module.)

Your patch restores that behaviour, which is the safest approach.

Audrey's patch has the effect that none of the I2C buses will be
registered if the DMA driver is a module, until the DMA driver is
loaded.  Since an I2C bus _may_ have the systems RTC on it, not
probing the I2C bus will cause the RTC not to be read by the kernel
at boot, leading to the system booting with a unixtime of 0.

I haven't checked what the situation is wrt RTCs on the ZII boards,
whether they do indeed have external I2C RTCs on them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
