Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2F152372E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 17:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343615AbiEKPYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 11:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343607AbiEKPY1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 11:24:27 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB54C227831;
        Wed, 11 May 2022 08:24:25 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 31-20020a9d0822000000b00605f1807664so690990oty.3;
        Wed, 11 May 2022 08:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/YW/NabRNlqlFBWgGilu1Fwu61bxFXT4UrNqhtMuKug=;
        b=7kbhuQV5fm7djNPeL34dLhVs/CrjVYvHV07Szsy3FTbiFw6F25GGDKWCPTvhV+LtBI
         O7dtzmfA5jxDtbiLallWKx7Kt12h0lR37jLyUCbxxCaXqL11QBIzEOpA9Q3SZ4t+kmCJ
         y5RYDMCSTYZ5PJST0UYqGVYnTIu9J0V/XUllYwoSaWs5rh1L5fSyzQqR5U7UW4fPhAq3
         +Fz1ERsp6wQ2317EXq7dYfPNpLOjI5aiWfsT4NOq7K+DhRUuCkEhn7KoDjeJO68KwvRd
         +GNiapaMmXozkerMr5EZu6xJLXlWCQs6Td6q195SRen4UacOvbaVNlLbWfl+U0j2GqkC
         tmZw==
X-Gm-Message-State: AOAM531GYnPpSucUuWqbYQzLc36hXY3sGTpQ9XJ+KLkoW2ri4jCAveeh
        yvuZH/nvXiM6ETZ2NRno7g==
X-Google-Smtp-Source: ABdhPJwW6W24dzq/fhBeIZjPgBInHoKIcnuL7XRJyzp48a8Nt/eKYf23URC2W2inbDtmAxg7YeSoLA==
X-Received: by 2002:a9d:674f:0:b0:606:5b6:b76e with SMTP id w15-20020a9d674f000000b0060605b6b76emr10106810otm.12.1652282664955;
        Wed, 11 May 2022 08:24:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t13-20020a4aadcd000000b0035eb4e5a6c9sm1014996oon.31.2022.05.11.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:24:24 -0700 (PDT)
Received: (nullmailer pid 339802 invoked by uid 1000);
        Wed, 11 May 2022 15:24:22 -0000
Date:   Wed, 11 May 2022 10:24:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     sven@svenpeter.dev, JJLIU0@nuvoton.com,
        linux-kernel@vger.kernel.org, jie.deng@intel.com, olof@lixom.net,
        lukas.bulwahn@gmail.com, jarkko.nikula@linux.intel.com,
        yuenn@google.com, arnd@arndb.de, tali.perry1@gmail.com,
        openbmc@lists.ozlabs.org, krzysztof.kozlowski@canonical.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org, tmaimon77@gmail.com,
        benjaminfair@google.com, tomer.maimon@nuvoton.com,
        kfting@nuvoton.com, semen.protsenko@linaro.org,
        Avi.Fishman@nuvoton.com, jsd@semihalf.com, wsa@kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        KWLIU@nuvoton.com, tali.perry@nuvoton.com, avifishman70@gmail.com,
        venture@google.com
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <20220511152422.GA339769-robh@kernel.org>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-2-warp5tw@gmail.com>
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

On Tue, 10 May 2022 17:16:46 +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
