Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B6B2BC367
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Nov 2020 04:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbgKVD1Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Nov 2020 22:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgKVD1P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Nov 2020 22:27:15 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BABFC061A4A
        for <linux-i2c@vger.kernel.org>; Sat, 21 Nov 2020 19:27:15 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id o3so12746326ota.8
        for <linux-i2c@vger.kernel.org>; Sat, 21 Nov 2020 19:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gcJ/gZYUXR9QLu14QvKD5lqjMbo7YC2xKOPSwdvWYkg=;
        b=cMVPreriOsxiBapSTAIYACsTKMFBggUNDJTWPOlbu0MizKIp/57CkomARQi2wFDxOo
         2TRVV6f9+x9LDc0a2qMMd1OG0BHwuco9fCKJD3Mrcad/HXwA+OePc8vrnmFqEtZXbFXN
         bcTOwwKNTLUIUQnOTQQ6wMJ+JjPJKy4s7iZbwDS8fEypkOJFOmNCy1rdiB3PQaBw75kZ
         449TFvTvmFCyLIIYLWzQ1xnURgApnSTv1M2vJEo0Y/txY+zB1z+t7O6KM3C0H9ZWdrmv
         Xkzrjfc1HZgeqozI+kAL0Q/uwOiOqkcHM81dm0BNhk6fn6udbpa9/UR48XBxKrog0EN+
         SutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gcJ/gZYUXR9QLu14QvKD5lqjMbo7YC2xKOPSwdvWYkg=;
        b=YuU+ZiQWW40F6HJwIGctV7HS4DfhFlO7jjVtC6675dpV6/QhBMbg0GyEWK1MtOJVgN
         SKZrUiN3HzzP2QFUzZNBKIhey+hkXmP3ar0FLssW53nLyE+k4e9tEqzU99FNXhq5E3qG
         znUPG/Vlj8bmqF1EyjJqw8me7Ci/FJGJT4B7jQkqfkPhNZ6pT2w58ukBpBykatfk6qr/
         xpBTzXQN48jS3y4Bqcn/pYvTPEAvykg23AJtlP3YE8rJcUhrZmkn7ey5rr/dw1ndAJVe
         ITmFVKoViaMfxtYMAnu2/W36Tqj+uAz2HUwgAClAa1Af5KjMQmJrRHuQgRjJP81eaAII
         /50g==
X-Gm-Message-State: AOAM530vu1ziim2Ns8putYBKk/Tq9A8JwS9lEoNirhUbt7E1avWnxi3S
        +gWsaStB4GxR1g9VR2sRlpeo8A==
X-Google-Smtp-Source: ABdhPJxOBeYHmrJgzTQIdruCWiGFr8x7Y922pbyzi4OB0QQCAhRvaOrUG7mkSy+BThKqLnb4GXH/tA==
X-Received: by 2002:a9d:68c3:: with SMTP id i3mr17893774oto.31.1606015634538;
        Sat, 21 Nov 2020 19:27:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c136sm4584564oib.7.2020.11.21.19.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 19:27:13 -0800 (PST)
Date:   Sat, 21 Nov 2020 21:27:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     wsa@kernel.org, swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH V6 1/3] soc: qcom: geni: Remove "iova" check
Message-ID: <20201122032711.GO8532@builder.lan>
References: <20201030145959.505-1-rojay@codeaurora.org>
 <20201030145959.505-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030145959.505-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 30 Oct 09:59 CDT 2020, Roja Rani Yarubandi wrote:

> Remove "iova" check from geni_se_tx_dma_unprep and geni_se_rx_dma_unprep
> functions as checking with dma_mapping_error() is enough.
> 

Applied this patch towards v5.11.

Thank you,
Bjorn

> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V5:
>  - This is newly added patch in V5. As per Stephen's comments separted
>    this patch from shutdown callback patch.
> 
> Changes in V6:
>  - Fixed nit-picks in commit text.
> 
>  drivers/soc/qcom/qcom-geni-se.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index d0e4f520cff8..0216b38c1e9a 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -705,7 +705,7 @@ void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>  {
>  	struct geni_wrapper *wrapper = se->wrapper;
>  
> -	if (iova && !dma_mapping_error(wrapper->dev, iova))
> +	if (!dma_mapping_error(wrapper->dev, iova))
>  		dma_unmap_single(wrapper->dev, iova, len, DMA_TO_DEVICE);
>  }
>  EXPORT_SYMBOL(geni_se_tx_dma_unprep);
> @@ -722,7 +722,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>  {
>  	struct geni_wrapper *wrapper = se->wrapper;
>  
> -	if (iova && !dma_mapping_error(wrapper->dev, iova))
> +	if (!dma_mapping_error(wrapper->dev, iova))
>  		dma_unmap_single(wrapper->dev, iova, len, DMA_FROM_DEVICE);
>  }
>  EXPORT_SYMBOL(geni_se_rx_dma_unprep);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
