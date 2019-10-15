Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AADBED7663
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 14:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfJOMV6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 08:21:58 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:31054 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727383AbfJOMV6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Oct 2019 08:21:58 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9FCFmPp020760;
        Tue, 15 Oct 2019 14:21:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=wOAgDQIJnROZAAJDyr+SKVedGsOlBqMHloQwYXC54zg=;
 b=hbMN9KfBnbPvy/ENhoWH7nIonEnhqLmUYAPxlpPks/UlEic8jbAl5cVYd+aZuBuLdM4C
 b7ftUgxaN4UbOgBhRBm03r0EE0AHUMkNeBlifUJpSmOHdpfEMzfAXgA2SATjcp9NSXD9
 ExbS9cAXItEO2DkPj9uxOQdlTUkPp5CwtXaKJd6/zvzfXi4ibNVZGw+EivPSH0+xLEDb
 buSqd+kwRC60njyxokkAektWw1bBHYialOyfZVKw7AszIhE6EftQmmwSWKq/fNm8klye
 FV9rVspCXZOTv02SySdFxGFY91bYhgrGeBH4NVPx/dbgLriZ8IMzXGTeYwTSq9FYn60Y 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vk4kx0375-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Oct 2019 14:21:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C251100034;
        Tue, 15 Oct 2019 14:21:50 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E2952C7E81;
        Tue, 15 Oct 2019 14:21:50 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 14:21:50 +0200
Received: from [10.48.0.192] (10.48.0.192) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 14:21:50
 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix a race in slave mode with
 arbitration loss irq
To:     <wsa@the-dreams.de>
CC:     <pierre-yves.mordret@st.com>, <alain.volmat@st.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <e53f9766-632d-0417-7a6e-7cf3e08f471e@st.com>
Date:   Tue, 15 Oct 2019 14:21:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_05:2019-10-15,2019-10-15 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/1/19 10:51 AM, Fabrice Gasnier wrote:
> When in slave mode, an arbitration loss (ARLO) may be detected before the
> slave had a chance to detect the stop condition (STOPF in ISR).
> This is seen when two master + slave adapters switch their roles. It
> provokes the i2c bus to be stuck, busy as SCL line is stretched.
> - the I2C_SLAVE_STOP event is never generated due to STOPF flag is set but
>   don't generate an irq (race with ARLO irq, STOPIE is masked). STOPF flag
>   remains set until next master xfer (e.g. when STOPIE irq get unmasked).
>   In this case, completion is generated too early: immediately upon new
>   transfer request (then it doesn't send all data).
> - Some data get stuck in TXDR register. As a consequence, the controller
>   stretches the SCL line: the bus gets busy until a future master transfer
>   triggers the bus busy / recovery mechanism (this can take time... and
>   may never happen at all)
> 
> So choice is to let the STOPF being detected by the slave isr handler,
> to properly handle this stop condition. E.g. don't mask IRQs in error
> handler, when the slave is running.
> 
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---


Hi Wolfram, all,

Gentle reminder on this patch.

Thanks in advance !
Best Regards,
Fabrice

>  drivers/i2c/busses/i2c-stm32f7.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 266d1c2..3a8ab0c 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1501,7 +1501,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  	void __iomem *base = i2c_dev->base;
>  	struct device *dev = i2c_dev->dev;
>  	struct stm32_i2c_dma *dma = i2c_dev->dma;
> -	u32 mask, status;
> +	u32 status;
>  
>  	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
>  
> @@ -1526,12 +1526,15 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  		f7_msg->result = -EINVAL;
>  	}
>  
> -	/* Disable interrupts */
> -	if (stm32f7_i2c_is_slave_registered(i2c_dev))
> -		mask = STM32F7_I2C_XFER_IRQ_MASK;
> -	else
> -		mask = STM32F7_I2C_ALL_IRQ_MASK;
> -	stm32f7_i2c_disable_irq(i2c_dev, mask);
> +	if (!i2c_dev->slave_running) {
> +		u32 mask;
> +		/* Disable interrupts */
> +		if (stm32f7_i2c_is_slave_registered(i2c_dev))
> +			mask = STM32F7_I2C_XFER_IRQ_MASK;
> +		else
> +			mask = STM32F7_I2C_ALL_IRQ_MASK;
> +		stm32f7_i2c_disable_irq(i2c_dev, mask);
> +	}
>  
>  	/* Disable dma */
>  	if (i2c_dev->use_dma) {
> 
