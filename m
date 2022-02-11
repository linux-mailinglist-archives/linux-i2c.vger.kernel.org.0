Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF91E4B2797
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 15:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239829AbiBKOLg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 09:11:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350727AbiBKOLf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 09:11:35 -0500
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDB0E04;
        Fri, 11 Feb 2022 06:11:34 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso10428377ooi.1;
        Fri, 11 Feb 2022 06:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0SV2EtE2DyvHlhXZRmT/vy9EPUpjFfj6FtIHp8ktws0=;
        b=ePIV67WgxRkohDMqOjvSnP2UlWHaAF8rUpKlPjhEtFh3FEor/fXatnsfb5lUwtjqW9
         J+QqRZYlJ9yuJlHNbAV/wafIEp9WaTe+x1eBlEOdLg6N1mb+/oMUeYJAtqbEqj1o85AU
         v3nUQ0qHMRcV/MHBC7UGln5JVYC2/e0GH3stA7BeedupKwEfNhmszmChTut34Qct5ZE7
         x1ntoYrD7MJJAVs99lnUDlIOyPB4SpGDhGrocI1hGSPB+WQEs3bUKET8bbLQSM2ijDg3
         tyfj6SltpUUluYtijScVtdy6hAnnrkK2a7ud5BU62+lsgCPtJp3Dx4ouXznKzGa+uBIe
         GQYg==
X-Gm-Message-State: AOAM531diWhpGE3TEsASZ1BiArUbR/n60m28ftjkNZvM7lDVLPBqQWqU
        64us/n7Um9TvY5KzM7jjwg==
X-Google-Smtp-Source: ABdhPJz0Q/vQAEnd+eQFPqa7mnQAmdC/kPYtDVZcW7VQrAYMQ5Mvz5QUYZ5ubAgeTUorbWVOLx7R6Q==
X-Received: by 2002:a05:6870:51c4:: with SMTP id b4mr190368oaj.78.1644588693922;
        Fri, 11 Feb 2022 06:11:33 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d7:a802:e6b0:6d9c:32f7:4bd9])
        by smtp.gmail.com with ESMTPSA id b32sm3916938oaq.43.2022.02.11.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 06:11:33 -0800 (PST)
Received: (nullmailer pid 289626 invoked by uid 1000);
        Fri, 11 Feb 2022 14:11:31 -0000
Date:   Fri, 11 Feb 2022 08:11:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0
 support
Message-ID: <YgZuky66e8fZnfXi@robh.at.kernel.org>
References: <cover.1643898531.git.geert+renesas@glider.be>
 <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
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

On Thu, 03 Feb 2022 15:33:16 +0100, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car S4-8
> (R8A779F0) SoC, including a new family-specific compatible value for the
> R-Car Gen4 family.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
