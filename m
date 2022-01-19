Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D22849337B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 04:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349212AbiASDNo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 22:13:44 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:36784 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242118AbiASDNm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 22:13:42 -0500
Received: by mail-oi1-f171.google.com with SMTP id r138so2067479oie.3;
        Tue, 18 Jan 2022 19:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5ZZFJPHidCQVOJUgXU8NDVDeCWWOb2ixXDJzmOrCI4g=;
        b=1U6Lqbor7FguyCDaDzuhuxxiDy1d+8ghzpyIdUVoAPEu59m90UfUJI2CnUW34Qlzuo
         gEeOdU7+D1DQbr+VNyl39xikOMw0LenxrYDzfwYCvHzCBhqib5C3Zcvc+fdWPbypQUg3
         WZEXvK/LRMwnHGK9ymrndsNZjOIbF3OFQ+Qb7uV/dvKDo72sPc4jMdx4rmtIA8cQUMGy
         z0LZljiPoIDGbGYMeYwwQfmElyvCT43+2KQZ5Vm6B6VU2yuRMwOj1ygc1g8jgQpI8Uq6
         gJZ9bEVAdlxWn5/q/fe987wuj3vzxaJCZd5ZVzcCHfrN7nQFRaD5PXODMfNO/n+YZii+
         vYKg==
X-Gm-Message-State: AOAM532tH4IZ2kjrCoLmcDrdylkeqthhxikEsePNHzAxSR+sr8LLZ2c1
        35QNIMxBbYfo/6nckirPdg==
X-Google-Smtp-Source: ABdhPJy2hTQOyUUWRx/WNPYhoR/ZWBW976YqG168isT8JwwEo4TiwlcPB529jQ2MNsb4Kw0w/NOk9A==
X-Received: by 2002:aca:bd89:: with SMTP id n131mr1334026oif.64.1642562020944;
        Tue, 18 Jan 2022 19:13:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u27sm7967798oth.18.2022.01.18.19.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:13:40 -0800 (PST)
Received: (nullmailer pid 2568888 invoked by uid 1000);
        Wed, 19 Jan 2022 03:13:38 -0000
Date:   Tue, 18 Jan 2022 21:13:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, broonie@kernel.org,
        linux-crypto@vger.kernel.org, jassisinghbrar@gmail.com,
        geert@linux-m68k.org, heiko@sntech.de,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        aou@eecs.berkeley.edu, thierry.reding@gmail.com,
        linux-pwm@vger.kernel.org, lewis.hanly@microchip.com,
        linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        bin.meng@windriver.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-spi@vger.kernel.org,
        bgolaszewski@baylibre.com, ivan.griffin@microchip.com,
        a.zummo@towertech.it, palmer@dabbelt.com, lee.jones@linaro.org,
        daire.mcnamara@microchip.com, atishp@rivosinc.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, krzysztof.kozlowski@canonical.com,
        gregkh@linuxfoundation.org, paul.walmsley@sifive.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 07/14] dt-bindings: usb: add bindings for microchip
 mpfs musb
Message-ID: <YeeB4tI+zhnzoHiA@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-8-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-8-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 17 Jan 2022 11:07:48 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
