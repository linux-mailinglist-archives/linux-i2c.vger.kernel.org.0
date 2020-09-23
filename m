Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8AB2759BD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 16:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgIWORf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 10:17:35 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40478 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWORf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 10:17:35 -0400
Received: by mail-ot1-f68.google.com with SMTP id e23so19096490otk.7;
        Wed, 23 Sep 2020 07:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSeybIBU3kGA2PcrZleCzYug44g495BTjxa9JqK9OKc=;
        b=d4DSqIXhTBQGPICCO//oaLJvm9k6ve5Pie/iyErDIlhkFwfjD4sG9AZq0DDWB4ScVm
         JW/AF5vBF5Y7qXAQMZvsB7/JG8QwqcRH0kp5mlO+WPSTQi5SObcmgYn3baSNNQaFxonJ
         /6HKB2RysjgJUBYJbMrZBO5/0RDq2n4WdR7lrq3R1a2byw2/prbxpe4JQ5CICIzM4Shp
         BY4hM4IzP8F6MGeAZRRegytHem+QRAIRCXCO9+xqCfLZB63cKB+OsTW3yJgylaWewn3Y
         2jeWuLIemRaE10NkPTyox8HojBmrFVAwmdzDeROhBfJvBYijv2dtsLRoJ/Zrh4U703xm
         Ijzg==
X-Gm-Message-State: AOAM531rlezypHkRHQtVwVNcos75MqQ+JkQLEsNFTbxbf8ae/b4cP3Ub
        Oca0N+2knXqoOcdi72ixCFinYg/cMEJG9mk7OwlqEY3E
X-Google-Smtp-Source: ABdhPJw/KoDzFtMyhYkvfFwDr5n2859py+1+HhxKo1UDpc0TYwvGy9TOEgrCqAZR4ZbM/xnIapI05JIh05CrefBETFo=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr6155070oth.145.1600870654343;
 Wed, 23 Sep 2020 07:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200922154943.29574-1-uli+renesas@fpond.eu>
In-Reply-To: <20200922154943.29574-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 16:17:23 +0200
Message-ID: <CAMuHMdXF7kX0u_awH3w8sCAvAQUN7dzZix6anSrrafwTjpLBUg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: sh_mobile: implement atomic transfers
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uli,

On Tue, Sep 22, 2020 at 5:49 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This is a rebased version of v2 with a minor issue fixed. It does not
> resolve the runtime PM issue that may arise (see "watchdog: da9063: wake up
> parent ahead of reboot", https://patchwork.kernel.org/patch/11749121/ ), but
> in practice it works, and our understanding so far is that this will have to
> be resolved outside this driver and should IMO not block this patch.

See my comment below.

> Changes since v2:
> - rebase
> - make sure time_left is updated

Thanks for the update!

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c

> @@ -429,7 +432,8 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
>
>         if (wakeup) {
>                 pd->sr |= SW_DONE;
> -               wake_up(&pd->wait);
> +               if (!pd->atomic_xfer)
> +                       wake_up(&pd->wait);
>         }
>
>         /* defeat write posting to avoid spurious WAIT interrupts */
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

> @@ -696,14 +721,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
>         return err ?: num;
>  }
>
> +static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
> +                             struct i2c_msg *msgs,
> +                             int num)
> +{
> +       struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
> +
> +       pd->atomic_xfer = false;
> +       return sh_mobile_xfer(pd, msgs, num);
> +}
> +
> +static int sh_mobile_i2c_xfer_atomic(struct i2c_adapter *adapter,
> +                                    struct i2c_msg *msgs,
> +                                    int num)
> +{
> +       struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
> +

To make sure external conditions are satisfied, and we never deadlock:

    if (pd->dev->power.is_suspended)
            return -EPERM;  /* any other suitable error code? */

Perhaps this can even be done in the i2c core instead?

> +       pd->atomic_xfer = true;
> +       return sh_mobile_xfer(pd, msgs, num);
> +}

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
