Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E341BE073
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 16:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgD2OPi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 10:15:38 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:39320 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726516AbgD2OPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 10:15:37 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03TECkSd012368;
        Wed, 29 Apr 2020 16:15:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=KqESSlTcD9ep4XnUlD+lwpTAnY9V9M5Pb1fKaGdwF+E=;
 b=q2fqv5Tvp2oHUASZ/Ov0TGv3/QmZn2wqRg4Nr+OyQeOvnaLUYzQw+FTZK44HRr/DZpg5
 99oc1sn5jnjkI/k+9t+k5A8HthlcWvDqhRxn3LtNLslE2OJOQIo+y9Odaa9+vyhoaGFX
 B9GtlssCs3Zrj50GOv158zmXPi9oXIzZpSzPWn11lV9dQBMyRKnpzG2WoZwRDh8b9n26
 TpT2JdBjZZQquwAN/L3IXEP/GqJ77PnRU9v0sEGg4C7I5qxL8ei/Cv9W6nX9JxQ3cXCr
 NDBQzNOw7Hfr7iKEa2kFep09P3b19u6diZXjtQyIacMsrLSrIZxSNR7kc7H+ycWlKS93 Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30n4j62ys2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Apr 2020 16:15:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D954D10002A;
        Wed, 29 Apr 2020 16:15:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4C522A4D69;
        Wed, 29 Apr 2020 16:15:14 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 16:15:14 +0200
Date:   Wed, 29 Apr 2020 16:15:13 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <kernel-janitors@vger.kernel.org>, <wsa@the-dreams.de>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: stm32f7: prevent array underflow in
 stm32f7_get_lower_rate()
Message-ID: <20200429141513.GB31498@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org
References: <20200429132323.GB815283@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200429132323.GB815283@mwanda>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-29_07:2020-04-29,2020-04-29 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

indeed, thanks a lot.

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Alain

On Wed, Apr 29, 2020 at 04:23:23PM +0300, Dan Carpenter wrote:
> We want to break with "i" set to zero whether we find the rate we want
> or not.  In the current code, if we don't find the rate we want then it
> exits the loop with "i" set to -1 and results in an array underflow.
> 
> Fixes: 09cc9a3bce91 ("i2c: stm32f7: allows for any bus frequency")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 9c9e10ea91991..bff3479fe122a 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -607,7 +607,7 @@ static u32 stm32f7_get_lower_rate(u32 rate)
>  {
>  	int i = ARRAY_SIZE(stm32f7_i2c_specs);
>  
> -	while (i--)
> +	while (--i)
>  		if (stm32f7_i2c_specs[i].rate < rate)
>  			break;
>  
> -- 
> 2.26.2
> 
