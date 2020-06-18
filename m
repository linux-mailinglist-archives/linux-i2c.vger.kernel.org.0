Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98181FF963
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 18:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbgFRQjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jun 2020 12:39:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33093 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgFRQjh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Jun 2020 12:39:37 -0400
Received: by mail-oi1-f195.google.com with SMTP id i74so5670786oib.0;
        Thu, 18 Jun 2020 09:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2S2OZsPCKAM4csibK9QSj1TPoAyTBhXpQ95zpmfcEi0=;
        b=OalT2aZmo0/bxDSmypDtmVwKJ2mjG378o0fpshr5j0a8pYln2ll/oPDZb3Wwrgkpds
         x7FbRZbXpH55TiXYaD0sRRLsjwMs4SwFOatqMibd09O3Q5X4z9IZ5o4SvjDccJHv4ORs
         QlEnwq6S0eJQb1WVL7To8N52xMh5+kG4zk6ejO3G8zwHY0lSFjOLyDuxiw27adOh1PYw
         F7advU/W2dL8c8jHSJObcMK/CFRe+M/xpG9RL8zsz8FsnOP+LaPPjem6J3wv5NSkeBri
         e75XMhii7aSrydXe2g6L6rMCZdEPhNVcdt+FpIUMKNCN6WyphrvMPMtrGIyPlkgzzrQL
         NrkQ==
X-Gm-Message-State: AOAM532pXpcD2OIj6lkfMEwcl6w5It+2CsgHwYf5Zkem3UcLGZ1Yiz4a
        1149EBOE0MmcsMaCBpiFg48GiLPgLLVyUdNGo/W9cpl4
X-Google-Smtp-Source: ABdhPJyrx3TL7d2g8wmfUN5NWtmPOZ2+pa1l0G3G0sM+8K7G9UStCQmNxxi/WBQcsWwJ+WxSYd6q3FmkJjmnmxxEfOc=
X-Received: by 2002:aca:1a19:: with SMTP id a25mr3732279oia.54.1592498374464;
 Thu, 18 Jun 2020 09:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150532.2923-1-uli+renesas@fpond.eu>
In-Reply-To: <20200618150532.2923-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 18:39:23 +0200
Message-ID: <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uli,

On Thu, Jun 18, 2020 at 5:05 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c

> @@ -581,12 +585,14 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
>         pd->pos = -1;
>         pd->sr = 0;
>

    if (pd->atomic_xfer)
            return;

and be done with it?

> -       pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
> -       if (pd->dma_buf)
> -               sh_mobile_i2c_xfer_dma(pd);
> -
> -       /* Enable all interrupts to begin with */
> -       iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
> +       if (!pd->atomic_xfer) {
> +               pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
> +               if (pd->dma_buf)
> +                       sh_mobile_i2c_xfer_dma(pd);
> +               /* Enable all interrupts to begin with */
> +               iic_wr(pd, ICIC,
> +                      ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
> +       }
>  }
>
>  static int poll_dte(struct sh_mobile_i2c_data *pd)
> @@ -637,15 +643,13 @@ static int poll_busy(struct sh_mobile_i2c_data *pd)
>         return i ? 0 : -ETIMEDOUT;
>  }
>
> -static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
> -                             struct i2c_msg *msgs,
> -                             int num)
> +static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
> +                        struct i2c_msg *msgs, int num)
>  {
> -       struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
>         struct i2c_msg  *msg;
>         int err = 0;
>         int i;
> -       long timeout;
> +       long time_left;
>
>         /* Wake up device and enable clock */
>         pm_runtime_get_sync(pd->dev);

pm_runtime_get_sync() is a wrapper around __pm_runtime_resume(), which
does:

        might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
                        dev->power.runtime_status != RPM_ACTIVE);

So if the device is not active (it is not), the might_sleep() is
triggered, and I expect a BUG splat.
However, with CONFIG_DEBUG_ATOMIC_SLEEP disabled (I disabled it on
koelsch, as it increases kernel size beyond the bootloader limit),
might_sleep() is a no-op, so nothing happens.
After enabling it (and disabling drm and media), still nothing...

It turns out ___might_sleep() does:

    if ((preempt_count_equals(preempt_offset) && !irqs_disabled() &&
         !is_idle_task(current) && !current->non_block_count) ||
        system_state == SYSTEM_BOOTING || system_state > SYSTEM_RUNNING ||
        oops_in_progress)
            return;

and as per:

    static inline bool i2c_in_atomic_xfer_mode(void)
    {
            return system_state > SYSTEM_RUNNING && irqs_disabled();
    }

system_state > SYSTEM_RUNNING, and ___might_sleep() just ignores any
issues. Oops...
After removing that check, it starts complaining:

    BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:281
    in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1, name:
systemd-shutdow

In general, pm_runtime_get_sync() is not safe to call from atomic
context.
For Renesas SoCs, I think both the power and clock domains are safe, as
the respective drivers don't sleep.  The PM core might, though.

> @@ -662,15 +666,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
>                 if (do_start)
>                         i2c_op(pd, OP_START);
>
> -               /* The interrupt handler takes care of the rest... */
> -               timeout = wait_event_timeout(pd->wait,
> -                                      pd->sr & (ICSR_TACK | SW_DONE),
> -                                      adapter->timeout);
> +               if (pd->atomic_xfer) {
> +                       unsigned long j = jiffies + pd->adap.timeout;
> +
> +                       time_left = time_before_eq(jiffies, j);
> +                       while (time_left &&

Who's updating time_left?

> +                              !(pd->sr & (ICSR_TACK | SW_DONE))) {
> +                               unsigned char sr = iic_rd(pd, ICSR);
> +
> +                               if (sr & (ICSR_AL   | ICSR_TACK |
> +                                         ICSR_WAIT | ICSR_DTE)) {
> +                                       sh_mobile_i2c_isr(0, pd);
> +                                       udelay(150);
> +                               } else {
> +                                       cpu_relax();
> +                               }
> +                       }
> +               } else {
> +                       /* The interrupt handler takes care of the rest... */
> +                       time_left = wait_event_timeout(pd->wait,
> +                                       pd->sr & (ICSR_TACK | SW_DONE),
> +                                       pd->adap.timeout);
> +
> +                       /* 'stop_after_dma' tells if DMA xfer was complete */
> +                       i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg,
> +                                                pd->stop_after_dma);
>
> -               /* 'stop_after_dma' tells if DMA transfer was complete */
> -               i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, pd->stop_after_dma);
> +               }
>
> -               if (!timeout) {
> +               if (!time_left) {
>                         dev_err(pd->dev, "Transfer request timed out\n");
>                         if (pd->dma_direction != DMA_NONE)
>                                 sh_mobile_i2c_cleanup_dma(pd);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
