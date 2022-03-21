Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857994E2ED1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 18:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351621AbiCURIu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 13:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349584AbiCURIt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 13:08:49 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29ABAF1F1;
        Mon, 21 Mar 2022 10:07:23 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a8so31169621ejc.8;
        Mon, 21 Mar 2022 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nNbNlGuXV6X4fWF2qLDMdJsQMzIxqfeeRH+sUuCiCXQ=;
        b=db9Mw7BqATvzLY1U2pGCP7VeG2dUUK3OxrlF/KdZGWer11Uc7abtZMQ2dHoWY0qtEV
         BENMVa4hEQxaHRJYvYuhFrogLje5nOt7i1KZhMRbW7HIIuJHIb2YqCT6uGtTWd7qDq9d
         NhymuRw43M7tzX4C39venxpI3bHQEkM9nKhYKYRzBBsDXYVOTPXQmcUTXG6HHzHwz0ku
         MH80Pk/ulwEpF7kCClk/Iqkji3iRjNV0Ld3jfuGtM1uIWuu5vKtxsv0V3704ujRD74ru
         SAypy3Ae861RvOsQn/QEjkOxaF7q9HcXx0juWk0M33LJMpap7VyxBn1C4oKmBmnQekuS
         444Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nNbNlGuXV6X4fWF2qLDMdJsQMzIxqfeeRH+sUuCiCXQ=;
        b=cMlIgll78cQB8MGQ4Yz6uAAXYVC2dWxd2dteEFQGA2SYv7Bns6j5wyAW8FAtlaXeMq
         LmCK6aJarxbbdozCxta4mwOi0RAa4gMIJvFNvxFsUL/UjrpCaRJ0o/BTczJI9NqeDW3J
         DF/YjcoXDYuomAPbDtRx+tWAIdwBdcfOCiM0ygdZ8FV50a6D98Pae9NDpo25tz2J3ikz
         uey13EjGpNgzBpq7B1RDd3MP6fkRu5YlsBBGkzxaKJELrm3abeY9lN3ngeAJf/MghYo6
         JAA1E0Zi9ZtI5TcNbDnlSF8PCzyZjnA99fp4OQJNPL6MU+Jc6LdOaoQOVN5mFbJtsS6r
         RWrg==
X-Gm-Message-State: AOAM530eTwVeNytBXGzQXk2Myuovz7iEZnOJuA+Ph2LCVmuib76IRk2b
        lmwnG8iNARQN/mzwdkkgNMj1g4h9jQIkyum/F3Q=
X-Google-Smtp-Source: ABdhPJz3+5NZZMx6LfOczVDWh8iPK8wiFLRlrTjLaXEGAzbTMpJ0HoYaMDtbC7h4sMTpGeMQo3gxiUfgSLQ9LdtTCqk=
X-Received: by 2002:a17:907:7289:b0:6df:9746:e7c4 with SMTP id
 dt9-20020a170907728900b006df9746e7c4mr20246985ejc.497.1647882442198; Mon, 21
 Mar 2022 10:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220321042142.69239-1-frank@zago.net> <20220321042142.69239-3-frank@zago.net>
In-Reply-To: <20220321042142.69239-3-frank@zago.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Mar 2022 19:06:10 +0200
Message-ID: <CAHp75VdfEheEPWBDb+3FUwmwGx_4NR8o+SMwTwjgPr7oGGM5-A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: ch341: add MFD cell driver for the CH341
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 21, 2022 at 4:13 PM frank zago <frank@zago.net> wrote:
>
> The GPIO interface offers 16 GPIOs. 6 are read/write, and 10 are
> read-only.

We use terminology of output-only and input-only. Is it what you are
telling us? If it's something else, you have to elaborate much better
on what's going on with these GPIO lines.

...

> +config GPIO_CH341
> +       tristate "CH341 USB adapter in GPIO/I2C/SPI mode"

How is this driver related to either SPI or I=C2=B2C modes?

> +       depends on MFD_CH341

Can't be compile tested?

