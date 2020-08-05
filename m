Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8398D23CE35
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 20:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgHESUt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 14:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgHESOo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 14:14:44 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AD1C06174A
        for <linux-i2c@vger.kernel.org>; Wed,  5 Aug 2020 11:14:42 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g19so34835278ioh.8
        for <linux-i2c@vger.kernel.org>; Wed, 05 Aug 2020 11:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w0IXhDxPaIDABQjAbzl0aq6xX3B2TWL/BGPjCg5EAQI=;
        b=fphzMPhyQ2D5ZWF4hklrmLqzUVH0KuSf6rTNU4w0xTT+WGpGiiCSXwekBkCLogcKoJ
         1MdMjK8G45vo789K9a/KzsfCaCQ+xGG6uv0KNBbJZMCgH1K6wHP8pVaXGBeZ0VagkluH
         RbWAeXBeF7eMJh5x7C07X8xm9by4NPtJWvSFd+eskC6GBtAQL1dp10+FvKAjQqZr/wR4
         2nkhFrEQANtG7ifM8jANYvpwik7Af7PhdnHsupLErVI3jiH1XtXZQFhi711JxAZ8CLwB
         tyiAhS/4E+HUeSbagvR3Hbm+RGbA0Q7Qly7om2rt7Yi/Bv+/bhGiCMcwSZtuF4zbBgzJ
         K2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w0IXhDxPaIDABQjAbzl0aq6xX3B2TWL/BGPjCg5EAQI=;
        b=XEm+W/P5Aj+rx88bYEB2IZP9PGt/CF/3RAQdbX2ntaM+HNYrwnv+TWomYSEIOYzUoJ
         w/9NMtRKAAvKq6nHETmZE5D+RIoOOfxM4d0M+2y6MN4924WiWBQKxq27gW7hO0aJ16kH
         ES0mFNvIG78MCmIw3PDUbEg6PllJefDGNhe+51mqQl4i4KkKHiPVyPlEzLopmtyjnWu2
         dHo/9AZYdZIsdev0IkscTjGeFYTH+O8UujbbRrpDU2yVGJiDHJZKI0p3ohQX2byzHYWu
         AMyUsYvrSM1sSOqkpY+nhLQfMIQC38fu+Em/dT+vqsLZYfe7MVmKVEMNVDiWrmNcOH+8
         l/6Q==
X-Gm-Message-State: AOAM532eV0JyufhDnKt8a70wqoVtKouzrjwyMvNYNI20s8t1JftbW5vI
        WNBMMsfWA5gBSJeviRkbcZ5wJplsEQxmO55ePB7M8g==
X-Google-Smtp-Source: ABdhPJx8vxQx+KF1GJByxSwbEm54QG5LwXEMj2NqJ+mpyyvwG22P3C6OumkFi3/l+mm9o1160Toz7uT1OuxDLF3iybc=
X-Received: by 2002:a5d:9586:: with SMTP id a6mr4575399ioo.131.1596651279679;
 Wed, 05 Aug 2020 11:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200317151409.7940926c@endymion> <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
 <20200805163655.6cfa6e17@endymion>
