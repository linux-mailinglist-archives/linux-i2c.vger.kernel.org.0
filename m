Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4813462140
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 20:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351267AbhK2UDA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:03:00 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:39798 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379792AbhK2UBA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:01:00 -0500
Received: by mail-oi1-f175.google.com with SMTP id bf8so36737668oib.6;
        Mon, 29 Nov 2021 11:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HfsUR5L7A7mtic8OAeLVF3BR2S9QhZbq2Zd9TYiAIUw=;
        b=iyeslQhcxi/TgIusZcp8RzX0mv2uCvB1mPXqI7Mb2NOjvcOqOnHq2qhd2TA5U+cukK
         uKqqj5ZIhX6ToRW8a/OvDc/ZQ5TTfX8QS4ysxnS0D2sEt/FlwbqffJkd+kQuvHF2ZHCn
         M6jKSOdBItRv7vy/n1m7Gv96pMcOInPa/8aAGmWL2N2VjL/jvYhQcOnyACxzpwL9WZzK
         TuPGwktfTzd3quYQgoI/wFmnTNulkhiceyBURukB+e1DDOvRtiMa2umRUYeciLOrrVGK
         gxm0LALK0Na4NM4dskApisDYoTofW3ijOiu+HbZZSw/8iqfwi6MP2++0TLiKjCdTqcL5
         sngw==
X-Gm-Message-State: AOAM533cBofvcD8i12qTCaiPfXHgWe5Q6dV8taNYjHno3thUmr9oqBP8
        X678ovh3LN1HWD9fWBQ8gw==
X-Google-Smtp-Source: ABdhPJzP2oHSFJrUqX433xhlxSbtB1tFwj+rRhSRXyeRyaBNTiCllu+XkavzvOWSuvIiREO4uWcIhA==
X-Received: by 2002:aca:1202:: with SMTP id 2mr153130ois.63.1638215861431;
        Mon, 29 Nov 2021 11:57:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bb8sm3226530oib.9.2021.11.29.11.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 11:57:40 -0800 (PST)
Received: (nullmailer pid 504791 invoked by uid 1000);
        Mon, 29 Nov 2021 19:57:39 -0000
Date:   Mon, 29 Nov 2021 13:57:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     paul.walmsley@sifive.com, alexandre.belloni@bootlin.com,
        daire.mcnamara@microchip.com, bin.meng@windriver.com,
        palmer@dabbelt.com, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com,
        atish.patra@wdc.com, lewis.hanly@microchip.com,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        broonie@kernel.org, ivan.griffin@microchip.com,
        linux-spi@vger.kernel.org, aou@eecs.berkeley.edu,
        robh+dt@kernel.org, bgolaszewski@baylibre.com,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: interrupt-controller: create a header
 for RISC-V interrupts
Message-ID: <YaUws4nu6iLvHLiF@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108150554.4457-2-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Nov 2021 15:05:42 +0000, conor.dooley@microchip.com wrote:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Provide named identifiers for device tree for RISC-V interrupts.
> 
> Licensed under GPL and MIT, as this file may be useful to any OS that
> uses device tree.
> 
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h
> 

Acked-by: Rob Herring <robh@kernel.org>
