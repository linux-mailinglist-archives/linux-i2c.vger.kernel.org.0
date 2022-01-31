Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6114A4859
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 14:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379071AbiAaNiN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 08:38:13 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:34492 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376468AbiAaNhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 08:37:36 -0500
Received: by mail-ot1-f44.google.com with SMTP id b17-20020a9d4791000000b005a17fc2dfc1so13009741otf.1;
        Mon, 31 Jan 2022 05:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=eyKZGeMppzdMnKqFGEAP/XE0vAujCQDh+n/xAG/dtR4=;
        b=rRFzn1kunyYtJWV5mn/00cs5/0z/9k8O/HXGdJJu9YwK/sDrZkKyuYVZwney0/5kHl
         CQbeKKQJO+u613zXlLcwgWAUsGiy/hyZwgEDMUWzJZl540TIloHIbbmtZUfpRCOnSscW
         JjejowVC/JvPkBIklQuOGT9x/yCiTogp8Vj6ybBrAiiYL8vrl6cMsBCXHGZUB9mbH/AR
         vwSNr+crlFmFcKddKPqR+XSK0ZKQ21qyOakNLUt4GVPXrtSY6dlXdFIrcxoStiBqo276
         bbOZe8ndWahRgttasiKg0qnCtFM8tCZ3G2YsLqSwWwvgCFehjhtuC25hZk2YxcAxPksq
         iT7w==
X-Gm-Message-State: AOAM532ClL0JIC257lc3ZkHOzpVRk5ewv2E/2isJo4wAzc3Nr00C7eiW
        jOgh2zW84nIKU8DfgPOo2A==
X-Google-Smtp-Source: ABdhPJwRjL7O/8HCWUdBK+YSkY0A28RmHcoorp6KeBHBAOj+PPMQj/h6dh4utGxfFu9ePS2Ejvizvg==
X-Received: by 2002:a9d:5c8a:: with SMTP id a10mr11505693oti.248.1643636255294;
        Mon, 31 Jan 2022 05:37:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bg10sm4545104oib.33.2022.01.31.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 05:37:34 -0800 (PST)
Received: (nullmailer pid 140169 invoked by uid 1000);
        Mon, 31 Jan 2022 13:37:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     bin.meng@windriver.com, linux-riscv@lists.infradead.org,
        krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        palmer@dabbelt.com, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, lee.jones@linaro.org, brgl@bgdev.pl,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        linus.walleij@linaro.org, paul.walmsley@sifive.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        aou@eecs.berkeley.edu, u.kleine-koenig@pengutronix.de,
        lewis.hanly@microchip.com, atishp@rivosinc.com,
        linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, heiko@sntech.de,
        thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
        jassisinghbrar@gmail.com, geert@linux-m68k.org
In-Reply-To: <20220131114726.973690-5-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com> <20220131114726.973690-5-conor.dooley@microchip.com>
Subject: Re: [PATCH v5 04/12] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date:   Mon, 31 Jan 2022 07:37:31 -0600
Message-Id: <1643636251.101853.140168.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Jan 2022 11:47:19 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1586704

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

