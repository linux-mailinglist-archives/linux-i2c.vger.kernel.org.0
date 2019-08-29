Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0031A0F4D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 03:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfH2B4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 21:56:49 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34414 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfH2B4t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Aug 2019 21:56:49 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so2205489edb.1
        for <linux-i2c@vger.kernel.org>; Wed, 28 Aug 2019 18:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E9L+VbhX2QEUGIJqVxtfVyKeDZ9TjqLRU80BCN+eSYw=;
        b=MFNz0Yf9GVlVqy/VxnWRB17tbfG5MfaWmjYopA4pUsTh/1C9S/uEaM2nM3fqMqxgdb
         GrPYKaVqhf+LUB5omGLFs1busDzhvw3EZANhIoI196PzYI8C3szvnU4lkB69+Od5E6M0
         F8nEceZGJMD3/MioDKbp35+i65Hgwk4U0HAKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E9L+VbhX2QEUGIJqVxtfVyKeDZ9TjqLRU80BCN+eSYw=;
        b=GiCkHwRA5nVohKtOOdaa0Iz2IIX1TxSAqdVwd3meTHyCvPPT5rtJFtfahtPP4PX7JD
         mxAeTFQVol2wK4AAUPZjEn1/HEroT47YW7rxgag3f6FJDF7NOIDkEF6S0Zpr/y2xrdOl
         A7x8rFmkiFwBR5YxHdIn3h7CON72DY/9TCyWhJ1rcpTwdfok7YYLpO9yfAQB5lbEmZo2
         UC+1l7kk90kyBCB18SxLFDYbbjlak46fuoKfplQjUR+l3EOcPVFGUmlbev4Mv1pR7k+p
         w8gv+pYD9j9PX17ukhAqdiTlwlDTk81cgtqCcYjQqWX1CMhGsAIG/lFcPCI436g4kdLf
         ++3w==
X-Gm-Message-State: APjAAAXMUFBR8zGf9dXlK1ZUSnW49N77q/1NmgO4NuoCN/drlzNIt/1l
        fEHySIE519L18BM3SGWbDvEs8bNdO+ZBoA==
X-Google-Smtp-Source: APXvYqzMaowrnC90eEdwdZW0GUffRdncO5QMxpZQOvHYwgliKwgkLr8/Oz9cHsCGGFDsozvhcIJ0zQ==
X-Received: by 2002:a17:906:797:: with SMTP id l23mr5899364ejc.228.1567043807215;
        Wed, 28 Aug 2019 18:56:47 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id d20sm150342ejb.75.2019.08.28.18.56.46
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2019 18:56:46 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id t9so2016978wmi.5
        for <linux-i2c@vger.kernel.org>; Wed, 28 Aug 2019 18:56:46 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr8469011wml.64.1567043805845;
 Wed, 28 Aug 2019 18:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190827012015.10440-1-bibby.hsieh@mediatek.com>
 <CAMpxmJV1LDSYtBQK2pYPwCnhSwQ825rjFsYxiYXwn+Qbhfg=TA@mail.gmail.com> <1567043490.26216.1.camel@mtksdaap41>
In-Reply-To: <1567043490.26216.1.camel@mtksdaap41>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 29 Aug 2019 10:56:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AHqGK2XXYiN6mTt8MeGPjYebpQQ2Zan-nSHCYTqUY1dw@mail.gmail.com>
Message-ID: <CAAFQd5AHqGK2XXYiN6mTt8MeGPjYebpQQ2Zan-nSHCYTqUY1dw@mail.gmail.com>
Subject: Re: [PATCH v0 1/1] WIP: misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bibby,

On Thu, Aug 29, 2019 at 10:51 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wro=
te:
>
> On Wed, 2019-08-28 at 12:53 +0200, Bartosz Golaszewski wrote:
> > wt., 27 sie 2019 o 03:20 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=
=C5=82(a):
> > >
> > > Although in the most platforms, the power of eeprom and i2c
> > > are alway on, some platforms disable the eeprom and i2c power
> > > in order to meet low power request.
> > > This patch add the pm_runtime ops to control power to support
> > > all platforms.
> > >
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> >
> > Why do you mark it as work-in-progress? Is it supposed to be reviewed?
> >
> Sorry about that I forget to remove it.
> Did you mind review this patch at first? I will remove "WIP" tag in next
> version. Thanks.

Would you be able to resend the patch without the WiP and v0 prefix?
Otherwise some people may end up ignoring it. Thanks.

Best regards,
Tomasz

>
> Bibby
> > Bart
> >
> > > ---
> > >  drivers/misc/eeprom/at24.c | 61 ++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 60 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > > index 35bf2477693d..2843e4b4aacd 100644
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
> > > @@ -663,6 +672,17 @@ static int at24_probe(struct i2c_client *client)
> > >         at24->client[0].client =3D client;
> > >         at24->client[0].regmap =3D regmap;
> > >
> > > +       for (i =3D 0; i < AT24_NUM_SUPPLIES; i++)
> > > +               at24->supplies[i].supply =3D at24_supply_names[i];
> > > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev=
,
> > > +                                      AT24_NUM_SUPPLIES,
> > > +                                      at24->supplies);
> > > +       if (err =3D=3D -EPROBE_DEFER) {
> > > +               dev_err(dev, "Failed to get power regulators\n");
> > > +               return err;
> > > +       }
> > > +       at24->has_supplies =3D !err ? true : false;
> > > +
> > >         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OU=
T_HIGH);
> > >         if (IS_ERR(at24->wp_gpio))
> > >                 return PTR_ERR(at24->wp_gpio);
> > > @@ -705,13 +725,21 @@ static int at24_probe(struct i2c_client *client=
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
> > > @@ -726,15 +754,46 @@ static int at24_probe(struct i2c_client *client=
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
