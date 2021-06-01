Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0369B39772B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhFAPvt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhFAPvs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:51:48 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1022C06174A
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 08:50:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id h5-20020a05600c3505b029019f0654f6f1so1379604wmq.0
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jun 2021 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WdETsCRKY4os9kllNCB4jSefDrVkhrCY6bqwrR0XeTw=;
        b=gddUDKq8PpQrhDh2XK3F6MMe5HbMGjC6l9SoxQ5sC9Fd30FUCB08CWBakDshCYQmBM
         6lWGK2tDdV1rv/WXjuohz8XG/DMY+Jf6Y83nchdRii0wJXQrv0eQVflubk0ql4/7bcLY
         xqSSkNniR2rBTb9x/zdj3Dh4uNAGRYc8hfbmvH6PdW1l4a7LYPAzb6q2OeRnjLyKBMFe
         nA2gCXwbqhU8l2NrYAsjlAcL2ki0tC7Pzl3TK9XJsIOTppPyY9Gs+FNKm84rj+nBRiZk
         1YqejYf24mcrGKFS2cHx+z4LiX+jKYmRCVzzpRFA1fimvl6AFG3heEFkfWjMRESu67l4
         Nkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WdETsCRKY4os9kllNCB4jSefDrVkhrCY6bqwrR0XeTw=;
        b=gWHna9E1cp/gQkZIeifByQqVFQ2ttB50NYlJUNR+9o0pEk1YsLnvMAkLvLazGNwDk+
         9P0xuk7AiV3JxxIvd3ya44/ncyww2JRI1S5IucR1ckTDj5OoGdvELd39NHKxrIzUc4+b
         MsTl4NSOE/iYZN/EA5w1v6olPuKZaA/nVIN9qHto2XlPKwdAFXVSA6DburL745ycAExj
         pChewFobIzsh21l1oMojjwCdFcXwx1v99NMnRdpEUI1+3XEjYRcXMTxKgaA3RQSZ+sd6
         OC1vrrVnMzFgwEgsCGroPgU38Qs7OXg6KoOA+gMTHft3MP0gY1LYwtc6Y8qspeDPRUMy
         7iAg==
X-Gm-Message-State: AOAM530qgEjp+2+KCaRm7fZw9MBRFXrvuERkJxTtZH3QrX9q9jua617a
        +PDR9PZm78kKxMHNw7HWgBEJpg==
X-Google-Smtp-Source: ABdhPJxm/6kOzJAMLbPyTQnHiUuT3hRimVa19PcjdNU3xnm14yvjNYHVap2PwllbKoR3LOA/NjtnIA==
X-Received: by 2002:a05:600c:2054:: with SMTP id p20mr562349wmg.165.1622562604490;
        Tue, 01 Jun 2021 08:50:04 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id 25sm2949103wmk.20.2021.06.01.08.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:50:03 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:50:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: ti,j721e-system-controller: Fix
 mux node errors
Message-ID: <20210601155002.GB2165650@dell>
References: <20210526184839.2937899-1-robh@kernel.org>
 <20210526184839.2937899-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526184839.2937899-2-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 26 May 2021, Rob Herring wrote:

> The ti,j721e-system-controller binding does not follow the standard mux
> controller node name 'mux-controller' and the example is incomplete. Fix
> these to avoid schema errors before the mux controller binding is
> converted to schema.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../mfd/ti,j721e-system-controller.yaml       | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
