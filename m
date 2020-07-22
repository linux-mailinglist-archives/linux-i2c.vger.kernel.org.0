Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCEA229B58
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 17:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732651AbgGVP0q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 11:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbgGVP0p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 11:26:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A234C0619DC;
        Wed, 22 Jul 2020 08:26:45 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r12so2283177wrj.13;
        Wed, 22 Jul 2020 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=akcO108wudl5eEgjnEkCunNDPWVs+eb32qFL3qxkaXw=;
        b=F2fwuh965Lrcv6Mm0JcItJPFlBbuhKsYu3vNEmQZNerCWr81bNRRX4fkIVyJXvACp/
         FzkQT599/MCpybVn4aCNU0QzU7QZezbKdNmmG5k3Ql7hCsVAxG4C5dbO9YEGmRttgenP
         liuwWy5QPuG6HDkDs5BqyLFpFZNcWp0hdtxeAyu9ns4TCRrzghh3vhyJE924/t0noFSa
         UQl1YxYVdqdMd6yUm8UHewWEeLnoJyCtbHcvc+cjn2UNXhX1ON4DFLH5UfF02vc8PGvB
         cSRU1ppxJM1pWIgRnSkXtsctrfgA97KJyOEAA4iScx23/65MFX73gSPVqy5te4OQiKAG
         QFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=akcO108wudl5eEgjnEkCunNDPWVs+eb32qFL3qxkaXw=;
        b=ZCXm4s/Z5ZewrMnEZtagShCUIfpO89sHnWMGv8W9GDZMxiuqtR0Z89YkS5btg1PgQW
         BBgBmqpFPCJiRNbgEE8bu3YQcDjGgMSYJlWUM5xgkWEBTylMEldeZsvf0QWs84s6Tou5
         VrOGwJRBoQexfWHlF71U17uOtETUQgwjvX8YG5o4mp4GR/DLX8pCTDp/bIi/Fph9vEI7
         cjw6SmUOzgLO2DiD9xBUuf5p+NHCFOWIHT/lSsr2d4PSiiFw8XHGP9H+EB+nyQwLNxoB
         k9Nlzvl7pgYlxbTfNoYTTYb0IIWDg6fywFPIyix6HwFSn5l38Rhrb2nR0YmWt6dyaMyI
         44GQ==
X-Gm-Message-State: AOAM533n+wMHw8TXJ7VqIL8Mcsz5Qn28vsR6kL/R3IybeqxIPDz5PSPV
        1myOH6IGzW9+vn24keltiRs=
X-Google-Smtp-Source: ABdhPJzNhFaLsOgasoKvuzKRv3v1C9BYgx4EPcERrylzUFA6ZeQ9um13EegybBW95xbv9HkDiglmnw==
X-Received: by 2002:adf:e701:: with SMTP id c1mr112470wrm.350.1595431604326;
        Wed, 22 Jul 2020 08:26:44 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id u2sm54779wml.16.2020.07.22.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:26:43 -0700 (PDT)
Subject: Re: [PATCH 1/4] i2c: mediatek: Add apdma sync in i2c driver
To:     Qii Wang <qii.wang@mediatek.com>, wsa@the-dreams.de
Cc:     qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <58e23057-d84c-7fc2-e912-6569cbbf1b25@gmail.com>
Date:   Wed, 22 Jul 2020 17:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 22/07/2020 14:31, Qii Wang wrote:
> With the apdma remove hand-shake signal, it need to keep i2c and
> apdma in sync manually.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index deef69e..e6b984a 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -48,6 +48,9 @@
>   
>   #define I2C_DMA_CON_TX			0x0000
>   #define I2C_DMA_CON_RX			0x0001
> +#define I2C_DMA_ASYNC_MODE		0x0004
> +#define I2C_DMA_SKIP_CONFIG		0x0010
> +#define I2C_DMA_DIR_CHANGE		0x0200
>   #define I2C_DMA_START_EN		0x0001
>   #define I2C_DMA_INT_FLAG_NONE		0x0000
>   #define I2C_DMA_CLR_FLAG		0x0000
> @@ -205,6 +208,7 @@ struct mtk_i2c_compatible {
>   	unsigned char timing_adjust: 1;
>   	unsigned char dma_sync: 1;
>   	unsigned char ltiming_adjust: 1;
> +	unsigned char apdma_sync: 1;
>   };
>   
>   struct mtk_i2c_ac_timing {
> @@ -311,6 +315,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 1,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt6577_compat = {
> @@ -324,6 +329,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt6589_compat = {
> @@ -337,6 +343,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt7622_compat = {
> @@ -350,6 +357,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt8173_compat = {
> @@ -362,6 +370,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct mtk_i2c_compatible mt8183_compat = {
> @@ -375,6 +384,7 @@ struct i2c_spec_values {
>   	.timing_adjust = 1,
>   	.dma_sync = 1,
>   	.ltiming_adjust = 1,
> +	.apdma_sync = 0,
>   };
>   
>   static const struct of_device_id mtk_i2c_of_match[] = {
> @@ -798,6 +808,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   	u16 start_reg;
>   	u16 control_reg;
>   	u16 restart_flag = 0;
> +	u16 dma_sync = 0;
>   	u32 reg_4g_mode;
>   	u8 *dma_rd_buf = NULL;
>   	u8 *dma_wr_buf = NULL;
> @@ -851,10 +862,16 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
>   	}
>   
> +	if (i2c->dev_comp->apdma_sync) {
> +		dma_sync = I2C_DMA_SKIP_CONFIG | I2C_DMA_ASYNC_MODE;
> +		if (i2c->op == I2C_MASTER_WRRD)
> +			dma_sync |= I2C_DMA_DIR_CHANGE;
> +	}
> +
>   	/* Prepare buffer data to start transfer */
>   	if (i2c->op == I2C_MASTER_RD) {
>   		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
> -		writel(I2C_DMA_CON_RX, i2c->pdmabase + OFFSET_CON);
> +		writel(I2C_DMA_CON_RX | dma_sync, i2c->pdmabase + OFFSET_CON);
>   
>   		dma_rd_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
>   		if (!dma_rd_buf)
> @@ -877,7 +894,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   		writel(msgs->len, i2c->pdmabase + OFFSET_RX_LEN);
>   	} else if (i2c->op == I2C_MASTER_WR) {
>   		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
> -		writel(I2C_DMA_CON_TX, i2c->pdmabase + OFFSET_CON);
> +		writel(I2C_DMA_CON_TX | dma_sync, i2c->pdmabase + OFFSET_CON);
>   
>   		dma_wr_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
>   		if (!dma_wr_buf)
> @@ -900,7 +917,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
>   	} else {
>   		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_INT_FLAG);
> -		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_CON);
> +		writel(I2C_DMA_CLR_FLAG | dma_sync, i2c->pdmabase + OFFSET_CON);
>   
>   		dma_wr_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
>   		if (!dma_wr_buf)
> 
