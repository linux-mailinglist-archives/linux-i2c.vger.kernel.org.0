Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5ED4ABE70
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241751AbiBGMJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384680AbiBGL3e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:29:34 -0500
X-Greylist: delayed 397 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 03:27:55 PST
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C81EC0258C4
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 03:27:55 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC5E940041
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644233273;
        bh=Tn4bc4zR8BLXzuWSYuCglM3OFSG7x0cpAc4I3hArdaE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=DSFyRfh3ruPfe387MPeKtzA1Ni5+75V6zKBlM2VVthksiWqYuET8qSJdN5ppvbgsq
         KaHF7PRf/LPMYa885BFyIgOsRpOOvnvIvPnMFm8QFphZGkk1fL1DwIqp2rX4nBuj0L
         jk7SkH4eJrmaBFpeuT8O9BzKo+3zPRFx8oHHM0inLp3zQH5tF9OqeCV9ccTFRuNEKs
         WYM/BRs2kWjnH1yhaaabTCOarLF72O4XWE1Htc2dZklDquGQqoTvFfHa3u87BKnvYd
         1rez0O07Tbh0sciGUm9/j3MCTGfk9q5OIfQkFvu7KHN+FKe7wxpZzUuf0DGdZiaADG
         zOTU4S70QKOJg==
Received: by mail-ej1-f72.google.com with SMTP id qo24-20020a170907213800b006c7479720ddso1440090ejb.2
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 03:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Tn4bc4zR8BLXzuWSYuCglM3OFSG7x0cpAc4I3hArdaE=;
        b=tIx8seBW9Q5nsy7NB1D3/6p3Lt0ZOVCLeiIfhsWkROFZUEWNfDFILM5UpzyFvc/vcZ
         KwrFFNdyI+g2vpgarzA9paaGTmugfHMcKrqE79ySBEMFkJDXAaKgloM/7RQgs/KPVVcp
         J8iy3pr1YqDLNrTLxOZyHDm/IckLJWU1ye7aFNcvUsztCfzbIOrm+h9QUXhmHrLpKqP/
         Ag/BzdH6TODx88uV2bvFtBgGj1zgufgEURXyldXz7Bc/GfbrFrFy1SxmZLUzzrkS93WT
         u6vgeHAVHEoXFq4PBhEN4fWr5GY3CyEizmnk5hdS8PKVnec6sd4rZ34/Hkt22uCdwYwc
         b2eQ==
X-Gm-Message-State: AOAM5305fEemMrgvRKM5ovrZ6SRFsuT/O3SlE8Iy+UIEw65G524oJ5Ht
        zIT+O4oC6XKUeUirJoyVLDTngbJNAQz3OH6cxNKqJ4z18cJ/d4rpT95zhN5wZ7nJHCcymqSuRHl
        HscpFkaig+nm37vxu6OyNa8hZfijkPt2XgxlCcw==
X-Received: by 2002:a05:6402:881:: with SMTP id e1mr11159385edy.234.1644233273262;
        Mon, 07 Feb 2022 03:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4ZPRw7J+5pEKOaY5Z7jldo/XTG3FVjdDvBj6oSzyzQCPUO8pkxiH+YwKpJrz6QXStMDjdRQ==
X-Received: by 2002:a05:6402:881:: with SMTP id e1mr11159366edy.234.1644233273056;
        Mon, 07 Feb 2022 03:27:53 -0800 (PST)
Received: from [192.168.0.87] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z19sm3611505eji.87.2022.02.07.03.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 03:27:52 -0800 (PST)
Message-ID: <a3ef9a3d-951e-c7b2-f4e5-ec613997501e@canonical.com>
Date:   Mon, 7 Feb 2022 12:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Content-Language: en-US
To:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/02/2022 07:33, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This commit adds compatible and syscon description for NPCM845 i2c module.

Do not use "This commit" but instead:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

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
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - syscon

This breaks ABI of existing DTS. Actually your driver change does it but
here it is explicit...

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


Best regards,
Krzysztof
