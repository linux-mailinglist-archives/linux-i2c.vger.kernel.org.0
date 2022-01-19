Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A35493384
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 04:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241694AbiASDOw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 22:14:52 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:40584 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240542AbiASDOw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 22:14:52 -0500
Received: by mail-oi1-f169.google.com with SMTP id bx18so2029230oib.7;
        Tue, 18 Jan 2022 19:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kn1Mk3z9xSx65+thbR2SSoC2E940smP9FzIPCUFVCdk=;
        b=Eb+8EMWaTATAqIHPsApAaiOEN1LoYH2HhM6ItKzbFN9BE3wVqT+nWuYtNpiyN6VpNc
         F5qYsCPnG+dzWDa4xl9GwXSDXIBeOfRVdP0zOSMlefWHuSQlpOpCNbmdhyC976KzUrbY
         D9q4MLLTMqckJ24LvyQX8TvZYTuAwM3Fi/Tl7Lbzyrm8OTqPn4treKbQjjEMsiSoqL9V
         rPW6jXHr4pl5nchRzL+LDZkzxp0Gdbjrit5Zf2EkgWuvxLqIga/Tw+s2pdKB3QVYYkSo
         Wh0MlayqavqvGCAVDRXALhWTGcgBfDOymuGbuU/KW2XX7phzrkC1KxlDJYHX68lvvjjL
         6FPg==
X-Gm-Message-State: AOAM530TqkwLo78pGwhUMiL4Mjk4Kk3Oo3/AWZGzL7the5yjTDracjOv
        tR1vnlwJeOYACukNrRg20g==
X-Google-Smtp-Source: ABdhPJxU8xP3n7IbrfWS45xsMVH1tELwDYNmgo5+MUYtSBPkdpT750qno1pazIxCRTmuNbzkPgYBQA==
X-Received: by 2002:aca:2b04:: with SMTP id i4mr1288407oik.69.1642562091272;
        Tue, 18 Jan 2022 19:14:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v12sm6067213otk.43.2022.01.18.19.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:14:50 -0800 (PST)
Received: (nullmailer pid 2571074 invoked by uid 1000);
        Wed, 19 Jan 2022 03:14:49 -0000
Date:   Tue, 18 Jan 2022 21:14:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-crypto@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, bin.meng@windriver.com,
        lee.jones@linaro.org, ivan.griffin@microchip.com,
        robh+dt@kernel.org, paul.walmsley@sifive.com, atishp@rivosinc.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        aou@eecs.berkeley.edu, jassisinghbrar@gmail.com,
        devicetree@vger.kernel.org, thierry.reding@gmail.com,
        lewis.hanly@microchip.com, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org, broonie@kernel.org,
        alexandre.belloni@bootlin.com, heiko@sntech.de,
        daire.mcnamara@microchip.com, palmer@dabbelt.com,
        bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-spi@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH v4 08/14] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <YeeCKQrdMmhmR0bg@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-9-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-9-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 17 Jan 2022 11:07:49 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
