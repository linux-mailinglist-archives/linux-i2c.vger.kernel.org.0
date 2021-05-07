Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE830376575
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 14:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbhEGMtS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 08:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237061AbhEGMtO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 08:49:14 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403D9C061574;
        Fri,  7 May 2021 05:48:14 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id a11so7873222ioo.0;
        Fri, 07 May 2021 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mk4EwzrekJZrdSAA7EbqIo9alX7xTMwjff4rEUAGw50=;
        b=Q+p27H7liWtdNveghjWE4M0JYMGXpH47R+z4/yQCnRlaSbWVvTGUZ4dGRKTpfMkgkJ
         0TNxI1IkOh3c/zFKmN68NMr5M6wGzERUGEVhY9iSis0kFsHgOqcUwaoPM4mXZyB179I9
         4LS1gEvsFKPzjJgiWqFQrYLDAxkq7Ytpx211WmYK2pKkLzPRRxjRQut6Wbaz7w+BM9mK
         uzaT8WeoFp58S9BTgchEvOjmd1HqO1hid3xhRepnwtLNVa5hwxuyRVFVbq8KJO4Qp6B4
         Ya1/YE/F/VXyJusi3VR5QGtEhyTUUlKzVIqTJdC60o9YmOtHTeqMv/X3srQRkVAtDAbz
         QYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mk4EwzrekJZrdSAA7EbqIo9alX7xTMwjff4rEUAGw50=;
        b=N2+DuVxbJWS4uMT/e1K6+qINHBctwL4aaDswJHovSdwN0wiGSO+x9fdfrNycHJ8Ur+
         7rOoztyNbk/xFdBWFWgg/S8L7qcI5RBkmMxFWMzcVh0LImWSf8Q88Nc5XFfMb4NURZrN
         +k6lWIY46vLAJinoMFc9PSXDHQxahLCOVzHsYpiT/zc6vMfVXBXwv5bG1z84vY4IyyPD
         syD/Pwwh9z4crgC1Bs7QLZQ2iiZziAP7LFLTnSJcRTzDJYaI9NTjuVx9AYiZpmL63ido
         H5gJfXXS4ml9gT3qOhK8A8jTVkf77h8gMO7zg7H1GG98Mx4tswiZ1nVDFH3gNnB7I7ss
         JCaQ==
X-Gm-Message-State: AOAM530s/dg5EVdoAOjYEw5lEMzeTxARjJPopaha9A6IuFQ0VYRM71AO
        Et5bD7CFV+xsQUf60BUe0gZO/17uR0PSfj0shLM=
X-Google-Smtp-Source: ABdhPJwPbvjWHr01saa83aWFkZY7Vk+QdkcFUYqD4XswGLnZ95C0ePucQ4gCrb9TGnOkg+xXFhE6UzvQ5plsvMYlmPA=
X-Received: by 2002:a6b:7944:: with SMTP id j4mr7561028iop.60.1620391693706;
 Fri, 07 May 2021 05:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
 <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com>
 <20210315130050.GD1182@ninjato> <CAL9mu0LnHAUSMXmQpZK78QAccqrc58cyFC2GD4cBkTNW41rvKA@mail.gmail.com>
 <ff2bc09d-1a17-50d4-d3ee-16fd3a86d7f1@foss.st.com>
In-Reply-To: <ff2bc09d-1a17-50d4-d3ee-16fd3a86d7f1@foss.st.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Fri, 7 May 2021 20:47:37 +0800
Message-ID: <CAL9mu0KGkwbdj+KVddgXooS0=oBWohf+xHEgnYoHzu+9wQjjpg@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz
 data timeout issue
To:     Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc:     Wolfram Sang <wsa@kernel.org>, pierre-yves.mordret@foss.st.com,
        alain.volmat@foss.st.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
        pierre-yves.mordret@st.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        p.zabel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrice

Thanks for the reply.

On Fri, May 7, 2021 at 8:29 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi Dillon
>
> In order to test this patch, it's tricky to make a recent kernel running
> on stm32f429-disco as this board embeds only 8MB of SDRAM and 2MB of flash.
>
> Can you indicates us which kernel version you are using and also the kernel config please ?

