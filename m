Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8277C5817
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 17:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbjJKP32 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 11:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbjJKP31 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 11:29:27 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C0B98;
        Wed, 11 Oct 2023 08:29:25 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-41995d42c3bso40166761cf.1;
        Wed, 11 Oct 2023 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697038165; x=1697642965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imCCA7DakwDxzYV11UqAPthoUq03kJ6YJGNQode/mmg=;
        b=lC5/RnHuawFRhYcYgm/Ry7MYJIFQpvWeYmJmRK/0SpyDaQdhjyVjTZhT56V5E+TZ3s
         1BLYKcbBjHOR1m7NL47gYGIuyQW1PPo87qORQ4UrTQz0+VzB78oI8FHGmO66zZjgsrhI
         /Wda1flwtvpbKvwmB3W/ptNU4VTJBCzCMt6YHdg6iTjQwCybPpDDevvDl32SmFe+H6Of
         ZtOQ2J9XvrYa3cqwgrF0GIaHr0pIpzi766NkRFkLE2KF3/L5lP4ytdY+dTBCedG0n6VI
         HSKbhzT2LS9Oz6Xpo3nJDPwscEYK/V0trf02HtH5axBMQnKOBm/M8zYoA5FooqUdy1th
         wIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038165; x=1697642965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imCCA7DakwDxzYV11UqAPthoUq03kJ6YJGNQode/mmg=;
        b=uGAz4STJDsYYrSkg+7hoD7XkmtX5EkFiC7dBlXTho/4sxiK4e0pxUO6ms/TUlKUjO6
         1JWV4S4YW28DYRO560Qd0NDoIMRTsN3q/bGNZpGllp88CyVKyNUiLxREz+DdtOczo8mE
         pmRL5spQW/6xoJt60Py+g17w3yp244Y58FZMwJD76XdX6+hzMIN6zW1a6ydcmMMbRB/0
         plZVbEMHA2JiaNItcW1SFOQTa2enaE7oO/iYWQPCWpd8i9MgN9xT5BJIAuaNglJMV8iL
         7agUjFo/QCZcwl8aZXQyVev6k+MXlAOkJzRUzavP3hGAR90qQY2XIVv4LhvIRCA02ozM
         w48Q==
X-Gm-Message-State: AOJu0YwC3AMx/M/HftrT5zH5KT7LtbSa4diIqaM/sM7yW0B3EOJVj3g5
        QcSftE373XT5Kpy2TZgZht7UUK1rJ2nvVpC9woUedc4Qbz68Ig==
X-Google-Smtp-Source: AGHT+IEAzqMjeH9UwRF9PuSAiHUf5DeYMyZA1g5C5NwUNKZu30JSKv4KnjceoL7poApVhDSk+hzRFxZvGmcAAqy8dD4=
X-Received: by 2002:a05:622a:1ba9:b0:418:a58:1cd2 with SMTP id
 bp41-20020a05622a1ba900b004180a581cd2mr22473357qtb.51.1697038164904; Wed, 11
 Oct 2023 08:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-3-brgl@bgdev.pl>
In-Reply-To: <20231011130204.52265-3-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Oct 2023 18:28:48 +0300
Message-ID: <CAHp75VeaWen+Njiku-bBteF9YsM2ZL7m6MCvky2C8GKiEfTG2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: provide gpiod_to_gpio_device()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 11, 2023 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

...

> +struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc)
> +{
> +       if (!desc)
> +               return NULL;
> +
> +       return desc->gdev;

Wondering if we may use (part of) the validate_desc() (in a form of
VALIDATE_DESC_VOID() macro call).

> +}

--=20
With Best Regards,
Andy Shevchenko
