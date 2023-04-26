Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 445836EF94C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 19:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238367AbjDZRYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 13:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237875AbjDZRYJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 13:24:09 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CB47EF5;
        Wed, 26 Apr 2023 10:23:58 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f09b4a1527so76302445e9.0;
        Wed, 26 Apr 2023 10:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682529837; x=1685121837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0ch1Zj1yR3zA2Re6SXXBwKV1OBZa+p9aq6626w6hik=;
        b=UXJtonTararykMI90n/r3aVqXjl/3IH4Fo1/wJtna2YdwxYXrtOHKgJuQUx05oYelf
         hoBZ06cRuXkSNQJY1TkcnTySMtCYMr9vKxp3dYLd/53JhR5iQtsuV1OEgwRF1M+4A+Qq
         ToJW10tmAdr8kc526MyVvdTySUaG/okGkrdtXjZy/it99egQBdGiLPJIBeOOvS1wDnfA
         Yl61dO56bozxW73+MaCzq9L2TROqV89JWLnvZqNxYK9zVbX+WLMQ+8zNfby2VKWAEVjN
         ReLCGB0t4T3Qq2Z9gXV1jNLKnuGAi2J2KdGAmmWHvICyT1z8OYv3D+9H7yRLPhkVnwU4
         G60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682529837; x=1685121837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0ch1Zj1yR3zA2Re6SXXBwKV1OBZa+p9aq6626w6hik=;
        b=KZ2C77iI260JA0yeyUoPIByf5eRYdgwdEsRLeNo+JfMl70lEQJdxgYSkRDJJg0JO+M
         r7LG7PgCUoHHvvzDStbEIxtd8TMGAdSnL7pnwXa/Xv+EbO9782gUZDEmNHzuylKD9ZMQ
         jRpSwrGFbn2xauxdg0P8IZi7qZRzaMw6pc0Mcn5EMQqBc0zmrQb2hDuTKRmBFpxPbC5W
         K21A5vVjAd6XLfXHzj+zCDkS8yxFwdk8P95Ny3Vp7XTA0UUSB5vXOPY6jXs81ywFVDkx
         yHecS+lIdik5CNdGNfn9XZd0zL4oEU+/B+5yDrU8AyZPzY8i4HwOd1ocFLo+aNt5rd4E
         OXTQ==
X-Gm-Message-State: AAQBX9d0VQz6AtGTCEgjnn0B2y29m74sSfIxGmVS+BrBQHWvEhEOW1wT
        xHhe3xLPk82Oz3MeWoJydV8=
X-Google-Smtp-Source: AKy350baE8hhsPsOnNs0ltE4qGiPIpDMvzW/D6A+2A3YBj8ojBRdVYD37gSW+KDjsoRYXnHw0AZ9FQ==
X-Received: by 2002:a1c:7211:0:b0:3f1:7372:66d1 with SMTP id n17-20020a1c7211000000b003f1737266d1mr13541746wmc.0.1682529836473;
        Wed, 26 Apr 2023 10:23:56 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id s12-20020a7bc38c000000b003f1739a0116sm18557110wmj.33.2023.04.26.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:23:56 -0700 (PDT)
Date:   Wed, 26 Apr 2023 19:23:54 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <20230426172354.GB2506@standask-GA-A55M-S2HP>
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
 <168234258850.2489090.5138716439435477956.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168234258850.2489090.5138716439435477956.robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 24, 2023 at 08:28:08AM -0500, Rob Herring wrote:
> 
> On Sun, 23 Apr 2023 14:40:18 +0200, Stanislav Jakubek wrote:
> > Convert Broadcom Kona family I2C bindings to DT schema.
> > 
> > Changes during conversion:
> >   - add used, but previously undocumented SoC-specific compatibles
> >   - drop references to SoCs that are not upstream
> >   - add supported clock frequencies according to the Linux driver [1]
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731
> > 
> > Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> > ---
> > Changes in v2:
> >  - add missing arm-gic.h include
> >  - fix indentation to 4 spaces
> > 
> >  .../devicetree/bindings/i2c/brcm,kona-i2c.txt | 35 -----------
> >  .../bindings/i2c/brcm,kona-i2c.yaml           | 59 +++++++++++++++++++
> >  2 files changed, 59 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,kona-i2c.yaml
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com
> 
> 
> i2c@16000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@16000: compatible: ['brcm,kona-i2c'] is too short
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@17000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@17000: compatible: ['brcm,kona-i2c'] is too short
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@18000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@18000: compatible: ['brcm,kona-i2c'] is too short
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@1c000: compatible:0: 'brcm,kona-i2c' is not one of ['brcm,bcm11351-i2c', 'brcm,bcm21664-i2c', 'brcm,bcm23550-i2c']
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 
> i2c@1c000: compatible: ['brcm,kona-i2c'] is too short
> 	arch/arm/boot/dts/bcm23550-sparrow.dtb
> 

These warnings are fixed by the first patch in the series.
Maybe it didn't apply?

Regards,
Stanislav
