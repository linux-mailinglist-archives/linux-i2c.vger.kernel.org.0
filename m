Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFA8493357
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 04:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351084AbiASDKg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 22:10:36 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:40844 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238949AbiASDKf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 22:10:35 -0500
Received: by mail-ot1-f51.google.com with SMTP id x31-20020a056830245f00b00599111c8b20so1227152otr.7;
        Tue, 18 Jan 2022 19:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MS2fURrf1nnAP7sSkdeRoaX+N07h6MHgI/yoTSDi19c=;
        b=UfrMsJ14YKgsKcU8aP2mL40pUw735Uu2MthHF0twUe8XmCrlrhqFcd9PgQZ7H1/f/z
         G/0NYh9OUW1Et/RgUfeQZZyLP/xIN8vax2PdSY5RASDAhxjsgR39vQG81Mt753g/nTRG
         piUSWCR+7UAX5lz9xZxaMaaTdwoiVtsoKAZ/gQXr0ZvpdqJ/3N9np3/LcYGwSQp1oHYL
         5UAks8SKfB6kRpQl7YgHpCkUNb1OiZI62U6mahIv33BNeapibkZijmkoH2EdWVRGveaU
         GfYk29TViWD44YwquDvMtbktixKkeVwAua5iWccm9CtbJNn8CJmL/eyI4Ik9LGRit0YY
         f8dw==
X-Gm-Message-State: AOAM531MRPS4OcX8z9yfSgf7dYo5aMCdLg0n3WltwQg0ZeBAjHl5M7Zz
        qmOyQ6qWEa0ptBmgTgIZiA==
X-Google-Smtp-Source: ABdhPJyZL7Pc5y5Wxqi8b6iBReEOkkhPbvIJQQDOpLQ7RrJ4fK7SIMgpc6ViWZt+LZWYVq80y2yjhA==
X-Received: by 2002:a9d:3f1:: with SMTP id f104mr652207otf.28.1642561834561;
        Tue, 18 Jan 2022 19:10:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id be4sm5860001oib.56.2022.01.18.19.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:10:33 -0800 (PST)
Received: (nullmailer pid 2563196 invoked by uid 1000);
        Wed, 19 Jan 2022 03:10:32 -0000
Date:   Tue, 18 Jan 2022 21:10:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     palmer@dabbelt.com, u.kleine-koenig@pengutronix.de,
        aou@eecs.berkeley.edu, broonie@kernel.org,
        jassisinghbrar@gmail.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, geert@linux-m68k.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        robh+dt@kernel.org, atishp@rivosinc.com, bgolaszewski@baylibre.com,
        lewis.hanly@microchip.com, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org,
        ivan.griffin@microchip.com, bin.meng@windriver.com,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        linux-crypto@vger.kernel.org, thierry.reding@gmail.com,
        linux-usb@vger.kernel.org, daire.mcnamara@microchip.com,
        devicetree@vger.kernel.org, paul.walmsley@sifive.com,
        heiko@sntech.de, gregkh@linuxfoundation.org,
        linux-rtc@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        lee.jones@linaro.org
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <YeeBKAHgEcHTAfQY@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-4-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 17 Jan 2022 11:07:44 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
