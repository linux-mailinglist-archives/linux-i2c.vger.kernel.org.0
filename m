Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F850215CF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 10:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfEQI5m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 04:57:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44977 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfEQI5m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 04:57:42 -0400
Received: by mail-io1-f68.google.com with SMTP id f22so4847736iol.11
        for <linux-i2c@vger.kernel.org>; Fri, 17 May 2019 01:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FDH9DMB8Pzo5rV5g+1fEV0OqegQ0t3+HJ6r34GDVe10=;
        b=eEnmhnsVqe6OD9WqTyc61Ludq/1WZIeO/+/bFe6xBAAQDAYT2qsAEJ6ivGv+C7L/Oz
         cJn4Z7kMfWLWnTttGZssW6yqh014YuCinfD88qOtqzDMOW6GUF8Y9yus1SFCmb+Dhq7I
         6bjZUpB/O5CTeNG3HuVQ8nCjQQw0ggeX3m9HO9dCafFxih3xCg1vUYJf4v6fI7vu+MdC
         Zvs6DGEAQhSa0N+pK50cFR533D0EUAzwhXfDbdjF9SJr/RsdLRV7+lxqVY34M+Hz2sLa
         nNItLIhyyVLeDFxrlPKEeEVeANU6+cUECRrqWFAVMS3XIhOyeFqvsidoA77lMzmMV2CF
         X5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FDH9DMB8Pzo5rV5g+1fEV0OqegQ0t3+HJ6r34GDVe10=;
        b=d9HxENPVx4ttMD64eIFfbz+VZS7bsdLZofl5DTLhN9mTmQWHPF4wD+CR1Eujg7uQba
         hEywE+V5bL/qNACVoFIrjmPbPHpLMBSyCU3NtgWLd9Z043KonnJYdZucCnKSD/YdmxdW
         7XnC5fqGRwd4fN2ZuvjKH4eIEV5J2TH9x0PK3b6CGr+pHEsK2mudpPgYY7Q4IBV38IHE
         nzQD4NkkXlOJ0nv2vrA5AZprRqNEVgC45XSCnvGvKUxaRX6A9IBPOoUTDmaAsEkamzZU
         LnIvny7NWdzWU5IVpufudXUGp8jMEHm5OH02iMCjks3CF6Hye4GZYyG4omgSgDe7w2Qs
         z6xg==
X-Gm-Message-State: APjAAAV5paWDSnjjGwx04ySLkZG6Nz97xsNdmNaDnA93xAShdgPqVQ/O
        XBlZAxBEXVf0OerTi9nJwHQXoN+Iag1CSch/BFcmHSQDIxs=
X-Google-Smtp-Source: APXvYqzRX1CjKoHvmEFD4efmgHvPJSBXshyFsPW57WpxRcWQQQEYsRDw82IHzsPn55v6pnVXeemB8yhAZsFFOFd3NlE=
X-Received: by 2002:a6b:b415:: with SMTP id d21mr29315544iof.189.1558083461487;
 Fri, 17 May 2019 01:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com> <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 May 2019 10:57:30 +0200
Message-ID: <CAMRc=MeZEucKTGbLKnOS4a3rdsinj0sS8WDFzoaDO0wscrEEgg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] mfd: da9063: occupy second I2C address, too
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 16 maj 2019 o 23:13 Wolfram Sang
<wsa+renesas@sang-engineering.com> napisa=C5=82(a):
>
> Even though we don't use it yet, we should mark the second I2C address
> this device is listening to as used.
>
> Not yet for upstream until all dependencies are merged!
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 455de74c0dd2..2133b09f6e7a 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -221,6 +221,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>                 return ret;
>         }
>
> +       devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1)=
;
> +
>         return da9063_device_init(da9063, i2c->irq);
>  }
>
> --
> 2.19.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
