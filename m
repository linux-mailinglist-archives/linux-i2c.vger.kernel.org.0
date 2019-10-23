Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3218E1930
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2019 13:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390796AbfJWLjd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 07:39:33 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35414 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390721AbfJWLjd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 07:39:33 -0400
Received: by mail-oi1-f196.google.com with SMTP id x3so17090537oig.2
        for <linux-i2c@vger.kernel.org>; Wed, 23 Oct 2019 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uo65/IuvgetKmPBMNTMINkaikvCC7XEZ1FYMxpyHQio=;
        b=oUU5Eiz49Hi+rU6qH+7LuNQ+icqy0LI3N1km144Ftn6DUHpNVWQXSQjmiuvEXmiA/G
         rnyhYjhgneQYAmWw6zAx4NmM7+/sGUlbI/+FX49WutK+WKAuoqWfvNH/LPrUctYD8z1k
         ButCgRq3+vgw2Tcifuy91JqVpIL47o89O/Pvybc/5enJeEIxOfY2AQWUGSGCS7ExOIuw
         RC39YADWV+/ZeAZPbYBU/s5up+1HRsENBQzWiC9qZtKaofR3C+ZiUcFckS3Li+QvJ93o
         TdNrNFFFMoWYU17kWdJYR+vpUxdhOfp3gBYKULUCG/X8zudM9gec9C/VLXFXCFrjPcsl
         Ve3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uo65/IuvgetKmPBMNTMINkaikvCC7XEZ1FYMxpyHQio=;
        b=GsFw4MIGgsetUFokM412KJxn4V1Ni+pBpzSSK7Bqn8pxZogw65mVjeahJQUhD3wyPN
         lniwBzZ11uE6BsNMzksIwykEPGQY+0iuQUkTrJY+q8HemHrT/SafgbPDcNadPVgMl59d
         7DtPKGntQXNpE3xHNgqf06QVSj4Vr2B7GtOtAbptFfjS0A0iTdeQVtodQBfz0sTsOF1c
         fFyy+BHNU1ETmq/VdcRnx90eYDxPdpGbC85PO+NcGvPTkVJGSeupTXfT2Fga2X1W8id6
         m4BtQ8+KmTbDEVliCxgyPD/yfqsJfXT62IQ9n4iUBwtTqL+p8Cl+RJARshFRl/A1Oa0s
         7H6A==
X-Gm-Message-State: APjAAAUNPJ5REvzWKB+NtoU74sOZtUu8PzNZ77IgH0yDzapJJ2TMIiKN
        Xkj5x3LSgt3LgNahB5vBNWY5G3+mQz5Opl1B01TaViTh
X-Google-Smtp-Source: APXvYqyVJYQjumm9fwfoAgTJ0mFXvejyrTnVP3LNJfr2nMEudsxXNCpP1zf3rd+YZqMDNsdAKtm4ksiWGuWZCiW2fws=
X-Received: by 2002:a05:6808:114:: with SMTP id b20mr7358160oie.114.1571830772138;
 Wed, 23 Oct 2019 04:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191023082156.1348-1-bibby.hsieh@mediatek.com>
 <CAMpxmJWw39S40_UX_VyErP9GMJH1mAeE8PdzfiZHKVWZTdQ7mg@mail.gmail.com> <1571822543.32053.2.camel@mtksdaap41>
In-Reply-To: <1571822543.32053.2.camel@mtksdaap41>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 23 Oct 2019 13:39:21 +0200
Message-ID: <CAMpxmJXZqMf3jACZRmMTGLkepcVvxgyR+9ZxUeZu+L6uzzS-Qw@mail.gmail.com>
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

