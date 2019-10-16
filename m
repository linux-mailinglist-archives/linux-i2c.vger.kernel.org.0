Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE8AD8C76
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2019 11:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732425AbfJPJYD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Oct 2019 05:24:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36345 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJPJYC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Oct 2019 05:24:02 -0400
Received: by mail-ot1-f65.google.com with SMTP id 67so19539447oto.3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2019 02:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p8pJoM0ENpD7cPZmUFAlLWpRSZm4q/f1/sdGdo3mDmc=;
        b=iyxaXeX36m9qf2HH3niBnPwUoEE1FlTLodrghx7+X+V9LI2vxlA5X1gCA2gUJNPbF2
         GiasUkTLPB3yHT1B/NFJ6EwdKD5pXT/y5ljgs52qoiQHy1Y4DYEqqeLDlJS/CD8bzCsx
         L/l+2j7WKlfwhKcF2XeTHSNdRkriKlSRrhZtE1uN4d39G59jNn230CyLbSWdzJ98BTUH
         MsoOwNjFEU8OmoQG8Xg5WYWLJ3lQz+uPY1LwvMiwCH3EsahaLtM4sw8nkXtPFDlBC1o8
         Ia3YonHtIU8gm8S9xuByaongFMiJG6zJUdiWvG4LXtgb1BAcye3oBVRRLOjilouBF7g6
         UHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p8pJoM0ENpD7cPZmUFAlLWpRSZm4q/f1/sdGdo3mDmc=;
        b=OeqsYnVxYgoHUDnWqpaF4hYwwDyxwAZd5KMACXy+kvrxyd0XJ1HUHuxFfZXTYrGUNS
         XUHitXsRJiDjTts/EgsNUDbbuLGEndaSWfXVyGgdX5GSDb6kchJtA3wsBdV4KKrIMBmo
         Y5fK5q84mY+m76rdh0fG4JJqJYKjn25M5nw6B3i7ntAZw16eCtzq/QOGNxmEzBTdME8o
         WFv32liCLGra+8OKinKJ5VMzAW5bxwK1LC5AMD51xcBeFVnRweqguXi3y65+3180LEjy
         Sh/sGVo0yhJbmWiaBq3QO3XLNiueHiEmKhwhakHjnoZShDJBia9YvJmg28bHbiydoN36
         Po2Q==
X-Gm-Message-State: APjAAAU54oaa+D7u3MpXhAA5poOziCEf5uekvajIEmsPOD85aJLYyld0
        ivLASO2J6CINJ97hwoAwvSeHnz6HEnQ7rKa8dt9CpQ==
X-Google-Smtp-Source: APXvYqwH8ALi8/54BtHQw9b9gkj8XcepGDeCb+uKP1gFVUcvx8HgB3MYoDtqpwImKN/nmyCHqk0VPK2qllOPLsTxihw=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr33814442otb.85.1571217841165;
 Wed, 16 Oct 2019 02:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191016075110.8240-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20191016075110.8240-1-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Oct 2019 11:23:50 +0200
Message-ID: <CAMpxmJX7p8ZFQrpeSNAiM4uf6W2MfYbE98stYpHi+GtQyh-pxg@mail.gmail.com>
Subject: Re: [PATCH v3] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 16 pa=C5=BA 2019 o 09:51 Bibby Hsieh <bibby.hsieh@mediatek.com> n=
apisa=C5=82(a):
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
>
> Changes since v2:
>  - rebase onto v5.4-rc1
>  - add pm_runtime_disable and regulator_bulk_disable at
>    err return in probe function
>
> Changes since v1:
>  - remove redundant code
>  - fixup coding style
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/misc/eeprom/at24.c | 63 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2cccd82a3106..7ff614aef301 100644
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
> +       "power", "i2c",
> +};
> +
> +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> +
>  struct at24_client {
>         struct i2c_client *client;
>         struct regmap *regmap;
> @@ -91,6 +98,8 @@ struct at24_data {
>
>         struct gpio_desc *wp_gpio;
>
> +       bool has_supplies;
> +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserv=
e
>          * them for us, and we'll use them with SMBus calls.
> @@ -662,6 +671,15 @@ static int at24_probe(struct i2c_client *client)
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

One more thing I noticed: we should only set has_supplies to NULL if
the error code returned by regulator_bulk_get is ENODEV. Other errors
should break the execution of probe().

Bart

> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -704,14 +722,26 @@ static int at24_probe(struct i2c_client *client)
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
> +                       pm_runtime_disable(dev);
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
> +               if (at24->has_supplies)
> +                       regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                              at24->supplies);
>                 pm_runtime_disable(dev);
>                 return -ENODEV;
>         }
> @@ -725,15 +755,46 @@ static int at24_probe(struct i2c_client *client)
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
