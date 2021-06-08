Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F40E39F861
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 16:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhFHOEQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 10:04:16 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:41761 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbhFHOEI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 10:04:08 -0400
Received: by mail-wm1-f41.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so1973260wmq.0;
        Tue, 08 Jun 2021 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E+9j4IJorqJShjQfs9LsrArykPixg4gTHiIgJ6SNPxU=;
        b=tjSJOuiRQOaK418AxcbqOaKiZnav3BRxujrVXistY+iRayGWPWOKEK7QQKX8t0fZHX
         BZTXjwoim0DyHSN1QAW09f4CuVC5VgId2S+nT+0qI33xK/FfWhS8MmFoq/ajXFDeHPTO
         AFMnsIiYBpY8LBPI/Ex57eWTuhlKRhLWbvZXTgpnDf18qOwZ5dEu6bbteoffkkvpo9dM
         1rYWsCMFfLWp8HpuUB9/Yp2LQjpYhO50KKGNLKIgFOukiLG8JYIKG7OJBuxFlQdCsHrH
         a3GYDuJyFnGM9/tJCaY+xNBFLaTZKS3a0G2ywl9iXqLUPia7MIdIHO/6v0u1TDfrRXUz
         7cUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E+9j4IJorqJShjQfs9LsrArykPixg4gTHiIgJ6SNPxU=;
        b=RyiQvotXR/JLTW2Vg8Y9srLZSw5eHmfj23cuiZCYCUvEoSJLQNH2CaSD0WpE1fEc0m
         IrDqoD9SqnAa7bzW389ZT3ngOKAwO4V6yYF5v6tPbkc6KuSGY2jKIbQ3a5bJmYxYtKTZ
         Pwnm0UcAql/l2BMLlGuF9Z6gy5W4jW8Rs53znmIsgA0G+jFgyaZdLmdIuuJloJSdqFt6
         eyqiBETiO5et9keS8SeqaQ1fmF2saPsvuxpuar2cUiuDCNbhpH46dZMUqPc7QM3ABWm1
         t7OtGzdHKRRQZRby56crxzkhEi3JwvHQZH/zB/FvYk7g1fIbuUgdNlNnvaXvyeunT0dF
         YSrA==
X-Gm-Message-State: AOAM5326VZVU5GOq4gKdJxU802fce3GJzzMB7WVfNmHgFsMc000+wkrG
        pXJycPBg/UJlMn261c2T0rc=
