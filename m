Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECEA04B29F0
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 17:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346853AbiBKQOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 11:14:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348479AbiBKQOf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 11:14:35 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA35D85;
        Fri, 11 Feb 2022 08:14:34 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id e16so9477371qtq.6;
        Fri, 11 Feb 2022 08:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S8xpmHV8qmgZo5KtADQn+41vGynS6Djxd0MCgfJYJrQ=;
        b=GlBwSGExYlqMA3Dz6aNJO2wAcYYYdlGzXiQFuVC82wJ7h5HX9d5hWhinjxRg+fygr0
         9GJjeKUqK2omckJilz34yRiAHk1F1wLAA1B2aoogNdW+VWRwyzdIB6h6QXfkp1H3L12O
         sookpEW93dnUFmAkzSTebVjlQjBjxMmU+Ww7jENQqODmYNM1UrGKOEqh7mSSufQMQJ65
         eekyuw6hzrDCvfShx24n9zdUKaa5WiA/0Bvp98RPWGK8W4yggMXnzL/75V2iEP18uTyP
         8pACPSWe8rKC+LQhTE4tyLetcMGJ69YbfbmST8Pyf9wTh1H+BMxFhizuPrtZs+PwTfni
         lNBw==
X-Gm-Message-State: AOAM531wmi7297uQaBg+v/8yKYqUrOaz2+ZKo83/i9wWUM/usNbMrqAi
        ova6P41K8FF465PZKT15VQ==
X-Google-Smtp-Source: ABdhPJw7PmtZ0vR8j0t1v4dIdypSD5XvhTxwoO4r3Ep/YYX74YcRRmX53LbVFhJVgfCECa+VAteR/A==
X-Received: by 2002:a05:622a:1ce:: with SMTP id t14mr1604389qtw.25.1644596073068;
        Fri, 11 Feb 2022 08:14:33 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
        by smtp.gmail.com with ESMTPSA id t18sm13012269qta.90.2022.02.11.08.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 08:14:32 -0800 (PST)
Received: (nullmailer pid 451271 invoked by uid 1000);
        Fri, 11 Feb 2022 16:14:28 -0000
Date:   Fri, 11 Feb 2022 10:14:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        krzysztof.kozlowski@canonical.com, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YgaLZLuCwdpUgMea@robh.at.kernel.org>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 07, 2022 at 02:33:33PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This commit adds compatible and syscon description for NPCM845 i2c module.
> 
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index 128444942aec..05e58f44b03a 100644
> --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> @@ -7,17 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
>  
>  description: |
> -  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
> -  both master and slave mode. Each controller can switch between master and slave
> -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
> -  RX.
> +  The NPCM7XX includes sixteen I2C bus controllers and the NPCM8XX includes
> +  twenty-seven I2C bus controllers. NPCM8XX controllers 24-26 are connected on I2C
> +  pins in parallel to controllers 8-10.

How many instances is really outside the scope of this binding. And I 
don't want to be updating this for every new SoC. So rework it to cover 
both chips and the next one.

> +  All controllers support both master and slave mode.
> +  Each controller can switch between master and slave at run time (i.e. IPMB mode).
> +  NPCM7XX I2C controller has two 16 byte HW FIFO for TX and RX and NPCM8XX I2C
> +  controller has two 32 byte HW FIFO for TX and RX.
>  
>  maintainers:
>    - Tali Perry <tali.perry1@gmail.com>
>  
>  properties:
>    compatible:
> -    const: nuvoton,npcm750-i2c
> +    enum:
> +      - nuvoton,npcm750-i2c
> +      - nuvoton,npcm845-i2c
>  
>    reg:
>      maxItems: 1
> @@ -36,11 +41,16 @@ properties:
>      default: 100000
>      enum: [100000, 400000, 1000000]
>  
> +  syscon:

nuvoton,sys-mgr or similar.

> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - syscon
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
> @@ -57,6 +67,7 @@ examples:
>          clock-frequency = <100000>;
>          interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>          compatible = "nuvoton,npcm750-i2c";
> +        syscon = <&gcr>;
>      };
>  
>  ...
> -- 
> 2.17.1
> 
> 
