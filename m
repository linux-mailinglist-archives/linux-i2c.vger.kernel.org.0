Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173F8DFE3E
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 09:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfJVH1N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 03:27:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44613 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387791AbfJVH1N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Oct 2019 03:27:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id r16so12036878edq.11
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2019 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MFBdspS+xXFxCKlkyDP++/fjuIK+Mo0RkCyzgsveOkc=;
        b=QiMI6e1JKV7CbDfGfSqJ4kgFGr4RhfoKQAuFhznIHBVkvsJj8D0I1mO6uvXGwdldfN
         2d6dVyNIhVDBZIf3NVyImcj3owO2CE5hAG7ksGLI7NI3BC9oopz35zMz9SUo9xeNFruZ
         JWnc01pWW1i7L8vBkC7ifwbmt2gRAui8ghU+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MFBdspS+xXFxCKlkyDP++/fjuIK+Mo0RkCyzgsveOkc=;
        b=gB7x5wFuRMNZI7GZC7M5Ims2eMsElnpKOxAZMgA3qxhOEgRFvG3IN79neRamA/Q+Y+
         m8MXD8b0spciDNwEEum9wKUNj/3iKnQtLLqa7uF1C3njREr+5uNJmm0AGedYrBmtrH1p
         ApJ74ee8CIfBt1GGrM9mw2ua7nGWOEOO8p47vdXECvG1uMjBCIsoQGwbcCmRmh7d1Fpe
         jbZDAspQfwU4PvSwYGUfp585Os44c62xKpH5c8mafy5WACT2CF6TxxxkzypcCIzSqOHn
         ouAxr+PV8O2RTha27ywRTZt/Cij1/4Qsl8wMC3MNWItPB4/lBcQ4WifP7vEOExlG1bw7
         GZ9w==
X-Gm-Message-State: APjAAAU5Fvz7TeCpqQh3mMmvtcSMVZqabCOzfVgW3MXZO2DRD3dCaAai
        JKIlsK4Skp3Tlte9WYpGQrhBrhTJVfvTBA==
X-Google-Smtp-Source: APXvYqzEGKYfFwMEFBdhII8mlW3a+mY4AOxjhzh+UB8H7UvMWeTRtZUVoSzOZxKCks9ur7kxt8Ibsg==
X-Received: by 2002:aa7:d8c6:: with SMTP id k6mr29507123eds.87.1571729228868;
        Tue, 22 Oct 2019 00:27:08 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id p88sm393102edd.22.2019.10.22.00.27.07
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:27:08 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id q13so11762866wrs.12
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2019 00:27:07 -0700 (PDT)
X-Received: by 2002:a5d:4491:: with SMTP id j17mr1985919wrq.46.1571729226926;
 Tue, 22 Oct 2019 00:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
In-Reply-To: <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 22 Oct 2019 16:26:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
Message-ID: <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
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

On Tue, Oct 22, 2019 at 1:53 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napi=
sa=C5=82(a):
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
> I just gave this a spin and noticed that this will never happen - the
> regulator core will use a dummy regulator if none is defined in DT.
> The only way for this to make sense would be to use
> regulator_get_optional() for each supply separately. But actually I
> think we should just leave it this way and remove this if. In the end:
> this chip needs some power supply, so dummy regulator makes sense.

Thanks for testing. I'd still like to make sure what happens on non-DT
platforms.

I can see that the core returns the dummy regulator if
have_full_constraints() [1]. That is always true for DT systems, but
for others it's false by default, unless someone explicitly calls
regulator_has_full_constraints() [2].

[1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/core=
.c#L1787
[2] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/core=
.c#L120

Best regards,
Tomasz
