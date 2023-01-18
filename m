Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F34672374
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 17:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjARQgP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 11:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjARQfn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 11:35:43 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10FA4617B;
        Wed, 18 Jan 2023 08:34:47 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id m18-20020a05683026d200b0068661404380so234432otu.2;
        Wed, 18 Jan 2023 08:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHCZmTVHrP18h7OzNIc6YzJ2Md15wHzbbI9y81VEo1s=;
        b=XuC5b0yo0TyWdS0zeuLd06VKAQ3WrSgb+ty/PuqS6AzgLwOBeBEX1qhgH6+1OUPcGe
         PqANJUjYQDj9rStr2b73uQoF/5pFa70dQVr+BujUG2F2VRk1utOJ9+n3/fnUshb2RteW
         r3hwkovs7TrKWisgB9lF2gJcPnMbb+HpN66nq3nwAajnluk6+DwxhL44TO/u5R2NPAiD
         m+jWo6sSW15DL8spRTDCqO9YVlt6te2r1XtepKnwdDHUGru9JgQIVFTb+4DJFLlX/sJv
         d69rqjqqhwWDRforY5bIloA8fqEjQrISGD6mmUzOiJBRbM2sjYStv2h5q3LhIQrFCaCw
         7scQ==
X-Gm-Message-State: AFqh2kqZgN7vBo/UbZr0/THhZ4Koc0yKA3oWYSDpjwX47Ns/FPToqNFq
        pZzzq6zjBXav9HxeF7MScc6PDJIp4A==
X-Google-Smtp-Source: AMrXdXvKu6JsB/GYQJuShHq2oPKg3M1pnMgLvFw9mt63zyUQp0okYXBcZaeSEdwx3ox8j3MfCt4hCw==
X-Received: by 2002:a9d:61d9:0:b0:66e:43e3:449 with SMTP id h25-20020a9d61d9000000b0066e43e30449mr4206546otk.14.1674059686898;
        Wed, 18 Jan 2023 08:34:46 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id o15-20020a9d764f000000b0066b9a6bf3bcsm18493668otl.12.2023.01.18.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:34:46 -0800 (PST)
Received: (nullmailer pid 128779 invoked by uid 1000);
        Wed, 18 Jan 2023 16:34:45 -0000
Date:   Wed, 18 Jan 2023 10:34:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
Message-ID: <20230118163445.GA125487-robh@kernel.org>
References: <20230117204439.76841-1-nick.hawkins@hpe.com>
 <20230117204439.76841-3-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117204439.76841-3-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 17, 2023 at 02:44:36PM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Document compatibility string to support I2C controller
> in GXP.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> 
> v2:
>  *Removed uneccessary size-cells and address-cells
>  *Removed phandle from hpe,sysreg-phandle
>  *Changed hpe,i2c-max-bus-freq to clock-frequency
> ---
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> new file mode 100644
> index 000000000000..2f718d9ad504
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
> @@ -0,0 +1,54 @@
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
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    default: 100000
> +
> +  hpe,sysreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to syscon used to control the system registers.

Not too useful of a description. Something about what bits you need to 
access and what they do would be useful.

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
