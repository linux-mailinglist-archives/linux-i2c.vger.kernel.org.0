Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CAB2309E2
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgG1MXN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:23:13 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:59184 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728300AbgG1MXM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:23:12 -0400
X-Greylist: delayed 1319 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Jul 2020 08:23:11 EDT
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SBrfuE015212;
        Tue, 28 Jul 2020 14:01:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=ZCiJHVYVXiTSIdmCIW/9EKYmYWc/Ke7o2/a0f5AvhEk=;
 b=f3QJPYjkGMUcxopqOwGOQ4lNmvKAXISEknC7rYYU3IbXDvBMVOWCv00ax53l9/cREFkA
 vjMWwpcEKfRSVU9B+QuL8Bp8PsUo6j0umGAw7lBCihQLgJTFC4d9mOduSumhLYXadW6N
 xwX3ltYbXQbsxBLGmRZpRF4agecmUSax+J7Oo3v8vFhDnZUcijn2DI53lA1woXmpGJHc
 WiqEvTaZ4ezBHUNOfQGNqlFsZsted3RhaQ+yhKAPJZSeYCGg326Ry+XU0JCN+OjUU2xR
 VaTLibLCKIw+pGEZgnw3nzceaKWW/1AWMDdk70S+EQlGHH3k6iO1GSieITMilF7W5+sp Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gagv61y7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 14:01:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6158410002A;
        Tue, 28 Jul 2020 14:01:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A6FE2BF9CC;
        Tue, 28 Jul 2020 14:01:07 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 14:01:07 +0200
Date:   Tue, 28 Jul 2020 14:01:01 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: slave: improve sanity check when registering
Message-ID: <20200728120101.GA8715@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
References: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
 <20200725195053.14334-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200725195053.14334-2-wsa+renesas@sang-engineering.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_07:2020-07-28,2020-07-28 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Alain

On Sat, Jul 25, 2020 at 09:50:52PM +0200, Wolfram Sang wrote:
> Add check for ERR_PTR and simplify code while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-slave.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
> index 5427f047faf0..549751347e6c 100644
> --- a/drivers/i2c/i2c-core-slave.c
> +++ b/drivers/i2c/i2c-core-slave.c
> @@ -18,10 +18,8 @@ int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb)
>  {
>  	int ret;
>  
> -	if (!client || !slave_cb) {
> -		WARN(1, "insufficient data\n");
> +	if (WARN(IS_ERR_OR_NULL(client) || !slave_cb, "insufficient data\n"))
>  		return -EINVAL;
> -	}
>  
>  	if (!(client->flags & I2C_CLIENT_SLAVE))
>  		dev_warn(&client->dev, "%s: client slave flag not set. You might see address collisions\n",
> -- 
> 2.20.1
> 
