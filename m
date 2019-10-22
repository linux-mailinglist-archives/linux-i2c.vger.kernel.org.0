Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67EF9E0032
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 11:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388208AbfJVJAw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 05:00:52 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36981 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388197AbfJVJAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Oct 2019 05:00:52 -0400
Received: by mail-ot1-f65.google.com with SMTP id 53so1901725otv.4
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2019 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SmTLxbn2kKefvgWPjhHzSbawevdf2jyzIFbZjdoYSRg=;
        b=NPdYdKUERvhHHpDIQDQ10hQSaorrKLuN5YWANO4U0/NWqkNM3RjRbsf5GGEb3gvNzo
         SsBGswPQXsfJL7nd5ujenDOTDw0zdF+Kk0QwWM8UbJfOHwZI0y9ZifHWOwLHq+p9r7fB
         hzKYVu6sXLuzyRDgomv1eIJmmxo4mr1LOksIbFOOonnTIwEzJ9grpSnjBIpRmGZL/zQs
         tZs1Hnsw0ZsXBUiFaXlP1kNPmusiHa4QUHGR+T/AHPgKLnGBW+FoqlD1UVhoUym4Zb9e
         Pxd766NKKd6autGVDbbVPsgfsg6oCYes9BcqDIUtJyDfutunx/4MWUd5hMYp0ReYEaSf
         QwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SmTLxbn2kKefvgWPjhHzSbawevdf2jyzIFbZjdoYSRg=;
        b=gc44mdw9vymxFd1AsiLsKDBnTFpTJs8Y5+jCHC3SWjpDc+QhGcmTX3H0mtuC4xD/7L
         lQpDCmgWPyxcqnR8Lxa+v6bO0/x9Im8YZuWHzmjoNaMyi2XmFXTlEFwnQ5mS1hHestoA
         Igtl8/fXtrzu6VLeaQOxweD4rm45oRnrx5N2kgWjdVKfZrKFDhjaKAc1ciV/fcPPw+CM
         itWeMVDBHILjvSsIObuWz4fWBMByTlwpP7Ba9H+MgewBCEA7WCPbVZF/Bomq8Wzt8uH9
         b8JyAVNLpeIBkCVOP1lPpzbs4QWFSnEGQRWKMXnrTGPQSPambeQzGxpAA31uKbYsaiq8
         FZzg==
X-Gm-Message-State: APjAAAVGOPpuLkQbqqFRYJc9BFPK9N0BwmkHahmoKNUSiTjZnA2e0mcK
        1RWLXZxy+jlhxLdzY8QUsuYyOMAD2iuOOuG5zFazhQ==
X-Google-Smtp-Source: APXvYqxK70rUBBV0XfA7M24a/ljeTChWrfW93JCYkDOciFIXXAsfdw2GaOUcpIuroku/WN8Nq46exL0BMTqFo/Kd158=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr1811694otr.194.1571734850788;
 Tue, 22 Oct 2019 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com> <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
In-Reply-To: <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Oct 2019 11:00:39 +0200
Message-ID: <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Tomasz Figa <tfiga@chromium.org>
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

wt., 22 pa=C5=BA 2019 o 09:27 Tomasz Figa <tfiga@chromium.org> napisa=C5=82=
(a):
>
> On Tue, Oct 22, 2019 at 1:53 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> na=
pisa=C5=82(a):
> > >
> > > Although in the most platforms, the power of eeprom and i2c
> > > are alway on, some platforms disable the eeprom and i2c power
> > > in order to meet low power request.
> > > This patch add the pm_runtime ops to control power to support
> > > all platforms.
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
> > >  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 64 insertions(+)
> > >
> > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > > index 2cccd82a3106..68ced4f25916 100644
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
> > > @@ -91,6 +98,8 @@ struct at24_data {
> > >
> > >         struct gpio_desc *wp_gpio;
> > >
> > > +       bool has_supplies;
> > > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> > >         /*
> > >          * Some chips tie up multiple I2C addresses; dummy devices re=
serve
> > >          * them for us, and we'll use them with SMBus calls.
> > > @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
> > >         at24->client[0].client =3D client;
> > >         at24->client[0].regmap =3D regmap;
> > >
> > > +       regulator_bulk_set_supply_names(at24->supplies,
> > > +                                       at24_supply_names, AT24_NUM_S=
UPPLIES);
> > > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev=
,
> > > +                                      AT24_NUM_SUPPLIES, at24->suppl=
ies);
> > > +       if (err =3D=3D -ENODEV)
> > > +               at24->has_supplies =3D NULL;
> >
> > I just gave this a spin and noticed that this will never happen - the
> > regulator core will use a dummy regulator if none is defined in DT.
> > The only way for this to make sense would be to use
> > regulator_get_optional() for each supply separately. But actually I
> > think we should just leave it this way and remove this if. In the end:
> > this chip needs some power supply, so dummy regulator makes sense.
>
> Thanks for testing. I'd still like to make sure what happens on non-DT
> platforms.
>
> I can see that the core returns the dummy regulator if
> have_full_constraints() [1]. That is always true for DT systems, but
> for others it's false by default, unless someone explicitly calls
> regulator_has_full_constraints() [2].
>

Not tested yet, but from the code it looks like it will then keep
returning EPROBE_DEFER which doesn't sound right really, especially
since we're printing an error message too. Shouldn't it be -ENODEV?

Bart

> [1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/co=
re.c#L1787
> [2] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/co=
re.c#L120
>
> Best regards,
> Tomasz
