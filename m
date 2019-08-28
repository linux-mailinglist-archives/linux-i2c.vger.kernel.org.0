Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE36A003F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 12:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfH1KxV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 06:53:21 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34499 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfH1KxU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Aug 2019 06:53:20 -0400
Received: by mail-ot1-f67.google.com with SMTP id c7so2320578otp.1
        for <linux-i2c@vger.kernel.org>; Wed, 28 Aug 2019 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0Qfm8LiiIXtQSHJ6gK9Fv/1wBBu3He9nHb7OTlrKxDM=;
        b=Zj1OpGq6wvUwjOgIwFINm92baj1QpbFv/DnueFssQNGIGQVEGcudGntKPxcVesW2R0
         5yMJeBW10Dmr0ynhGeUYN6sOlZsG8MStsI0vM2S8JUdSMx65h5GPA0TQveJBQDaKe8r2
         n/D40LLOTxW93aq+1Yce7Y7uONkBR3u8ulk7E5a34szNDPzpTV/n1be0b9yTfsVug+j7
         Q6nlUbzZhgM8mRNCbwl9LvGUbr6CmxyhLYKa7z8tDNYIPdDUuxMgzvP4ILKer9oHX/as
         UsFOmgjVztrItVJyIQbhKwwcgQfn1Ci/CmG9yoEEd1ErFhMqLasIQ5GGMXc45FPuo53V
         JgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0Qfm8LiiIXtQSHJ6gK9Fv/1wBBu3He9nHb7OTlrKxDM=;
        b=qckhb3QfZvh7o2/70e/dHuHBgTALuLO1y0t1F344/jM8YughE/wALMU2ajdRzytW+B
         uokWp+799D22naFaFpjtcjbBSLoGNawWlFTaMVW7pvqBQ0pnQ++dJfME/YADpsMoC3LA
         rFoe86F44nZ5r/N1njkXYXTC9Wa3h7g8/CWanM2vWIoCzhTAGBM/LYnNJ+CoUHHoYAuS
         wqBoqmQ6GhyDE/ZAO1nJZVlBYXIUU+aM+ajD7AkaWUxPenrPwRy3SOiFrwa+Z3vn0+D7
         ACK+U2U1d11YG/DVBAFYS7b/fS+hnKlNLyu5jVegRQpyQjng8KkSjX4/A01PPXehl/p6
         yKeA==
X-Gm-Message-State: APjAAAWPA3QzIx1nXj9XsZdXWn0bj0V/4aW6NECOXmrZ7Ze9peNCOJvw
        /WpGBuFKd6ByKQwHoXb9kLfSEU+1MOY0K4Bf40aAew==
X-Google-Smtp-Source: APXvYqwTrFauwm1RhBVAv4tYF605x8C9vroTaUbIWee3yk+NEK/LR5vl+5RThGmowi72ACg2FUlI/NW7eibtpUeHnxc=
X-Received: by 2002:a9d:a87:: with SMTP id 7mr2575307otq.256.1566989599879;
 Wed, 28 Aug 2019 03:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190827012015.10440-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20190827012015.10440-1-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 28 Aug 2019 12:53:09 +0200
Message-ID: <CAMpxmJV1LDSYtBQK2pYPwCnhSwQ825rjFsYxiYXwn+Qbhfg=TA@mail.gmail.com>
Subject: Re: [PATCH v0 1/1] WIP: misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>, tfiga@chromium.org,
        drinkcat@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 27 sie 2019 o 03:20 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

Why do you mark it as work-in-progress? Is it supposed to be reviewed?

Bart

> ---
>  drivers/misc/eeprom/at24.c | 61 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 35bf2477693d..2843e4b4aacd 100644
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
> @@ -663,6 +672,17 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client =3D client;
>         at24->client[0].regmap =3D regmap;
>
> +       for (i =3D 0; i < AT24_NUM_SUPPLIES; i++)
> +               at24->supplies[i].supply =3D at24_supply_names[i];
> +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev,
> +                                      AT24_NUM_SUPPLIES,
> +                                      at24->supplies);
> +       if (err =3D=3D -EPROBE_DEFER) {
> +               dev_err(dev, "Failed to get power regulators\n");
> +               return err;
> +       }
> +       at24->has_supplies =3D !err ? true : false;
> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -705,13 +725,21 @@ static int at24_probe(struct i2c_client *client)
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
> @@ -726,15 +754,46 @@ static int at24_probe(struct i2c_client *client)
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
