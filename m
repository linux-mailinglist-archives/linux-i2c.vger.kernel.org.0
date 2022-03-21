Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F79F4E2E39
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 17:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243578AbiCUQlj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 12:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237331AbiCUQlj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 12:41:39 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8136A5F259;
        Mon, 21 Mar 2022 09:40:12 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id d10so30974435eje.10;
        Mon, 21 Mar 2022 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EJtLOy1z9qbTwrw3Odhnv9M+mtBkKVnNxZm6T651y2Q=;
        b=JVDIFxZhuOHeEVexVd7T/hSG4JJGfSXpKlQR/ylBx3yWAjVJYEfPItWO8ljpF3SXyK
         kxElOTx1KaFQuoERVOWLkF4AIAGfY2CqpmWMz82BdUET9PVmL2RlKqkCv+zRIe2EryPA
         tjnTmY9UUibI1pF/rlunvzkCvkgRbAVnnRb13kguTQnkdlT4i7F9G0ND9/kYYbyeqz/L
         vXctdMmUYxXFocGHomYINVhoQEUcNt7WvGjR1lhEnXabSL2ct4ttKaBXiSbP/1KhqEmd
         F0lJTOmz1BZeJuRd/MHvUxJfkkxt8nKXEtPXNLJxrcd34Yyj/tCqf0qgPcxYzgqz0Vqo
         kS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EJtLOy1z9qbTwrw3Odhnv9M+mtBkKVnNxZm6T651y2Q=;
        b=LjldzHyIthHOCwxyMHwb83wD/uCCkifxkUYd5Fxv8QneLLP12HtOs2V97NPA7kBBmZ
         kkukIoMwgPAntXf3TfUHrlQo3Pw2AVsShSQXMnzBvTP/kQy5ZaHnPbI28H/IXvpRGbay
         EAeVM/3JXK6HOKsNdTz2G/UMmyMTgg/tUkPAmJTKI8hxZZ+/3SfH/CdxvoKqoJVnKP3p
         4mF8bgFkSuHag/JWGBWK7StTJ5WGZ5ODf9w3r3Cz7bFB1x6mr6a2vAfIUuaaJNS6hDi6
         H/0SWF5AZjhOf0bRlueGXG4z+aCMcGmOmTOdxXiXSaU1/W5xFti3XYn36aA/3t0nBZIv
         cdPg==
X-Gm-Message-State: AOAM533i4638Lp1opecOyKXqYOfjHVYNOMn11EWfNxtA1bGR6IM436LA
        Op7etaNevAwKfH2WURgWkL2WMKpXjXZZVN6bSD8=
X-Google-Smtp-Source: ABdhPJx0/vREgiXqKTqUQ4+7St5r1LVPAwbRsGJP8mIxaSQcjKrEYSltuiOJGLsg2j99Lus5dg+jzHabi5US69p6aVg=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr21578550ejt.639.1647880811015; Mon, 21
 Mar 2022 09:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220321042142.69239-1-frank@zago.net> <20220321042142.69239-2-frank@zago.net>
In-Reply-To: <20220321042142.69239-2-frank@zago.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Mar 2022 18:39:00 +0200
Message-ID: <CAHp75VcyNDNfYyUvSk4kToLiLCVDWo5-Rz_1_fRtR7i8ZjGr7g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mfd: ch341: add core driver for the WCH CH341 in
 I2C/GPIO mode
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 21, 2022 at 11:17 AM frank zago <frank@zago.net> wrote:
>
> The CH341 is a multifunction chip, presenting 3 different USB PID. One
> of these functions is for I2C/SPI/GPIO. This new set of drivers will
> manage I2C and GPIO.

...

> +The driver doesn't support detection of I2C device present on the

devices

> +bus. Apparently when a device is not present at a given address, the
> +CH341 will return an extra byte of data, but the driver doesn't
> +support that. This may be addressed in the future.

...

>     spear-pcie-gadget
>     uacce
>     xilinx_sdfec
> +   ch341

Seems you broke the order.

...

> +config MFD_CH341

> +       tristate "WinChipHead CH341 in I2C/SPI/GPIO mode"

(1)

> +       depends on USB
> +       help
> +         If you say yes to this option, support for the CH341 series
> +         of chips, running in I2C/SPI/GPIO mode will be included.

"chips running" (no comma needed)

> +         The chip's SPI mode is not supported.

Maybe no need to include SPI in the (1) along with dropping this line?

> +         This driver can also be built as a module.  If so, the
> +         module will be called ch341-core.

...

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>

(2)

> +#include <linux/mfd/core.h>

> +
> +#include <linux/mfd/ch341.h>

Moving these two to (2) ?

...

> +       dev = kzalloc(sizeof(*dev), GFP_KERNEL);

devm_kzalloc() ?

> +       if (!dev)
> +               return -ENOMEM;

...

> +       rc = mfd_add_hotplug_devices(&iface->dev, ch341_devs,
> +                                    ARRAY_SIZE(ch341_devs));

> +       if (rc) {

> +               dev_err(&iface->dev, "Failed to add mfd devices to core.");
> +               goto free_dev;

return dev_err_probe(...); ?

> +       }

...

> +       usb_set_intfdata(dev->iface, NULL);

This has been done by device driver core  for the past 10+ years.

...

> +static const struct usb_device_id ch341_usb_table[] = {
> +       { USB_DEVICE(0x1a86, 0x5512) },
> +       { }
> +};

> +

Redundant blank line.

> +MODULE_DEVICE_TABLE(usb, ch341_usb_table);
> +
> +static struct usb_driver ch341_usb_driver = {
> +       .name       = "ch341-mfd",
> +       .id_table   = ch341_usb_table,
> +       .probe      = ch341_usb_probe,

> +       .disconnect = ch341_usb_disconnect

Keep a comma to avoid unneeded churn in the future.

> +};

> +

Redundant blank line.

> +module_usb_driver(ch341_usb_driver);


> +/*
> + * Definitions for CH341 MFD driver
> + */

One line?

...

> +#include <linux/usb.h>

No users of this header. Use forward declarations.

> +#include <linux/mutex.h>

Missed types.h.

...

> +#define DEFAULT_TIMEOUT 1000   /* 1s USB requests timeout */

Use proper suffix, i.e. _MS.

-- 
With Best Regards,
Andy Shevchenko
