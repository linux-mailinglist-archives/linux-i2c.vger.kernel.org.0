Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82101D765A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 14:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfJOMUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 08:20:04 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47589 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725810AbfJOMUD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Oct 2019 08:20:03 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9FCFfur020735;
        Tue, 15 Oct 2019 14:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GY+Z3B65hMOM3krVOFPaOVbaCL0W6CEn6gdWPrTcNGY=;
 b=wT13RZFHBJiJAsVW+eHMLBZ6iLAGOs6M+M4pgUjoeqkgh8IlFUkFEhN69cRJE5JGkSjK
 HmIBFufIHqjRhS7mpBUurahLVCtQ0gckdXJ4f3qdt8lhi+5N0v1EpzS3DjRadMIsBtKi
 urA2v46AjAzThSd1rgeWf8cfdSyGoBMyZnFMp1SOFwC6olJqR7N/cpUfzcXSte5uHtfo
 qR5PZMQd3Y5d04ZG7CWYE426JgN3q3b6Cee/2ngxzdRW8L/wgy5Z4wMAcztuQinSM2Zj
 ehL/rjetibrsYZoARIEHI3GWf74zMoAQeHpj6M04GUn7Au00aBcb/FzsSHeanYEcGDzx BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vk4kx02w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Oct 2019 14:19:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BC22100034;
        Tue, 15 Oct 2019 14:19:49 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E528E2C7936;
        Tue, 15 Oct 2019 14:19:49 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 14:19:49 +0200
Received: from [10.48.0.192] (10.48.0.192) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 14:19:49
 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix first byte to send in slave mode
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <fec77eaa-0d6c-73c1-2e06-9d55dfa0f426@st.com>
Date:   Tue, 15 Oct 2019 14:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
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

On 9/30/19 5:28 PM, Fabrice Gasnier wrote:
> The slave-interface documentation [1] states "the bus driver should
> transmit the first byte" upon I2C_SLAVE_READ_REQUESTED slave event:
> - 'val': backend returns first byte to be sent
> The driver currently ignores the 1st byte to send on this event.
> 
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> 
> [1] https://www.kernel.org/doc/Documentation/i2c/slave-interface
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---

Hi Wolfram, all,

Gentle reminder on this patch.

Thanks in advance !
Best Regards,
Fabrice

>  drivers/i2c/busses/i2c-stm32f7.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 266d1c2..0af9219 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1192,6 +1192,8 @@ static void stm32f7_i2c_slave_start(struct stm32f7_i2c_dev *i2c_dev)
>  			STM32F7_I2C_CR1_TXIE;
>  		stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, mask);
>  
> +		/* Write 1st data byte */
> +		writel_relaxed(value, base + STM32F7_I2C_TXDR);
>  	} else {
>  		/* Notify i2c slave that new write transfer is starting */
>  		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> 
