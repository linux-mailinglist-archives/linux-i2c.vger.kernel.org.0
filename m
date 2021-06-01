Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091B13972A7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 13:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhFALpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 07:45:01 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42816 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231219AbhFALpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 07:45:00 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151BbeKb027852;
        Tue, 1 Jun 2021 13:43:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DJ37+M79ssVG9Eilaezkix8osS0akg3oQ3Ki2TOqVeY=;
 b=ZGHghPaIfg/tu/QIF6uNwBws0V1i6sPtyFGFy5E2Ot1NEdWGFElIDqvAUDitDGpRg8ql
 No/SgMp74lDNIGjUKQph+xOwOBbDURjsR7g/sozAGcWM29FD9+/O/9IP5U4v48ZlCYVQ
 F/aBr8/NCu/x8Pkv0YziT73BIfoHVUWbtrjjf2qTNQkTme0hAahUjueTlXQblQW29xST
 X9nd73N5Zn6JL8djS3kvoKkapMvQE9VHTUSk0451Yx2eLQ2DjgXAmRq7sZZrcYDie7ui
 U4bP1Sm1JXtwZylCvOCmgK0tJS27KEyZ11i1Ay8oZSZbIiyEU+5SmRTCPoY0c3irHSIp gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38wjdg0mpa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Jun 2021 13:43:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3E0010002A;
        Tue,  1 Jun 2021 13:43:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 846AA21E17B;
        Tue,  1 Jun 2021 13:43:01 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 13:43:00 +0200
Subject: Re: [PATCH 2/4] i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
To:     <dillon.minfei@gmail.com>, <pierre-yves.mordret@foss.st.com>,
        <alain.volmat@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-clk@vger.kernel.org>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
 <1620990152-19255-3-git-send-email-dillon.minfei@gmail.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f30d5a1d-5acc-e756-5883-6c3d0173d643@foss.st.com>
Date:   Tue, 1 Jun 2021 13:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620990152-19255-3-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-01_06:2021-05-31,2021-06-01 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dillon

On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> As stm32f429's internal flash is 2Mbytes and compiled kernel
> image bigger than 2Mbytes, so we have to load kernel image
> to sdram on stm32f429-disco board which has 8Mbytes sdram space.
> 
> based on above context, as you knows kernel running on external
> sdram is more slower than internal flash. besides, we need read 4
> bytes to get touch screen xyz(x, y, pressure) coordinate data in
> stmpe811 interrupt.
> 
> so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
> in xip mode, have to adjust 'STOP/START bit set position' from last
> two bytes to last one bytes. else, will get i2c timeout in reading
> touch screen coordinate.
> 
> to not bring in side effect, introduce IIC_LAST_BYTE_POS to support xip
> kernel or zImage.
> 
> Fixes: 62817fc8d282 ("i2c: stm32f4: add driver")
> Link: https://lore.kernel.org/lkml/1591709203-12106-5-git-send-email-dillon.minfei@gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 4933fc8ce3fd..2e41231b9037 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -93,6 +93,12 @@
>  #define STM32F4_I2C_MAX_FREQ		46U
>  #define HZ_TO_MHZ			1000000
>  
> +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
> +#define IIC_LAST_BYTE_POS 1
> +#else
> +#define IIC_LAST_BYTE_POS 2
> +#endif
> +
>  /**
>   * struct stm32f4_i2c_msg - client specific data
>   * @addr: 8-bit slave addr, including r/w bit
> @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>  	int i;
>  
>  	switch (msg->count) {
> -	case 2:
> +	case IIC_LAST_BYTE_POS:
>  		/*
>  		 * In order to correctly send the Stop or Repeated Start
>  		 * condition on the I2C bus, the STOP/START bit has to be set
> @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>  		else
>  			stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
>  
> -		for (i = 2; i > 0; i--)
> +		for (i = IIC_LAST_BYTE_POS; i > 0; i--)
>  			stm32f4_i2c_read_msg(i2c_dev);
>  
>  		reg = i2c_dev->base + STM32F4_I2C_CR2;
> @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>  
>  		complete(&i2c_dev->complete);
>  		break;
> -	case 3:
> +	case (IIC_LAST_BYTE_POS+1):
>  		/*
>  		 * In order to correctly generate the NACK pulse after the last
>  		 * received data byte, we have to enable NACK before reading N-2
> 

I tested this patch on STM32F429-Disco, it fixes the issue described by Dillon.
But i think it's not a good idea to make usage of #if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
inside the driver code.

Pierre-Yves, Alain, as i am not I2C expert, can you have a look at this patch and propose another solution 
to fix the original issue described by Dillon ?

Thanks
Patrice
