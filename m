Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48E847C0CE
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 14:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238238AbhLUNdA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 08:33:00 -0500
Received: from mail-qt1-f173.google.com ([209.85.160.173]:39557 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbhLUNdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 08:33:00 -0500
Received: by mail-qt1-f173.google.com with SMTP id f3so1504504qtf.6;
        Tue, 21 Dec 2021 05:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DHbNzpt0iAUYfu5r/W24qY79bvlSWjiGM23ZPveiPVQ=;
        b=D99EakVYIDlTNLRRy/o58sdPMyM9yD1FRibjY6f46mlgBZ9U6F5eK01/fb6hgRnfGK
         iGGAbHVUlSQuTdGBOKxz/xzZg4DKPJx1kalrO+5aNdXBEnqNUkbKde4B7hs+4JETN0+9
         Fwd0qw+6SzkUZIIKpvvcDrfuU1L7Y/VFCy98IrfHwHcLkPvMsNpYh2l23S3sH+2Bh4KB
         g3JuNwj2l5CHP8GA/sbnUGMbQ3q/nrC2ErTZf0BM1ZXOnwCuyQp24CjVzOdnTkA2JZoT
         eKuCwxX65GidpJ8tquztwHNzHx7qm+PnvW58vEe7aLiFX4xlkLLUV8laVocBbLbK99pP
         kIhA==
X-Gm-Message-State: AOAM532Tj9O9qRndsYTrvz4r+XgVwrrCaHVg05K7WK0NerVq3mpxKaOW
        qyw9Skny/+gioCyyVew8AA==
X-Google-Smtp-Source: ABdhPJy3Z1ImApelVtQQKouP5J7Mv1P6nlUyv+LtrwSb6ZYUeEsizGUI8yk3xIcWpcpRQ2mkxiO6CA==
X-Received: by 2002:ac8:4f07:: with SMTP id b7mr1371584qte.301.1640093579004;
        Tue, 21 Dec 2021 05:32:59 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id y16sm12642056qkj.69.2021.12.21.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 05:32:58 -0800 (PST)
Received: (nullmailer pid 1262982 invoked by uid 1000);
        Tue, 21 Dec 2021 13:32:55 -0000
Date:   Tue, 21 Dec 2021 09:32:55 -0400
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
Subject: Re: [PATCH v2 11/17] dt-bindings: usb: add bindings for microchip
 mpfs musb
Message-ID: <YcHXhyYhFfPty7mA@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-12-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-12-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 17, 2021 at 09:33:19AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-musb.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> new file mode 100644
> index 000000000000..eec918046c73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,mpfs-musb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-musb
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: dma
> +      - const: mc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +      - peripheral

Reference usb-drd.yaml and you can drop this.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - dr_mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    usb: usb@20201000 {

Drop unused labels.

> +        compatible = "microchip,mpfs-musb";
> +        reg = <0x20201000 0x1000>;
> +        clocks = <&clkcfg CLK_USB>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <86>, <87>;
> +        interrupt-names = "dma","mc";

space                              ^

> +        dr_mode = "host";
> +    };
> +
> +...
> -- 
> 2.33.1
> 
> 
