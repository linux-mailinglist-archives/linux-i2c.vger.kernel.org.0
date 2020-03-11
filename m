Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 716CE1812E3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Mar 2020 09:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgCKI1H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Mar 2020 04:27:07 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33356 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgCKI1H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Mar 2020 04:27:07 -0400
Received: by mail-qk1-f195.google.com with SMTP id p62so1290048qkb.0
        for <linux-i2c@vger.kernel.org>; Wed, 11 Mar 2020 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vuzfa5Ii3C+114ZZwPqdNHymYuyp0hGwxEjG+i+rX1M=;
        b=KK2szt1h7nFFVCO3f9nxfC++kUNef5i7vZty9U/gBtxe1i+yMWak1f4jIR5Kb4+ZLA
         4vw5Iye+6iBjmx4V99eSyyfZWKslZbhILLwKA+Fh0R3xZ4NGcf7fD2K+qr0lK8OL/e1j
         HEvSqaPf47seotvIOR/52luoXum5Qp7c7fwsU135RB1sY9c8iV1SxIsluGw4hoP8ENKU
         6Dc3TfE8HEo36qIXRqrCwGcnJ8/oVPIEMnJh0529oXSU0ZV2sLh+72GfO4C5jjxotBCF
         ZU43ziooQvVB2uodGzLDDFl0uwQyXL4tiyfagbq7qk+JhQfeh5xNtG0zV0/ao45KwBlg
         xzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vuzfa5Ii3C+114ZZwPqdNHymYuyp0hGwxEjG+i+rX1M=;
        b=aG+WL3/ixTjk2wUv5/NME9UGXPQBtjXLwOgRW/E5CCIutIjqwWpn0mU7hA4We6S26u
         Ic1ZLTjwxkIB9HfqPEJrunJ/YDBsYNjflmXOFlSnnJWjV/2AsrJteC7xwKiiU8X+pI4Z
         +zuIquPM2JYz8iZ2Zejbt5n0nXsQss+9uXX8/eElLnIbLmFQzGaZ3VyA+IkEjPnIR4DH
         rvPv/8Nc2a+by3zQ5Y+4KBGdOLDSJj7SUdVGtb5x/gNujcTJgoW9QQusEwBtkH2oCCm1
         iLGsA0qzfSofDF362EIn9vLV3iRWY+kWMKAHR54N8HLOzxFNuOIlxxLmInzXZeEvSo1T
         iSHg==
X-Gm-Message-State: ANhLgQ0bV7ASkCE1u1C4JOuqTGSJKdYsTTv29hXnWVpJJs+iswo+SY+W
        Lgvwc+7ACVWzo+wqEXPwAFSAuRUDt+6ME9j9kyqUJAGI
X-Google-Smtp-Source: ADFU+vtRG2ZTrHb7CXb7FLMFpUdds0tOVt2N9o3unR9wlTcKNLgyYsV64mnNuo/+Q1Bnfi60U9+WJIUiDfOg7LEc+Cc=
X-Received: by 2002:a37:b9c7:: with SMTP id j190mr1583102qkf.21.1583915225914;
 Wed, 11 Mar 2020 01:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200310205841.123084-1-michael.auchter@ni.com>
In-Reply-To: <20200310205841.123084-1-michael.auchter@ni.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Mar 2020 09:26:54 +0100
Message-ID: <CAMpxmJXBN_qTwHpcD-anHVB-uhatuN-PZDUUe6boD0GoFiMVXw@mail.gmail.com>
Subject: Re: [PATCH] misc: eeprom: at24: fix regulator underflow
To:     Michael Auchter <michael.auchter@ni.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 10 mar 2020 o 21:59 Michael Auchter <michael.auchter@ni.com> napisa=C5=
=82(a):
>
> The at24 driver attempts to read a byte from the device to validate that
> it's actually present, and if not, disables the vcc regulator and
> returns -ENODEV. However, between the read and the error handling path,
> pm_runtime_idle() is called and invokes the driver's suspend callback,
> which also disables the vcc regulator. This leads to an underflow of the
> regulator enable count if the EEPROM is not present.
>
> Move the pm_runtime_suspend() call to be after the error handling path
> to resolve this.
>
> Signed-off-by: Michael Auchter <michael.auchter@ni.com>
> ---
>  drivers/misc/eeprom/at24.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 031eb64549af..282c9ef68ed2 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -712,13 +712,14 @@ static int at24_probe(struct i2c_client *client)
>          * chip is functional.
>          */
>         err =3D at24_read(at24, 0, &test_byte, 1);
> -       pm_runtime_idle(dev);
>         if (err) {
>                 pm_runtime_disable(dev);
>                 regulator_disable(at24->vcc_reg);
>                 return -ENODEV;
>         }
>
> +       pm_runtime_idle(dev);
> +
>         if (writable)
>                 dev_info(dev, "%u byte %s EEPROM, writable, %u bytes/writ=
e\n",
>                          byte_len, client->name, at24->write_max);
> --
> 2.24.1
>

Patch applied for fixes.

Bartosz
