Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310FD44A58E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 05:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242620AbhKIEJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 23:09:29 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:42971 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241057AbhKIEJY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 23:09:24 -0500
Received: by mail-ot1-f53.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso26239734otg.9;
        Mon, 08 Nov 2021 20:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=srBAEqiQv7t2TUoCMiKomnj9CXcpM/RXP2/IhsCEUt4=;
        b=Id4oeY1Rtgk4Uzmq8cFQvIB4rz9CZZF3nRO/yMvW1puv3a0mGe9tsq36IT9wgM2d/e
         YXD7myHXbp0pHhX5Xzppy5SefrREgoXVbF4mjY6JlZHit2wBlsYN63ON2/85qGFxpgDA
         g6pz4UCNKiUNQQa3zAzdrzycX2hZnI15b3E3J8+dhnokJuJK5WQ6EmcgEPiOG1ZS16dO
         W1v+e1Le4Nl4lRIojouEMPemswYAMi34lQdhAM9aryBnkudKmsH1VxJyUokmIUuVcKIJ
         FetH+npSVCLbRDJW1SEBdVqqiCRJVq4PQEM/Gha6tSYm/Pplc6LoUuDH9V9WHIfnzUPK
         UtKA==
X-Gm-Message-State: AOAM533WytWd4uf3bvMfqzL1VaEhfMNq/kfLVE7cE/sRAQ53Jxnc6E8b
        hzQ+3sKjnPEJ40O9VvHYzw==
X-Google-Smtp-Source: ABdhPJxAD8OzRK/Sli7Q+xp3mQUCmoiHP7RN7OOEEvobUZ0MlWRieiCoDJdFa0SI20BV1G+hYm0D6w==
X-Received: by 2002:a9d:76d1:: with SMTP id p17mr3474638otl.328.1636430798093;
        Mon, 08 Nov 2021 20:06:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q81sm6985766oib.47.2021.11.08.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:06:37 -0800 (PST)
Received: (nullmailer pid 743039 invoked by uid 1000);
        Tue, 09 Nov 2021 04:06:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-spi@vger.kernel.org, linus.walleij@linaro.org,
        lewis.hanly@microchip.com, ivan.griffin@microchip.com,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, paul.walmsley@sifive.com,
        broonie@kernel.org, robh+dt@kernel.org, atish.patra@wdc.com,
        linux-kernel@vger.kernel.org, daire.mcnamara@microchip.com,
        alexandre.belloni@bootlin.com, krzysztof.kozlowski@canonical.com,
        bin.meng@windriver.com, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, a.zummo@towertech.it,
        aou@eecs.berkeley.edu, palmer@dabbelt.com, geert@linux-m68k.org,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        jassisinghbrar@gmail.com, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org
In-Reply-To: <20211108150554.4457-8-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-8-conor.dooley@microchip.com>
Subject: Re: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date:   Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.913081.743038.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Nov 2021 15:05:48 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552374

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

