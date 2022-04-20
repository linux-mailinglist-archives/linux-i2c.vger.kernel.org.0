Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7418A508D40
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 18:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380479AbiDTQaM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 12:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237190AbiDTQaK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 12:30:10 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CB130F7E;
        Wed, 20 Apr 2022 09:27:23 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id e15-20020a9d63cf000000b006054e65aaecso1465116otl.0;
        Wed, 20 Apr 2022 09:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jFuQiVxiXaw/El9IycEi9N+hGxVYoIfTUPQ0SiPX/0c=;
        b=OOSHy1bjN31vB+wJ+/DJaizVPTMo5u9qcXgWIQi/bmhOKu5r/Jpfa4p/LLrOGcbawj
         gfzkDKGmQJH3zvnUQX74TPotuXXx0IAmkD0rMU1LQZp/G4SKMAEoE/rfXulP5bCn4+IQ
         UnLpECYqgoRGohmkQJBHdlTbHBPbXcYQyJkUalJk0aR7xJTSNlioWOj+zawt5fcnxJpu
         yEYT+dSYW23Te8/6HFr5JiRsSbRu0z7uYdniMLSXb6UpK/VwaleJ9k2mDUtK3gaCymhX
         AnZzPNoLpYzhzvqo775NZMUhoLYlF8JMlreEO1gtJ9kV67Qo2FGqlZD1Vyl99JFrKBDS
         K7zQ==
X-Gm-Message-State: AOAM532uxtp6FSOarUQBPGNNyjLMzFDS54z9USmXDOhEuxTdOF01+G+R
        Nbvu7SXlDJ8D44eVK21QxQ==
X-Google-Smtp-Source: ABdhPJy5120ZKKxc25SIrkCRbf3UzELRwnoGL36gZxRGSW/S3gcNKYd4KBxbuxmyp3sVrkV4/KxeBw==
X-Received: by 2002:a05:6830:25c1:b0:5e6:f161:423a with SMTP id d1-20020a05683025c100b005e6f161423amr8007220otu.78.1650472043196;
        Wed, 20 Apr 2022 09:27:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f24-20020a9d5e98000000b006055789d903sm1850856otl.16.2022.04.20.09.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:27:22 -0700 (PDT)
Received: (nullmailer pid 1427968 invoked by uid 1000);
        Wed, 20 Apr 2022 16:27:22 -0000
Date:   Wed, 20 Apr 2022 11:27:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v8 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <YmA0ahwtJJxq0EcQ@robh.at.kernel.org>
References: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
 <20220419124025.1733230-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419124025.1733230-2-patrick.rudolph@9elements.com>
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

On Tue, Apr 19, 2022 at 02:40:22PM +0200, Patrick Rudolph wrote:
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
> index 9f1726d0356b..21ab286c74f2 100644
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
> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
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
> +      then:

'then' is aligned with the 'not', so guess what all this does? Nothing.

Rob
