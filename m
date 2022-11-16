Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5784E62CC61
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 22:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbiKPVOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 16:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbiKPVO2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 16:14:28 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5CF4C240;
        Wed, 16 Nov 2022 13:14:27 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso11216653ota.12;
        Wed, 16 Nov 2022 13:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV6uRSj5A0RfJrnNHT9JxaI5Eiomkz3u/uqtM/E+nQs=;
        b=qWIazrZzLzHB5zQTycHemsuZxvlCBODJHgG+159Rsv+hkh4/2+Uw3zXcCnlflyTZCV
         IyB36U5uUECVI56grLiuzu1wPKSWJhwHLrJLYEl1miZpShHu/+BpoVPZhxdBifcl2xSE
         GwCXBByvFte4N8cJNdw8SZw7tqR9bnXjprntO2ndbycMsfgKFBXkZwY8FEj9c1GNtbfC
         iKgwtHKylgPdltHbiPWS/808TIMDmgKmUJADCwhnrewRKFEdM7Popi8rWNhvjn3aPB9W
         pAvPWnhp09nk/EAUy3jvsc2KkBXoSWJ4Jvxyb4luhz+ug/GQozpcFTqB/7nxLpzo8YEw
         IzFg==
X-Gm-Message-State: ANoB5pnAnYevMSGf0xwN3ATkWwLajjE1pwdA8oW7wIuT+JYzPAnPhfZO
        bPzg6E56ueVTpiqgAR8dpA==
X-Google-Smtp-Source: AA0mqf6cpJwbBEertTrRB0QkgjpFroc/t0HskBTyjwQPspYfyJWlf51lrnxI7AnVUgQrnmwEgAHRCw==
X-Received: by 2002:a9d:19a2:0:b0:66c:4ed7:fea9 with SMTP id k31-20020a9d19a2000000b0066c4ed7fea9mr1409otk.57.1668633267157;
        Wed, 16 Nov 2022 13:14:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r15-20020a4aad0f000000b004908a9542f8sm6441166oon.31.2022.11.16.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 13:14:26 -0800 (PST)
Received: (nullmailer pid 953152 invoked by uid 1000);
        Wed, 16 Nov 2022 21:14:28 -0000
Date:   Wed, 16 Nov 2022 15:14:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 03/13] dt-bindings: usb: Add binding for Cypress
 cypd4226 I2C driver
Message-ID: <20221116211428.GA884584-robh@kernel.org>
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-4-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114124053.1873316-4-waynec@nvidia.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 14, 2022 at 08:40:43PM +0800, Wayne Chang wrote:
> add device-tree binding documentation for Cypress cypd4226 type-C
> controller's I2C interface. It is a standard I2C slave with GPIO
> input as IRQ interface.

For the subject:

dt-bindings: usb: Add Cypress cypd4226 Type-C controller

> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:fix additionalProperties warning on new schema
> V1 -> V2:based on the review comments. Fix some addressed issues on
> description, interrupts, cypress,firmware-build, connector, and 
> additionalProperties properties. And also remove the status in the example.
>  .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..854fe2f9181c
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
> +description:
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
> +    items:
> +      - description: cypd4226 I2C interrupt
> +
> +  cypress,firmware-build:
> +    enum:
> +      - nvidia,gpu
> +      - nvidia,jetson-agx-xavier
> +    description: |
> +      the name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nvidia,gpu" for the NVIDIA RTX product series
> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series

Standard 'firmware-name' property doesn't work for you?

> +
> +patternProperties:
> +  '^connector@[0-1]+$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
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
> +      ucsi-ccg@8 {
> +        compatible = "cypress,cypd4226";
> +        interrupt-parent = <&gpio_aon>;
> +        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
> +        reg = <0x08>;
> +        cypress,firmware-build = "nvidia,jetson-agx-xavier";
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
