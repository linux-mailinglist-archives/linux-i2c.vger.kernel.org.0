Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA15375EEA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 04:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhEGC4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 22:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhEGC4Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 22:56:24 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBEDC061574;
        Thu,  6 May 2021 19:55:24 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id c3so6538095ils.5;
        Thu, 06 May 2021 19:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8cTSVQulBeITLa2/m1dmitAiZk9XtTtJnEzh3hUGeoU=;
        b=cT2ueQbZYQ5FJAitvJOWcefEXBE/+kkX/R4/Kq67RZRWnT/5Uww8mZr34d6Tp9V7oR
         IZtosX+BEeg7jtZg8NZUeSj13AoRPf9hZZjreEJ2q3niNvpcjOQ9HYP8xvf87w6dynH+
         1tgraxqqCO8fZSn8m2y7m1mHoWWTurzSyvUJuWftsFrnIckGyWw4wAY1/DppiCOGnT2s
         P4s1EJgQIoYUCpxIZSB5QuU0rpv7xCfl/+916ySp9TcPw3Uy61U7fUA6Cw3pAy34FYOV
         DN2PgcGtJTQrQmi3V0IL7MVr9QuZJ1ZyhetBAScR2IC8FeSPc9m3j1RR2FS7ZOKm6yTQ
         HMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8cTSVQulBeITLa2/m1dmitAiZk9XtTtJnEzh3hUGeoU=;
        b=P7QfdETbsjC5xE8eqizvyzSuylmN35awYOFLVf69GC0HmMIbm8ipJksJfdOo41mIMp
         vWAWEyXLdR6aZsTfeHZYqqLlAgU4+Y3pC8gYdg4z2F8BL62yr1bYH+nwLZv8T9Hqo88U
         ZnbxVFX+0h7MMF2IaLUYbAzOzMZhLOnrIPRoRiu59C4rEmG3uEuRCUgM61+L9tZrzhyP
         jCOeqGZ+WMX4YzlQfcgmevUAhNKm4VF0RvUMPW5kAv2wBSEOQ+11kUPvV1JeWd7YNxJh
         KrGhP5puP1GrbFcilZhlK0vttLBtmkF3jQ7XT2Qcrt7s6AIvOT1f5bwpXG1YHmTeF3Mv
         AHLw==
X-Gm-Message-State: AOAM532a1wKGZDctd6h0uQ517s0ymWZvZDnoh0X+/EjWCAcJEcbf1upr
        r+XVQSC6hJTBVU1uvX/2yulSb8FRepdhxf+EatU=
X-Google-Smtp-Source: ABdhPJw2RBOr2b1dAal8DBdHKDFJPjaMT1E1faSTNgTk5hI83mVNs5XiUZDhlNQbktQ/l4JJRdV37hjRqUN1IaKqYAU=
X-Received: by 2002:a05:6e02:e0d:: with SMTP id a13mr7322226ilk.270.1620356123603;
 Thu, 06 May 2021 19:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
 <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com> <20210315130050.GD1182@ninjato>
In-Reply-To: <20210315130050.GD1182@ninjato>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Fri, 7 May 2021 10:54:47 +0800
Message-ID: <CAL9mu0LnHAUSMXmQpZK78QAccqrc58cyFC2GD4cBkTNW41rvKA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
To:     Wolfram Sang <wsa@kernel.org>, pierre-yves.mordret@foss.st.com,
        alain.volmat@foss.st.com
Cc:     pierre-yves.mordret@st.com, Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        p.zabel@pengutronix.de,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Pierre-Yves, Alain

Could you help to take a look?
i really appreciate it.

Thanks,

Best Regards
Dillon

On Mon, Mar 15, 2021 at 9:00 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Mar 15, 2021 at 08:43:54PM +0800, dillon min wrote:
> > Hi All,
> >
> > Just a gentle ping.
>
> Pierre-Yves?
>
> >
> > Regards.
> >
> > On Tue, Jun 9, 2020 at 9:27 PM <dillon.minfei@gmail.com> wrote:
> > >
> > > From: dillon min <dillon.minfei@gmail.com>
> > >
> > > as stm32f429's internal flash is 2Mbytes and compiled kernel
> > > image bigger than 2Mbytes, so we have to load kernel image
> > > to sdram on stm32f429-disco board which has 8Mbytes sdram space.
> > >
> > > based on above context, as you knows kernel running on external
> > > sdram is more slower than internal flash. besides, we need read 4
> > > bytes to get touch screen xyz(x, y, pressure) coordinate data in
> > > stmpe811 interrupt.
> > >
> > > so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
> > > in xip mode, have to adjust 'STOP/START bit set position' from last
> > > two bytes to last one bytes. else, will get i2c timeout in reading
> > > touch screen coordinate.
> > >
> > > to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
> > > kernel or has mmu platform.
> > >
> > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > > ---
> > >
> > > V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> > >
> > >  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> > > index d6a69dfcac3f..97cf42ae7fa0 100644
> > > --- a/drivers/i2c/busses/i2c-stm32f4.c
> > > +++ b/drivers/i2c/busses/i2c-stm32f4.c
> > > @@ -93,6 +93,12 @@
> > >  #define STM32F4_I2C_MAX_FREQ           46U
> > >  #define HZ_TO_MHZ                      1000000
> > >
> > > +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
> > > +#define IIC_LAST_BYTE_POS 1
> > > +#else
> > > +#define IIC_LAST_BYTE_POS 2
> > > +#endif
> > > +
> > >  /**
> > >   * struct stm32f4_i2c_msg - client specific data
> > >   * @addr: 8-bit slave addr, including r/w bit
> > > @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> > >         int i;
> > >
> > >         switch (msg->count) {
> > > -       case 2:
> > > +       case IIC_LAST_BYTE_POS:
> > >                 /*
> > >                  * In order to correctly send the Stop or Repeated Start
> > >                  * condition on the I2C bus, the STOP/START bit has to be set
> > > @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> > >                 else
> > >                         stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
> > >
> > > -               for (i = 2; i > 0; i--)
> > > +               for (i = IIC_LAST_BYTE_POS; i > 0; i--)
> > >                         stm32f4_i2c_read_msg(i2c_dev);
> > >
> > >                 reg = i2c_dev->base + STM32F4_I2C_CR2;
> > > @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> > >
> > >                 complete(&i2c_dev->complete);
> > >                 break;
> > > -       case 3:
> > > +       case (IIC_LAST_BYTE_POS+1):
> > >                 /*
> > >                  * In order to correctly generate the NACK pulse after the last
> > >                  * received data byte, we have to enable NACK before reading N-2
> > > --
> > > 2.7.4
> > >
