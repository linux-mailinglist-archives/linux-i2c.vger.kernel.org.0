Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FD0A4FB5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 09:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbfIBHXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 03:23:36 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37331 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfIBHXe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 03:23:34 -0400
Received: by mail-oi1-f194.google.com with SMTP id b25so9759194oib.4
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fv/aAmW9UbdiU74xer3Yn1fxV+OAwYSdbO2gGe/vUf4=;
        b=CTSztAnZOYN3nOUv8nvnX6j5DUaJQqycgOJe9hqvAXXmU9fHzGfm0gzrxstM8stD/V
         N84nTrNvYCYhE4RA3JcWLX+xGiAgMk1TNKxq3uaFim3JWebXo3yazmVTKSv6d0XhEFB3
         nWQI9eTAhH7FJqGqTNMlVke5v2yUtT+AOPFtfk9TS6oftZCiX44BYQuVymcKpAA3tOtj
         4sH/6dkbBzVr2pGd/8xHtjeIOFPXH3/5/4TxUUTX0zxlzdFkINoQbCGikbpLdZJ+56gi
         JFtplhqyD+VH9L9o1+8+HfTIUAKmyTDCRQ16A/90uMqdZhrRP40lcAnWWRZUzI2DfCLg
         T+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fv/aAmW9UbdiU74xer3Yn1fxV+OAwYSdbO2gGe/vUf4=;
        b=D4IzNNunqHtH803xNkVwpsGe1vmkMN6rQwUj2RrEfx+Zv/W4+uRaFxJ1IuVAI3UWGK
         ABUHfRA8fm5bv5t1c2Swv1drWlixDGp2qonHZjltCh5VSmGBsy9o32IG927Otkkm2TK9
         IlDnaNB08fh/jNTPj3sg1VqD71ddWzk0e3/m+84dbDDSj+mUtUGTG0pq4tmDICEsyHsQ
         IEoxP8IIfgkXjYS9G7Q1TtYDnjH12L865FicdUJoj67pItRFGJYyGghNzEt3d2WCMY9P
         tq7lldBbDCZl0A5D02iQrqtcaLPKHqn6/te0OGp9nhJP6bncASjmhaGp+HghChJIxw41
         1CtA==
X-Gm-Message-State: APjAAAWn96ScBeOTREwnzjoNWzC/WqXOtYXsJQyBoJd8ssRgcmVXAi1h
        spq/CQNWW2n3EgsH0FIy3BXR9rbDLGG7Umlp4ax/MA==
X-Google-Smtp-Source: APXvYqzfrkOEGlEeAKWOE4nryCxI9okN0hcCkT3NlO7O0RttcmUXuyvzWplFjZF896KOk10piQ3T9pZhDHxnL/nJFN0=
X-Received: by 2002:aca:57c9:: with SMTP id l192mr18061280oib.21.1567409013521;
 Mon, 02 Sep 2019 00:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Sep 2019 09:23:22 +0200
Message-ID: <CAMpxmJUYX6AuNedON5queZLNy__uw0h3ae1TWXtOudFPk6EASA@mail.gmail.com>
Subject: Re: [PATCH v1] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 2 wrz 2019 o 05:32 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
>
> Changes since v1:
>  - remove redundant code
>  - fixup coding style
>

The subject tag should be v2. Patches start at (implicit) version 1.
It's even more confusing since you're saying "Changes since v1" here
but the subject says v1 too.

The patch now looks good, but it's too late in the release cycle for
this kind of change. I'd like it to spend some time in next, so I'll
pick it up after the v5.4 merge window.

Bart

> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/misc/eeprom/at24.c | 59 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 35bf2477693d..ce17e82eedca 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -23,6 +23,7 @@
>  #include <linux/nvmem-provider.h>
>  #include <linux/regmap.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/gpio/consumer.h>
>
>  /* Address pointer is 16 bit. */
> @@ -68,6 +69,12 @@
>   * which won't work on pure SMBus systems.
>   */
>
> +static const char * const at24_supply_names[] =3D {
> +       "power", "i2c",
> +};
> +
> +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> +
>  struct at24_client {
>         struct i2c_client *client;
>         struct regmap *regmap;
> @@ -92,6 +99,8 @@ struct at24_data {
>
>         struct gpio_desc *wp_gpio;
>
> +       bool has_supplies;
> +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserv=
e
>          * them for us, and we'll use them with SMBus calls.
> @@ -663,6 +672,15 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client =3D client;
>         at24->client[0].regmap =3D regmap;
>
> +       for (i =3D 0; i < AT24_NUM_SUPPLIES; i++)
> +               at24->supplies[i].supply =3D at24_supply_names[i];
> +
> +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev,
> +                                      AT24_NUM_SUPPLIES, at24->supplies)=
;
> +       if (err =3D=3D -EPROBE_DEFER)
> +               return err;
> +       at24->has_supplies =3D !err;
> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -705,13 +723,21 @@ static int at24_probe(struct i2c_client *client)
>         /* enable runtime pm */
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> +       pm_runtime_get_sync(dev);
> +       if (at24->has_supplies) {
> +               err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->su=
pplies);
> +               if (err) {
> +                       dev_err(dev, "Failed to enable power regulators\n=
");
> +                       return err;
> +               }
> +       }
>
>         /*
>          * Perform a one-byte test read to verify that the
>          * chip is functional.
>          */
>         err =3D at24_read(at24, 0, &test_byte, 1);
> -       pm_runtime_idle(dev);
> +       pm_runtime_put(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
>                 return -ENODEV;
> @@ -726,15 +752,46 @@ static int at24_probe(struct i2c_client *client)
>
>  static int at24_remove(struct i2c_client *client)
>  {
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> +       if (at24->has_supplies)
> +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies)=
;
>
>         return 0;
>  }
>
> +static int __maybe_unused at24_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
> +       if (at24->has_supplies)
> +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                             at24->supplies);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused at24_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
> +       if (at24->has_supplies)
> +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> +                                            at24->supplies);
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(at24_pm_ops, at24_suspend, at24_resume);
> +
>  static struct i2c_driver at24_driver =3D {
>         .driver =3D {
>                 .name =3D "at24",
> +               .pm =3D &at24_pm_ops,
>                 .of_match_table =3D at24_of_match,
>                 .acpi_match_table =3D ACPI_PTR(at24_acpi_ids),
>         },
> --
> 2.18.0
>
