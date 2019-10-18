Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001A5DC231
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 12:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405125AbfJRKLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 06:11:17 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34418 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387864AbfJRKLR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Oct 2019 06:11:17 -0400
Received: by mail-oi1-f196.google.com with SMTP id 83so4779650oii.1
        for <linux-i2c@vger.kernel.org>; Fri, 18 Oct 2019 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ts2g+644mCUFX+ep3XKd0KCxqw+jeDCVqxn6lISlA1A=;
        b=Kftb0Sll06dr2DyhBa7gV6Fq9w8KSZPPCyogNj6tdpq+D7oli9OnNhGr7GDgFOH3pH
         kiVh/fxwKRGI/aNvD4Hs0G6ZXkhYrrVcK0fPNXOsrt4CxhpYVfnEnxKCd7mPK38ITVo9
         S1NNvRyWuLzh6gR/KKrZ67JM6jDLn0Pq/hhHDVTEkNmA1QtsNgen8/qwT4C80SloCSXZ
         L2g9WQYqw57hVz/JyYWk2YXprdkmrlaKvExObSW3IPS/zo4/LJjc34QiFXGkodYcT4y2
         /jI6c2ifjjexouk8rGuHHhrsc+LttnoCL7CEXIspmlumq4gquHNSjO5Cs4bHJ/xbv9cy
         OMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ts2g+644mCUFX+ep3XKd0KCxqw+jeDCVqxn6lISlA1A=;
        b=hDq13wxesI9IyKHUhheZwDK21seF6q4yAV55G9lMUlkMLSXdNbX+DNA/dYwx4LFhky
         sugw0ttnALTv+CC/leMAYAsesrwRuTz1IoFMW6u+6NlxA6qaBC0AJdv6bMAhjXy/pV3M
         +cwf0YG9T8tz1VhR0FKic3i64m68UJwzyY4VLEmsAX9tQUgfzYmxGMqmZ1KGSks1vbjZ
         hAZJioacA4bz4nIYG3ZywCirDVGS6OMNO+5PEO0eW5YdIhgQ3VUq7658g9Qtb/yU/ngu
         LFeX1rxmZuHyI8GyGXy2UtDuX5IyUwftszfq5U2GVqT3PFzx/9SvKeV5gd+vBtLSlYJz
         T7Aw==
X-Gm-Message-State: APjAAAWvlpsAoGqMgNk+Esm7AVf0K0dF8XDw7CQDa2YQBattIxnDL1VU
        WwYzvjJ8knAMciyRFYs4LJA9Kyy1KDpaZ+IHSPC2PQ==
X-Google-Smtp-Source: APXvYqyPqxy7enpG5/6yOqJDA/XF9nzGacPa1CGheBM3Z0AZcX2LrttAXRrjrLyu0q4t85n56ukgm60dT9UEoqxwNvI=
X-Received: by 2002:aca:4584:: with SMTP id s126mr7353754oia.21.1571393475825;
 Fri, 18 Oct 2019 03:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <CAAFQd5DuETr-N8efWYz7F-qrw1R-gL6fss2Ag1XezapojiakhQ@mail.gmail.com>
In-Reply-To: <CAAFQd5DuETr-N8efWYz7F-qrw1R-gL6fss2Ag1XezapojiakhQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 18 Oct 2019 12:11:04 +0200
Message-ID: <CAMpxmJURrp+Vd23+b7FHzn4CP81SLLg37xADa8AV9MPXaRXK_A@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
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

