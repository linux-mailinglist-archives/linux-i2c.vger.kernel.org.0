Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A2753E2F3
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 10:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiFFHe0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 03:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiFFHeZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 03:34:25 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907C121E36
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 00:34:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w27so17583731edl.7
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9HK+TDhF88+7obw0w4mYyiu/hiELC8DD4i+Yh0qqxAI=;
        b=Rws31Xpdnv7f9K4DwCy36qibEYQc5DwycnvB4ZPXkoy13GEHFazCUReLzyle0Qpt6Y
         fkdGEW0QFOm3fSa4I8ZrNyHDklJjkXgaXZQP7S3QHoF9Cmmdc17TOubFpmdwh49CM05R
         NNPh0Ve+SIygMDxGiyOnyLZ2bxw0eDg8SGaUJM4WEPjYvfyYqbuJgMVeowvyFg6rBCUv
         +TY0NJy0Pb+oOxm+2xZXe0N8F4t3zJhJEkiWAtzHpRFXcYt0WkDo3jDX3j8gUEswKFWU
         umrn2w4bTo63JM52+OaugREVoloTaZNfMYJUOAr08kCyO0bmh/U5KEvIMmynuBjItbKr
         Wp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9HK+TDhF88+7obw0w4mYyiu/hiELC8DD4i+Yh0qqxAI=;
        b=HJZvodvlz4uuwpw9LYdwURynaZvvL+DOi2ZhT9+roqiokWX85ZorsVBVTu34WefFOD
         2cSGY4MrziOZDFmbghWjsMLymrAU3gUk+7i1ZULoAxYZblIzs0gBz2w8FjQ+jqgS3Axz
         3N33vU3n8oZ31wvqfpWs09DxqQTQve+w6O6XuI8qkA44K7uv3pXMQMzNks/bOyMKgy44
         bJZAIQJopCc+8WgPGAjawe9waKpWhijphs5ajLDhg49Srnr6xIH1rNVBfWwPqcR5IdeM
         c8aCAS6NkKiCRgsbnSWHrv5aIPAUC3R83VSCCEqZX+IuJOb8RsZoFqD44uan3mxOiLjZ
         PYDw==
X-Gm-Message-State: AOAM532XfLeHNeslOWOx45OTDzXqYb+JtoHsyQkYuzSEwVy/d9LG6EyZ
        8unY0rZ8TAqACrXtp9Vg0agHgw==
X-Google-Smtp-Source: ABdhPJwlwuyUDB801uU0q4OWdNZx7cqs+I4sosgnr5I0yTfExhVbEnfzbB26MUJYdc02hzTDI0ZjYw==
X-Received: by 2002:aa7:c9d2:0:b0:42e:1776:63e0 with SMTP id i18-20020aa7c9d2000000b0042e177663e0mr21730692edt.185.1654500860958;
        Mon, 06 Jun 2022 00:34:20 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bv3-20020a170906b1c300b006f3ef214ddesm5983135ejb.68.2022.06.06.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 00:34:20 -0700 (PDT)
Message-ID: <7f1a684c-5677-995c-1391-0a6033d62b23@linaro.org>
Date:   Mon, 6 Jun 2022 09:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/6] dt-bindings: mmc: convert mmc-spi-slot to yaml
Content-Language: en-US
To:     mail@conchuod.ie, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
 <20220605133300.376161-2-mail@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605133300.376161-2-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/06/2022 15:32, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the mmc-spi-slot text based binding doc to yaml,
> with the side effect of cleaning up some of the riscv
> dtbs_check warnings.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 76 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
> deleted file mode 100644
> index 5e74db69f581..000000000000
> --- a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -MMC/SD/SDIO slot directly connected to a SPI bus
> -
> -This file documents differences between the core properties described
> -by mmc.txt and the properties used by the mmc_spi driver.
> -
> -Required properties:
> -- spi-max-frequency : maximum frequency for this device (Hz).
> -
> -Optional properties:
> -- voltage-ranges : two cells are required, first cell specifies minimum
> -  slot voltage (mV), second cell specifies maximum slot voltage (mV).
> -  Several ranges could be specified. If not provided, 3.2v..3.4v is assumed.
> -- gpios : may specify GPIOs in this order: Card-Detect GPIO,
> -  Write-Protect GPIO. Note that this does not follow the
> -  binding from mmc.txt, for historical reasons.
> -
> -Example:
> -
> -	mmc-slot@0 {
> -		compatible = "fsl,mpc8323rdb-mmc-slot",
> -			     "mmc-spi-slot";
> -		reg = <0>;
> -		gpios = <&qe_pio_d 14 1
> -			 &qe_pio_d 15 0>;
> -		voltage-ranges = <3300 3300>;
> -		spi-max-frequency = <50000000>;
> -		interrupts = <42>;
> -		interrupt-parent = <&PIC>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> new file mode 100644
> index 000000000000..a5fd723140c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MMC/SD/SDIO slot directly connected to a SPI bus
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +
> +allOf:
> +  - $ref: "mmc-controller.yaml"
> +
> +description: |
> +  The extra properties used by an mmc connected via spi.

s/spi/SPI/

> +
> +properties:
> +  compatible:
> +    const: "mmc-spi-slot"

No quotes, please.

> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency: true

I think instead you should reference:
/schemas/spi/spi-peripheral-props.yaml
(because also other properties might be needed for different SPI
controllers)

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  voltage-ranges:
> +    $ref: '/schemas/types.yaml#/definitions/uint32-matrix'

Here as well - quotes are not needed. Some schemas have it, some not,
but I guess shorter is preferred :)

> +    description: |
> +      Two cells are required, first cell specifies minimum slot voltage (mV),
> +      second cell specifies maximum slot voltage (mV).
> +    items:
> +      items:
> +        - description: |
> +            value for minimum slot voltage
> +          default: 3200
> +        - description: |
> +            value for maximum slot voltage
> +          default: 3400
> +    maxItems: 1
> +
> +  gpios:
> +    description: |
> +      For historical reasons, this does not follow the generic mmc-controller binding.
> +    minItems: 1
> +    items:
> +      - description: Card-Detect GPIO
> +      - description: Write-Protect GPIO
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-max-frequency
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      mmc@0 {
> +        compatible = "mmc-spi-slot";
> +        reg = <0>;
> +        gpios = <&qe_pio_d 14 1>, <&qe_pio_d 15 0>;

The GPIO flags should be common defines instead.

> +        voltage-ranges = <3300 3300>;
> +        spi-max-frequency = <50000000>;
> +        interrupts = <42>;
> +        interrupt-parent = <&PIC>;
> +      };
> +    };
> +
> +...


Best regards,
Krzysztof
