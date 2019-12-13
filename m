Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC1C11E01D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 10:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfLMJDF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 04:03:05 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36826 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfLMJDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 04:03:04 -0500
Received: by mail-qk1-f195.google.com with SMTP id a203so1500520qkc.3
        for <linux-i2c@vger.kernel.org>; Fri, 13 Dec 2019 01:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kTG9gv9SOZIPOVJzDJM+df2CjEEz9qevtkCrk8J1s0A=;
        b=DHJyLHttSXK0xDOQ9VfWwJ6rbNYj0rhTyg/y2yVcZFMXlagW9jJGLzI4znvQrkD+cj
         fYKvlYAgxLh9Z/Z5xbQ6Q9yVL9w3tQqpsaaIPCLYw63SO+rQDQJHQLsK9p7Y/V+TynLW
         BnRg4Jotw1sJSc+yVnppfeuSht1KYIi2C+IF6ZA3NbW/a+EnteinBPfgCK8CdibAaHxa
         Y0J09NP2xsX7d5ZfWD4mQh0yYZPSZNTqqJW6olMpYSnbCeYpIBfehyNKDkxlW6OOLpzL
         MKygFCFg58eMUhZA5sVwcFrl0/sjtoeBn/fm9thq2A1uOQQQRBGg4Hn0LsrVRcXjrn8j
         JbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kTG9gv9SOZIPOVJzDJM+df2CjEEz9qevtkCrk8J1s0A=;
        b=deBKaA8Lcxa45TAwSTBj0Z/iCAuIm0aJTDmkaRWsPuWsk151I1fJcqAakPjSZQ/NLb
         +3Ol/Vc83kgg3w2quHWHKE8HoTEobaa3CHMXuy4OWq50mMokD4P5qxys0/w3pNCTbAx6
         nWW7QuB4O1d95gsdyMQfODJ+Da4Ghq9l5C0w6y0Y0W3EXlZO3zE0gQSGXK0OxfT6AnQy
         H/8Ppvz+FAqqP8JXIb7ueLrqdnMwGgQd/oC8x8JTxmLYw3HOyw5WVXaQttfmry5AZnLy
         GEIpfSLC22pg+PH4AzHKk/qiuF5MjvwWVansiZJH7VLRoGD+6FAvRq/pSZz86fdy6TcO
         6r+Q==
X-Gm-Message-State: APjAAAW9Iil/0ItDFtJaNwrofR1JbRdAyutMC9aTsMYDdiTjiQRfaoJ8
        zZk20UL11gisQVqxuJcP4ILxUeYRJndkRezxcQ+CkQ==
X-Google-Smtp-Source: APXvYqyPTiUNv1U6uLx+OKkkfK2bAqiNb78Jc0oCvWzUDV4NVgH64g14KOX4K8npYUqsx8DnR1sZBnKCH9aro9rEa5o=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr12032137qkc.21.1576227783386;
 Fri, 13 Dec 2019 01:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20191213081230.23494-1-bibby.hsieh@mediatek.com> <20191213081230.23494-4-bibby.hsieh@mediatek.com>
In-Reply-To: <20191213081230.23494-4-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 13 Dec 2019 10:02:52 +0100
Message-ID: <CAMpxmJWh3YMkn_1B=nJLmRRXn9uD2kU4grf8c+sMbWtKFZOv=w@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] misc: eeprom: at24: support pm_runtime control
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

pt., 13 gru 2019 o 09:47 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom are alway
> on, some platforms disable the eeprom power in order to meet
> low power request. This patch add the pm_runtime ops to control
> power to support all platforms.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/misc/eeprom/at24.c | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 0681d5fdd538..06ae2cc32f79 100644
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
> @@ -91,6 +92,7 @@ struct at24_data {
>
>         struct gpio_desc *wp_gpio;
>
> +       struct regulator *vcc_reg;
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserv=
e
>          * them for us, and we'll use them with SMBus calls.
> @@ -662,6 +664,12 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client =3D client;
>         at24->client[0].regmap =3D regmap;
>
> +       at24->vcc_reg =3D devm_regulator_get(dev, "vcc");
> +       if (IS_ERR(at24->vcc_reg)) {
> +               dev_err(dev, "failed to get at24 VCC regulator\n");

The regulator core is quite verbose in its error messages when calling
regulator_get() - you don't need to add yours here. Just return the
error code.

> +               return PTR_ERR(at24->vcc_reg);
> +       }
> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -701,6 +709,12 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> +       err =3D regulator_enable(at24->vcc_reg);
> +       if (err) {
> +               dev_err(dev, "Failed to enable at24 vcc regulator\n");

Drop the at24 name - dev_err() will print the device name for you.

> +               return err;
> +       }
> +
>         /* enable runtime pm */
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> @@ -713,6 +727,7 @@ static int at24_probe(struct i2c_client *client)
>         pm_runtime_idle(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
> +               regulator_disable(at24->vcc_reg);
>                 return -ENODEV;
>         }
>
> @@ -729,14 +744,39 @@ static int at24_probe(struct i2c_client *client)
>  static int at24_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> +       if (pm_runtime_status_suspended(&client->dev))
> +               regulator_disable(at24->vcc_reg);

Why didn't you fix the inverted logic here as I pointed out back in v6
of this series?

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
> +       return regulator_disable(at24->vcc_reg);
> +}
> +
> +static int __maybe_unused at24_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> +
> +       return regulator_enable(at24->vcc_reg);
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
