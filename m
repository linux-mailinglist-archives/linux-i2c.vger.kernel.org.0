Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D36A50F9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 10:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbfIBIL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 04:11:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41513 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbfIBIL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 04:11:27 -0400
Received: by mail-oi1-f194.google.com with SMTP id h4so6424059oih.8
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 01:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NINmlfAgfxOxAV7yiGyIexpUFXL2RdTK/kyjDdildmk=;
        b=NM5b7r2r2g/242pW0+qvqwUbSDDplMaJNnqcP9FFGel2mr8rvq9ukTtSlEhX1Ex1Mw
         CWSKJk+0kkMqVPd9dsnBaJ/aONbVfTlptlBZW9Dl3nizOfYnLx1kwSiLrdVtI0/0BHXJ
         JaqOHM9lW6cL6maM0VZqVn7MXAxvPiL9J3tozHrLtheqWuHrqhJhm0qYtYQQHZxOy+Gt
         yW4E9FCDYip5ZdqM6Kzn8dWCIQDCQ1FzxvxRDI+SF2JbdNzIqyGtWce8gqJRMUiWdg5Q
         Rv+efchiXjIVlHkIS1YEX7QnX7bzP3K5NXe6aXuEP6tY2vPy4MnPUnEgKCEhz8+U3dd6
         UR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NINmlfAgfxOxAV7yiGyIexpUFXL2RdTK/kyjDdildmk=;
        b=R6EBJ/Xz+WFy2B2243xgRRitVSn1VORzPI5lLHjRNJqlCB3Fo/neZJ8unOJty/mV/N
         S89tumTe8eC3zL75fsSEL+5U9zShm3F/DCNhFv8YisWzQ2LTuSBBP7HbzvZR/JLzwnRH
         27Ybrl3Rs2fluZ8aB6E/wxL+nrAjD+kx4nDQz3pB/LFHwTBJ0Bjvf8VWkoqA+ZaT0PLf
         ceiGN9eixje6keprSC+F/evwy33qgnpHU/I6NAO6cs7AzY26+2IODULQZnO1CwLTrVpN
         S6JSgosC78cyQOaZqQmYXWkpW0vEtfFeP85ufOH8Y33mW75BL01jArqD/MpjfprsspcO
         4IwQ==
X-Gm-Message-State: APjAAAXZXhQCZSNCw/Iy/DlSL2EjJhDoUaDp7uyjjBVjGz8FBsckujGJ
        OwcuzJMVxhT7JEKTQU4j39gAxgpuJ4COwk4KYXp7nA==
X-Google-Smtp-Source: APXvYqwIt24+sQ1U4htLzGuciutk0vQkbvSck1CM+ADO1Q1qdAsqgtUXzI9dDrYQAjZPxLQppOovDonpGqAcfIqjdNE=
X-Received: by 2002:aca:4406:: with SMTP id r6mr6886616oia.175.1567411886093;
 Mon, 02 Sep 2019 01:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUYX6AuNedON5queZLNy__uw0h3ae1TWXtOudFPk6EASA@mail.gmail.com> <1567410147.32008.1.camel@mtksdaap41>
In-Reply-To: <1567410147.32008.1.camel@mtksdaap41>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Sep 2019 10:11:15 +0200
Message-ID: <CAMpxmJXeWxB4vYdZxWf60Hi2a9RQi30KkLOaKn6W_0PtvPDqMg@mail.gmail.com>
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

pon., 2 wrz 2019 o 09:42 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> On Mon, 2019-09-02 at 09:23 +0200, Bartosz Golaszewski wrote:
> > pon., 2 wrz 2019 o 05:32 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=
=C5=82(a):
> > >
> > > Although in the most platforms, the power of eeprom and i2c
> > > are alway on, some platforms disable the eeprom and i2c power
> > > in order to meet low power request.
> > > This patch add the pm_runtime ops to control power to support
> > > all platforms.
> > >
> > > Changes since v1:
> > >  - remove redundant code
> > >  - fixup coding style
> > >
> >
> > The subject tag should be v2. Patches start at (implicit) version 1.
> > It's even more confusing since you're saying "Changes since v1" here
> > but the subject says v1 too.
> >
> Ok, I will fix up it and resent version 2.
>

Please do it after v5.4-rc1 is tagged though.

