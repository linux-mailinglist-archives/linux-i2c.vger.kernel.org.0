Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305673899FC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 01:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhESXoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 19:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhESXon (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 19:44:43 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78163C061574;
        Wed, 19 May 2021 16:43:21 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id 82so3150720qki.8;
        Wed, 19 May 2021 16:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jZj61H+nZldX9VF8Rk7SoLRZEnhdWQ15nrHYMIdlXL8=;
        b=hV289Pn1fzt0l5vYzw9Zco9XFbeqr0tKlwl117wL+ReIbVLezHs/xFwIcMKafGIL/r
         Ceq9AJkQHisWMOwWZVoe+E3BdzypGyKrbGtP5GVg+wjxmevjIE5q30D1Z3rQCTBmbzyl
         JopSkzzu13aCRFAkE3C3pYN93lb/AFgpuiOcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZj61H+nZldX9VF8Rk7SoLRZEnhdWQ15nrHYMIdlXL8=;
        b=lp61uGh8Hi7ghuYkGlyKVBIBYtXo81zHvu83/yEYPxuGl0V6SC5xvEMDX69NMdeQo+
         SmTmaWdybKle19AZbz3pHQYb79aGXegDIaoor97qCmBgXUU4VuLU6joIxnBsjKSK0t7E
         ODq9vHxpJ0LYoP2d1x6vgmZPX6jnGqh1crUM6USvjx88kJKNN2jM9bwyyp/CeDz3X0zx
         C76Wyfuy1R2O5uan39xGCV9swGTB8zcPje4fNbjS6jZjT4YdBfuLbEb7ECs/eoNwcAc9
         tb0vX6yNwTOvG8dxaG9mRCnKcYOtRL33pwMtyun17LDB5BwmA9c/1GFVG1WbkrB853mJ
         TVvw==
X-Gm-Message-State: AOAM53317Vs6W6Mi4Cra3YLZSRjLWcnefHfKOzOkZHUJObQHc06W0k+D
        pCKirJrVUlprkdUJjsEUk2zRvFe3E14Tjk+x0gM=
X-Google-Smtp-Source: ABdhPJyUszWiuobnzOy5L9VplXiMBG9qLzJjbpbR0WfzIFw8cspGiZ3PnAV6tV3oDvUEgCvPn/rTmcBK9mwiyYTq9ws=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr1331345qkc.66.1621467800517;
 Wed, 19 May 2021 16:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074934.20712-1-quan@os.amperecomputing.com> <20210519074934.20712-5-quan@os.amperecomputing.com>
In-Reply-To: <20210519074934.20712-5-quan@os.amperecomputing.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 19 May 2021 23:43:08 +0000
Message-ID: <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> With Tx done w/wo ACK are ack'ed early at beginning of irq handler,

Is w/wo a typo? If not, please write the full words ("with and without")

> it is observed that, usually, the Tx done with Ack irq raises in the
> READ REQUESTED state. This is unexpected and complaint as below appear:
> "Unexpected Ack on read request"
>
> Assumed that Tx done should only be ack'ed once it was truly processed,
> switch to late ack'ed this two irqs and seen this issue go away through
> test with AST2500..

Please read Guneter's commit message
2be6b47211e17e6c90ead40d24d2a5cc815f2d5c to confirm that your changes
do not invalidate the fix that they made.  Add them to CC for review.

Again, this is a fix that is independent of the ssif work. Please send
it separately with a Fixes line.

>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
>
>  drivers/i2c/busses/i2c-aspeed.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 3fb37c3f23d4..b2e9c8f0ddf7 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -606,8 +606,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>
>         spin_lock(&bus->lock);
>         irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -       /* Ack all interrupts except for Rx done */
> -       writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> +       /*
> +        * Ack all interrupts except for Rx done and
> +        * Tx done with/without ACK

Nit: this comment can be on one line.


> +        */
> +       writel(irq_received &
> +              ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>                bus->base + ASPEED_I2C_INTR_STS_REG);
>         readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>         irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
> @@ -652,12 +656,18 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>                         "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>                         irq_received, irq_handled);
>
> -       /* Ack Rx done */
> -       if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
> -               writel(ASPEED_I2CD_INTR_RX_DONE,
> -                      bus->base + ASPEED_I2C_INTR_STS_REG);
> -               readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -       }
> +       /* Ack Rx done and Tx done with/without ACK */
> +       /* Note: Re-use irq_handled variable */

I'm not sure what this note means.

> +       irq_handled = 0;
> +       if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
> +               irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
> +       if (irq_received & ASPEED_I2CD_INTR_TX_ACK)
> +               irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
> +       if (irq_received & ASPEED_I2CD_INTR_TX_NAK)
> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +       writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);

Are you intentionally only acking the bits that are set when we read
from STS_REG at the start of the handler? If not, we could write this
instead:

writel(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
ASPEED_I2CD_INTR_TX_NAK,
        bus->base + ASPEED_I2C_INTR_STS_REG);

If you only want to ack the bits that are set, then do this:

  writel(irq_received &
            (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
ASPEED_I2CD_INTR_TX_NAK),
         bus->base + ASPEED_I2C_INTR_STS_REG);

That way, you can avoid all of the tests.

> +       readl(bus->base + ASPEED_I2C_INTR_STS_REG);

When you move this, please add a comment that reminds us why we do a
write-then-read (see commit c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a).

> +
>         spin_unlock(&bus->lock);
>         return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
> --
> 2.28.0
>
