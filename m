Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F525478D74
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237210AbhLQOVk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:21:40 -0500
Received: from mail-oo1-f45.google.com ([209.85.161.45]:35409 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237138AbhLQOVh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:21:37 -0500
Received: by mail-oo1-f45.google.com with SMTP id e17-20020a4a8291000000b002c5ee0645e7so752194oog.2;
        Fri, 17 Dec 2021 06:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4EKb7W0mJkyH6TbJycp3IxpudXweTd3JUfvQdZFmwmM=;
        b=2l2BUliZkFk7Jr1qi/g88DLaGDCi5Mo6GU1w/WsQl4A/tp1HO/Yb5AWnRAEl2vX4VA
         lsFHVNqpE6tIGE/b1X/YCtw4kCglljiIp/ZatNSpvkmt4vaojnMCYrGTvRbpN/MlFvsA
         4c9BJtKj0yCcmQtOHLd6V532DEQlj1VTXldfU+BZoACo6SGZK6LLil701XDmQvZ2nJq0
         i03B0reYwQc7LRi3QT2QXUmZeiFbUTFC4KAmYxbCas1isHW09TMGzAklXSQJpizdmcs7
         sA9HXe81/F6hIeXCvItfAcI9c36hZJOq8Z3JDeEFwZ6jqBCRESqfPX0uXr2lADwPx69W
         /ojw==
X-Gm-Message-State: AOAM5316JN94mpMzv2WFvHIeJms7TCfKMYmXxshss+GIjTkX9Byeq2Q4
        JDEDLOti6GTU16iol1PdLQ==
X-Google-Smtp-Source: ABdhPJzgcnuBgZHVkCNHyzmmA8V24n9OttHKJ4rBUqvjr5sf9o12yxKJgaDITOHdTCNJKuDFYJXSWA==
X-Received: by 2002:a4a:41c3:: with SMTP id x186mr2069310ooa.76.1639750896096;
        Fri, 17 Dec 2021 06:21:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a12sm1607447otk.35.2021.12.17.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:21:35 -0800 (PST)
Received: (nullmailer pid 2814883 invoked by uid 1000);
        Fri, 17 Dec 2021 14:21:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
        lee.jones@linaro.org, linux-i2c@vger.kernel.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org, atish.patra@wdc.com,
        thierry.reding@gmail.com, devicetree@vger.kernel.org,
        bin.meng@windriver.com, a.zummo@towertech.it,
        linus.walleij@linaro.org, ivan.griffin@microchip.com,
        heiko@sntech.de, linux-spi@vger.kernel.org, geert@linux-m68k.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alexandre.belloni@bootlin.com,
        daire.mcnamara@microchip.com, linux-kernel@vger.kernel.org,
        lewis.hanly@microchip.com, linux-rtc@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, broonie@kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        jassisinghbrar@gmail.com, bgolaszewski@baylibre.com,
        gregkh@linuxfoundation.org, u.kleine-koenig@pengutronix.de
In-Reply-To: <20211217093325.30612-8-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 07/17] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date:   Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.663579.2814882.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 09:33:15 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1569828

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

