Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FBA47C591
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240761AbhLURzk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:55:40 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]:34778 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240752AbhLURzj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:55:39 -0500
Received: by mail-qk1-f171.google.com with SMTP id t6so13346038qkg.1;
        Tue, 21 Dec 2021 09:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4GSGA/qwtNXG0IPZ01RqeQiJyKL3VoAZk2c0sbKkobg=;
        b=hlfjFvMtD79EiL/LGYq82Z1elOoAOubXKDaCJkEHPoftWwakQIsYns8HVhu/mnQPum
         2k1ZiIHWFYJYRo1XuE7Ni9+1ToDmJbOMqtJ7gWazRPyS0o0OsE8mFT5ZBwB6WnAryTYt
         0Aogzc2pbINGNJQavvaoc4eE1/WzLf4de6pG6YL8vIavMjiDgeRedqTlGlAu6zqlGrq0
         SShn+4CUa0bAvoN/dCtNBwnxUdYSIqdBc1uEFiEuZISrUs/Py5e7HjRIDexdJxhEjwsm
         cCDzeljhIj/Q8KnwpHOYIQeEhB1wFJx873LVBp1XCjR+mfph2ZMhX45IpiA4k23p3+Or
         Q/Xg==
X-Gm-Message-State: AOAM531pTbm2BROPCb0zP4FG6ljA96TPzvJtT390rerLdu1ti+w1gYAk
        0xHaYFz1lF6FU/pEHWvjWQ==
X-Google-Smtp-Source: ABdhPJz5vgBn1TjeZtoc2YYKvQ+HmcEPZTFsNL3qHHc8SbteC0W1UmfcNlqbGX3NnNYb5boB3sk4Pg==
X-Received: by 2002:a05:620a:258e:: with SMTP id x14mr2824830qko.578.1640109338673;
        Tue, 21 Dec 2021 09:55:38 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id bm35sm14659623qkb.86.2021.12.21.09.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 09:55:38 -0800 (PST)
Received: (nullmailer pid 1495705 invoked by uid 1000);
        Tue, 21 Dec 2021 17:55:33 -0000
Date:   Tue, 21 Dec 2021 13:55:33 -0400
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atish.patra@wdc.com
Subject: Re: [PATCH v2 03/17] dt-bindings: soc/microchip: make
 systemcontroller a mfd
Message-ID: <YcIVFZSqt/JSuk3J@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-4-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 17, 2021 at 09:33:11AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Make the system controller on the Polarfire SoC
> a "simple,mfd" so that the services can be child
> nodes of the system controller node.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-sys-controller.yaml        | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..014cb44b8f31 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -13,13 +13,34 @@ description: |
>    The PolarFire SoC system controller is communicated with via a mailbox.
>    This document describes the bindings for the client portion of that mailbox.
>  
> -
>  properties:
>    mboxes:
>      maxItems: 1
>  
>    compatible:
> -    const: microchip,mpfs-sys-controller
> +    items:
> +      - const: microchip,mpfs-sys-controller
> +      - const: simple-mfd

'simple-mfd' means there is zero dependency on the parent for the child 
nodes. Isn't 'mboxes' a dependency?

> +
> +  hwrandom:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-rng
> +
> +    required:
> +      - compatible
> +
> +  sysserv:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-generic-service
> +
> +    required:
> +      - compatible

There's not really any need to have child nodes which have no resources. 
The driver for microchip,mpfs-sys-controller can create child devices.

Rob
