Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0279226CE20
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 23:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgIPVKG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 17:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIPPz2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 11:55:28 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9108C02C2AB
        for <linux-i2c@vger.kernel.org>; Wed, 16 Sep 2020 08:40:06 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id ay8so6725297edb.8
        for <linux-i2c@vger.kernel.org>; Wed, 16 Sep 2020 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lYwFJVVyWUnvr3RRMVPcQVxmSTwmiXnhNz3uXivvFZA=;
        b=C1Hh9LyW50A8UnujcPZRIXI0ouy2JMnjXJvBkcGhAKb2pLUbr1rD4bPI3jdCJXHhnC
         tx3ak9cITTK4qeciTuBhe8nVxr3oz32O6JPmpklUrcf2776BVokaN923bZ9/rq88Rh5K
         CF1wLbCxUlvSOeWui43H0Jvz9TEqBo+LVxGxtnCSlu6/rGeSy9LnezIIZbEdZhJ98SIt
         F9fdJ6pwCbq21caas/gFAcjGFFn4O7xzi5uk7AG7yJSql8cb9NbKx8HG67QxQrrjfa0Y
         o7Cxv4lii7MsmwlOmqGbeKr/SdJLsWrtqDsad358aHKAYoOJnI+XawOA4KNF9f6Eb5al
         QZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lYwFJVVyWUnvr3RRMVPcQVxmSTwmiXnhNz3uXivvFZA=;
        b=sLVTa5FX716z+X20x7pNH6gDvkFUplG3kf+vZYlW12UXzOy+kmM/HttuHvj4eHUzAP
         qMpDf+NL1qBbZctrVwWtFLFaOdAZNdHnPyDhg5/1SYBFz1t45pioOa7d9UwYqrg03lSk
         lqs4fsDZnzbju2KQX+n/bJvQ0wa9pAvEr5j7hJD5Yon+ELp9q9bgt7WsubfJccHgiFYp
         rM8HHVmQyo6QNQgBJXLFACeqZoujaJiBCGYGzZvnq/1kCxziv38ntVqmt22eAdk/vr5O
         slzJvtX9fYwTWuGjIAVBgXCldGnU9wtsPm/PeDSBzmTbjE4j5yo4MF0qUwbORF/zRjgT
         4BCA==
X-Gm-Message-State: AOAM530tGqAgFVqxVQms+K8ncPnvfSUCoQJ1n0N9r/3mN2O8p6AF1y8C
        D8bfjnnBbAFIvgY7DYZoTkwfjnC9jiYAk4kKs6PAOA==
X-Google-Smtp-Source: ABdhPJwOo9r6FDUzpRY8OEBlsg9uhT7ZY2IDJIhHGcJvcQ0nag1UhTOihVozgoZqTeaMaapgroNGI4E/cvmpKLiV1VY=
X-Received: by 2002:a05:6402:17ec:: with SMTP id t12mr27216734edy.328.1600270805229;
 Wed, 16 Sep 2020 08:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200916152909.6812-1-vadym.kochan@plvision.eu>
In-Reply-To: <20200916152909.6812-1-vadym.kochan@plvision.eu>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Sep 2020 17:39:54 +0200
Message-ID: <CAMpxmJV3Rq65SY4MvLc8ONcpzt4DGZ3Kz5GpGi0TGZqHcJPWwg@mail.gmail.com>
Subject: Re: [PATCH] misc: eeprom: set type id as EEPROM for nvmem devices
To:     Vadym Kochan <vadym.kochan@plvision.eu>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 5:29 PM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> Set type as NVMEM_TYPE_EEPROM to expose this info via
> sysfs:
>
> $ cat /sys/bus/nvmem/devices/0-00560/type
> EEPROM
>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> Checked only with at24.
>
>  drivers/misc/eeprom/at24.c          | 1 +
>  drivers/misc/eeprom/at25.c          | 1 +
>  drivers/misc/eeprom/eeprom_93xx46.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2591c21b2b5d..800300296c74 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -678,6 +678,7 @@ static int at24_probe(struct i2c_client *client)
>                         return err;
>         }
>
> +       nvmem_config.type = NVMEM_TYPE_EEPROM;
>         nvmem_config.name = dev_name(dev);
>         nvmem_config.dev = dev;
>         nvmem_config.read_only = !writable;
> diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
> index ed8d38b09925..3a586a7c4b1a 100644
> --- a/drivers/misc/eeprom/at25.c
> +++ b/drivers/misc/eeprom/at25.c
> @@ -348,6 +348,7 @@ static int at25_probe(struct spi_device *spi)
>         spi_set_drvdata(spi, at25);
>         at25->addrlen = addrlen;
>
> +       at25->nvmem_config.type = NVMEM_TYPE_EEPROM;
>         at25->nvmem_config.name = dev_name(&spi->dev);
>         at25->nvmem_config.dev = &spi->dev;
>         at25->nvmem_config.read_only = chip.flags & EE_READONLY;
> diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
> index 94cfb675fe4e..7c45f82b4302 100644
> --- a/drivers/misc/eeprom/eeprom_93xx46.c
> +++ b/drivers/misc/eeprom/eeprom_93xx46.c
> @@ -455,6 +455,7 @@ static int eeprom_93xx46_probe(struct spi_device *spi)
>         edev->pdata = pd;
>
>         edev->size = 128;
> +       edev->nvmem_config.type = NVMEM_TYPE_EEPROM;
>         edev->nvmem_config.name = dev_name(&spi->dev);
>         edev->nvmem_config.dev = &spi->dev;
>         edev->nvmem_config.read_only = pd->flags & EE_READONLY;
> --
> 2.17.1
>

Please split it into separate patches - these drivers have different
maintainers.

Bartosz
