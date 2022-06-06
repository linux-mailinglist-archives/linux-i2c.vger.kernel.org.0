Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80BC953E395
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 10:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbiFFICW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 04:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiFFICQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 04:02:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EBD2E087
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 01:02:13 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id fd25so17707175edb.3
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sFXlQTfaTGp3ZGyK7LOKNf58AxfI5AxWB9TA/S/FgQs=;
        b=ssVkYR6EB4/6HPnXSQTnodu/6zhiLrO772qH4CjhcGCAvKICR3lDqhmkDQ4Own0a5G
         EZZixFUCMCAf4ztvfNWH49n7jJTo9OZeGw3aurtp1ZnKel+UnPvUdzSAiN5FjFIz3p+X
         aTVKCvL9n/auH6bCB+KSM0frGBVWq6kkIgPOjXUyX5fB2HeJlexkfgf1x+RAZLXCL+OX
         GsbG+qHuGK7BA6mNwU0LOooWTh8SEKVSjifMnJbJoz1T3zy7JvjmliqyBwh6odsDbjDZ
         Ba5gECnNFXHEuJPcodKU5kLD5wAtM4qJ4sCgEMB9/V3FrEuFvZdgkDlpOKNViwfBJkUk
         W2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sFXlQTfaTGp3ZGyK7LOKNf58AxfI5AxWB9TA/S/FgQs=;
        b=6UJXsqFGrtB8yE32Ppk0IHKyocGMtmRcOOt663/Ct1sQc5FAWpr3c79HFD+IqoWIob
         OkI5p4xxZnrtVMxRLl9dKgVxfn6stgUFBi7IcSiMxbvzgZZx0rsD/20EQ960WWrhLSCr
         Ruv+tcJxuNwbOCeuCoVu5BVSGU/JpiAp5IQKvbQWtCZgHLEIgM+NgY73w49D022tRQrp
         4apdl17y/AO9caN4rZttxMIuBB1fKIXDVzmIzQZPddmiBPG0XlVJUlpcwtLlcglBHWsO
         WmSvqHTF0GpMX28Uk9mOauTWmIuI3VjQJRhQ2tOPqtaKcCqXR3rgajjcmzZSKKJUovIg
         ZSAw==
X-Gm-Message-State: AOAM530czgxUKOqkzmBVhNVj5ThNONETTPCt9M6oIWt7hJG1czJEqYjc
        EflMdl2tu8Po/tzuCfjpcQ30ZA==
X-Google-Smtp-Source: ABdhPJyD80aORc3wl5PdDpouqbmSPwFikvFC2SDBTyfdLEiMI68smdbI63TDTZaNg2woKbEsDZI9mw==
X-Received: by 2002:a05:6402:524a:b0:431:51b3:bc7 with SMTP id t10-20020a056402524a00b0043151b30bc7mr6303566edd.5.1654502531524;
        Mon, 06 Jun 2022 01:02:11 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m3-20020aa7c483000000b0042de29d8fc0sm8078030edq.94.2022.06.06.01.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 01:02:10 -0700 (PDT)
Message-ID: <7ed076fb-ee3d-a7ad-7b15-add8c5ffee7f@linaro.org>
Date:   Mon, 6 Jun 2022 10:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
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
 <20220605133300.376161-3-mail@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605133300.376161-3-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/06/2022 15:32, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the open cores i2c controller binding from text to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> deleted file mode 100644
