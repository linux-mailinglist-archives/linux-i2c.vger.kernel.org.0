Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12BF4AC9C6
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 20:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240083AbiBGTmu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 14:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240208AbiBGTkC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 14:40:02 -0500
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AFEC0401DA;
        Mon,  7 Feb 2022 11:40:01 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id t75-20020a4a3e4e000000b002e9c0821d78so14956256oot.4;
        Mon, 07 Feb 2022 11:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DVoPlrorpOgCwVKkj2Fd5s3gbsXiXTFFi9QAYnJuhBQ=;
        b=jDxA590vyXk7V68ZeIXfUWJUpBKYXU2s0rloPxS+eWBheQKK0Z1LDjqoILVtjXbh03
         X89wjJxckI3Gzt3adel+5Cq2Qhh59BE6S+NYf0FnxjJy6Jv7JeSP/s14nt3u7jQ52Pqz
         TbKpmLdN4g2Vg9xkLI6guD7yIr2hIu4DCG2GfSLOfVoU/mUnha2zsYxJKjucrY1MUjSU
         rLEka+5WWkU00cJC/7rMcUYq8fgU4Z9vjVfgYlpgiBDbdSAEawtzG7eQC83ZvGws+702
         fpgArJov+V1DLxKMBfBmOZ7CLZechznBMuie4751LDBsPxj8kw4J/EZNYJ/SVa9zVPZ6
         pGlA==
X-Gm-Message-State: AOAM533zvoKEt76t3/SHFa4fku3QiVAfZb5xUHpGLqDguE3wNpMGC0HB
        56LZ+rUccQw+qywH6OOJ1A==
X-Google-Smtp-Source: ABdhPJwEOqmW3gUGAMBLbLCqg94r8wnh0uNs5S+K0a/D5y2duMhiqd7HoPnsG9VQcMg0uw97eN3kcQ==
X-Received: by 2002:a05:6870:8222:: with SMTP id n34mr167848oae.67.1644262801146;
        Mon, 07 Feb 2022 11:40:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i13sm4411438otl.46.2022.02.07.11.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 11:39:59 -0800 (PST)
Received: (nullmailer pid 770258 invoked by uid 1000);
        Mon, 07 Feb 2022 19:39:57 -0000
