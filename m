Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8314AA36B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 23:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbiBDWqr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 17:46:47 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34653 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbiBDWqq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 17:46:46 -0500
Received: by mail-oi1-f181.google.com with SMTP id i5so10272044oih.1;
        Fri, 04 Feb 2022 14:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L8b72xGfF9umAJJg7tsHu1AkAehHlvUS7fj1GSuG6R0=;
        b=SsmQdf125ZC7D7bi5po4392pweglzD3wfDKfWzcCv2vI8/ax1/BW8zQDr5ebUnErBi
         PBq1O/oaFCoskp6eAMSCc4Q9NgVicvHEEer2IjK6eL0L+cEbdCe3bT6mQ9vD7a2LfT5A
         4XP0IIitkTeslRv+CyGUf4v4nTYSgv7X9NChbVTUyLsQNiPDRKDZ3wWjpFteRUObC0Dz
         kFk1VGIbyMXQvfP1i1sXiaRFq5YAfTu9VzzvBjZoRQt58WvXkczNVM3eo3F5FrS32SkB
         3JPtts0YMY+mUcgyA5oXCmO+vXa2aTwCv4sTmbNmRACHcFirfNdmupB7mfoUO2Hk3TOR
         372A==
X-Gm-Message-State: AOAM532ucfgIb+p7QszOXiJB9HT6UBEfMzruTiccOXfq5KbaHWuND8sV
        QcPAG51saYiR3z6dDCCNscU6p5sbyQ==
X-Google-Smtp-Source: ABdhPJwxV7g+49b86KSwvPAvbdlz385/Vu9mnW4I2sV9P9k4qH3MueJC6HWx5Bhq3KvuLey/MH/2Zw==
X-Received: by 2002:a05:6808:1981:: with SMTP id bj1mr2364232oib.213.1644014806196;
        Fri, 04 Feb 2022 14:46:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m7sm1268743ots.32.2022.02.04.14.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:46:45 -0800 (PST)
Received: (nullmailer pid 3324348 invoked by uid 1000);
        Fri, 04 Feb 2022 22:46:43 -0000
Date:   Fri, 4 Feb 2022 16:46:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com
Subject: Re: [PATCH v5 04/12] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <Yf2s0w4Yi6rcxukj@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-5-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 11:47:19AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..f35cca4e8656
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,58 @@
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
> +    description: |
> +      The RTC on the PolarFire SoC has a pair of interrupts. The first is the
> +      RTC_WAKEUP interrupt. The second, RTC_MATCH, is asserted when the
> +      content of the Alarm register is equal to that of the RTC's count.
> +    maxItems: 2

Rework something like this:

items:
  - description: RTC_WAKEUP interrupt
  - description: RTC_MATCH, is asserted when the content of the Alarm 
      register is equal to that of the RTC's count.

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
> 2.35.0
> 
> 
