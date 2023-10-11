Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4527C583A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 17:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbjJKPjo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 11:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbjJKPjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 11:39:43 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7EA93
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 08:39:41 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d865854ef96so7508821276.2
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697038780; x=1697643580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6TGfEyuvebEaZWUEyk1hloX7p7Dxc5o+Os6nRYfszo=;
        b=GKXU7aHMZbeUt/6olc/O7S9ViGQAWK+gccLEvbvxJA3XyvoOwSIALXLQODvO+V3PBo
         ruQohI6UqYYi39Q6lMf2Ko7EQoejFP6BYtyjhGrUpedSrbpx0CKP9YQFoE9l+1paqw8o
         tMBhGFWMqVoR4fvkT1ZSbPKP7UP38UwZIvIubP1hZICPd0tJgAowI7X6Is1buIpYKOTs
         V8ox0uxBMy1GxHmZTB4JlVoUVqn14IUTtp08Gb5fbFSXCWtwiD8qKRx+GoQJtpNEgeWU
         Tjx6uR/yGNPc7XM+jXYsqRmDuKlABhNVdiv3oaEnk6XNpGIM7XUM0XuLfjLpaQtuOylO
         Do6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038780; x=1697643580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6TGfEyuvebEaZWUEyk1hloX7p7Dxc5o+Os6nRYfszo=;
        b=BaaVcpSdI1ruvUf6N+w4YWpz8pt0CskV6KFk2MkHjAwdjacCW+mlXFLgjFY5G5BbXf
         Wy0F4K7DQH+Otc4EwlZfM8p09DU2W/d9pepco/XuLZxRzIavLPvBfGItHDS3AfIbszJh
         wyv9ztzDYwavNVWXaaz+MV2WadW7mkckmtop7pbSHemXlVQZmtDWbB+NaFw+/Z7EuhkD
         aIuivhn1tPZ8sw2VEKQBgnAfLp6plOKhM3Mgi6AqaXmZh2B4nzJpTm0ukWo+L5wFL/NE
         AwVYInKHb0j3uX3nB/knXe7DTdevnNJvSgzYn/ub8/FnZ10KHTRP9tESVhk1D3AqZS8j
         MEkw==
X-Gm-Message-State: AOJu0Yzwlat2XrqqaWVNKOeSgcRbZSD0rzGnsJdz3o3bELJl9V4LAejM
        kuhuHmGX/NN2O7YPZtOUq5dLLXRiF84UQ9J042fJlA==
X-Google-Smtp-Source: AGHT+IHNy4ujK7ZBjaTedMwtwhKKTRRoQvdHX8r5Shdstx65sswCfVmN1phjaC0SnvMmMIdAiccUCCAdyYoYsU/BmmY=
X-Received: by 2002:a25:8d8b:0:b0:d78:1724:1b1a with SMTP id
 o11-20020a258d8b000000b00d7817241b1amr19199871ybl.37.1697038780668; Wed, 11
 Oct 2023 08:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-3-brgl@bgdev.pl>
 <CAHp75Vc2vGEYmbaurzEoh-ejkvFwGeo98LtAGvEq5idXNPgnRQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc2vGEYmbaurzEoh-ejkvFwGeo98LtAGvEq5idXNPgnRQ@mail.gmail.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 11 Oct 2023 17:39:29 +0200
Message-ID: <CACMJSetxih3kwAVDpQNm_fApgdkOv-XfErqC8+hi7Nac4J+ZOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: provide gpiod_to_gpio_device()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 11 Oct 2023 at 17:23, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
>
> On Wed, Oct 11, 2023 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Accessing struct gpio_chip backing a GPIO device is only allowed for th=
e
> > actual providers of that chip.
> >
> > Similarly to how we introduced gpio_device_find() in order to replace
> > the abused gpiochip_find(), let's introduce a counterpart to
> > gpiod_to_chip() that returns a reference to the GPIO device owning the
> > descriptor. This is done in order to later remove gpiod_to_chip()
> > entirely.
>
> My concern with this API is the following scenario:
> 1. One driver requests the GPIO descriptor.
> 2. Another driver does take an arbitrary number, converts to a
> descriptor and calls for this API.
>
> Is there any (potential) problem?

YES! And I have it already on my TODO list! But it's great to know I'm
not the only one seeing it.

Basically we need to

The end-goal should be to make gpio_to_desc() an internal GPIOLIB
symbol. There are still around 10 users outside drivers/gpio/ that
will need to be addressed in one way or another. Preferably by being
converted to using descriptors.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
