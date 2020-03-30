Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE99F1976CA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 10:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgC3Ilm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 04:41:42 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:58018 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729398AbgC3Ilm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Mar 2020 04:41:42 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02U8cY2H004211;
        Mon, 30 Mar 2020 10:41:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=TK4u1WfehPW/zTgGPri0+DBcitevXxC+wyU2msRkqLE=;
 b=haARCOzIV6JQ+tAcVZlz8BpMryuDuyD+MIM5yzWhK2sLg+LcWgwX7//pi06HrOv8dlSm
 ahtx50aKnPSU6kt8bwLwo2hDIxlOdB7UUqlhW2sV77fT+630hZqWJn1gQzR7NZOb5sqW
 qAQkhg1KPCp98qTBvAvXFbrH/oQcv5yPCyg0EY5fWTFs9+zRgTST2L00uBGoNqbzY+EF
 xJQNmMHfEozvdYGbbjBn6VJQv/qurMx7VzBHtLmnTLUgnHNKT8XDVXDWNW5z4PTOStCe
 AsfiydvTXfTPAwbRuandEuapAd9oA3o+4qL6/aeELUk30KA+60dq7YrOFmcrLH73aZca AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 301xbm8cu2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Mar 2020 10:41:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 807C4100039;
        Mon, 30 Mar 2020 10:41:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 734772A4D71;
        Mon, 30 Mar 2020 10:41:31 +0200 (CEST)
Received: from [10.131.224.211] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Mar
 2020 10:41:29 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: improve nack debug message
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <ea95b420-4368-8f91-15d3-db5f18086f22@st.com>
Date:   Mon, 30 Mar 2020 10:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-30_01:2020-03-27,2020-03-30 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello guys !

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 3/19/20 7:21 PM, Alain Volmat wrote:
> From: Fabrice Gasnier <fabrice.gasnier@st.com>
> 
> Add information on slave addr in the nack debug message.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 378956ac6d1d..78d40a4cc282 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1431,7 +1431,8 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
>  
>  	/* NACK received */
>  	if (status & STM32F7_I2C_ISR_NACKF) {
> -		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK\n", __func__);
> +		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
> +			__func__, f7_msg->addr);
>  		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
>  		f7_msg->result = -ENXIO;
>  	}
> 
