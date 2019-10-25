Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25609E4EA5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2019 16:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406101AbfJYOMk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Oct 2019 10:12:40 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:12404 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405765AbfJYOMk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Oct 2019 10:12:40 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9PE5ub0022030;
        Fri, 25 Oct 2019 16:12:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xxw6sfSBb2ziAGzEHx/zRRrJwSGgjzjjHssHA3fCJJQ=;
 b=RLIcONLNhTxfGnumeDhL8EbUmMIKOhVIPwY7JvR89xewpCIDHP6zdOLiNn80Liq4rUNU
 gKZa9r4+tEKdoefOgXXNWhSy6CjVgvSit/IYvVzR5kZLKCHlNvixlxlgDwo8L07INtaF
 ZfZUfV5MK7eL6YHLlJY7oxd22gR205i5QcXKactpPnPrCtPoOX3YdnRPej4Pys7Vb/nT
 qcFNtbG2wfJoU0IdlUmzGhkr7U7vEcOgxkrHM3rGfPkP8Gz2y18zSAawK1zQ0p4YtgWk
 yT4vXtIaC7fgdKYpu+pCvOe2UEvWUAaW0MfZ2yhgkK5rqza82wX0XhM9TMLbpzWIoyza iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vt9s4g6x5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Oct 2019 16:12:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3847D100034;
        Fri, 25 Oct 2019 16:12:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A9982AB34A;
        Fri, 25 Oct 2019 16:12:33 +0200 (CEST)
Received: from [10.129.5.11] (10.75.127.45) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 16:12:25 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: report dma error during probe
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1571921521-8502-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <fbb063f9-8f16-00ba-1a5b-deb58c711e26@st.com>
Date:   Fri, 25 Oct 2019 16:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571921521-8502-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_08:2019-10-25,2019-10-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Looks good for me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Regards

On 10/24/19 2:52 PM, Alain Volmat wrote:
> Distinguish between the case where dma information is not provided
> within the DT and the case of an error during the dma init.
> Exit the probe with error in case of an error during dma init.
> 
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32.c   | 16 ++++++++--------
>  drivers/i2c/busses/i2c-stm32f7.c |  9 +++++++++
>  2 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 07d5dfce68d4..1da347e6a358 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -20,13 +20,13 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  
>  	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>  	if (!dma)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	/* Request and configure I2C TX dma channel */
> -	dma->chan_tx = dma_request_slave_channel(dev, "tx");
> -	if (!dma->chan_tx) {
> +	dma->chan_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(dma->chan_tx)) {
>  		dev_dbg(dev, "can't request DMA tx channel\n");
> -		ret = -EINVAL;
> +		ret = PTR_ERR(dma->chan_tx);
>  		goto fail_al;
>  	}
>  
> @@ -42,10 +42,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	}
>  
>  	/* Request and configure I2C RX dma channel */
> -	dma->chan_rx = dma_request_slave_channel(dev, "rx");
> -	if (!dma->chan_rx) {
> +	dma->chan_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(dma->chan_rx)) {
>  		dev_err(dev, "can't request DMA rx channel\n");
> -		ret = -EINVAL;
> +		ret = PTR_ERR(dma->chan_rx);
>  		goto fail_tx;
>  	}
>  
> @@ -75,7 +75,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	devm_kfree(dev, dma);
>  	dev_info(dev, "can't use DMA\n");
>  
> -	return NULL;
> +	return ERR_PTR(ret);
>  }
>  
>  void stm32_i2c_dma_free(struct stm32_i2c_dma *dma)
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index d36cf08461f7..cc8ba8f49ae6 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1950,6 +1950,15 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	i2c_dev->dma = stm32_i2c_dma_request(i2c_dev->dev, phy_addr,
>  					     STM32F7_I2C_TXDR,
>  					     STM32F7_I2C_RXDR);
> +	if (PTR_ERR(i2c_dev->dma) == -ENODEV)
> +		i2c_dev->dma = NULL;
> +	else if (IS_ERR(i2c_dev->dma)) {
> +		ret = PTR_ERR(i2c_dev->dma);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"Failed to request dma error %i\n", ret);
> +		goto clk_free;
> +	}
>  
>  	platform_set_drvdata(pdev, i2c_dev);
>  
> 
