Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF741615A1
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 16:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgBQPLr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 17 Feb 2020 10:11:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46670 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbgBQPLr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 10:11:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id g64so16342174otb.13;
        Mon, 17 Feb 2020 07:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qYxmdX29YG/UHJJMk5zm+QwT+5Rwjs67+eLlDKSKlyA=;
        b=T7NCFb0JFNodBKg9BIxyfN3Bh8+qs0SUOwJj050pFIg7C3HGwy7gXV7PFL3WQ5OBmW
         6DjqGGihLKPkYMpKtnigEWO+pafBmo8zMZQNgaJ+rePCrtP/iZJPdlpF5Zo3l/Cp4WOV
         3gXqgFhJWOYhlj0kaZEywzSbm7LvXomu3KDUHNVsCsn2UUvH52/tiwVb9rbvcOmra7Te
         9psbnk/KX83xzEW2eur3WTV8fC9AmiQ36tRMEGETXa8UBPOi+0ilmUKoiYEjo8/aYpf+
         QlDVA47TJa8pjEHjEwMThuf0rtmdwy6Hi1THBTl8A7gzVFkF18dEYadpRIcmKJ2bTrLv
         q+6Q==
X-Gm-Message-State: APjAAAVmjlX/dEtnWsiZ430C+NcwpowqUNUhrzr2hwP7qZTIpGgg+WcG
        jez0MIe0jWc4DqSd45MZ93s1pKZo5Osi0rTAp94=
X-Google-Smtp-Source: APXvYqxSZHc5RwRSQVBTkVl6ulYXJeWISH1t7KfDBpAV5RYWaXG9c2NoeJ3If5p7QepcD8irCbCNrQTmrjGoASq3g6o=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr12668875otm.297.1581952306334;
 Mon, 17 Feb 2020 07:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-3-ktouil@baylibre.com>
 <CAMuHMdVv+FRnf6fvjEeu50W5PB-Gh2V8Th1h__vt6guMwk2xNQ@mail.gmail.com> <CAMRc=Mf0-gQJH8Se4sFBCkRNE=b4ww=SWges-7GPD2jsivrv1Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf0-gQJH8Se4sFBCkRNE=b4ww=SWges-7GPD2jsivrv1Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Feb 2020 16:11:35 +0100
Message-ID: <CAMuHMdWrJ9LmDqBQYvNVs7yY78Po0sTGc=MUu9+tau2frJ9Ytw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] nvmem: add support for the write-protect pin
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Mon, Feb 17, 2020 at 3:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> czw., 30 sty 2020 o 09:06 Geert Uytterhoeven <geert@linux-m68k.org> napisał(a):
> > On Tue, Jan 7, 2020 at 10:30 AM Khouloud Touil <ktouil@baylibre.com> wrote:
> > > The write-protect pin handling looks like a standard property that
> > > could benefit other users if available in the core nvmem framework.
> > >
> > > Instead of modifying all the memory drivers to check this pin, make
> > > the NVMEM subsystem check if the write-protect GPIO being passed
> > > through the nvmem_config or defined in the device tree and pull it
> > > low whenever writing to the memory.
> > >
> > > There was a suggestion for introducing the gpiodesc from pdata, but
> > > as pdata is already removed it could be replaced by adding it to
> > > nvmem_config.
> > >
> > > Reference: https://lists.96boards.org/pipermail/dev/2018-August/001056.html
> > >
> > > Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/nvmem/core.c
> > > +++ b/drivers/nvmem/core.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/nvmem-consumer.h>
> > >  #include <linux/nvmem-provider.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/of.h>
> > >  #include <linux/slab.h>
> > >  #include "nvmem.h"
> > > @@ -54,8 +55,14 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
> > >  static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
> > >                            void *val, size_t bytes)
> > >  {
> > > -       if (nvmem->reg_write)
> > > -               return nvmem->reg_write(nvmem->priv, offset, val, bytes);
> > > +       int ret;
> > > +
> > > +       if (nvmem->reg_write) {
> > > +               gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> > > +               ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
> > > +               gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> > > +               return ret;
> > > +       }
> > >
> > >         return -EINVAL;
> > >  }
> > > @@ -338,6 +345,14 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
> > >                 kfree(nvmem);
> > >                 return ERR_PTR(rval);
> > >         }
> > > +       if (config->wp_gpio)
> > > +               nvmem->wp_gpio = config->wp_gpio;
> > > +       else
> > > +               nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
> > > +                                                   GPIOD_OUT_HIGH);
> >
> > Shouldn't this GPIO be released in nvmem_release(), by calling gpiod_put()?
> >
>
> Hi Geert,
>
> Khouloud already sent out a patch but I think it still doesn't fix all
> the problems.
>
> While we should call gpiod_put() for the descs we request - we must
> not do it for the desc we get over the config structure. Unless... we

That's true.

> make descs reference counted with kref and add gpiod_ref() helper.
> That way we could increase the reference counter in the upper branch
> of the if and not do it in the lower. Calling gpiod_put() would
> internally call kref_put(). Does it make sense? I think that a
> function that's called gpiod_put() but doesn't really use reference
> counting is misleading anyway.

Yep.

> > Once that's implemented, I assume it will be auto-released on registration
> > failure by the call to put_device()?
>
> No, I think this is another leak - why would put_device() lead to
> freeing any resources? Am I missing something?

Sorry, I don't remember why I wrote that part...

Anyway, requested GPIOs should be released on failure, and on
unregistration.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
