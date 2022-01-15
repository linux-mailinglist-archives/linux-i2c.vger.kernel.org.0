Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AFC48F86C
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbiAORXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:23:06 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37721 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbiAORWn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:43 -0500
Received: by mail-ot1-f41.google.com with SMTP id i7-20020a9d68c7000000b0059396529af8so7452794oto.4;
        Sat, 15 Jan 2022 09:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=CYssEdn4U+D0DKxBFx9coxO44MoyGtGFbzFuFgNIr2E=;
        b=CCTfC01GdzyJC37rJMmrClsZ2vrBV5MvcluOVANBOWa6N4sBJKGUHn4DeenEM7jOvY
         nzx13joZ7XzSg3a4MNNbVVOHXxX7l1o4fDeiIyaMjWE1FievrEwgvRaQFnEc8Y2ACl8K
         gPmmo4gm7ve8co5dVP7eB0x13sk9MA7hNXIdIxHB9YlUOokhgbN8qmgX6PBbER3Jvf94
         QWmsN1Q7R9eF2/Ynsgv5qp7l+/JbW71FjNxroBy3L/8kBYmil1KWY8LZL5OmASpGvNbR
         BlAC+AnTyJsZb/813yJ2kTrSCtQOQqjcIZC+dj2DE0irrKa3G23b6DLeUFlpLpA1fJR+
         C3uQ==
X-Gm-Message-State: AOAM533IACwg1GhlTyCaOrLY/OGl5Fo7EYIXWxiO5ujOwfBLagST1oPm
        MWuHbQ5MO8cFtrlsJDlvTw==
X-Google-Smtp-Source: ABdhPJxa0Y95SAgsnFgvzW2QXkzA/LkZ4mlEhY1BKNnbCRyfZlp+mRbzX6AfmWmwF/mz5bmb22E9Bg==
X-Received: by 2002:a05:6830:4393:: with SMTP id s19mr10668275otv.272.1642267362255;
        Sat, 15 Jan 2022 09:22:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n26sm3426650ooc.48.2022.01.15.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:41 -0800 (PST)
Received: (nullmailer pid 119892 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     heiko@sntech.de, daire.mcnamara@microchip.com, palmer@dabbelt.com,
        bgolaszewski@baylibre.com, alexandre.belloni@bootlin.com,
        linux-pwm@vger.kernel.org, bin.meng@windriver.com,
        linux-riscv@lists.infradead.org, robh+dt@kernel.org,
        atishp@rivosinc.com, broonie@kernel.org, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, thierry.reding@gmail.com,
        linux-spi@vger.kernel.org, ivan.griffin@microchip.com,
        gregkh@linuxfoundation.org, linux-crypto@vger.kernel.org,
        lewis.hanly@microchip.com, u.kleine-koenig@pengutronix.de,
        jassisinghbrar@gmail.com, krzysztof.kozlowski@canonical.com,
        a.zummo@towertech.it, linux-usb@vger.kernel.org,
        paul.walmsley@sifive.com, linux-rtc@vger.kernel.org,
        geert@linux-m68k.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        aou@eecs.berkeley.edu, devicetree@vger.kernel.org
In-Reply-To: <20220114151727.2319915-10-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-10-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 09/15] dt-bindings: pwm: add microchip corepwm binding
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.939328.119891.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:21 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pwm/microchip,corepwm.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/pwm/microchip,corepwm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580131

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

