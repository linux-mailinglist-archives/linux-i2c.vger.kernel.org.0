Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DB8478D5B
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbhLQOV2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:28 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:44972 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbhLQOV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:28 -0500
Received: by mail-oo1-f49.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so741613ooh.11;
        Fri, 17 Dec 2021 06:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0CTYbf7WcVEIWf1SfUbbnMgBSJ0VdANxQxhVm4uvlY0=;
        b=c0lpD/vFsuE9qVDCaRQ0uZeLqn58qomm5aj0wRRZteRQzVhq0YgCHi0bqf4V0TWdSY
         T1qqMxOvfjPS8Q6/ioSVvprTZ4i8JW0wzCMXFcSUqOE1T+c0xfPIGyCdh0HUMIeBEaR/
         LFFK4ALBkxWT7lM2C786JYqhd1BKDXPQZkpbEwTjlhGiRyqFomo4UlgxkSIQ2NyjaDcH
         D9vAHUFNn48wHfCYCIdIpjrEwI5bjTQErjTdSanQO8uQr0gmuwNtMRpO2UV+Ty+Rqm44
         COXnudEmKr9iCkAIhLEvsUo4FvbXFlvYU1RCgusb89FQy5fSv74u39wAzKx2cEeVPGVP
         y80w==
X-Gm-Message-State: AOAM530L3D8ffWhPlCS8mQ+gNmVFqTPBEDVX32We0fP15sRVA9nRp6yq
        biEu0c8zON2RuZ58KBlc5g==
X-Google-Smtp-Source: ABdhPJzHsnbteoaUGagiqRaGKtjBFUvSNvdOeJ9ZS+0MxZiGB8nLr3d7uklhHQ1qehLtgxHiZ+WF0A==
X-Received: by 2002:a4a:af02:: with SMTP id w2mr2118116oon.7.1639750887258;
        Fri, 17 Dec 2021 06:21:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k4sm1581026oij.54.2021.12.17.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:26 -0800 (PST)
Received: (nullmailer pid 2814887 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     broonie@kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
        aou@eecs.berkeley.edu, linux-i2c@vger.kernel.org,
        ivan.griffin@microchip.com, a.zummo@towertech.it,
        lee.jones@linaro.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, heiko@sntech.de,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        paul.walmsley@sifive.com, lewis.hanly@microchip.com,
        linux-crypto@vger.kernel.org, atish.patra@wdc.com,
        robh+dt@kernel.org, bin.meng@windriver.com,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, jassisinghbrar@gmail.com,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        devicetree@vger.kernel.org, daire.mcnamara@microchip.com
In-Reply-To: <20211217093325.30612-11-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-11-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip mpfs spi
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.686168.2814886.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:18 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1569843

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

