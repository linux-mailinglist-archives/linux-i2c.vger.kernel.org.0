Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB8A53EEAC
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 21:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbiFFTdI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 15:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbiFFTdH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 15:33:07 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64590645B;
        Mon,  6 Jun 2022 12:33:06 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id y16so12646214ili.13;
        Mon, 06 Jun 2022 12:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tNX+fE5QMsC9Ks4TM/TrqMoy1piEYYRXSKM00brwA4A=;
        b=6DoQBPui7qVgvUUc+FNMNc8mvmHRdOgGHW9E7+jg3WpwL3PgSYjaGfK49/wVWtLsBy
         tKYL9ef/hgL6m/zUGauIbVVUQm0nE2+CRkVdw4ojEk5y+O0Sj78aWSoXmgvvKgS5QwJE
         A/8hDsUa2PTOBAaEkFhS854fEQzx65v3hpzS0Abrwkt+KouED7yUBmr4dKQtY5QbMtGm
         iXJriJGxVjLKi3vMMOME/bfHwIHs9D5VXJYjGxWV7Tk8BWIvbvpdOx/HA/qy+255gPev
         ju+lkQYg7VIyspGo5m+iYB4AdYMgFBtCrwQdsz/aeJaFAqqSt2AXYXjL4GuzBRgfcupf
         MJoQ==
X-Gm-Message-State: AOAM533oXnrGYcPEYjIOYcI/MjIsAHXjwxsdGYlmyTG7ByoX6v58KtCv
        8fVDxKOpjSIcfYmqjul4gw==
X-Google-Smtp-Source: ABdhPJz2HY7kGWq5THpXteEuhoYM4oFuFpHDe3x9h/zZZDyGDLS+35sEVRPBUr0/3gI2PdpHWAZGig==
X-Received: by 2002:a05:6e02:158b:b0:2cf:e058:8ecc with SMTP id m11-20020a056e02158b00b002cfe0588eccmr14792795ilu.30.1654543985645;
        Mon, 06 Jun 2022 12:33:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v9-20020a056602058900b00669384fcf88sm3457792iox.1.2022.06.06.12.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:33:05 -0700 (PDT)
Received: (nullmailer pid 1127227 invoked by uid 1000);
        Mon, 06 Jun 2022 19:33:03 -0000
Date:   Mon, 6 Jun 2022 14:33:03 -0500
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
Subject: Re: [PATCH v2 2/4] dt-bindings: i2c: convert ocores binding to yaml
Message-ID: <20220606193303.GA1124108-robh@kernel.org>
References: <20220606152557.438771-1-mail@conchuod.ie>
 <20220606152557.438771-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606152557.438771-3-mail@conchuod.ie>
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

On Mon, Jun 06, 2022 at 04:25:56PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the open cores i2c controller binding from text to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>  .../bindings/i2c/opencores,i2c-ocores.yaml    | 123 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 124 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
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
> diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> new file mode 100644
> index 000000000000..7074f019d94f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
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
> +      - enum:
> +          - opencores,i2c-ocores
> +          - aeroflexgaisler,i2cmst
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

These 2 are covered by i2c-controller.yaml. Drop.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
