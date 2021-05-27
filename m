Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868A239283E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 09:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbhE0HPE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 03:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234709AbhE0HPD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 03:15:03 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43540C061574
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 00:13:28 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id lg14so6370986ejb.9
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 00:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7d6rD7/V6Y9LKWJDti8OGp2OsRqZR18e/m5mE83otg=;
        b=evcyVQtJRlTtU2OHcLDuJO3XkgHCRm8HbTsK7GLVkUeDfQrLL/T6+pC/QukA5b+aab
         SDRyUHJKs+9RYxnHecVJrrGB2pSUAXTOptdBcXOagHRTo9m62JmDpT3URmIUeSPiVPP9
         PoWzq4t+A02ff3jhiuHN3KzlthTjmhRh3aaRO/Bv1c4VyUNayHijXES7940ub3sy8bOK
         dAElUZWLaWaheI5ScVM0NhGmdBjbJIWvBnmFr8fX88pzIoEleHlYJL2FCdwsn0d1Ulh+
         n5NTMBCXlOnc3IHOJhfzA4QuNikBhjZPV++Lga0+PvwLfvVpTMRw20nUdn+Ng8kQOOUA
         7z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7d6rD7/V6Y9LKWJDti8OGp2OsRqZR18e/m5mE83otg=;
        b=F74Ch/A9GfFu+Du9YkLhYABpq6Y47LQdPgWNQ9dGFGfrnaLnhVC3+9Iwex2EXWU3qF
         ARnbqLTc88cZd/G6L+KfxA0k9xRdvVA2rmSPkTGn8VS0t5e+KBtVMLBWeg78dpa1r62Q
         4qi0IvynXI71KBcPg5x8S0Fg7UrdyC89w+C1hUgiUrnxBmJOucbMjSNhioXBkQ3aOUUb
         i/7lCcZeSTuWU9/VRIQrxxI9a9uSIAuehaAxQnP1TFFo6V/+pnPByi+xpOOiEQs5SpRy
         U2KS/52ReOY+O/FYypG3MnKQewXGI8gx96QBZ+1Q740MjKXTfd7iS5QxTEqcVKF6d/HA
         xx0Q==
X-Gm-Message-State: AOAM530AhrlIrhHOMJG48ofIepEdyTlE3sFNk5WGQv7yquFPernkegzl
        sTiq5DPl/rLe8uXNUfbfGY5ecJth1srC8qUMOghqBw==
X-Google-Smtp-Source: ABdhPJy7wPBRQeZslYDOCIi35J5XtaEXrSGiNzUO8ZoEiNkKMVOlkHyS+Y+nzPT9SU4eXFr4/qYLh/7Mbw4RbwW2DWM=
X-Received: by 2002:a17:907:990f:: with SMTP id ka15mr2351253ejc.132.1622099606616;
 Thu, 27 May 2021 00:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
 <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com> <20210525141201.1fa59f3b@endymion>
 <d220a961-6653-ec27-430c-727dbe88b665@gmail.com>
In-Reply-To: <d220a961-6653-ec27-430c-727dbe88b665@gmail.com>
From:   Daniel Kurtz <djkurtz@google.com>
Date:   Thu, 27 May 2021 17:13:14 +1000
Message-ID: <CAGS+omC_Ruk5UJHuPy2PqOhmdnnyGA4RwG+2=7oNRXisPzFxeQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: i801: Replace waitqueue with completion API
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean, Heiner,

On Tue, May 25, 2021 at 11:01 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 25.05.2021 14:12, Jean Delvare wrote:
> > Hi Heiner,
> >
> > Adding Daniel Kurtz, who wrote the original wait queue-based code, to
> > Cc. I'm not sure if Daniel is still into kernel code though.

Thanks for thinking of me!  I'm still into kernel code, but I do a lot
more reading than writing these days.

