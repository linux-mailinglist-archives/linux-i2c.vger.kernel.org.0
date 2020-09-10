Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B0D26456C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 13:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgIJLnI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 07:43:08 -0400
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:44348
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727782AbgIJLlp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 07:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599738051;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=T0GnyR56yQMgQm8APNyslckH3jPvYmhD34jMrhUIPBE=;
        b=iCvis9VOMyLcfT+xHRzI8iE309fyhxa0ZprEr/cLzR5PE1uhEA8GKRJDf94x1Vfg
        H51AVN4F45V/7i5AsLsCHanMUADDiFLQKuDUMT1zdPeqVRs5DKhnEx/z7tNwwX1Vd5V
        OeB1hqGSmhSMwO5ayZa/UtixxNx3M5spABnZF4mU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599738051;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=T0GnyR56yQMgQm8APNyslckH3jPvYmhD34jMrhUIPBE=;
        b=UbXRuiRbtJskO7LByqU+zvXj68B9RFcPA2IWFNW6ud0yIcoLlkPzRu73E+KVNt0I
        cU9OULAmgyCCYdS2g7BVSHgYMVtGnvqcMcrtv/ijC3dxP8qZbVzF5qD7is03/L2PPCE
        r2Q365wyQ7XJmTzUQ60H74HujP/qtQx2KkZYaP7U=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E85FDC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] i2c: busses: replace spin_lock_irqsave by spin_lock in
 hard IRQ
To:     Barry Song <song.bao.hua@hisilicon.com>, linux-i2c@vger.kernel.org,
        wsa@kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linuxarm@huawei.com, Gregory CLEMENT <gregory.clement@bootlin.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200909041001.5612-1-song.bao.hua@hisilicon.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <0101017477d17bf2-a695da5a-b77b-4469-8916-b1bb6f92dbf2-000000@us-west-2.amazonses.com>
Date:   Thu, 10 Sep 2020 11:40:51 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909041001.5612-1-song.bao.hua@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.10-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/9/2020 9:40 AM, Barry Song wrote:
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
>
> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: Mukesh Savaliya <msavaliy@codeaurora.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>   drivers/i2c/busses/i2c-mv64xxx.c   | 5 ++---
>   drivers/i2c/busses/i2c-owl.c       | 5 ++---
>   drivers/i2c/busses/i2c-qcom-geni.c | 5 ++---
>   3 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index 8d9d4ffdcd24..e0e45fc19b8f 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -496,11 +496,10 @@ static irqreturn_t
>   mv64xxx_i2c_intr(int irq, void *dev_id)
>   {
>   	struct mv64xxx_i2c_data	*drv_data = dev_id;
> -	unsigned long	flags;
>   	u32		status;
>   	irqreturn_t	rc = IRQ_NONE;
>   
> -	spin_lock_irqsave(&drv_data->lock, flags);
> +	spin_lock(&drv_data->lock);
>   
>   	if (drv_data->offload_enabled)
>   		rc = mv64xxx_i2c_intr_offload(drv_data);
> @@ -517,7 +516,7 @@ mv64xxx_i2c_intr(int irq, void *dev_id)
>   
>   		rc = IRQ_HANDLED;
>   	}
> -	spin_unlock_irqrestore(&drv_data->lock, flags);
> +	spin_unlock(&drv_data->lock);
>   
>   	return rc;
>   }
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 672f1f239bd6..618d3013d0b6 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -165,10 +165,9 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>   {
>   	struct owl_i2c_dev *i2c_dev = _dev;
>   	struct i2c_msg *msg = i2c_dev->msg;
> -	unsigned long flags;
>   	unsigned int stat, fifostat;
>   
> -	spin_lock_irqsave(&i2c_dev->lock, flags);
> +	spin_lock(&i2c_dev->lock);
>   
>   	i2c_dev->err = 0;
>   
> @@ -208,7 +207,7 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>   			   OWL_I2C_STAT_IRQP, true);
>   
>   	complete_all(&i2c_dev->msg_complete);
> -	spin_unlock_irqrestore(&i2c_dev->lock, flags);
> +	spin_unlock(&i2c_dev->lock);
>   
>   	return IRQ_HANDLED;
>   }
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dead5db3315a..8b4c35f47a70 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -210,9 +210,8 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>   	u32 dma;
>   	u32 val;
>   	struct i2c_msg *cur;
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&gi2c->lock, flags);
> +	spin_lock(&gi2c->lock);
>   	m_stat = readl_relaxed(base + SE_GENI_M_IRQ_STATUS);
>   	rx_st = readl_relaxed(base + SE_GENI_RX_FIFO_STATUS);
>   	dm_tx_st = readl_relaxed(base + SE_DMA_TX_IRQ_STAT);
> @@ -294,7 +293,7 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>   	    dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE)
>   		complete(&gi2c->done);
>   
> -	spin_unlock_irqrestore(&gi2c->lock, flags);
> +	spin_unlock(&gi2c->lock);
>   
>   	return IRQ_HANDLED;
>   }

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

