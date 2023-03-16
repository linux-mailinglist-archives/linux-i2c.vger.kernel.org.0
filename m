Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB676BDA69
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 21:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjCPUwG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 16:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjCPUwD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 16:52:03 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B678C81C;
        Thu, 16 Mar 2023 13:51:59 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id f14so1391117iow.5;
        Thu, 16 Mar 2023 13:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678999919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USqbbFii7jNdVFtJqwWg+qxI6tE7ioWlREjqm5MeAwg=;
        b=omc2Iw7a5gtTo4gPwASm+3+YCBW7jlnwdYK8YPNjDbbbzKOWA/8VqaNq1k2jctW+dL
         37PLzRSs06ltU149bhEXwh/HWzead3OPqloKfAdo2B7WfqNMJ4pouzcEH0TnUHDJuGbt
         5mXldFQTpDQsMLvJP+K35kU8nLyQOnFwde1OTAIBn0oXWydQHt99kwhbALOjLDwH+oCB
         vxExh7OY1DVyPJxz4H9B7X+xq4PmBLis0vQTzYhJt26idz5r0q6qJCCicmXsKjLrbVNw
         vr0Zb5IRhB69RLOaVhDbkhOhHM8tbE9YxbvVg6HHCZl/rgMHvGqkT9oKtH4JprjDJy0G
         t/gg==
X-Gm-Message-State: AO0yUKXbs/JiLRbHKVln60IbrEH0lm7+AHQYXkjfQtzzbitWyHEOz7gL
        hbQf0KuqolTsPPLiRp4U2w==
X-Google-Smtp-Source: AK7set+nOOWMzdvfw3rm9r4fETLp8LXP+qClueMPkiTtMG1eFj2e7hyUnqocf9KKJL6LrVUfNP+G5w==
X-Received: by 2002:a05:6602:314d:b0:729:d10b:d1f6 with SMTP id m13-20020a056602314d00b00729d10bd1f6mr356384ioy.0.1678999918707;
        Thu, 16 Mar 2023 13:51:58 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 185-20020a021dc2000000b0038a06a14b37sm87783jaj.103.2023.03.16.13.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 13:51:58 -0700 (PDT)
Received: (nullmailer pid 3858697 invoked by uid 1000);
        Thu, 16 Mar 2023 20:51:56 -0000
Date:   Thu, 16 Mar 2023 15:51:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as
 deprecated
Message-ID: <167899991607.3858644.5017644334578617372.robh@kernel.org>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
 <20230314215612.23741-2-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314215612.23741-2-andi.shyti@kernel.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 14 Mar 2023 22:56:10 +0100, Andi Shyti wrote:
> Now we have the i2c-scl-clk-low-timeout-us property defined in
> the i2c schema.
> 
> Mark "fsl,timeout" as deprecated and update the example.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

