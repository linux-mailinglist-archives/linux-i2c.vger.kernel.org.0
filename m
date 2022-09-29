Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25905EFF7A
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 23:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiI2V4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 17:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiI2V4K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 17:56:10 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F6813F280;
        Thu, 29 Sep 2022 14:56:07 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-131b7bb5077so3429710fac.2;
        Thu, 29 Sep 2022 14:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=19hB2F57JLOkRO/nhyuWYiaI9Vqsr0sGfzDh4ehMbO8=;
        b=4OoTgDBDoSllrrjVp0taF1TeIHOjOUzQLc8X0ydgIhPfR86Gj6E/Jncz93IwL4UHH+
         ur2kfVXUXXCepko2MDOlQtYC2JPoNxAw/mODPe2wBOAjDTx0U5tXB1wlTRL5Pbeapfku
         6sCrphgIxUhC0LNp4xaq3UVPqw0Pkzu38J8XfyIc5+AE2ysdzy/r6vFAdwe0XCbUlxoE
         J8xf1jMU9mMSBdvn2HyizxhAEbCGaq4z3p8b7jp9r009AfwACUERYmd3okiFu8NfusyP
         GeNVeeaeGYBHf635Im686N3lWVVFwWiSBQSDJV91T/0c0wZG1lvvG5As4qasdwz6NJbQ
         NAiQ==
X-Gm-Message-State: ACrzQf2C6zuES2wk20iSECLFf7N+pY8GMqFBH0X9JZYVT98MSZo9mjzA
        Cbpx6vw1lZ0+y0urmluLtg==
X-Google-Smtp-Source: AMsMyM7SuENX6lvCfV9rT7jPEOtdkrnuOKkw71aF6ZkHNDFP7Knct9531nfyCqgbqHCydPAtM2cB3g==
X-Received: by 2002:a05:6870:2110:b0:12c:cfd2:8178 with SMTP id f16-20020a056870211000b0012ccfd28178mr10146404oae.123.1664488566767;
        Thu, 29 Sep 2022 14:56:06 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g5-20020a9d6485000000b0063711d42df5sm197998otl.30.2022.09.29.14.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:56:06 -0700 (PDT)
Received: (nullmailer pid 2774081 invoked by uid 1000);
        Thu, 29 Sep 2022 21:56:05 -0000
Date:   Thu, 29 Sep 2022 16:56:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: st,stm32-i2c: Document wakeup-source
 property
Message-ID: <166448856463.2774018.6148210751198203104.robh@kernel.org>
References: <20220926204653.381722-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926204653.381722-1-marex@denx.de>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 26 Sep 2022 22:46:53 +0200, Marek Vasut wrote:
> Document wakeup-source property. This fixes dtbs_check warnings
> when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
