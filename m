Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23ADA124535
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 12:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfLRLB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 06:01:58 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43287 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRLB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Dec 2019 06:01:57 -0500
Received: by mail-ed1-f65.google.com with SMTP id dc19so1279944edb.10;
        Wed, 18 Dec 2019 03:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jOvy+Wb152d0zqbPj1ADcU3RyJlqbcpQxfTLATNTuZQ=;
        b=PVuXNYDR30Vl0OmPK1uSJ8/tPsKevwn7uSPY4MGZ/nxyH/Oi9o8xAnX+VGgjx1AICE
         5aEyvWakA/ZsPGdeagJcN8I8oDlmJtuiIfkwl3blosCbdenj7/Fd8To9TQNpXKZWp+5S
         RaA69AoMh7LiR3p6N5I6Q/DeOTk1opqaNdljEXK+LoDryFw6tdufAWouMwJa1HX+vfrh
         cuc7LU6miJEuGhbzGzoPn644sI0wjVwZXI7VqsUFWCjQ/+F32hdIR+hIpqhiXKXDsEr7
         cGWMZ6Lt0r6HG1O+6y9ODp459cgFAKRpR9G3SGb8FIXyZ9TLccF+8UcL03AKqM1Gy3lo
         LgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jOvy+Wb152d0zqbPj1ADcU3RyJlqbcpQxfTLATNTuZQ=;
        b=OHjEiAuxrtC0pHkKPFb5ADKORJKPiu+9H9ECRqxSI/Ew+CE2AANBn5QTkGaCxPUO8M
         eP97/HDZcSlSJRYXjq+IgJ33UU89AYgniXUWwb4LeTaZ2a+Hj8M/mR7nLOZ1Scv/pq7t
         t0DlssTwqMtYnK4QmizHonvK/wLL9u7xhtgFf4F/GePagLj7c57FBmIMgNghTZhcAzCX
         puG8mgw5xTYuhp7W4HpvL6WUFYamqZv/hJINl8cxyJt4D0ybe8xTaBSZMv01zfbWYSyE
         YDSAtbk/jfmXQxM668gf3EiM6SG4ikn0u+2l0cR++BDskQZfgRL+lSBQHXZoCGh9dLwU
         wR+A==
X-Gm-Message-State: APjAAAWKFVV16PawgCiR9ElLdwN5NaaB/NuVbagjTTqL+u2phnoUO/gw
        E0Ui+ao1mZEpP2ee+x2A5l4b4WWVFaa8RNcOLVA=
X-Google-Smtp-Source: APXvYqwjFGNoZwWaGD+ER9s2eFutTysDIRNxst+Rt1z3axVUFONKvQSxEEiVuQXpNKTc+8p03XpM24TZxlpMY/WZM24=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr1572715ede.232.1576666916178;
 Wed, 18 Dec 2019 03:01:56 -0800 (PST)
MIME-Version: 1.0
References: <1540378203-1655-1-git-send-email-shubhrajyoti.datta@gmail.com> <20181024105854.GU30658@n2100.armlinux.org.uk>
In-Reply-To: <20181024105854.GU30658@n2100.armlinux.org.uk>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 18 Dec 2019 16:31:44 +0530
Message-ID: <CAKfKVtFLssjC3j3yHvQ98TNGSf=DRdMO+YdUyMn0o91+Jn10Zw@mail.gmail.com>
Subject: Re: [PATCH] i2c: cadence: Implement timeout
To:     Russell King - ARM Linux <linux@armlinux.org.uk>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 24, 2018 at 4:29 PM Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
>
> On Wed, Oct 24, 2018 at 04:20:03PM +0530, shubhrajyoti.datta@gmail.com wrote:
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >
> > In some cases we are waiting in a loop. Replace the infinite wait with
> > the  timeout.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  drivers/i2c/busses/i2c-cadence.c | 30 ++++++++++++++++++++++++++----
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> > index b136057..9c38278 100644
> > --- a/drivers/i2c/busses/i2c-cadence.c
> > +++ b/drivers/i2c/busses/i2c-cadence.c
> > @@ -209,6 +209,7 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
> >       struct cdns_i2c *id = ptr;
> >       /* Signal completion only after everything is updated */
> >       int done_flag = 0;
> > +     unsigned int timeout;
> >       irqreturn_t status = IRQ_NONE;
> >
> >       isr_status = cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
> > @@ -235,6 +236,7 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
> >           ((isr_status & CDNS_I2C_IXR_COMP) ||
> >            (isr_status & CDNS_I2C_IXR_DATA))) {
> >               /* Read data if receive data valid is set */
> > +             timeout = 1000;
> >               while (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) &
> >                      CDNS_I2C_SR_RXDV) {
> >                       /*
> > @@ -253,6 +255,16 @@ static irqreturn_t cdns_i2c_isr(int irq, void *ptr)
> >
> >                       if (cdns_is_holdquirk(id, hold_quirk))
> >                               break;
> > +                     timeout--;
> > +                     if (timeout)
> > +                             mdelay(1);
> > +                     else
> > +                             break;
> > +             }
> > +             if (!timeout) {
> > +                     id->err_status = -ETIMEDOUT;
> > +                     complete(&id->xfer_done);
> > +                     return IRQ_HANDLED;
>
> Good kernel programming principle: Always check for the success
> condition when exiting due to timeout rather than the fact that we
> timed out.
>
> Also, is this _really_ a loop that needs a timeout condition?  Looking
> at the original code, it looks like the purpose of the loop is to read
> more than one byte, and you are introducing a 1ms delay between the
> read of each byte.
Thanks for the review.
I agree will skip this patch.
