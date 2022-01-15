Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AA648F872
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbiAORXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:23:07 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:45848 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbiAORWv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:51 -0500
Received: by mail-oi1-f181.google.com with SMTP id t9so16985486oie.12;
        Sat, 15 Jan 2022 09:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=/ryk+C/4VJdMzNIa1mhcDuVOv8zspRXPYMFSmvgLva4=;
        b=dbo91IH1WOdoQRW4fMEg0oaOHonxPXwHE6RfWw3F3udvjzvslHT3HYZ9xYnevsIJ8T
         iN/t8LZIAGD7ocsSWgpMnSHezn8vrd1ITZSSbBYATVaNrfryq6RvtnvJvib4t58NgEYz
         3PUsTRcNptIwoAHd16fPEHjhQiZawVPlxmqXRx+UeTQf08l7GjT2ZO7zgduZICuux++9
         nSuPIr9cTm0bqrgczhFrTpQrX3ldT2O1YpOXZNeEe1LYoftzrQe53Y67x0lLVQYzNw+N
         i83wMC9zVAt1uoLgOopEaCISgY53qWtP/8GApMYHwM8nGYlWN1D+qaFWLCD+9E5GRplZ
         2imQ==
X-Gm-Message-State: AOAM530UF3Xyeerso0QM9mEwQzIP22rIRRdFlcuvIXhqL/B+yz1JWJxF
        l2HmKcE9C5wjL08NNfmdNg==
X-Google-Smtp-Source: ABdhPJy2cNm09rGkY81u/PixZAjMtw93C3BlQ4fLCmC6PwHgFMweTgS3Mvu40uVZQJK9kRcq6lbzCQ==
X-Received: by 2002:a05:6808:11c8:: with SMTP id p8mr16749283oiv.72.1642267370379;
        Sat, 15 Jan 2022 09:22:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e69sm3266969ote.1.2022.01.15.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:49 -0800 (PST)
Received: (nullmailer pid 119882 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     atishp@rivosinc.com, bgolaszewski@baylibre.com, palmer@dabbelt.com,
        linux-rtc@vger.kernel.org, linux-crypto@vger.kernel.org,
        thierry.reding@gmail.com, heiko@sntech.de, lee.jones@linaro.org,
        paul.walmsley@sifive.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        ivan.griffin@microchip.com, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-spi@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        jassisinghbrar@gmail.com, aou@eecs.berkeley.edu,
        alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
        a.zummo@towertech.it, krzysztof.kozlowski@canonical.com,
        daire.mcnamara@microchip.com, lewis.hanly@microchip.com,
        bin.meng@windriver.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20220114151727.2319915-5-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-5-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 04/15] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.899241.119881.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:16 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580106

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

