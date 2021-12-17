Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B3A478D8F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237155AbhLQOVe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:34 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:46005 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237117AbhLQOVc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:32 -0500
Received: by mail-ot1-f53.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso2998237otf.12;
        Fri, 17 Dec 2021 06:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=J/M+2PmsjRymmQB6phu/NDYxaFxAbv7b80JhNIg62vk=;
        b=NQIWZIgc0UZcX0LuphZnoniUJLFEp7+2pjxBAWCuBBgbYdtVQc6wR2caPrxQH0kWVh
         fM/NwpEknhteGivxd1gBvv9g/hMkoYxwOBg0m84845oQ9kVMe4c9sbEVfRyWyjjWS7Bm
         hfanWR6OOBeXdPAfEd0nlGdESv/+L7f09O+Eyv99FHodwAOV/J/8SpmXGU40BP+NK30N
         1PlncpU+H5ddWioi8i2ssTNnLNFr9wxQOTvuulZPxLvYo9w7PfjxmeOfm7mcFqbdmfOO
         UK2Jxd9CMQ4iwhFnMTvGpT3+9wXZlqglXS+rBMPicXSJbTMSZkjM05mqA7zx46nVzDWu
         ys1w==
X-Gm-Message-State: AOAM531CzH0azIdRDJPBFHpqEmRMtPjzajMLhcmjawFsuCXfJIT2r5YP
        QCYl40CmQZom6rHsF+pb1A==
X-Google-Smtp-Source: ABdhPJxSbDeJnwvijqNwXzfBaRn9Hh/PmAL/1NDID3KUpTOZzTZQbR9Dg2FMsfiJTFgvBh57qRNhkw==
X-Received: by 2002:a05:6830:1d68:: with SMTP id l8mr2311039oti.21.1639750891747;
        Fri, 17 Dec 2021 06:21:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n26sm1547497ooq.36.2021.12.17.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:31 -0800 (PST)
Received: (nullmailer pid 2814889 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        a.zummo@towertech.it, bin.meng@windriver.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
        jassisinghbrar@gmail.com, lewis.hanly@microchip.com,
        palmer@dabbelt.com, gregkh@linuxfoundation.org,
        bgolaszewski@baylibre.com, paul.walmsley@sifive.com,
        linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de,
        krzysztof.kozlowski@canonical.com, broonie@kernel.org,
        atish.patra@wdc.com, geert@linux-m68k.org,
        linux-usb@vger.kernel.org, heiko@sntech.de,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, lee.jones@linaro.org
In-Reply-To: <20211217093325.30612-12-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-12-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 11/17] dt-bindings: usb: add bindings for microchip mpfs musb
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.697647.2814888.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:19 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1569849

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

