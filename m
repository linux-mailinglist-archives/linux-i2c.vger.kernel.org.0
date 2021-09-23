Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B082D415A22
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 10:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239861AbhIWIj1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 04:39:27 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:37130 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239825AbhIWIj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 04:39:27 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N730CH022195;
        Thu, 23 Sep 2021 10:37:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TLQuNxzXQJo8WyYaZHT4cvzN8bWtsCyHzawgU+TB/6o=;
 b=l2+YDvp7PCb+Rgpxwq3IWE/mY2fYCxZdGjslyFiWJcc6282uiagBydPtHWKRAJtvQ7FZ
 ObYS7BmWaHPpkVVblxhhe3ogQxlsyAb2xWyspYWpWzI/ECnJMcD5N68DvmIyCiHCLHSQ
 Fq2E9naQuJjZfZeWrFLCCNSzpb9DF5PMLN50Nck8aNQ0EOm0rbZbTa8uEW0qw6Kqll5s
 LyCt9MeoRY3JpE0Bh012oesPpQ8mpUUWi9h7XFCistKbyCNWUFSXKEUGyvgfToYkWKGQ
 WCrs1ZGCQEhNquR5iIqCN4WwmQkoHPc4plxZs8sMA7JGtlb0H0v1bU3Unon2zz0mzJf4 Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3b8mur8p97-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Sep 2021 10:37:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7293810002A;
        Thu, 23 Sep 2021 10:37:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 697022248BE;
        Thu, 23 Sep 2021 10:37:47 +0200 (CEST)
Received: from lmecxl1060.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Sep
 2021 10:37:46 +0200
Subject: Re: [PATCH 3/4] i2c: stm32f7: stop dma transfer in case of NACK
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <e1e58f07-144e-e1fa-79a0-f3396be15305@foss.st.com>
Date:   Thu, 23 Sep 2021 10:37:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_02,2021-09-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

Look good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 9/20/21 5:21 PM, Alain Volmat wrote:
> In case of receiving a NACK, the dma transfer should be stopped
> to avoid feeding data into the FIFO.
> Also ensure to properly return the proper error code and avoid
> waiting for the end of the dma completion in case of
> error happening during the transmission.
> 
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index ad3459a3bc5e..50d5ae81d227 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1493,6 +1493,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = data;
>  	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
> +	struct stm32_i2c_dma *dma = i2c_dev->dma;
>  	void __iomem *base = i2c_dev->base;
>  	u32 status, mask;
>  	int ret = IRQ_HANDLED;
> @@ -1518,6 +1519,10 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
>  		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
>  			__func__, f7_msg->addr);
>  		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
> +		if (i2c_dev->use_dma) {
> +			stm32f7_i2c_disable_dma_req(i2c_dev);
> +			dmaengine_terminate_all(dma->chan_using);
> +		}
>  		f7_msg->result = -ENXIO;
>  	}
>  
> @@ -1533,7 +1538,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
>  		/* Clear STOP flag */
>  		writel_relaxed(STM32F7_I2C_ICR_STOPCF, base + STM32F7_I2C_ICR);
>  
> -		if (i2c_dev->use_dma) {
> +		if (i2c_dev->use_dma && !f7_msg->result) {
>  			ret = IRQ_WAKE_THREAD;
>  		} else {
>  			i2c_dev->master_mode = false;
> @@ -1546,7 +1551,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
>  		if (f7_msg->stop) {
>  			mask = STM32F7_I2C_CR2_STOP;
>  			stm32f7_i2c_set_bits(base + STM32F7_I2C_CR2, mask);
> -		} else if (i2c_dev->use_dma) {
> +		} else if (i2c_dev->use_dma && !f7_msg->result) {
>  			ret = IRQ_WAKE_THREAD;
>  		} else if (f7_msg->smbus) {
>  			stm32f7_i2c_smbus_rep_start(i2c_dev);
> 

-- 
--
~ Py MORDRET
--
