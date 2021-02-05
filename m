Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DCA31155E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhBEW3O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:29:14 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51310 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232549AbhBEOVB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 09:21:01 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 115EofUK000447;
        Fri, 5 Feb 2021 15:59:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Kmqf4H36jwosTyKxq7uvwp2sNs+1+ieQgvhe5qhxId4=;
 b=4mcLAf1tErID1vGA1tO01tiMTaOWZAAOTPbbfYAU8tP4Me1+VBOLlL2DxCxtS0pclT+S
 zTlJ/ied1CpzmUzuwXkdXdUqjHgE4LkcvCLZ8rJVg+tnWcrWp/FWhiHT79CHkWfOEHtt
 LlnvQiTmYXqaUrzoam/LrfPhD2DihB0X6DFDjXxUcAHL8BcUEKKDllIfdMmN5sbPihJa
 J51oi4QvmYP6udtt5vT/YQ25JwNmeJplbuTZf340LO3aqMGxyO77cComD0MkMZiKJ4Yx
 2D9hb2Ops4csVpDGVV6aFIY30KeZCleETkmcTWrcJQxPyn66b27W1Txa9sA8ILdoOjsq wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36ey7hh1v3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Feb 2021 15:59:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85A0210002A;
        Fri,  5 Feb 2021 15:59:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E66C2402BC;
        Fri,  5 Feb 2021 15:59:46 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 15:59:44 +0100
Subject: Re: [PATCH 5/5] i2c: stm32f7: indicate the address being accessed on
 errors
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-6-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <7b614b4e-2bea-2002-0be3-4b3a0d15a4e9@foss.st.com>
Date:   Fri, 5 Feb 2021 15:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-6-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-05_09:2021-02-05,2021-02-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

Looks good to me

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 2/5/21 9:51 AM, Alain Volmat wrote:
> To help debugging issues, add the address of the slave being
> accessed when getting an error.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index f77cd6512a86..ef642fe1eb2c 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1602,7 +1602,8 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  
>  	/* Bus error */
>  	if (status & STM32F7_I2C_ISR_BERR) {
> -		dev_err(dev, "<%s>: Bus error\n", __func__);
> +		dev_err(dev, "<%s>: Bus error accessing addr 0x%x\n",
> +			__func__, f7_msg->addr);
>  		writel_relaxed(STM32F7_I2C_ICR_BERRCF, base + STM32F7_I2C_ICR);
>  		stm32f7_i2c_release_bus(&i2c_dev->adap);
>  		f7_msg->result = -EIO;
> @@ -1610,13 +1611,15 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  
>  	/* Arbitration loss */
>  	if (status & STM32F7_I2C_ISR_ARLO) {
> -		dev_dbg(dev, "<%s>: Arbitration loss\n", __func__);
> +		dev_dbg(dev, "<%s>: Arbitration loss accessing addr 0x%x\n",
> +			__func__, f7_msg->addr);
>  		writel_relaxed(STM32F7_I2C_ICR_ARLOCF, base + STM32F7_I2C_ICR);
>  		f7_msg->result = -EAGAIN;
>  	}
>  
>  	if (status & STM32F7_I2C_ISR_PECERR) {
> -		dev_err(dev, "<%s>: PEC error in reception\n", __func__);
> +		dev_err(dev, "<%s>: PEC error in reception accessing addr 0x%x\n",
> +			__func__, f7_msg->addr);
>  		writel_relaxed(STM32F7_I2C_ICR_PECCF, base + STM32F7_I2C_ICR);
>  		f7_msg->result = -EINVAL;
>  	}
> 

-- 
--
~ Py MORDRET
--
