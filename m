Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF2C77F0C8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 09:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjHQG7i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 02:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238931AbjHQG7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 02:59:11 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0086D1990
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 23:59:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7260fae148so979135276.1
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 23:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692255549; x=1692860349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRAHHehPFKdyr5YnXRiLjnh+UaG2zDBxdwcL8glV9iA=;
        b=CTkdWOoILiIuRr0w4mv7A8juuL0UUMqd2hEbJIfIK8c8qklxOH5G9wSSRoRKQTdrKH
         N61IzAqEgTfY+KNWPRF+8ul1VE86nYbxfueU6sD/n3usKJ++R/MKc8UG2QaSK8iCqVDC
         iPZMJ+1sFz6ydKF8FnGWYISpLkrYgDbKoR7FAVEav8MUbQXS8Y0lgCs9RlZ23nZ+MGvY
         juBW+I/jEO3vBeIgwtA48aPJTkSgppiQHo585CgNNkVBT9dOU7/hzKA6xjUp3MoRZ0KZ
         lyNJHkKiAz2Y38vB5dK6lL/5sKDzuA9PJtWCn+qZPHcUe5EBVfq7Sb8fT94NcFqTM1a0
         kh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692255549; x=1692860349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRAHHehPFKdyr5YnXRiLjnh+UaG2zDBxdwcL8glV9iA=;
        b=WkpxNk2F1wxoOs3HyZ8uMuz9G5FvLY0zJ+liL1PaBvGuyZndcB5Ze5XtbElCDZbyf0
         Th+I+h4dpoTn18CljPs4CjKrZOpxDdPtc8+85MIA8eX/OfEuDXw/FLdW6e6tWDyiM7i4
         9STxRGtgQZ7PSR1m7HBHoTozkPD8ty27qiFn65CBaDJQq50wm03llguLb2aO7Z2cnwsp
         1zyZQRckypqAKL8LKGKzjGEJjDd7Q70mmniBSKHRFNUqxkxQ7MXr/M1uwV7nxsjfL5s5
         BSyn728alyhsKZN1g2Df5TIUsEOVaR15yXG4T6Up0lZfM8Gg0Mq4aow6kTdhyiGxhWzG
         emIA==
X-Gm-Message-State: AOJu0Yy70O5KHm7qipS6rC9wB5ZbC9ZBAu0b14UCLdokx9f4CgvbjMLN
        4vh2TWZ67D3twgUKsXt5H2KCgDD8LBLgetIBdu728w==
X-Google-Smtp-Source: AGHT+IGpYhRHya6xrz95w/CwNRF7nyGsyh3/msYYVNs4qq390dBXzA07kXvg8La4CX/ZPPAZ5o4fuDb1JiF7o1TIL+A=
X-Received: by 2002:a5b:e8f:0:b0:d49:bfe4:9c50 with SMTP id
 z15-20020a5b0e8f000000b00d49bfe49c50mr3803365ybr.18.1692255549206; Wed, 16
 Aug 2023 23:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
In-Reply-To: <20230817022018.3527570-1-ruanjinjie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Aug 2023 08:58:57 +0200
Message-ID: <CACRpkdYaociodweVRFn+bS4+BoCkLMEa=+xjGTJaPZ3pquY1EQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] I2C: Fix return value check for devm_pinctrl_get()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Yang Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 17, 2023 at 4:21=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:

> The devm_pinctrl_get() function returns error pointers and never
> returns NULL. Update the checks accordingly.
>
> Fixes: 543aa2c4da8b ("i2c: at91: Move to generic GPIO bus recovery")
> Fixes: fd8961c5ba9e ("i2c: imx: make bus recovery through pinctrl optiona=
l")
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

That's right.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this Ruan!

Yours,
Linus Walleij
