Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9CEE4E9C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2019 16:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395332AbfJYOLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Oct 2019 10:11:25 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23896 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2395334AbfJYOLZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Oct 2019 10:11:25 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9PE5wO4019861;
        Fri, 25 Oct 2019 16:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=j3crM7cBC/H2jOyoLqRWhR7cZrRuUQNXRsMuv0OdZuQ=;
 b=KY5ut593Qal9uBKcKy/ZEQWmOXE+fNIcYMyCbxWKE062MHN9ayQ6YrkCLT7IioLaK4AP
 NKzJXL9ZpohHBt0oCDLn0zbcn7fmotN7ZOBdkBV+BIcoyM9/iiCVXN3jG8b1zTMNgp/O
 pcS16hpQbYSZMDUbUWINzGzB8EAaMUAO41H00ReqpnjfbJtBkzf6EDF+PCz2VypaP4l0
 lCPR4BMJK4ozmT1bBA45HLWX3MC1Q6j+Gg7X4TYANGwyZn83ZvUs6vTVS2cZUHedMJhV
 ZRUT9R6B4vf8/vKnokRcCntfD8nWv5sewLh7I5j2sT96BlJsaLsE59h2ZY2aqhvokl5w Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2vt9s5856g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Oct 2019 16:11:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DA62100034;
        Fri, 25 Oct 2019 16:11:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E8E52AB34D;
        Fri, 25 Oct 2019 16:11:13 +0200 (CEST)
Received: from [10.129.5.11] (10.75.127.46) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 16:11:12 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix & reorder remove & probe error
 handling
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <37fc56c5-a700-a05b-2669-25295172dbdc@st.com>
Date:   Fri, 25 Oct 2019 16:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_08:2019-10-25,2019-10-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Look good for me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 10/25/19 4:04 PM, Alain Volmat wrote:
> Add missing dma channels free calls in case of error during probe
> and reorder the remove function so that dma channels are freed after
> the i2c adapter is deleted.
> Overall, reorder the remove function so that probe error handling order
> and remove function order are same.
> 
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index d36cf08461f7..f8ef203dabfc 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1980,6 +1980,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(i2c_dev->dev);
>  	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
>  
> +	if (i2c_dev->dma) {
> +		stm32_i2c_dma_free(i2c_dev->dma);
> +		i2c_dev->dma = NULL;
> +	}
> +
>  clk_free:
>  	clk_disable_unprepare(i2c_dev->clk);
>  
> @@ -1990,21 +1995,21 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
> -	if (i2c_dev->dma) {
> -		stm32_i2c_dma_free(i2c_dev->dma);
> -		i2c_dev->dma = NULL;
> -	}
> -
>  	i2c_del_adapter(&i2c_dev->adap);
>  	pm_runtime_get_sync(i2c_dev->dev);
>  
> -	clk_disable_unprepare(i2c_dev->clk);
> -
>  	pm_runtime_put_noidle(i2c_dev->dev);
>  	pm_runtime_disable(i2c_dev->dev);
>  	pm_runtime_set_suspended(i2c_dev->dev);
>  	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
>  
> +	if (i2c_dev->dma) {
> +		stm32_i2c_dma_free(i2c_dev->dma);
> +		i2c_dev->dma = NULL;
> +	}
> +
> +	clk_disable_unprepare(i2c_dev->clk);
> +
>  	return 0;
>  }
>  
> 
