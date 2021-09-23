Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE63C415A1C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 10:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239965AbhIWIhc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 04:37:32 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46458 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239963AbhIWIhc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 04:37:32 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N8LlPQ018755;
        Thu, 23 Sep 2021 10:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=L5H5CURqiC+E8MrIIzttcWBAvlrXfytbBrr7u7fLG7Q=;
 b=ofvK/fJbMbdi4tBStttl2e72kQDWXN6G+JoT+RFgnGcX80lVjft7SjPV2iROp92iMmdk
 +2zDigfWXFxnOze3TSX5IuBjpS+GlQZxlHSQlQYBYBfKIPQ2rsrO45thwBr2WQZRA0UF
 HM0H4j8MmfQto7ALT32fC6VrwBHPgkqvTDd9YMWgTzyUo5U6VzTbsJ77O+Aa7IvzuWfy
 dcCFD2/D8LXuAdgMvV1Pf8tnS60b44zKyHNJKe1q7qSSXlXyR0U3AbIPTExzYpcsWZ6W
 QZjLwURzuVnY6Pgf96L6ZXh85G9LYg1t6ArG0UuzAXx5tNhNnR5wvhNl1MAi4a1e8Wgp xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3b8gdra15s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Sep 2021 10:35:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37F4210002A;
        Thu, 23 Sep 2021 10:35:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27D822248B4;
        Thu, 23 Sep 2021 10:35:48 +0200 (CEST)
Received: from lmecxl1060.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Sep
 2021 10:35:39 +0200
Subject: Re: [PATCH 1/4] i2c: stm32f7: flush TX FIFO upon transfer errors
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-2-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <9f61c512-559c-146b-9fab-801172cbafaa@foss.st.com>
Date:   Thu, 23 Sep 2021 10:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-2-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_02,2021-09-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 9/20/21 5:21 PM, Alain Volmat wrote:
> While handling an error during transfer (ex: NACK), it could
> happen that the driver has already written data into TXDR
> before the transfer get stopped.
> This commit add TXDR Flush after end of transfer in case of error to
> avoid sending a wrong data on any other slave upon next transfer.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index b9b19a2a2ffa..ed977b6f7ab6 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1696,6 +1696,16 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  	time_left = wait_for_completion_timeout(&i2c_dev->complete,
>  						i2c_dev->adap.timeout);
>  	ret = f7_msg->result;
> +	if (ret) {
> +		/*
> +		 * It is possible that some unsent data have already been
> +		 * written into TXDR. To avoid sending old data in a
> +		 * further transfer, flush TXDR in case of any error
> +		 */
> +		writel_relaxed(STM32F7_I2C_ISR_TXE,
> +			       i2c_dev->base + STM32F7_I2C_ISR);
> +		goto pm_free;
> +	}
>  
>  	if (!time_left) {
>  		dev_dbg(i2c_dev->dev, "Access to slave 0x%x timed out\n",
> @@ -1744,8 +1754,16 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  	timeout = wait_for_completion_timeout(&i2c_dev->complete,
>  					      i2c_dev->adap.timeout);
>  	ret = f7_msg->result;
> -	if (ret)
> +	if (ret) {
> +		/*
> +		 * It is possible that some unsent data have already been
> +		 * written into TXDR. To avoid sending old data in a
> +		 * further transfer, flush TXDR in case of any error
> +		 */
> +		writel_relaxed(STM32F7_I2C_ISR_TXE,
> +			       i2c_dev->base + STM32F7_I2C_ISR);
>  		goto pm_free;
> +	}
>  
>  	if (!timeout) {
>  		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
> 

-- 
--
~ Py MORDRET
--
