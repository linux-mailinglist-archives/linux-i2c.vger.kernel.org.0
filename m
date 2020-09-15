Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA70826ADDD
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 21:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgIOToW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 15:44:22 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36266 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbgIOTnf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 15:43:35 -0400
Received: by mail-io1-f67.google.com with SMTP id d190so5491148iof.3;
        Tue, 15 Sep 2020 12:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eRZQhzTMmUeiuKlmoGBp2VVdP4CJK3/kYrIG+y2NeFo=;
        b=FndszHdbYrZQNqsIosY+6r7P27hHS3zIteobKpRLAgbLBm1LfZsUS/3bT3leDHF258
         bc+lSdyJ9f/xzo90Wv5IrQkuRxZSsdceqf1M3CLMWZl/VdrT2nMIzwZLNulnxX9LlEsd
         f/QHhFv9EQXK214jl1FS0zCr7CbZ8//z/kCi9grbFDz/odfwltokEm5oPMCWCyZEiJvK
         4tb0ylNqJltPAc6pFbxvCoIVTQGog2ps4vFFhJKsinDD0KVMtMcWtJN8uCLV1bf35LB9
         pVyqH97OboEyonATKZGBtuCC09N9tFhIHHy+WW7U5SvF/H/7an7pWuJPJShu9hEW4h+L
         Emeg==
X-Gm-Message-State: AOAM531x3Qc+JwfFx8LHiisVMwsflab2cE8KJUxWymNZIMhR8NMdAXil
        BLS/4luLWAOuiF39eYK7Fg==
X-Google-Smtp-Source: ABdhPJxnXWTYKNffPmeuhGOFEm7G5Yf/fEtWzDxYMOeM7FZMNDfZGxx3N8Ni10M0QTyXrE9I8ZxqQA==
X-Received: by 2002:a6b:700f:: with SMTP id l15mr16331604ioc.168.1600199006137;
        Tue, 15 Sep 2020 12:43:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n68sm9704118ila.43.2020.09.15.12.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 12:43:25 -0700 (PDT)
Received: (nullmailer pid 2381919 invoked by uid 1000);
        Tue, 15 Sep 2020 19:43:24 -0000
Date:   Tue, 15 Sep 2020 13:43:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: i2c: imx: Add properties and use
 unevaluatedProperties
Message-ID: <20200915194324.GA2379924@bogus>
References: <20200910182244.5815-1-krzk@kernel.org>
 <20200910182244.5815-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910182244.5815-3-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 10, 2020 at 08:22:43PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so
> describe all typical properties, reference generic i2c schema and use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
>     '#address-cells', '#size-cells', 'pmic@25' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. None
> 
> Changes since v1:
> 1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> index 810536953177..19c9daba6e9f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -9,6 +9,9 @@ title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
>  maintainers:
>    - Wolfram Sang <wolfram@the-dreams.de>
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -38,6 +41,9 @@ properties:
>                - fsl,imx8mp-i2c
>            - const: fsl,imx21-i2c
>  
> +  '#address-cells': true
> +  '#size-cells': true

Drop these.

> +
>    reg:
>      maxItems: 1
>  
> @@ -75,7 +81,7 @@ required:
>    - interrupts
>    - clocks
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.17.1
> 
