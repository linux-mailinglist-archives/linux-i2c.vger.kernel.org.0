Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A87069BDF2
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Feb 2023 00:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjBRX37 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Feb 2023 18:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBRX36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Feb 2023 18:29:58 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE3D1206D
        for <linux-i2c@vger.kernel.org>; Sat, 18 Feb 2023 15:29:57 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-53683d0eacfso20225227b3.1
        for <linux-i2c@vger.kernel.org>; Sat, 18 Feb 2023 15:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz5DzYr/Opa8OtY4Tzu39Y9aDuWD1hSn8O8cPqW8lso=;
        b=omb2A12qU7J8gN8cUyq0r2MdWs6Zk0tq96wdGCDEd/pf1ia4HVnj01jxwsB7Ktaf6t
         ch17n2ssXiWutDHJG1MGrT0NjO8sMVa5u0D93JgJhyyWuJCXHlioCCUnCcopD2gB0Kax
         FY/nAr2jFoFbaXNYj9SAa6wyDlTDcio1/bARURQ+FmM+1rEi6HjQ1j186Bp2qhNE2NX2
         DEB49y2qVLbEaKv9ZmuQlllVQpI9GXjgWJYWWspsWMQCgGw6F/TYscrXtHT2zRjNRBie
         VTrcDdh/sRPeRzh6d1Vroz4ih0SFwpMOcEHwgTc0LVcsVF0j2jNu9845BOv5bIfYEtMS
         nCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz5DzYr/Opa8OtY4Tzu39Y9aDuWD1hSn8O8cPqW8lso=;
        b=ZjSxq43wCUE0FwXDHdKvr+ZvIGuap8JUhbKgm3WUbgLOWqdL5DDGLO1lgPVJv6YVAD
         bxQvDj99da5LAWtB/3eKicM4XGcF71XoDBEP9FE25ac8jcRtFn2ddo/JRmypmC+QAqGu
         lxSURaqpi9KPJaBd61jnbMzfzhCWfG1M+6OIOVWdO71Pu212O1+nu/U50h4SgMLj8ww7
         WTNReIh9tRO1ySs1XrZWpj33A9jitHECD0ombEoXhMTuzMmoB9hqTpAkhx5wXiRxdQhz
         KcT5ziOWuCORjkLV5CR9jxx9dy1dfY4qtGrutqfaRRxX3UgZbbC3dGqfMc7vrtswpTUU
         qDAg==
X-Gm-Message-State: AO0yUKWjCM/i6FdZmpdgAR47rcOqagFoHXoff289s5XEJbCU+Yail49Z
        jGP09KQO5rjVHbFvHbqyf0VPw1x233zJZEXhXNjhwQ==
X-Google-Smtp-Source: AK7set/olNwKNK7HfjBrvB6nqfSSaLih+5uqgsaTvGCT3Mx5SRBygrVNZ9jBq1XWy8aWrrVifm4XLTxRGdk/YB3HlUs=
X-Received: by 2002:a0d:dfc1:0:b0:52e:d00a:263b with SMTP id
 i184-20020a0ddfc1000000b0052ed00a263bmr2152556ywe.35.1676762995905; Sat, 18
 Feb 2023 15:29:55 -0800 (PST)
MIME-Version: 1.0
References: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
 <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
 <961a2164-640a-86b5-980f-73668eb161e4@microchip.com> <CACRpkdaKYN9eRtuOhBBp_50sR71AQvNSKtjAR1RZPhaKYhfJVw@mail.gmail.com>
 <46dd4d9a-7dc8-48f9-69d4-d18ca6433acc@microchip.com>
In-Reply-To: <46dd4d9a-7dc8-48f9-69d4-d18ca6433acc@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Feb 2023 00:29:43 +0100
Message-ID: <CACRpkdZg4t=0YUiwk4ik6VKXH1KCo_RLXoyL30yrxM+e9QqH-w@mail.gmail.com>
Subject: Re: I2c GPIO Recovery with pinctrl strict mode
To:     Ryan.Wanner@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        Claudiu.Beznea@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 17, 2023 at 6:36 PM <Ryan.Wanner@microchip.com> wrote:
> On 2/13/23 02:29, Linus Walleij wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Fri, Feb 10, 2023 at 4:21 PM <Ryan.Wanner@microchip.com> wrote:
> >
> >> I am trying to enable .strict in the Atmel pinctrl driver, and that is
> >> what is causing my issues.
> >
> > Strictly speaking (ha!) that flag is for when you *cannot* use a pin
> > in GPIO mode at the same time as another mode.
> >
> > Example: if you use the pin in I2C mode, then reading the GPIO
> > input register will *not* reflect the value on the electrical line,
> > because it has been decoupled physically. Then .strict should
> > be true.
> >
> > The strict mode was not intended for policy, i.e. stopping kernel
> > developers from doing wrong things. They have enough tools to
> > do wrong things anyway, one more or less doesn't matter.
>
> I understand, so .strict keeps the pins mapped to one ownership,
> so if I2C has those pins GPIO could not have access to them.
>
> When it comes to I2c recovery, looking at the I2C generic recovery,
> the pins are both being used by the I2C and the GPIO at the same time.
> This cannot happen with strict mode. So since I am enabling strict mode
> for pinctrl-atmel-pio4.c I2C recovery cannot work?

I think it can, you just have to be more careful.

You can move the pins between different states. E.g. state
"A" and "B", so these states can be "GPIO mode" and "I2C mode".
In "GPIO mode" the pins are muxed to the GPIO block, and in
the "I2C mode" the pins are muxed to the I2C block.

Whether one or other of these modes in practice has an opaque
name like "default" or "init" (etc) is just confusing, the only reason
these named states exist is for convenience. It is perfectly legal
for a pin controller and driver to use states named "foo"
or "bar" and never use any state called "default".
(See further include/linux/pinctrl/pinctrl-state.h)

So what you want in your driver is something like:

struct pinctrl_state *gpio_state;
struct pinctrl_state *i2c_state;

(possibly more)

And before normal operations you issue:

pinctrl_select_state(p, i2c_state);

And before recovery you issue:

pinctrl_select_state(p, gpio_state);

... then you use GPIO abstractions to do the recovery
followed by

pinctrl_select_state(p, i2c_state);

To get back to normal operations.

This is the gist of it. The problem with using GPIO at the
same time as pin control is that some pin controllers
implement a "shortcut" which is the
struct pinmux_ops callbacks
.gpio_request_enable()
.gpio_disable_free()
.gpio_set_direction()

These callbacks will bypass the state selection and mux
pins directly as a byproduct of using gpiod_*() operations.

For example qualcomm does not implement these callbacks,
and all GPIO state setup is done explicitly for every single
GPIO pin. This is quite good, but also a bit tedious for the
common cases which is why the shortcuts exist.

If the pin controller has implemented these operations
you get a problem with recovery because the GPIO
calls may start to conflict with the state-selected muxing.

It can however be made to work also in that case as long
as you think things over, but order of semantics will come
into play: you probably need to get the GPIO *before*
doing pinctrl_select_state(p, i2c_state); the first time,
lest the gpio initialization will unselect the I2C state.

You probably also shouldn't mess with calling any
gpiod_direction_input/output in the recovery code.
Hopefully that can be avoided or replaced by more
explicit pin control states in that case.

This becomes a bit complex, but recovery is a bit
complex and out of the ordinary, so...

Yours,
Linus Walleij
