Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5412D4BBEBB
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 18:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238861AbiBRRvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 12:51:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238447AbiBRRvL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 12:51:11 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4142673FB
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 09:50:54 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id r15-20020a4ae5cf000000b002edba1d3349so4371131oov.3
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 09:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i6PdaTZaoqrR3pWnqrcADN2t1Wh6WW3RvOic4loCQ2g=;
        b=mXgCS7/y0gs6Lf1lr7O/RG+nXEWcseUmfzR3/nAl+1Pb1Qs2+zyz5rgRUTqH3Ne/V1
         K/hT1kYcuCq7WbHpIgjK9HxuM7i1UDsV+5ZuOnSUHccmkcWg59O4KA/DmatwPyvv2avC
         5Gmcas/lcHb9ycO847tUmhK3HUOjO7l6m8K0bC1jjHwubpQm0HB8/u866HemwCQoElwc
         +zFDBVTF8HZJL1Rxq1XP2GDELr3d/zw/dCYmi7YigYKy534vB0oShlOdQ9EEvXsGhDV4
         CFwS3Q+zBzdGjWi4jDosguzFMrcpCODNmO4M6zZhZp9xICL4p9MAaYbhEhFeMnYjzfs0
         aImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i6PdaTZaoqrR3pWnqrcADN2t1Wh6WW3RvOic4loCQ2g=;
        b=6Xo5IuhnrpTOvG4pTzgQJichi8HLpC/QrhxjEV1zuf/7kiW4i7dnIz6Hyz0XnKBUD/
         PhcIMr1Sg+SW0RDo5PoE18WzzgBAtndMrrVOOuRzYEahsu9RIP0TJt4UTsnkBkF1ZPYM
         fRcDGD3vNGFBnPfT5mQ+42er6gfoeXxQbIkp/BR77AtJ/YwzObncFxIleUNrmdMWsgpn
         JptVvVXSTe0SLYvzOjylKRWy4LbRE917N5WHIz7HC6nwiueXwj/4za8HCW98M6URoO1z
         HhEEzRAnNQoMBwGwV2bbXJfdYSDMxrTeKS74EUeeN8r6wSNTb0nhVrVBxLfkIycNNgFs
         hEcg==
X-Gm-Message-State: AOAM531F0/vOpEz+oColoAWYwWES5w5PXARkPnrZDPIu4TlsvQaK+JKe
        UvzT4hPNP53BeZQyxXuuMwByRg==
X-Google-Smtp-Source: ABdhPJwGiKIuSKLq2Srt/umgk9hiZl0LZ27JYC0IPjV3D+pJl3Dpcskij6xMdpTTIeUvmcxqQpj8Qg==
X-Received: by 2002:a05:6870:8305:b0:d2:793b:1eaa with SMTP id p5-20020a056870830500b000d2793b1eaamr3325187oae.332.1645206654072;
        Fri, 18 Feb 2022 09:50:54 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i18sm60354oof.29.2022.02.18.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 09:50:53 -0800 (PST)
Date:   Fri, 18 Feb 2022 09:52:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: remove duplicate entry for i2c-qcom-geni
Message-ID: <Yg/c+27yR1P0b+eL@ripper>
References: <20220218104904.14405-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218104904.14405-1-wsa@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 18 Feb 02:49 PST 2022, Wolfram Sang wrote:

> The driver is already covered in the ARM/QUALCOMM section. Also, Akash
> Asthana's email bounces meanwhile and Mukesh Savaliya has never
> responded to mails regarding this driver.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

It would have been nice to go the other direction (reducing
ARM/QUALCOMM), but your assessment looks accurate, so:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  MAINTAINERS | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..f0485f61295d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15972,14 +15972,6 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>  F:	drivers/misc/fastrpc.c
>  F:	include/uapi/misc/fastrpc.h
>  
> -QUALCOMM GENERIC INTERFACE I2C DRIVER
> -M:	Akash Asthana <akashast@codeaurora.org>
> -M:	Mukesh Savaliya <msavaliy@codeaurora.org>
> -L:	linux-i2c@vger.kernel.org
> -L:	linux-arm-msm@vger.kernel.org
> -S:	Supported
> -F:	drivers/i2c/busses/i2c-qcom-geni.c
> -
>  QUALCOMM HEXAGON ARCHITECTURE
>  M:	Brian Cain <bcain@codeaurora.org>
>  L:	linux-hexagon@vger.kernel.org
> -- 
> 2.30.2
> 
