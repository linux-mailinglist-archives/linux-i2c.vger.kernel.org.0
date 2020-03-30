Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93951976C8
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 10:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729694AbgC3IlN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 04:41:13 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:4998 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729398AbgC3IlN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Mar 2020 04:41:13 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02U8bjN7025218;
        Mon, 30 Mar 2020 10:41:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=2zJH41YQKvQIOnb4qX0JkkMFfwGeAK8KHzh+mK7/f0U=;
 b=HMuaE34HokD0cr+FPEqvwDu8BBhtwbDRYaBYcLO5T9g9jIAk+OHAX2m52L47n5QEC7TY
 QgVg3IkfDlBvK6I2/feLWrmkJhwYrVxZ5nsdqHdORZFCFYEvqeV2ghPrcpLx/6Cph6Ym
 I4/nOQZsofSmp20oPUiFA3VOOW8JEj/lcG6huI+CAB0x3VtZU8SQgrr+Brm8EnUmmvlB
 sphMqQmuIUunO1+z2ihArln8k+7PavLjZqKQtuYBUsWWmsLyCDhAb7MFXYGgWvXdB7fV
 UNc4NW2MB1c5UhxreFsbYnAnAaoYQtx68XjqkMk4KLjbF+jmBJ8HEE8nXp5JMx0JnXYr Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 301w80rfr2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Mar 2020 10:41:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F315210002A;
        Mon, 30 Mar 2020 10:41:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BAEB02A5528;
        Mon, 30 Mar 2020 10:41:01 +0200 (CEST)
Received: from [10.131.224.211] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Mar
 2020 10:41:00 +0200
Subject: Re: [PATCH] i2c: stm32: don't print an error on probe deferral
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <9f51c667-cb26-a087-b2a3-2cf2ddf09a87@st.com>
Date:   Mon, 30 Mar 2020 10:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-30_01:2020-03-27,2020-03-30 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello !

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 3/19/20 7:22 PM, Alain Volmat wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for some resource.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32.c   | 10 +++++++---
>  drivers/i2c/busses/i2c-stm32f4.c |  4 +++-
>  drivers/i2c/busses/i2c-stm32f7.c |  7 +++++--
>  3 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 1da347e6a358..7be559858402 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -25,8 +25,9 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	/* Request and configure I2C TX dma channel */
>  	dma->chan_tx = dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
> -		dev_dbg(dev, "can't request DMA tx channel\n");
>  		ret = PTR_ERR(dma->chan_tx);
> +		if (ret != -EPROBE_DEFER)
> +			dev_dbg(dev, "can't request DMA tx channel\n");
>  		goto fail_al;
>  	}
>  
> @@ -44,8 +45,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	/* Request and configure I2C RX dma channel */
>  	dma->chan_rx = dma_request_chan(dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
> -		dev_err(dev, "can't request DMA rx channel\n");
>  		ret = PTR_ERR(dma->chan_rx);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "can't request DMA rx channel\n");
> +
>  		goto fail_tx;
>  	}
>  
> @@ -73,7 +76,8 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
>  	dma_release_channel(dma->chan_tx);
>  fail_al:
>  	devm_kfree(dev, dma);
> -	dev_info(dev, "can't use DMA\n");
> +	if (ret != -EPROBE_DEFER)
> +		dev_info(dev, "can't use DMA\n");
>  
>  	return ERR_PTR(ret);
>  }
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index ba600d77a3f8..1b8cad506ad7 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -797,8 +797,10 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  
>  	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(rst)) {
> -		dev_err(&pdev->dev, "Error: Missing controller reset\n");
>  		ret = PTR_ERR(rst);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
> +
>  		goto clk_free;
>  	}
>  	reset_control_assert(rst);
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 78d40a4cc282..ab95ed52a7dc 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1915,7 +1915,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  
>  	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_dev->clk)) {
> -		dev_err(&pdev->dev, "Error: Missing controller clock\n");
> +		if (PTR_ERR(i2c_dev->clk) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to get controller clock\n");
>  		return PTR_ERR(i2c_dev->clk);
>  	}
>  
> @@ -1941,8 +1942,10 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  
>  	rst = devm_reset_control_get(&pdev->dev, NULL);
>  	if (IS_ERR(rst)) {
> -		dev_err(&pdev->dev, "Error: Missing controller reset\n");
>  		ret = PTR_ERR(rst);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
> +
>  		goto clk_free;
>  	}
>  	reset_control_assert(rst);
> 
