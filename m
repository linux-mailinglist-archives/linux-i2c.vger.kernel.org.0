Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD1A7C57FC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 17:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjJKPXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 11:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbjJKPXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 11:23:41 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55D7B0;
        Wed, 11 Oct 2023 08:23:39 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a7ac4c3666so33791037b3.3;
        Wed, 11 Oct 2023 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697037819; x=1697642619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJCIl+nCi9GyDe9FE2ViGwShj1wgWm0qzMtG1cCyYmQ=;
        b=QA/Qd69eFx91Op3l/anNpE57S2twr4AHR0TN7JNfAaxEOBtLYx4hvHIvxwmXNAlAHF
         FHByMraqoA/FgieDAaq18JdHaId+wL+jORDPY74dok/t5k3e1eHHaBlNPibyTNPOGJUd
         yLd1YlIqWaBmRIH9rUuL4eKUGvzGurzLrt79IsRlmwm+PDVEhrMrwmubEv1OP2pYfJF0
         9o1s6bLD/uqe1mHDtyaUks4Hmnyza8lFANy9SrgemW8W/BX/qWcXmXd2vfjw5Fp1yxTC
         KAepK2LkA77Xi1zS0eZxIvNg7NVE6uXhqqQQ1Hk+YVOj8AlKJb0Sr2slcD/OMkzLfMj9
         znXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697037819; x=1697642619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJCIl+nCi9GyDe9FE2ViGwShj1wgWm0qzMtG1cCyYmQ=;
        b=BbuL52NWe/D6KkR+Y8lW3EiEtGBni48ZJbQNpYlO3tlKWUEXr4pkI70l3L3cJUfQnB
         F/C6YRUULa8PTLyGwOeMhT5OuvY4+3VPd9SXTKuhlySG1Erd/UByLCIEongz7bq+cSZF
         mKJZFsU0HQ4i/m/Fa/9pll1QkoO1xCIzPEYdsFU8ebzVKLYegxOPmqC5KpGbbUQibkhN
         zrV4bCXL7dKMpVrzjPGA3v/F9/CW62zao9ulRu86k/Cqog7B/noY7Cho8xpZ9hcgT8Qa
         ljsgbuY/pT1/tn3B4q3IWnmXXPYHdqe5VsWIxySCkzd90c1faZ7LdMysED2tl4xjD4Bp
         Uo9Q==
X-Gm-Message-State: AOJu0Yzb0FfiTb7VCy7/dz+k3ce4nAZpm8AGh4aFjiNJPsyg69zCvF9+
        yCFJaFVh+y/xSjC4gq82X7HGB0185AQI5nX7nw4=
X-Google-Smtp-Source: AGHT+IGn9HtNQgXzPZdmG5qrrnqmduk20tLZgosvq5bC1yElCH+5zWxf6Zy2q+1y/qyogRFcZi+XEOTeJfhia7mqCCM=
X-Received: by 2002:a81:6c4a:0:b0:5a7:bf52:8bcf with SMTP id
 h71-20020a816c4a000000b005a7bf528bcfmr5425844ywc.5.1697037819016; Wed, 11 Oct
 2023 08:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-3-brgl@bgdev.pl>
In-Reply-To: <20231011130204.52265-3-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Oct 2023 18:23:02 +0300
Message-ID: <CAHp75Vc2vGEYmbaurzEoh-ejkvFwGeo98LtAGvEq5idXNPgnRQ@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 11, 2023 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Accessing struct gpio_chip backing a GPIO device is only allowed for the
> actual providers of that chip.
>
> Similarly to how we introduced gpio_device_find() in order to replace
> the abused gpiochip_find(), let's introduce a counterpart to
> gpiod_to_chip() that returns a reference to the GPIO device owning the
> descriptor. This is done in order to later remove gpiod_to_chip()
> entirely.

My concern with this API is the following scenario:
1. One driver requests the GPIO descriptor.
2. Another driver does take an arbitrary number, converts to a
descriptor and calls for this API.

Is there any (potential) problem?

--=20
With Best Regards,
Andy Shevchenko
