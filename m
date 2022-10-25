Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A61060D7D5
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 01:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJYXYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 19:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJYXYn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 19:24:43 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4096EBC3C;
        Tue, 25 Oct 2022 16:24:40 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id u132so3411556oib.0;
        Tue, 25 Oct 2022 16:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFoJ65FSeRoha1pQ1K6lL6hQjEH1NFBZHC7qdvsbi9k=;
        b=bwOYT8gKV3BXQRAjQz+EX3VrqeLmQbjSddYxD0jgM5rznOrmX1/Hp5jFyDxMT+qFTg
         p28R7onyUu4oYOghJSKOeWChgr52uyROv0QL45ZLdE3ddYuneiXV8QxZ0+KP3J3YjHEa
         3tOJDrFge8Cjk8FupsYKzHYfRlnf5fDv0/gtFy4EO5g+o7Nj56S7GvxoJsPqtyn4+8o1
         SZFojWaO9wW+56H/3cyvLIuXgq0kxPrhzUrbndD0yhvBCl8RFIDGuMEDUZCq+APxw1Jl
         FyxOQ60OFGXvqBIKCcchHpALiSPoAo8OYWTV9y+S5Y5xO7TDgiktbLPxOGZZ5bvzhpGd
         S/Sg==
X-Gm-Message-State: ACrzQf2PW7C+DJVwWYC3FSDgrNM8o015oqrjIpcPDSuwt7T3jmwgNhFv
        rwemDTKc+Ls++fp2m1YMog==
X-Google-Smtp-Source: AMsMyM7mAJ5G1LaKL+vJ2m0VrWl3wbGGik1naUdUeZ6GBAnBrys0Zfp+2Jly//XkJ/OFRb3N0fhkFQ==
X-Received: by 2002:a05:6808:130f:b0:355:167f:c668 with SMTP id y15-20020a056808130f00b00355167fc668mr373366oiv.143.1666740279428;
        Tue, 25 Oct 2022 16:24:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 63-20020a9d0345000000b006391adb6034sm1545527otv.72.2022.10.25.16.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:24:38 -0700 (PDT)
Received: (nullmailer pid 3438758 invoked by uid 1000);
        Tue, 25 Oct 2022 23:24:40 -0000
Date:   Tue, 25 Oct 2022 18:24:40 -0500
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
Subject: Re: [PATCH 01/11] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
Message-ID: <20221025232440.GA3430479-robh@kernel.org>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-2-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-2-waynec@nvidia.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 24, 2022 at 03:41:18PM +0800, Wayne Chang wrote:
> Extend the Tegra XUSB controller device tree binding with Tegra234
> support.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra-xudc.yaml       | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index fd6e7c81426e..517fb692f199 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> @@ -22,6 +22,7 @@ properties:
>            - nvidia,tegra210-xudc # For Tegra210
>            - nvidia,tegra186-xudc # For Tegra186
>            - nvidia,tegra194-xudc # For Tegra194
> +          - nvidia,tegra234-xudc # For Tegra234
>  
>    reg:
>      minItems: 2
> @@ -90,21 +91,27 @@ properties:
>  
>    phys:
>      minItems: 1
> +    maxItems: 8
>      description:
>        Must contain an entry for each entry in phy-names.
>        See ../phy/phy-bindings.txt for details.
>  
>    phy-names:
>      minItems: 1
> +    maxItems: 8
>      items:
> -      - const: usb2-0
> -      - const: usb2-1
> -      - const: usb2-2
> -      - const: usb2-3
> -      - const: usb3-0
> -      - const: usb3-1
> -      - const: usb3-2
> -      - const: usb3-3
> +      anyOf:
> +        - const: usb2-0
> +        - const: usb2-1
> +        - const: usb2-2
> +        - const: usb2-3
> +        - const: usb3-0
> +        - const: usb3-1
> +        - const: usb3-2
> +        - const: usb3-3

items:
  pattern: '^usb[23]-[0-3]$'

And an explanation why you need any random order. If it is just 
different for Tegra234, then you need an if/then schema for this.

> +
> +  dma-coherent:
> +    type: boolean
>  
>    avddio-usb-supply:
>      description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> @@ -153,6 +160,7 @@ allOf:
>              enum:
>                - nvidia,tegra186-xudc
>                - nvidia,tegra194-xudc
> +              - nvidia,tegra234-xudc
>      then:
>        properties:
>          reg:
> -- 
> 2.25.1
> 
> 
