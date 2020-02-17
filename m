Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251241614C8
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 15:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgBQOet (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 09:34:49 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:38982 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgBQOer (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 09:34:47 -0500
Received: by mail-il1-f195.google.com with SMTP id f70so14407889ill.6
        for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2020 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sYSA9gH5D5QpjxpnnA/foVNSE8oIoSs3/0w1wFARKFA=;
        b=WRDJvcS8ymr5ylA0UtB/67GmGZlM/1gESH2KXwDfgkuE/OV3VvkijsWD//rIjkTp+/
         3hqMXipaSN4FEmKuuj8U9V8yMz6PPmOmpjeCQeNX5UlPNQw48w7DBB32NR4fuMQIaR58
         yLrsthNgb1+PE/pnm3Re2Un53IWzQ/T8cZv5A8Ui84o2GB34SysBLLOfKn0OY+pW80PU
         WL8chP1WdNh35DgAPQrvBWSN3dNuk5A8WqAZCvKvZ8z0tpWa+OlfblDJHCDC0KcXZ5Tr
         6cDyMcg+IoFSILBmpeqABcqwPqv/M4fzd9Y2+PT6Ek9gnQBZX0iMVQh5f4dTxL2Fu2kT
         MXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sYSA9gH5D5QpjxpnnA/foVNSE8oIoSs3/0w1wFARKFA=;
        b=m+fSufzsj8xvJ+P1VOo6jhmWld98hfPTDGKEN0HXR10iXhSBuDlcT66t8qtALApRfh
         E7SSALTRlWGworZX5XdN0eynyp7hGoM61rczh4suKPnhsW2cwXiqqGnAQAwpcx2gEGE2
         LGHsmunBiROFn5LSSpJm3gSlB0yK2xC/gEeIMLp+o6UrTMA2qeu2wxdUu+D8iPLGv2q9
         sRB2a4Yqsc+gS32KNiSif0SwOcKbGJHQ4nTU+jigKBIwRe3jRs+EFXxNi6YH4m0CY7i0
         Wmr7CSdhB6O2UU2wa8RLjQxMjGBQlV45L57V0Gcm3TmHGk57uswy4EsyA8BuF46E7S2m
         JSkQ==
X-Gm-Message-State: APjAAAVn6vopFGJEQVFW0EltEtwqN580eqALM5BZpheZGVAorf6IPcWo
        gBIfYlQNrzYepWPG4dqvudDy21ABieAUFC3ihJ9iOw==
X-Google-Smtp-Source: APXvYqzi/1eGUH3va8zyTePwxOHIk4rV1thytDj390MDtFkW1a2+0h5oVnoRFXF3ZcGU+SYhkA3e9JGh2GSzypVxjyU=
X-Received: by 2002:a92:9c1c:: with SMTP id h28mr14256156ili.189.1581950085177;
 Mon, 17 Feb 2020 06:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-3-ktouil@baylibre.com>
 <CAMuHMdVv+FRnf6fvjEeu50W5PB-Gh2V8Th1h__vt6guMwk2xNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVv+FRnf6fvjEeu50W5PB-Gh2V8Th1h__vt6guMwk2xNQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Feb 2020 15:34:34 +0100
Message-ID: <CAMRc=Mf0-gQJH8Se4sFBCkRNE=b4ww=SWges-7GPD2jsivrv1Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] nvmem: add support for the write-protect pin
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Khouloud Touil <ktouil@baylibre.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

czw., 30 sty 2020 o 09:06 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
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

Hi Geert,

Khouloud already sent out a patch but I think it still doesn't fix all
the problems.

While we should call gpiod_put() for the descs we request - we must
not do it for the desc we get over the config structure. Unless... we
make descs reference counted with kref and add gpiod_ref() helper.
That way we could increase the reference counter in the upper branch
of the if and not do it in the lower. Calling gpiod_put() would
internally call kref_put(). Does it make sense? I think that a
function that's called gpiod_put() but doesn't really use reference
counting is misleading anyway.

> Once that's implemented, I assume it will be auto-released on registratio=
n
> failure by the call to put_device()?

No, I think this is another leak - why would put_device() lead to
freeing any resources? Am I missing something?

Bart
