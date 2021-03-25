Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7845D348CB8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 10:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCYJYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 05:24:45 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:7784 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229836AbhCYJYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 05:24:41 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12P9DKPB024503;
        Thu, 25 Mar 2021 10:24:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8pyUWRkcU1YplhF4/J3PtEVHgtW/bvj0k4wn5bDDy44=;
 b=PPuwlGTwlFpXlOdCf4FK6RZjZD3EteCa+xM+bLH+y6obM9Omubl2dGSogqfzfLtUQTnW
 fjZ41GD/7ualtXDViTA+u4dLfn+FvOGAJdeGqOgMTmh5aJqJOYkT7cV/I+QGnBF1Y6+8
 wAbmgKmlJwokNo/yb+b50W3y8dr7LmaLpyzmBwETv+ERuJcYOEULVMc0w1ODbkuzohzW
 z/Nw9fxIAhGJf0knnDjsKyvjVSN1ZwmbScG5ftKOypHeybHq67NiFjzlXdJAPuHyBy1m
 xby9w941fUZ3nrUXuIcj1LCuhIANK5DCfwyh0Czpuxb4JZOWHdDQetFofcHizxcNPlJD 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37fb17p32b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 10:24:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF343100034;
        Thu, 25 Mar 2021 10:24:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC7D622AC2E;
        Thu, 25 Mar 2021 10:24:13 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 10:24:12 +0100
Subject: Re: [PATCH] i2c-stm32f4: Mundane typo fix
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        <coquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        <p.zabel@pengutronix.de>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
 <AS8PR10MB4504462766AFA3E151121462C6629@AS8PR10MB4504.EURPRD10.PROD.OUTLOOK.COM>
CC:     <rdunlap@infradead.org>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <39f76c98-2f83-76ee-a1a3-3db0dcdc70ca@foss.st.com>
Date:   Thu, 25 Mar 2021 10:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AS8PR10MB4504462766AFA3E151121462C6629@AS8PR10MB4504.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_02:2021-03-24,2021-03-25 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 3/25/21 10:19 AM, Pierre Yves MORDRET wrote:
> 
> s/postion/position/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 937c2c8fd349..4933fc8ce3fd 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
>  	default:
>  		/*
>  		 * N-byte reception:
> -		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
> +		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
>  		 * In that way, ACK will be sent as soon as the current byte
>  		 * will be received in the shift register
>  		 */

Hi All,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

> --
> 2.30.1
> 

Regards
-- 
--
~ Py MORDRET
--
