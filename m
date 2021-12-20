Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A2447AB9B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 15:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbhLTOh4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 09:37:56 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:44863 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbhLTOhc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 09:37:32 -0500
Received: by mail-oi1-f175.google.com with SMTP id be32so16010867oib.11;
        Mon, 20 Dec 2021 06:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MX2xD6NxZlK32RqDAc9k/pbvJlT/hpUSltlaWuBfZyY=;
        b=EFHAOJhyVqLeqLC/eUZp83i4qW9h4YsxiQz2Endqotu0xrixWxvWd51u/Mqkb7sMio
         h1Lyk7zHU/w+XXWEEgVN3nKVgjv6g+RLXclq7nzzprAVXh4W9b+Ozxm4O1+5k8KN+6xy
         XqTGAUAk5YcfTKNpVtaCVP0Ahj97GESfyZvC+rm5DzW0nr/SXBiyg96cardibAGmTXYx
         BaRm7Y5xBsHam/DpXYVW8zj5cr4360MEa6PZsVWOd6/6IzxloEx6JGSaTz2a1rZExP2y
         EmyzyOLEyAkn0MqxUzZBstAbOTf9K9C8J7lupepcNiEftPFer015i4OyhcLXUFuc/ZCj
         RsTw==
X-Gm-Message-State: AOAM531PojBh0b0PMiH0ad3dIU3BUpU2gh04Izx25rJJo1R2ztYNFii1
        Du0pl3Pu0uP9Z+ShpT1I/A==
X-Google-Smtp-Source: ABdhPJwb8Epp66kgn5FAQJGNGoQLiIht6dxhdac9TXEyh6nIWNGhfonlF1xdobHH+VltWNqopZLZIQ==
X-Received: by 2002:a05:6808:11:: with SMTP id u17mr1043535oic.88.1640011051574;
        Mon, 20 Dec 2021 06:37:31 -0800 (PST)
Received: from robh.at.kernel.org ([12.252.7.226])
        by smtp.gmail.com with ESMTPSA id ay40sm3423367oib.1.2021.12.20.06.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 06:37:30 -0800 (PST)
Received: (nullmailer pid 3403888 invoked by uid 1000);
        Mon, 20 Dec 2021 14:37:28 -0000
Date:   Mon, 20 Dec 2021 08:37:28 -0600
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
Subject: Re: [PATCH v2 07/17] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YcCVKFm+7aEG2FYH@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-8-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-8-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 17, 2021 at 09:33:15AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..d57460cbe5e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> +
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2

Need to define what each one is.

> +
> +  microchip,prescaler:
> +    description: |
> +      The prescaler divides the input frequency to create a time-based strobe (typically 1 Hz) for
> +      the calendar counter. The Alarm and Compare Registers, in conjunction with the calendar
> +      counter, facilitate time-matched events. To properly operate in Calendar or Binary mode,
> +      the 26-bit prescaler must be programmed to generate a strobe to the RTC.
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rtc
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    rtc@20124000 {
> +        compatible = "microchip,mpfs-rtc";
> +        reg = <0x20124000 0x1000>;
> +        clocks = <&clkcfg CLK_RTC>;
> +        clock-names = "rtc";
> +        interrupts = <80>, <81>;
> +    };
> +...
> -- 
> 2.33.1
> 
> 
