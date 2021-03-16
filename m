Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728DF33E0FF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 23:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhCPV7t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 17:59:49 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:38172 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCPV7m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 17:59:42 -0400
Received: by mail-il1-f171.google.com with SMTP id f10so14160938ilq.5;
        Tue, 16 Mar 2021 14:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aeVnCTv+BYETGQ6ruPdQNRmuQrv+4nEx6wR9zDqP/1I=;
        b=Gg1tMM4hlg6V0lWGg2X5uBgb+LLRGKTGOz4O4Ox9XudgrOVeDJfrq9HW+9FFo0h1Qg
         cr1LcZUcLLWz783oYkjkhW2D8qbYWC8zyK+lmC9DNWHycezXSx9dHaVl4utXH4+0O4dj
         cHZrBW+EWtEFAF3bocWZ9343QYKEcOOFrGrVULx4QeCSluo12b8qsrYOIb538CHOUmjl
         iqL/95Jt39dJBQgosHLtrTnyqgRVLo1J2o3+/XhDFCQ/2jhQgvx+wFpjjLzV5NQ786wR
         89V1atOvwUqk/uZihHIHErKVEXn1aUGQyHg8wWvFL9BL81THSa11lcD5ReleWJ2oj0Xq
         P8wA==
X-Gm-Message-State: AOAM530XMaRpgDMeUoKSrE+DeTvi0FOhyDSCArhp+4uEBmzZnVOXm6tI
        9Dx6+/Jj4TBym5gI7+RJyw==
X-Google-Smtp-Source: ABdhPJxa3E+RaZrOC60o5KtAnWX9gKBj56UimJTi/9xDGWDcvlBAc8BLOb9qn3JwJIrPdcuxQi7cFg==
X-Received: by 2002:a05:6e02:584:: with SMTP id c4mr5512298ils.153.1615931981843;
        Tue, 16 Mar 2021 14:59:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 128sm9071826iov.1.2021.03.16.14.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 14:59:41 -0700 (PDT)
Received: (nullmailer pid 3752344 invoked by uid 1000);
        Tue, 16 Mar 2021 21:59:39 -0000
Date:   Tue, 16 Mar 2021 15:59:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     shubhrajyoti.datta@gmail.com, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: xiic: Fix a typo
Message-ID: <20210316215939.GA3752259@robh.at.kernel.org>
References: <1615215963-1042-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615215963-1042-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Mar 2021 20:36:03 +0530, Shubhrajyoti Datta wrote:
> Trivial fix. Correct a typo.
> Fixes: f86ca4147976 ("dt-bindings: i2c: xiic: Migrate i2c-xiic documentation to YAML")
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
