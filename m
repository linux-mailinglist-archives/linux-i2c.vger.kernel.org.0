Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3338BDAD8D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2019 14:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbfJQM4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 08:56:12 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34814 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbfJQM4L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Oct 2019 08:56:11 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so2065618oii.1;
        Thu, 17 Oct 2019 05:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCmtCgtBiiFJU5hn3NT2kzh4dnuPiZZINwubQDKuTj8=;
        b=mzCNJtiF0wM7R/HS7yfby24LFO8AfqmXB166VUbWYuqW1gbKUB2L5gXYO2ka76MxPa
         3V8PBywtIfRmMVYN9no9UcdwAFKZn5e2XkPOKufaoRkB9MFJ8+dUsk8WGz+OptUQaY1i
         aXRECxrAJv0Tun77j/0D0iAevFAYF2o6Y+cLrcIMJIRxu7gwzLOoGbbBYOYJZdH10EBx
         y0q05ZlQ+MjdGeBa2BX0dkR8OKGTmZJiNKZVMFzlOTdZjmBuuMHPEA+I2E9LvDSA5CC4
         Kp9zEFKF3NBMWTN8zdq5J7xWI8DaUIuzgenZNRa/slD7USPXyG2/sCFrUD+ryczNDefr
         dEfg==
X-Gm-Message-State: APjAAAUcoI07zU2TaTRB1FZSumS7BfZqfK0B5RlmVZ4ZISS2uC3f+C9M
        ii/NTBfK54m3RpQ/p8VwBEV0JiWRyxT9kZAXCy6yOjbj
X-Google-Smtp-Source: APXvYqy5RDhqMEfVOwJ6hvWU5q92MMw+x2vGvUbDRvxE2qxwk2Nmdc/1GS9R+iCxoIJcSopADXhaQZ5hycAFP/rqBpo=
X-Received: by 2002:aca:230c:: with SMTP id e12mr2893076oie.153.1571316970585;
 Thu, 17 Oct 2019 05:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191016102520.124370-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20191016102520.124370-1-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Oct 2019 14:55:58 +0200
Message-ID: <CAMuHMdUH0LrZ6iEuN1aWCTt_-jpgp=EjxubMAVdp11HLL=ayyQ@mail.gmail.com>
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

Hi Jacopo,

CC i2c

On Wed, Oct 16, 2019 at 12:23 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The max9611 driver tests communications with the chip by reading the die
> temperature during the probe function. If the temperature register
> POR (power-on reset) value is returned from the test read, defer probe to
> give the chip a bit more time to properly exit from reset.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> Geert,
>   I've not been able to reproduce the issue on my boards (M3-N
> Salvator-XS and M3-W Salvator-X). As you reported the issue you might be
> able to reproduce it, could you please test this?

I can reproduce it on Salvator-XS with R-Car H3 ES2.0.
According to my logs, I've seen the issue on all Salvator-X(S) boards,
but not with the same frequency.  Probability is highest on H3 ES2.0
(ca. 5% of the boots since I first saw the issue), followed by H3 ES1.0,
M3-W, and M3-N.

After more investigation, my findings are:
  1. I cannot reproduce the issue if the max9611 driver is modular.
     Is it related to using max9611 "too soon" after i2c bus init?
     How can "i2c bus init" impact a slave device?
     Perhaps due to pin configuration, e.g. changing from another pin
     function or GPIO to function i2c4?
  2. Adding a delay at the top of max9611_init() fixes the issue.
     This would explain why the issue is less likely to happy on slower
     SoCs like M3-N.
  3. Disabling all other i2c slaves on i2c4 in DTS fixes the issue.
     Before, max9611 was initialized last, so this moves init earlier,
     contradicting theory #1.
  4. Just disabling the adv7482 (which registers 11 dummies i2c slaves)
     in DTS does not fix the issue.

Unfortunately i2c4 is exposed on a 60-pin Samtec QSH connector only,
for which I have no breakout adapter.

Wolfram: do you have any clues?

> Also, I opted for deferring probe instead of arbitrary repeat the
> temperature read. What's your opinion?

While this is probably OK if the max9611 driver is built-in, I'm afraid
this may lead to unbounded delays for a reprobe in case the driver
is modular.

> --- a/drivers/iio/adc/max9611.c
> +++ b/drivers/iio/adc/max9611.c
> @@ -80,6 +80,7 @@
>   * The complete formula to calculate temperature is:
>   *     ((adc_read >> 7) * 1000) / (1 / 480 * 1000)
>   */
> +#define MAX9611_TEMP_POR               0x8000
>  #define MAX9611_TEMP_MAX_POS           0x7f80
>  #define MAX9611_TEMP_MAX_NEG           0xff80
>  #define MAX9611_TEMP_MIN_NEG           0xd980
> @@ -480,8 +481,10 @@ static int max9611_init(struct max9611_dev *max9611)
>         if (ret)
>                 return ret;
>
> -       regval &= MAX9611_TEMP_MASK;
> +       if (regval == MAX9611_TEMP_POR)
> +               return -EPROBE_DEFER;
>
> +       regval &= MAX9611_TEMP_MASK;
>         if ((regval > MAX9611_TEMP_MAX_POS &&
>              regval < MAX9611_TEMP_MIN_NEG) ||
>              regval > MAX9611_TEMP_MAX_NEG) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
