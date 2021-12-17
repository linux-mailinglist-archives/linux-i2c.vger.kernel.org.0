Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EF9478D67
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237116AbhLQOVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:34 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40937 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237115AbhLQOVa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:30 -0500
Received: by mail-ot1-f50.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so3029507otj.7;
        Fri, 17 Dec 2021 06:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=9mHbdQJvEBq0GiZo1fgGbP6sxeF+R8bP3s4ARUmlceM=;
        b=WfztnDEcj/B8LERXlGJtWNfTa3SWBWs6bEIVz5TaT/tHi+CPcqDIyQRgCjqEtQy+hQ
         MEQNHTMSII7cVfKfYwEQzRTuJFjFk6oCoz/TVQiv9nQxayZdKoQ2KASno1tiYbYS8Bzd
         8ZvVw4UB+Wy8ZSWVTwLOcZlywOZ+VD4pvlS7NfjM1e1z3OhlW2izMfuprGO3zyG0G2Zl
         7Pf7ffTVxAfi+9gmkecVHEw/lVeWNbkr6kv+vtwwDonfpH73izgSQJaVzg6bip0BT6A1
         6xNiEJI2hIzWJY+kMpoWhTxpZX/cTVLdbh+iyd25lX0k5kn4/dJpATWUQORfmYfWrIVp
         oWjg==
X-Gm-Message-State: AOAM531qVLmKI6lam5aTVRuUHyEpdGbqBvUPoVizAqc5o52CSyLMsjTG
        4m//aGFIJUKqFwx/2UzU5Q==
X-Google-Smtp-Source: ABdhPJwLu1cahs9nnfu4oOkz5iiuYY7SC5BLMQnbEiip8MsUuVVsctpwE93dr/8mgw3nYP5dBsTa/A==
X-Received: by 2002:a05:6830:19c8:: with SMTP id p8mr2332811otp.111.1639750889734;
        Fri, 17 Dec 2021 06:21:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o11sm1659326oiv.10.2021.12.17.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:29 -0800 (PST)
Received: (nullmailer pid 2814891 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        ivan.griffin@microchip.com, u.kleine-koenig@pengutronix.de,
        linux-spi@vger.kernel.org, bgolaszewski@baylibre.com,
        aou@eecs.berkeley.edu, atish.patra@wdc.com, palmer@dabbelt.com,
        daire.mcnamara@microchip.com, krzysztof.kozlowski@canonical.com,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        geert@linux-m68k.org, lewis.hanly@microchip.com,
        linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
        jassisinghbrar@gmail.com, bin.meng@windriver.com,
        linus.walleij@linaro.org, paul.walmsley@sifive.com,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pwm@vger.kernel.org,
        heiko@sntech.de, linux-gpio@vger.kernel.org, broonie@kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        lee.jones@linaro.org, a.zummo@towertech.it
In-Reply-To: <20211217093325.30612-13-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-13-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 12/17] dt-bindings: pwm: add microchip corePWM binding
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.709047.2814890.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:20 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569853

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

