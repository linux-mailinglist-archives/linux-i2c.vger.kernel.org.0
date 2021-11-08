Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D1B449E14
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240143AbhKHV0D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:26:03 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57302
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240132AbhKHVZy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:25:54 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C743F3F1E5
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636406588;
        bh=LGE8LB/FBAkcB4TRIytPyRbWjgGL6X6vL5F1SRAbELY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=RgeQVNvmxwG+1DstYrwlKfSLoJ0PMELT5FlOPWXrUK2MqXWuajnVlI3NE82Bysg34
         vbBR79BWgFrmp0g6dYpnjxGHkBsUeLw7Cx6igXzqb0pAPOQa0xlxlfJSr3GtX6Wx4i
         GoWrDgxDQJ5ucOd4h21jwz5h8aiJoDaSPUbvb9aSlw9xMmcSInosKRhru+BXMRAVK2
         rL915KbEsxMot2YVir1aGQ3V4s/QSczzq5fhhIPMovAfV4p2CHhlT3EPXL3P+8faqm
         pzJcS2TYcEzcrH6V0iAyvIVwv+0ND7RPpLeJNsuXtA3e4vwoiQ2BCrFWFVjUwUMNxj
         Hoevnt3UMDoxg==
Received: by mail-lf1-f70.google.com with SMTP id f11-20020ac24e4b000000b004001e7ea61cso7035119lfr.6
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 13:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LGE8LB/FBAkcB4TRIytPyRbWjgGL6X6vL5F1SRAbELY=;
        b=NJFBSjV65BdCLy78z2OEdAc9O0TYPt8WwplYl9XIwvYQaLOgHz7PDJ79G64BacCjEA
         8cJQsYIg/0YhRVxfKYkMMrldHVsPlqMjcXzqO1HZQKyJhirsECdHlR4BoiUNHXDyrUai
         cH810alxt9dCMeANF9GuolfzCgfVUqvNM4SkYRBnw8JEngQYq8w8VahLsaUpYxbKEsNX
         BLTcoRf69ff5iOfseeWfq47a8i2j3cFtxwZRpzN7BWak82PI18aZa4ow/8+x8a3Jm/ae
         1Rg402rDr3r/ppRzR15sjknGwDMRZrf10goZIAxb8+xqc52R2RR+v+HK34g+a+QRZiL6
         UNOQ==
X-Gm-Message-State: AOAM531ESWGja+h/y+tx8NUkuupc6ddZVG98BaDOX3KXhSEnFmzFDTnK
        Bc+rxmC79inh2d2Qc0vPzvlsamMKYevXnaX8enHikfEN/2dDJMIWLQLEeIrqP7t2ixGI01+/70d
        d/P2ngwB/2oOyi+mI5D0bx/BhF3VE+7HB8YnYFw==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr2103088lfr.295.1636406577553;
        Mon, 08 Nov 2021 13:22:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB7FyQWj/NmtQFBLUENuBzYTo1Q2sgSi5SS19LKPFN5m1tS8X7ElRsBjIRBzYTlTUREatNxw==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr2103056lfr.295.1636406577370;
        Mon, 08 Nov 2021 13:22:57 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t204sm318596lff.87.2021.11.08.13.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:22:57 -0800 (PST)
Message-ID: <d40ebfa0-2037-9480-f392-c58db885d5a1@canonical.com>
Date:   Mon, 8 Nov 2021 22:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 09/13] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-10-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-10-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> new file mode 100644
> index 000000000000..067019ddc1f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS GPIO Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This GPIO controller is found on the Microchip PolarFire SoC.

If "Microchip MPFS" means "Microchip PolarFire SoC", then this is
duplicating the title. Similarly to your previous patches. Skip it then,
there is no point to have descriptions which are obvious or duplicating
existing information.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,mpfs-gpio
> +          - microsemi,ms-pf-mss-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> +    minItems: 1
> +    maxItems: 32
> +
> +  interrupt-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    description:
> +      The number of GPIOs available.
> +    minimum: 1
> +    maximum: 32
> +    default: 32
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      gpio2: gpio@20122000 {
> +        compatible = "microchip,mpfs-gpio";
> +        reg = <0x0 0x20122000 0x0 0x1000>;
> +        clocks = <&clkcfg CLK_GPIO2>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        status = "disabled";

Skip status=disabled.

> +      };
> +    };
> +...
> 


Best regards,
Krzysztof
