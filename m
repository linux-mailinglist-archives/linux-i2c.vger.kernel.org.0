Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635C8229B93
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 17:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbgGVPia (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 11:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730382AbgGVPia (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 11:38:30 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA72C0619DC;
        Wed, 22 Jul 2020 08:38:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a6so4626994wmm.0;
        Wed, 22 Jul 2020 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ylc7qLRRrMH6H2UFevhm+/uCNfEKRkKzQpNEzJ1tCQw=;
        b=lnaVdBB8azpaFkq8qD2+4PQY7y2msO0gCqVtuxkicRYn+wezhs6Z5pLmDo5qVlhtKS
         B+PtaD2n+k3jqKCD5dT8VulgF1Bdk2wj6MOf3mfmc2U8PcJGn2wH6M614xeavZygetUX
         QeLcoRZqoqgz6x+3oZpfpL3/p3sFPH7OhN7eGGVqYEkdqQGD5tqdC0/Q5RYayc1sHmds
         yty8lrM3BYtSScRMg7E5Wa+UixO3iFOzeuGAPumqjCaUgohZ6ZGg6bZg+0ROvC+MdUgB
         Z18wbhgZoGjbUN5IcYIFeNPeG+S62zsqsPO9wJpMJmCOAFF2CORPYgi8oNzG7ZuSbrUU
         c02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ylc7qLRRrMH6H2UFevhm+/uCNfEKRkKzQpNEzJ1tCQw=;
        b=n8m4qJhWhIxXI4YI0wox1KggEaFh+yzblpYypflIGvKm6HJ5dX88vbGnqcHih2wtpS
         2CQ1FDifOP8oFjRZbJuATBMKcaJAqdC3b4Zr9bOiQ0GzPSHJ/x+R05pwS8tjGl2YZCcY
         iwMDXKEcc8O7+Bs1X9+BluwM95laFAK0NzdirK4t9EAMkglXVXenP5CM9VoPa48OuRm3
         MJ+mGDCvQ/ZwWMpzXr5Jl1pBaVGrgo4/OeV6xMg45fy/qzef6GOJTZoeGQiFDDNDuYzV
         TWGdDD7SteUcsiW1QTlT0qQ5EjA7bOnuvpyOY5x3jkSQ3KgqoDrxZ93IQ8/SEvXR4nPd
         ofNQ==
X-Gm-Message-State: AOAM530A1D92hDUFWXGF0498GXw48e99RQFgoaSYDZLg5icomGX57J+o
        jQwt59OtmDsSF3vGQZbTsvo=
X-Google-Smtp-Source: ABdhPJx6Px97Z7ADx5ieGw6VhWBsc9D7294PT05rKbXSTT+BglTgblzgGqfr7YpFyWbPg5nQY8MYZQ==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr214085wmg.93.1595432308443;
        Wed, 22 Jul 2020 08:38:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id a123sm101145wmd.28.2020.07.22.08.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:38:27 -0700 (PDT)
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
To:     Qii Wang <qii.wang@mediatek.com>, wsa@the-dreams.de
Cc:     qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <87429327-5d2e-e3f3-db22-04e225a31055@gmail.com>
Date:   Wed, 22 Jul 2020 17:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 22/07/2020 14:31, Qii Wang wrote:
> Replace 'support_33bits with 'dma_max_support' for DMA mask
> operation, and replace 'mtk_i2c_set_4g_mode' with 'upper_32_bits'.

Please explain more in detail what you are doing and how this fits to the way 
the HW works.

> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 37 +++++++++++++++++--------------------
>   1 file changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e6b984a..e475877 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -209,6 +209,7 @@ struct mtk_i2c_compatible {
>   	unsigned char dma_sync: 1;
>   	unsigned char ltiming_adjust: 1;
>   	unsigned char apdma_sync: 1;
> +	unsigned char max_dma_support;
>   };
>   
>   struct mtk_i2c_ac_timing {
> @@ -311,11 +312,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 1,
>   	.timing_adjust = 1,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 33,
>   };
>   
>   static const struct mtk_i2c_compatible mt6577_compat = {
> @@ -325,11 +326,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 0,
>   	.aux_len_reg = 0,
> -	.support_33bits = 0,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 32,
>   };
>   
>   static const struct mtk_i2c_compatible mt6589_compat = {
> @@ -339,11 +340,11 @@ struct i2c_spec_values {
>   	.dcm = 0,
>   	.auto_restart = 0,
>   	.aux_len_reg = 0,
> -	.support_33bits = 0,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 32,
>   };
>   
>   static const struct mtk_i2c_compatible mt7622_compat = {
> @@ -353,11 +354,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 0,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 32,
>   };
>   
>   static const struct mtk_i2c_compatible mt8173_compat = {
> @@ -366,11 +367,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 1,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 33,
>   };
>   
>   static const struct mtk_i2c_compatible mt8183_compat = {
> @@ -380,11 +381,11 @@ struct i2c_spec_values {
>   	.dcm = 0,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 1,
>   	.timing_adjust = 1,
>   	.dma_sync = 1,
>   	.ltiming_adjust = 1,
>   	.apdma_sync = 0,
> +	.max_dma_support = 33,
>   };
>   
>   static const struct of_device_id mtk_i2c_of_match[] = {
> @@ -796,11 +797,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   	return 0;
>   }
>   
> -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> -{
> -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;

I2C_DMA_4G_MODE define could now be deleted as well.

Regards,
Matthias

> -}
> -
>   static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			       int num, int left_num)
>   {
> @@ -885,8 +881,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			return -ENOMEM;
>   		}
>   
> -		if (i2c->dev_comp->support_33bits) {
> -			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
> +		if (i2c->dev_comp->max_dma_support > 32) {
> +			reg_4g_mode = upper_32_bits(rpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
>   		}
>   
> @@ -908,8 +904,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			return -ENOMEM;
>   		}
>   
> -		if (i2c->dev_comp->support_33bits) {
> -			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> +		if (i2c->dev_comp->max_dma_support > 32) {
> +			reg_4g_mode = upper_32_bits(wpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
>   		}
>   
> @@ -954,11 +950,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			return -ENOMEM;
>   		}
>   
> -		if (i2c->dev_comp->support_33bits) {
> -			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> +		if (i2c->dev_comp->max_dma_support > 32) {
> +			reg_4g_mode = upper_32_bits(wpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
>   
> -			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
> +			reg_4g_mode = upper_32_bits(rpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
>   		}
>   
> @@ -1232,8 +1228,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	if (i2c->dev_comp->support_33bits) {
> -		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(33));
> +	if (i2c->dev_comp->max_dma_support > 32) {
> +		ret = dma_set_mask(&pdev->dev,
> +				DMA_BIT_MASK(i2c->dev_comp->max_dma_support));
>   		if (ret) {
>   			dev_err(&pdev->dev, "dma_set_mask return error.\n");
>   			return ret;
> 
