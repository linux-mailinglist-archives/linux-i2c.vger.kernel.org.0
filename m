Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62BF7E1489
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2019 10:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390351AbfJWIoW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 04:44:22 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42444 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbfJWIoW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 04:44:22 -0400
Received: by mail-oi1-f196.google.com with SMTP id i185so16659409oif.9
        for <linux-i2c@vger.kernel.org>; Wed, 23 Oct 2019 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OblNyVWtD3yTdiTGP3A6F3VyxKXzCtEGTA0M441Y4wA=;
        b=pY89VzZ1G0lwGkJ7LROmp28XTl29C4cO9jkk/YWYI/qTGQyFrPFidZ04aFr/JPZ0vA
         llBYOFhWHxVIih3K6J7Ow/MjcaPop07PwzCEVMqwzk+RUAlXrAd76w2rzOiiJAE7en69
         9+Xka3HxT8yeBtNJZ8TiXD4M/K5YSgnm/SEyVw45Wqj36zyxrwyo1t3g30QcevG5LHPa
         zIgCO9ChO+F2P/6FfCiEHkKQupCv9XwdN47+ljW7rRXGUMtyzpPO+VjKucYPC9gP2rXd
         IBDAVw+C/6zhuD0WUTUf97XPHJTayWOVOUiHeAQcV8aIRBKtihGDUKHt4iso9+DxZLYX
         EY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OblNyVWtD3yTdiTGP3A6F3VyxKXzCtEGTA0M441Y4wA=;
        b=OiY4OVGT9ZAjnzr5XnLH9p75KIP/YTkeXA9MCEIQOHI/8kDjMIK/tCX7YEO6QMpHUL
         nT6ADOkENaqKt83KbgARrsJlF7+59U1mcq7W3WOQ76WhZXo+3ENwOuEf93f+4wbMWbht
         p57FPl5C7zL1CFoJWhwCKc4MzpvnVl9wsTnPTjGVnVN67x5N4WreMpMRGXt6hq6cK3Di
         TQT/YgJat14p+GjFF6+CfFhhV/ezwqZ7xvWemckwKX99rznMt1olVXiciGsKClKtv7U0
         v5DV6C6/h3h834v2CZJKEFdLc2GYcFFHMYm65Aoz8DXU4d4/zFrlVQ605jrV8Nl821Ms
         6o/g==
X-Gm-Message-State: APjAAAXmpVYDbPdahzhl9V1m4sDzW137i+8rAVHZsw3jybL+3WlOWaab
        JXl5HJNWTi1w9ZDoQn7U6TVIOT0ix4zZms+wbSPh9w==
X-Google-Smtp-Source: APXvYqyIEqJ6JGrYh7DjJjTIuN/W/lIqEqOulsDECYK10GFOoCDn8xB7HizP21tAO8907dEAvjojQ/AasJS3DV+/64g=
X-Received: by 2002:aca:5c06:: with SMTP id q6mr6719106oib.175.1571820259352;
 Wed, 23 Oct 2019 01:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191023082156.1348-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20191023082156.1348-1-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 23 Oct 2019 10:44:08 +0200
Message-ID: <CAMpxmJWw39S40_UX_VyErP9GMJH1mAeE8PdzfiZHKVWZTdQ7mg@mail.gmail.com>
Subject: Re: [PATCH v6] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 23 pa=C5=BA 2019 o 10:22 Bibby Hsieh <bibby.hsieh@mediatek.com> n=
apisa=C5=82(a):
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
>
> Changes since v5:
>  - remove has_supplies
>
> Changes since v4:
>  - add system sleep PM ops
>  - move regulator_bulk_disable before suspend()
>  - fixes error handling
>
> Changes since v3:
>  - remove redundant calling function
>  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
>  - change supply name
>
> Changes since v2:
>  - rebase onto v5.4-rc1
>  - pm_runtime_disable and regulator_bulk_disable at
>    err return in probe function
>
> Changes since v1:
>  - remove redundant code
>  - fixup coding style
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/misc/eeprom/at24.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2cccd82a3106..1332bba93d32 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -22,6 +22,7 @@
>  #include <linux/nvmem-provider.h>
>  #include <linux/regmap.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/gpio/consumer.h>
>
>  /* Address pointer is 16 bit. */
> @@ -67,6 +68,12 @@
>   * which won't work on pure SMBus systems.
>   */
>
> +static const char * const at24_supply_names[] =3D {
> +       "vcc", "i2c",
> +};
> +
> +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> +
>  struct at24_client {
>         struct i2c_client *client;
>         struct regmap *regmap;
> @@ -91,6 +98,7 @@ struct at24_data {
>
>         struct gpio_desc *wp_gpio;
>
> +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserv=
e
>          * them for us, and we'll use them with SMBus calls.
> @@ -662,6 +670,11 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client =3D client;
>         at24->client[0].regmap =3D regmap;
>
> +       regulator_bulk_set_supply_names(at24->supplies,
> +                                       at24_supply_names, AT24_NUM_SUPPL=
IES);
> +       devm_regulator_bulk_get(&at24->client[0].client->dev,
> +                               AT24_NUM_SUPPLIES, at24->supplies);

You still need to check the return value here - this call can still
fail for many reasons.

> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -701,6 +714,12 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> +       err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> +       if (err) {
> +               dev_err(dev, "Failed to enable power regulators\n");
> +               return err;
> +       }
> +
>         /* enable runtime pm */
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> @@ -713,6 +732,8 @@ static int at24_probe(struct i2c_client *client)
>         pm_runtime_idle(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
> +               regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                      at24->supplies);
>                 return -ENODEV;
>         }
>
> @@ -725,15 +746,44 @@ static int at24_probe(struct i2c_client *client)
>
>  static int at24_remove(struct i2c_client *client)
>  {
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
>         pm_runtime_disable(&client->dev);
> +       if (pm_runtime_status_suspended(&client->dev))
> +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies)=
;

So you will now disable the regulators if they're already disabled in
at24_suspend() but not disable them if they're not. This is clearly
inverted.

Bart

>         pm_runtime_set_suspended(&client->dev);
>
>         return 0;
>  }
>
> +static int __maybe_unused at24_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
> +       return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                     at24->supplies);
> +}
> +
> +static int __maybe_unused at24_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
> +       return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> +                                    at24->supplies);
> +}
> +
> +static const struct dev_pm_ops at24_pm_ops =3D {
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
> +       SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
> +};
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
