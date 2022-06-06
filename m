Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2F153EE9C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 21:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiFFTam (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 15:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbiFFTal (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 15:30:41 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020BCC38;
        Mon,  6 Jun 2022 12:30:39 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id d7so6741556iof.10;
        Mon, 06 Jun 2022 12:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+NnQO5+cskfKn+MffQu/wn5Q8O9B9/0RnxbWNMjwh3s=;
        b=202Lw5CNLLFQyuzLDSVaPrpYvdt1ss7URm+NNIj7mnDnE9NjYUpoomqXLRGRvWiJwR
         9KnQkYePbdRgaKr6WsIQrw+PO2V2B3ASYIJmKWSskasw+rQ/AiXMqwntUxY0MEx6vVkU
         A4RKSZxM9cu4grg2/wKOrX5jaG6qphNWjCai6djVMDvhembXGcm65/iyPCK6qtDQ9VMS
         gV8RlnT+LKsACCLfHI06OCXiueikHwhHF1ynICedSUTF5HnkxaHjoBkWWHQmaaoWuR1Z
         UGH/btoKYqR2z1kqhc4muSG/nHl719T/x/eBADqzfaod4E0Wmr7O9VhBQpezdATKUBPE
         MY+Q==
X-Gm-Message-State: AOAM532NBdb9woU+n84j5ErDeNbJPSsuwUjiVVAyjTRsBPmAb6WXeiPA
        Rl6R/rqTuNPTSozPresgRg==
X-Google-Smtp-Source: ABdhPJzCfMy93UMW/jDkEJ/kOCS4HxRKuVX5fFmoggqvvpWGhoHJDgzPeJqFrjjUAQwqzWwguBH+bw==
X-Received: by 2002:a05:6602:1541:b0:669:2580:c5de with SMTP id h1-20020a056602154100b006692580c5demr8357148iow.3.1654543839160;
        Mon, 06 Jun 2022 12:30:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n9-20020a027149000000b0032b5e4281d3sm5882945jaf.62.2022.06.06.12.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:30:38 -0700 (PDT)
Received: (nullmailer pid 1123877 invoked by uid 1000);
        Mon, 06 Jun 2022 19:30:36 -0000
Date:   Mon, 6 Jun 2022 14:30:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Conor Dooley <mail@conchuod.ie>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
Message-ID: <20220606193036.GA1119654-robh@kernel.org>
References: <20220606152557.438771-1-mail@conchuod.ie>
 <20220606152557.438771-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606152557.438771-2-mail@conchuod.ie>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 06, 2022 at 04:25:55PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the mmc-spi-slot text based binding doc to yaml,
> with the side effect of cleaning up some of the riscv
> dtbs_check warnings.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 29 deletions(-)
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
> index 000000000000..cf79092de8fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
> @@ -0,0 +1,79 @@
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
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml
> +
> +description: |
> +  The extra properties used by an mmc connected via SPI.
> +
> +properties:
> +  compatible:
> +    const: mmc-spi-slot
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  voltage-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

Looks more like an array to me.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

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
> +      For historical reasons, this does not follow the generic mmc-controller
> +      binding.
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
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      mmc@0 {
> +        compatible = "mmc-spi-slot";
> +        reg = <0>;
> +        gpios = <&gpio 14 GPIO_ACTIVE_LOW>, <&gpio 15 GPIO_ACTIVE_HIGH>;
> +        voltage-ranges = <3300 3300>;
> +        spi-max-frequency = <50000000>;
> +        interrupts = <42>;
> +        interrupt-parent = <&PIC>;
> +      };
> +    };
> +
> +...
> -- 
> 2.36.1
> 
> 
