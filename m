Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F41F1E1D68
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 10:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728867AbgEZIec (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 04:34:32 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:8590 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbgEZIeb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 04:34:31 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04Q8W2Kg031881;
        Tue, 26 May 2020 10:34:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=yYl7Q366t3wZdeT76gK6DolbnJ3PwezvlVa6m3FkDpQ=;
 b=P36yH9zYjirIl4Biz2lMPmtVJE18A0S4HPyvfBZfeoXnNCWdio7rZ53MIu+yq2voOYZw
 Ca186l1OP+6shHNyXcxEB6SUfHhwI9YLq/ZXu//ji2WFjuFFfwGnzoOjphA0QX9g7ifZ
 6wYhrP2xzb3XI6AoOygPfT2/z0EyO+BDIpcyPk+1n6duOVcxbBtkeZ8UdfKEphhuwBij
 ZIyg0uGSU00QuCxX2NUPdLWep3cw1xqlH3OLaZKsFI+6mOEJbOYggFgYVacxHvBgUedR
 q4sV3L9AYofZuUef9udwp0HCyS9rvLEf7tfXnRPE3EEdAi49XknmsrwuVdssiv/bgQN8 LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 316skw6hv7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 May 2020 10:34:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31FC410002A;
        Tue, 26 May 2020 10:34:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 203162BE22E;
        Tue, 26 May 2020 10:34:02 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 26 May
 2020 10:34:01 +0200
Date:   Tue, 26 May 2020 10:34:00 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
CC:     <kjlu@umn.edu>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: stm32f7: Fix runtime PM imbalance in
 stm32f7_i2c_reg_slave
Message-ID: <20200526083400.GC10725@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200521070507.13015-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200521070507.13015-1-dinghao.liu@zju.edu.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-05-25_12:2020-05-25,2020-05-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dinghao,

Thanks for the patch. Indeed, this should be fixed.

Overall, there are several other calls to pm_runtime_get_sync within this
driver, would you like to fix them all at once ?

On Thu, May 21, 2020 at 03:05:07PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 330ffed011e0..602cf35649c8 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1767,8 +1767,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  		return ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_autosuspend(dev);

Considering that if we fail here there is a very good chance that this is due
to the resume failing, pm_runtime_put_noidle would probably make more sense
since pm_runtime_put_autosuspend will most probably fail as well.

>  		return ret;
> +	}
>  
>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
>  		stm32f7_i2c_enable_wakeup(i2c_dev, true);
> -- 
> 2.17.1
> 
