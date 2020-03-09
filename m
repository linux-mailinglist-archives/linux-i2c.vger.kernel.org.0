Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C936017E2C0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Mar 2020 15:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgCIOwp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Mar 2020 10:52:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:25450 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726439AbgCIOwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Mar 2020 10:52:45 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 029EqZPX019446;
        Mon, 9 Mar 2020 15:52:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=dA0MNAnLTz0IYOJPapDxgoGP7Yrm9Fs9Y8Li113GzqI=;
 b=Ah6XKPYgFgDp1fh0mqFg0w72uX4L+DX/d8WYRQahlDj6ggls2OXJBHcNB+f1GJhw4iYl
 ZdmQAYgRgwMvhuvmVob4jOaX+GgRdWO7pR8+mx04h+29hvImoaYMSXOcweTe8QrNMNX4
 8c7QLwGIbQSx8mTXFFWFLpEAy9wsSFRK2b2kYH79OyOifnTa5idFnZ/+K+FLId9GN8Xx
 X5VAwc7zHYAad7lHDQuuO8itqJk5tZUTY/735FqJtbbVvEu8AJ/ige6EeW+Pizatk7Da
 EO8rWKrB/I0NElleF9UW+yOXh/Xf4qghnbK3E9ZxxubGSLOTd1DJy0GmB4v7NslSLdEX 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ym2924v6r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Mar 2020 15:52:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2A82100034;
        Mon,  9 Mar 2020 15:52:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E56492A5443;
        Mon,  9 Mar 2020 15:52:28 +0100 (CET)
Received: from [10.48.1.172] (10.75.127.49) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Mar
 2020 15:52:28 +0100
Subject: Re: [PATCH] i2c: stm32f7: do not backup read-only PECR register
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <5b19cf9c-9556-09c9-929d-0c396f689521@st.com>
Date:   Mon, 9 Mar 2020 15:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-09_06:2020-03-09,2020-03-09 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

Look good for me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Regards

On 3/5/20 1:59 PM, Alain Volmat wrote:
> The PECR register provides received packet computed PEC value. 
> It makes no sense restoring its value after a reset, and anyway,
> as read-only register it cannot be restored.
> 
> Fixes: ea6dd25deeb5 ("i2c: stm32f7: add PM_SLEEP suspend/resume support")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 378956ac6d1d..4d7401d62b71 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -176,7 +176,6 @@
>   * @cr2: Control register 2
>   * @oar1: Own address 1 register
>   * @oar2: Own address 2 register
> - * @pecr: PEC register
>   * @tmgr: Timing register
>   */
>  struct stm32f7_i2c_regs {
> @@ -184,7 +183,6 @@ struct stm32f7_i2c_regs {
>  	u32 cr2;
>  	u32 oar1;
>  	u32 oar2;
> -	u32 pecr;
>  	u32 tmgr;
>  };
>  
> @@ -2146,7 +2144,6 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
>  	backup_regs->oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
>  	backup_regs->oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
> -	backup_regs->pecr = readl_relaxed(i2c_dev->base + STM32F7_I2C_PECR);
>  	backup_regs->tmgr = readl_relaxed(i2c_dev->base + STM32F7_I2C_TIMINGR);
>  
>  	pm_runtime_put_sync(i2c_dev->dev);
> @@ -2178,7 +2175,6 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  	writel_relaxed(backup_regs->cr2, i2c_dev->base + STM32F7_I2C_CR2);
>  	writel_relaxed(backup_regs->oar1, i2c_dev->base + STM32F7_I2C_OAR1);
>  	writel_relaxed(backup_regs->oar2, i2c_dev->base + STM32F7_I2C_OAR2);
> -	writel_relaxed(backup_regs->pecr, i2c_dev->base + STM32F7_I2C_PECR);
>  
>  	pm_runtime_put_sync(i2c_dev->dev);
>  
> 
