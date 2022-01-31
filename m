Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46A64A4849
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 14:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378432AbiAaNhg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 08:37:36 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:38872 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243165AbiAaNhd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 08:37:33 -0500
Received: by mail-oi1-f171.google.com with SMTP id u13so10447984oie.5;
        Mon, 31 Jan 2022 05:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nlm4zvylRWmR5WREUgtSyLjF6ZgmNI+EjSE9SwmaUK8=;
        b=BDV6dvPtIrNxrGKW5P+ZRCI/4uZmjmTjyXEmFwPU1UZS1hPBzY7muIxVLoGD5MnVow
         ejKUDPCwilPZ39zzgI5ftr9bqgqVgcWe4TSuiw8LuCenSvmAZeWZGwj79T9zvaHu/DLm
         BWuj6KWPc5E4ebvS+gLKK62N68l8SFUbXtdssEcBZBYKHRGcbX/GueNtnBfmrzv4XLP9
         nokJGvHUpHqyc9dYpdD2y+GIye54Wsk4YEJrsDLMoxu57np97s2n+6LL41pb67lGkzqU
         o5w1W9d0HqQPqxdiT2+/lkZwlCE3NyhgiEkoAD50PWV3ibDlQc8iRRyZ7aW5DqllZ6Nx
         s2zQ==
X-Gm-Message-State: AOAM533L4g1O7pGFxC2FfLbrdjS2mdxOsgyRkkO4bK/DDd0E4T+xR4kh
        UXq8PjMJzOYcnceDGsb6Yw==
X-Google-Smtp-Source: ABdhPJy6dpxtxfz7tIcUHdfKGqrjKfLSw8aJ+wWpPL2BHO8kYigVTZ2NIUwG4avYBAOlLZD4pPdkGA==
X-Received: by 2002:a05:6808:1784:: with SMTP id bg4mr18144861oib.286.1643636253100;
        Mon, 31 Jan 2022 05:37:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c13sm9111957otf.5.2022.01.31.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 05:37:32 -0800 (PST)
Received: (nullmailer pid 140166 invoked by uid 1000);
        Mon, 31 Jan 2022 13:37:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     atishp@rivosinc.com, krzysztof.kozlowski@canonical.com,
        devicetree@vger.kernel.org, bin.meng@windriver.com,
        u.kleine-koenig@pengutronix.de, aou@eecs.berkeley.edu,
        paul.walmsley@sifive.com, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, daire.mcnamara@microchip.com,
        heiko@sntech.de, lewis.hanly@microchip.com, brgl@bgdev.pl,
        linux-pwm@vger.kernel.org, geert@linux-m68k.org,
        jassisinghbrar@gmail.com, alexandre.belloni@bootlin.com,
        linus.walleij@linaro.org, palmer@dabbelt.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, a.zummo@towertech.it,
        ivan.griffin@microchip.com, thierry.reding@gmail.com,
        linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20220131114726.973690-4-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com> <20220131114726.973690-4-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.086670.140165.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Jan 2022 11:47:18 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586674

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

