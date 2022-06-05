Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA59553DE72
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jun 2022 23:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347892AbiFEVrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 17:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347933AbiFEVrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 17:47:10 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFD110FA;
        Sun,  5 Jun 2022 14:47:05 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id a184so6197908qkg.5;
        Sun, 05 Jun 2022 14:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eEvBqpfDNp1gDkv6Nzdk7QI2mfC3GLl4R5QP+lrMbvA=;
        b=BK+Dz9K9PX7OOh5HU+9u3ENGR+uIEOx0rSMGqOxtIXtt/wqgjiPJ8K73j3Ga/XoDji
         feCVVgEAZ3DIXmygMg3AE3j+z6lVL+zq4oSaeImbKCNsK3kh8retiKHglyUxiz9Bu6n9
         sca42g3DeI5hKXdGAd7hhrbp/VIVJvR1dfdh4A+HTewpKSwr8u+5o2Emw94dZFTke4on
         lv2RKHUi96TgfEPmbJdRAfQhrtPo6c+fi1aJoolnWKYqXymaRXZ5qlaOkTCce5QXpvpl
         qDz011Eej1i2MBsr1mdwfXyWntU2e1UWBuH0hR2NIOBjGv3gqE4su1r+chSxNZ7DrLTk
         mL/A==
X-Gm-Message-State: AOAM531OsWhlWqkUpPzIcKJVGnDHCq69Ppv14NUz2D3PTEOCfbX9t9mA
        w5dBI4Xk+dViEeKUd+kqhTqmNCjVDg==
X-Google-Smtp-Source: ABdhPJyC7nsRGp7r9R2CQWA/Cgx5aIH6CBASg7KC9/6/3ZpnQ/Ef21Dng8wLb0+nHlIU5qgGVTTGBQ==
X-Received: by 2002:a37:315:0:b0:6a6:a90c:9072 with SMTP id 21-20020a370315000000b006a6a90c9072mr6703509qkd.256.1654465624964;
        Sun, 05 Jun 2022 14:47:04 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a455000b006a6b1c11235sm3207461qkp.84.2022.06.05.14.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:47:04 -0700 (PDT)
Received: (nullmailer pid 3577933 invoked by uid 1000);
        Sun, 05 Jun 2022 21:47:00 -0000
Date:   Sun, 5 Jun 2022 16:47:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Potin Lai <potin.lai.pt@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: aspeed-i2c: add properties for
 manual clock setting
Message-ID: <20220605214700.GA3558088-robh@kernel.org>
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
 <20220601041512.21484-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601041512.21484-3-potin.lai.pt@gmail.com>
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

On Wed, Jun 01, 2022 at 12:15:12PM +0800, Potin Lai wrote:
> Add following properties for manual tuning clock divisor and cycle of
> hign/low pulse witdh.
> 
> * aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
> * aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
> * aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
> * aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index ea643e6c3ef5..e2f67fe2aa0c 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -12,6 +12,28 @@ maintainers:
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stm32-uart

stm32 uart?

> +
> +    then:
> +      properties:
> +        aspeed,i2c-clk-high-cycle:
> +          maximum: 8
> +        aspeed,i2c-clk-low-cycle:
> +          maximum: 8
> +
> +  - if:
> +      required:
> +        - aspeed,i2c-manual-clk
> +
> +    then:
> +      required:
> +        - aspeed,i2c-base-clk-div
> +        - aspeed,i2c-clk-high-cycle
> +        - aspeed,i2c-clk-low-cycle

'dependencies' can better express this than an if/then.

However, I think this should all be done in a common way.

> +
>  properties:
>    compatible:
>      enum:
> @@ -49,6 +71,28 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  aspeed,i2c-manual-clk:
> +    type: boolean
> +    description: enable manual clock setting

No need for this as presence of the other properties can determine this.

> +
> +  aspeed,i2c-base-clk-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192,
> +           16384, 32768]
> +    description: base clock divisor

Specify the i2c bus frequency and calculate the divider.

> +
> +  aspeed,i2c-clk-high-cycle:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 16
> +    description: cycles of master clock-high pulse width
> +
> +  aspeed,i2c-clk-low-cycle:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 16
> +    description: cycles of master clock-low pulse width

These 2 should be common. I think you just need a single property 
expressing duty cycle.

Rob