In-Reply-To: <20200805163655.6cfa6e17@endymion>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Aug 2020 20:14:28 +0200
Message-ID: <CAMRc=MeoWUaL_qvwL6bkpaVUvxh4x3ZN6V4UNQr+bjnLo3NubQ@mail.gmail.com>
Subject: Re: VAIO EEPROM support in at24
To:     Jean Delvare <jdelvare@suse.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 5, 2020 at 4:36 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Hi Bartosz,
>
> On Tue, 17 Mar 2020 15:32:56 +0100, Bartosz Golaszewski wrote:
> > wt., 17 mar 2020 o 15:14 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a=
):
> > > Before I start implementing the idea above, I would like to know if
> > > anyone objects to it, or has a better idea?
> >
> > Sounds good to me in general but isn't it something we could
> > generalize a bit more?
> >
> > For instance we could make at24_chip_data struct look something like th=
is:
> >
> > struct at24_chip_data {
> >     u32 byte_len;
> >     u8 flags;
> >     struct resource masked;
> > };
> >
> > And we could introduce a new macro called AT24_CHIP_DATA_MASKED that
> > would automacially set the AT24_FLAG_MASKED_RANGE flag and take
> > another argument that would contain the address and size of the masked
> > register range (we'd put it into the "masked" resource)?
> >
> > Other ideas are welcome too. I just think that making it
> > SONY_VAIO-specific may be a bit limiting in the future.
>
> I finally found the time to give it a try. Here's what my (tested)
> prototype looks like:
>

Hi Jean,

this looks good at first glance.

> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -8,9 +8,11 @@
>
>  #include <linux/acpi.h>
>  #include <linux/bitops.h>
> +#include <linux/capability.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> +#include <linux/ioport.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
> @@ -38,6 +40,8 @@
>  #define AT24_FLAG_MAC          BIT(2)
>  /* Does not auto-rollover reads to the next slave address. */
>  #define AT24_FLAG_NO_RDROL     BIT(1)
> +/* Contains an area that should not be exposed to non-root users */
> +#define AT24_FLAG_MASKED_RANGE BIT(0)
>
>  /*
>   * I2C EEPROMs from most vendors are inexpensive and mostly interchangea=
ble.
> @@ -87,6 +91,7 @@ struct at24_data {
>         u16 page_size;
>         u8 flags;
>
> +       struct resource masked;
>         struct nvmem_device *nvmem;
>         struct regulator *vcc_reg;
>
> @@ -121,6 +126,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Ti
>  struct at24_chip_data {
>         u32 byte_len;
>         u8 flags;
> +       struct resource masked;
>  };
>
>  #define AT24_CHIP_DATA(_name, _len, _flags)                            \
> @@ -128,6 +134,16 @@ struct at24_chip_data {
>                 .byte_len =3D _len, .flags =3D _flags,                   =
   \
>         }
>
> +#define AT24_CHIP_DATA_MASKED(_name, _len, _flags, _mstart, _mlen)     \
> +       static const struct at24_chip_data _name =3D {                   =
 \
> +               .byte_len =3D _len,                                      =
 \
> +               .flags =3D _flags | AT24_FLAG_MASKED_RANGE,              =
 \
> +               .masked =3D {                                            =
 \
> +                       .start =3D _mstart,                              =
 \
> +                       .end =3D _mstart + _mlen - 1,                    =
 \
> +               },                                                      \
> +       }
> +
>  /* needs 8 addresses as A0-A2 are ignored */
>  AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
>  /* old variants can't be handled with this generic entry! */
> @@ -144,6 +160,9 @@ AT24_CHIP_DATA(at24_data_24mac602, 64 /
>  /* spd is a 24c02 in memory DIMMs */
>  AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
>         AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
> +/* vaio is a 24c02 on some Sony laptops */
> +AT24_CHIP_DATA_MASKED(at24_data_vaio, 2048 / 8,
> +       AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0x00, 14);
>  AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
>  AT24_CHIP_DATA(at24_data_24cs04, 16,
>         AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> @@ -177,6 +196,7 @@ static const struct i2c_device_id at24_i
>         { "24mac402",   (kernel_ulong_t)&at24_data_24mac402 },
>         { "24mac602",   (kernel_ulong_t)&at24_data_24mac602 },
>         { "spd",        (kernel_ulong_t)&at24_data_spd },
> +       { "eeprom-vaio",(kernel_ulong_t)&at24_data_vaio },
>         { "24c04",      (kernel_ulong_t)&at24_data_24c04 },
>         { "24cs04",     (kernel_ulong_t)&at24_data_24cs04 },
>         { "24c08",      (kernel_ulong_t)&at24_data_24c08 },
> @@ -389,6 +409,9 @@ static int at24_read(void *priv, unsigne
>         struct device *dev;
>         char *buf =3D val;
>         int ret;
> +       unsigned int orig_off =3D off;
> +       char *orig_buf =3D buf;
> +       size_t orig_count =3D count;
>
>         at24 =3D priv;
>         dev =3D at24_base_client_dev(at24);
> @@ -427,6 +450,15 @@ static int at24_read(void *priv, unsigne
>
>         pm_runtime_put(dev);
>
> +       if ((at24->flags & AT24_FLAG_MASKED_RANGE) && !capable(CAP_SYS_AD=
MIN)) {

Maybe use unlikely() here? It's not necessarily a hotpath but at least
it would be obvious it's a corner case.

> +               int i;
> +
> +               for (i =3D orig_off; i < orig_off + orig_count; i++) {
> +                       if (i >=3D at24->masked.start && i <=3D at24->mas=
ked.end)
> +                               orig_buf[i] =3D 0x00;
> +               }
> +       }
> +
>         return 0;
>  }
>
> @@ -654,6 +686,7 @@ static int at24_probe(struct i2c_client
>         at24->byte_len =3D byte_len;
>         at24->page_size =3D page_size;
>         at24->flags =3D flags;
> +       at24->masked =3D cdata->masked;
>         at24->num_addresses =3D num_addresses;
>         at24->offset_adj =3D at24_get_offset_adj(flags, byte_len);
>         at24->client[0].client =3D client;
>
> Comments welcome. I already have my own comments/questions:
>
> 1* Do we actually need to use a struct resource? With the current
>    requirements, that looks overkill to me. We really only need the
>    start and end offsets of the masked area (or start and length). Or
>    do you plan to ever support multiple masked ranges, and
>    resource.child would be used to daisy-chain these ranges? Personally
>    I would wait until the need exists.
>

Yes, since this change doesn't seem to commit to any stable ABI, I'd
say we can drop the reference to struct resource and possibly add it
in the future. This just was the first thing that came to mind when I
suggested it.

>    Note that if we would just store mstart and mlen in struct
>    at24_chip_data then we could even get rid of AT24_FLAG_MASKED_RANGE,
>    as mlen > 0 would imply a masked range.
>

Makes sense.

> 2* I chose the name "eeprom-vaio" because "vaio" would be too generic.
>    I'm open to suggestions if you don't like that name.
>

Are you sure there won't be any different models of vaio eeproms? How
about '24c02-vaio' or 'eeprom-vaio-24c02'?

> 3* at24_read() was pretty elegant before my changes, but with the need
>    to remember the original value of many parameters, it no longer is.
>    I'm considering rewriting it in a way that does not modify the
>    parameters needed to process the masked range, either as part of
>    this patch or as a subsequent clean-up patch. That would hopefully
>    make the code elegant again.
>

All clean-ups are welcome.

> 4* I made the masking active only for non-root users as this is what
>    the legacy eeprom driver was doing. I hope that's OK with you.
>

Yes, it's fine with me. If more fine-grained control is needed we can
probably extend it.

Bartosz
