Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B86844A575
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 05:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242390AbhKIEJS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 23:09:18 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:36843 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbhKIEJR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 23:09:17 -0500
Received: by mail-ot1-f44.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so593048otl.3;
        Mon, 08 Nov 2021 20:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=tWZ7nDJRHOWBtWd42g9mRKhhf7tmdLbzmOAabTqmyiU=;
        b=aMuPMhmBe0EzfN9HlGBIYpj1tXx6xoyuSFvjBHgMM45BbXAaGTSbs9lSVAOODIPKrf
         ZCYS0hEgZhRnMz1N+fhBBqY4nDlj5wfL2fTKNDiw2x4CEnXuERiGXFc6UEVQ+9ARAZKu
         Y1a57Rj6XhwgreBzCElTENqTui48gnTUcA2NoinjAOtOpyrBYQbh2KDdd/jiT1rUsldk
         PL8xRLmLDZf5nmYqlNrd/stjBn5pB85qVDjUDN0CZ5KCCviE66yn+glRQhzOUGBtEQmC
         SK+TXcCxjNUTHnRTTFXuhLGTjty4vNUEzJpUnaLxkudbDWa5k5UVV3a6xlSe8VnL5pOA
         M5Hw==
X-Gm-Message-State: AOAM533+BmBrBsTPtWA5mV2oOdGESkWe/MwM2mkqEW0sxiAHeH1B+nJg
        TQWzgL4+Zq3+I5ilEDGs/jcJF5HsSw==
X-Google-Smtp-Source: ABdhPJxAgLpqKxiyb1brUu5+8L15w1Y7+MgbBAzCpLti0Eo2ZuxFP2I0GFC7YipLGJork1cbB+0IMw==
X-Received: by 2002:a05:6830:1e6d:: with SMTP id m13mr3466489otr.304.1636430791947;
        Mon, 08 Nov 2021 20:06:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l43sm6070052otv.25.2021.11.08.20.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:06:31 -0800 (PST)
Received: (nullmailer pid 743036 invoked by uid 1000);
        Tue, 09 Nov 2021 04:06:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     robh+dt@kernel.org, linux-usb@vger.kernel.org,
        alexandre.belloni@bootlin.com, palmer@dabbelt.com,
        a.zummo@towertech.it, linus.walleij@linaro.org,
        linux-spi@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        lewis.hanly@microchip.com, atish.patra@wdc.com,
        linux-i2c@vger.kernel.org, geert@linux-m68k.org,
        broonie@kernel.org, bin.meng@windriver.com,
        bgolaszewski@baylibre.com, ivan.griffin@microchip.com,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
        gregkh@linuxfoundation.org, daire.mcnamara@microchip.com,
        linux-crypto@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <20211108150554.4457-6-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-6-conor.dooley@microchip.com>
Subject: Re: [PATCH 05/13] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date:   Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.899162.743035.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Nov 2021 15:05:46 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552366

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

