Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781624AE713
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 03:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbiBIClk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 21:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244788AbiBICRz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 21:17:55 -0500
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A621C0613CC;
        Tue,  8 Feb 2022 18:17:54 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id g15-20020a9d6b0f000000b005a062b0dc12so567132otp.4;
        Tue, 08 Feb 2022 18:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AoYmK30p15Kis91rANkVDxIdYOYmlZHqQgBQtDWBCNA=;
        b=nbojxojcGUC3RgaIH1RkUkUEG9o4ZWYQ0tJUMHaoNohk2QUOvHQ+EehEeh4tL9rJ29
         Zmbdbd0mCbmpIxRzyK0Ta+fVn+kKnSuIUvVfFztPQVU13yj9tlBy+aNB7d/rRaNx/Evo
         TEFo8rZmizxmTxEbeRr0tHzLQrycot283gFV8o9fEDLJc/xnqIVcrtUWw6uPls8w5LTn
         PMnZHbCrd6PubTGkrOXSv+XbBc0gAYiSS8SPu659HAV6ezpMjLHBhDnGIDqb2P4GmdtO
         8RcLsSakwPMf37LrnsN7nW/Y6WhEoghcfV1B8D3+4cluftORZakj5sDmPrqxn1yAnFZO
         5NJw==
X-Gm-Message-State: AOAM53251B3TM8CISjAh19sm8YD1Xv+6ZdQquCvuD916ALW7jdHLD/JQ
        PULqg/cvhYsqidvPwRmDdg==
X-Google-Smtp-Source: ABdhPJyDjGb76z54LlUR+gFlVa3awyBD0pFt27gUyYRKckpwUT5VuGUujAmYiauGwQUs6DjGSzYXMw==
X-Received: by 2002:a05:6830:200f:: with SMTP id e15mr103879otp.174.1644373073907;
        Tue, 08 Feb 2022 18:17:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h27sm5961562ote.57.2022.02.08.18.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 18:17:53 -0800 (PST)
Received: (nullmailer pid 3472953 invoked by uid 1000);
        Wed, 09 Feb 2022 02:17:52 -0000
Date:   Tue, 8 Feb 2022 20:17:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: i2c: tegra: Add Tegra234 details
Message-ID: <YgMkUHUMaXQpMiZW@robh.at.kernel.org>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
 <1642080623-15980-3-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642080623-15980-3-git-send-email-akhilrajeev@nvidia.com>
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

On Thu, Jan 13, 2022 at 07:00:19PM +0530, Akhil R wrote:
> Add documentation for Tegra234 I2C compatible.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index 424a4fc..c58e256 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -80,6 +80,11 @@ properties:
>            support for 64 KiB transactions whereas earlier chips supported no
>            more than 4 KiB per transactions.
>          const: nvidia,tegra194-i2c
> +      - description: |
> +          Tegra234 has 8 generic I2C controllers, two of which are in the AON
> +          (always-on) partition of the SoC. All of these controllers are
> +          similar to those found on Tegra194.
> +        const: nvidia,tegra234-i2c

Sounds like this needs a fallback to nvidia,tegra194-i2c if it works, 
but without optimal timing.

Rob
