Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F1DA3622
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 13:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfH3L6a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 07:58:30 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38385 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbfH3L6a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Aug 2019 07:58:30 -0400
Received: by mail-oi1-f195.google.com with SMTP id q8so5127763oij.5
        for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2019 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2GgEZLzospHW6voyfcLjBAZhEwnM+1xe/mwLZoPtRCU=;
        b=2GoDUPgGMrJopQJev+GwJ2zb478KObnSGEcEL8ddOVbTGOsy5gOlGDnemCnMr28ooK
         P9rmMivJITEcQMha3lYq0O8Lw0j/W9JCj41LAlo6XwGOfmii/XwTL2KVqJH7861KU0pD
         T0i4nKOzh4JIM7ZK9hGbQoLx2CT3fK1MwHkdhL+fVj4vM2jnp+2NFT1YottBrq+F/xkF
         hPbf7CUJwgQq9gaYG/hcJXFBB/zHLZAGNNGEh0Jt91ZpYJaMxKfdHi+1X319QmcYchXu
         s3A0pld4vGA3aVtPyUd5CfFkIMWs2JXB47NG4zhSpSBiB3IIDmBgDnBSeZh9cin0KpEB
         YK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2GgEZLzospHW6voyfcLjBAZhEwnM+1xe/mwLZoPtRCU=;
        b=fNTbNvQmT0TeSGO4Sg4/SHVa4Li/9ooHGraulZYErIK/GtpbFt18HTnsN48ZQC0+uF
         k3y5qMqUaj/6lIe5NMjPlOwcbobgMnwZM4uZ06aJwT31qX4YXfQKq1RjAxwq4u+ESmC7
         WjigsBP8sNYCRUSM56IsJZe58kliet/s8yTLFJuOLhqlSzQb9rsHfb3UiJDlRRWRGgnb
         DAIMjeWoAr25WPzkkYHYU/fqWg8RLV9ONZ4Lh/LC19C4w9izjSJ8YCiR7W3sW28dHoeD
         EC5QXMDSH9PdBEZxB4p7vK9YOAoU15Bnwj5qJxxjkmsktyz35yzBWLcKLQrcuh27j0Ns
         Q41A==
X-Gm-Message-State: APjAAAU7y2YxH/QPzkyJMkdKqn1IMKwt7VV6TyD2TdvuxtGKddyaFlLx
        1rmayYkb4ZMiXooxGm+MCMCfW7SWbcrPAmtVbrpwPQ==
X-Google-Smtp-Source: APXvYqyNfJ7JtaCY73Mx/sUTSkmPDz4m+/DcOFUxZpisEaStc0/2SGQXmRcLJ49fxdQyFZ0qp/c4IMKD3BqCFA2Qseg=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr1361086oih.170.1567166308953;
 Fri, 30 Aug 2019 04:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190829020446.27176-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20190829020446.27176-1-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Aug 2019 13:58:17 +0200
Message-ID: <CAMpxmJW7bb9i9tffgwSOm5rUejo0LutmS+bsEFcA0Rv1MHrAgw@mail.gmail.com>
Subject: Re: [PATCH] misc: eeprom: at24: support pm_runtime control
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

czw., 29 sie 2019 o 04:04 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
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

Please, add a newline here.

> +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev,
> +                                      AT24_NUM_SUPPLIES,
> +                                      at24->supplies);

This fits nicely in 80 chars - no need to break the line here again.

> +       if (err =3D=3D -EPROBE_DEFER) {
> +               dev_err(dev, "Failed to get power regulators\n");

I assume you want to make the supplies optional by only returning on
EPROBE_DEFER, but why the error log then?

> +               return err;
> +       }
> +       at24->has_supplies =3D !err ? true : false;

Just a simple at24->has_supplies =3D !err is enough.

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

Unrelated to this patch, but I'm surprised we don't have optional
variants for bulk regulator operations.

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

The rest looks good.

Bart
