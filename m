Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57CD60D8B6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 03:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbiJZBHN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 21:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiJZBHM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 21:07:12 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E157B72EC2;
        Tue, 25 Oct 2022 18:07:11 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-12c8312131fso18187050fac.4;
        Tue, 25 Oct 2022 18:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fJTKt940eth1OpdSb2WO5kQsdZXgZfQJNIIFcYi3Hg=;
        b=BmGbVSVUK9aDTMFJcMtBV0XUhBmVNvyJshwvcQ9oEaXJO8EZiio2vS36fMjs43UgF1
         BcxwOepTj7zM+WCW9pa2pVyufCkOABMpKmxn3J9NCNSRBW5Z0KhZays8yzDfDJ0i+GzY
         GtB7gEDZQAufR+lUCya0ZQikAE7QLnMLPtoEV9RENSoXM0v1Zbac/QyLdwfnG/sSYWPF
         7jT3U9pMYaAUuqMCVkfu25giNehnI/RBIzVJRAlDvM2+osEeY5XxmAHV8gPtdDIepOt9
         4+aC+6veP5H56NbvK85drsk4AmGUefHQq6wv1NRI/Odq5fWsQEcbtBz+l9zps7tZubyE
         YQ3w==
X-Gm-Message-State: ACrzQf2YdTzf93WtEswb0Lzwq85rOhhQ7Z1hW/AwMNnHGA1z0B0Sydg2
        FSYozrBIE6/5rydpm+THEg==
X-Google-Smtp-Source: AMsMyM4xjqa65NuztevNo6tGxHSfTJvxr9edT4ZFZekBByytP213dGKQEHdsVIKhYYUVG0yHCYQwLA==
X-Received: by 2002:a05:6870:c58d:b0:136:7f6a:1e5a with SMTP id ba13-20020a056870c58d00b001367f6a1e5amr717425oab.24.1666746431099;
        Tue, 25 Oct 2022 18:07:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d63-20020a9d2945000000b006618bbede10sm1626853otb.53.2022.10.25.18.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 18:07:10 -0700 (PDT)
Received: (nullmailer pid 3522397 invoked by uid 1000);
        Wed, 26 Oct 2022 01:07:11 -0000
Date:   Tue, 25 Oct 2022 20:07:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Message-ID: <20221026010711.GA3438928-robh@kernel.org>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-4-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-4-waynec@nvidia.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022 at 03:41:20PM +0800, Wayne Chang wrote:
> add device-tree binding documentation for Cypress cypd4226 type-C
> controller's I2C interface. It is a standard i2c slave with GPIO
> input as IRQ interface.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..5ac28ab4e7a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress cypd4226 UCSI I2C Type-C Controller
> +
> +maintainers:
> +  - Wayne Chang <waynec@nvidia.com>
> +
> +description: |

Don't need '|'.

> +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
> +  controller.
> +
> +properties:
> +  compatible:
> +    const: cypress,cypd4226
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reg:
> +    const: 0x08
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cypress,firmware-build:
> +    enum:
> +      - nv
> +      - gn
> +    description: |
> +      the name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nv" for the RTX product series
> +      - "gn" for the Jetson product series
> +
> +patternProperties:
> +  '^connector@[0-9a-f]+$':

Looks like the part only has 2 PD controllers, so 2 connectors only, 
right?

> +    $ref: /schemas/connector/usb-connector.yaml#

       unevaluatedProperties: false

> +    properties:
> +      reg:
> +        maxItems: 1

maximum: 1

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: true

false

true is only for incomplete, common schemas.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra194-gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <2>;
> +
> +      ucsi_ccg: ucsi_ccg@8 {
> +        compatible = "cypress,cypd4226";
> +        interrupt-parent = <&gpio_aon>;
> +        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
> +        reg = <0x08>;
> +        cypress,firmware-build = "gn";
> +        status = "okay";

Don't need status in examples.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ccg_typec_con0: connector@0 {
> +          compatible = "usb-c-connector";
> +          reg = <0>;
> +          label = "USB-C";
> +          data-role = "dual";
> +          port {
> +            ucsi_ccg_p0: endpoint {
> +              remote-endpoint = <&usb_role_switch0>;
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.25.1
> 
> 
