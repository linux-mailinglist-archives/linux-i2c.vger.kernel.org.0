Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE1478D7F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237242AbhLQOVo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:44 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:43880 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237145AbhLQOVe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:34 -0500
Received: by mail-oi1-f177.google.com with SMTP id w64so3778245oif.10;
        Fri, 17 Dec 2021 06:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=K+fpGAjpVGt0VWWCD57sVJ2BZcyKw5OuNHjkZ25R3sM=;
        b=rNKVmj5ezhitxEmsKhDh2eJfVZAHJrXFKFC9awzP5nn54UVj88/SxiS+zV5eSST7CC
         kHEcynKJWrp6xjnZvVdmiljvInO6849WTTxB8DeKhaa9KMXtlzuri3UBtSYBJrZ0w+D7
         xxRP+RMSelNWgqNpEW0Zd+D+WTi2HJ8XgbvcRkjUETVou2eBQBD87r6684rX5DgcGcSi
         qniIQV9Qnn/D5Xw+/ihR1bJbuLf85+hVufDkdBqQNfKCl1i8cBtI72vfLe0coETNs4yn
         +w3FHgI6h1Ni6fcRFrAF4RpbZTQZ2sXVQCX87EiPgFzVNSQW1nHLDnTJPcW+VRFetvmf
         TN5g==
X-Gm-Message-State: AOAM532Hs0LtgAWQdiVzwWCGO32kbskufon6mXYqdlSdgYFKtcoPzacG
        BAAnbFfrnA3kRz5JZ5NjRg==
X-Google-Smtp-Source: ABdhPJxfl5ayeW5AdzR9NO8PqAIqjIk1Jdx+Cd1+AOuM9pWMi29n7FEhlLZ3WETROcdkBQTB/a2/Tw==
X-Received: by 2002:a54:4401:: with SMTP id k1mr8315183oiw.143.1639750893772;
        Fri, 17 Dec 2021 06:21:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p6sm1600794oof.0.2021.12.17.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:33 -0800 (PST)
Received: (nullmailer pid 2814881 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     bgolaszewski@baylibre.com, lee.jones@linaro.org,
        linux-crypto@vger.kernel.org, bin.meng@windriver.com,
        linux-gpio@vger.kernel.org, ivan.griffin@microchip.com,
        linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org,
        alexandre.belloni@bootlin.com, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        heiko@sntech.de, geert@linux-m68k.org, aou@eecs.berkeley.edu,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        jassisinghbrar@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        linux-pwm@vger.kernel.org, atish.patra@wdc.com, palmer@dabbelt.com,
        u.kleine-koenig@pengutronix.de, a.zummo@towertech.it,
        thierry.reding@gmail.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, broonie@kernel.org
In-Reply-To: <20211217093325.30612-6-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 05/17] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.651672.2814880.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:13 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569825

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

