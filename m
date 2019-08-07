Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2207854DD
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 23:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbfHGVCQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 17:02:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44775 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGVCQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 17:02:16 -0400
Received: by mail-ot1-f68.google.com with SMTP id b7so59719026otl.11
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f1jgx41LNP4GYx2+6EuqU7+qCiU3WS6Mx9JP/tkKR9A=;
        b=Laao4GfriIo2416QJUWchQY99Wicsi2xY5KUMp8y9aaDu8Jl3c3BlF23HcJifenfKG
         fkuR6HbJDjviOodbWNVqiUxjqGI6AGHbNLI9Ws7jn2yvg3VxlJMI0jcRWk//bb5+8ast
         MCQJUM+eg6AoCC0LVfbKatQYgS0mEFc+4ggbX7fapwCo33FT1NCxuhThinmXIAQ3Ag2G
         C/jtbyfjlalIQctLD1A4P8CNkA6ksDzTbR9UeAe5b38c95exQRwi+RXT0hshDbR1eIhI
         FFKfmByMZmKm6CgjoAp8P8Yhf6KVnw50SRPHutfz2qz6FCN/DqS4TTDYC4ykNMITnPb6
         +4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1jgx41LNP4GYx2+6EuqU7+qCiU3WS6Mx9JP/tkKR9A=;
        b=XB/NBgGRpB+Affc2eKa38Z7MQ7FJZbj94JOSZeecAUXfpqQc+QWCE4bC3ldlRkpMeq
         L/3NY+ERB5L9yEsYSjl0d6/Gim4mLJbvwtefLMkrgG3WBQGcSATsBV633ZSGTHH6tHMU
         MeJI7ATHovOs/MqG/AScmdm4oSCDuYPAgJvFgx5YyH+xssW+EgkngCV6xw1mxr/AK7Mc
         zbCzQF6wn36L9PyX7jL+ipj5D+XFNUaj+2sZYoiriNsbx2uHKzTOJB5d4/02OdhTo6UQ
         sqpOAKygMrXgUEOIBv1JrkdFn6dNIqNQ9D1DoctH0VzVxbP2VNugywWBfWS8bIziLRql
         oxmw==
X-Gm-Message-State: APjAAAVB2Ibcm0CJFUeHucu2ySp+VCynw9SYlT1h7eGZKDTiFHaRPZh4
        GDYH7GuMMgWNn9+zgEl7MKOhMQxSieL0HHSs94I=
X-Google-Smtp-Source: APXvYqzd8z3guhs3IP/Z1PH6HAlZRmzgWH2KryDxe+WMFzQ00Nc6/QiNAxg6kWgyDMDqHMtreo5WQbC+S1M3gqGMEKI=
X-Received: by 2002:a02:654d:: with SMTP id u74mr2212740jab.115.1565211735427;
 Wed, 07 Aug 2019 14:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com> <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
In-Reply-To: <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Wed, 7 Aug 2019 14:02:04 -0700
Message-ID: <CAHQ1cqERSwrRvM-ecgH6e1niqOA_uMywzNgVx86-Wy03RwHxZg@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 7, 2019 at 2:00 PM Fabio Estevam <festevam@gmail.com> wrote:
>
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
>

Sure, will do.

Thanks,
Andrey Smirnov
