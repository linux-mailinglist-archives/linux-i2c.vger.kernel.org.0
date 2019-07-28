Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990E478084
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2019 18:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfG1QvK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jul 2019 12:51:10 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41575 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfG1QvJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jul 2019 12:51:09 -0400
Received: by mail-io1-f68.google.com with SMTP id j5so110855880ioj.8
        for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2019 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iPSTb/ugUHYwVlT9/uQIlUkREIRlUpHM1TgwBqyHsyk=;
        b=miIE5U6vo4jaVkuTEOM7/ypLJ3V+22yx72Dn1jCqSFjPIFe/SSAYUvZWJK0GgkpuRo
         wIRC24qiddywrZDvNEz0d/bk94SqU34ES/OlW4GFVnyqq2h21yTR1op1wXW//lgFuMCe
         fdCSvcoWcI/rmok2/AAa4R8VXAXeAQskSKRZgxPq5Kyta0Oku/W/Ap9H1FGphG4P5tLH
         /1+JA3oTL7dCU4DQzfFLv70PsddVUxu/tG8yrd+qBRonh8UVXriUqWaY6IGo+hxrU6q/
         NXl+Nw32bDVGiEfx5A2/sypKeRrnQvXp4LtvtkVI//pL6arOEMpKPv3zCq1BW1My/1BW
         5qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iPSTb/ugUHYwVlT9/uQIlUkREIRlUpHM1TgwBqyHsyk=;
        b=jPl25N1+DQodwMIn8iN+/fh24bSf6SRCJOWO7A902RLq44p8JRlLRZ2MNx3nwu6Iyc
         syOa+S9NFypidBXPzAbSYv5BkRvW6Xz5XJK/1zh5XQZcIsQEBeHz7iydXgX0VuLYRExw
         3SE0X5/1xM614rBQddcypBK1tpmX3o+sQaaI+zYXVCk0Nawoii01/90unpvF3bQav4Yq
         30SalALpixjjiLya2sFKS/Q38Pw+rGIUeZ2Yk5xPAMhcsjze8uI9K8s+jJ8s9ypg7yAB
         nSSE1J/0fBTIt+i7EuEKE0AFy81h5QGkSeH/mMYz8QcriHgXRQcXkQfuHwuJQ+ggN9QS
         5Ucw==
X-Gm-Message-State: APjAAAWRYcBjCzM6MBsgz3wWUJ/rdlxIBtw8QtlakZ6jhxYsbzCCx1YY
        X/3YFgJgHX683n9xMhSIgHx8qcSpG/of+KHW1SgDVw==
X-Google-Smtp-Source: APXvYqxDP/Xc4YvFTazXuFe3kUOMZmk9NmWfWq1JFLzpBh0f15mNtNVuIvC7ICSDFCC05pVsc3xEtlgwjKAkHlHwaiQ=
X-Received: by 2002:a02:c492:: with SMTP id t18mr108750115jam.67.1564332668827;
 Sun, 28 Jul 2019 09:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190728184138.78afc30f@endymion> <20190728184255.563332e6@endymion>
In-Reply-To: <20190728184255.563332e6@endymion>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 28 Jul 2019 18:50:58 +0200
Message-ID: <CAMRc=Mc6mB56zkhOzvBsJtyePx3H6DvVLLSYwPChBNoyD_zR2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: Use the same permissions for eeprom as for nvmem
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

niedz., 28 lip 2019 o 18:43 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a)=
:
>
> The compatibility "eeprom" attribute is currently root-only no
> matter what the configuration says. The "nvmem" attribute does
> respect the setting of the root_only configuration bit, so do the
> same for "eeprom".
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: b6c217ab9be6 ("nvmem: Add backwards compatibility support for olde=
r EEPROM drivers.")
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
> Changes since V1:
>  * Split into 2 patches, one to the at24 driver and one to the nvmem
>    core. drivers/nvmem/nvmem-sysfs.c |   15 +++++++++++----
>
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> --- linux-5.2.orig/drivers/nvmem/nvmem-sysfs.c  2019-07-08 00:41:56.00000=
0000 +0200
> +++ linux-5.2/drivers/nvmem/nvmem-sysfs.c       2019-07-28 18:06:53.10514=
0893 +0200
> @@ -224,10 +224,17 @@ int nvmem_sysfs_setup_compat(struct nvme
>         if (!config->base_dev)
>                 return -EINVAL;
>
> -       if (nvmem->read_only)
> -               nvmem->eeprom =3D bin_attr_ro_root_nvmem;
> -       else
> -               nvmem->eeprom =3D bin_attr_rw_root_nvmem;
> +       if (nvmem->read_only) {
> +               if (config->root_only)
> +                       nvmem->eeprom =3D bin_attr_ro_root_nvmem;
> +               else
> +                       nvmem->eeprom =3D bin_attr_ro_nvmem;
> +       } else {
> +               if (config->root_only)
> +                       nvmem->eeprom =3D bin_attr_rw_root_nvmem;
> +               else
> +                       nvmem->eeprom =3D bin_attr_rw_nvmem;
> +       }
>         nvmem->eeprom.attr.name =3D "eeprom";
>         nvmem->eeprom.size =3D nvmem->size;
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>
>
> --
> Jean Delvare
> SUSE L3 Support

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
