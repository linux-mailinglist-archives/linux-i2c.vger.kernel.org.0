Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A915E2830F7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 09:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJEHg2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 03:36:28 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35800 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgJEHg0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 03:36:26 -0400
Received: by mail-ot1-f65.google.com with SMTP id s66so7719794otb.2;
        Mon, 05 Oct 2020 00:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNf+1CZwCtB9/X+lquZ9luTdVAuF2E896Sfv5oD/tBM=;
        b=STvxtpZfC4pWnV41oRa6cuIeNvuU+7zp/a7SKUdSOYZqJadxJasYfVTXL6gGu1Va0i
         S/d84MExERaZ+dYEyUcDHTjNSXwDtBtGwIXExVQ2Z+LddEnvEBD3N4gFs2vdE5Q2z2Bn
         eDQ7tef62R9T4XnNp/83pr4XnjwgEmT9Hi/y22+YpymQwk3VLwT87TNTFiieugKDQNhr
         8yccesuutV2usDImCKLQE8LPa3Ctwbkq7alAt2qwJP4tmEqBYS3E5PICVRu0hT9Eq8Xb
         FYAtPKAo3UNnz4J0tLt9GnEQzPlscnVkGl4ibTelr3fPfMnB0V32Sv5Cr1FDerq6E4Pw
         lyWg==
X-Gm-Message-State: AOAM5314cecMwOcrqW2TP+7jdPE9RzFBD+1V8svz9ymLtJFTFsuS8hWz
        4vGSiIuLQOkUcYcJxrVAIaMafmkeEJi4ft9u3DFDehcftlc=
X-Google-Smtp-Source: ABdhPJzOQo1UFJID4qbLY694qspjNCn+uW/02sXFHIEaU4eVUZ3/egysBtWTvWM937OKuc73FryAkSz/TIAuqciuNtA=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr11016581otb.250.1601883385236;
 Mon, 05 Oct 2020 00:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200928155950.1185-1-uli+renesas@fpond.eu> <20201002154423.GA16758@ninjato>
In-Reply-To: <20201002154423.GA16758@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Oct 2020 09:36:14 +0200
Message-ID: <CAMuHMdX=815AT54cOECCVvsD70AbhOzXKAMpQccE5XvOS4TSdw@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, Oct 2, 2020 at 5:44 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Sep 28, 2020 at 05:59:50PM +0200, Ulrich Hecht wrote:
> > Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> > similar boards.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

> > @@ -581,10 +585,12 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,

> > +             if (pd->atomic_xfer) {
> > +                     unsigned long j = jiffies + pd->adap.timeout;
> > +
> > +                     time_left = time_before_eq(jiffies, j);
> > +                     while (time_left &&
> > +                            !(pd->sr & (ICSR_TACK | SW_DONE))) {
> > +                             unsigned char sr = iic_rd(pd, ICSR);
> > +
> > +                             if (sr & (ICSR_AL   | ICSR_TACK |
> > +                                       ICSR_WAIT | ICSR_DTE)) {
> > +                                     sh_mobile_i2c_isr(0, pd);
> > +                                     udelay(150);
> > +                             } else {
> > +                                     cpu_relax();
> > +                             }
>
> Is it 100% safe to call cpu_relax() that late? Aren't interrupts
> disabled? What is waking the CPU again? And where does the value 150us
> come from?

cpu_relax() does not sleep, usually it's merely a compiler directive.

On arm32/v7 (and most other platforms):

    #define cpu_relax()                     barrier()

    #define barrier() __asm__ __volatile__("": : :"memory")

On arm64:

    static inline void cpu_relax(void)
    {
            asm volatile("yield" ::: "memory");
    }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