pt., 18 pa=C5=BA 2019 o 11:25 Tomasz Figa <tfiga@chromium.org> napisa=C5=82=
(a):
>
> Hi Bibby,
>
> On Fri, Oct 18, 2019 at 5:26 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wr=
ote:
> >
> > Although in the most platforms, the power of eeprom and i2c
> > are alway on, some platforms disable the eeprom and i2c power
> > in order to meet low power request.
> > This patch add the pm_runtime ops to control power to support
> > all platforms.
> >
> > Changes since v3:
> >  - remove redundant calling function
> >  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
> >  - change supply name
> >
> > Changes since v2:
> >  - rebase onto v5.4-rc1
> >  - pm_runtime_disable and regulator_bulk_disable at
> >    err return in probe function
> >
> > Changes since v1:
> >  - remove redundant code
> >  - fixup coding style
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 2cccd82a3106..68ced4f25916 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/nvmem-provider.h>
> >  #include <linux/regmap.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/gpio/consumer.h>
> >
> >  /* Address pointer is 16 bit. */
> > @@ -67,6 +68,12 @@
> >   * which won't work on pure SMBus systems.
> >   */
> >
> > +static const char * const at24_supply_names[] =3D {
> > +       "vcc", "i2c",
> > +};
> > +
> > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > +
> >  struct at24_client {
> >         struct i2c_client *client;
> >         struct regmap *regmap;
> > @@ -91,6 +98,8 @@ struct at24_data {
> >
> >         struct gpio_desc *wp_gpio;
> >
> > +       bool has_supplies;
> > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> >         /*
> >          * Some chips tie up multiple I2C addresses; dummy devices rese=
rve
> >          * them for us, and we'll use them with SMBus calls.
> > @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
> >         at24->client[0].client =3D client;
> >         at24->client[0].regmap =3D regmap;
> >
> > +       regulator_bulk_set_supply_names(at24->supplies,
> > +                                       at24_supply_names, AT24_NUM_SUP=
PLIES);
> > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev,
> > +                                      AT24_NUM_SUPPLIES, at24->supplie=
s);
> > +       if (err =3D=3D -ENODEV)
> > +               at24->has_supplies =3D NULL;
>
> has_supplies is a bool, so the right value would be false.
>

Well I admit I did say 'assign NULL to has_supplies' in my previous
review, but I really meant 'false' and it's pretty clear it was by
mistake, or so I thought. :)

Bart

> > +       else if (err =3D=3D 0)
>
> nit: One would typically use !err here as the condition.
>
> > +               at24->has_supplies =3D !err;
>
> In this branch, err is always 0, so !err is always true and we can
> just directly assign true to the field.
>
> > +       else
> > +               return err;
> > +
> >         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_=
HIGH);
> >         if (IS_ERR(at24->wp_gpio))
> >                 return PTR_ERR(at24->wp_gpio);
> > @@ -701,6 +721,14 @@ static int at24_probe(struct i2c_client *client)
> >
> >         i2c_set_clientdata(client, at24);
> >
> > +       if (at24->has_supplies) {
> > +               err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->=
supplies);
> > +               if (err) {
> > +                       dev_err(dev, "Failed to enable power regulators=
\n");
> > +                       return err;
> > +               }
> > +       }
> > +
> >         /* enable runtime pm */
> >         pm_runtime_set_active(dev);
> >         pm_runtime_enable(dev);
> > @@ -713,6 +741,9 @@ static int at24_probe(struct i2c_client *client)
> >         pm_runtime_idle(dev);
> >         if (err) {
> >                 pm_runtime_disable(dev);
> > +               if (at24->has_supplies)
> > +                       regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > +                                              at24->supplies);
> >                 return -ENODEV;
> >         }
> >
> > @@ -725,15 +756,48 @@ static int at24_probe(struct i2c_client *client)
> >
> >  static int at24_remove(struct i2c_client *client)
> >  {
> > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > +
> >         pm_runtime_disable(&client->dev);
> >         pm_runtime_set_suspended(&client->dev);
> > +       if (at24->has_supplies)
> > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplie=
s);
>
> It's a weird behavior, but pm_runtime_disable() doesn't guarantee that
> the device is actually resumed after the call returns. See [1].
> We should move the regulator disable before we call
> pm_runtime_set_suspended() and add !pm_runtime_status_suspended() as
> an additional condition to the if.
>
> By the way, that behavior is actually contradicting other parts of the
> runtime PM core. For example pm_runtime_active() returns true if
> dev->power.disable_depth is non-zero, but as per the above, the device
> could as well be suspended. Rafael, is this expected?
>
> [1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/base/power/r=
untime.c#L1316
>
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused at24_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > +
> > +       if (at24->has_supplies)
> > +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > +                                             at24->supplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused at24_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > +
> > +       if (at24->has_supplies)
> > +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > +                                            at24->supplies);
> >
> >         return 0;
> >  }
> >
> > +static const struct dev_pm_ops at24_pm_ops =3D {
> > +       SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
>
> Do we also need pm_runtime_force_suspend() and
> pm_runtime_force_resume() as system sleep PM ops or it isn't possible
> for the device to be runtime active when entering the system suspend?
>
> Best regards,
> Tomasz
