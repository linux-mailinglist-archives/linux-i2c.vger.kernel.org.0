Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956581001EB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 10:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfKRJ4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 04:56:45 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:37594 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726536AbfKRJ4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 04:56:45 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAI9m2Fb010561;
        Mon, 18 Nov 2019 10:56:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ZUmCqdr8Fk+z7NrNQWKVsIW5V3oeSkRl58Z8nizBirg=;
 b=L7IeN4rNlJGdeQVKaqXbxE2hJkTIFHuSl5jcXGhG2zeNHjRqsanRYAskV3SiqI8aYPJB
 7/uWnwCGAKmqqk/GiOAHPEoLs3Vq+rBfvhh30hqcPAYPTWMoydRmnU3rX8lFjSTcs/V/
 lXFDC8Ags6RrN+Fg66JANC6/Fy84Yr7wX+YGRs6zat/8LyTWb6ZfmK9B/DMXMkI04A2q
 4zCCe6rp4rjLuAh5mVE1H/GN2mEpuKcZzi1EPAHCdrcSevlDpGQWRO52UzzVJ4jUJzMN
 /qnouBysgD12SYrvzPVDUrEeegxaRknpEYB/2s3qzIs6KhF6sqjp/vB/MZLGF1z8SDxn gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wa9uhrgyv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Nov 2019 10:56:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E1D010002A;
        Mon, 18 Nov 2019 10:56:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8139F2BC7D9;
        Mon, 18 Nov 2019 10:56:34 +0100 (CET)
Received: from [10.48.1.171] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 10:56:33 +0100
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix 10-bits check in slave free id
 search loop
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <ca718929-a6c6-587c-0a7a-0cfb5a2cfe0d@st.com>
Date:   Mon, 18 Nov 2019 10:56:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-18_01:2019-11-15,2019-11-17 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello

Look good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Regards

On 11/12/19 9:19 AM, Alain Volmat wrote:
> Fix a typo in the free slave id search loop. Instead of I2C_CLIENT_PEC,
> it should have been I2C_CLIENT_TEN. The slave id 1 can only handle 7-bit
> addresses and thus is not eligible in case of 10-bit addresses.
> As a matter of fact none of the slave id support I2C_CLIENT_PEC, overall
> check is performed at the beginning of the stm32f7_i2c_reg_slave function.
> 
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index b9a082f64d58..b2634afe066d 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1268,7 +1268,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
>  	 * slave[1] supports 7-bit slave address only
>  	 */
>  	for (i = STM32F7_I2C_MAX_SLAVE - 1; i >= 0; i--) {
> -		if (i == 1 && (slave->flags & I2C_CLIENT_PEC))
> +		if (i == 1 && (slave->flags & I2C_CLIENT_TEN))
>  			continue;
>  		if (!i2c_dev->slave[i]) {
>  			*id = i;
> 
