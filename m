Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848EF3B94DB
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhGAQu3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 12:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhGAQu2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jul 2021 12:50:28 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591F8C061762
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jul 2021 09:47:58 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id p15so11860904ybe.6
        for <linux-i2c@vger.kernel.org>; Thu, 01 Jul 2021 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4uRX24voOSIDHbQVqER+usC3/rZFKIdOkp91h4ZSrVY=;
        b=wNv96Uk4ixkMdGS08FR6eNSn1+75uPwjjyujZSdLdrshgiTFabz+nFm6vgNi/szhvd
         +xagmlbUnOdSVGceT95RYANUi4wlb2LzZ48UiY4ksVAJxg/uf5ehYw5nqWpef0IU3XDZ
         8AaxkxJWm/1ywM/gXU10cydNW4004FMs3XZss0AliCdAW1Ggj8fRqRnjEO1z6ywUumgE
         7QeI6ESsXo/ANTJ8YaAZJeTmnna3P37obJQOM7ig+tBPPPvekr1ysRJ5zocmpzJUGtQ8
         qGRgXvzB10dXdfYOvRybHo5uA8ZOvMM5CUETxC4n0UPoITd7zOv+eP+t9qCXGGrJi4d/
         ONVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4uRX24voOSIDHbQVqER+usC3/rZFKIdOkp91h4ZSrVY=;
        b=SffoHxztbuGP6BF1Ph3BqbKgSm5SglyP4WI7VXBF8nasI0up5L2c19/BHgs2fCcX8/
         As4R61skaIdp+ahYUQ/EPMrXNbPC9n4K7tU5m57sBmHFd1bP4M9eLZwOiMDkXYUzPx9J
         7YEGgE7V3v5UHywuVWfjU2hLYfbpqrxnde+fZ3JvUu4a2p7PEy2GL1lDCl/qaPqdnUdO
         SRGIj0MoCjeslC18FvT1/rToQcUOY7b398DO4PGQEjKZeytx7QKHljZf5rMsxAcr5GxR
         69d2j3dd+4V9x9nFVevtxoi1CMB/lfRHFGbQhggsxB1/5GpXPaMdx/qsaLC3w0amhlfc
         jjRw==
X-Gm-Message-State: AOAM532HYRRaxIdXMDusK0LBp8Fy5OlWUN6vLrKr+3CrFpO+KBm0zKru
        PpcYZurMejVAmnn66dRyFBB47FB+uiSfwP4qWps/qw==
X-Google-Smtp-Source: ABdhPJzkWZZbFz/VJ5E1EUZradgQPO2i8YfdsXttHAc41DvpXCWy/FDNZQQSKkWTqW+GLPA7yOiPl3BbfaxRc0Cqd98=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr909197ybi.366.1625158077677;
 Thu, 01 Jul 2021 09:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210701152825.265729-1-jglisse@redhat.com>
In-Reply-To: <20210701152825.265729-1-jglisse@redhat.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 1 Jul 2021 18:47:47 +0200
Message-ID: <CAMpxmJX_3eu+8Oxg2UgiifwD=qwJYM3-qCqwxseM1mnLbn5fJA@mail.gmail.com>
Subject: Re: [PATCH] misc: eeprom: at24: Always append device id even if label
 property is set.
To:     =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Diego Santa Cruz <Diego.SantaCruz@spinetix.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "Stable # 4 . 20+" <stable@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Alexander Fomichev <fomichev.ru@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 1, 2021 at 5:28 PM <jglisse@redhat.com> wrote:
>
> From: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
>
> We need to append device id even if eeprom have a label property set as s=
ome
> platform can have multiple eeproms with same label and we can not registe=
r
> each of those with same label. Failing to register those eeproms trigger
> cascade failures on such platform (system is no longer working).
>
> This fix regression on such platform introduced with 4e302c3b568e
>
> Signed-off-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> ---
>  drivers/misc/eeprom/at24.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 7a6f01ace78a..305ffad131a2 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -714,23 +714,20 @@ static int at24_probe(struct i2c_client *client)
>         }
>
>         /*
> -        * If the 'label' property is not present for the AT24 EEPROM,
> -        * then nvmem_config.id is initialised to NVMEM_DEVID_AUTO,
> -        * and this will append the 'devid' to the name of the NVMEM
> -        * device. This is purely legacy and the AT24 driver has always
> -        * defaulted to this. However, if the 'label' property is
> -        * present then this means that the name is specified by the
> -        * firmware and this name should be used verbatim and so it is
> -        * not necessary to append the 'devid'.
> +        * We initialize nvmem_config.id to NVMEM_DEVID_AUTO even if the
> +        * label property is set as some platform can have multiple eepro=
ms
> +        * with same label and we can not register each of those with sam=
e
> +        * label. Failing to register those eeproms trigger cascade failu=
re
> +        * on such platform.
>          */
> +       nvmem_config.id =3D NVMEM_DEVID_AUTO;
> +
>         if (device_property_present(dev, "label")) {
> -               nvmem_config.id =3D NVMEM_DEVID_NONE;
>                 err =3D device_property_read_string(dev, "label",
>                                                   &nvmem_config.name);
>                 if (err)
>                         return err;
>         } else {
> -               nvmem_config.id =3D NVMEM_DEVID_AUTO;
>                 nvmem_config.name =3D dev_name(dev);
>         }
>
> --
> 2.31.1
>

Cc'ing Alexander Fomichev who reported this issue first.

This is the second time someone raises this problem so it seems that
this change really broke many existing systems. I will apply this
patch and send it for stable.

Bart
