Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD48D449DEE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239990AbhKHVW4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:22:56 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57054
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240023AbhKHVWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:22:52 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B097A3F1B2
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636406406;
        bh=BBCz5m288/6B12v/4PrZDookC7OdH/YJwtMGpm+/mUI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Cb6k9uKiIZ4zUHiv22e0ILLsUjOU6nvoM4n11PVA1oyIfDHtYuESnr7aq7KMLI0Qu
         aOh7yxIajgwNb1Igszh77fq8hoAbolLBlFZJucoixvksUotw48LD6Hbz+8i7P4t6Ar
         h1Mxr9ZXuo2CEKtYWg8IlknkaL1GUz84rcSWMjH+EQxDJ5hMNVhcNGD/3J5YgG/zGP
         B9cWf79kJ29+t06SltR5nYnJZhjYbmvdMdnfXTSM/fiNo+wtX6cwaipI+0rkLrPlpG
         kuKH5Rd6YF43THnJqT8pXVoUKu3hZEg25MtGZ0bG8vmJvQMIxcXP86es8XFizmj4PQ
         fIqxJJ5WJ/PSg==
Received: by mail-lf1-f72.google.com with SMTP id x17-20020a0565123f9100b003ff593b7c65so7004166lfa.12
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 13:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BBCz5m288/6B12v/4PrZDookC7OdH/YJwtMGpm+/mUI=;
        b=Jgv5wIosT3v6FMMEeZz/udboMdsMfVTqEt4ipJGlbouQSUc/FDE1sxjoM/0otsM08g
         KR4D2WeI5bgq3vhzo8Z3/GcVlrGCOYRsOo5Ha3RXbPR7xVG4x001yiAP5xPGDNodveN7
         XXqaw6WBlV/NBKnYCH0mmtb0sPXc5NXKkyTvgo/YELzImHC+UAZUnG7a3dFfAdcwBXYS
         n4J7jpq307HFcWLS5nAW3jYWtUcaoaxIa6wzxqwvcoq1p+Z13IEowzphAE6QY7e4AXJd
         88a2Ho32LthUJ1U8m6+NNt3TMKREYrNtkhzyZYsl4HYpnvqUyQ1ieq1NDvrLM06k0PdB
         TgrA==
X-Gm-Message-State: AOAM531+R6gdTTDCbl/KUSIx71vW/cenKq9YeteYZG22GCSxphn+vXkF
        FRDjhO5MinRQ3QRzev52lYz80N2NqDX0Mavdsch0dBliLzHX8ReI+v4u8/yEQuPbCTKK/ZzaORa
        SVeibVdR8CK+sPH7/iCpMaXkshwXKGzeMnOJovQ==
X-Received: by 2002:ac2:5d28:: with SMTP id i8mr2128722lfb.238.1636406406066;
        Mon, 08 Nov 2021 13:20:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu/B5eBEcFJARxr5eQlDulLCW/jLcGfsjKWhT8FzmI0lnwtMZI6RqmAm6JEjvloPtHRe6cxQ==
X-Received: by 2002:ac2:5d28:: with SMTP id i8mr2128702lfb.238.1636406405870;
        Mon, 08 Nov 2021 13:20:05 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z13sm1401476lfd.139.2021.11.08.13.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:20:05 -0800 (PST)
Message-ID: <43023c6f-ea1a-fcef-381d-a39f8799ec0b@canonical.com>
Date:   Mon, 8 Nov 2021 22:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs
 rtc
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
 <20211108150554.4457-8-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-8-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..c82b3e7351e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,61 @@
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
> +  - $ref: "rtc.yaml#"

No need for quotes.

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
> +    maxItems: 1
> +
> +  prescaler:
> +    maxItems: 1

You need to describe the type and add description. This does not look
like standard property, so it needs vendor prefix.

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
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Add a blank line before new node. The same in previous examples.

> +        rtc@20124000 {
> +            compatible = "microchip,mpfs-rtc";
> +            reg = <0 0x20124000 0 0x1000>;
> +            clocks = <&clkcfg CLK_RTC>;
> +            clock-names = "rtc";
> +            interrupts = <80>;
> +        };
> +    };
> +...
> 


Best regards,
Krzysztof
