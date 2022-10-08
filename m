Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91ED5F851D
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Oct 2022 13:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiJHLu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Oct 2022 07:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJHLuZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Oct 2022 07:50:25 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770551C117;
        Sat,  8 Oct 2022 04:50:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b1so5632723lfs.7;
        Sat, 08 Oct 2022 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dji2Yw3SxEqIXHoPCkkOxGjvaONXRxPb3yOPhNs389g=;
        b=pcr8plzA5CjmEreaQB9NbfeIgWGA26IPHwvzgpWz8IqLAM8QW4AfwD7/PpJq8geUsw
         PFfuJp8MAM1B180Rrt8Hp4MXNa8G0QPTN2/EFHVN5yxhxedf8VHY0m+bUlkrNY0g2Y5s
         8ppvQvzGIP1TcpMXT1mIv8LCd9XaPxsh8eiSqJ+x8lP7JIsq0K8GAVjj80QI6/dtOVPp
         FWGJfnbpn0e+jRi5v6qPC2NxzDcsCuw1miGB3po+adJ4HTpe2y/kY/GRToshN9E/Y4+V
         5WYiwvN+BWPNjtkvmjXN7v4D3WI0bkqsWKu6coU73BEkqSB9dHG6tjMR/gy41cPHoCfg
         LqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dji2Yw3SxEqIXHoPCkkOxGjvaONXRxPb3yOPhNs389g=;
        b=Pa3Qxqntl8pxSbop8HZEs8dWjK2pTJPFZQLNhHha//3Yzzn0kuCR2ARSK2gyFMmzbD
         leKrHuGaLNg8YEF+EjiHAbcCth7WbMcw5+OYLWrOht4qA7LBmNlp2Gp4sreLIqcjtzOO
         D7vPW98Zj4mcz00b/JKmF5xafMKL7TcWLnKqmUKA6BWpWYPsxXxoJbY5VCy7hxstB+Dk
         Ac0+KT+DOwsZV2SycfyJlVSsvDG5mgrM5s9CjTbBviqHDJ2CI3ti3qc1ubty+BjVpAXb
         BfNAoHLGwzqAknfTelhM5QWCl8Y+6C/u2cCBmupxV/rH37gOIKlFVerrFdZzlWITRa77
         qZtQ==
X-Gm-Message-State: ACrzQf0n3OIlQQGOHoYkZTHL3nt7ADRBlkkvlickUScK9ndbDoLLAP51
        s5W5+zP3EqRW9tJbxpit33E=
X-Google-Smtp-Source: AMsMyM6Nil25Amkth0D58wMtsIVBBye5sPIdEv2BPNWT4MRn2Fzuyxvfn6ISWfxb1bacB6OckC6fKA==
X-Received: by 2002:a05:6512:224d:b0:4a2:7710:9b8b with SMTP id i13-20020a056512224d00b004a277109b8bmr3137394lfu.128.1665229822628;
        Sat, 08 Oct 2022 04:50:22 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id v18-20020a05651203b200b00494813c689dsm657418lfp.219.2022.10.08.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 04:50:21 -0700 (PDT)
Date:   Sat, 8 Oct 2022 14:50:19 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        robh@kernel.org, wsa@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v9 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <20221008115019.6jxsbawtye7cdkfh@mobilestation>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007075354.568752-2-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 07, 2022 at 09:53:50AM +0200, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 39 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9f1726d0356b..efad0a95806f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -4,21 +4,25 @@
>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP PCA954x I2C bus switch
> +title: NXP PCA954x I2C and compatible bus switches
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  
>  description:
> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> -

> -allOf:
> -  - $ref: /schemas/i2c/i2c-mux.yaml#

Why do you move the allOf statement to the bottom of the schema?

> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.

What about combining the sentence: "The binding supports NXP
PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices." ?
Currently it does look a bit bulky.

>  
>  properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
> +          - maxim,max7367
> +          - maxim,max7368
> +          - maxim,max7369
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -59,10 +63,33 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - maxim,max7367
> +                - maxim,max7369
> +                - nxp,pca9542
> +                - nxp,pca9543
> +                - nxp,pca9544
> +                - nxp,pca9545
> +    then:

> +      properties:
> +        interrupts: false
> +        "#interrupt-cells": false
> +        interrupt-controller: false

I'd suggest to add an opposite definition. Evaluate the properties for
the devices which expect them being evaluated instead of falsing their
existence for the devices which don't support the interrupts.

-Sergey

> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -79,6 +106,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vdd-supply = <&p3v3>;
> +
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;
> -- 
> 2.37.3
> 
