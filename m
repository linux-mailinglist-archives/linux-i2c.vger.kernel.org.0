Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2BF38C915
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 16:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbhEUOWP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 10:22:15 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36756 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229813AbhEUOWP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 10:22:15 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14LE3HAJ029157;
        Fri, 21 May 2021 16:20:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=zgoapCSxja5ggXz9KaCmLJKGtmXmExMPdEbxDJDwE7E=;
 b=0gJiJD7TIyT0tM1jMNkmfEmNfN5yrDSpGveFzqagAdcxRSI9LlVKpw3OXiMo7o/wcuWi
 bx8rsC6ay3fezqpmd3m3AAq9kyfmfq6Qa4b7KSwSzLsVRNl9TAUsTYfdw15UKkKta/7Q
 DZNlLFIN7nNnWn+TOVgvvmxqtmu1dcwPJGcrmSkQBI9pqRULKVxsnC7GddIMVyeVRkmK
 jgb+VOYIx4cOCOnS6umhf6TW16a6jr1KIUG+MM2xexokyc4sv3qBCPThLZivyJbXmAWw
 2UE6izqAxPW7whNoFbHcrOce/fqatTmpEhrbkL66Ak3YHsIDs+cOWu7PfUhYRbS8pPzb Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38p2tc3kv8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 May 2021 16:20:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1903A10002A;
        Fri, 21 May 2021 16:20:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08D6221F0D2;
        Fri, 21 May 2021 16:20:41 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May
 2021 16:20:40 +0200
Date:   Fri, 21 May 2021 16:20:39 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Cedric Madianga <cedric.madianga@gmail.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 14/16] i2c: busses: i2c-stm32f4: Remove incorrectly
 placed ' ' from function name
Message-ID: <20210521142039.GB17641@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Cedric Madianga <cedric.madianga@gmail.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-15-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-15-lee.jones@linaro.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-21_05:2021-05-20,2021-05-21 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the patch. Looks fine for me.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

On Thu, May 20, 2021 at 08:01:03PM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-stm32f4.c:321: warning: expecting prototype for stm32f4_i2c_write_ byte()(). Prototype was for stm32f4_i2c_write_byte() instead
> 
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Cedric Madianga <cedric.madianga@gmail.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 4933fc8ce3fd1..eebce7ecef25b 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -313,7 +313,7 @@ static int stm32f4_i2c_wait_free_bus(struct stm32f4_i2c_dev *i2c_dev)
>  }
>  
>  /**
> - * stm32f4_i2c_write_ byte() - Write a byte in the data register
> + * stm32f4_i2c_write_byte() - Write a byte in the data register
>   * @i2c_dev: Controller's private data
>   * @byte: Data to write in the register
>   */
> -- 
> 2.31.1
> 