Since this patch was submitted in last year, might it be 5.0?  not for sure
Anyway, I will resubmit it in the recent kernel version with the kernel config
and a detailed test step for you.

Thanks for your time.

>
> Thanks
>
> Patrice
>
> On 5/7/21 4:54 AM, dillon min wrote:
> > Hi Pierre-Yves, Alain
> >
> > Could you help to take a look?
> > i really appreciate it.
> >
> > Thanks,
> >
> > Best Regards
> > Dillon
> >
> > On Mon, Mar 15, 2021 at 9:00 PM Wolfram Sang <wsa@kernel.org> wrote:
> >>
> >> On Mon, Mar 15, 2021 at 08:43:54PM +0800, dillon min wrote:
> >>> Hi All,
> >>>
> >>> Just a gentle ping.
> >>
> >> Pierre-Yves?
> >>
> >>>
> >>> Regards.
> >>>
> >>> On Tue, Jun 9, 2020 at 9:27 PM <dillon.minfei@gmail.com> wrote:
> >>>>
> >>>> From: dillon min <dillon.minfei@gmail.com>
> >>>>
> >>>> as stm32f429's internal flash is 2Mbytes and compiled kernel
> >>>> image bigger than 2Mbytes, so we have to load kernel image
> >>>> to sdram on stm32f429-disco board which has 8Mbytes sdram space.
> >>>>
> >>>> based on above context, as you knows kernel running on external
> >>>> sdram is more slower than internal flash. besides, we need read 4
> >>>> bytes to get touch screen xyz(x, y, pressure) coordinate data in
> >>>> stmpe811 interrupt.
> >>>>
> >>>> so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
> >>>> in xip mode, have to adjust 'STOP/START bit set position' from last
> >>>> two bytes to last one bytes. else, will get i2c timeout in reading
> >>>> touch screen coordinate.
> >>>>
> >>>> to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
> >>>> kernel or has mmu platform.
> >>>>
> >>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >>>> ---
> >>>>
> >>>> V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> >>>>
> >>>>  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
> >>>>  1 file changed, 9 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> >>>> index d6a69dfcac3f..97cf42ae7fa0 100644
> >>>> --- a/drivers/i2c/busses/i2c-stm32f4.c
> >>>> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> >>>> @@ -93,6 +93,12 @@
> >>>>  #define STM32F4_I2C_MAX_FREQ           46U
> >>>>  #define HZ_TO_MHZ                      1000000
> >>>>
> >>>> +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
> >>>> +#define IIC_LAST_BYTE_POS 1
> >>>> +#else
> >>>> +#define IIC_LAST_BYTE_POS 2
> >>>> +#endif
> >>>> +
> >>>>  /**
> >>>>   * struct stm32f4_i2c_msg - client specific data
> >>>>   * @addr: 8-bit slave addr, including r/w bit
> >>>> @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> >>>>         int i;
> >>>>
> >>>>         switch (msg->count) {
> >>>> -       case 2:
> >>>> +       case IIC_LAST_BYTE_POS:
> >>>>                 /*
> >>>>                  * In order to correctly send the Stop or Repeated Start
> >>>>                  * condition on the I2C bus, the STOP/START bit has to be set
> >>>> @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> >>>>                 else
> >>>>                         stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
> >>>>
> >>>> -               for (i = 2; i > 0; i--)
> >>>> +               for (i = IIC_LAST_BYTE_POS; i > 0; i--)
> >>>>                         stm32f4_i2c_read_msg(i2c_dev);
> >>>>
> >>>>                 reg = i2c_dev->base + STM32F4_I2C_CR2;
> >>>> @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
> >>>>
> >>>>                 complete(&i2c_dev->complete);
> >>>>                 break;
> >>>> -       case 3:
> >>>> +       case (IIC_LAST_BYTE_POS+1):
> >>>>                 /*
> >>>>                  * In order to correctly generate the NACK pulse after the last
> >>>>                  * received data byte, we have to enable NACK before reading N-2
> >>>> --
> >>>> 2.7.4
> >>>>
> > _______________________________________________
> > Linux-stm32 mailing list
> > Linux-stm32@st-md-mailman.stormreply.com
> > https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> >

---
Best regards
Dillon,
