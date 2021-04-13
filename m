Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7178E35E0A0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344722AbhDMNwr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 09:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhDMNwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 09:52:46 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8A5C061574;
        Tue, 13 Apr 2021 06:52:26 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id p12so11975119pgj.10;
        Tue, 13 Apr 2021 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G7bCnysN84VQEhynVbns7jnTBwcjJOfh8D98uQKmLX8=;
        b=usIkk7z4qaQSqv9Ht59q/Q4D2dMEUgujRizmguQlu2VQx38pxR3+U7+YsvSDIX9hxp
         zk1Ndmcr6kqKGBmh0DjE2spg/8jSZckHjK6H94i+JDfcwI4vcKKZqz2FewxOtz1Cqigp
         9CT3zr8su0yZtb0zI4gLknBvG0rBvLjUReiG7ZozZL2GuJmxxZtXDyTlIxjfZAA7YRdb
         BD7LwryTU9fjQJmEhnalwEPzUikBy4WWZUVuFcWO+0J8HXuatvMhXdbyHRwZJS4yYeQO
         5glNCQWxLSIEMbsps9WhuiH2/IR7cy0khtaRlx+KaJqbMblscdGVg7Ws8ttnjdrBpy5C
         FzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G7bCnysN84VQEhynVbns7jnTBwcjJOfh8D98uQKmLX8=;
        b=p5Mlb95LWnCY9ai9GYKX96HTio5OqlmTQKXfor+XMZiNqAY1KC0geoBeYi+5NZjZd2
         dV2jUTrRrCt9O0yfGyvn3TaAMt3WjKEI3ZYK99FwZ9lPVVNpCWPKHwmc/Ua8zpzEgG/F
         zG9RSzaSjYaA21GLK+QnDgPZUmZyFID7O3aUnZytVr1O69tKAkhhVGEQUz9UcN+KbYKj
         M9i214qfIMrP3Znz2N6IpP64S+NCd20BPTiWD96TEbJ3l2uYSP5vOtR6winT+2CY6Ra2
         SWIx/VArLXxosUHqUvacQrUIcumdgIM8v74L0jp2CRzusOXF6xWxdT+o/arvYlFVmyu8
         1O/w==
X-Gm-Message-State: AOAM530NQEfQi6UQSKix0ogsg1r8lhaND/2j/dHjvzOWQoFPCu6xx8KE
        fpZ50/ZKsTYLaR6N19UkGNjv8jPtutaV+1mYtekTdT98ZwzGlQ==
X-Google-Smtp-Source: ABdhPJwQLRqKzYUMxqYk0F6k+m9Rd87YasoF4B83KXz3O6lAJJFGDnT+LN9tZorp2ZTGBw8UUc3HVekXbOOf96LIe3o=
X-Received: by 2002:a63:c48:: with SMTP id 8mr31920450pgm.74.1618321945470;
 Tue, 13 Apr 2021 06:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz> <20210413050956.23264-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210413050956.23264-3-chris.packham@alliedtelesis.co.nz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 16:52:09 +0300
Message-ID: <CAHp75VfR2zNmstvqCSRC2=0hf2DRV7sMdmy9-TDkO07KHwLjGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] i2c: mpc: Interrupt driven transfer
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 8:10 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> The fsl-i2c controller will generate an interrupt after every byte
> transferred. Make use of this interrupt to drive a state machine which
> allows the next part of a transfer to happen as soon as the interrupt is
> received. This is particularly helpful with SMBUS devices like the LM81
> which will timeout if we take too long between bytes in a transfer.

Also see my other comments below.

...

> +// SPDX-License-Identifier: GPL-2.0

I think it is better to split this with a removal of old stuff and
updating a copyright notice and go as a last one in the series.

...

> +static char *action_str[] = {

static const char * const action_str[]

> +       "invalid",
> +       "start",
> +       "restart",
> +       "read begin",
> +       "read",
> +       "write",
> +       "stop",
> +};

...

> +       dev_dbg(i2c->dev, "%s: action = %s\n", __func__,
> +               action_str[i2c->action]);

Drop useless __func__. With Dynamic Debug enabled it can be turned on
and off at run time.

...

> +                       /* Generate txack on next to last byte */

Tx ACK ? Ditto for other comments.

...

> +               dev_dbg(i2c->dev, "%s: %s %02x\n", __func__,
> +                       action_str[i2c->action], byte);

You already printed action. Anything changed?

> +               dev_dbg(i2c->dev, "%s: %s %02x\n", __func__,
> +                       action_str[i2c->action], msg->buf[i2c->byte_posn]);

Deduplicate this. Perhaps at the end of switch-case print once with
whatever temporary variable value you want to.

...

> +       case MPC_I2C_ACTION_INVALID:
> +       default:

Does the first one deserve loud WARN?
Otherwise, why is it defined at all?

> +               WARN(1, "Unexpected action %d\n", i2c->action);
> +               break;

...

> +static void mpc_i2c_do_intr(struct mpc_i2c *i2c, u8 status)
>  {

> +       spin_lock_irqsave(&i2c->lock, flags);

Why _irqsave?

...

> +               dev_dbg(i2c->dev, "arbiritration lost\n");

arbitration

...

> +       if (i2c->expect_rxack && (status & CSR_RXAK)) {
> +               dev_dbg(i2c->dev, "no RXAK\n");

You see, you have to be consistent in comments and messages.
Either use TXAK/RXAK, or more verbose 'Tx ACK/Rx ACK' everywhere.

...

> +out:

out_unlock:

> +       spin_unlock_irqrestore(&i2c->lock, flags);

...

> +static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
> +{
> +       struct mpc_i2c *i2c = dev_id;

> +       u8 status = readb(i2c->base + MPC_I2C_SR);

I would split this assignment, so it will be closer to its user.

> +       if (status & CSR_MIF) {
> +               writeb(0, i2c->base + MPC_I2C_SR);
> +               mpc_i2c_do_intr(i2c, status);
> +               return IRQ_HANDLED;
>         }
> +       return IRQ_NONE;
> +}

...

> +       time_left = wait_event_timeout(i2c->waitq, !i2c->block, i2c->adap.timeout);

> +

No need for a blank line here.

> +       if (!time_left)
> +               i2c->rc = -ETIMEDOUT;

> +       else if (time_left < 0)

Redundant 'else'

> +               i2c->rc = time_left;

Can't you return an error code from here, rather than injecting it
somewhere where it doesn't belong to?

>  }

--
With Best Regards,
Andy Shevchenko
