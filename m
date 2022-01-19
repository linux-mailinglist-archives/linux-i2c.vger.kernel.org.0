Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED21493367
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 04:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351227AbiASDMu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 22:12:50 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:33434 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242118AbiASDMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 22:12:50 -0500
Received: by mail-ot1-f42.google.com with SMTP id y11-20020a0568302a0b00b0059a54d66106so1319277otu.0;
        Tue, 18 Jan 2022 19:12:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5gqey38xnzQ/AN6icaaKVGYlCqtKz1/9M6zJm85riEI=;
        b=KbxQoNQBnTUYjkIO4MjtxOTJbr5vxe+D9qMTtHmzlOpuub6K8lAAwWbQlu5kMs331o
         EIPcpx6ywHvcpFt3EXiT2A0fIPcuO9rsCHBPvh8m1llHjVDP3u0FSXzX4zTd7F6KZ8jS
         qY39nJZHnkc5GPGKB8iLDkVMyWyAOQzvd5oONPbZoh40ArSEKMiLMgTDIiUVoxoARLSJ
         dfcXNbwS0C0wjvSc+Lgd1e3esoI6/SqeSbO113YhruzFU4eVJyACjP9VW9Hg9tUqsph8
         X8VdhCrRKS77MhYDPG1iNML44eJn8+jMp/gJHOfY6B2HKBNNSkKD+rak5TC64YVmRcJO
         jRiQ==
X-Gm-Message-State: AOAM533ZZkl+3SrX96VF3mwwSFUfA9Jgr8Q2v0qZBuu/JZn4ohVev5ma
        NewoSdGktMrLO+WDacwiNA==
X-Google-Smtp-Source: ABdhPJxmwOB9i9klU93vugx+vRG9v6l4pFJ4EZu0dVzcyzNM+5q6DVy3tGoLX992X/2vFuKpHlZRuw==
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr17523306otr.259.1642561969166;
        Tue, 18 Jan 2022 19:12:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y21sm1991619oiv.53.2022.01.18.19.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:12:48 -0800 (PST)
Received: (nullmailer pid 2567106 invoked by uid 1000);
        Wed, 19 Jan 2022 03:12:47 -0000
Date:   Tue, 18 Jan 2022 21:12:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     thierry.reding@gmail.com, palmer@dabbelt.com,
        krzysztof.kozlowski@canonical.com, a.zummo@towertech.it,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-spi@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
        alexandre.belloni@bootlin.com, heiko@sntech.de, broonie@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, linux-riscv@lists.infradead.org,
        geert@linux-m68k.org, aou@eecs.berkeley.edu,
        linux-i2c@vger.kernel.org, daire.mcnamara@microchip.com,
        atishp@rivosinc.com, linux-gpio@vger.kernel.org,
        paul.walmsley@sifive.com, ivan.griffin@microchip.com,
        bin.meng@windriver.com, devicetree@vger.kernel.org,
        lewis.hanly@microchip.com, lee.jones@linaro.org,
        linux-rtc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 05/14] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
Message-ID: <YeeBr+iNXCQWJxso@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-6-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-6-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 17 Jan 2022 11:07:46 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
