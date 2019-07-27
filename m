Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E9477863
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jul 2019 13:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfG0LPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Jul 2019 07:15:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37574 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfG0LPO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Jul 2019 07:15:14 -0400
Received: by mail-io1-f66.google.com with SMTP id q22so450799iog.4
        for <linux-i2c@vger.kernel.org>; Sat, 27 Jul 2019 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mqoTNE8HARkBLgQsyvRewwWZMUjbfGFTv8lkiVBefwE=;
        b=nHVEEVXDcANOFQhtHbSB4l5XMmrAojQhSE/DABPBI5l8MunuGNcPs+fGCLC23sNO8g
         o7vjaDnsDKkD1nd1MNs2gajh8lDBz8w90pag6Wur5WEtsX7aMJ9R5otUZPDbc7oIJ5F4
         c8goP5rJoQI9RmAxoEasHgqT1VTT/rhjoe69oEFvF8WsGC0A1NrqJbID3RttaYCKOpFB
         r/LWDzpamZT4vBOFuTwlU8ew9SCS7iMa2urqQl9BNXS0uMF/SChnP9BdspiqDf2r3QjO
         AKiylzrmAY/FxIcf9pY6nr9Omz+dOgWRkGOF0SAoi4RkHgerOJW262y4TM8eZUldMYa8
         fKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mqoTNE8HARkBLgQsyvRewwWZMUjbfGFTv8lkiVBefwE=;
        b=OzM9c+LDfpnEV/YmlXZFOlAhldsZPmQE49UBvzZZM7i7C58bAi62TaTYrGxmZ6qS9L
         dLBoUl4IRwBzlYZquyFiWgMSKWpJOyCXBE4padVc4OYz1C/TMAkBhAdcpGg4n9iqwbbi
         x+twEO/74rV2lRD7hFMlUTV6TV3cwQjJmY39xn2eDS9Mf5NBogYXNF70choejr97vx3H
         w0fc531330gJQ4aBmZxZ9ByKeJq2JTV5+Zj0lug8Ecddin4utdG35BJvdnwTFiRkDoEj
         zFMLbLl1GdXK/ILjCpF1i6rvUdWAj+RVoBSkuNe5mFJID0mofaXVfyaCMPcHFE8eSuQy
         Cr7w==
X-Gm-Message-State: APjAAAUZEysIPB+DLLelj8pPC2akEARZgF4ohgnmsuwD084ydWxkojjo
        vCL9fBT9pEUugJ0UYs7thj5ZrEaboHnAWeXGUco=
X-Google-Smtp-Source: APXvYqz1QGZrW9ffjfsQdjLXfYYQc8Chzi+SN+sYRwdm2nsh9/WrkcrqfXPxnnZwASMn0ABmxR6c3rkKMomygm4guYE=
X-Received: by 2002:a02:37d6:: with SMTP id r205mr100339293jar.57.1564226114034;
 Sat, 27 Jul 2019 04:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190726151816.66f2ff2f@endymion>
In-Reply-To: <20190726151816.66f2ff2f@endymion>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 27 Jul 2019 13:15:03 +0200
Message-ID: <CAMRc=Mcq6CMG5wWgYui79pHnx7BOG_7KwVJB0=dvZpXed9Dnaw@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: make spd world-readable again
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 26 lip 2019 o 15:18 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a):
>
> The integration of the at24 driver into the nvmem framework broke the
> world-readability of spd EEPROMs. Fix it.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 57d155506dd5 ("eeprom: at24: extend driver to plug into the NVMEM =
framework")
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/misc/eeprom/at24.c |    2 +-
>  drivers/nvmem/core.c       |   15 +++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
>
> --- linux-5.1.orig/drivers/misc/eeprom/at24.c   2019-05-06 02:42:58.00000=
0000 +0200
> +++ linux-5.1/drivers/misc/eeprom/at24.c        2019-07-26 13:56:37.61219=
7390 +0200
> @@ -719,7 +719,7 @@ static int at24_probe(struct i2c_client
>         nvmem_config.name =3D dev_name(dev);
>         nvmem_config.dev =3D dev;
>         nvmem_config.read_only =3D !writable;
> -       nvmem_config.root_only =3D true;
> +       nvmem_config.root_only =3D !(flags & AT24_FLAG_IRUGO);

Hi Jean,

I have a preference for code as readable as possible. Please make it
something like: root_only =3D flags & AT24_FLAG_IRUGO ? false : true;.

Also: AFAICT these changes can easily be split into two separate
patches, which would make pushing them upstream easier as at24 and
nvmem go through different branches.

Bart

>         nvmem_config.owner =3D THIS_MODULE;
>         nvmem_config.compat =3D true;
>         nvmem_config.base_dev =3D dev;
> --- linux-5.1.orig/drivers/nvmem/core.c 2019-07-23 19:30:27.630099103 +02=
00
> +++ linux-5.1/drivers/nvmem/core.c      2019-07-26 14:21:31.002908472 +02=
00
> @@ -435,10 +435,17 @@ static int nvmem_setup_compat(struct nvm
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
