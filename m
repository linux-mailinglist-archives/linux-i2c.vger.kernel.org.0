Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3529F6ADD
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Nov 2019 19:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfKJSpt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Nov 2019 13:45:49 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40290 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbfKJSps (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Nov 2019 13:45:48 -0500
Received: by mail-ot1-f65.google.com with SMTP id m15so9477561otq.7;
        Sun, 10 Nov 2019 10:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X7RxE/BazI2gRsZmHHf8yqp4EBp/qq8k5WFLD1WnxYw=;
        b=CjO6WcTn0ntAxWwXuQOmGtSbfA68inrxD1O9JHFAFrX/WEbjg3otkaOKB/2A0XeOre
         obK/v64PBxeKshaIzLLhBe4nCUOssZRvLdf4az5n4XGQsxBP9Y1ePzwfK3KQns5RsPdC
         1u7yogXJqcFZaHYNXfg4vG0u4cQA2aNa3gRUU/v7Rk/bSngUXVjHMey97uG1KqmOcg6q
         gMPg+vgK1XCynplyMEkaKgDWKi4L1noZGrmQHAbZpbRV1Kc5TCQlKT9mGFmXZPMKUGZG
         fWGCO1JqRBcBd12HyNZEIpdmRPqoin458dEH4Jsal4Av82NzhfwDP2ZQM5+5UUvrM2HW
         mqJA==
X-Gm-Message-State: APjAAAXsPqO5YF22TisPawoa5HdQK0EiGi46S32Xky3fKnNMoTiAji5F
        A4v/ulHKs7uHTcbqXr0mamiI1qAm7LY5I2EtHQzv/P84
X-Google-Smtp-Source: APXvYqzLP8LcuTja0Clj3td6JbemJKYcwEC0kjAJD/jSW1ZL2lUYItqjqe1rcP4GsTtZADBzqsEQwcwF/4KfuHKFckc=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr16528977ota.297.1573411547410;
 Sun, 10 Nov 2019 10:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20191016102520.124370-1-jacopo+renesas@jmondi.org> <CAMuHMdUH0LrZ6iEuN1aWCTt_-jpgp=EjxubMAVdp11HLL=ayyQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUH0LrZ6iEuN1aWCTt_-jpgp=EjxubMAVdp11HLL=ayyQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 10 Nov 2019 19:45:36 +0100
Message-ID: <CAMuHMdULSOOmcoKrQ40TJaNVOAuBsCA=bgC3pMB8jOGpRCAMhg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: max9611: Defer probe on POR read
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-iio@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 17, 2019 at 2:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Oct 16, 2019 at 12:23 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > The max9611 driver tests communications with the chip by reading the die
> > temperature during the probe function. If the temperature register
> > POR (power-on reset) value is returned from the test read, defer probe to
> > give the chip a bit more time to properly exit from reset.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!
>
> > Geert,
> >   I've not been able to reproduce the issue on my boards (M3-N
> > Salvator-XS and M3-W Salvator-X). As you reported the issue you might be
> > able to reproduce it, could you please test this?
>
> I can reproduce it on Salvator-XS with R-Car H3 ES2.0.
> According to my logs, I've seen the issue on all Salvator-X(S) boards,
> but not with the same frequency.  Probability is highest on H3 ES2.0
> (ca. 5% of the boots since I first saw the issue), followed by H3 ES1.0,
> M3-W, and M3-N.
>
> After more investigation, my findings are:
>   1. I cannot reproduce the issue if the max9611 driver is modular.
>      Is it related to using max9611 "too soon" after i2c bus init?
>      How can "i2c bus init" impact a slave device?
>      Perhaps due to pin configuration, e.g. changing from another pin
>      function or GPIO to function i2c4?
>   2. Adding a delay at the top of max9611_init() fixes the issue.
>      This would explain why the issue is less likely to happy on slower
>      SoCs like M3-N.
>   3. Disabling all other i2c slaves on i2c4 in DTS fixes the issue.
>      Before, max9611 was initialized last, so this moves init earlier,
>      contradicting theory #1.
>   4. Just disabling the adv7482 (which registers 11 dummies i2c slaves)
>      in DTS does not fix the issue.
>
> Unfortunately i2c4 is exposed on a 60-pin Samtec QSH connector only,
> for which I have no breakout adapter.

Some soldering fixed that. Still investigating.
Here's a status update:

  A. I can reproduce the issue at 100 kHz instead of 400 kHz.
  B. 3 above doesn't seem to be true: I can reproduce it with all other
     slaves disabled.
  C. The code says:

        /*
         * need a delay here to make register configuration
         * stabilize. 1 msec at least, from empirical testing.
         */
        usleep_range(1000, 2000);

     However, the datasheet says:

        Parameter            MIN     TYP     MAX
        Conversion Time      -       2 ms    -

     So 1 ms is definitely too short.
     Unfortunately the datasheet has no maximum value.

  D. For 2: msleep(1) is sufficient, usleep_range(200, 500) is not.
     And this is still not explained by C.
     I also don't know yet who's resetting the chip on reboot, as it
     does not have a reset line, but all registers are zeroed (except
     for the POR temperature value).

To be investigated more...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
