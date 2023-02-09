Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A681D6904FD
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 11:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjBIKfO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 05:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbjBIKez (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 05:34:55 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956AD6A70E
        for <linux-i2c@vger.kernel.org>; Thu,  9 Feb 2023 02:32:44 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-52bf225460cso19319707b3.4
        for <linux-i2c@vger.kernel.org>; Thu, 09 Feb 2023 02:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ryrOP+Qukz2gWs6turESQfJKOLpwVFYNNLXrnHrVZQY=;
        b=F7sa3S9sK7etrnQQ8t7WF7bIrtlcWNAAcWRnIr5JI9bZsLRFuhdLfkTwaoOO/0PliM
         CcwpfRuQ5mDBPeyejALwtcZQIAJiQGmaoBYmY65PUT4oiRIpVYMVChd1x9xLWKHwDX3m
         HRyVWX5mGPH1d/lbZVf9x3i+45G4d4f6FcaIPcukZUqF8vu5YkdDgOLQp2XZod+qeBX3
         UZNpMg0q+/ehO+jtguEnhIyMQ8Zfusv4mjNAurEnVhx9CbWlKIQPVytiqoP1UOqC/yVl
         GDdkMFiIQz1C5oOEdTDmYY1HLn7xuYhHdSuEcyo/juBWY1lRxaAvRMGR5/liQB8jo2lC
         JK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryrOP+Qukz2gWs6turESQfJKOLpwVFYNNLXrnHrVZQY=;
        b=Eaf73mxa8ZSQPYaVCIAsSDiJX2H/JpUPZXUdiiAHNMhkUJLr+jUm5A7emmwdyeXEUV
         hLTI6Udqaq9/3wBqu5tz/GN4tgc9oa6jQctg5sELmuPpi0ceIz4/beYWXt5qvoCCRymL
         JA684GOhGx5GT0XYGumPwpxNl6fD14ASBwFdR/4yDPI44qhyneezU6mkBAFRz35RxmIM
         S+VJzHMPDwmObciKu7E/g1/H5Efrhx08W3xkHQFVvmXGeNeZZqF5O2pqxJOWBklBy+tl
         1xeS7PaplwjgP5hbWoQvCzYLCtref6qaFXWZz97h2fFTRB8uVfESghn1bBlJLBKkjPTi
         pLJw==
X-Gm-Message-State: AO0yUKWp25MTEKLumTwVIvzZcjJCoWb1CyHQQIzFPVg/Q1BvDSXdcLB1
        xc7yCafjHh1Bth8CBfI59sRT5LWwVOJv6YjwupoSH90uAbDqO85I
X-Google-Smtp-Source: AK7set/O3Y8txaqL7+gEsfHlEj9Y6syky3ttsk99HfGCIdIEAIBlzyTr86ABauCWFAo+5omQD+SiRRaoPeOlfl7dh40=
X-Received: by 2002:a0d:e743:0:b0:50b:429e:a9ef with SMTP id
 q64-20020a0de743000000b0050b429ea9efmr1042797ywe.434.1675938758805; Thu, 09
 Feb 2023 02:32:38 -0800 (PST)
MIME-Version: 1.0
References: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
In-Reply-To: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Feb 2023 11:32:27 +0100
Message-ID: <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
Subject: Re: I2c GPIO Recovery with pinctrl strict mode
To:     Ryan.Wanner@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        Claudiu.Beznea@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 7, 2023 at 6:56 PM <Ryan.Wanner@microchip.com> wrote:

> My main issue is the process of freeing ownership of a pin(s) having
> another driver, in this case gpio, to take ownership then free that
> ownership back to the default state, in this case it would be back to
> i2c.
>
> I have tried calling pinmux_disable_setting() and then claiming the
> gpios then enabling them for recovery then disabling them again. This
> causes lots of warnings and some cases the full ownership is not
> transferred.
>
> It seems that what I am attempting to achieve is not doable currently.
> Is this the case or am I missing some extra things needing to prepare
> for this action?

There are several other i2c bus drivers doing this already, for example
drivers/i2c/busses/i2c-imx.c

The idea is to have some different pinctrl states and move between
them explicitly in the driver to move pins from i2c mode to GPIO
mode and back.

The imx driver depend on the ability of the i.MX pin controller to use
the pins as a certain function and GPIO at the same time.

This is due to the imx pin controller not setting the .strict attribute
on the struct pinmux_ops so that pins can be used in parallel for
i2c and GPIO and gpiod_get() will not fail. But the Atmel driver does
not set this so you should be fine I think.

Yours,
Linus Walleij