=C5=9Br., 23 pa=C5=BA 2019 o 11:22 Bibby Hsieh <bibby.hsieh@mediatek.com> n=
apisa=C5=82(a):
>
> On Wed, 2019-10-23 at 10:44 +0200, Bartosz Golaszewski wrote:
> > =C5=9Br., 23 pa=C5=BA 2019 o 10:22 Bibby Hsieh <bibby.hsieh@mediatek.co=
m> napisa=C5=82(a):
> > >
> > > Although in the most platforms, the power of eeprom and i2c
> > > are alway on, some platforms disable the eeprom and i2c power
> > > in order to meet low power request.
> > > This patch add the pm_runtime ops to control power to support
> > > all platforms.
> > >
> > > Changes since v5:
> > >  - remove has_supplies
> > >
> > > Changes since v4:
> > >  - add system sleep PM ops
> > >  - move regulator_bulk_disable before suspend()
> > >  - fixes error handling
> > >
> > > Changes since v3:
> > >  - remove redundant calling function
> > >  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
> > >  - change supply name
> > >
> > > Changes since v2:
> > >  - rebase onto v5.4-rc1
> > >  - pm_runtime_disable and regulator_bulk_disable at
> > >    err return in probe function
> > >
> > > Changes since v1:
> > >  - remove redundant code
> > >  - fixup coding style
> > >
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > ---
> > >  drivers/misc/eeprom/at24.c | 50 ++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 50 insertions(+)
> > >
> > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > > index 2cccd82a3106..1332bba93d32 100644
> > > --- a/drivers/misc/eeprom/at24.c
> > > +++ b/drivers/misc/eeprom/at24.c
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/nvmem-provider.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <linux/gpio/consumer.h>
> > >
> > >  /* Address pointer is 16 bit. */
> > > @@ -67,6 +68,12 @@
> > >   * which won't work on pure SMBus systems.
> > >   */
> > >
> > > +static const char * const at24_supply_names[] =3D {
> > > +       "vcc", "i2c",
> > > +};
> > > +
> > > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > > +
> > >  struct at24_client {
> > >         struct i2c_client *client;
> > >         struct regmap *regmap;
> > > @@ -91,6 +98,7 @@ struct at24_data {
> > >
> > >         struct gpio_desc *wp_gpio;
> > >
> > > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> > >         /*
> > >          * Some chips tie up multiple I2C addresses; dummy devices re=
serve
> > >          * them for us, and we'll use them with SMBus calls.
> > > @@ -662,6 +670,11 @@ static int at24_probe(struct i2c_client *client)
> > >         at24->client[0].client =3D client;
> > >         at24->client[0].regmap =3D regmap;
> > >
> > > +       regulator_bulk_set_supply_names(at24->supplies,
> > > +                                       at24_supply_names, AT24_NUM_S=
UPPLIES);
> > > +       devm_regulator_bulk_get(&at24->client[0].client->dev,
> > > +                               AT24_NUM_SUPPLIES, at24->supplies);
> >
> > You still need to check the return value here - this call can still
> > fail for many reasons.
>
> I think we can easily check if return value < 0, rigth?
>

Check the documentation for this function. I'd guess it's a negative errno,=
 yes.

Bart

>
> > > +
> > >         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OU=
T_HIGH);
> > >         if (IS_ERR(at24->wp_gpio))
> > >                 return PTR_ERR(at24->wp_gpio);
> > > @@ -701,6 +714,12 @@ static int at24_probe(struct i2c_client *client)
> > >
> > >         i2c_set_clientdata(client, at24);
> > >
> > > +       err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->suppli=
es);
> > > +       if (err) {
> > > +               dev_err(dev, "Failed to enable power regulators\n");
> > > +               return err;
> > > +       }
> > > +
> > >         /* enable runtime pm */
> > >         pm_runtime_set_active(dev);
> > >         pm_runtime_enable(dev);
> > > @@ -713,6 +732,8 @@ static int at24_probe(struct i2c_client *client)
> > >         pm_runtime_idle(dev);
> > >         if (err) {
> > >                 pm_runtime_disable(dev);
> > > +               regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > > +                                      at24->supplies);
> > >                 return -ENODEV;
> > >         }
> > >
> > > @@ -725,15 +746,44 @@ static int at24_probe(struct i2c_client *client=
)
> > >
> > >  static int at24_remove(struct i2c_client *client)
> > >  {
> > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > +
> > >         pm_runtime_disable(&client->dev);
> > > +       if (pm_runtime_status_suspended(&client->dev))
> > > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->suppl=
ies);
> >
> > So you will now disable the regulators if they're already disabled in
> > at24_suspend() but not disable them if they're not. This is clearly
> > inverted.
> >
> > Bart
>
> oops... I miss inverted, sorry :(
>
> Bibby
>
> >
> > >         pm_runtime_set_suspended(&client->dev);
> > >
> > >         return 0;
> > >  }
> > >
> > > +static int __maybe_unused at24_suspend(struct device *dev)
> > > +{
> > > +       struct i2c_client *client =3D to_i2c_client(dev);
> > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > +
> > > +       return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > > +                                     at24->supplies);
> > > +}
> > > +
> > > +static int __maybe_unused at24_resume(struct device *dev)
> > > +{
> > > +       struct i2c_client *client =3D to_i2c_client(dev);
> > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > +
> > > +       return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > > +                                    at24->supplies);
> > > +}
> > > +
> > > +static const struct dev_pm_ops at24_pm_ops =3D {
> > > +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > +                               pm_runtime_force_resume)
> > > +       SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
> > > +};
> > > +
> > >  static struct i2c_driver at24_driver =3D {
> > >         .driver =3D {
> > >                 .name =3D "at24",
> > > +               .pm =3D &at24_pm_ops,
> > >                 .of_match_table =3D at24_of_match,
> > >                 .acpi_match_table =3D ACPI_PTR(at24_acpi_ids),
> > >         },
> > > --
> > > 2.18.0
> > >
>
>
