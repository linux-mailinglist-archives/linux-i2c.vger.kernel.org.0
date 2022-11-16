Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E84562CC36
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 22:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239088AbiKPVGV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 16:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbiKPVFw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 16:05:52 -0500
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2936768C4E;
        Wed, 16 Nov 2022 13:05:01 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso11228518otb.2;
        Wed, 16 Nov 2022 13:05:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPb+hxEbevRL4EpwGZMxw2145qAIDik/fJZXBGeTjRQ=;
        b=3LTdG47CkYi/JKP5SweaxBShdG+ToZaNGc9S5gjbvI+SaIonaDMqxWIVrVnIZb/rt1
         f/OZDSaC7gE5c/VqzHh84dZciNra2rg5ebwsTKHVCsSItH9hMrAYodlEX2ljetm5FYKA
         svdbnGdr4Emb/TIGQK0eDdG1uRGXm+dYYFmbYcP85cDNq/3HSjmk1eA7OhjwYoB5w7kq
         8IKmgEgWYX1zZ3WUQ578kMJ9SknFJnPOQBE0AgHF1aND/kAdTVQARHbqZTJAroT23gka
         Mq6u8HiPhBkA5EedYDmBD5Z5oK9D7fJ2pBuPvsPKmV84aax083RwgbaUgCeFrwI8lrwH
         ZR+A==
X-Gm-Message-State: ANoB5pnlZfmSowqslnX6VedakvP7wU421TP6VhoWl7W8Rxkqj3ZKUJgy
        b/8rCsIz7PCNpRgcW5F63w==
X-Google-Smtp-Source: AA0mqf71d/wGKKxQlFEfSQxfiLFxHauKFXXJRWt4PDDX7gax2bvQbIjxEflrHDuY7Vb/+ZE8LPPSeg==
X-Received: by 2002:a9d:6d89:0:b0:66c:6f0c:d278 with SMTP id x9-20020a9d6d89000000b0066c6f0cd278mr12122160otp.375.1668632700314;
        Wed, 16 Nov 2022 13:05:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l17-20020a05683016d100b006393ea22c1csm7026075otr.16.2022.11.16.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 13:04:59 -0800 (PST)
Received: (nullmailer pid 884378 invoked by uid 1000);
        Wed, 16 Nov 2022 21:05:01 -0000
Date:   Wed, 16 Nov 2022 15:05:01 -0600
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
Subject: Re: [PATCH v3 01/13] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
Message-ID: <20221116210501.GA877429-robh@kernel.org>
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-2-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114124053.1873316-2-waynec@nvidia.com>
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

On Mon, Nov 14, 2022 at 08:40:41PM +0800, Wayne Chang wrote:
> Extend the Tegra XUSB controller device tree binding with Tegra234
> support.

Why do you need any order and number of phys? Please explain in the 
commit msg.

> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:address the issue on phy-names property
>  .../bindings/usb/nvidia,tegra-xudc.yaml       | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index fd6e7c81426e..52488a731c4e 100644
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
> +      enum:
> +        - usb2-0
> +        - usb2-1
> +        - usb2-2
> +        - usb2-3
> +        - usb3-0
> +        - usb3-1
> +        - usb3-2
> +        - usb3-3
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