Date:   Mon, 7 Feb 2022 13:39:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        matti.vaittinen@fi.rohmeurope.com
Subject: Re: [RFCv3 4/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
Message-ID: <YgF1ja8/Uab/8ZWt@robh.at.kernel.org>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <20220206115939.3091265-5-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206115939.3091265-5-luca@lucaceresoli.net>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Feb 06, 2022 at 12:59:37PM +0100, Luca Ceresoli wrote:
> Describe the Texas Instruments DS90UB954-Q1, a 2-input MIPI CSI-2 video
> deserializer with I2C Address Translator and remote GPIOs.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes RFCv2 -> RFCv3:
> 
>  - rewrite in yaml
>  - use new layout based on remote-chips under the main deser node
>  - new clock configuration based on common clock framework
> 
> Changes RFCv1 -> RFCv2:
> 
>  - add explicit aliases for the FPD-link RX ports (optional)
>  - add proper remote GPIO description
> ---
>  .../bindings/media/i2c/ti,ds90ub954-q1.yaml   | 235 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
> new file mode 100644
> index 000000000000..95dc3d22f5d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub954-q1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DS90UB954-Q1 dual video deserializer
> +
> +maintainers:
> +  - Luca Ceresoli <luca@lucaceresoli.net>
> +
> +description: |
> +  The TI DS90UB954-Q1 is a MIPI CSI-2 video deserializer that forwards
> +  video streams from up to two FPD-Link 3 connections to a MIPI CSI-2
> +  output. It also allows access to remote I2C and GPIO.
> +
> +properties:
> +  compatible:
> +    const: ti,ds90ub954-q1
> +
> +  reg:
> +    description: |
> +      main I2C slave address; optionally aliases for RX port registers and
> +      remote serializers. The main address is mandatory and must be the
> +      first, others are optional and fall back to defaults if not
> +      specified. See "reg-names".

minItems: 1
maxItems: 5

> +
> +  reg-names:
> +    description: |
> +      Names of I2C address used to communicate with the chip, must match
> +      the "reg" values; mandatory if there are 2 or more addresses.
> +      "main" is the main I2C address, used to access shared registers.
> +      "rxport0" and "rxport1" are the I2C alias to access FPD-link RX
> +      port specific registers; must not be used by other slaves on the
> +      same bus. "ser0" and "ser1" are the I2C alias to access the remote
> +      serializer connected on each FPD-link RX port; must not be used by
> +      other slaves on the same bus.
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      - const: main
> +      - const: rxport0
> +      - const: rxport1
> +      - const: ser0
> +      - const: ser1
> +
> +  clocks:
> +    description: provider of the clock on the XIN/REFCLK pin
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: chip reset GPIO connected to PDB pin (active low)

maxItems: 1

> +
> +  i2c-alias-pool:

Needs a type.

> +    description: |
> +      list of I2C addresses that are known to be available on the "local"
> +      (SoC-to-deser) I2C bus; they will be picked at runtime and used as
> +      aliases to reach remote I2C chips
> +
> +  '#clock-cells':
> +    description: |
> +      the DS90UB954 provides the FPD line rate clock to the serializer
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[01]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: FPD-Link RX port 0 (RIN0+/RIN0- pins)
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      '^port@2$':
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI-CSI2 TX port
> +
> +  remote-chips:
> +    type: object
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^remote-chip@([01]+)$':
> +        type: object
> +        $ref: /schemas/media/i2c/ti,ds90ub953-q1.yaml#
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +    additionalProperties: false
> +
> +  i2c-atr:
> +    description: |
> +      Each child describes the I2C bus on the remote side of an RX port
> +    type: object
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@([01]+)$':

Only 0 or 1 is valid? Then drop the '+'.

This is an i2c bus, so you need:

           $ref: /schemas/i2c-controller.yaml#'
           unevaluatedProperties: false

> +        type: object
> +
> +        properties:
> +          reg:
> +            maxItems: 1

> +          '#address-cells':
> +            const: 1
> +          '#size-cells':
> +            const: 0

You can drop these as i2c-controller.yaml covers them.

> +          clock-frequency:
> +            minimum: 1

1 is already the minimum. (Well, maybe it is 0, but that's not really 
useful.)

> +            maximum: 1000000
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - ports
> +  - remote-chips
> +  - i2c-atr
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/ds90ub953.h>
> +
> +    i2c@0 {
> +      reg = <0x0 0x100>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      deser: deser@3d {
> +        compatible = "ti,ds90ub954-q1";
> +        reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
> +        reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
> +        clocks = <&clk_25M>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <3 1 IRQ_TYPE_LEVEL_LOW>;
> +        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +
> +        #clock-cells = <0>;
> +
> +        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            ds90ub954_fpd3_in0: endpoint {
> +              remote-endpoint = <&sensor_0_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +            ds90ub954_mipi_out0: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <400000000>;
> +                    remote-endpoint = <&csirx_0_in>;
> +            };
> +          };
> +        };
> +
> +        remote-chips {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          des0_ser0: remote-chip@0 {
> +            reg = <0>;
> +            compatible = "ti,ds90ub953-q1";
> +            clocks = <&deser>;
> +            ti,gpio-functions =
> +              <DS90_GPIO_FUNC_UNUSED
> +              DS90_GPIO_FUNC_OUTPUT_REMOTE
> +              DS90_GPIO_FUNC_UNUSED
> +              DS90_GPIO_FUNC_UNUSED>;
> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #clock-cells = <0>;
> +          };
> +        };
> +
> +        i2c-atr {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          remote_i2c0: i2c@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            sensor_0@1a {
> +              compatible = "sony,imx274";
> +              reg = <0x1a>;
> +
> +              reset-gpios = <&des0_ser0 1 GPIO_ACTIVE_LOW>;
> +
> +              port {
> +                sensor_0_out: endpoint {
> +                  remote-endpoint = <&ds90ub954_fpd3_in0>;
> +                };
> +              };
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4429ce035496..f0156062f788 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19097,6 +19097,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
>  F:	include/dt-bindings/media/ds90ub953.h
>  
> +TEXAS INSTRUMENTS DS90UB954 VIDEO DESERIALIZER DRIVER
> +M:	Luca Ceresoli <luca@lucaceresoli.net>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
> +
>  TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
>  M:	Nishanth Menon <nm@ti.com>
>  M:	Tero Kristo <kristo@kernel.org>
> -- 
> 2.25.1
> 
> 
