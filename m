Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4A9231AB6
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jul 2020 10:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgG2H7t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 03:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgG2H7s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 03:59:48 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9A0C061794;
        Wed, 29 Jul 2020 00:59:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z18so17113999wrm.12;
        Wed, 29 Jul 2020 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z5da3dx2SAn+bVOvyHxQOVatBrN8Ykye0kzHE6DAqV0=;
        b=NfyQpnB9G7M/mRumGDa4PyxncFONzIQPe4J7blxFyH+Ryj3ihh197KaeLo2Y13CHai
         II013x6AH4Qcod8ylw9wYU3Ni/7ZX1nLS9McnJX5VSkDwait471nEyHD0MmjTw7XM57/
         pgPzc6Ir7A/rYPtPEkJANVVCB2hxCVX6fU9GpaRGuTU0ycD+9iO6ufFJ7JBSU0iJH5ip
         en4ZpzG5Pt5bRmW95dZklfUg4vQpjHPnrIWVT1vebuCcYv7+l6WkWbL/sBH+GZH7X+7C
         WujIRwi1JrAyz4IpHL5SP56lNX9sZDzuQgS/hAlaYmUACjMrguj/HOy+3SxMUdDZfwY4
         sl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z5da3dx2SAn+bVOvyHxQOVatBrN8Ykye0kzHE6DAqV0=;
        b=nn8aMwy8YLAoMywsAC6Gs5Je7vxlH87cK2X22QUVNsYizpXryen/RW5ekh8mXe1Ih0
         8fAbYym6AbQExEhBPIvgJFt3bgCTgYi5veUyLNlG0MewwcITyl4Nli5ILJXVdArZvFwH
         ixNCIto3LWPAwYrQDq9w7PIrC4JuXnsY06yQ7Mxv8gJXv6oA9cENVdTXPPmQvBMewowr
         Ab48dmceCpoNKABYbulavCyPp2avz7fTehws5YdyUSrJ2pYDOQA8GezLqDVxHQW07Ce1
         LJtBlxU1PIMKlKb0uOSIY7m71beT/S1DYQuaAj1wA7ZQXuBzFnacKV+iHX/qhqT48Ixi
         craQ==
X-Gm-Message-State: AOAM532QdiEL0YtD3jZdZvAxNkaYxGFn8F5X4FcComC90PpQbmYBFfy2
        37onyoAq18tPLe1fDtuQL/M=
X-Google-Smtp-Source: ABdhPJwGStf0UKkkT0IHuZkO3DIghNUfUWpgTVBI4oN+HOrXJy1ffPv96tWb7B+ddXIu3I6Ov4OccQ==
X-Received: by 2002:a5d:526d:: with SMTP id l13mr26968687wrc.279.1596009587006;
        Wed, 29 Jul 2020 00:59:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id w14sm3418220wrt.55.2020.07.29.00.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 00:59:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram in
 i2c driver
To:     Qii Wang <qii.wang@mediatek.com>, wsa@the-dreams.de
Cc:     qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
 <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <25ff4899-5e7d-f6e5-599c-4bf368a731e1@gmail.com>
Date:   Wed, 29 Jul 2020 09:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 28/07/2020 14:30, Qii Wang wrote:
> Newer MTK chip support more than 8GB of dram. Replace support_33bits
> with more general dma_max_support and remove mtk_i2c_set_4g_mode.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 38 +++++++++++++++++---------------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e6b984a..49777a6 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -204,11 +204,11 @@ struct mtk_i2c_compatible {
>   	unsigned char dcm: 1;
>   	unsigned char auto_restart: 1;
>   	unsigned char aux_len_reg: 1;
> -	unsigned char support_33bits: 1;
>   	unsigned char timing_adjust: 1;
>   	unsigned char dma_sync: 1;
>   	unsigned char ltiming_adjust: 1;
>   	unsigned char apdma_sync: 1;
> +	unsigned char max_dma_support;
>   };
>   
>   struct mtk_i2c_ac_timing {
> @@ -311,11 +311,11 @@ struct i2c_spec_values {
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
> @@ -325,11 +325,11 @@ struct i2c_spec_values {
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
> @@ -339,11 +339,11 @@ struct i2c_spec_values {
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
> @@ -353,11 +353,11 @@ struct i2c_spec_values {
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
> @@ -366,11 +366,11 @@ struct i2c_spec_values {
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
> @@ -380,11 +380,11 @@ struct i2c_spec_values {
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
> @@ -796,11 +796,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   	return 0;
>   }
>   
> -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> -{
> -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;

I think you missed my comment in the last version:
I2C_DMA_4G_MODE is no longer needed, you can delete it.

Regards,
Matthias

> -}
> -
>   static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			       int num, int left_num)
>   {
> @@ -885,8 +880,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
> @@ -908,8 +903,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
> @@ -954,11 +949,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
> @@ -1232,8 +1227,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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
