Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DC5348A58
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 08:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYHp0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 03:45:26 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:32482 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhCYHpV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 03:45:21 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12P7hJef029069;
        Thu, 25 Mar 2021 08:43:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=w7J5GsMUoBcuIgOX9vwjz/nfL+HUwedcW3KIkb1nR+8=;
 b=y4LP/QuIKgKp6GDw4Ly2DXBx5cuPTQcgDzpgZL7ejUhoj4VgVIkNn+KsxHIZf/6GhOGF
 fhmf228EAq3PxTWzgyBd+tihPhIDNW91ACtADy7NhipuzZLtPsV0RPBstBXPtlbTBQWI
 R/N9m/zlEPH2fix7LEC6d6CoiuqTZc79p8xosEkEC1XYEsUymSqBXd5PPyD18XqO/Bgt
 13jtm7VkgpUE+xE56feaIcs8uZajHRXm+Z0+EDPcv4+wx2khTCn9Fi5KDNDDW9ODlCmM
 aS4PoWlfoch30XTpQbXbEDbOhW5ZXG527W6aDLh8RSCKM5uKRpoiPIW5D3dQ//AYfAGk 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37fb17ndhy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 08:43:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1AC910002A;
        Thu, 25 Mar 2021 08:43:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BF2B21E685;
        Thu, 25 Mar 2021 08:43:15 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 08:43:15 +0100
Date:   Thu, 25 Mar 2021 08:43:10 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
CC:     <pierre-yves.mordret@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <p.zabel@pengutronix.de>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
Subject: Re: [PATCH] i2c-stm32f4: Mundane typo fix
Message-ID: <20210325074310.GA17918@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210324140610.32385-1-unixbhaskar@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_01:2021-03-24,2021-03-25 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 07:36:10PM +0530, Bhaskar Chowdhury wrote:
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

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

> --
> 2.30.1
> 
