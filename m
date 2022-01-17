Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B00490208
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 07:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiAQGjB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 01:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiAQGjB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 01:39:01 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F54C061574;
        Sun, 16 Jan 2022 22:39:01 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id l17so18287506qtk.7;
        Sun, 16 Jan 2022 22:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SCIluCFzTxQ0TtrLY6TuEHxf2MUxrzhJh6COmbq3iWU=;
        b=XUOQMXTUtcTfOf9BsQpiygXXKiUZc56gNZVtQH+/NF1tVv/BkUFzyjB3SIKUb+dbuQ
         KPrNrebmoNr4hVysDx284sWPjG7Zfyf2h6Dl9k1ORBcfkqgytMJtXBVGLGS9F62Ua+3U
         Q+JTzHzydRtLOW7WPYw8iKLVlXLfYM2fUPRfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SCIluCFzTxQ0TtrLY6TuEHxf2MUxrzhJh6COmbq3iWU=;
        b=ILRJgHtfauNxr83wxsav4JfZT0UBAIY9It3mujIFtBiaoUemxxnPLV7S7Y3lTImDt7
         Pt7P/MYj+G1fGfGrUzjDo8mi6iqbHvM/V6UuEMHmt+8cwD5q0K/dnBgeysE8sdghjW3G
         HdP31cjSWTbcmR8/fl4/EZxgYwrZN+gl36UnGzNUhaOTkOyLKmYN/Ald5WENxzgckRcM
         EeeA6hnFtFPISSpNNjMXBVq9UnVRBo702mP8YVhCVNLHloqKcdCPkzxpXcJHOxKEYfAG
         o8hh75WJHLKLJkW2rt2NYJ31q1M1Jp/5zvq4e9qHkR+NEKkTFioiBfPKT5sV/9clQ/jQ
         am+g==
X-Gm-Message-State: AOAM5301TkD/NKOJDEMRoJ+dVzXt5GvAy9rdahPM1qJXOvgODgMWu5Yr
        WFnHpDr+PMq1qiYU+ruUm/nBuLMuAYGlmzRHhFxX42eAABU=
X-Google-Smtp-Source: ABdhPJx3A0SkN3aZCX5+Oi0LolEDukEZHIZ692Qeofq4HDx8uEkmYcqjeqjrsjqSUuJ2WKtgmVX8UiT86lQy8L2WoxI=
X-Received: by 2002:a05:622a:1116:: with SMTP id e22mr7453887qty.58.1642401540369;
 Sun, 16 Jan 2022 22:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
 <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com> <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
 <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com>
In-Reply-To: <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 17 Jan 2022 06:38:48 +0000
Message-ID: <CACPK8Xc+v132vM-ytdAUFhywFXGpPF+uPSBWi68ROf_PLD4VQQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after timeout
To:     Heyi Guo <guoheyi@linux.alibaba.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 at 14:01, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi Joel,
>
>
> =E5=9C=A8 2022/1/11 =E4=B8=8B=E5=8D=886:51, Joel Stanley =E5=86=99=E9=81=
=93:
> > On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wrot=
e:
> >> Hi all,
> >>
> >> Any comments?
> >>
> >> Thanks,
> >>
> >> Heyi
> >>
> >> =E5=9C=A8 2022/1/9 =E4=B8=8B=E5=8D=889:26, Heyi Guo =E5=86=99=E9=81=93=
:
> >>> The memory will be freed by the caller if transfer timeout occurs,
> >>> then it would trigger kernel panic if the peer device responds with
> >>> something after timeout and triggers the interrupt handler of aspeed
> >>> i2c driver.
> >>>
> >>> Set the msgs pointer to NULL to avoid invalid memory reference after
> >>> timeout to fix this potential kernel panic.
> > Thanks for the patch. How did you discover this issue? Do you have a
> > test I can run to reproduce the crash?
>
> We are using one i2c channel to communicate with another MCU by
> implementing user space SSIF protocol, and the MCU may not respond in
> time if it is busy. If it responds after timeout occurs, it will trigger
> below kernel panic:
>

Thanks for the details. It looks like you've done some testing of
this, which is good.

> After applying this patch, we'll get below warning instead:
>
> "bus in unknown state. irq_status: 0x%x\n"

Given we get to here in the irq handler, we've done these two tests:

 - aspeed_i2c_is_irq_error()
 - the state is not INACTIVE or PENDING

but there's no buffer ready for us to use. So what has triggered the
IRQ in this case? Do you have a record of the irq status bits?

I am wondering if the driver should know that the transaction has
timed out, instead of detecting this unknown state.


> > Can you provide a Fixes tag?
>
> I think the bug was introduced by the first commit of this file :(
>
> f327c686d3ba44eda79a2d9e02a6a242e0b75787
>
>
> >
> > Do other i2c master drivers do this? I took a quick look at the meson
> > driver and it doesn't appear to clear it's pointer to msgs.
>
> It is hard to say. It seems other drivers have some recover scheme like
> aborting the transfer, or loop each messages in process context and
> don't do much in IRQ handler, which may disable interrupts or not retain
> the buffer pointer before returning timeout.

I think your change is okay to go in as it fixes the crash, but first
I want to work out if there's some missing handling of a timeout
condition that we should add as well.


>
> Thanks,
>
> Heyi
>
>
> >
> >>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >>>
> >>> -------
> >>>
> >>> Cc: Brendan Higgins <brendanhiggins@google.com>
> >>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >>> Cc: Joel Stanley <joel@jms.id.au>
> >>> Cc: Andrew Jeffery <andrew@aj.id.au>
> >>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >>> Cc: linux-i2c@vger.kernel.org
> >>> Cc: openbmc@lists.ozlabs.org
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> Cc: linux-aspeed@lists.ozlabs.org
> >>> ---
> >>>    drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> >>>    1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c=
-aspeed.c
> >>> index 67e8b97c0c950..3ab0396168680 100644
> >>> --- a/drivers/i2c/busses/i2c-aspeed.c
> >>> +++ b/drivers/i2c/busses/i2c-aspeed.c
> >>> @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_ada=
pter *adap,
> >>>                spin_lock_irqsave(&bus->lock, flags);
> >>>                if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PENDING=
)
> >>>                        bus->master_state =3D ASPEED_I2C_MASTER_INACTI=
VE;
> >>> +             /*
> >>> +              * All the buffers may be freed after returning to call=
er, so
> >>> +              * set msgs to NULL to avoid memory reference after fre=
eing.
> >>> +              */
> >>> +             bus->msgs =3D NULL;
> >>>                spin_unlock_irqrestore(&bus->lock, flags);
> >>>
> >>>                return -ETIMEDOUT;
