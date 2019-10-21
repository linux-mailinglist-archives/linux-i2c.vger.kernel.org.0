Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8868DF3A5
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 18:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfJUQxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 12:53:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43963 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfJUQxX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Oct 2019 12:53:23 -0400
Received: by mail-oi1-f195.google.com with SMTP id t84so11607771oih.10
        for <linux-i2c@vger.kernel.org>; Mon, 21 Oct 2019 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nME/u4wI5q7AJCWRntyQc1gYZ6SnFLLKHzwttb67YQg=;
        b=ANM/9pGQCCRmP60MJp6F2IZL2/+kh4DvZzJgN5ruRc5/KKDrkzOI6eGWqk5arUiMnl
         n5uJMwLNx/vdUFy0jtJU+7/O9ZXur4yuWDaq/lto9qlhFTqELcl/BGaykcjQ/Xj/aP7n
         1Wg+yqZr/hgIFkdPWnUxgPudc8mRCm++qMe1nn39ESs6I3w8CuDI2GSJeXW9SD8oXEJg
         S2gHFBor60qswX4oVTud3YLWPH+PrPHRwxPreWnm/7ZCBtUImY9Auuqf6GE9dPjWjrcl
         b7TlwS3EDVGNeYhc+/m4WcKid5QbulySnWRs3LZ0mg8b/EbRYwEqomvK077ty95G5L0N
         0LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nME/u4wI5q7AJCWRntyQc1gYZ6SnFLLKHzwttb67YQg=;
        b=GXUBjp9CrPQBGUDKQAlJ9TQ5mzw6pYZAiVc3Q2v3jvxVYeOrQ7gtbCsWN1J3bJt55R
         yYYEHQa2P0tV/HjixtfU8Nk6HGVvt0HLaGfncNnNgVUB3fkmSjWn7hZFLVtrgdYbzwp0
         FMvxwcZ0byFIItX60al5cDgnKx+ECp8hBZEoJ5Oc1bLzt75dLMO4Kh2E3GHJJTlCaci7
         3VCX0l0kHwvp3pcruir8iqzCUBIFHVe2XquGnfDrRj2I0wDxy4ViT1CCaWekRYONZrAF
         5wHH8egxEzYOHyN+oJwz7lOoLHRpuuhOMewXCH42i932TFSd3uat7vqtRKmULuDThTCf
         wqLQ==
X-Gm-Message-State: APjAAAVJU6MOzR5T12md9A72vv+g6tewcfyyMM46bIyQOglPTxRijqtP
        KW8a33+aQEJu0FozhvpDGKGqjwTUl63woTIwAibaAw==
X-Google-Smtp-Source: APXvYqxjZetmSAuwdImynDYdA645vx8AolO5E5PQGhh0YXQ0H7WAJxAzbDzKZZ7dICJ8hM0CCasF/CzS3vLnQnEVDWM=
X-Received: by 2002:aca:5c06:: with SMTP id q6mr20229589oib.175.1571676802458;
 Mon, 21 Oct 2019 09:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 21 Oct 2019 18:53:11 +0200
Message-ID: <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
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

pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=
=C5=82(a):
>
> Although in the most platforms, the power of eeprom and i2c
> are alway on, some platforms disable the eeprom and i2c power
> in order to meet low power request.
> This patch add the pm_runtime ops to control power to support
> all platforms.
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
>  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2cccd82a3106..68ced4f25916 100644
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
> @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client =3D client;
>         at24->client[0].regmap =3D regmap;
>
> +       regulator_bulk_set_supply_names(at24->supplies,
> +                                       at24_supply_names, AT24_NUM_SUPPL=
IES);
> +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev,
> +                                      AT24_NUM_SUPPLIES, at24->supplies)=
;
> +       if (err =3D=3D -ENODEV)
> +               at24->has_supplies =3D NULL;

I just gave this a spin and noticed that this will never happen - the
regulator core will use a dummy regulator if none is defined in DT.
The only way for this to make sense would be to use
regulator_get_optional() for each supply separately. But actually I
think we should just leave it this way and remove this if. In the end:
this chip needs some power supply, so dummy regulator makes sense.

Bart

> +       else if (err =3D=3D 0)
> +               at24->has_supplies =3D !err;
> +       else
> +               return err;
> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -701,6 +721,14 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> +       if (at24->has_supplies) {
> +               err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->su=
pplies);
> +               if (err) {
> +                       dev_err(dev, "Failed to enable power regulators\n=
");
> +                       return err;
> +               }
> +       }
> +
>         /* enable runtime pm */
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> @@ -713,6 +741,9 @@ static int at24_probe(struct i2c_client *client)
>         pm_runtime_idle(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
> +               if (at24->has_supplies)
> +                       regulator_bulk_disable(AT24_NUM_SUPPLIES,
> +                                              at24->supplies);
>                 return -ENODEV;
>         }
>
> @@ -725,15 +756,48 @@ static int at24_probe(struct i2c_client *client)
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
> +
> +       return 0;
> +}
> +
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
>
>         return 0;
>  }
>
> +static const struct dev_pm_ops at24_pm_ops =3D {
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