Bart

> > The patch now looks good, but it's too late in the release cycle for
> > this kind of change. I'd like it to spend some time in next, so I'll
> > pick it up after the v5.4 merge window.
> >
> It's OK, thanks.
>
> > Bart
> >
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > ---
> > >  drivers/misc/eeprom/at24.c | 59 ++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 58 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > > index 35bf2477693d..ce17e82eedca 100644
> > > --- a/drivers/misc/eeprom/at24.c
> > > +++ b/drivers/misc/eeprom/at24.c
> > > @@ -23,6 +23,7 @@
> > >  #include <linux/nvmem-provider.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <linux/gpio/consumer.h>
> > >
> > >  /* Address pointer is 16 bit. */
> > > @@ -68,6 +69,12 @@
> > >   * which won't work on pure SMBus systems.
> > >   */
> > >
> > > +static const char * const at24_supply_names[] =3D {
> > > +       "power", "i2c",
> > > +};
> > > +
> > > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > > +
> > >  struct at24_client {
> > >         struct i2c_client *client;
> > >         struct regmap *regmap;
> > > @@ -92,6 +99,8 @@ struct at24_data {
> > >
> > >         struct gpio_desc *wp_gpio;
> > >
> > > +       bool has_supplies;
> > > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> > >         /*
> > >          * Some chips tie up multiple I2C addresses; dummy devices re=
serve
> > >          * them for us, and we'll use them with SMBus calls.
> > > @@ -663,6 +672,15 @@ static int at24_probe(struct i2c_client *client)
> > >         at24->client[0].client =3D client;
> > >         at24->client[0].regmap =3D regmap;
> > >
> > > +       for (i =3D 0; i < AT24_NUM_SUPPLIES; i++)
> > > +               at24->supplies[i].supply =3D at24_supply_names[i];
> > > +
> > > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev=
,
> > > +                                      AT24_NUM_SUPPLIES, at24->suppl=
ies);
> > > +       if (err =3D=3D -EPROBE_DEFER)
> > > +               return err;
> > > +       at24->has_supplies =3D !err;
> > > +
> > >         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OU=
T_HIGH);
> > >         if (IS_ERR(at24->wp_gpio))
> > >                 return PTR_ERR(at24->wp_gpio);
> > > @@ -705,13 +723,21 @@ static int at24_probe(struct i2c_client *client=
)
> > >         /* enable runtime pm */
> > >         pm_runtime_set_active(dev);
> > >         pm_runtime_enable(dev);
> > > +       pm_runtime_get_sync(dev);
> > > +       if (at24->has_supplies) {
> > > +               err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, at24=
->supplies);
> > > +               if (err) {
> > > +                       dev_err(dev, "Failed to enable power regulato=
rs\n");
> > > +                       return err;
> > > +               }
> > > +       }
> > >
> > >         /*
> > >          * Perform a one-byte test read to verify that the
> > >          * chip is functional.
> > >          */
> > >         err =3D at24_read(at24, 0, &test_byte, 1);
> > > -       pm_runtime_idle(dev);
> > > +       pm_runtime_put(dev);
> > >         if (err) {
> > >                 pm_runtime_disable(dev);
> > >                 return -ENODEV;
> > > @@ -726,15 +752,46 @@ static int at24_probe(struct i2c_client *client=
)
> > >
> > >  static int at24_remove(struct i2c_client *client)
> > >  {
> > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > +
> > >         pm_runtime_disable(&client->dev);
> > >         pm_runtime_set_suspended(&client->dev);
> > > +       if (at24->has_supplies)
> > > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->suppl=
ies);
> > >
> > >         return 0;
> > >  }
> > >
> > > +static int __maybe_unused at24_suspend(struct device *dev)
> > > +{
> > > +       struct i2c_client *client =3D to_i2c_client(dev);
> > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > +
> > > +       if (at24->has_supplies)
> > > +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > > +                                             at24->supplies);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int __maybe_unused at24_resume(struct device *dev)
> > > +{
> > > +       struct i2c_client *client =3D to_i2c_client(dev);
> > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > +
> > > +       if (at24->has_supplies)
> > > +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > > +                                            at24->supplies);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static SIMPLE_DEV_PM_OPS(at24_pm_ops, at24_suspend, at24_resume);
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
