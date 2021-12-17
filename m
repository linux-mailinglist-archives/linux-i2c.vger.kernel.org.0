Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5716478D56
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbhLQOV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:26 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:36681 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbhLQOVZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:25 -0500
Received: by mail-oo1-f49.google.com with SMTP id g11-20020a4a754b000000b002c679a02b18so755304oof.3;
        Fri, 17 Dec 2021 06:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=wkAFS0gqpntm7Rar5jEd8yMr1SM1y7rL2Y3F6yNnnb4=;
        b=k935k5Anz7Xn7aGBCjSM8vAj+UCjUY0CB1Gf9zn5u6VQ9PaJQn9WQtcQlxNQUK7hW2
         fxxsOVrxVUOBmbDJHOmIARH5GWfcoHlGsEqVfqzf01pSZq0dY1xJOsKMzaHgsHHt+lB1
         r+ect8hQqRJBFy0sTQLl/Rzflv7WydU8xORiKpddH+UNHQT+jfrX+W1BxcFpjX9KXwL+
         huSoY5WRkyGIAt02y4lpML51pZMgDX1zJGYZ9sLxlCD5mnXuUj/6bXFbrKBCavw0UFw1
         sboXI7IpjV0zudEAVa/cZSBKR6O+G9f5j6BdYdoKKj+oUjzElSj99HwZSjpS8O//V2Y9
         fcew==
X-Gm-Message-State: AOAM531KQPIy7busCEZtXkHGho3c+L9zF4N7DUNQG/uEhjpYCO4EFDUJ
        A+dI6z06UyLNUiIQSqjSkg==
X-Google-Smtp-Source: ABdhPJwfsjVeZSJcEumwC7rI8OiKwXwCweJpgTsSim/Ubs2nJHyVI3S60NqCJLQl/ivrLxwO2ySB9A==
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr2047389oos.25.1639750884738;
        Fri, 17 Dec 2021 06:21:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q2sm1672622otg.64.2021.12.17.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:24 -0800 (PST)
Received: (nullmailer pid 2814878 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     jassisinghbrar@gmail.com, alexandre.belloni@bootlin.com,
        atish.patra@wdc.com, linux-rtc@vger.kernel.org,
        a.zummo@towertech.it, lee.jones@linaro.org,
        linux-i2c@vger.kernel.org, ivan.griffin@microchip.com,
        devicetree@vger.kernel.org, daire.mcnamara@microchip.com,
        palmer@dabbelt.com, robh+dt@kernel.org, bgolaszewski@baylibre.com,
        heiko@sntech.de, linux-spi@vger.kernel.org,
        linux-crypto@vger.kernel.org, thierry.reding@gmail.com,
        linux-gpio@vger.kernel.org, broonie@kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linus.walleij@linaro.org, aou@eecs.berkeley.edu,
        linux-usb@vger.kernel.org, bin.meng@windriver.com,
        geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
        lewis.hanly@microchip.com, paul.walmsley@sifive.com,
        u.kleine-koenig@pengutronix.de, gregkh@linuxfoundation.org,
        linux-riscv@lists.infradead.org
In-Reply-To: <20211217093325.30612-3-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-3-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 02/17] dt-bindings: soc/microchip: update syscontroller compatibles
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.632899.2814877.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:10 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
>  ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>  rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.example.dt.yaml:0:0: /example-0/soc/mailbox@37020000: failed to match any schema with compatible: ['mpfs-mailbox']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1569804

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

