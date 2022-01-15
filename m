Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE9048F86E
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbiAORXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:23:07 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46730 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbiAORWt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:49 -0500
Received: by mail-ot1-f49.google.com with SMTP id t4-20020a05683022e400b00591aaf48277so14122658otc.13;
        Sat, 15 Jan 2022 09:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=tOd5PlmluudALXw25P1FUTpuTqmX0VJHEIDiSnDnSyQ=;
        b=P8BNx1KyALy+oCKwvbY/SuZ2uLWvKlelb4y4x47ck3aZCtDH+QThu3OLj2rFKgwhhQ
         tZ/dsopp4ZhQoFgvu5yNkXlMUQhpLrAuettIeKX0VoCAG6jyI69DV3+Pjh+4f1k6NITn
         aqY0chnmNxqG4MaqwG9FVDkwLqVfCX+/dNz3L+5F+RrqL5vSqr7ophLGItHr7kEYZ9jr
         +YQdTwmMtwuo/Ha7/1C8KPXfdq01fOmAeCRNXS8/O0J9lAChvUj213iFQrjtyGImWH+C
         ckgyaCpUaCSpv6wXeF/zgB4ArCdbTyoJc970lvPEHljuDnE7DbAx96mcCs6YbcDmTOw0
         KkzA==
X-Gm-Message-State: AOAM533tH/JBKnjZQSSOoGH38yi96hVIvNTMgVUsG6ljYQi+fd68X3ub
        M3KqLiF3ZiiXUHynX8mwTA==
X-Google-Smtp-Source: ABdhPJwIybGqL+uwk2P4tWp5L19eVC71Jl+JwGpTzzBPt2XUw3/wznpGXkiPdKkv8jvQYIA+SGnISQ==
X-Received: by 2002:a9d:7cc9:: with SMTP id r9mr10587481otn.202.1642267368079;
        Sat, 15 Jan 2022 09:22:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x13sm3251441oof.19.2022.01.15.09.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:47 -0800 (PST)
Received: (nullmailer pid 119886 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, heiko@sntech.de,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        aou@eecs.berkeley.edu, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, atishp@rivosinc.com,
        bgolaszewski@baylibre.com, palmer@dabbelt.com,
        a.zummo@towertech.it, ivan.griffin@microchip.com,
        u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
        daire.mcnamara@microchip.com, thierry.reding@gmail.com,
        bin.meng@windriver.com, robh+dt@kernel.org,
        lewis.hanly@microchip.com, lee.jones@linaro.org,
        linux-crypto@vger.kernel.org, linux-pwm@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-riscv@lists.infradead.org,
        geert@linux-m68k.org, linux-rtc@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, paul.walmsley@sifive.com,
        alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org
In-Reply-To: <20220114151727.2319915-7-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-7-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.915591.119885.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:18 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580118

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

