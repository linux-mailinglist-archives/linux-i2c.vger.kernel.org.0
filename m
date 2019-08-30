Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 550E5A3148
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 09:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbfH3Hlb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 03:41:31 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44665 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfH3Hl3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Aug 2019 03:41:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id k22so4625137oiw.11
        for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2019 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UR6izvzMD5yVjOvM67+YEo5wEfdIff4GH64U1eoNnlQ=;
        b=hn3s9hpg7dg44iCJyvv4na6BBA+8CHg7JoZR/p3wo7qZHinazx3aDZQx20kXJzoZJr
         GJn0KtYA02InPTLGCKL083AOvHvAwGwIeu9bHQyBJurynCWDaPHQGkm2Fv84G7b9YgJC
         QkWuxdKS82i2JrhTGLNgFhpwOUEx9p/ilWQqGkjq2A34eevoIK89J6FQJp6mCRmR21Ea
         hlX+QIuqSAOLUBB4F3Ht7tu4c4X9hDF+PEbf6QGda1W4qo/p3Ix0YTUxqIxlQQHs9IJI
         i9gyifV1EeymY1IjG0iNXTkixQywtGlTUXxL/cYhaDa1bAfe0EBN8kT2IV660BRTEtKv
         iO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UR6izvzMD5yVjOvM67+YEo5wEfdIff4GH64U1eoNnlQ=;
        b=r5iLFcbpFMMG2bXUOMKKeLSZ/7xEoqp6QA/e0fmVUcGlBkRRnraFN2gDVrFdp+bedA
         7v1ARvELtiV39zcx8Gwgp7esr0yi+0hx/CUEfoCS2YSi/vsH+8tX65M6pKdKQoaulgaK
         RGLqln+Z4Al8KRisgDr03GjM92r2Vc3+iw9LeZDbS/TM27y2m2a6CQZ1BRmlUdNrBcnk
         YO73CM5wgKt1Do+C8XJoy1qUAHeyIpjoXxKgaboXhcwzET74VEhSl3qn9/sRFSg9Q7ui
         ppdUCGhEBOcyakbE6aiJT5f2xwpr2IhlSlMiXUWTLtBmYVPhrEewgfaoJzcmURlcTZTI
         YrNQ==
X-Gm-Message-State: APjAAAWvKa/04Vz6fGIcFoOxnbYw4j1E3Z92GUtzY7Rok9/tiIPKvhXW
        Fod5ZVeFKawsm/Byj7LQRlfEz0hDNffZRrT+dP3WxQ==
X-Google-Smtp-Source: APXvYqy20tkndBxyA7ugsT3oLPuo/cIHFiMRPG8DIzXup7A7TsaI/Y4G23xTk65201HI78wapODnHFvgfT1kkStS3v0=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr741495oih.170.1567150888341;
 Fri, 30 Aug 2019 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190827012015.10440-1-bibby.hsieh@mediatek.com>
 <CAMpxmJV1LDSYtBQK2pYPwCnhSwQ825rjFsYxiYXwn+Qbhfg=TA@mail.gmail.com>
 <1567043490.26216.1.camel@mtksdaap41> <CAAFQd5AHqGK2XXYiN6mTt8MeGPjYebpQQ2Zan-nSHCYTqUY1dw@mail.gmail.com>
 <1567043954.26216.2.camel@mtksdaap41>
In-Reply-To: <1567043954.26216.2.camel@mtksdaap41>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Aug 2019 09:41:17 +0200
Message-ID: <CAMpxmJWHnSgJB-MyPKrEBWPGz8hMELjfBSUvwKXbZW87+W6ybA@mail.gmail.com>
Subject: Re: [PATCH v0 1/1] WIP: misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 29 sie 2019 o 03:59 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> On Thu, 2019-08-29 at 10:56 +0900, Tomasz Figa wrote:
> > Hi Bibby,
> >
> > On Thu, Aug 29, 2019 at 10:51 AM Bibby Hsieh <bibby.hsieh@mediatek.com>=
 wrote:
> > >
> > > On Wed, 2019-08-28 at 12:53 +0200, Bartosz Golaszewski wrote:
> > > > wt., 27 sie 2019 o 03:20 Bibby Hsieh <bibby.hsieh@mediatek.com> nap=
isa=C5=82(a):
> > > > >
> > > > > Although in the most platforms, the power of eeprom and i2c
> > > > > are alway on, some platforms disable the eeprom and i2c power
> > > > > in order to meet low power request.
> > > > > This patch add the pm_runtime ops to control power to support
> > > > > all platforms.
> > > > >
> > > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > >
> > > > Why do you mark it as work-in-progress? Is it supposed to be review=
ed?
> > > >
> > > Sorry about that I forget to remove it.
> > > Did you mind review this patch at first? I will remove "WIP" tag in n=
ext
> > > version. Thanks.
> >
> > Would you be able to resend the patch without the WiP and v0 prefix?
> > Otherwise some people may end up ignoring it. Thanks.
> >
> Ok, got it.
>

FYI: this also causes patchwork to ignore this patch.

I got the resent version - I'll review it shortly.

Bart

