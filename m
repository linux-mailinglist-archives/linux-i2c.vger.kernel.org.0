Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A8748F873
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbiAORXD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:23:03 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:45890 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbiAORWi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:38 -0500
Received: by mail-ot1-f44.google.com with SMTP id v8-20020a9d6048000000b005960952c694so3659305otj.12;
        Sat, 15 Jan 2022 09:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WJTPWHZ9LwOb7SC1kUk35a1mxBx9tABomICwyYusPpU=;
        b=l2qyRhfTeJnqE/Z/0AHOM3eKT6GJsmijunHcwvIk4rNhPkbsvfrm/nJ6sf2s84HazH
         CxIgA5WzP0dnLiRe+lzA2xyI6Apxjkk9Uc82V0+BGF/1+xDJMovb0Bn2rBlqWtyBWNaP
         xZp20RZtcjtGuEVEw/O6ZpwCCgUTG/njYtsZJlvDhkithLM3In77jmOpWKaE5PBx6EHH
         rp/qSWIjk7mukaCXENDj3MFI0dFYZlb3IKiqLG9ad+nXGjq2ajy7/GAMsplQE78jCqZP
         DNcVJWqaYg6L9QArUygp49sJNArFjSd1Rl/9at/rXArF2lvn6/WA19pMxsDUc+fUNgqB
         ewRw==
X-Gm-Message-State: AOAM533l0FWlMo3OKhMixEMFm1JkXJLlyWZ/+l9nHpxTfUSW7RMPjT5r
        SuP12s47fNKJ4XnnZB8gOQ==
X-Google-Smtp-Source: ABdhPJzoYppZy2tOmTmU6rJcYjnjFTiAbWYoPhFUY18CRjBii8Nb1cWS4+iNAqG2YO/PG9nzz2i7ng==
X-Received: by 2002:a9d:6012:: with SMTP id h18mr11309090otj.203.1642267357628;
        Sat, 15 Jan 2022 09:22:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m8sm2868149otn.29.2022.01.15.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:36 -0800 (PST)
Received: (nullmailer pid 119884 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org,
        geert@linux-m68k.org, daire.mcnamara@microchip.com,
        aou@eecs.berkeley.edu, a.zummo@towertech.it,
        bin.meng@windriver.com, thierry.reding@gmail.com,
        linux-spi@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        linux-gpio@vger.kernel.org, lee.jones@linaro.org,
        lewis.hanly@microchip.com, heiko@sntech.de,
        linux-crypto@vger.kernel.org, robh+dt@kernel.org,
        palmer@dabbelt.com, linux-rtc@vger.kernel.org,
        ivan.griffin@microchip.com, atishp@rivosinc.com,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        broonie@kernel.org, linux-pwm@vger.kernel.org,
        paul.walmsley@sifive.com, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20220114151727.2319915-6-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 05/15] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.907374.119883.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:17 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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

See https://patchwork.ozlabs.org/patch/1580112

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

