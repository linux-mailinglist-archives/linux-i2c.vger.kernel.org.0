Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F104394C0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 13:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhJYL1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 07:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhJYL1X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 07:27:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E93BC061745;
        Mon, 25 Oct 2021 04:25:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r4so16765179edi.5;
        Mon, 25 Oct 2021 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMjzXf7F4jpbrQlFDm/ITcd5oZmF0Z2TEeku8oHs3kU=;
        b=bsotcAEmprCE7ce2WplDUGURzqrGrekAxYm00UTRZNzXyKHE6B08b4aa4Bzcbcdw5M
         l8QlCXUhQLF5UeYA56cWKwQf8BH2NKKVWHzsryq9TEpS5f3ozdFrUjInicNJFiO/VSqI
         x0v/OiHFMmkFC93i4jvSpyuTSu0jI6REkoXUfGOF8S79MmVhCOlcTMP1vMX1yPag3MyI
         ASFC2jJUJtdaHrpXDkY82IzzwcRavnKpqZ9XJZYPfxDcGLa4mLNv72lculoB0VNPdoh9
         Re1fPrGVmvyj8ot/LtyjbCDmT36ty1nMg0hnbS2+6+LPfdtpVXoGbXNtI1oJnFeJex6T
         0pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMjzXf7F4jpbrQlFDm/ITcd5oZmF0Z2TEeku8oHs3kU=;
        b=GLXgtdcHIDHCKILppQPhwVStr3RyRu92yaQWdGiPFOE4A7r78u648qO82smBVHNUvW
         HgztTIavWw/JBxEnpVsYKyNSiKPACG3kMYYyEJclyZ+mRhGu6dQoxDOAMwoh9xn91jCU
         AHWB4YWU2Ii94k/RcNQo9glwcOaekUAze4Wc9XcDQFl5Ng4VRQWPHL9DBR/lwGSu7QbM
         6Hg9fgawPdOxpOsTp/GB87m3PUVFhuUg+ei1AxZsX5FWCJ5f1CzBnQpzTgqguFXIPhyn
         AQmqxBBTi69m9mn1kQCVErjhTSwN2vI54Tcj6nseheEkSN85sW3WIHrfLaNg2FS4DH17
         rPLg==
X-Gm-Message-State: AOAM533ResgDVu2ew2SYw3BPvM/E83YwerYqJ2wRlrwsgSFb4j2c6pUX
        aYXAzePfa1qg8YKDksZ+hznxX2CxgOs3GL1vgXo=
X-Google-Smtp-Source: ABdhPJxNro7nJb+4nNcU2bcNEILfMTDeLp7HJvi6zJ4Qvf79TF+E57V2hcT8u1m/awhFSY5Xohc1i+UovGXa4cjHoyk=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr14246616ejc.128.1635161099617;
 Mon, 25 Oct 2021 04:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-6-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 14:24:05 +0300
Message-ID: <CAHp75VdfwA_3QK2Fo1S34rRZWHCMNzzHug4AKsRfOrKu4CU_YA@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] clk: Introduce clk-tps68470 driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> the kernel the Regulators and Clocks are controlled by an OpRegion
> driver designed to work with power control methods defined in ACPI, but
> some platforms lack those methods, meaning drivers need to be able to
> consume the resources of these chips through the usual frameworks.
>
> This commit adds a driver for the clocks provided by the tps68470,
> and is designed to bind to the platform_device registered by the
> intel_skl_int3472 module.

...

> +/*
> + *  The PLL is used to multiply the crystal oscillator
> + *  frequency range of 3 MHz to 27 MHz by a programmable
> + *  factor of F = (M/N)*(1/P) such that the output
> + *  available at the HCLK_A or HCLK_B pins are in the range
> + *  of 4 MHz to 64 MHz in increments of 0.1 MHz

Missed (grammatical) period.

> + *
> + * hclk_# = osc_in * (((plldiv*2)+320) / (xtaldiv+30)) * (1 / 2^postdiv)
> + *
> + * PLL_REF_CLK should be as close as possible to 100kHz
> + * PLL_REF_CLK = input clk / XTALDIV[7:0] + 30)
> + *
> + * PLL_VCO_CLK = (PLL_REF_CLK * (plldiv*2 + 320))
> + *
> + * BOOST should be as close as possible to 2Mhz
> + * BOOST = PLL_VCO_CLK / (BOOSTDIV[4:0] + 16) *
> + *
> + * BUCK should be as close as possible to 5.2Mhz
> + * BUCK = PLL_VCO_CLK / (BUCKDIV[3:0] + 5)
> + *
> + * osc_in   xtaldiv  plldiv   postdiv   hclk_#
> + * 20Mhz    170      32       1         19.2Mhz
> + * 20Mhz    170      40       1         20Mhz
> + * 20Mhz    170      80       1         24Mhz

> + *

Redundant empty line.

> + */

...

> +       /* disable clock first */

Disable
first...

> +       /* and then tri-state the clock outputs */

...and

...

> +       for (i = 0; i < ARRAY_SIZE(clk_freqs); i++) {
> +               diff = clk_freqs[i].freq - rate;
> +               if (diff == 0)
> +                       return i;

> +               diff = abs(diff);

This needs a comment why higher (lower) frequency is okay.

> +               if (diff < best_diff) {
> +                       best_diff = diff;
> +                       best_idx = i;
> +               }
> +       }

...

> +       if (pdata) {
> +               ret = devm_clk_hw_register_clkdev(&pdev->dev,
> +                                                 &tps68470_clkdata->clkout_hw,
> +                                                 pdata->consumer_con_id,
> +                                                 pdata->consumer_dev_name);

if (ret)
  return ret;

> +       }
> +
> +       return ret;

return 0;

--
With Best Regards,
Andy Shevchenko
