Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE31193D00
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbgCZKg5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:36:57 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41980 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgCZKg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 06:36:56 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so5255599otf.8;
        Thu, 26 Mar 2020 03:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XCP6/YUqB4HKGiVIvbBv5UNaOk8JaJaow03TaOhG6g=;
        b=AV//2Zh17XXys2vpyytzNo/c3vbUcZqGWs801YY2Uhy5viva50HqTgjqyIFoCwQLn0
         /uUQBjQ+lCtxaypCcEiGa8jCVqVyLuq7ii7swcLQtDjC9+rtgJRhWkiUplUvvJkbtfCx
         A55/zFglthA9gyFPNBU1+k4H89XB0QmNlTJLjYdhJGAptUTb2NBnzzcP1aZmNN5YGAUt
         HXPBf+PkdHuXo6lV66Ir62Nda6ppQ6lruzsAHJQGqGgqYrpnizDH2eI/8KZzrI2pDW5u
         AkC8D5n3xjNDGFoIEUv4ocYpw2rursLj8AOCrmpgqPhQjf3XRDy7IZfD/O7Y9n5jlHkk
         nLxw==
X-Gm-Message-State: ANhLgQ3ZFZSJC+nro1R7qIdjW1xKnJhWrEeqatMxxvvp84p9yFyvMPDv
        YYsSURi05cnYTjc8L13nsvoSmbC4VdngwZGXplA=
X-Google-Smtp-Source: ADFU+vtESKW0jzSqpePjoNV5sDdANvlM5+yM3AN6l0VhFGuIdVqHVAnTfodv5c+mp4LsKbBSM9tHA/U0tF1pFbKARyE=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr5415994otr.107.1585219015832;
 Thu, 26 Mar 2020 03:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 11:36:44 +0100
Message-ID: <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Mar 26, 2020 at 11:17 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When I wanted to print the chosen values to debug output, I concluded
> that a helper function to parse one timing would be helpful.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1609,6 +1609,18 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  }
>  EXPORT_SYMBOL(i2c_del_adapter);
>
> +static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
> +                           u32 def_val, bool use_def)
> +{
> +       int ret;
> +
> +       ret = device_property_read_u32(dev, prop_name, cur_val_p);
> +       if (ret && use_def)
> +               *cur_val_p = def_val;

Alternatively, you could just preinitialize the value with the default value
before calling this function, and ignoring ret.
That would remove the need for both the def_val and use_def parameters.

> +
> +       dev_dbg(dev, "%s: %u\n", prop_name, *cur_val_p);
> +}
> +
>  /**
>   * i2c_parse_fw_timings - get I2C related timing parameters from firmware
>   * @dev: The device to scan for I2C timing properties
> @@ -1627,49 +1639,35 @@ EXPORT_SYMBOL(i2c_del_adapter);
>   */
>  void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults)
>  {
> -       int ret;
> -
> -       ret = device_property_read_u32(dev, "clock-frequency", &t->bus_freq_hz);
> -       if (ret && use_defaults)
> -               t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;

> -
> -       ret = device_property_read_u32(dev, "i2c-scl-rising-time-ns", &t->scl_rise_ns);
> -       if (ret && use_defaults) {
> -               if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
> -                       t->scl_rise_ns = 1000;
> -               else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> -                       t->scl_rise_ns = 300;
> -               else
> -                       t->scl_rise_ns = 120;
> -       }
> -
> -       ret = device_property_read_u32(dev, "i2c-scl-falling-time-ns", &t->scl_fall_ns);
> -       if (ret && use_defaults) {
> -               if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> -                       t->scl_fall_ns = 300;
> -               else
> -                       t->scl_fall_ns = 120;
> -       }
> +       bool u = use_defaults;
> +       u32 d;
>
> -       ret = device_property_read_u32(dev, "i2c-scl-internal-delay-ns", &t->scl_int_delay_ns);
> -       if (ret && use_defaults)
> -               t->scl_int_delay_ns = 0;
> +       i2c_parse_timing(dev, "clock-frequency", &t->bus_freq_hz,
> +                        I2C_MAX_STANDARD_MODE_FREQ, u);
>
> -       ret = device_property_read_u32(dev, "i2c-sda-falling-time-ns", &t->sda_fall_ns);
> -       if (ret && use_defaults)
> -               t->sda_fall_ns = t->scl_fall_ns;
> -
> -       ret = device_property_read_u32(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns);
> -       if (ret && use_defaults)
> -               t->sda_hold_ns = 0;
> -
> -       ret = device_property_read_u32(dev, "i2c-digital-filter-width-ns", &t->digital_filter_width_ns);
> -       if (ret && use_defaults)
> -               t->digital_filter_width_ns = 0;
> +       if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
> +               d = 1000;
> +       else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> +               d = 300;
> +       else
> +               d = 120;
> +       i2c_parse_timing(dev, "i2c-scl-rising-time-ns", &t->scl_rise_ns, d, u);
>
> -       ret = device_property_read_u32(dev, "i2c-analog-filter-cutoff-frequency", &t->analog_filter_cutoff_freq_hz);
> -       if (ret && use_defaults)
> -               t->analog_filter_cutoff_freq_hz = 0;
> +       if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
> +               d = 300;
> +       else
> +               d = 120;

Is the difference with above intentional, or an oversight?
If the latter, you could skip reinitializing d to the value it already has.
Just though I'd better ask ;-)

if the former, I like the dreaded ternary operator (only) for cases like this:

    d = t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ ? 300 : 120

> +       i2c_parse_timing(dev, "i2c-scl-falling-time-ns", &t->scl_fall_ns, d, u);
> +
> +       i2c_parse_timing(dev, "i2c-scl-internal-delay-ns",
> +                        &t->scl_int_delay_ns, 0, u);
> +       i2c_parse_timing(dev, "i2c-sda-falling-time-ns", &t->sda_fall_ns,
> +                        t->scl_fall_ns, u);
> +       i2c_parse_timing(dev, "i2c-sda-hold-time-ns", &t->sda_hold_ns, 0, u);
> +       i2c_parse_timing(dev, "i2c-digital-filter-width-ns",
> +                        &t->digital_filter_width_ns, 0, u);
> +       i2c_parse_timing(dev, "i2c-analog-filter-cutoff-frequency",
> +                        &t->analog_filter_cutoff_freq_hz, 0, u);
>  }
>  EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
