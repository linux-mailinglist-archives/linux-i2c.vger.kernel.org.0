Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9174CBB89
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 11:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiCCKio (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 05:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbiCCKin (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 05:38:43 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A451B5E157
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 02:37:56 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB64F3F1C5
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646303874;
        bh=xOhToe4x9f97Ns7B9xh5lureiPwRVmCdE7nXxruX5Ts=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VT4iJf2G0YCyV7m/0MRtF4qG8jGo9XBUbp5cTY+q7796DBlJxSRAMhgSZH8D/GUfz
         gZKac3+SchW7mXPIb1l7ZYEvyI4dASmEkDgVHLx5MtStNj8lSwkgzRhOwV7npg2iAp
         IQqG2pMDYhHJ/7/2OROycTU1CAQ/1UkR02ZNYyFJo8pFTOjl+6uPCEf5dtMDqBPqM0
         UMvdI4KUHh+V9ALKJ22fnYaqyCZGSmCjjiYZmbFvQHjZ8kNd2o4cwz/9xj47kDscKv
         0BvX3xoPNWSOkQJKy72pPVGGICUVR5040ao4C8ZgGu9bEeQVcGAjl0B0VJ1aIzkVFn
         jgzVFobKaTGRA==
Received: by mail-ej1-f69.google.com with SMTP id nb1-20020a1709071c8100b006d03c250b6fso2508110ejc.11
        for <linux-i2c@vger.kernel.org>; Thu, 03 Mar 2022 02:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xOhToe4x9f97Ns7B9xh5lureiPwRVmCdE7nXxruX5Ts=;
        b=QX1cgSyyiLcZ6xFUZVk/FrGpUZsU2NyoaCqX5WdyFT1Z1N08Blp+el2FvJ2pQ7tm3c
         84szUdfaZo4WM6Jy2H23h3BKAKnW9UBF5Hhd4Hu+M2uz2XY1aBtuwwzySH1tpfimx/eo
         D1dfF5EAY2fsz+lAiByH3m2SCjjzytJJlL0ZyHEIFeW3mHdpPZP1vGA1aqR0x6dnvLQK
         iCwy6HlkGutgOhhBkDabKkoUov/6EX4gmNi1JVoLEeo4LaT58hortbBEtB1gF9NE8nQw
         uo3S6UUji2gvaZT4Lm6G/ctyb0I/T8Z7dHAfyoH9wjYUWcBiIKG1aK229//N713V4zQA
         IRjg==
X-Gm-Message-State: AOAM531ACilPSkDIWSK0GGatlEqYQe8KH6DfIDCV4E13IKEmI7Dm275l
        YROSGyzq0ocSAdOY12CK2pcS9rnswxoQRAWrmlr4QsuOwIzU92Hvw1fvZgdW8W9LACMAcqbKHpn
        WTBl2lL7g/Rz9ZwDrH91Npye9p6wbo9ynnK6bng==
X-Received: by 2002:a17:906:e04:b0:6ce:e210:4fe1 with SMTP id l4-20020a1709060e0400b006cee2104fe1mr27319530eji.402.1646303874422;
        Thu, 03 Mar 2022 02:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDYZj81Rphl4dYoYk1zvBPAtcEQQ07HvJC+n5Qx67PuSrOxEweiOj+yiH/LR8TWEP9H/K4/Q==
X-Received: by 2002:a17:906:e04:b0:6ce:e210:4fe1 with SMTP id l4-20020a1709060e0400b006cee2104fe1mr27319499eji.402.1646303874194;
        Thu, 03 Mar 2022 02:37:54 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id d23-20020a1709067a1700b006d0ebe4af89sm558554ejo.20.2022.03.03.02.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 02:37:53 -0800 (PST)
Message-ID: <cb77935e-64e0-c8b6-9fba-9835a3be432f@canonical.com>
Date:   Thu, 3 Mar 2022 11:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 02/11] dt-bindings: i2c: npcm: support NPCM845
Content-Language: en-US
To:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-3-warp5tw@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303083141.8742-3-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/03/2022 09:31, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 26 +++++++++++++++----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index 128444942aec..37976ddcf406 100644
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
> +    enum:
> +      - nuvoton,npcm750-i2c
> +      - nuvoton,npcm845-i2c
>  
>    reg:
>      maxItems: 1
> @@ -36,6 +37,10 @@ properties:
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
> @@ -44,6 +49,16 @@ required:
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const:
> +              - nuvoton,npcm845-i2c

This should be one line in const (not an enum).

Rest looks good to me.

Best regards,
Krzysztof