X-Google-Smtp-Source: ABdhPJw+FtTbLb9zuZT/GZBtbqdUosLyGkCaukigrg4ejpy+HqV456zcPr07NLm5VZNriq1h6GCgOg==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr22061133wml.52.1623160862718;
        Tue, 08 Jun 2021 07:01:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id g17sm15224005wrp.61.2021.06.08.07.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:01:02 -0700 (PDT)
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, qiangming.xia@mediatek.com
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
Date:   Tue, 8 Jun 2021 16:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 08/06/2021 05:16, Kewei Xu wrote:
> From: "Kewei.Xu" <kewei.xu@mediatek.com>
> 
> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
> 
> Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 97 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e..e65a41e 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
>  	OFFSET_HS,
>  	OFFSET_SOFTRESET,
>  	OFFSET_DCM_EN,
> +	OFFSET_MULTI_DMA,
>  	OFFSET_PATH_DIR,
>  	OFFSET_DEBUGSTAT,
>  	OFFSET_DEBUGCTRL,
> @@ -192,8 +193,9 @@ enum I2C_REGS_OFFSET {
>  	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
>  	[OFFSET_CLOCK_DIV] = 0x48,
>  	[OFFSET_SOFTRESET] = 0x50,
> +	[OFFSET_MULTI_DMA] = 0x84,
>  	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
> -	[OFFSET_DEBUGSTAT] = 0xe0,
> +	[OFFSET_DEBUGSTAT] = 0xe4,

Is this offset only for mt8192 or also for mt8183?
In any case that should go in as another patch. Either a fix or a new
mt_i2c_regs_v3[]

Regards,
Matthias

>  	[OFFSET_DEBUGCTRL] = 0xe8,
>  	[OFFSET_FIFO_STAT] = 0xf4,
>  	[OFFSET_FIFO_THRESH] = 0xf8,
> @@ -828,6 +830,96 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>  	return 0;
>  }
>  
> +static void i2c_dump_register(struct mtk_i2c *i2c)
> +{
> +	dev_err(i2c->dev, "SLAVE_ADDR[0x%x]: 0x%x, INTR_MASK[0x%x]: 0x%x\n",
> +		OFFSET_SLAVE_ADDR,
> +		(mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR)),
> +		OFFSET_INTR_MASK,
> +		(mtk_i2c_readw(i2c, OFFSET_INTR_MASK)));
> +	dev_err(i2c->dev, "INTR_STAT[0x%x]: 0x%x, CONTROL[0x%x]: 0x%x\n",
> +		OFFSET_INTR_STAT,
> +		(mtk_i2c_readw(i2c, OFFSET_INTR_STAT)),
> +		OFFSET_CONTROL,
> +		(mtk_i2c_readw(i2c, OFFSET_CONTROL)));
> +	dev_err(i2c->dev, "TRANSFER_LEN[0x%x]: 0x%x, TRANSAC_LEN[0x%x]: 0x%x\n",
> +		OFFSET_TRANSFER_LEN,
> +		(mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN)),
> +		OFFSET_TRANSAC_LEN,
> +		(mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN)));
> +	dev_err(i2c->dev, "DELAY_LEN[0x%x]: 0x%x, HTIMING[0x%x]: 0x%x\n",
> +		OFFSET_DELAY_LEN,
> +		(mtk_i2c_readw(i2c, OFFSET_DELAY_LEN)),
> +		OFFSET_TIMING,
> +		(mtk_i2c_readw(i2c, OFFSET_TIMING)));
> +	dev_err(i2c->dev, "OFFSET_START[0x%x]: 0x%x\n",
> +		OFFSET_START,
> +		mtk_i2c_readw(i2c, OFFSET_START));
> +	dev_err(i2c->dev, "OFFSET_EXT_CONF[0x%x]: 0x%x\n",
> +		OFFSET_EXT_CONF,
> +		mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
> +	dev_err(i2c->dev, "OFFSET_HS[0x%x]: 0x%x\n",
> +		OFFSET_HS,
> +		mtk_i2c_readw(i2c, OFFSET_HS));
> +	dev_err(i2c->dev, "OFFSET_IO_CONFIG[0x%x]: 0x%x\n",
> +		OFFSET_IO_CONFIG,
> +		mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
> +	dev_err(i2c->dev, "OFFSET_FIFO_ADDR_CLR[0x%x]: 0x%x\n",
> +		OFFSET_FIFO_ADDR_CLR,
> +		mtk_i2c_readw(i2c, OFFSET_FIFO_ADDR_CLR));
> +	dev_err(i2c->dev, "TRANSFER_LEN_AUX[0x%x]: 0x%x\n",
> +		OFFSET_TRANSFER_LEN_AUX,
> +		mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
> +	dev_err(i2c->dev, "CLOCK_DIV[0x%x]: 0x%x\n",
> +		OFFSET_CLOCK_DIV,
> +		mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV));
> +	dev_err(i2c->dev, "FIFO_STAT[0x%x]: 0x%x, FIFO_THRESH[0x%x]: 0x%x\n",
> +		OFFSET_FIFO_STAT,
> +		mtk_i2c_readw(i2c, OFFSET_FIFO_STAT),
> +		OFFSET_FIFO_THRESH,
> +		mtk_i2c_readw(i2c, OFFSET_FIFO_THRESH));
> +	dev_err(i2c->dev, "DCM_EN[0x%x] 0x%x\n",
> +		OFFSET_DCM_EN,
> +		mtk_i2c_readw(i2c, OFFSET_DCM_EN));
> +	dev_err(i2c->dev, "DEBUGSTAT[0x%x]: 0x%x, DEBUGCTRL[0x%x]: 0x%x\n",
> +		OFFSET_DEBUGSTAT,
> +		(mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT)),
> +		OFFSET_DEBUGCTRL,
> +		(mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL)));
> +
> +	if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
> +		dev_err(i2c->dev, "OFFSET_LTIMING[0x%x]: 0x%x\n",
> +			OFFSET_LTIMING,
> +			mtk_i2c_readw(i2c, OFFSET_LTIMING));
> +		dev_err(i2c->dev, "MULTI_DMA[0x%x]: 0x%x\n",
> +			OFFSET_MULTI_DMA,
> +			(mtk_i2c_readw(i2c, OFFSET_MULTI_DMA)));
> +	}
> +
> +	dev_err(i2c->dev, "OFFSET_INT_FLAG = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_INT_FLAG));
> +	dev_err(i2c->dev, "OFFSET_INT_EN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_INT_EN));
> +	dev_err(i2c->dev, "OFFSET_EN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_EN));
> +	dev_err(i2c->dev, "OFFSET_RST = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RST));
> +	dev_err(i2c->dev, "OFFSET_CON = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_CON));
> +	dev_err(i2c->dev, "OFFSET_TX_MEM_ADDR = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR));
> +	dev_err(i2c->dev, "OFFSET_RX_MEM_ADDR = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
> +	dev_err(i2c->dev, "OFFSET_TX_LEN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_TX_LEN));
> +	dev_err(i2c->dev, "OFFSET_RX_LEN = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RX_LEN));
> +	dev_err(i2c->dev, "OFFSET_TX_4G_MODE = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_TX_4G_MODE));
> +	dev_err(i2c->dev, "OFFSET_RX_4G_MODE = 0x%x\n",
> +		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
> +}
> +
>  static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  			       int num, int left_num)
>  {
> @@ -1034,7 +1126,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  	}
>  
>  	if (ret == 0) {
> -		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		i2c_dump_register(i2c);
>  		mtk_i2c_init_hw(i2c);
>  		return -ETIMEDOUT;
>  	}
> 
