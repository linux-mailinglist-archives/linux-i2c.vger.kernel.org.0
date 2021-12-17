Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CB0478E8E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 15:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237597AbhLQOxt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 09:53:49 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36252
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237598AbhLQOxs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 09:53:48 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6800F406EC
        for <linux-i2c@vger.kernel.org>; Fri, 17 Dec 2021 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639752827;
        bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KLPLLgBW60YBEviAdw/IUsGAqq7VS7v9iN136JUYF99xIijuRr3TOTpG5YSXlKhTl
         eQ+UpdHZDzON5bkFvzpbjoWW69kT3+da6KnzSzvSgB8np6Nd5qwYSooKvwfOsZpATt
         THyWaio5vBduQ5wDjFnB7pYvh2gqbF41BYd4zsBr70FzwRKKQ6AUJ+EfK8oh1z0bme
         JnveN0ASKX2NB34mnZFf1X+/6aMjbNs86DGFl16Y/ekSSve+yNc2Hg38Zff8ZVqgl2
         lBpenj5jdXK46dOx6bcHAEi0mn2G/eo3BJLp/Lsd/55F9Wg4tBN1vImZDcgux1KKrQ
         qcN1VKB9sBdkw==
Received: by mail-lf1-f72.google.com with SMTP id f15-20020a056512228f00b004037c0ab223so1001308lfu.16
        for <linux-i2c@vger.kernel.org>; Fri, 17 Dec 2021 06:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
        b=1l6qmE3oZaI1fQSTy+U6o4i/nHSFZMMqcgvpjW9HY+31Xl+PsNYMO55/QswM63fsKK
         JIs0F4yHffDUTdObtqm3+OXllKUcg6GZIbqRbulxxJd1GBdIOCxgs56+NgQeKnrocrXL
         gE68n0LBXkpDSHu4q90+OOZtvTWY77sXv3dVvdGJqauZYPWAe+AM0pTdPnw5AxvLBdZi
         SBZvK/zAS/8kegHHDANfow7ktxmDjUSrGcfs+aYbkxt78OQSOOcGcHsf+5xZC5J7gTXs
         9PKjEdMSv83HJXyd5X3d4jd0DUDzwgcIyZELrRUpxWytu2TtqDi/++Bp/Ykdv7u3dL0e
         ZXLQ==
X-Gm-Message-State: AOAM5315FctJkGbIicr0wsqMzHMWwv3WDwNTOknzdNvXwEAJPjaRbjH/
        VYsUfCPPUjSTkepYfzQBY+EWCt5W6lWX72ZgYhJ3rEoZcl1jjEJpghLy5AkgHIgae2iJMpi8BI+
        RBz9l6l/Tc/ke6n4gz17bgEAg+ZtZWKpL987QtQ==
X-Received: by 2002:a05:6512:2250:: with SMTP id i16mr361826lfu.24.1639752826422;
        Fri, 17 Dec 2021 06:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWZAhKPzpNiuI3jFYeXfUrK3lYJtF2bSZiJkAI3tx170rbCKWelfdxX/kRZ9W0bjHvtpmAig==
X-Received: by 2002:a05:6512:2250:: with SMTP id i16mr361809lfu.24.1639752826232;
        Fri, 17 Dec 2021 06:53:46 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 76sm1687531ljj.69.2021.12.17.06.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 06:53:45 -0800 (PST)
Message-ID: <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
Date:   Fri, 17 Dec 2021 15:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-7-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..32cbc37c9292
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS random number generator
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  The hardware random number generator on the Polarfire SoC is
> +  accessed via the mailbox interface provided by the system controller
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-rng
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwrandom: hwrandom {

Three topics:
1. Node name (as most of others are using): rng
2. skip the label, not helping in example.
3. This looks very simple, so I wonder if the bindings are complete. No
IO space/address... How is it going to be instantiated?

> +        compatible = "microchip,mpfs-rng";
> +    };
> 


Best regards,
Krzysztof
