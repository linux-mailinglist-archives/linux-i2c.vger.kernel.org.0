Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37BCD29EA91
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 12:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJ2LcU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 07:32:20 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:48307 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725805AbgJ2LcU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 07:32:20 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TBT2ho015110;
        Thu, 29 Oct 2020 12:32:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=cUDfsyMLBZwwHgRqMnfVV+OV2A2kx7Khz7i3EBjHkbU=;
 b=wuuikyCXCb0PXaWjYUO3rOJWAzLt+3HLpfrGoYCkB5OrrjS798C/bleMZax2DAAoTNDN
 Topy5pDO3+uRmTsKYW5AWQpn9BKIYPq9EX8dzWRJ6hsqdeYT3MYW43DfXkyUX8stvk2h
 GthdhhIF+Jwf8PpE31HHBOdzrAHZm0kwZDZktdyUcJjZ+XCp7KQfZShJJkr41ngFnQMk
 yFyxsitQ5WNN7TXRSafPk0wYkyZ/SqBaPcs831/BXvKc4PmMn6hDMAblmB2JvDwc11nF
 GMV46Mq+gwV+tzI8tbekj6sUAZF3SuHKKznxQcoEtxwsPqFTxVrBGuiwkWB+71GOxsyH OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34ccf3yw6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Oct 2020 12:32:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39B90100034;
        Thu, 29 Oct 2020 12:32:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1598D2823BF;
        Thu, 29 Oct 2020 12:32:10 +0100 (CET)
Received: from [10.48.1.149] (10.75.127.47) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 12:31:55 +0100
Subject: Re: [PATCH 5/5] i2c: stm32: remove unnecessary CONFIG_PM_SLEEP
To:     Coiby Xu <coiby.xu@gmail.com>, <linux-i2c@vger.kernel.org>
CC:     Alexandre Torgue <alexandre.torgue@st.com>,
        open list <linux-kernel@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Alain VOLMAT <alain.volmat@st.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
 <20201029074654.227263-5-coiby.xu@gmail.com>
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <699f4908-1ea1-6075-3375-7f1dfc6fb225@st.com>
Date:   Thu, 29 Oct 2020 12:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029074654.227263-5-coiby.xu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_06:2020-10-29,2020-10-29 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/29/20 8:46 AM, Coiby Xu wrote:
> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index f41f51a176a1..95ac9dfdf458 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2262,7 +2262,6 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP

Hi Coiby,

This generates warnings when building with W=1 and CONFIG_PM_SLEEP=n.
Could you please add also "__maybe_unused" for relevant routines below ?

>  static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
             ^
e.g. insert: __maybe_unused

Best regards,
Fabrice
>  {
>  	int ret;
> @@ -2356,7 +2355,6 @@ static int stm32f7_i2c_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>  	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
> 
