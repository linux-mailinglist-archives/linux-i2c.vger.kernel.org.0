Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F784B94A2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 00:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiBPXnY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 18:43:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236907AbiBPXnY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 18:43:24 -0500
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC9E13C38E;
        Wed, 16 Feb 2022 15:43:11 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id a26so1717299iot.6;
        Wed, 16 Feb 2022 15:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CRjHfQOjI0mmOa6NhLg+/gN/vr6jaESGsMoKgehOdWk=;
        b=NxJkwvgbiVlL1GMEmDT0NJrKJWumHuWD11F1GcIUn6iZCfmmbO0B1XRrFlk6ihrLiT
         I8BkcmsuOxVkAI4z85mRnWiTMLgXhNs9NNE0im6xy1jiAyG0V6qDvCz9wbni1ayV+y3i
         sSz4Ju0WdPrGzAfZgMgUvCycWV7eqYEcW/cWS2k2uSc3pNzO5/5hiepzGIpcvHrWZIKl
         rFqHaDkkm/9rZBdw8WNKQgQECKGosJgF9a1ckOSy3ll7RWHlV9XLuNuEZuNSLt/1SC8c
         pJ9MMCf2B3WKoy50DkXs3nxBpVpR4KObVjjpdDJK8Xu/kzFxD0vPh76yNh3KbP8RzzoS
         Q5sQ==
X-Gm-Message-State: AOAM531fbcIPVETl/aIibwal8sDsHv2/Jr1CZsZ73Fx+uU6vXVdHjeNe
        dpGKifclf1JDIfGxQ8bYpBrzJ+bGKg==
X-Google-Smtp-Source: ABdhPJzYA3SGZs3cIXGfYrgcESqrOx7Ezc+E2xRcM2xfKgqnUewWsDFahrdSZDa1d8exUTaPCL3ZKw==
X-Received: by 2002:a05:6638:3183:b0:306:7ccc:92af with SMTP id z3-20020a056638318300b003067ccc92afmr153577jak.259.1645054990760;
        Wed, 16 Feb 2022 15:43:10 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id x15sm906308ilu.11.2022.02.16.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 15:43:10 -0800 (PST)
Received: (nullmailer pid 1902474 invoked by uid 1000);
        Wed, 16 Feb 2022 23:43:08 -0000
Date:   Wed, 16 Feb 2022 17:43:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [v6 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <Yg2MDCQNJJBhO5UY@robh.at.kernel.org>
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216074613.235725-2-patrick.rudolph@9elements.com>
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

On Wed, 16 Feb 2022 08:46:10 +0100, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 44 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

