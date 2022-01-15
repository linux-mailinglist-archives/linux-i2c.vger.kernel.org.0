Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6FF48F868
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbiAORXC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:23:02 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:42627 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbiAORWg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:36 -0500
Received: by mail-oi1-f178.google.com with SMTP id y14so17049308oia.9;
        Sat, 15 Jan 2022 09:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1Tt+rbrf5r83N/U3je/yYA3NoWM2IQlvftFWp2MMPP8=;
        b=OCJstCQdh/ib8vCc0LZdTPE6ZV9rSb3+y8mFUhlvoSkZ5DP2SxOhJ3YAs+/6x7nu/q
         p9WheI1nwfvWq9RmQ2+nop1Ob+mn/DFV4ovefH4Q3B/R3VLa4dcW9CCElQ8/Mnd4Wjrd
         Jk2ukSnMoNSuIsgWTSC0DqUtbPm9vgQCoz/oRs/zAIjlQ69pjBi3QJbLv982xBWgqn/a
         KNznP+UDw8B1LdoWxPd/WtYOPdT0GuflMQq4vNzplprrXybrmEa8DRifGYJAY9nfn7l3
         5EXjqJauWSat5R6mzz9cGyMOb1Pvop4P/g2ZZcWfawZ7bnkY1DJfVjhNvIWd9BEX/395
         n3jQ==
X-Gm-Message-State: AOAM531tLD9tG43k+GBtqTWruBymuywJaZ3As5YUCphqPf0m96L9tbmu
        oLKDsHy8sxWEn75N34dGfA==
X-Google-Smtp-Source: ABdhPJzScKDdEHoku6BgCOg51JV5Qp70zhivDJmOaquTVFJUGaqdX+T9lu4RlZmPt57uFEQgZhQ97w==
X-Received: by 2002:a05:6808:45:: with SMTP id v5mr15888461oic.58.1642267355453;
        Sat, 15 Jan 2022 09:22:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q145sm3392410ooq.31.2022.01.15.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:34 -0800 (PST)
Received: (nullmailer pid 119888 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
        jassisinghbrar@gmail.com, palmer@dabbelt.com,
        linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ivan.griffin@microchip.com, thierry.reding@gmail.com,
        gregkh@linuxfoundation.org, heiko@sntech.de, robh+dt@kernel.org,
        alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
        linux-i2c@vger.kernel.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, broonie@kernel.org,
        linus.walleij@linaro.org, lee.jones@linaro.org,
        linux-usb@vger.kernel.org, geert@linux-m68k.org,
        atishp@rivosinc.com, krzysztof.kozlowski@canonical.com,
        linux-gpio@vger.kernel.org, bin.meng@windriver.com,
        bgolaszewski@baylibre.com, u.kleine-koenig@pengutronix.de,
        a.zummo@towertech.it
In-Reply-To: <20220114151727.2319915-8-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: spi: add bindings for microchip mpfs spi
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.923323.119887.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:19 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1580121

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

