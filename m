Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A830107265
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 13:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfKVMrY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 07:47:24 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36450 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfKVMrY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 07:47:24 -0500
Received: by mail-lj1-f193.google.com with SMTP id k15so7248129lja.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 04:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cT3IohDx0JHZlkGP4CZFg3FyqkNQ1ycKB4FYfEK3fT0=;
        b=R08nHDFYlfWD1UbasbWcgbXF3HkurI/bX+33/EvmtGS69Ug6wVt6fV1YJEp0qv9qAk
         zjGS26ksb3CIAXusmn1BDgKNYCt36OLVm36WWqiY98Rn5KxohFnifc7aO2ltKk0aW1w2
         uXnLddN3awhdM+McnPckBkeqdZ77OQWHKoj/0teqobq03TU6v1styfpeDLSS05Jf6ca0
         7o3EB/mzSiZas8rRlo+tk/ZwfH9MJqgocDiTcPnOdD37CWaCFiVt7ZXo1TjHoEEvWbQr
         704bY+A5zS/4YcA1mm/lM8f1evfc5XT9kxmEq1DfdTOgiBDBdi3ZuE0LG92RqfqGUk6h
         TmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cT3IohDx0JHZlkGP4CZFg3FyqkNQ1ycKB4FYfEK3fT0=;
        b=BxdVb4oMNBuVlKkeWgeCSpIqzy0Y/S/JHUgo/beo12NrS8ysBtlAM5M78xrt+vL2xx
         jfmEqzYmvVwlBBSBI15BC9i4F9SM/u7RCbzEShQPeR7zLviPdbu2hpBhnQYLO0HGb8Ii
         /yZWGQJ4FcAOCxAt6rlArDZ2qem36wO7c+B0zfJbSRBcD8UBkdboTi3S7IWTh/eJt79V
         0pe3QT4znU4FDK4KI1SklPtZcILp0YdyR6cNPz9a/lXGGSYbLAotRLlxT1uzlGOBPLnS
         6rXKhjJDhD/EzqNpxfVQyS2NV+fERowibiIWtJJ0phchOVK/IMS3dKsfMIetBgqdm4Il
         K7nA==
X-Gm-Message-State: APjAAAXNvaTY+rd6O2rF0XiQ3eIhE+YBQf7neTNwL8cQaaKMtrnl4ZS9
        H9/6jHdLPESzAO8kHVUQ+F9Q1FgArsv+tuagYZaQHw==
X-Google-Smtp-Source: APXvYqyoxZwXNwt2CCATwx79HqY8lUKoGyCLoUuD1ooN0fFntMt/FC3yJniKGM7O+e3D4ygALFh0YlJD6TUtvBPZ54E=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr12200230lji.218.1574426842056;
 Fri, 22 Nov 2019 04:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20191120142038.30746-1-ktouil@baylibre.com> <20191120142038.30746-3-ktouil@baylibre.com>
In-Reply-To: <20191120142038.30746-3-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:47:10 +0100
Message-ID: <CACRpkdYwwHbjrSq7DRyCkD4jDXYoWFWNnUi-SkCZ5gUAkbxOZQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] nvmem: add support for the write-protect pin
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Khouloud,

more comments!

On Wed, Nov 20, 2019 at 3:21 PM Khouloud Touil <ktouil@baylibre.com> wrote:

> +       if (nvmem->reg_write) {
> +               gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> +               ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
> +               gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> +               return ret;
> +       }

Since I requested that the GPIO line shall be flagged as
active low in the device tree, make sure to invert this
and toss in a comment:

/*
 * We assert and deassert the write protection GPIO line.
 * This line is often active low, but that semantic is handled
 * in gpiolib in respons to flags in the machine description,
 * such as the device tree or ACPI.
 */
gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
gpiod_set_value_cansleep(nvmem->wp_gpio, 0);

> @@ -365,6 +372,15 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>                 kfree(nvmem);
>                 return ERR_PTR(rval);
>         }
> +       if (config->wp_gpio)
> +               nvmem->wp_gpio = config->wp_gpio;
> +       else
> +               nvmem->wp_gpio = gpiod_get_optional(config->dev,
> +                                                   "wp",
> +                                                   GPIOD_OUT_HIGH);

GPIOD_OUT_LOW as it will be inverted.

Apart from this I like the idea in this patch!

Yours,
Linus Walleij
