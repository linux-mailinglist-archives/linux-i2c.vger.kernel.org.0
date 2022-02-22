Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84844C00A2
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Feb 2022 18:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbiBVR53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 12:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbiBVR52 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 12:57:28 -0500
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0463E9F3AB;
        Tue, 22 Feb 2022 09:56:48 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso18694899oon.5;
        Tue, 22 Feb 2022 09:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d0c5eaekgCsd/2MB/A2s3Yr0/x87WiLkg0ydsvjSbdg=;
        b=X5ln7daP7x36ZsQwdFB3GPGWMZbyrSw1tImIzf0EpnnNkjrt1zBa4+uwoixGuyE8Ko
         bgEhFZvEVl2Czxutg1OAhZv3S8fqJUs/N4onWCRB64yda9IFuA51xoRfmvpjOStBZJRX
         WpvqmsJ6KjKYrq6kCllipG9O0s0wU3cyM+WJIzkW/fJv/gQzTa9x/kIPaidKAUdVRytm
         ktqCiORrcA4/2xPE44Lc7tKu0jZAPLxKM8f+5F7qbMiBmLhdqjmQ4WacS2HzKqEOqqp7
         P2nJtXHWoHTLNwiPlgV7ufu5whS81R+jvaKHMkDzgLl4kEa19v4Dt0tig5u8IOvquaip
         z1Iw==
X-Gm-Message-State: AOAM531G135hW3DBrg/Gjr7+0Jfvy9GGgzveZRGjOgN0qEZI+tkLFVVT
        n0tOMbBMxyrShGVHpdKgDw==
X-Google-Smtp-Source: ABdhPJzyCoIdb4zb2XlsBbH2K09wgxaBCtYwIdcE2Yqsud2oVcKlTNvKGVY6PBPFKAl9JjY+BPTX8g==
X-Received: by 2002:a05:6870:790c:b0:d2:8591:d4a5 with SMTP id hg12-20020a056870790c00b000d28591d4a5mr2255509oab.265.1645552607973;
        Tue, 22 Feb 2022 09:56:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o15sm6387844ooi.31.2022.02.22.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 09:56:47 -0800 (PST)
Received: (nullmailer pid 3307024 invoked by uid 1000);
        Tue, 22 Feb 2022 17:56:46 -0000
Date:   Tue, 22 Feb 2022 11:56:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        krzysztof.kozlowski@canonical.com, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
        olof@lixom.net, arnd@arndb.de, digetx@gmail.com,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YhUj3uRQinOVF4eM@robh.at.kernel.org>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220035321.3870-3-warp5tw@gmail.com>
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

On Sun, Feb 20, 2022 at 11:53:12AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index 128444942aec..809c51ac32fe 100644
> --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> @@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
>  
>  description: |
> -  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
> -  both master and slave mode. Each controller can switch between master and slave
> -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
> -  RX.
> +  I2C bus controllers of the NPCM series support both master and
> +  slave mode. Each controller can switch between master and slave at run time
> +  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
>  
>  maintainers:
>    - Tali Perry <tali.perry1@gmail.com>
>  
>  properties:
>    compatible:
> -    const: nuvoton,npcm750-i2c
> +     enum:
> +      - nuvoton,npcm750-i2c
> +      - nuvoton,npcm845-i2c
>  
>    reg:
>      maxItems: 1
> @@ -36,11 +37,16 @@ properties:
>      default: 100000
>      enum: [100000, 400000, 1000000]
>  
> +  nuvoton,sys-mgr:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - nuvoton,sys-mgr

You can't make nuvoton,sys-mgr required for existing users. You can add 
an if/then schema for nuvoton,npcm845-i2c if you want to make it 
required in that case.

Rob
