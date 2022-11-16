Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E09262CCCC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 22:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbiKPVhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 16:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbiKPVhO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 16:37:14 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2511B167D7;
        Wed, 16 Nov 2022 13:37:12 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id q83so20038073oib.10;
        Wed, 16 Nov 2022 13:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oefeuf5fuvGFpB+rvweoxv6bsV88f1v7eEwRKxp5gtM=;
        b=Zew91e1yRtoPmfyT3seBPi4LxW0BHbZUOve/yU2t2oVEFeqFt1N8IlqS3YqSAo/sq7
         RzJwdW/1mFWF7IfarNBnK5/eunPxF+IqzhW8TDCQKjCuF/eNVPrTRiexrUXMk6zS0zJB
         iTUU8PLnSw2krwONh357dUhRKwDTSe+iXXE8AbHPm7C+uw67M7yLBY4KintpeFI3/pYA
         kJThvJOIbs+XOgM+J6a3Mj4r7PO1Ru2qfxgEsrG3G3rb6JhbdR2DWtXgiiuoA68oeIXx
         QtkPZ1inlmPXkolrsJbcE85e2fqVZTz5f915ZyRpZWh62urAnFi9jEbDXuz6dNO1nO2p
         8leQ==
X-Gm-Message-State: ANoB5pk+yBXziLoNSlleJzFIevPrZmlK63bd2CW+OfDQ2DB6TMsJoG81
        JudvASUl6L3WbCDfS5rFwA==
X-Google-Smtp-Source: AA0mqf6lWGCUbNaxxK775OFLA/lUqyvZryGiDjkHAhJXPy85gpnhRcbtyviZPghK/T6FEJTtFwDFVg==
X-Received: by 2002:a05:6808:30a0:b0:359:f059:ed05 with SMTP id bl32-20020a05680830a000b00359f059ed05mr2516554oib.148.1668634632174;
        Wed, 16 Nov 2022 13:37:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f8-20020a056830204800b0066101e9dccdsm7233469otp.45.2022.11.16.13.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 13:37:11 -0800 (PST)
Received: (nullmailer pid 1015517 invoked by uid 1000);
        Wed, 16 Nov 2022 21:37:13 -0000
Date:   Wed, 16 Nov 2022 15:37:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/Five SoC
Message-ID: <166863463251.1015442.11078645842148048968.robh@kernel.org>
References: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 15 Nov 2022 12:30:18 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RIIC block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,riic-r9a07g043" compatible string will be used on the
> RZ/Five SoC so to make this clear, update the comment to include RZ/Five
> SoC.
> 
> No driver changes are required as generic compatible string
> "renesas,riic-rz" will be used as a fallback on RZ/Five SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
