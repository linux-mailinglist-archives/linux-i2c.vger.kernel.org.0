Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D68D48F875
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbiAORXF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:23:05 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:45821 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbiAORWk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:40 -0500
Received: by mail-oi1-f175.google.com with SMTP id t9so16985023oie.12;
        Sat, 15 Jan 2022 09:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ZtQZQQtBYWI8Agjq6Y7PFot/NVrQMu+LHWLDC+pnaYs=;
        b=vbR9gkEAj3JeNdqr/UE0bDkOSlbw4CD4HXGX/m6jN6huQxEojrMF2sNG3AJ7ITTkMh
         ftZf7Y0fvE/FoJlc1M3qs6T4n1Z5joF1usTpjs9COlTzxV2nLcayeilrvkhBqhG8mPWA
         VB8avOJ09Ll7t8rP/ynkFngGO66FCzC/hh1D6JFfjjLfn54efUqxbJeNZRQRi8gd/5g6
         JFylWLTAkzZngCe7ngLnaU5jIJcs4qIEXscjFWz2Mai0d1MRoi1uYYh6tSE9qBVJm9gt
         rLUuko+BaO76D68kB6IBcjD8kjtGr4m8CyCZOypPhVJzcT0ZSqJlCYlMlOh51bJwkhc5
         dtSQ==
X-Gm-Message-State: AOAM531XgwHVaLHSsiQEUyXozN8Xfo94DNj+M1eiSzFLgUQbctcaWh1Y
        E0yC9qiJxv3g345QVhTrpQ==
X-Google-Smtp-Source: ABdhPJy6RpEsOGN9sTiJA6qfKAqIaiAUMAxiy/euV0n2fuPnv1Vgvzop0yoLcdi/7lbeNfB1ZGfiNw==
X-Received: by 2002:a05:6808:e8a:: with SMTP id k10mr16992956oil.22.1642267359753;
        Sat, 15 Jan 2022 09:22:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s24sm3209601otk.22.2022.01.15.09.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:39 -0800 (PST)
Received: (nullmailer pid 119890 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-pwm@vger.kernel.org, palmer@dabbelt.com,
        a.zummo@towertech.it, krzysztof.kozlowski@canonical.com,
        heiko@sntech.de, robh+dt@kernel.org, bin.meng@windriver.com,
        linux-kernel@vger.kernel.org, lee.jones@linaro.org,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        thierry.reding@gmail.com, geert@linux-m68k.org,
        atishp@rivosinc.com, daire.mcnamara@microchip.com,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        lewis.hanly@microchip.com, alexandre.belloni@bootlin.com,
        linux-gpio@vger.kernel.org, broonie@kernel.org,
        linux-rtc@vger.kernel.org, ivan.griffin@microchip.com,
        linus.walleij@linaro.org, paul.walmsley@sifive.com,
        bgolaszewski@baylibre.com, gregkh@linuxfoundation.org,
        u.kleine-koenig@pengutronix.de, linux-usb@vger.kernel.org,
        linux-spi@vger.kernel.org, jassisinghbrar@gmail.com,
        devicetree@vger.kernel.org
In-Reply-To: <20220114151727.2319915-9-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-9-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 08/15] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.931458.119889.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:20 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/microchip,mpfs-musb.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/usb/microchip,mpfs-musb.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580122

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

