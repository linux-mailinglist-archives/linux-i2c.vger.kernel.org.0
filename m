Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C775078080
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2019 18:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfG1Quf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jul 2019 12:50:35 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35723 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfG1Quf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jul 2019 12:50:35 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so115037977ioo.2
        for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2019 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yptnDSL4rf5m84+FoEeewCLSPPqt1gUBrf9esUo8GZ8=;
        b=ZDiAZgxSBdthN1odXRkCIkYNXKm+69HhCVwXGcGBfVflQfM4DkWb0b4ULRY5kGnKgE
         2jRv7egMTe3KIVo6l1RLvufKv7liAbYgaViUxuA46zOoERnbxEOpU9yDzSJc4DXP6nVw
         4UJYOOl7EtkmlZzbmf0WeUUsgg3JYIoH7K4l/OPa0tdM+qojOdcHbmreF3vm/OEuviZB
         RxMAVi/6sosAvoquCSUvP2duDDYo2ikyQTH4j6kutZcd66Z2pVN+InoJ+ugr8ZPZhsV5
         mRHXhLl5FcvVWj1WOtGO3wpmKpvy1fuhsV7a/8kGFp3YWKAgcuErMzkDkz87ip22QtTW
         0MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yptnDSL4rf5m84+FoEeewCLSPPqt1gUBrf9esUo8GZ8=;
        b=QEhlcWe4lpG2J3Mcn1SE46SrSz6sNbu5iGDNjeoJ+3SUtWMa6zgpG4JpCyYgX1yAYC
         VwvYYipwuj6+J4NNwxQM9DJHLggQeJQu0t8XvCFQWoFyR+qASONC4hZAXSN43oyFI9+6
         M9A/CFbhDvkkvQ8/LrPAmMVF5nb77RogMgqxEZbOPtfXi4ZPBM4zm3730j+z7rcI9mik
         2MAnIB8nckcXkRvwKZL0/dckgGM02ADkMBXI7J2Guw81vHpA+STB2Ii/srEGnaWbfIOV
         5LHO+xY2MkF+UksZXQkBsiY6UueEWMe45tkeeWPtqp5hvW21C812CeKbGnM+xClC9K3h
         H0yw==
X-Gm-Message-State: APjAAAXGMUpV8XX20C23Boap6WnbaRxZnopRzBYG+ksbay53EQTwsB5V
        nIUQkSsaMqQsPGfm/Kz59y0wBwWnqJRi2UpIaW4WTg==
X-Google-Smtp-Source: APXvYqz6PWKsM6ZattvmyKkyCzcvtTzqF0D3p6piiGxNhKpcQX7kltMbTPIx76c3vLHiOIYofPx3C/F9r9xSjsrsIP8=
X-Received: by 2002:a02:cc6c:: with SMTP id j12mr64528185jaq.102.1564332634854;
 Sun, 28 Jul 2019 09:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190728184138.78afc30f@endymion>
In-Reply-To: <20190728184138.78afc30f@endymion>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 28 Jul 2019 18:50:24 +0200
Message-ID: <CAMRc=Mfu7=GQ_BiBANVf1AQnkvtwPOE88f=DX4o0hSwXfFFEtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] eeprom: at24: make spd world-readable again
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

niedz., 28 lip 2019 o 18:41 Jean Delvare <jdelvare@suse.de> napisa=C5=82(a)=
:
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
> Note: This is only the 1st half of the fix, the nvmem core driver
> also needs to be fixed.
>
> Changes since V1:
>  * Split into 2 patches, one to the at24 driver and one to the nvmem
>    core.
>
>  drivers/misc/eeprom/at24.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-5.1.orig/drivers/misc/eeprom/at24.c   2019-07-28 16:52:06.55091=
8923 +0200
> +++ linux-5.1/drivers/misc/eeprom/at24.c        2019-07-28 16:53:28.10416=
7083 +0200
> @@ -719,7 +719,7 @@ static int at24_probe(struct i2c_client
>         nvmem_config.name =3D dev_name(dev);
>         nvmem_config.dev =3D dev;
>         nvmem_config.read_only =3D !writable;
> -       nvmem_config.root_only =3D true;
> +       nvmem_config.root_only =3D !(flags & AT24_FLAG_IRUGO);
>         nvmem_config.owner =3D THIS_MODULE;
>         nvmem_config.compat =3D true;
>         nvmem_config.base_dev =3D dev;
>
>
> --
> Jean Delvare
> SUSE L3 Support

Applied to fixes.

Bart
