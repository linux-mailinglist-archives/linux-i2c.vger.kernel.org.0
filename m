Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 887B01612E8
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgBQNPM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:15:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38045 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729041AbgBQNPM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:15:12 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so19670796wrh.5
        for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2020 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=drss39w0znhLtWEMxoMFTDQiwBKNc2/yMB0OGM4BPBE=;
        b=tlefjaaWWdG9709HEt7hX/znNS9f06BoJtUQMXV+DvbSFVfB9w0VsPTQpTO9AkwusO
         cYgCC65QPxMSAqE/OCeShx1oAnszOJahFgalVSPTikQ3Ok5bVK591WZhjh8R1hHIQExC
         vJvdziJ++yrH36+IKbWPkzjPHSZ/xbhFPKm+LHfvh+5jiBMl2uDFX19Fc94DPKyq5Ecf
         FqcTmjbQ+CSQPOJ46p3qQqbQ23NRsxCr87FMK26Rsvvsnr5GEoMOt4GzzBQeEzfcIqAh
         ZYpQ/ubRB8szSuib819Udar6gAP5TmqJdWOHqmYljkFJ1c6VeHXxAaRZsB+oIh9D9IFe
         /PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=drss39w0znhLtWEMxoMFTDQiwBKNc2/yMB0OGM4BPBE=;
        b=q/opshDtuyw4hoKmpVH1/VDDOUd1XS2vhCaXOdy0G+veUR+uqKGPDjh19epg1LJKUF
         3SmJ6uMTy+3ShI2nPK/EbMsBPv6G7zO4bJGE5fCF1rQlABIOeilZApW3iAfvOP+G4HPz
         ifrJIuZfE6xPT9yQ3R9DTKHcL0xlbuu6jNAVTiAaT6PKkWnM9fROFphcRtWS8ysIpU4v
         8Rk7R0USP+s8HrwDAukEdHlb/7tTkWhuHOlzcKDmDjl0HCO4ub0nGGdCiPirfDLYiPTb
         rMdcBn5/b6Y1Z0epJTQeS4VjOhM9EWyk1IYOhprO4KoibvswKjqSuwTheIzj7+rZkmic
         LoNw==
X-Gm-Message-State: APjAAAXMnwMyl8QoGbMlOlLNmTp8WJDByG2xxbaxyExtiiRdblb95SI+
        To9ASn8sBK56ko0grG2MHbyU/Gj4oNMtXNivoYDNzg==
X-Google-Smtp-Source: APXvYqxej90xsjchpzV4UDgecT0jeLmM99BF9yJ9BtoVfchl2OABBjKypdZ5nHop/NJ9drP294akxGMbMC/cIwVKEJk=
X-Received: by 2002:adf:f401:: with SMTP id g1mr21799460wro.129.1581945310491;
 Mon, 17 Feb 2020 05:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-3-ktouil@baylibre.com>
 <CAMuHMdVv+FRnf6fvjEeu50W5PB-Gh2V8Th1h__vt6guMwk2xNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVv+FRnf6fvjEeu50W5PB-Gh2V8Th1h__vt6guMwk2xNQ@mail.gmail.com>
From:   Khouloud Touil <ktouil@baylibre.com>
Date:   Mon, 17 Feb 2020 14:14:59 +0100
Message-ID: <CALL1Z1z4450depX-X5VC=r3J7fRkTCkFP5re_ULHiS6O1KQ3rA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] nvmem: add support for the write-protect pin
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le jeu. 30 janv. 2020 =C3=A0 09:06, Geert Uytterhoeven
<geert@linux-m68k.org> a =C3=A9crit :
>
> Hi Khouloud,
>
> On Tue, Jan 7, 2020 at 10:30 AM Khouloud Touil <ktouil@baylibre.com> wrot=
e:
> > The write-protect pin handling looks like a standard property that
> > could benefit other users if available in the core nvmem framework.
> >
> > Instead of modifying all the memory drivers to check this pin, make
> > the NVMEM subsystem check if the write-protect GPIO being passed
> > through the nvmem_config or defined in the device tree and pull it
> > low whenever writing to the memory.
> >
> > There was a suggestion for introducing the gpiodesc from pdata, but
> > as pdata is already removed it could be replaced by adding it to
> > nvmem_config.
> >
> > Reference: https://lists.96boards.org/pipermail/dev/2018-August/001056.=
html
> >
> > Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> Thanks for your patch!
>
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/nvmem-consumer.h>
> >  #include <linux/nvmem-provider.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/of.h>
> >  #include <linux/slab.h>
> >  #include "nvmem.h"
> > @@ -54,8 +55,14 @@ static int nvmem_reg_read(struct nvmem_device *nvmem=
, unsigned int offset,
> >  static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int of=
fset,
> >                            void *val, size_t bytes)
> >  {
> > -       if (nvmem->reg_write)
> > -               return nvmem->reg_write(nvmem->priv, offset, val, bytes=
);
> > +       int ret;
> > +
> > +       if (nvmem->reg_write) {
> > +               gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> > +               ret =3D nvmem->reg_write(nvmem->priv, offset, val, byte=
s);
> > +               gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> > +               return ret;
> > +       }
> >
> >         return -EINVAL;
> >  }
> > @@ -338,6 +345,14 @@ struct nvmem_device *nvmem_register(const struct n=
vmem_config *config)
> >                 kfree(nvmem);
> >                 return ERR_PTR(rval);
> >         }
> > +       if (config->wp_gpio)
> > +               nvmem->wp_gpio =3D config->wp_gpio;
> > +       else
> > +               nvmem->wp_gpio =3D gpiod_get_optional(config->dev, "wp"=
,
> > +                                                   GPIOD_OUT_HIGH);
>
> Shouldn't this GPIO be released in nvmem_release(), by calling gpiod_put(=
)?
>
> Once that's implemented, I assume it will be auto-released on registratio=
n
> failure by the call to put_device()?

Hello Geert,

Thanks for your review.
Yes you are right, I will add that

Khouloud,
>
> > +       if (IS_ERR(nvmem->wp_gpio))
> > +               return PTR_ERR(nvmem->wp_gpio);
> > +
> >
> >         kref_init(&nvmem->refcnt);
> >         INIT_LIST_HEAD(&nvmem->cells);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
