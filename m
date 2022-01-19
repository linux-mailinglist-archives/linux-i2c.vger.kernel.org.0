Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D65493373
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 04:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351251AbiASDNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 22:13:11 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34526 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242118AbiASDNL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 22:13:11 -0500
Received: by mail-oi1-f176.google.com with SMTP id bb37so2076250oib.1;
        Tue, 18 Jan 2022 19:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZRPgofTjL/2uMaGwaTyzFgCzOnb2/xkop7RDJkHpRPI=;
        b=6bY+3tMq1eFKkuk0/1iyEzqwLWsXdR5DE4DZ8U1KHowqMXYppqMuhMJRnVdsZlAtIs
         fHIdhXjqA2hXilRWk+aHUYEu0J3i+pfuvfGM5bYZ3a6xTB+snZrB4B/lRwFL4DNXUWWl
         +VTYiZk17XDLV+f8VPYHquEQ7pKFb1ofnm7L6nz8I1DmJ8IibMe91m7Xz/j/8HkAPPlp
         x3i+mlZMM8Tho2TslUyzgysA42ArulC5k7WXunCh45FiWLh8J5lGWDPRf2W7WmTKAaym
         4FWO4J8MKAk29JpRKFtU2CD7n8x0KJIb6aNNcSADXEPJWW7mvaS88vaxH8tk4R2hLUW6
         s6Jg==
X-Gm-Message-State: AOAM531+XVlmZBaOKaiTdvH7hP7M9gokwgajPerbmGYBPh/QYLrMDi3U
        21lekjK9aNteRRdsdB/4nQ==
X-Google-Smtp-Source: ABdhPJwOckFgCRnXSA+wugL4msEIdXhoYLAu8vr/C1aTeltHAEZdWofuYihNKuItI980wdKU2RqpZw==
X-Received: by 2002:aca:eb52:: with SMTP id j79mr1341475oih.150.1642561990044;
        Tue, 18 Jan 2022 19:13:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q5sm9905090oiv.2.2022.01.18.19.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:13:09 -0800 (PST)
Received: (nullmailer pid 2567843 invoked by uid 1000);
        Wed, 19 Jan 2022 03:13:07 -0000
Date:   Tue, 18 Jan 2022 21:13:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     atishp@rivosinc.com, robh+dt@kernel.org, lee.jones@linaro.org,
        bin.meng@windriver.com, bgolaszewski@baylibre.com,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        linux-kernel@vger.kernel.org, palmer@dabbelt.com,
        linux-gpio@vger.kernel.org, gregkh@linuxfoundation.org,
        aou@eecs.berkeley.edu, linux-i2c@vger.kernel.org,
        linux-crypto@vger.kernel.org, paul.walmsley@sifive.com,
        geert@linux-m68k.org, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, jassisinghbrar@gmail.com,
        ivan.griffin@microchip.com, lewis.hanly@microchip.com,
        broonie@kernel.org, krzysztof.kozlowski@canonical.com,
        heiko@sntech.de, daire.mcnamara@microchip.com,
        linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org,
        linus.walleij@linaro.org, alexandre.belloni@bootlin.com,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 06/14] dt-bindings: spi: add bindings for microchip
 mpfs spi
Message-ID: <YeeBw05yCtJDe3G2@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-7-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-7-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 17 Jan 2022 11:07:47 +0000, conor.dooley@microchip.com wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
