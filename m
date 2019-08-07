Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4668547B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 22:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730280AbfHGUbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 16:31:31 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33454 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbfHGUbb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 16:31:31 -0400
Received: by mail-qt1-f196.google.com with SMTP id r6so85540047qtt.0
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YznIA0xmuLIQuz6ESsetvA4wBm6STUbwqbOFB2I4UiA=;
        b=TlaObIrHqoKkMc3rkFNpbu0LJrJbOZ/+A4NzNWk3o3/8Gmi5IdohdckhxygrRtTuHb
         V+cxyQwQf5siBh3bdTE4x+zg/ESJWVwXu0CC3fl60kMT8qT1VpHgguCAJ6gm3lbHBNXr
         lMY+5JV4lfoyNHYWUb/ZqK7zN6KjLylvG6QRmd9QhJ9nE0dyC18MS8ADNY0+29rj/eCz
         HRpVZOPkBOdX6xi4nBGDGmf3wD71ErjNbrVX+nStgjCx3hXDya55R1kXJiAxA+E9Wca6
         PZTqMF2/74zcTvu5tWDdzH4J+1U1Gort0eMr9VMHNWCCxsObr2C2P7ruGfTDMI2fGFpC
         +6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YznIA0xmuLIQuz6ESsetvA4wBm6STUbwqbOFB2I4UiA=;
        b=Vb9K6Xxpbx4uCL2B2nAUbnUmG6turNPX/vjwTzzfw+KeLfWp+o38mEOWWt+9GaWOSW
         J2v9Q3KcV+Tevf7TuNcaWkzAcGNlnbKiOcNMS9jN6Wykk7CIMg6LtA6C598O25HI48jE
         CZhZ3B0fag7pqm/dkVh5A+nS+U6Ei+Rsq7req0XDB1hrfpSMDqYONV4OQYCtpuLmkMW9
         WFoE6XCD5yBZBBSoxIGJq3oW7tG6VA3WgJ9QGEtWnOnOtmcOw0dzDAVsqgqyAEjdoP1c
         gpTriFg374btwrxHGFv3SAMVrdDLBo9gpHUQAGn+tbtpw55QBp2C3PFPHRhSLUjWCIab
         wudA==
X-Gm-Message-State: APjAAAU/18OWH+o77bnba3VJJxx+pri1OVuSuvmJLvpdWA4s+u15gK7t
        oqztKQBMUphZlCdKObq9ijY=
X-Google-Smtp-Source: APXvYqwPnBL5kBGDcNZbfNlqQmJS9D8WSVzNYO+jUTE7ByffWSBxhSYXwnHs/CMnPb5tl44kYSF23A==
X-Received: by 2002:a0c:d11c:: with SMTP id a28mr10067424qvh.180.1565209889815;
        Wed, 07 Aug 2019 13:31:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:22a::1])
        by smtp.gmail.com with ESMTPSA id a21sm41616265qka.113.2019.08.07.13.31.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 13:31:29 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     wsa@the-dreams.de
Cc:     linux@rempel-privat.de, linux-imx@nxp.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        cphealy@gmail.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] i2c: imx: Fix endlessly clk warnings
Date:   Wed,  7 Aug 2019 17:31:53 -0300
Message-Id: <20190807203153.11778-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When booting with the DMA driver as module (such as CONFIG_FSL_EDMA=m)
the following endlessly clk warnings are seen:

[  153.077831] ------------[ cut here ]------------
[  153.082528] WARNING: CPU: 0 PID: 15 at drivers/clk/clk.c:924 clk_core_disable_lock+0x18/0x24
[  153.093077] i2c0 already disabled
[  153.096416] Modules linked in:
[  153.099521] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W         5.2.0+ #321
[  153.107290] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[  153.113772] Workqueue: events deferred_probe_work_func
[  153.118979] [<c0019560>] (unwind_backtrace) from [<c0014734>] (show_stack+0x10/0x14)
[  153.126778] [<c0014734>] (show_stack) from [<c083f8dc>] (dump_stack+0x9c/0xd4)
[  153.134051] [<c083f8dc>] (dump_stack) from [<c0031154>] (__warn+0xf8/0x124)
[  153.141056] [<c0031154>] (__warn) from [<c0031248>] (warn_slowpath_fmt+0x38/0x48)
[  153.148580] [<c0031248>] (warn_slowpath_fmt) from [<c040fde0>] (clk_core_disable_lock+0x18/0x24)
[  153.157413] [<c040fde0>] (clk_core_disable_lock) from [<c058f520>] (i2c_imx_probe+0x554/0x6ec)
[  153.166076] [<c058f520>] (i2c_imx_probe) from [<c04b9178>] (platform_drv_probe+0x48/0x98)
[  153.174297] [<c04b9178>] (platform_drv_probe) from [<c04b7298>] (really_probe+0x1d8/0x2c0)
[  153.182605] [<c04b7298>] (really_probe) from [<c04b7554>] (driver_probe_device+0x5c/0x174)
[  153.190909] [<c04b7554>] (driver_probe_device) from [<c04b58c8>] (bus_for_each_drv+0x44/0x8c)
[  153.199480] [<c04b58c8>] (bus_for_each_drv) from [<c04b746c>] (__device_attach+0xa0/0x108)
[  153.207782] [<c04b746c>] (__device_attach) from [<c04b65a4>] (bus_probe_device+0x88/0x90)
[  153.215999] [<c04b65a4>] (bus_probe_device) from [<c04b6a04>] (deferred_probe_work_func+0x60/0x90)
[  153.225003] [<c04b6a04>] (deferred_probe_work_func) from [<c004f190>] (process_one_work+0x204/0x634)
[  153.234178] [<c004f190>] (process_one_work) from [<c004f618>] (worker_thread+0x20/0x484)
[  153.242315] [<c004f618>] (worker_thread) from [<c0055c2c>] (kthread+0x118/0x150)
[  153.249758] [<c0055c2c>] (kthread) from [<c00090b4>] (ret_from_fork+0x14/0x20)
[  153.257006] Exception stack(0xdde43fb0 to 0xdde43ff8)
[  153.262095] 3fa0:                                     00000000 00000000 00000000 00000000
[  153.270306] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  153.278520] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  153.285159] irq event stamp: 3323022
[  153.288787] hardirqs last  enabled at (3323021): [<c0861c4c>] _raw_spin_unlock_irq+0x24/0x2c
[  153.297261] hardirqs last disabled at (3323022): [<c040d7a0>] clk_enable_lock+0x10/0x124
[  153.305392] softirqs last  enabled at (3322092): [<c000a504>] __do_softirq+0x344/0x540
[  153.313352] softirqs last disabled at (3322081): [<c00385c0>] irq_exit+0x10c/0x128
[  153.320946] ---[ end trace a506731ccd9bd703 ]---

When the DMA driver is built as module then dma_request_chan() returns
-EPROBE_DEFER, so let's treat this case in the same way as
"there is no DMA support" and make i2c_imx_dma_request() return success.

Reported-by: Russell King <linux@armlinux.org.uk>
Fixes: e1ab9a468e3b ("i2c: imx: improve the error handling in i2c_imx_dma_request()")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b1b8b938d7f4..0a07daeafdf2 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -337,7 +337,7 @@ static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 fail_al:
 	devm_kfree(dev, dma);
 	/* return successfully if there is no dma support */
-	return ret == -ENODEV ? 0 : ret;
+	return ((ret == -ENODEV || ret == -EPROBE_DEFER)) ? 0 : ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
-- 
2.17.1

