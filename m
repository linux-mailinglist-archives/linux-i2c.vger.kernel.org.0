Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177A444A586
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 05:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242503AbhKIEJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 23:09:28 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:45959 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242505AbhKIEJW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 23:09:22 -0500
Received: by mail-ot1-f47.google.com with SMTP id l7-20020a0568302b0700b0055ae988dcc8so25778635otv.12;
        Mon, 08 Nov 2021 20:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Oge0EnfKNFQBUdGv4kRxUqctp7bsGqv2hp5zFLIPTz0=;
        b=OBzP46CGBuNrhPGDSco7YUVITLLFjZ0LwtS/xz8d8cZsfn3uRvmWGXZOZ6nTcvnp+w
         W7sOHBSNL4b94R2wRvjcBUn6AfJPlMoDCwaJZDU4HrusgB+bSOETXgob436JZCupNnZM
         S2CzJH/w8zYCWqXpGlTur+pdkheo9pulSULoYRXWbYUC1jEPZ05v04yeqIQlW1dD9Pya
         RsBJtNDVHmAGyyiSLpgLKzcHE7Lu4YwaHNdKZj8MEEzZ3M6KUuUFWBxC+93N+iSpz5qd
         L8VzqUjpqufm5PqE4eDQLchKwwr1EZC6nXyhRsdv5iqR4K3HE5vYlrO6aV3JS9HCYeXQ
         2lFw==
X-Gm-Message-State: AOAM533+eGf28ix5Tk21cKAjuTll4iPPI/VTQLT/TuH4mirTNZeIn+V9
        0WHa5P3E88Ei1CKuLlxNtw==
X-Google-Smtp-Source: ABdhPJyr28faBwelObCcuw2f/7Ua5w6R6abaMd8+HrGQ+LM8ItIlWJVTwTBhSGG0onP7IPs6JktBMg==
X-Received: by 2002:a05:6830:4cf:: with SMTP id s15mr2725457otd.219.1636430795994;
        Mon, 08 Nov 2021 20:06:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f25sm5222567oog.44.2021.11.08.20.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:06:35 -0800 (PST)
Received: (nullmailer pid 743045 invoked by uid 1000);
        Tue, 09 Nov 2021 04:06:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     ivan.griffin@microchip.com, jassisinghbrar@gmail.com,
        geert@linux-m68k.org, lewis.hanly@microchip.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        broonie@kernel.org, atish.patra@wdc.com,
        linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        palmer@dabbelt.com, gregkh@linuxfoundation.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        bin.meng@windriver.com, robh+dt@kernel.org,
        linux-crypto@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        a.zummo@towertech.it, linus.walleij@linaro.org,
        daire.mcnamara@microchip.com, alexandre.belloni@bootlin.com,
        krzysztof.kozlowski@canonical.com
In-Reply-To: <20211108150554.4457-12-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-12-conor.dooley@microchip.com>
Subject: Re: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.946637.743044.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Nov 2021 15:05:52 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-usb-host.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml: properties:interrupt-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'dma'}, {'const': 'mc'}] is too long
	[{'const': 'dma'}, {'const': 'mc'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml: ignoring, error in schema: properties: interrupt-names
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552389

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

