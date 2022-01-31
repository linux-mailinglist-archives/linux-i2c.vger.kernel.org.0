Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F464A4850
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 14:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376613AbiAaNiL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 08:38:11 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46834 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378878AbiAaNhm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 08:37:42 -0500
Received: by mail-ot1-f45.google.com with SMTP id l12-20020a0568302b0c00b005a4856ff4ceso4851692otv.13;
        Mon, 31 Jan 2022 05:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=hmPqqMH89APxATVRducOHUhrVsYSdhK58FU8hjuJFYU=;
        b=YODoObUX5rMRyvWW21oR1+43/6LuUq545MHuMwqknaFc/iYIB/Xvc67jRg1Go6fShQ
         wwCZlrCAmS6n0pegsxFbvKIi2ajSL21NEpRaRxELpQqoTj03liW2kZnT4QVymr2nHRkU
         Q98IVasJqvp4JBzIaLFrLph2sT3wiaD1vos6D30TYVDZVB0wJyzSZwnI2TpDNdAJ2X5+
         +EMGeC2Lq9q/4jfAUZjZx1XWN3mgN/oGFR8HSSY4eGWVBLy0dpZEzsl+yxDm2/gOwpHo
         7+IyS/viiF8HM/YUW46MAkNo3YnaVi9EfPOYaL/pbo0WH1rC4E8i0aqCX4eOcHdsbeK8
         PnOw==
X-Gm-Message-State: AOAM530p2SkbRF8tPqMWi4kzAApzKf2VSRnew+AgaW0rbejfgDXpcQ+Y
        g24yn63o4Mw/+g2uhcRKqg==
X-Google-Smtp-Source: ABdhPJxRn59r1bJ55L4bUsinNm/Dim5FdPonnilsaHoyZ/qmjUHFKSeP/tTIxH3eXslra7duYbwfsg==
X-Received: by 2002:a9d:eca:: with SMTP id 68mr1879048otj.274.1643636257269;
        Mon, 31 Jan 2022 05:37:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q9sm9487122oif.9.2022.01.31.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 05:37:36 -0800 (PST)
Received: (nullmailer pid 140171 invoked by uid 1000);
        Mon, 31 Jan 2022 13:37:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     alexandre.belloni@bootlin.com, geert@linux-m68k.org,
        heiko@sntech.de, paul.walmsley@sifive.com,
        ivan.griffin@microchip.com, linux-pwm@vger.kernel.org,
        thierry.reding@gmail.com, jassisinghbrar@gmail.com,
        atishp@rivosinc.com, lewis.hanly@microchip.com,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-riscv@lists.infradead.org, bin.meng@windriver.com,
        devicetree@vger.kernel.org, daire.mcnamara@microchip.com,
        lee.jones@linaro.org, krzysztof.kozlowski@canonical.com,
        u.kleine-koenig@pengutronix.de, a.zummo@towertech.it,
        linux-gpio@vger.kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu
In-Reply-To: <20220131114726.973690-6-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com> <20220131114726.973690-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 05/12] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.114216.140170.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Jan 2022 11:47:20 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586677

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