> >
> > On Sat, 22 May 2021 00:02:43 +0200, Heiner Kallweit wrote:
> >> Using the completion API is more intuitive and it allows to simplify
> >> the code. Note that we don't have to set priv->status = 0 any longer
> >> with the completion API.
> >
> > OK, but you need to call reinit_completion() instead, which has the
> > same cost. So that's not a good argument ;-)
> >
> Maybe my comment wasn't clear enough. I didn't want to say that we
> save something but that it's safe from a functional point of view
> to remove clearing priv->status.
>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-i801.c | 48 ++++++++++++++---------------------
> >>  1 file changed, 19 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >> index bfea94d02..738204d77 100644
> >> --- a/drivers/i2c/busses/i2c-i801.c
> >> +++ b/drivers/i2c/busses/i2c-i801.c
> >> @@ -103,7 +103,7 @@
> >>  #include <linux/dmi.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/string.h>
> >> -#include <linux/wait.h>
> >> +#include <linux/completion.h>
> >>  #include <linux/err.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/platform_data/itco_wdt.h>
> >> @@ -270,7 +270,7 @@ struct i801_priv {
> >>      unsigned int features;
> >>
> >>      /* isr processing */
> >> -    wait_queue_head_t waitq;
> >> +    struct completion done;
> >>      u8 status;
> >>
> >>      /* Command state used by isr for byte-by-byte block transactions */
> >> @@ -496,24 +496,19 @@ static int i801_wait_byte_done(struct i801_priv *priv)
> >>  static int i801_transaction(struct i801_priv *priv, int xact)
> >>  {
> >>      int status;
> >> -    int result;
> >> +    unsigned long result;
> >>      const struct i2c_adapter *adap = &priv->adapter;
> >>
> >> -    result = i801_check_pre(priv);
> >> -    if (result < 0)
> >> -            return result;
> >> +    status = i801_check_pre(priv);
> >> +    if (status < 0)
> >> +            return status;
> >>
> >>      if (priv->features & FEATURE_IRQ) {
> >> +            reinit_completion(&priv->done);
> >>              outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
> >>                     SMBHSTCNT(priv));
> >> -            result = wait_event_timeout(priv->waitq,
> >> -                                        (status = priv->status),
> >> -                                        adap->timeout);
> >> -            if (!result)
> >> -                    status = -ETIMEDOUT;
> >> -
> >> -            priv->status = 0;
> >> -            return i801_check_post(priv, status);
> >> +            result = wait_for_completion_timeout(&priv->done, adap->timeout);
> >> +            return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
> >>      }
> >>
> >>      /* the current contents of SMBHSTCNT can be overwritten, since PEC,
> >> @@ -638,7 +633,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
> >>   *      DEV_ERR - Invalid command, NAK or communication timeout
> >>   *      BUS_ERR - SMI# transaction collision
> >>   *      FAILED - transaction was canceled due to a KILL request
> >> - *    When any of these occur, update ->status and wake up the waitq.
> >> + *    When any of these occur, update ->status and signal completion.
> >>   *    ->status must be cleared before kicking off the next transaction.
> >>   *
> >>   * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
> >> @@ -675,7 +670,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
> >>      if (status) {
> >>              outb_p(status, SMBHSTSTS(priv));
> >>              priv->status = status;
> >> -            wake_up(&priv->waitq);
> >> +            complete(&priv->done);
> >>      }
> >>
> >>      return IRQ_HANDLED;
> >> @@ -694,15 +689,15 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
> >>      int i, len;
> >>      int smbcmd;
> >>      int status;
> >> -    int result;
> >> +    unsigned long result;
> >>      const struct i2c_adapter *adap = &priv->adapter;
> >>
> >>      if (command == I2C_SMBUS_BLOCK_PROC_CALL)
> >>              return -EOPNOTSUPP;
> >>
> >> -    result = i801_check_pre(priv);
> >> -    if (result < 0)
> >> -            return result;
> >> +    status = i801_check_pre(priv);
> >> +    if (status < 0)
> >> +            return status;
> >>
> >>      len = data->block[0];
> >>
> >> @@ -726,15 +721,10 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
> >>              priv->count = 0;
> >>              priv->data = &data->block[1];
> >>
> >> +            reinit_completion(&priv->done);
> >>              outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
> >> -            result = wait_event_timeout(priv->waitq,
> >> -                                        (status = priv->status),
> >> -                                        adap->timeout);
> >> -            if (!result)
> >> -                    status = -ETIMEDOUT;
> >> -
> >> -            priv->status = 0;
> >> -            return i801_check_post(priv, status);
> >> +            result = wait_for_completion_timeout(&priv->done, adap->timeout);
> >> +            return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
> >>      }
> >>
> >>      for (i = 1; i <= len; i++) {
> >> @@ -1889,7 +1879,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >>      }
> >>
> >>      if (priv->features & FEATURE_IRQ) {
> >> -            init_waitqueue_head(&priv->waitq);
> >> +            init_completion(&priv->done);
> >>
> >>              err = devm_request_irq(&dev->dev, dev->irq, i801_isr,
> >>                                     IRQF_SHARED,
> >
> > The clean-up isn't massive but I agree the code is a bit more pleasant
> > to read after the change, and I also see the binary size shrink a bit,
> > so I vote for it.
> >
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Tested-by: Jean Delvare <jdelvare@suse.de>
> >
>

I agree, shorter and sweeter. Thanks for cleaning this up!

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
