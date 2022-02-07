Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6674ACA8D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 21:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbiBGUru (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 15:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237353AbiBGU35 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 15:29:57 -0500
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8DAC0401E4;
        Mon,  7 Feb 2022 12:29:57 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso15092009oon.5;
        Mon, 07 Feb 2022 12:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=97ZiDr1pWOIZs6a0V07Cgau+iYYDAgVzyXSEggW9BA4=;
        b=26o6ONDiDMj4+0qrLXYrJUEFQhgULH2cmBPwBItkcMXhVFCwtNiMJT3YxvlnLT2pC8
         PVcVX0XGQgW0XwgGchXs+Ez6wlZRHl0v1ms6beBJCP/aVktaRRUw/L9wZHegmo6w+tpU
         mYOc4x/9ntydwWW3wMAeuUs15+onkgiAUf6ySHx7udbo3xMCvKlBjqqWHmCe1GysT5da
         L+bfNkrlj9J4uYG6RYUwEHBqqMdD3G5cCgzV+C8CqmCiD/ReDodNEYEbsqQDVdg7vpj0
         B6K0nAujSumhn0ZaKnC+daDllhrQuokwmxewlYgmS028XfCCe+EoTAZJVttul/jTEmBy
         1eRA==
X-Gm-Message-State: AOAM533+LV8iTQP0xD3QH1pwFERkCUdNYsDVk/8BGbQWdUj2aOfy8lnQ
        ODhAqu2sgTHkBbOpdOSQTHbGCRYRNQ==
X-Google-Smtp-Source: ABdhPJxhm8erulb0bepfDZ4zFRrkl/KUgSCcfuY9JQGf4h0LaLKEtK0zuhGspiKqRi6UXyJYQkTXpQ==
X-Received: by 2002:a05:6870:a604:: with SMTP id e4mr235985oam.74.1644265796865;
        Mon, 07 Feb 2022 12:29:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a19sm4424207otf.27.2022.02.07.12.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 12:29:55 -0800 (PST)
Received: (nullmailer pid 854530 invoked by uid 1000);
        Mon, 07 Feb 2022 20:29:54 -0000
Date:   Mon, 7 Feb 2022 14:29:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [v4 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <YgGBQhBrMez+caA0@robh.at.kernel.org>
References: <20220207092827.104978-1-patrick.rudolph@9elements.com>
 <20220207092827.104978-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207092827.104978-2-patrick.rudolph@9elements.com>
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

On Mon, 07 Feb 2022 10:28:24 +0100, Patrick Rudolph wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
