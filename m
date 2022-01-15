Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D77E48F837
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 18:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbiAORWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 12:22:34 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38465 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbiAORWe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jan 2022 12:22:34 -0500
Received: by mail-ot1-f47.google.com with SMTP id g1-20020a9d6481000000b00592d01f2b6eso10081139otl.5;
        Sat, 15 Jan 2022 09:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=QdKoM92XcOD+ied4LW2xvMvWizSFp19kwNEISaRgwYc=;
        b=kItlONYdbLTzpuA2I46I8QjVckeB2oUGfGUJglsXnNBlLCep63qbOPQnwu+nSRHIvF
         jxEv0UCpWg9k+mvQyz1TygPlnjy7+Z2oLkNUyXYkuWEQmdUOcZ96DySlP9t/hUKT2Ide
         xqB6glfLUl3CNxTKGk8ATPWu617eBaZmvrv5q0kXodwr1+2E1yvQDmlGiVQfuguWt7z3
         Yp8NpzE9WZkKGCyyT95D8HgI1l94v4SfZmbPOqtzyeb3BMd9Cchr3jOX1FNVEILWbIfj
         kZ+vVgY6xbHnDozJOQkpAwulCQXCr+YBPyZkieN9meljk3UD2d4YuRXfF6TgGm90K8H8
         CzUw==
X-Gm-Message-State: AOAM531FRpD2FSIVYMhPE+ufMgE6vuMcMBbGhYIEsFo2Kss0iVsVO6sO
        Tm+xUBf3+gShB6qxBkgEKA==
X-Google-Smtp-Source: ABdhPJxckVmhHzYLxvrbRLfL2JZUy0scMzSr8ccJ+pUoumgkQ08Xp/dABKP9617iJawKNBRs9pQ3hg==
X-Received: by 2002:a05:6830:2a0a:: with SMTP id y10mr10609256otu.248.1642267353083;
        Sat, 15 Jan 2022 09:22:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v18sm2766862otp.42.2022.01.15.09.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 09:22:32 -0800 (PST)
Received: (nullmailer pid 119879 invoked by uid 1000);
        Sat, 15 Jan 2022 17:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     robh+dt@kernel.org, bgolaszewski@baylibre.com,
        jassisinghbrar@gmail.com, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        paul.walmsley@sifive.com, linux-usb@vger.kernel.org,
        lewis.hanly@microchip.com, lee.jones@linaro.org,
        aou@eecs.berkeley.edu, daire.mcnamara@microchip.com,
        thierry.reding@gmail.com, linux-riscv@lists.infradead.org,
        broonie@kernel.org, linux-pwm@vger.kernel.org,
        a.zummo@towertech.it, heiko@sntech.de,
        u.kleine-koenig@pengutronix.de, atishp@rivosinc.com,
        linux-spi@vger.kernel.org, alexandre.belloni@bootlin.com,
        bin.meng@windriver.com, devicetree@vger.kernel.org,
        geert@linux-m68k.org, palmer@dabbelt.com,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        gregkh@linuxfoundation.org, linux-rtc@vger.kernel.org,
        ivan.griffin@microchip.com, linux-crypto@vger.kernel.org
In-Reply-To: <20220114151727.2319915-2-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-2-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: soc/microchip: update syscontroller compatibles
Date:   Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.889231.119878.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jan 2022 15:17:13 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
>  ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>  rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.example.dt.yaml:0:0: /example-0/soc/mailbox@37020000: failed to match any schema with compatible: ['mpfs-mailbox']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580091

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

