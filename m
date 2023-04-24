Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319C36ECE01
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 15:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjDXN2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 09:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjDXN2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 09:28:43 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63D96E8C;
        Mon, 24 Apr 2023 06:28:28 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6a5f765d595so3157940a34.0;
        Mon, 24 Apr 2023 06:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682342894; x=1684934894;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5mm/PKOtok+XOtGt2TQkPtnhoPGSUZ5pISa/2lD/E+I=;
        b=cd8JuXCuGi4qyOvZA1ye6Miqvc7cuWYpS5OfcisZtiEregnzcLzEBH2Z39GaD0xU7y
         s2qRdi2ajvaJC7rzoStqdcy0xsD3YqzM3V2bUA8mcPfIursB1V8+cDaMG7FuQX++REcf
         ixa7vy8ixLvCVM7YBqnFIuXWpXqLINEX+dttUDWrHqwndTZXM24w+2isgHwjN27TXmck
         sy1NtO78RGZkw0htgBTUkL3hFC+gVymr/O0sbuVLiAn0iOD+W2UIiM6FS33KfptwooA/
         SA9iChAY52pKkoCuPxcvTSLv7kYBlFyTwpIA6l02REY3CXV768FY2eQ1DHvAXulyKR8/
         gRpg==
X-Gm-Message-State: AAQBX9faTbM2Zb+la0CYrKCugOrQqnTI7RRKB7lRE9p9T5hTkwVggZTK
        TL+tx3D3BgFBctjh7nW/ng==
X-Google-Smtp-Source: AKy350YqY2lW2oami4UIhF5DbCs39ranfvq1pFAllCrnd1zhOEf67fXPRlT03HKpwO87SQHWRz/TlA==
X-Received: by 2002:a05:6870:d29b:b0:18e:9101:733b with SMTP id d27-20020a056870d29b00b0018e9101733bmr3373216oae.14.1682342894061;
        Mon, 24 Apr 2023 06:28:14 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80e7:4387:ec9f:155:c2d2:6e82])
        by smtp.gmail.com with ESMTPSA id n124-20020a4a4082000000b00541854ce607sm4806954ooa.28.2023.04.24.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:28:13 -0700 (PDT)
Received: (nullmailer pid 2494972 invoked by uid 1000);
        Mon, 24 Apr 2023 13:28:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
Message-Id: <168234258850.2489090.5138716439435477956.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to
 YAML
Date:   Mon, 24 Apr 2023 08:28:08 -0500
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


On Sun, 23 Apr 2023 14:40:18 +0200, Stanislav Jakubek wrote:
> Convert Broadcom Kona family I2C bindings to DT schema.
> 
> Changes during conversion:
>   - add used, but previously undocumented SoC-specific compatibles
>   - drop references to SoCs that are not upstream
>   - add supported clock frequencies according to the Linux driver [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---
> Changes in v2:
>  - add missing arm-gic.h include
>  - fix indentation to 4 spaces
> 
>  .../devicetree/bindings/i2c/brcm,kona-i2c.txt | 35 -----------
>  .../bindings/i2c/brcm,kona-i2c.yaml           | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com


i2c@16000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@16000: compatible: ['brcm,kona-i2c'] is too short
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@17000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@17000: compatible: ['brcm,kona-i2c'] is too short
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@18000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@18000: compatible: ['brcm,kona-i2c'] is too short
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@1c000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
	arch/arm/boot/dts/bcm23550-sparrow.dtb

i2c@1c000: compatible: ['brcm,kona-i2c'] is too short
	arch/arm/boot/dts/bcm23550-sparrow.dtb

