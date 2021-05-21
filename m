Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496FD38C926
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 16:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhEUOZT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 10:25:19 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37464 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235963AbhEUOZT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 10:25:19 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14LENHaX030258;
        Fri, 21 May 2021 16:23:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=lL+yc546IS3foLyCv0kJ/gh3raOXR1LK1upLy8mi55c=;
 b=M09HXp1t5I7vpcH4KWR49a1X2fuCvNK3ziYx13rrNjhqR7TuTS3ngeEFXw37JQzAFkUH
 W4bZ/H/bl4phbXeaw4gq119FgY7S0Wyz4+3Zyima9xcbBYS027mrVMMNWjHRiA4G1lB1
 0Dm2Z4wA2NCigzSLKXNb8VTMnw74LF7puBVez44nJvUYZb9CkCzZ2RYFQZm/yx6Cnbyu
 UAgOjspHmXSKIM5L3XtNEb5SG2VE6rYlMCvD9wJ45v+fQPEo1vCDPfLX6RTjlVg6gtaG
 lhfCfa4TmalAnh/45CaHUX5VMNRr5kzMwgi3Y7TyukeKBU+GGIeVNdHfGehuSPqfcGk+ 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38p2tc3m9b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 May 2021 16:23:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DF0710002A;
        Fri, 21 May 2021 16:23:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74A52226795;
        Fri, 21 May 2021 16:23:51 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May
 2021 16:23:50 +0200
Date:   Fri, 21 May 2021 16:23:49 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 16/16] i2c: busses: i2c-st: trivial: Fix spelling issue
 'enmpty => empty'
Message-ID: <20210521142349.GD17641@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-17-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-17-lee.jones@linaro.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-21_05:2021-05-20,2021-05-21 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the patch.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

On Thu, May 20, 2021 at 08:01:05PM +0100, Lee Jones wrote:
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Maxime Coquelin <maxime.coquelin@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-st.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 30089b38044b5..88482316d22a0 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -524,7 +524,7 @@ static void st_i2c_handle_write(struct st_i2c_dev *i2c_dev)
>  }
>  
>  /**
> - * st_i2c_handle_read() - Handle FIFO enmpty interrupt in case of read
> + * st_i2c_handle_read() - Handle FIFO empty interrupt in case of read
>   * @i2c_dev: Controller's private data
>   */
>  static void st_i2c_handle_read(struct st_i2c_dev *i2c_dev)
> -- 
> 2.31.1
> 
