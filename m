Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F1F35AB8D
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 09:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhDJHAw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 03:00:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40244 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhDJHAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 03:00:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13A70Hps095333;
        Sat, 10 Apr 2021 02:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1618038017;
        bh=pzTHVOnm2wnm6WLUxbxt/mXnLZUzGfpBV4GVwNNPJiI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Cg6+OekaEML9c5PwuHkVBWPRGnPTU1WA6f+mreF/wUf1bqELqFuHf+tzPlXayldmy
         iHEXXAE3AfVDL5YGmTgCgqN8ySM1hglrVlPQ/oRiTjxyGqWTi+LrY8EwT95tXM8tsZ
         hIJVFINED5XYSI3fZC/Jfowl3w3qCsEisognMQDA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13A70HFn129634
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 10 Apr 2021 02:00:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 10
 Apr 2021 02:00:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 10 Apr 2021 02:00:16 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13A70DL7076204;
        Sat, 10 Apr 2021 02:00:14 -0500
Subject: Re: [PATCH -next] i2c: omap: fix PM reference leak in
 omap_i2c_probe()
To:     Li Huafei <lihuafei1@huawei.com>, <tony@atomide.com>,
        <aaro.koskinen@iki.fi>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yangjihong1@huawei.com>,
        <zhangjinhao2@huawei.com>, <--lihuafei1@huawei.com>
References: <20210408125648.136519-1-lihuafei1@huawei.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <4b9bdf6e-f6f0-6971-0761-e7255e1355da@ti.com>
Date:   Sat, 10 Apr 2021 12:30:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408125648.136519-1-lihuafei1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi.

On 4/8/21 6:26 PM, Li Huafei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here. Fix
> it by replacing it with pm_runtime_resume_and_get to keep usage counter
> balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 12ac4212aded..edbe498d49b8 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1404,7 +1404,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  	pm_runtime_set_autosuspend_delay(omap->dev, OMAP_I2C_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(omap->dev);
>  
> -	r = pm_runtime_get_sync(omap->dev);
> +	r = pm_runtime_resume_and_get(omap->dev);
>  	if (r < 0)
>  		goto err_free_mem;
>  
> @@ -1525,7 +1525,7 @@ static int omap_i2c_remove(struct platform_device *pdev)
>  	int ret;
>  
>  	i2c_del_adapter(&omap->adapter);
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret < 0)
>  		return ret;
>  
> 
There is a similar patch at: lore.kernel.org/r/20210407033030.13419-1-dinghao.liu@zju.edu.cn
But seems like this patch is better as it fixes module remove path as well.
Would appreciate if you could work with author of above patch and come up
with a single patch.

Could you add stable tag and repost given that pm_runtime_resume_and_get()
API is backported to stable kernels such as v5.4?

Regards
Vignesh
