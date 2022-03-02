Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982354CAD72
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 19:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242391AbiCBSZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 13:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiCBSZB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 13:25:01 -0500
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140ED939A2;
        Wed,  2 Mar 2022 10:24:18 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so2866278ooa.10;
        Wed, 02 Mar 2022 10:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MSJbtF7R3/d/j8mjl9nalZaN2tSNCiNLZKQMPUsm00A=;
        b=AR9woadp/IjI0xcDaeol3IKHJAe62M0tu1fwrx44V3RXG6RPBuo0pYefTa5ObZXMVx
         pXa0yOxShb3HWIAYD5lciIceKT75lYFymio1pJR5SUS2naiZyCo9uC5BalL81D+EQSVh
         DAZdwZZQfuoZvoCfMTiD+F2Gj6sMRXm8/9GtC8BNSgufJQn6cjRniYHiWh6ERCG3C0Xg
         2B+u8ky8gz7JdhFetZqyyy1nwOHg7xqu1o4CSnr33Z2XfI7YPcLrTNn04ndHFMdY3Tab
         jADxhCw3nXrvm2TvZeXQhUMAUJ0SzlnCXrfzsAFth6T/cBLqbiEgYwDI587bdaFxwH6r
         KZow==
X-Gm-Message-State: AOAM533Tkzjzi+Pfe5/i2SP7xbXnSdum3QrN5TfKz7Rcrp7Quveuy7Aw
        vDgHwXbDsjZgdaWqqBJBCw==
X-Google-Smtp-Source: ABdhPJy7Mt26nWBw1w05aNEdWwb5DUxTy93UkULsXG4lm8r9WLxlw9l8jBBWUlYgV2EdElxo/l9zXQ==
X-Received: by 2002:a05:6870:f713:b0:d2:8adb:aaeb with SMTP id ej19-20020a056870f71300b000d28adbaaebmr891645oab.111.1646245457425;
        Wed, 02 Mar 2022 10:24:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i28-20020a056808055c00b002d51e377248sm9656272oig.33.2022.03.02.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:24:16 -0800 (PST)
Received: (nullmailer pid 4003574 invoked by uid 1000);
        Wed, 02 Mar 2022 18:24:15 -0000
Date:   Wed, 2 Mar 2022 12:24:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Message-ID: <Yh+2T/Mny15X+pOq@robh.at.kernel.org>
References: <20220301125046.17737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301125046.17737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Mar 01, 2022 at 12:50:46PM +0000, Lad Prabhakar wrote:
> Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on the
> RZ/G2L and RZ/A SoC's. No driver changes are required as the generic
> compatible string "renesas,riic-rz" will be used as a fallback.
> 
> While at it, drop the comment "# RZ/A or RZ/G2L" for "renesas,riic-rz"
> compatible string as this will avoid changing the line for every new
> SoC addition.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2
> * Included Ack and RB tags
> * Dropped the comment from generic string as suggested by Geert.
> 
> v1:
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/
> 20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I already applied v1. I may have missed this because PW stopped getting 
mail the last 2 days.

Rob
