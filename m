Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC46A8581D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 04:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfHHCXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 22:23:01 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42211 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfHHCXB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 22:23:01 -0400
Received: by mail-qk1-f196.google.com with SMTP id 201so67515844qkm.9
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 19:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OXuBLqygTP27/jrGaR/mpR8QlOhK7zrmpXFQAvYQKpo=;
        b=QBPqSmznaY+TzRaD6viUt9GdBbUpulfw3bqn9TOqEvrjrQxWnkQZRePNErHVPfXpAz
         XAoUuFu1oWG25b1GK/Syqrcoi4RGTstIbShMTEMH08UP9I4nr5relSszVKIA5Q52cTGj
         wVFxurXxz8DpPzpAaIS7oZq/XZoQ/dfWqAc5vZSUTKGszjdKR8GC/Kk9VWAKO2UblL7m
         o+olH5pjQLOFZI77NJFBT+QRQpD9983NigcksW2FqRICM2qhRqkf+dMrHIgkYZ/z2v0V
         Lo7zKksVcY7HMjdvXnktjf2WCOcnw/TOl18k7yDcNjJJjFSQ5VzvETcp/fo6L4l5ORIW
         Xnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OXuBLqygTP27/jrGaR/mpR8QlOhK7zrmpXFQAvYQKpo=;
        b=q0XQWOz+nZ4FWyACJ1BslwAuCA5w+sa9Q2IR3JvV63izt9m9wjqOhpVFjOvj1HMKEv
         lOlq6TzxXG7R9RMIVZnxIb/sqCF/d6LThBq8va7Py2lLbTL7zZWNJXjLEsQZSx9fxCaI
         qDN+Ek+Yvvj5P2/9InlGbkhklXI1ZAkNmDSOtudr8XFjGpKXBE9FqPHAuLz0fC4phDxO
         L0M60YNyOZ9Kcu/9wT9fdRrI1kUdSQOX+yf7p7Wy1LaByoas2uVFcmZA4KFbI/40qPRw
         A12HEmmRQvoYVMjUs781eheFcfujynD+av+/VRjr43xhdYBsLePz0Po6OdkRACvfatzJ
         iReg==
X-Gm-Message-State: APjAAAVJ0kdB1Ih52ml0yWZQANjtODCZbQT6IR+3q2BmNQwZ4naCkqUU
        QnRstr1uPXhw69H3k46j1/I=
X-Google-Smtp-Source: APXvYqzVIQHU35ezwlVvhaO3tTs29zKOFTtKpt4W1dFN42lNxT6WzCSqQgHMEdMWOzIJpz8a8/oUDQ==
X-Received: by 2002:a37:a346:: with SMTP id m67mr11587632qke.237.1565230980137;
        Wed, 07 Aug 2019 19:23:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:22a::1])
        by smtp.gmail.com with ESMTPSA id z1sm41871993qke.122.2019.08.07.19.22.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 19:22:59 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     wsa@the-dreams.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux@armlinux.org.uk,
        andrew.smirnov@gmail.com, linux@rempel-privat.de,
        cphealy@gmail.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] i2c: imx: Fix endless clk warnings
Date:   Wed,  7 Aug 2019 23:23:16 -0300
Message-Id: <20190808022316.15517-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When booting with the DMA driver as module (such as CONFIG_FSL_EDMA=m)
the following endless clk warnings are seen:

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
Changes since v1:
- Use "endless" instead of "endlessly"
- Use single parenthesis

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
+	return (ret == -ENODEV || ret == -EPROBE_DEFER) ? 0 : ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
-- 
2.17.1

