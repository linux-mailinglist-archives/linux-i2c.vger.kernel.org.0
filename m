Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C9C735B92
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbjFSPxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbjFSPxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:53:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1281A6
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 08:53:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso5169971a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687190007; x=1689782007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9C0eOPlOJP8V7Ip24tLQWIiF2xkZMIZCHkz9YcWfUI=;
        b=tX7OM+KWr4Hy4uNLPIMvteQMGvnj/szzpPKV/8dYdqBP9FcNhOOnAIh46jnOtH3vbV
         lzeove+AUuoKLkpeB+FD6A3nqXdGwXm2HybOzcvASy+1Eyey53EHBfjE1oz9jE0B8dDj
         JcDtBMs/PqBmsBr5EcWbb4i9s8NCP0MADAwt5lPS4JBJlOTPDQJQb5fO7hh55dWM4AWc
         uY+01hJZfPS3KAA6fsqfgxutSkaUsF+Duw3gH6lQUouOftHpojQG1zqK0arEGL6F1Hqb
         P/HoA9I3jf30GE4P+7uAbhux2tlLqReowHzB7BN7Z0vBus+Vtb2Ir5jH8EeCniEgGKz5
         H41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687190007; x=1689782007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9C0eOPlOJP8V7Ip24tLQWIiF2xkZMIZCHkz9YcWfUI=;
        b=HMS1npQjKgWLmioIWpm9Qr4qUJXwRvSl2W4GmHrVT5WoZKh165h0BwnbtKaG9ZtmCp
         LheOK1diIWJf5iaFantUXRdbKTW6TiZWJq4YZSpKymxnVUB9fKqMV31Ra2hzi2UPGeW7
         deWK2UloWBfCzQrJ9i3HZj93TRmhFxyi6jZeESfI4Aw1WqxgnLyN1Og7HaJzE/DNFM8C
         4W6LRo3ibSVbp16Zv/ZQFgCxUigOJZ+pm7pGpr3n+GPCOXQPcnS6p2o5FcnJlHhGdqVC
         JGEFGBrDTYCLVlXZ2dYJ825Sek7IVEcgna/uPH+DyA7URfRvrVYK4FBvPDP4zpwEVfyG
         P7tA==
X-Gm-Message-State: AC+VfDw6VR5oNKe0BHI6d8MvE1kQElycncCwlNYHRqsixJg7Bl1Ghxaf
        X96z4GDs0+16L0tumEjhPBVw7w==
X-Google-Smtp-Source: ACHHUZ7EhsSON+0iDLU7SFoiPsSaaDvttIqPgPSWBnvrDoHzQm0L74fJieTmYJCW/OUCpu0ZP3K4BQ==
X-Received: by 2002:aa7:d610:0:b0:51a:5993:4308 with SMTP id c16-20020aa7d610000000b0051a59934308mr2553624edr.28.1687190007394;
        Mon, 19 Jun 2023 08:53:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j19-20020a50ed13000000b0051a216e7df7sm5193226eds.87.2023.06.19.08.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:53:26 -0700 (PDT)
Message-ID: <32b0e664-9381-19c4-de9d-9466a00b4f50@linaro.org>
Date:   Mon, 19 Jun 2023 17:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230619153732.46258-1-clamor95@gmail.com>
 <20230619153732.46258-2-clamor95@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619153732.46258-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/06/2023 17:37, Svyatoslav Ryhel wrote:
> Document device tree schema which describes hot-pluggable via GPIO
> i2c bus.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

1. Don't send new version before discussion finishes. v2 after one hour
is definitely not enough. Usually one day.

2. Test the patches before sending...

What changed here?

> ---
>  .../bindings/i2c/i2c-hotplug-gpio.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> new file mode 100644
> index 000000000000..21f2b74ca6c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-hotplug-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO detected hot-plugged I2C bus
> +
> +maintainers:
> +  - Michał Mirosław <mirq-linux@rere.qmqm.pl>
> +
> +description:
> +  Driver for hot-plugged I2C busses, where some devices on a bus

"Driver" so SW? Bindings are for hardware, not for drivers.

> +  are hot-pluggable and their presence is indicated by GPIO line.
> +
> +properties:
> +  compatible:
> +    items:

Drop items.

> +      - const: i2c-hotplug-gpio
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts-extended:

I missed last time - this is wrong. Just interrupts.

> +    minItems: 1

maxItems

> +
> +  detect-gpios:
> +    maxItems: 1
> +
> +  i2c-parent:
> +    maxItems: 1

Discussion from v1 stands - this is a software construct, not a real device.

> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - interrupts-extended
> +  - detect-gpios
> +  - i2c-parent
> +
> +unevaluatedProperties: false

instead additionalProperties: false

Anyway, don't send v3, before the discussion about the entire concept
finishes. You create a software/virtual device, instead of adding these
properties to bindings for a real hardware.

> +
> +examples:
> +  - |
> +    /*
> +     * Asus Transformers use I2C hotplug for attachable dock keyboard
> +     */
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c-dock {
> +        compatible = "i2c-hotplug-gpio";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        interrupts-extended = <&gpio 164 IRQ_TYPE_EDGE_BOTH>;
> +        detect-gpios = <&gpio 164 GPIO_ACTIVE_LOW>;

I don't think you can have both interrupt and GPIO on the same line.

> +
> +        i2c-parent = <&gen2_i2c>;
> +    };
> +...

Best regards,
Krzysztof

