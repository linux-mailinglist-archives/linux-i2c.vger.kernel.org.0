Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF81A478D87
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbhLQOVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:47 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:45599 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237156AbhLQOVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:39 -0500
Received: by mail-oi1-f182.google.com with SMTP id 7so3761514oip.12;
        Fri, 17 Dec 2021 06:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=9o4EOmq+ROwfzC6UvQVhsNjTkGdilWZSOYUxWW+IJhU=;
        b=3tNzg+70gK8qkrpWuOlO5ML4uSGsja+bXzvvlSIFW4U/N164inoW/Gu8DgW69NHQY9
         tpVFKsEvZDPD9uiLeSJ4f+GCWGF5wFg8Ikiaq8Ciu7VP+a0MaHbpLCvwFeOibw7Ah5JM
         PFoJoawykdSh18ZGeuUBxDC1xs8/BV7J2983+cKS6XY8PzBJmdPOKUR5TPiLSySiY7hw
         wyeTRxopzlKN141lRG5aVnErxxs5RFCw6Z0KD+D5WTy7hi39YrxCKih8cRkinDwtx/mM
         hN4cSVTGPElGxkmKYUyC7jgj4EnqPzjTmbneeod8Wu6epp7jy0yNYaLTdvCtWfLY8x1i
         kqEQ==
X-Gm-Message-State: AOAM533X9LvSp6xf4BRIOmdGn8WLAdHQCtcmLhWDp4JQh8Ewa3Odpd1Z
        lBdMIbT8PU0nJblIJTXQmA==
X-Google-Smtp-Source: ABdhPJwd27y64wtW+mXglGkwTczy+y8F0FV0caGHNfX0/bkBe8x1ZLiaYabb22tee0bgLK+EssyWUw==
X-Received: by 2002:aca:44c5:: with SMTP id r188mr8352516oia.177.1639750898331;
        Fri, 17 Dec 2021 06:21:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d6sm1597483otb.4.2021.12.17.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:37 -0800 (PST)
Received: (nullmailer pid 2814885 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     jassisinghbrar@gmail.com, devicetree@vger.kernel.org,
        bgolaszewski@baylibre.com, palmer@dabbelt.com,
        linux-crypto@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        linus.walleij@linaro.org, linux-rtc@vger.kernel.org,
        lee.jones@linaro.org, bin.meng@windriver.com, robh+dt@kernel.org,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        paul.walmsley@sifive.com, alexandre.belloni@bootlin.com,
        broonie@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        aou@eecs.berkeley.edu, heiko@sntech.de, ivan.griffin@microchip.com,
        thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        linux-i2c@vger.kernel.org, a.zummo@towertech.it,
        linux-spi@vger.kernel.org, lewis.hanly@microchip.com,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com
In-Reply-To: <20211217093325.30612-10-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-10-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 09/17] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.674842.2814884.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:17 +0000, conor.dooley@microchip.com wrote:
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

See https://patchwork.ozlabs.org/patch/1569834

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

