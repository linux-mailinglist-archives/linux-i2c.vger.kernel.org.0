Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC7344A57E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 05:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242507AbhKIEJY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 23:09:24 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:45956 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242500AbhKIEJU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 23:09:20 -0500
Received: by mail-ot1-f46.google.com with SMTP id l7-20020a0568302b0700b0055ae988dcc8so25778485otv.12;
        Mon, 08 Nov 2021 20:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=sKmNlZSZoAElUfGTKNnaMRLkfv9QOdA2lm06+/ZjStw=;
        b=PyIxghYkVFjO1cXS3H3e8vnmlrEnx2YNzGOuibgNzYr1xyHLQYIkXXPpdK2kw0cV9Q
         wji90Af8CTUdGHu1HLOYp1KiAbATjkIVN62aLeCA4tBMXYAqer0wdfc6YUC7YotPONVZ
         WDFa/iseTzxrPZA6EePdo66bo/elhpMH0wZQ4sqeqL/a1Yx6ecRRtg8EVl4vuQxMO++k
         o6TduGDDy912c643bcPmGhiXd84vyvrZXDiTELZLbU1XwX38oK3sJ+ZDQvVR5zZCRFvj
         nwe0/XuD+iZ7HoZe7hcWmWHMKjVsfQJA6IOZu6fUcr50bVE9zl2VC87EfA/D+jRCETKi
         on1Q==
X-Gm-Message-State: AOAM533AyWhWnJqBp1wEH81IjY21+8l6s87AhdbfaIjJhsZ7k+x4mfXN
        Hb1koymOnLhzGgG+S1TgPw==
X-Google-Smtp-Source: ABdhPJzGMR43jH1r8YoLKO/8WbqHBDKP5KH+Ll0UQu7GMVsnGMEYVBXzIyfexWPbGzgJb90Jc9Q4Fw==
X-Received: by 2002:a05:6830:1314:: with SMTP id p20mr3292768otq.381.1636430793961;
        Mon, 08 Nov 2021 20:06:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p133sm6807792oia.11.2021.11.08.20.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:06:33 -0800 (PST)
Received: (nullmailer pid 743041 invoked by uid 1000);
        Tue, 09 Nov 2021 04:06:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
        robh+dt@kernel.org, a.zummo@towertech.it, palmer@dabbelt.com,
        paul.walmsley@sifive.com, jassisinghbrar@gmail.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        broonie@kernel.org, ivan.griffin@microchip.com,
        alexandre.belloni@bootlin.com, geert@linux-m68k.org,
        lewis.hanly@microchip.com, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, atish.patra@wdc.com,
        linux-usb@vger.kernel.org, bin.meng@windriver.com,
        linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        daire.mcnamara@microchip.com, linux-spi@vger.kernel.org
In-Reply-To: <20211108150554.4457-10-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-10-conor.dooley@microchip.com>
Subject: Re: [PATCH 09/13] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date:   Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.924306.743040.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Nov 2021 15:05:50 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552384

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

