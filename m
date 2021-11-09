Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74F844A597
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 05:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242686AbhKIEJf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 23:09:35 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:42969 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242562AbhKIEJ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 23:09:27 -0500
Received: by mail-ot1-f47.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso26239904otg.9;
        Mon, 08 Nov 2021 20:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=VnK4CqjrP/tqSC7BA9VprQcCacLXAGRlUC8b9O7Uy4M=;
        b=45u4iAaqBpGU5eRpql0MwyRnAlIw3AYOWG9F3hZvyTqTvPgh/+EKDS3J406lFesMUu
         XNbGZH3VDFAUl00efDX81XTf7Y1aEp2J0mr3d+5HRRcNWihLM2KqYobBB8cn5NudocwN
         K7PxQ1eLu3V2n2Xgi9WgkVgUHswfxXen2HKNIEP+h613X9OPcoPTC15p6TB1zebPRSgj
         8D7HTBKGzjQJmaffHrm+Ddkmee905jsHiUR+5TIHzkSHRk3qkmnNEBycdnfWxPNtvG1U
         NoSMhh4xyPAOse9a9DgFwr0Y2kKBuyrajj3E7Rf6Fh9UN2HKNQhl2f1unGOihwgh0p9y
         PwQw==
X-Gm-Message-State: AOAM530kPR52JYL0yywzSeqXav39K8ttp7grEAxwMuLJLuzI7D3j1wTA
        mHyCBrLjviOeMiigIvtvcQ==
X-Google-Smtp-Source: ABdhPJwqFn7rKwZp6OnGXpSvQFrbwKnzY5Gjt/HWja7Pt9VDcz04tYmsi6lM2d+x4u61UsKiO9386w==
X-Received: by 2002:a9d:8f2:: with SMTP id 105mr3483960otf.95.1636430801719;
        Mon, 08 Nov 2021 20:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m12sm3606861ots.59.2021.11.08.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:06:41 -0800 (PST)
Received: (nullmailer pid 743043 invoked by uid 1000);
        Tue, 09 Nov 2021 04:06:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        linux-usb@vger.kernel.org, daire.mcnamara@microchip.com,
        linux-spi@vger.kernel.org, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
        bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
        linux-crypto@vger.kernel.org, ivan.griffin@microchip.com,
        atish.patra@wdc.com, lewis.hanly@microchip.com,
        bin.meng@windriver.com, alexandre.belloni@bootlin.com,
        krzysztof.kozlowski@canonical.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, a.zummo@towertech.it
In-Reply-To: <20211108150554.4457-11-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-11-conor.dooley@microchip.com>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs spi
Date:   Mon, 08 Nov 2021 22:06:29 -0600
Message-Id: <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1552385

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

