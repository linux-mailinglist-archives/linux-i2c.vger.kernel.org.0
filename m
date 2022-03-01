Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9024C8F2C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbiCAPfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbiCAPfl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:35:41 -0500
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB083652FD;
        Tue,  1 Mar 2022 07:35:00 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id z7so16532668oid.4;
        Tue, 01 Mar 2022 07:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VY7TwHjaayfX9tcJSbTXDc7mPcPeZN4TyVLpmamqtFU=;
        b=Uya+qz/p6ebYXruj8fe6jrNY2GZspVcq9pvcZcSlvD/X9CxLvBu60lUUMOJNr/aMeX
         8J8cLCfU/idATIgsqs6sinb+nqAq2Qhu1unWYP4XGdaAz3rgFibo2JKjYTzia0mHioF3
         xRjHDpFtKTrm7l97osEKzhQZ7WJFeKc3si+jRGtcb/plUqGNzXmqBqRjXD/MunfyMo4a
         TPrnO0SM3ZyVqjE2GZiAV8mrWVyBPB4SzcriCkCse7wjI88Lqib8O5MvXujhKxDYhBa+
         0EiFtMBM7Vzg9YVzZ2BzHfhCJnI1/zKLzlTPWHsw6cQEO0wffM/n+WjcfSsxr8O3kOsY
         yJNA==
X-Gm-Message-State: AOAM533KpwU9EMXxYHc2Y1Yhi0Aycl1IGph6IvN4BSCk56T0tJTycivf
        PbA9NiIZker4hdTYALjGkvbSfALOmQ==
X-Google-Smtp-Source: ABdhPJw/Je/G1Ac+6gh2zKlFSCICDWXhicb+NRZiW80kmeelNMxF+DFQ00IVKwo989LFPyMVnZTTkw==
X-Received: by 2002:a05:6808:1a29:b0:2d7:58b0:15be with SMTP id bk41-20020a0568081a2900b002d758b015bemr13438680oib.97.1646148900075;
        Tue, 01 Mar 2022 07:35:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k25-20020a9d7019000000b005af14095afdsm6631897otj.0.2022.03.01.07.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 07:34:58 -0800 (PST)
Received: (nullmailer pid 1288269 invoked by uid 1000);
        Tue, 01 Mar 2022 15:34:57 -0000
Date:   Tue, 1 Mar 2022 09:34:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Message-ID: <Yh49IbR4B0m+kh1f@robh.at.kernel.org>
References: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 27 Feb 2022 21:47:47 +0000, Lad Prabhakar wrote:
> Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on
> the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
> string "renesas,riic-rz" will be used as a fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> DTSI changes have been posted as part of series [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20220227203744.18355-6-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