> index a37c9455b244..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Device tree configuration for i2c-ocores
> -
> -Required properties:
> -- compatible      : "opencores,i2c-ocores"
> -                    "aeroflexgaisler,i2cmst"
> -                    "sifive,fu540-c000-i2c", "sifive,i2c0"
> -                    For Opencore based I2C IP block reimplemented in
> -                    FU540-C000 SoC.
> -                    "sifive,fu740-c000-i2c", "sifive,i2c0"
> -                    For Opencore based I2C IP block reimplemented in
> -                    FU740-C000 SoC.
> -                    Please refer to sifive-blocks-ip-versioning.txt for
> -                    additional details.
> -- reg             : bus address start and address range size of device
> -- clocks          : handle to the controller clock; see the note below.
> -                    Mutually exclusive with opencores,ip-clock-frequency
> -- opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> -                    see the note below. Mutually exclusive with clocks
> -- #address-cells  : should be <1>
> -- #size-cells     : should be <0>
> -
> -Optional properties:
> -- interrupts      : interrupt number.
> -- clock-frequency : frequency of bus clock in Hz; see the note below.
> -                    Defaults to 100 KHz when the property is not specified
> -- reg-shift       : device register offsets are shifted by this value
> -- reg-io-width    : io register width in bytes (1, 2 or 4)
> -- regstep         : deprecated, use reg-shift above
> -
> -Note
> -clock-frequency property is meant to control the bus frequency for i2c bus
> -drivers, but it was incorrectly used to specify i2c controller input clock
> -frequency. So the following rules are set to fix this situation:
> -- if clock-frequency is present and neither opencores,ip-clock-frequency nor
> -  clocks are, then clock-frequency specifies i2c controller clock frequency.
> -  This is to keep backwards compatibility with setups using old DTB. i2c bus
> -  frequency is fixed at 100 KHz.
> -- if clocks is present it specifies i2c controller clock. clock-frequency
> -  property specifies i2c bus frequency.
> -- if opencores,ip-clock-frequency is present it specifies i2c controller
> -  clock frequency. clock-frequency property specifies i2c bus frequency.
> -
> -Examples:
> -
> -	i2c0: ocores@a0000000 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "opencores,i2c-ocores";
> -		reg = <0xa0000000 0x8>;
> -		interrupts = <10>;
> -		opencores,ip-clock-frequency = <20000000>;
> -
> -		reg-shift = <0>;	/* 8 bit registers */
> -		reg-io-width = <1>;	/* 8 bit read/write */
> -
> -		dummy@60 {
> -			compatible = "dummy";
> -			reg = <0x60>;
> -		};
> -	};
> -or
> -	i2c0: ocores@a0000000 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "opencores,i2c-ocores";
> -		reg = <0xa0000000 0x8>;
> -		interrupts = <10>;
> -		clocks = <&osc>;
> -		clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
> -
> -		reg-shift = <0>;	/* 8 bit registers */
> -		reg-io-width = <1>;	/* 8 bit read/write */
> -
> -		dummy@60 {
> -			compatible = "dummy";
> -			reg = <0x60>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
> new file mode 100644
> index 000000000000..1693ffffbe31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-ocores.yaml#

This should be rather named with vendor prefix, so:
opencores,i2c-ocores.yaml

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenCores I2C controller
> +
> +maintainers:
> +  - Peter Korsgaard <peter@korsgaard.com>
> +  - Andrew Lunn <andrew@lunn.ch>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,fu740-c000-i2c # Opencore based IP block FU740-C000 SoC
> +              - sifive,fu540-c000-i2c # Opencore based IP block FU540-C000 SoC
> +          - const: sifive,i2c0
> +      - const: opencores,i2c-ocores
> +      - const: aeroflexgaisler,i2cmst

The last two are just enum
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clock-frequency:
> +    description: |
> +      Desired I2C bus clock frequency in Hz. As only Standard and Fast
> +      modes are supported, possible values are 100000 and 400000.

Add enum with the two values.

> +      Note:
> +      clock-frequency property is meant to control the bus frequency for i2c bus
> +      drivers, but it was incorrectly used to specify i2c controller input clock
> +      frequency. So the following rules are set to fix this situation:
> +      - if clock-frequency is present and neither opencores,ip-clock-frequency nor
> +        clocks are, then clock-frequency specifies i2c controller clock frequency.
> +        This is to keep backwards compatibility with setups using old DTB. i2c bus
> +        frequency is fixed at 100 KHz.
> +      - if clocks is present it specifies i2c controller clock. clock-frequency
> +        property specifies i2c bus frequency.
> +      - if opencores,ip-clock-frequency is present it specifies i2c controller
> +        clock frequency. clock-frequency property specifies i2c bus frequency.
> +    default: 100000
> +
> +  reg-io-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32

No need for ref, it is coming from the dtschema.

> +    description: |
> +      io register width in bytes
> +    enum: [1, 2, 4]
> +
> +  reg-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32

No need for ref, it is coming from the dtschema.

> +    description: |
> +      device register offsets are shifted by this value

I guess 0 is default?

> +
> +  regstep:
> +    description: |
> +      deprecated, use reg-shift above
> +    deprecated: true
> +
> +  opencores,ip-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Frequency of the controller clock in Hz. Mutually exclusive with clocks.
> +      See the note above.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +oneOf:
> +  - required:
> +      - opencores,ip-clock-frequency
> +  - required:
> +      - clocks

This is correct if your intention was to require one of these
properties, which seems to match the old bindings.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@a0000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "opencores,i2c-ocores";
> +      reg = <0xa0000000 0x8>;

Reorder the properties in the node so first goes compatible then reg,
then the rest.

> +      interrupts = <10>;
> +      opencores,ip-clock-frequency = <20000000>;
> +
> +      reg-shift = <0>;	/* 8 bit registers */
> +      reg-io-width = <1>;	/* 8 bit read/write */
> +
> +      dummy@60 {
> +        compatible = "dummy";
> +        reg = <0x60>;
> +      };
> +    };
> +
> +    i2c@b0000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "opencores,i2c-ocores";
> +      reg = <0xa0000000 0x8>;
> +      interrupts = <10>;
> +      clocks = <&osc>;
> +      clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
> +
> +      reg-shift = <0>;	/* 8 bit registers */
> +      reg-io-width = <1>;	/* 8 bit read/write */
> +
> +      dummy@60 {
> +        compatible = "dummy";
> +        reg = <0x60>;
> +      };
> +    };
> +...


Best regards,
Krzysztof
