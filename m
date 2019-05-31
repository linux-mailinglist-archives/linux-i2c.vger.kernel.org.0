Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 265C831880
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 01:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfEaX7v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 19:59:51 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43317 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfEaX7v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 19:59:51 -0400
Received: by mail-ua1-f66.google.com with SMTP id 89so2882288uar.10
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 16:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k2l20sAhLY3T07bcIA5G0ILj1jsN3ykVBOw/UAB9Yvk=;
        b=BWhvOfufGkGm5/AdZtLYMSAq++K0rJXo2fbB8xo5KLbJmjiAsBKiqK7u3E1nhu3bzT
         RVFxHpJRBCRXguZnH+IcYk7PSH1EkxDrUrt7H+j+iLDgjdztDGKQi1OamVz01Gx/dDUh
         eUyUittVvlx+1ADwG+gWN+c15DqOo//Jp+muk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k2l20sAhLY3T07bcIA5G0ILj1jsN3ykVBOw/UAB9Yvk=;
        b=UmUE40cZbS8gaQEEzgdonWDGmNtDmibDrUiPAmYCxRfVnHBE4t/9HofrT3AG9sSKqh
         kCcRgaDBXQzqFFtD0dhE5RDrP9g2K91Ot+erjephIfMkAy8eoBfXNMP9hG2AcZj3FYSN
         TW6zXpjZ/1Kt2/yb58QpKH8j184uVFzYj2uR34F9OtXemvQs0UwyD/uuIO/lX00kU4/o
         l5g76Nbc8HkC2PJiwbL4HOJka35vit6IatzIN0FCEYMy+1Lz2pnQs7G8kU0H5HprShW3
         48+yHVGM6G6dScvKBHc6BBUrpIwyoUoBg3cainAJeM726yH7qmkM9pfcmv0fhYkNlIPG
         XmYg==
X-Gm-Message-State: APjAAAVhQBzuBLD1p6HHQhc7SO86/aruofHmbZonwnX2pfkhOF9B11ny
        zKi1bw3TavAKRZWCEDDGcLlVN5/FcWQ=
X-Google-Smtp-Source: APXvYqxbxL0Di0rcBE4fu2SOLTre9vV16NBHrqa9poLcTviWn/lDPF4crqz42kkA4VPBtGY911tP1A==
X-Received: by 2002:ab0:6444:: with SMTP id j4mr6971465uap.105.1559347189846;
        Fri, 31 May 2019 16:59:49 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id x19sm1261330vsq.9.2019.05.31.16.59.48
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 16:59:49 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id b10so7820121vsp.5
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 16:59:48 -0700 (PDT)
X-Received: by 2002:a05:6102:10c7:: with SMTP id t7mr59426vsr.87.1559347187769;
 Fri, 31 May 2019 16:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190530210421.24941-1-linus.walleij@linaro.org>
In-Reply-To: <20190530210421.24941-1-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 May 2019 16:59:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com>
Message-ID: <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <k.kozlowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, May 30, 2019 at 2:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Instead of complex code picking GPIOs out of the device tree
> and keeping track of polarity for each GPIO line, use descriptors
> and pull polarity handling into the gpiolib.

Yay!  Thank you for doing this--the driver looks much cleaner now.
That code was super gnarly before.


> We look for "our-claim" and "their-claim" since the gpiolib
> code will try e.g. "our-claim-gpios" and "our-claim-gpio" in
> turn to locate these GPIO lines from the device tree.
>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c | 75 ++++++----------------
>  1 file changed, 21 insertions(+), 54 deletions(-)

NOTE: any chance I can convince you to CC LKML on patches like this?
There's no patchwork for i2c so I can't easily grab this from
patchwork unless you CC LKML.  That also has the nice benefit that I
can refer to this conversation in perpetuity using the magic lkml
kernel redirector: https://lkml.kernel.org/r/<msg_id>

I personally am not setup for testing snow these days, but it's
possible that +Marek Szyprowski and +Krzystof Kozlowski might be
interested in testing?  If necessary I can dig through my boxes and
find a snow to test, though.  Also possible that linux-samsumg-soc
could have someone paying attention who cares about exynos-5250-snow.


> @@ -138,43 +130,18 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, muxc);
>
> -       /* Request GPIOs */
> -       ret = of_get_named_gpio_flags(np, "our-claim-gpio", 0, &gpio_flags);
> -       if (!gpio_is_valid(ret)) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "Error getting our-claim-gpio\n");
> -               return ret;
> -       }
> -       arb->our_gpio = ret;
> -       arb->our_gpio_release = !!(gpio_flags & OF_GPIO_ACTIVE_LOW);
> -       out_init = (gpio_flags & OF_GPIO_ACTIVE_LOW) ?
> -               GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
> -       ret = devm_gpio_request_one(dev, arb->our_gpio, out_init,
> -                                   "our-claim-gpio");
> -       if (ret) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "Error requesting our-claim-gpio\n");
> -               return ret;
> -       }
> +       /* Request GPIOs, our GPIO as unclaimed to begin with */
> +       arb->our_gpio = devm_gpiod_get(dev, "our-claim", GPIOD_OUT_LOW);
> +       if (IS_ERR(arb->our_gpio))
> +               return PTR_ERR(arb->our_gpio);

I don't think devm_gpiod_get() handles error reporting for us, right?
So do we still need the "dev_err" if not EPROBE_DEFER to let the user
know that something bad happened?


>         /* At the moment we only support a single two master (us + 1 other) */
> -       if (gpio_is_valid(of_get_named_gpio(np, "their-claim-gpios", 1))) {
> +       dummy = devm_gpiod_get_index_optional(dev, "their-claim", 1, GPIOD_IN);
> +       if (dummy && !IS_ERR(dummy)) {

Trying to wrap my head around why you chose devm_gpiod_get_index_optional().

With devm_gpiod_get_index_optional()
- if gpiod_get_index returned a real GPIO: you'll enter "if"
- if gpiod_get_index returned -ENOENT: you won't enter "if"
- if gpiod_get_index returned diff err: you won't enter "if"

If we changed the above to:

  dummy = devm_gpiod_get_index(dev, "their-claim", 1, GPIOD_IN);
  if (!IS_ERR(dummy)) {

...then:
- if gpiod_get_index returned a real GPIO: you'll enter "if"
- if gpiod_get_index returned -ENOENT: you won't enter "if"
- if gpiod_get_index returned diff err: you won't enter "if"

So I _think_ you don't need the _optional() variant, right?

I'll also note that the purist in me would want to handle
-EPROBE_DEFER even though it's highly unlikely you'd end up in that
state.  AKA:

  dummy = devm_gpiod_get_index(dev, "their-claim", 1, GPIOD_IN);
  if (!IS_ERR(dummy)) {
    ...
  } else if (PTR_ERR(dummy) == -EPROBE_DEFER) {
    return -EPROBE_DEFER;
  }


Other than my nits this looks good to me.

-Doug
