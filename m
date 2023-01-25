Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9A267BE01
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 22:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236636AbjAYVSs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 16:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbjAYVSe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 16:18:34 -0500
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A5ED528;
        Wed, 25 Jan 2023 13:18:13 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id h3-20020a4ac443000000b004fb2954e7c3so14431ooq.10;
        Wed, 25 Jan 2023 13:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp0mxhbOHK5m7E/8vPnnoJoZCeVsj8BETflMMGfFRwo=;
        b=ivV4AmA9OTtt1/YXMzSyZrZoN1NWgNvKxlfCSdeOXjrGdr6F79EYhOB73eMELfcdR5
         qlyBd0H8pkedv9h01CO1QmB9+HgNyLLpvVWAGME6b5xspqjTroe8ZmeUDFdQJE/lvkyr
         9qJCKcgta7Thcy2d8cNEYC5kGwr+kW4aD30lEAEQthqkwGE2+pCkz1BdquGx9CixqgB6
         pJBaqv/74EOsbZoS3rDQ1h9ut/x2FjmuosR3dB0Mrd4HtkD/HCWz7LlIq2pBRkKgjc2m
         RW2GXYFfbAMkOfKMeURUrLFaUNk4bPUR96MaRO1OMB1B3p54dESl/cYYNwz0XA9xXv/h
         zUzw==
X-Gm-Message-State: AFqh2krGxfrxgPqVHQVorFbWQe1w5fxYce19ZG9VSGen56RmRm4+/hlL
        VkbPwOqsz11Q9qwFsi6GqPiN3fkStw==
X-Google-Smtp-Source: AMrXdXtVWuRQFhdtS4eZUn6+6TSg6l1vpWoxw0m087w2Ydp334vj17fhVuVkwi0NjMRkFZvJ5FeGOg==
X-Received: by 2002:a4a:a509:0:b0:4f2:2208:46a2 with SMTP id v9-20020a4aa509000000b004f2220846a2mr16168854ook.8.1674681492788;
        Wed, 25 Jan 2023 13:18:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b1-20020a4aba01000000b004f269f9b8f3sm2316082oop.25.2023.01.25.13.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 13:18:12 -0800 (PST)
Received: (nullmailer pid 2907514 invoked by uid 1000);
        Wed, 25 Jan 2023 21:18:11 -0000
Date:   Wed, 25 Jan 2023 15:18:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, krzysztof.kozlowski+dt@linaro.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Message-ID: <20230125211811.GA2902717-robh@kernel.org>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-3-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125184438.28483-3-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 25, 2023 at 12:44:35PM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Document compatibility string to support I2C controller
> in GXP.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> v4:
>  *Provide even greater description with the use
>   of Phandle
>  *Reorder properties so they match the required
>   order
> v3:
>  *Provide better description with use of Phandle
> v2:
>  *Removed uneccessary size-cells and address-cells
>  *Removed phandle from hpe,sysreg-phandle
>  *Changed hpe,i2c-max-bus-freq to clock-frequency
> ---
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> new file mode 100644
> index 000000000000..6604dcd47251
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/hpe,gxp-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP SoC I2C Controller
> +
> +maintainers:
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hpe,gxp-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    default: 100000
> +
> +  hpe,sysreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the global status and enable interrupt registers shared
> +      between each I2C engine controller instance. It enables the I2C
> +      engine controller to act as both a master or slave by being able to
> +      arm and respond to interrupts from its engine. Each bit in the
> +      registers represent the respective bit position.

Each bit represents the bit position?

AIUI, each I2C instance has a bit in it needs to control. How does the 
driver know what instance (and therefore the correct bit)? Typically you 
would have a 2nd cell here with that information.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@2600 {
> +        compatible = "hpe,gxp-i2c";
> +        reg = <0x2500 0x70>;
> +        interrupts = <9>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        hpe,sysreg = <&sysreg_system_controller>;
> +        clock-frequency = <10000>;
> +
> +        eeprom@50 {
> +            compatible = "atmel,24c128";
> +            reg = <0x50>;
> +        };
> +    };
> -- 
> 2.17.1
> 
