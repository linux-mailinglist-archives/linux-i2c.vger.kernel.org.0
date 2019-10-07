Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E14E9CDCB9
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2019 09:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfJGH7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Oct 2019 03:59:34 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44060 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726889AbfJGH7e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Oct 2019 03:59:34 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x977puUU029109;
        Mon, 7 Oct 2019 09:59:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=yKMmEygswSh+HSAhE4eO0vUK5Gb2tp6m+QiySpRhlDA=;
 b=Ds/ExFhLGTrIH1J+aJJ56QWtmGp0x6Yc2G8Vdx+0AJxoOhxNVt5Kbu1G7JgH+7yVtO7z
 fAC4+S8WSx6amgXdJOlV9e7eYYXgDzg7E+SHhoih6TNDHTkxSeexYpIasndpsnE5LUd9
 WTpPDntqbG8RmEa15EzGDGtUYmz0AVQVJrTPMCq41dGt7m71Is5rfdZ/GlXDwv/gBJQX
 C1uIsv1gFjaQwc+p7ZJrbDCDzbAhMyHBuUYjWkqVBpC1z71lZDsCf3qQ+bSkNQlmL6/X
 Umr56fNHUFBPGFw11cXs8ANDPv1bDPuwHPzKioB5Syd0Ac/kOMEH/sHi6TywHuodFcDx 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2vej2p0ycj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 09:59:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AB0610002A;
        Mon,  7 Oct 2019 09:59:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E1DE2AF4DE;
        Mon,  7 Oct 2019 09:59:24 +0200 (CEST)
Received: from [10.48.1.171] (10.75.127.45) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Oct
 2019 09:59:23 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: remove warning when compiling with W=1
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1570200954-17919-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <a5093a73-ba62-ae37-10dc-3434c9da40f7@st.com>
Date:   Mon, 7 Oct 2019 09:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570200954-17919-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_01:2019-10-03,2019-10-07 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

Fixes tag is missing in your patch.
[ i.e ==> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver") ]

Nonetheless patch only consists in removing a comment character ?

Thanks

On 10/4/19 4:55 PM, Alain Volmat wrote:
> Remove the following warning:
> 
> drivers/i2c/busses/i2c-stm32f7.c:315:
> warning: cannot understand function prototype:
> 'struct stm32f7_i2c_spec i2c_specs[] =
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index d36cf08..7aa4a47 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -305,7 +305,7 @@ struct stm32f7_i2c_dev {
>  	struct regmap *regmap;
>  };
>  
> -/**
> +/*
>   * All these values are coming from I2C Specification, Version 6.0, 4th of
>   * April 2014.
>   *
> 
