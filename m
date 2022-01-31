Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4237B4A4AC4
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 16:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376980AbiAaPjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 10:39:42 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39228 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359303AbiAaPjm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 10:39:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9F804B82B58;
        Mon, 31 Jan 2022 15:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CEDC340F9;
        Mon, 31 Jan 2022 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643643579;
        bh=S+JVtyhrSwII/6pN71WYrrMXzhomHDBQD0dIDcv+A3s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b1bUpP7W0k8lVttZ79Iy9olvsgkhxTgxATRvcRr3Yn++XSImeY+aAYItRLoNsUxCF
         1DbgVjAgQUGTcST3UO8HkeNzjtQRzl5Fhj0evS+VAtTBDnMPzZpMZcwYGxL9waoO6/
         Bbn2yqPJj0wrPJWCDChZLm9jYaiVPUEYdjJkZaPBYjapPqgggBVxlYRZkcCPaRuRZk
         mtMF7V/p+gU9vC+68lsK7PQ02AZCvZNym99dMIan517mkVqxyBK0BIXRGOZ4s5mVt3
         iwv6hqfyShk4glxkPv1UETPuRTFwZ2ADflyV38JIMwUNQ/+D36xDYvW/xHAM2WSi4X
         J3rBA9txv1I2A==
Received: by mail-qt1-f178.google.com with SMTP id e16so11732186qtq.6;
        Mon, 31 Jan 2022 07:39:39 -0800 (PST)
X-Gm-Message-State: AOAM5334gQ22ptm/SP/4L9dY7+9D3+LYDgUTiqBCsFJzNwZAEBv44uTy
        hAIK8z6IOtytIss6+QTpjSJyvKzALGeXY0fQTg==
X-Google-Smtp-Source: ABdhPJxu+B59w9DW0M1geYs68HEGp28ZLv4SyMZIUN/C1CH9RYxmLWUL6y5b/4WKDRWIhQTI6X5cawEeoSNHZY1s0PM=
X-Received: by 2002:ac8:5b86:: with SMTP id a6mr8557369qta.511.1643643578122;
 Mon, 31 Jan 2022 07:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20220131114726.973690-1-conor.dooley@microchip.com> <20220131114726.973690-4-conor.dooley@microchip.com>
In-Reply-To: <20220131114726.973690-4-conor.dooley@microchip.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 31 Jan 2022 09:39:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
Message-ID: <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bin Meng <bin.meng@windriver.com>,
        "heiko@sntech.de" <heiko@sntech.de>, lewis.hanly@microchip.com,
        Daire McNamara <daire.mcnamara@microchip.com>,
        ivan.griffin@microchip.com, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 5:45 AM <conor.dooley@microchip.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>

There should not be a blank line here.

Also, tags should be in chronological order typically. If Daire sent
this patch out with my tag, then the order is correct. If I gave it on
a version you sent, then it goes between Daire's and your S-o-b which
is the case here.


Rob

> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
