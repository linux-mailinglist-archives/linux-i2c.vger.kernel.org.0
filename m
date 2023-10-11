Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407DC7C57F2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 17:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbjJKPTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 11:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjJKPTV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 11:19:21 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9235F9D;
        Wed, 11 Oct 2023 08:19:20 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-65af72cf9e7so38350296d6.0;
        Wed, 11 Oct 2023 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697037559; x=1697642359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ubH8v2ijBahJkIz+oxOsK92cP2ddb/73tUz6k3EeH0=;
        b=CU8QEqjLcJ585iE746kEeUXkN/9Aa4oR/iDFo7BrALvqZLvrKNMWLP8bKVM8reI34F
         SYogQqd0q6v0NKfjNacSTpGBfXIEAM95dl8sZZ5GicrOdXIbuyhD44viW80+Rj+oZbQZ
         gGTTRZBhBM2dmdUT1ayBKz/J+87hoVj81KqqMoZzRvYQezzOas7WnQPTsgAx3HeiqWiQ
         pmJ0xr9GOe5TPNceuLCb/zedeAqiU40ippOEcC0hu+IdkYMZ2YQLF1aMlBM+q594BqbM
         6WZvxpZJJXoi4CgoyQ0g4P5+96lptuB0+AnOS2XLYR4A9PXKfDnPnCMR2+qISz2OUbcC
         W2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697037559; x=1697642359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ubH8v2ijBahJkIz+oxOsK92cP2ddb/73tUz6k3EeH0=;
        b=NtvJ+gg/BcPFOariard0x4QePf1PYB2GY1wCygJ2VqJgR0ylIMXO4c2thicCHNrxJj
         nCexeM8scjIQ/W5ebelJqVc0kiNZgf8Lm9FlIYimHgqkR4/WOWBJoOjfjpPEVuITHXG1
         nOHC6djZdNVRCQJ1gmR0UUgfcUztTT9/ukgQd3GqIJWcgmW9p5QQ0EqATnv7Ehqd7GRM
         m6dlNzE53YAwYiA12uQQh0SEYtlIz8C0cMwEy5HxrodlUMFzaH1M7I7+wIzmb6uDtZB+
         Ste6kv+SvPu3xgIhOmu61FQA0/fOTEOW4YpTJJajceqeNS6gONrAAv0RX+M+LRG/s50r
         5o4g==
X-Gm-Message-State: AOJu0Yy6qOzU8L5yTAeQPbVB/BLSlelNEPHAb4zdmo4RttHgK9L2NgDk
        i80yeuAwtE3kPsofGvXeQnhhZLGWM876iJev4h7pZWL35mAi+w==
X-Google-Smtp-Source: AGHT+IHYMijaBD8Hc2ztWCzvTCByqMCWNl8rs/DdnPQ1bxxoCGfy0kIQas5Si7gy/CQrKajmE0i/kI2KTwgvV681SS8=
X-Received: by 2002:a05:6214:5503:b0:65b:154d:facf with SMTP id
 mb3-20020a056214550300b0065b154dfacfmr20915296qvb.59.1697037559726; Wed, 11
 Oct 2023 08:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-2-brgl@bgdev.pl>
In-Reply-To: <20231011130204.52265-2-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Oct 2023 18:18:43 +0300
Message-ID: <CAHp75VdwUU4+Dy1Y15edq7Zm2=Z604xxqFaJ+F1K8aJckn707Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: provide gpio_device_to_device()
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
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are users in the kernel who need to retrieve the address of the
> struct device backing the GPIO device. Currently they needlessly poke in
> the internals of GPIOLIB. Add a dedicated getter function.

...

> +struct device *gpio_device_to_device(struct gpio_device *gdev)

Hmm... Maybe gpio_device_to_dev()?

Whatever, good enough to me
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


--
With Best Regards,
Andy Shevchenko...
