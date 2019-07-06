Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D20661262
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 19:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfGFReH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 13:34:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38699 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfGFReH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 Jul 2019 13:34:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id d17so12053591oth.5
        for <linux-i2c@vger.kernel.org>; Sat, 06 Jul 2019 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6rSokrjV72EOKICMeiM4aeHXTuigt5/+m6ro2k3F+44=;
        b=JTIoTq3DRAAWkLD35oXvk1/GTKYI/b/+Qo3TR1z1vzGMfWzv9aCQPw1xpInrZonynQ
         YWZkTPZ/o4lH0zx0sjEYuHB6rrKqrlZ+XmXg69bqlCY7vPMsikQmtkojnEiS7SaZtYUh
         XrUgQjpK5wKowIjs4aNczeJnC+N1mSVO+uZo3ExsLwsxEPkB8LWm9eJu3S1OQrAuqm2p
         jnWPtmfT26c3P/F5UF7UFbRaiTw5HiI+JAkqUiX4hcXVM11FD7AYXmAHxrflDtC1nN8h
         2nAwt7Eg4GZs7Vg+HGn9bThPl+42CQQHE3vilO6p0mAmkUioIV8sGqrkFn8UG3CW23ed
         mqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6rSokrjV72EOKICMeiM4aeHXTuigt5/+m6ro2k3F+44=;
        b=m59elNos0gbPdCecorvXbCm6pkFlLLQjhlFwosrDG2o40vqGZcI68ZXYhsjCxgQa4s
         Z3Jh+O0Xt9Gd2hZ/bFMtFsxr99cBwjSyM87IoyLl9JVfDw6ccSZ3mcpTRkPHsN2qhdyZ
         fBhTBn0bUz6ckNzga1LxZvGwxOMseJx4ELSliAT10OLfLU5AKZzM1xgnPesW4ofiDoNO
         yy4cyjl0r5qO9Z6pLAR4wpIukbbuF5J1iibdBh5onIAF30ApbRgitlajngQFb5qZP0B4
         TdORG4HdwPMwdlNOufBb6qI/9ZhyRqka6b/4dLkVZ7piS6pge5xgKMaA5XTVtW/BTVzx
         Orcg==
X-Gm-Message-State: APjAAAXztDPUAz/jAFHLRnhtJK0kM5kckZJ0o6XeViWoZgtPKFaHa52L
        MnDuZKc6BQccQ+PMxp2ffM2n1O46afuCW3Sa4sqxB1U5PPo=
X-Google-Smtp-Source: APXvYqxRSfsrnoYmJkITtMpnb36V/sa7V5iARcGpdgnivBqIomF5WicbrRlh0B319QyJPiuCGwR1tL8/q3qUv2ZOlQ8=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr7776517otk.292.1562434446220;
 Sat, 06 Jul 2019 10:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <1562347885-58349-1-git-send-email-cst@phaseone.com>
In-Reply-To: <1562347885-58349-1-git-send-email-cst@phaseone.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sat, 6 Jul 2019 19:33:55 +0200
Message-ID: <CAMpxmJX3x5kOi63+cs5JFHp2Eu5W+0=zKBURcde7pZ5K_2=3nA@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Limit gpio calls to when wp_gpio is defined
To:     "Claus H. Stovgaard" <cst@phaseone.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 5 lip 2019 o 19:31 Claus H. Stovgaard <cst@phaseone.com> napisa=C5=82(=
a):
>
> Calling gpiod_set_value_cansleep with no GPIO driver associated result in
> the WARN_ON error from consumer.h. So change to only call
> gpiod_set_value_cansleep when wp_gpio is defined.
>
> Signed-off-by: Claus H. Stovgaard <cst@phaseone.com>
> ---
>  drivers/misc/eeprom/at24.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 35bf247..d17e982 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -458,12 +458,14 @@ static int at24_write(void *priv, unsigned int off,=
 void *val, size_t count)
>          * from this host, but not from other I2C masters.
>          */
>         mutex_lock(&at24->lock);
> -       gpiod_set_value_cansleep(at24->wp_gpio, 0);
> +       if (at24->wp_gpio)
> +               gpiod_set_value_cansleep(at24->wp_gpio, 0);
>
>         while (count) {
>                 ret =3D at24_regmap_write(at24, buf, off, count);
>                 if (ret < 0) {
> -                       gpiod_set_value_cansleep(at24->wp_gpio, 1);
> +                       if (at24->wp_gpio)
> +                               gpiod_set_value_cansleep(at24->wp_gpio, 1=
);
>                         mutex_unlock(&at24->lock);
>                         pm_runtime_put(dev);
>                         return ret;
> @@ -473,7 +475,8 @@ static int at24_write(void *priv, unsigned int off, v=
oid *val, size_t count)
>                 count -=3D ret;
>         }
>
> -       gpiod_set_value_cansleep(at24->wp_gpio, 1);
> +       if (at24->wp_gpio)
> +               gpiod_set_value_cansleep(at24->wp_gpio, 1);
>         mutex_unlock(&at24->lock);
>
>         pm_runtime_put(dev);
> --
> 2.7.4
>

Hi Claus,

gpiod_set_value_cansleep() doesn't complain if the passed descriptor
is NULL - it just quietly returns. Could you give me some more info on
how you trigger this warning?

Bart
