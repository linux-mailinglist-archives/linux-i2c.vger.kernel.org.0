Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55D030927
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 09:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfEaHKh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 03:10:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44473 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbfEaHKh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 03:10:37 -0400
Received: by mail-oi1-f195.google.com with SMTP id e189so235500oib.11
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1I0X96D3v1HYQYxv798SWRpkNTAm3dJbfOYoFu1vcjc=;
        b=mSXDop0s5jN9NAe1GtBRtMt2K1Xz8vR4sOEqaJjRU0qsqm+fGGNcJY4sW6OFh3g4+M
         z+Ka+XE9L9QeSAnO8qPi0FRJV7b5YoM6dbLCIOBz2UluV16H1LVVUx9EPHd7mvpxzsLE
         iyR0itn1OLelG55R8FoUg4ETdeaZxCjcPemNEeTCXpyUnTk9w6j9s11T+TufKbFFcmO8
         owyBKDuikuu13vU2pfMpR5dxvsixreNuXplAG5v18FwnUzDGkYHtZmkBSG8v3WCEctm9
         rs0rBYchC4Y28raKI51OL/9Q67GE4tObzU87TzN8Qpq14dapwtjDUOkvhvWqniB985/W
         GDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1I0X96D3v1HYQYxv798SWRpkNTAm3dJbfOYoFu1vcjc=;
        b=rtBRcEm5KKhRqaN/hcvTyCWDp8k474lRz+4Y4dQ/zkpRI3VuwwC58+qQ0TPVcqojal
         4gZDWHTfk5goz/v339lq/ZK5qqCAGU+9ynfh0cfa5CvTni7mlayp9v+wYmdBi/dAnp9c
         Yq5WcYvholGPCJ1Ixc3Y+9wqRTTFnikHmnJ+22qgNNtcuEQ2v+lOdnTTIJ3hQgMIJD0G
         JgTMXoP6LzA7vEj3ghVMI9tNsJnElyvSOndvQLIkBJ2dNRPXVfrk5ZFhyJnRe9kZ/s4l
         DNDLHgFW/EYMTdkWKkmuHpSWEi7lKzsTjQ8SWfr9el9FbSOjtIJOstWBHiUOn4oITwN0
         MHPg==
X-Gm-Message-State: APjAAAXC5cMKExNQePYen+H0HEUV38OIHjW30cZABEdjXkL6ln4CqSK4
        vTM8Ty6ERcu7QlZm+MZpYthW0gWKbR+Eaxu0b7e5Vw==
X-Google-Smtp-Source: APXvYqx7dnoXyXJ7rtNWycS5fX8T7GoEYq1ka5JDOo1LDAyBzDixHD27yR05izUVitFa1RBQW0H6BNO3Z7yPSCqiUio=
X-Received: by 2002:aca:6cc1:: with SMTP id h184mr370801oic.170.1559286636457;
 Fri, 31 May 2019 00:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145954.14500-1-yuehaibing@huawei.com>
In-Reply-To: <20190529145954.14500-1-yuehaibing@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 31 May 2019 09:10:25 +0200
Message-ID: <CAMpxmJVDk1whp+YJXJO7QZKOR0e_EkU4TakJqRei0xF5Ay_Log@mail.gmail.com>
Subject: Re: [PATCH -next] eeprom: at24: Remove set but not used variable 'addr'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 29 maj 2019 o 17:00 YueHaibing <yuehaibing@huawei.com> napisa=C5=
=82(a):
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/misc/eeprom/at24.c: In function at24_make_dummy_client:
> drivers/misc/eeprom/at24.c:514:21: warning: variable addr set but not use=
d [-Wunused-but-set-variable]
>
> It's not used since commit e7308628d0ae ("eeprom:
> at24: use devm_i2c_new_dummy_device()")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/misc/eeprom/at24.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index ba8e73812644..fa730bb342e8 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -511,13 +511,11 @@ static int at24_make_dummy_client(struct at24_data =
*at24, unsigned int index,
>                                   struct regmap_config *regmap_config)
>  {
>         struct i2c_client *base_client, *dummy_client;
> -       unsigned short int addr;
>         struct regmap *regmap;
>         struct device *dev;
>
>         base_client =3D at24->client[0].client;
>         dev =3D &base_client->dev;
> -       addr =3D base_client->addr + index;
>
>         dummy_client =3D devm_i2c_new_dummy_device(dev, base_client->adap=
ter,
>                                                  base_client->addr + inde=
x);
> --
> 2.17.1
>
>

Applied, thanks!

Bart
