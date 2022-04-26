Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6315107BA
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Apr 2022 20:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbiDZS7c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Apr 2022 14:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239545AbiDZS7b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Apr 2022 14:59:31 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DB3180EFD;
        Tue, 26 Apr 2022 11:56:22 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id q129so21729732oif.4;
        Tue, 26 Apr 2022 11:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ei3BSZiog9LkRAtvF1SQZsTuwUP4ipk5oz/aGgGqOw=;
        b=GRpz3DMHqdsZYoYe5dIWt82Kea3YVk1mjzfQ1QK1NPH5mJcY5164sVlUU+EN+O3iug
         9d6KvM9l8Ieq1ANIAQYJVpncXvNreDxEAYMQzyR7h6NClVtZbgbiMOYO6IqOOOco7nmz
         UkWonUOMdi3EdqiS7TwfIvDUx7vZx70KtbCypXBvCLEw8EsJwY02g9uBUONszbNQcstj
         9hNB8P9bQswudKaJMiKQBTA9nv0XxUNrhQdhvI9wQOfbgrTHzYUv3YRhGesauaSRvdjW
         9aiVjfX1r/iqybsu6TXc2IlTuKjkX1elJRmZSeb6YaJp+fVUt76Q7+nvkd3+2JXEpLeA
         JcKg==
X-Gm-Message-State: AOAM532ter332QGK6f9TKZLAAt1YvocVS5ffrLgkfkoXqBB+eDF5A0qP
        9BYw6mwab/3daJfCAlL5Sg==
X-Google-Smtp-Source: ABdhPJy7H8Hc56wwVMCMu1mrBG+OoGpuJtDsOfJzHeQKsSvt4Lr9D3OcWmwGuPvEU3gK+C7RCL6XJg==
X-Received: by 2002:a05:6808:f88:b0:323:c50f:8442 with SMTP id o8-20020a0568080f8800b00323c50f8442mr10711648oiw.160.1650999381417;
        Tue, 26 Apr 2022 11:56:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x16-20020a056808145000b00323371f6935sm5277370oiv.15.2022.04.26.11.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 11:56:20 -0700 (PDT)
Received: (nullmailer pid 2353993 invoked by uid 1000);
        Tue, 26 Apr 2022 18:56:20 -0000
Date:   Tue, 26 Apr 2022 13:56:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i2c-gpio: Add property
 i2c-gpio,sda-output-only
Message-ID: <YmhAVKOCccvt/moH@robh.at.kernel.org>
References: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
 <ff31e0c7-6a59-72c3-0e46-9231ec90ce9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff31e0c7-6a59-72c3-0e46-9231ec90ce9a@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 15, 2022 at 03:32:47PM +0200, Heiner Kallweit wrote:
> This documents new property i2c-gpio,sda-output-only.

The diff tells me that. The commit message needs the same 
justification(s) as you have in the cover letter or patch 3.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
> index fd0402845..25cd1b260 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
> @@ -33,6 +33,10 @@ properties:
>        open drain.
>      maxItems: 1
>  
> +  i2c-gpio,sda-output-only:
> +    description: sda as output only
> +    type: boolean
> +
>    i2c-gpio,scl-output-only:
>      description: scl as output only
>      type: boolean
> -- 
> 2.35.3
> 
> 
> 
