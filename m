Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22FBB14D742
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgA3IGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:06:45 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34024 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgA3IGo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jan 2020 03:06:44 -0500
Received: by mail-oi1-f193.google.com with SMTP id l136so2684387oig.1;
        Thu, 30 Jan 2020 00:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UkWpdaCXq06Xmek5bdnoPkC6r56p3tRKd9oAQWdPjs8=;
        b=a9VCkKGJk5cdCRIUNce5DSptnNS3ZHtXNvIxAdeOwjWmHDFoVa6EN2mWRya52AbD2E
         ANb24Lk+j+HiGyZamAAxYNVjIKD61TuO0YQctYSYeh+iAipVcmT9Hrg39CRMSVvdIJ9j
         cNBKgl70Ulolt7uhv5SEq5XY88igTfnSTK7DOeXSs+GZJX2U+TK3u0BNDSEy+wQhHPJg
         hZiE7on83pBbcW592UvBN30JTd9Hi4xspORJTcVwpN7FcWwTcxQj282yOs/qHoODN4tF
         qYlKIGrSy3a+U85IlEFRk4ILt3QypqvecvDUwM7Bm76eTAurosKNOSdsRpBULCsc6yxd
         Extg==
X-Gm-Message-State: APjAAAWL/sZzFX4FlzmX1gA3W8rXZAi7S8tYk8JDWqGdM5CG2UIeUKNp
        rzzTJN+i9Qbxl7EH2JwOtUnThNr3o/KZuf9Qek4=
X-Google-Smtp-Source: APXvYqy7KBwwcoXGafqXm2nVVgNbtEoEPl/CzRYcyJlS4RC4lRs4cfR4mALFYM6+MbR7mSrJUJRvYaRVoMj8QVXBkkU=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2018628oia.148.1580371603697;
 Thu, 30 Jan 2020 00:06:43 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-3-ktouil@baylibre.com>
In-Reply-To: <20200107092922.18408-3-ktouil@baylibre.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Jan 2020 09:06:32 +0100
Message-ID: <CAMuHMdVv+FRnf6fvjEeu50W5PB-Gh2V8Th1h__vt6guMwk2xNQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] nvmem: add support for the write-protect pin
To:     Khouloud Touil <ktouil@baylibre.com>
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
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Khouloud,

On Tue, Jan 7, 2020 at 10:30 AM Khouloud Touil <ktouil@baylibre.com> wrote:
> The write-protect pin handling looks like a standard property that
> could benefit other users if available in the core nvmem framework.
>
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
>
> There was a suggestion for introducing the gpiodesc from pdata, but
> as pdata is already removed it could be replaced by adding it to
> nvmem_config.
>
> Reference: https://lists.96boards.org/pipermail/dev/2018-August/001056.html
>
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks for your patch!

> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/nvmem-provider.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
>  #include "nvmem.h"
> @@ -54,8 +55,14 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
>  static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
>                            void *val, size_t bytes)
>  {
> -       if (nvmem->reg_write)
> -               return nvmem->reg_write(nvmem->priv, offset, val, bytes);
> +       int ret;
> +
> +       if (nvmem->reg_write) {
> +               gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> +               ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
> +               gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> +               return ret;
> +       }
>
>         return -EINVAL;
>  }
> @@ -338,6 +345,14 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>                 kfree(nvmem);
>                 return ERR_PTR(rval);
>         }
> +       if (config->wp_gpio)
> +               nvmem->wp_gpio = config->wp_gpio;
> +       else
> +               nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
> +                                                   GPIOD_OUT_HIGH);

Shouldn't this GPIO be released in nvmem_release(), by calling gpiod_put()?

Once that's implemented, I assume it will be auto-released on registration
failure by the call to put_device()?

> +       if (IS_ERR(nvmem->wp_gpio))
> +               return PTR_ERR(nvmem->wp_gpio);
> +
>
>         kref_init(&nvmem->refcnt);
>         INIT_LIST_HEAD(&nvmem->cells);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
