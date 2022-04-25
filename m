Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5605E50EA05
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Apr 2022 22:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245184AbiDYUYE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 16:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbiDYUYC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 16:24:02 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DE3B8239;
        Mon, 25 Apr 2022 13:20:57 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id a10so18415825oif.9;
        Mon, 25 Apr 2022 13:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UYl3ObxUa/9hCeHQvInTEkQcuPIci9FGY8v4Ht1FoWE=;
        b=zkuOokXLExIuiaS0e+Murh+5MyrK+DUf6j0IgY+rr+IclSHQLFipB/0YPWX10QNGsH
         fMNAEx1kXC3VGOJoohi6IBDu7xR39fyyu1hmTQeX8pnrPv6e0aSonE5Eflthgk8/u66P
         bE2EmrlZGkZW9u7DlsGiA3ig6csw8YQhWMt5giJG3B0HxrbsKt73QVAfhxOUolPHiQ61
         hFq7QsjOEI21RXq75RB71OGU0Q5FOUlqCRfWbz9kjuBt8xteI9TloF4kJ+61Acd6ATH8
         b4zX0IJ3ZtY4p8D+0T95ngC4FRY+8IIfUIJGxzeGXRA4mOWV3sesEB8QuQk7xsVH52St
         YGqg==
X-Gm-Message-State: AOAM5329GnMk7HsAEXK8+J8tfgofHPiAKOpizNpLamDfi0vgzEJO+RQU
        CODpxKq/4cuQRpyWgCVeFg==
X-Google-Smtp-Source: ABdhPJxsTlIu73Fj0yj3q/bfw/wS9Og8lsPiGy3ZLKu+7xWkQKarNY1lHbTfOUL9QIgAkSN3ScMzMA==
X-Received: by 2002:aca:3587:0:b0:2ec:a23c:e197 with SMTP id c129-20020aca3587000000b002eca23ce197mr8995317oia.47.1650918056772;
        Mon, 25 Apr 2022 13:20:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a37-20020a9d2628000000b0060563c52952sm4179146otb.8.2022.04.25.13.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 13:20:56 -0700 (PDT)
Received: (nullmailer pid 203303 invoked by uid 1000);
        Mon, 25 Apr 2022 20:20:55 -0000
Date:   Mon, 25 Apr 2022 15:20:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
Message-ID: <YmcCp2b73bw4AYe/@robh.at.kernel.org>
References: <20220425133152.176949-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425133152.176949-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 25 Apr 2022 14:31:52 +0100, Biju Das wrote:
> Document RZ/G2UL I2C bindings. RZ/G2UL I2C is identical to one found on
> the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
> string "renesas,riic-rz" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added Reset property required on RZ/G2UL SoC
>  * Added Ack from Krzysztof Kozlowski
>  * Added Rb tag from Geert
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
