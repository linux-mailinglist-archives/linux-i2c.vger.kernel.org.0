Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF7B95ACE
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 11:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbfHTJSt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 05:18:49 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45643 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTJSs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 05:18:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id v12so3541798oic.12;
        Tue, 20 Aug 2019 02:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PccO2B1RJExYIp/MwX4WWDr63GNAvfoli2YV+N6wgIs=;
        b=YSJxC7wM9H+vTjs51Ln/l684liHBrYmSF6H6eG1t0kxJsZdFPVnVTzbcDiVvdwKSMQ
         VpnhfdpRHzmX6Xw0P8xlrceSXmAQbQnKXKibaNl1qEdAyRNJ1RKFxXdS+n7h30tUL4rj
         6dzUtcCeUNSlMddGkfgkSJzuA7mEQPSdI61AxnlyMdKqgIjo06brFaunt08Hlu+ACyg1
         he58luyXqmC3BkFmjeqBHtsgSh7otPWROu4DH6tlKF5DweRMbf4L48a0Gx8JLuy5c5VB
         YpaDAa93QwKFwdzG10Pgjktr6t8S97ao0PsQcJWZYK2xuc50GtxZGYODjumoUjBDSA5n
         silg==
X-Gm-Message-State: APjAAAVY5l5AZHN3jOzdSquJNtsR/SCQvIkTetNV/yqNR91e87dK50cI
        +qZB7Fey8V/4VU8vukFKDOapjj8lbH9X0QVdyLk=
X-Google-Smtp-Source: APXvYqxpcPefiXdX3VQB1i+9RfhT5hxozpeeHBsudM3g9jQ1hiLrSp490eYEPrEMQz1iOTpFHdOmk4Hnz1KdrDHVj9U=
X-Received: by 2002:a54:478d:: with SMTP id o13mr16416155oic.54.1566292727433;
 Tue, 20 Aug 2019 02:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190819121618.16557-1-max@enpas.org> <20190819121618.16557-3-max@enpas.org>
In-Reply-To: <20190819121618.16557-3-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 11:18:36 +0200
Message-ID: <CAMuHMdV1r5LphqNHyM9z8QXbqhAb6skH4wpPq=ZH6XRBHnxwuw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c/busses/i2c-icy: Add LTC2990 present on 2019
 board revision
To:     Max Staudt <max@enpas.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 19, 2019 at 2:17 PM Max Staudt <max@enpas.org> wrote:
> Since the 2019 a1k.org community re-print of these PCBs sports an
> LTC2990 hwmon chip as an example use case, let this driver autoprobe
> for that as well. If it is present, modprobing ltc2990 is sufficient.
>
> The property_entry enables the three additional inputs available on
> this particular board:
>
>   in1 will be the voltage of the 5V rail, divided by 2.
>   in2 will be the voltage of the 12V rail, divided by 4.
>   temp3 will be measured using a PCB loop next the chip.
>
> v5: Style
>
> v4: Style
>     Added other possible addresses for LTC2990.
>
> v3: Merged with initial LTC2990 support on ICY.
>     Moved defaults from platform_data to swnode.
>     Added note to Kconfig.
>
> Signed-off-by: Max Staudt <max@enpas.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

One comment below...

> --- a/drivers/i2c/busses/i2c-icy.c
> +++ b/drivers/i2c/busses/i2c-icy.c

> @@ -141,6 +166,35 @@ static int icy_probe(struct zorro_dev *z,
>         dev_info(&z->dev, "ICY I2C controller at %pa, IRQ not implemented\n",
>                  &z->resource.start);
>
> +       /*
> +        * The 2019 a1k.org PCBs have an LTC2990 at 0x4c, so start
> +        * it automatically once ltc2990 is modprobed.
> +        *
> +        * in0 is the voltage of the internal 5V power supply.
> +        * temp1 is the temperature inside the chip.
> +        *
> +        * See property_entry above for in1, in2, temp3.
> +        */
> +       new_fwnode = fwnode_create_software_node(icy_ltc2990_props, NULL);
> +       if (IS_ERR(new_fwnode)) {
> +               dev_info(&z->dev, "Failed to create fwnode for LTC2990, error: %ld\n",
> +                        PTR_ERR(new_fwnode));
> +       } else {
> +               /*
> +                * Store the fwnode so we can destroy it on .remove().
> +                * Only store it on success, as fwnode_remove_software_node()
> +                * is NULL safe, but not PTR_ERR safe.
> +                */
> +               i2c->ltc2990_fwnode = new_fwnode;
> +               ltc2990_info.fwnode = new_fwnode;
> +
> +               i2c->ltc2990_client =
> +                       i2c_new_probed_device(&i2c->adapter,
> +                                             &ltc2990_info,
> +                                             icy_ltc2990_addresses,
> +                                             NULL);
> +       }
> +
>         return 0;
>  }

Since commit d3e1b617ae20c459 ("i2c: allow specify device properties in
i2c_board_info"), the properties could be provided by info->properties, too.
However, according to the comments for device_add_properties(), this is
valid only if there is a real firmware node present.

If that is true, Max' use is correct, while e.g. commit 6a7836ba7fb4abf6
("ARM: imx: pca100: use device properties for at24 eeprom") isn't?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