> +       help
> +         If you say yes to this option, GPIO support will be included fo=
r the
> +         WCH CH341, a USB to I2C/SPI/GPIO interface.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called gpio-ch341.

...

> +/* Notes.

Keep the proper (not network) style for multi-line comments.


> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/gpio.h>

> +#include <linux/mfd/ch341.h>

If I got your intention with groups of headers, I would see rather

...ordered headers...
blank line
#include <linux/gpio.h>

But more importantly that gpio.h is the wrong header and must be
replaced with the appropriate one from the include/gpio/ folder.

Also you have missed headers, like types.h.

...

> +#define CH341_PARA_CMD_STS          0xA0  /* Get pins status */
> +#define CH341_CMD_UIO_STREAM        0xAB  /* UIO stream command */
> +
> +#define CH341_CMD_UIO_STM_OUT       0x80  /* UIO interface OUT command (=
D0~D5) */
> +#define CH341_CMD_UIO_STM_DIR       0x40  /* UIO interface DIR command (=
D0~D5) */
> +#define CH341_CMD_UIO_STM_END       0x20  /* UIO interface END command *=
/

What does UIO mean here? If it is Userspace I/O in terms of Linux
kernel, it's no-go we want this. Otherwise needs to be explained
somewhere.

...

> +struct ch341_gpio {
> +       struct gpio_chip gpio;
> +       struct mutex gpio_lock;
> +       u16 gpio_dir;           /* 1 bit per pin, 0=3DIN, 1=3DOUT. */
> +       u16 gpio_last_read;     /* last GPIO values read */
> +       u16 gpio_last_written;  /* last GPIO values written */
> +       u8 gpio_buf[SEG_SIZE];
> +
> +       struct {
> +               char name[32];
> +               bool enabled;
> +               struct irq_chip irq;
> +               int num;
> +               struct urb *urb;
> +               struct usb_anchor urb_out;
> +               u8 buf[CH341_USB_MAX_INTR_SIZE];
> +       } gpio_irq;

We have a specific GPIO IRQ chip structure, what is the purpose of
semi-duplication of it?

> +
> +       struct ch341_device *ch341;
> +};

...

> +static void ch341_gpio_dbg_show(struct seq_file *s, struct gpio_chip *ch=
ip)
> +{
> +       struct ch341_gpio *dev =3D gpiochip_get_data(chip);
> +
> +       seq_printf(s, "pin config  : %04x  (0=3DIN, 1=3DOUT)\n", dev->gpi=
o_dir);
> +       seq_printf(s, "last read   : %04x\n", dev->gpio_last_read);
> +       seq_printf(s, "last written: %04x\n", dev->gpio_last_written);

Multi-line debug output is quite non-standard among GPIO drivers.

> +}

> +{
> +       struct ch341_device *ch341 =3D dev->ch341;
> +       int actual;
> +       int rc;
> +
> +       mutex_lock(&ch341->usb_lock);
> +
> +       rc =3D usb_bulk_msg(ch341->usb_dev,
> +                         usb_sndbulkpipe(ch341->usb_dev, ch341->ep_out),
> +                         dev->gpio_buf, out_len,
> +                         &actual, DEFAULT_TIMEOUT);

> +       if (rc < 0)
> +               goto done;
> +
> +       if (in_len =3D=3D 0) {
> +               rc =3D actual;
> +               goto done;
> +       }

You may do it better. See below.

> +       rc =3D usb_bulk_msg(ch341->usb_dev,
> +                         usb_rcvbulkpipe(ch341->usb_dev, ch341->ep_in),
> +                         dev->gpio_buf, SEG_SIZE, &actual, DEFAULT_TIMEO=
UT);
> +
> +       if (rc =3D=3D 0)
> +               rc =3D actual;

> +done:

out_unlock: sounds better.

> +       mutex_unlock(&ch341->usb_lock);

> +       return rc;

if (rc < 0)
  return rc;

return actual;

> +}

...

> +       int result;

rc / result / etc... Please, become consistent in naming the return
code variable.

...

