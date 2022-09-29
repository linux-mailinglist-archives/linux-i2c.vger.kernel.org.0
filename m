Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A725EFF74
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 23:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiI2Vzv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 17:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiI2Vzu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 17:55:50 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1DA122A5F;
        Thu, 29 Sep 2022 14:55:49 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id k10-20020a4ad10a000000b004756ab911f8so1035346oor.2;
        Thu, 29 Sep 2022 14:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Yjnh8HSMJ5NiBKFIpfMId4PU3/mtLaI+EqNPvdW0CQQ=;
        b=fC/FLN4k1kT/aKcJFzbPRIh7ydfOIxoTlthKACNBxg/FYlzLEe0dxKofxtqQLCxquM
         O6jlzV2z752sCpfnZyKrvHah1Dv5VxfT5Vrtjf8J9xcA4nTz0b2LOKCS3K2pcGTZ1aHe
         /5b5QGsXO+5t2xQQRhK8tyKH0wGTz7fY3E4JpVBjF8VivPnpJ61jpYGfEErYOhgEJidp
         SfLvErCRV122sTWa+XrLdBnlh9taYuv7CupVm9mDdJPA92uM4+93cMqxVWQa4IsitKy3
         J8YtuV1k5yGK7YEYcUQde6fyCd3cGXHYHt79P7fV3Bs6RTyCGCYApU2d6lzxLJvpB6BK
         /r+g==
X-Gm-Message-State: ACrzQf2y2XWqq1OcIq3fQDWMC817+8nFCg41hHktN7oX3EsyZGrzpU04
        CCLZfbMIDr5vZ6AAvdsptQ==
X-Google-Smtp-Source: AMsMyM4M1XBF1QGETsNby8kbRTgmjV7LBFn+/hSYRl6r0HUxIY48AkJb/RN1U2lKLw9Cav3QZIW02A==
X-Received: by 2002:a05:6830:10c4:b0:655:b8bc:3ffd with SMTP id z4-20020a05683010c400b00655b8bc3ffdmr2224176oto.59.1664488549196;
        Thu, 29 Sep 2022 14:55:49 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w19-20020a4aca13000000b0044afd53b102sm131391ooq.36.2022.09.29.14.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:55:48 -0700 (PDT)
Received: (nullmailer pid 2773651 invoked by uid 1000);
        Thu, 29 Sep 2022 21:55:48 -0000
Date:   Thu, 29 Sep 2022 16:55:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH] dt-bindings: i2c: st,stm32-i2c: Document interrupt-names
 property
Message-ID: <166448854740.2773578.2114251650376941195.robh@kernel.org>
References: <20220926204631.381702-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926204631.381702-1-marex@denx.de>
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

On Mon, 26 Sep 2022 22:46:31 +0200, Marek Vasut wrote:
> Document interrupt-names property with "event" and "error" interrupt names.
> This fixes dtbs_check warnings when building current Linux DTs:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
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
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