> Bibby
> > Best regards,
> > Tomasz
> >
> > >
> > > Bibby
> > > > Bart
> > > >
> > > > > ---
> > > > >  drivers/misc/eeprom/at24.c | 61 ++++++++++++++++++++++++++++++++=
+++++-
> > > > >  1 file changed, 60 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at2=
4.c
> > > > > index 35bf2477693d..2843e4b4aacd 100644
> > > > > --- a/drivers/misc/eeprom/at24.c
> > > > > +++ b/drivers/misc/eeprom/at24.c
> > > > > @@ -23,6 +23,7 @@
> > > > >  #include <linux/nvmem-provider.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > >  #include <linux/gpio/consumer.h>
> > > > >
> > > > >  /* Address pointer is 16 bit. */
> > > > > @@ -68,6 +69,12 @@
> > > > >   * which won't work on pure SMBus systems.
> > > > >   */
> > > > >
> > > > > +static const char * const at24_supply_names[] =3D {
> > > > > +       "power", "i2c",
> > > > > +};
> > > > > +
> > > > > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > > > > +
> > > > >  struct at24_client {
> > > > >         struct i2c_client *client;
> > > > >         struct regmap *regmap;
> > > > > @@ -92,6 +99,8 @@ struct at24_data {
> > > > >
> > > > >         struct gpio_desc *wp_gpio;
> > > > >
> > > > > +       bool has_supplies;
> > > > > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> > > > >         /*
> > > > >          * Some chips tie up multiple I2C addresses; dummy device=
s reserve
> > > > >          * them for us, and we'll use them with SMBus calls.
> > > > > @@ -663,6 +672,17 @@ static int at24_probe(struct i2c_client *cli=
ent)
> > > > >         at24->client[0].client =3D client;
> > > > >         at24->client[0].regmap =3D regmap;
> > > > >
> > > > > +       for (i =3D 0; i < AT24_NUM_SUPPLIES; i++)
> > > > > +               at24->supplies[i].supply =3D at24_supply_names[i]=
;
> > > > > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client-=
>dev,
> > > > > +                                      AT24_NUM_SUPPLIES,
> > > > > +                                      at24->supplies);
> > > > > +       if (err =3D=3D -EPROBE_DEFER) {
> > > > > +               dev_err(dev, "Failed to get power regulators\n");
> > > > > +               return err;
> > > > > +       }
> > > > > +       at24->has_supplies =3D !err ? true : false;
> > > > > +
> > > > >         at24->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIO=
D_OUT_HIGH);
> > > > >         if (IS_ERR(at24->wp_gpio))
> > > > >                 return PTR_ERR(at24->wp_gpio);
> > > > > @@ -705,13 +725,21 @@ static int at24_probe(struct i2c_client *cl=
ient)
> > > > >         /* enable runtime pm */
> > > > >         pm_runtime_set_active(dev);
> > > > >         pm_runtime_enable(dev);
> > > > > +       pm_runtime_get_sync(dev);
> > > > > +       if (at24->has_supplies) {
> > > > > +               err =3D regulator_bulk_enable(AT24_NUM_SUPPLIES, =
at24->supplies);
> > > > > +               if (err) {
> > > > > +                       dev_err(dev, "Failed to enable power regu=
lators\n");
> > > > > +                       return err;
> > > > > +               }
> > > > > +       }
> > > > >
> > > > >         /*
> > > > >          * Perform a one-byte test read to verify that the
> > > > >          * chip is functional.
> > > > >          */
> > > > >         err =3D at24_read(at24, 0, &test_byte, 1);
> > > > > -       pm_runtime_idle(dev);
> > > > > +       pm_runtime_put(dev);
> > > > >         if (err) {
> > > > >                 pm_runtime_disable(dev);
> > > > >                 return -ENODEV;
> > > > > @@ -726,15 +754,46 @@ static int at24_probe(struct i2c_client *cl=
ient)
> > > > >
> > > > >  static int at24_remove(struct i2c_client *client)
> > > > >  {
> > > > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > > > +
> > > > >         pm_runtime_disable(&client->dev);
> > > > >         pm_runtime_set_suspended(&client->dev);
> > > > > +       if (at24->has_supplies)
> > > > > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->s=
upplies);
> > > > >
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +static int __maybe_unused at24_suspend(struct device *dev)
> > > > > +{
> > > > > +       struct i2c_client *client =3D to_i2c_client(dev);
> > > > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > > > +
> > > > > +       if (at24->has_supplies)
> > > > > +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > > > > +                                             at24->supplies);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int __maybe_unused at24_resume(struct device *dev)
> > > > > +{
> > > > > +       struct i2c_client *client =3D to_i2c_client(dev);
> > > > > +       struct at24_data *at24 =3D i2c_get_clientdata(client);
> > > > > +
> > > > > +       if (at24->has_supplies)
> > > > > +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > > > > +                                            at24->supplies);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static SIMPLE_DEV_PM_OPS(at24_pm_ops, at24_suspend, at24_resume)=
;
> > > > > +
> > > > >  static struct i2c_driver at24_driver =3D {
> > > > >         .driver =3D {
> > > > >                 .name =3D "at24",
> > > > > +               .pm =3D &at24_pm_ops,
> > > > >                 .of_match_table =3D at24_of_match,
> > > > >                 .acpi_match_table =3D ACPI_PTR(at24_acpi_ids),
> > > > >         },
> > > > > --
> > > > > 2.18.0
> > > > >
> > >
> > >
>
>
