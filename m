Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1554A4857
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 14:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379081AbiAaNiO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 08:38:14 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39583 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378954AbiAaNho (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 08:37:44 -0500
Received: by mail-oi1-f169.google.com with SMTP id e81so26662029oia.6;
        Mon, 31 Jan 2022 05:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=dRJYxYg6M513ADX19fELFRfGgMGqN9dmswwNJo+15eU=;
        b=AV2IqK4xRs/rT7tPWZqMx2P8lA4si+tnHS2yLGGezrs7BAuFH+2pB19ePT2Ja5uflH
         OscYP3X3WIig6k4WNZgU+b56cW27zhwZk7ZRaCg0w09+e60vdSMJVN6Vpbepg1pvzX52
         UhTtgLeXkCqpduRh9UIYIANTFwMr26epVJBH9eDBD0gHazods54GU/M4CqezLuCWKhOx
         aiwI1AzH/sNvl4NimEVrFsXokgdbD8WgiKOyMqSZtHUJqG3qkK8frXnLjYWLO590G8C7
         OyMpmvscUR5sYJvCGA7h5ACS5/khD7TZ6MHbImpWsB5ZcTJvrHNWrvUVIF3YinktcwAx
         J3Mw==
X-Gm-Message-State: AOAM533qM2fB1I8JPZ2e1xm1OGeXv80SmJMbq69gaPmrgNYI/sRiweJn
        BA733UEkOi2hll12t9k4mw==
X-Google-Smtp-Source: ABdhPJxf7xEF6ASgsS22KYFq2drQaTLC9zin7gpaq+t/OkVYsMOveK/Vxr4nFYjFUepMzMyIvAUqNw==
X-Received: by 2002:a05:6808:168e:: with SMTP id bb14mr17517593oib.106.1643636259228;
        Mon, 31 Jan 2022 05:37:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n66sm14639502oif.35.2022.01.31.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 05:37:38 -0800 (PST)
Received: (nullmailer pid 140173 invoked by uid 1000);
        Mon, 31 Jan 2022 13:37:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        atishp@rivosinc.com, heiko@sntech.de, jassisinghbrar@gmail.com,
        thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
        robh+dt@kernel.org, daire.mcnamara@microchip.com,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        brgl@bgdev.pl, geert@linux-m68k.org, aou@eecs.berkeley.edu,
        linux-rtc@vger.kernel.org, palmer@dabbelt.com,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bin.meng@windriver.com,
        a.zummo@towertech.it, krzysztof.kozlowski@canonical.com,
        linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de,
        ivan.griffin@microchip.com, linux-pwm@vger.kernel.org,
        lewis.hanly@microchip.com
In-Reply-To: <20220131114726.973690-7-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com> <20220131114726.973690-7-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Date:   Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.124352.140172.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Jan 2022 11:47:21 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/pwm/microchip,corepwm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586680

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