> +       if (result =3D=3D 6)
> +               dev->gpio_last_read =3D le16_to_cpu(*(__le16 *)dev->gpio_=
buf);

So, it means you have the wrong type of gpio_but. Also you missed the
pointer versions of leXX_to_cpu() helpers.

...

> +       return (result !=3D 6) ? result : 0;

Besides redundant parentheses, this can be optimized. I will leave it
for your homework (the hint is given at the top part of the review).

...

> +       return (dev->gpio_last_read & BIT(offset)) ? 1 : 0;

!! can be used. But it's up to you and maintainers, the compiler will
do its job anyway.

...

> +       dev->gpio_last_written &=3D ~*mask;
> +       dev->gpio_last_written |=3D (*bits & *mask);

Can be done in one line as it's a well established pattern in Linux
kernel for drivers.

...

> +       return (dev->gpio_dir & BIT(offset)) ? 0 : 1;

! will do the job.

...

> +       if (!(pin_can_output & mask))
> +               return -EINVAL;

I don't remember if we have a valid mask for this case.

...

> +       if (!urb->status) {

Will be much better to simply do:

if (urb_status) {
 ...
 return;
}

> +       } else {
> +               usb_unanchor_urb(dev->gpio_irq.urb);
> +       }

...

> +       if (data->irq !=3D dev->gpio_irq.num || type !=3D IRQ_TYPE_EDGE_R=
ISING)
> +               return -EINVAL;

Usually we lock the handler type here while in ->probe() we assign a
bad handler by default in order to filter out spurious interrupts.

...

> +       dev->gpio_irq.enabled =3D true;

What is the purpose of this flag? Note there is a patch to add a
specific flag to the descriptor to do exactly this.

...

> +/* Convert the GPIO index to the IRQ number */
> +static int ch341_gpio_to_irq(struct gpio_chip *chip, unsigned int offset=
)
> +{
> +       struct ch341_gpio *dev =3D gpiochip_get_data(chip);
> +
> +       if (offset !=3D CH341_GPIO_INT_LINE)
> +               return -ENXIO;
> +
> +       return dev->gpio_irq.num;

In the new code we will have the special field that limits the GPIO
IRQ lines (can be different to the ngpio).

> +}

...

> +       snprintf(dev->gpio_irq.name, sizeof(dev->gpio_irq.name),
> +                "ch341-%s-gpio", dev_name(&ch341->usb_dev->dev));

> +       dev->gpio_irq.name[sizeof(dev->gpio_irq.name) - 1] =3D 0;

This is redundant. Have you read the manual page on snprintf()?

...

> +       rc =3D devm_irq_alloc_desc(&pdev->dev, 0);
> +       if (rc < 0) {

> +               dev_err(&pdev->dev, "Cannot allocate an IRQ desc");
> +               return rc;

return dev_err_probe();

> +       }
> +
> +       dev->gpio_irq.num =3D rc;
> +       dev->gpio_irq.enabled =3D false;
> +
> +       irq_set_chip_data(dev->gpio_irq.num, dev);
> +       irq_set_chip_and_handler(dev->gpio_irq.num, &dev->gpio_irq.irq,
> +                                handle_simple_irq);

Oh l=C3=A0 l=C3=A0. Can you use the latest and greatest approach of
instantiating the GPIO IRQ chip?

...

> +               dev_err(&pdev->dev, "Cannot allocate the int URB");
> +               return -ENOMEM;

return dev_err_probe();

...

> +       rc =3D gpiochip_add_data(gpio, dev);

Why not devm?

> +       if (rc) {
> +               dev_err(&pdev->dev, "Could not add GPIO\n");
> +               goto release_urb;

return dev_err_probe();

> +       }

...

> +static struct platform_driver ch341_gpio_driver =3D {
> +       .driver.name    =3D "ch341-gpio",
> +       .probe          =3D ch341_gpio_probe,
> +       .remove         =3D ch341_gpio_remove,
> +};
> +

Redundant blank line.

> +module_platform_driver(ch341_gpio_driver);

--=20
With Best Regards,
Andy Shevchenko
