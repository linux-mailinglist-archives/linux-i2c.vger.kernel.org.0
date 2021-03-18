Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFAB340652
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 14:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhCRNGG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 09:06:06 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57292 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231357AbhCRNFn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 09:05:43 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12ID2RWS024294;
        Thu, 18 Mar 2021 14:05:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NOyn5dQnMPpXTyZNNKO/KszQaVMbZpIOpoYqMd3bRrw=;
 b=zfxwVjJO/GR8jisGC4f2hO+JtRDkLlRPNEIB9Iy25EQi2N3rU/Uvk6SIfU9ofMQqw3ek
 0XVj3TCPENFpKC3W+l7SKT2ffQ5wGuzuB86EUz/GVxpzemKMMZADJhJR0c8k9GnP7hbg
 zCR+j2lhohXV9T2t5wAcdELBEEVvRC/XRcAIr0HfmoDqRybUNCV4Lj++xPuzbMgKpqgg
 zcPtq9ahukVXFlNWE6Kz3D4UHXwtwzqPLiUCQmnEhxxrF/IiaLcVhuTVEzSaHikNVtpX
 we67IL1/K8XyN4OZDXI/qz60Z7NAtEQxOT/PeH6/oHryuvChfI17u8HZAo8W8E08ws55 Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37c2ux9nf1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Mar 2021 14:05:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4447B100034;
        Thu, 18 Mar 2021 14:05:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FC092C41F2;
        Thu, 18 Mar 2021 14:05:32 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar
 2021 14:05:31 +0100
Subject: Re: [PATCH] i2c: stm32f7: avoid ifdef CONFIG_PM_SLEEP for pm
 callbacks
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1615550007-10927-1-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <5f412da7-1915-b2dc-a21a-56055991e96c@foss.st.com>
Date:   Thu, 18 Mar 2021 14:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615550007-10927-1-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-18_07:2021-03-17,2021-03-18 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 3/12/21 12:53 PM, Alain Volmat wrote:
> Avoid CONFIG_PM preprocessor check for pm suspend/resume
> callbacks and identify the functions with __maybe_unused.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index c62c815b88eb..4c2f1b16c5ce 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2267,8 +2267,7 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
> +static int __maybe_unused stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  {
>  	int ret;
>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
> @@ -2289,7 +2288,7 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  	return ret;
>  }
>  
> -static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
> +static int __maybe_unused stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  {
>  	u32 cr1;
>  	int ret;
> @@ -2320,7 +2319,7 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  	return ret;
>  }
>  
> -static int stm32f7_i2c_suspend(struct device *dev)
> +static int __maybe_unused stm32f7_i2c_suspend(struct device *dev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int ret;
> @@ -2341,7 +2340,7 @@ static int stm32f7_i2c_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int stm32f7_i2c_resume(struct device *dev)
> +static int __maybe_unused stm32f7_i2c_resume(struct device *dev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int ret;
> @@ -2361,7 +2360,6 @@ static int stm32f7_i2c_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>  	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
> 

-- 
--
~ Py MORDRET
--
