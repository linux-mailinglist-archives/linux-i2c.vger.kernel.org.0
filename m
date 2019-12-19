Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB8E125FD6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 11:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLSKuO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 05:50:14 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33970 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfLSKuO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 05:50:14 -0500
Received: by mail-qt1-f193.google.com with SMTP id 5so4677224qtz.1
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 02:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vy8aTBxHPnHptbKUEW0ZqX1AFiL6kPXwWvfWBXCOYcc=;
        b=YDKwmgrU6ohz4vdCP4Zq6Xr7AmBfvS6cLSG3qn+yhCZnL5eoaFIp12VHJc5Gb2qvSB
         S9LpoOasxz6YLBtOTm+tzMxpcLC4FXm1H8K/SucC7Nv3QQkyTh0b2TBqosFmOywH2nvC
         /bl60vffq11mJ6vxrFGXYVe42QaDEfuCWv+hikPwizqCsetEsoAxCnePNZVMBnKQgO84
         OfcKLNVXJsIXRgdOKujsQIyhlok+MtenGmI2sTJ8flwNVebtzZIfdduK9pq5Wb/IBAo6
         Bjk084hnPvahpTvLHoEF50CjMfMSq1ys9rpsoI3pUoo5n1g4X4gvsJJed98sRqUNvmW5
         th/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vy8aTBxHPnHptbKUEW0ZqX1AFiL6kPXwWvfWBXCOYcc=;
        b=n2DlUx1zWUD7Yk+AhEGhkJu1Ec7DxCHEfayk2SOm/r7/gLLNOUfcsrowwcSA07lb34
         kUlTP3JByz/MZLQ6+pYM3R7EQIWTs1L3HfXqQnmEGmCwisxN5Wks5fUwSTL8wQ9EXeK5
         S7G9BVJJNFQ45uqI++Ho74UeK0ps6oaBZlc1u++skQ4Vag9MXwaGnRmAYUPC0g9RYAar
         cFHGsVXAkIH1h5MEdnutCpBmQa2+c8MNJDLYN2U9umabsMGnOukvH0NK6dIfsRvjnQ5g
         bwOxTT66YNYmUb8Mi0b2qIozXV4hRf7b2lSVERHzpls59gILThF9IJUJamm6j/ndyxmc
         TM/w==
X-Gm-Message-State: APjAAAX0no2y22xIfN+dHJGvlQuHFk53X5yaAHU5udMdpMFk92Sj6vOP
        wkMycHbM4wa2b2HrpzgZEgpjeVmahHjXTGKOJAgvzw==
X-Google-Smtp-Source: APXvYqxEDafXEvDQWeoU86DNw6Q3mOXUSsmj6l+9grWqZrJ+ZH8XH5T+FLeQQy6dIwvzls6oeCHVT7yTrpMNZufqJ34=
X-Received: by 2002:ac8:3703:: with SMTP id o3mr6280010qtb.208.1576752612574;
 Thu, 19 Dec 2019 02:50:12 -0800 (PST)
MIME-Version: 1.0
References: <20191216080445.8747-1-bibby.hsieh@mediatek.com> <20191216080445.8747-4-bibby.hsieh@mediatek.com>
In-Reply-To: <20191216080445.8747-4-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Dec 2019 11:50:01 +0100
Message-ID: <CAMpxmJUotmLe6sJ4ZEbMMzUeLJMi-gHyamEUuDJzj6k_4JjCBg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
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

pon., 16 gru 2019 o 09:04 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom are alway
> on, some platforms disable the eeprom power in order to meet
> low power request. This patch add the pm_runtime ops to control
> power to support all platforms.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/misc/eeprom/at24.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 0681d5fdd538..6ba23a7e4da1 100644
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
> @@ -662,6 +664,10 @@ static int at24_probe(struct i2c_client *client)
>         at24->client[0].client =3D client;
>         at24->client[0].regmap =3D regmap;
>
> +       at24->vcc_reg =3D devm_regulator_get(dev, "vcc");
> +       if (IS_ERR(at24->vcc_reg))
> +               return PTR_ERR(at24->vcc_reg);
> +
>         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(at24->wp_gpio))
>                 return PTR_ERR(at24->wp_gpio);
> @@ -701,6 +707,12 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> +       err =3D regulator_enable(at24->vcc_reg);
> +       if (err) {
> +               dev_err(dev, "Failed to enable vcc regulator\n");
> +               return err;
> +       }
> +
>         /* enable runtime pm */
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> @@ -713,6 +725,7 @@ static int at24_probe(struct i2c_client *client)
>         pm_runtime_idle(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
> +               regulator_disable(at24->vcc_reg);
>                 return -ENODEV;
>         }
>
> @@ -729,14 +742,39 @@ static int at24_probe(struct i2c_client *client)
>  static int at24_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               regulator_disable(at24->vcc_reg);

Did you at least *try* to compile this? Because if you did, you'd
notice it doesn't build.

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
