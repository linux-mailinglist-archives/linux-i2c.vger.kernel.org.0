Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B6449E16
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240158AbhKHV1V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:27:21 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57388
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240144AbhKHV1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:27:20 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 79F323F1C7
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 21:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636406675;
        bh=Y7JJc0+U6kzwEplSgJC6wiEdfYBfG1W5BL/0YdrFKfc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dDXw9QZEPnH3RWkBXSsBp1HtGidQk84HwbBjnhlVlK2FpgHyrtqrnz+pz04qpZcx5
         6SJVY3imXqXhtQBObxTxd4fS2qNUU+NoaLHxNZXnPlmmtYoFKHhX5I5dz+Ry6g4rhg
         WuwtXEOPRR1d5uaz/f2FxHnwY6LllG7LqAEmF+j6zxBYzhNHehukaQfc45HBtlRtsV
         Fx2vEygF9RYiF5IDcFW1lfDoxJSZTE9Dty543aBkZKAaqsBorocpxGqPp0NLM6UbgP
         FxKubf8Ry0BYVfCqQSCj9m7RraCWJbQb1jpy8vJg40kEQbFgvJnxWQVZSscJ5tOcPt
         mAKZ5ods+U3zA==
Received: by mail-lf1-f71.google.com with SMTP id p19-20020a056512139300b003ff6dfea137so6982587lfa.9
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 13:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y7JJc0+U6kzwEplSgJC6wiEdfYBfG1W5BL/0YdrFKfc=;
        b=7T1XpskKgeBDOkgYG97k3VkUOr8rVAEvRVabV2rETF/Ado5MG+hP3Hl4nu9BJMEYUn
         d6Vgti7/0hzImnGpnLMZNBkPRqAteHbpHDFgJOW3rF2bdehMRX08ZIVdrPFcViIfzGYY
         T9xGI7Ea6MTutdmptBv1/nvryrEl7iOcWMhyax3VTU6Og7Wx+3GhcyDpBbAuipm41fkE
         wtDQEqP930/7LoVD3kcPTRJR7yFI87FF2NVIh5pbfhOppq77otFvD+cdP8AXzGQUO1EU
         3V9r8MzBt4O2m9Unk+eLzmEHQ28PV+q7xFDqfa5rXIYJY2++Ja0wZwTXtndJMUFB+AXA
         zyNQ==
X-Gm-Message-State: AOAM532uMI4LW6WGqhVucbMXaLzYOjATYaOiAbyovJD3uGTeGQORn5nk
        33uVN2H3W3BngQGUtxey1jv48PrBjzSfrTohiYN40y9N4nkuTOY5MIjMiRCC3opF5QUZv5UFrr2
        JqVY69vnqx9YNbVtGySaX/Ekx1f5d7gX1xsO+Ig==
X-Received: by 2002:a2e:9e9a:: with SMTP id f26mr2148895ljk.5.1636406674795;
        Mon, 08 Nov 2021 13:24:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylgOK2qEDLO2VW2NKAsbccQAr7SqWFQnW99//GKd70QgQ9o3EaaIBtTJ90jG68v573qQR4Pw==
X-Received: by 2002:a2e:9e9a:: with SMTP id f26mr2148868ljk.5.1636406674591;
        Mon, 08 Nov 2021 13:24:34 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t12sm1930697lfc.55.2021.11.08.13.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:24:34 -0800 (PST)
Message-ID: <1a5cdfe4-cb7c-502e-1810-8c47cb2f6282@canonical.com>
Date:   Mon, 8 Nov 2021 22:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
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
 <20211108150554.4457-11-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-11-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> new file mode 100644
> index 000000000000..efed145ad029
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/microchip,mpfs-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS {Q,}SPI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This {Q,}SPI controller is found on the Microchip PolarFire SoC.
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"

No need for quotes.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-spi
> +      - microsemi,ms-pf-mss-spi
> +      - microchip,mpfs-qspi
> +      - microsemi,ms-pf-mss-qspi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2

This does not match clock-names. Describe clocks instead. Are you really
sure your hardware can have an optional second clock?

> +
> +  num-cs:
> +    description: |
> +      Number of chip selects used.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    default: 8
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      spi0: spi@20108000 {
> +        compatible = "microchip,mpfs-spi";
> +        reg = <0x0 0x20108000 0x0 0x1000>;
> +        clocks = <&clkcfg CLK_SPI0>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_SPI0>;
> +        spi-max-frequency = <25000000>;
> +        num-cs = <8>;
> +        status = "disabled";
> +      };
> +    };
> +...
> 


Best regards,
Krzysztof
