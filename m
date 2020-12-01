Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8D02CA8E9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 17:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392041AbgLAQz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 11:55:28 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41212 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390685AbgLAQz1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 11:55:27 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1GrWfY028829;
        Tue, 1 Dec 2020 10:53:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606841613;
        bh=eY0gcZKiO+geqtliN96bz+SmFaRY/ORwUUsTfACXe/c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cr+Hi48oEitXTnUnAzvGNvWtCWqRneK/U40nYfwdTf5yISzouImsBFAnjC58tBT2O
         83AuN/jQNqPIGl6meMz8eWt+7iT9FlHS/Zulle2KVFYFgsg5HBViTBSSv9+6D6RrL3
         vMq/MHZp1CWWFnQAHMr3aHxbiiyZ1IOcTfnBZONQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1GrWGj009671
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 10:53:32 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 10:53:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 10:53:32 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1GrSRW001793;
        Tue, 1 Dec 2020 10:53:30 -0600
Subject: Re: [PATCH 5/8] i2c: omap: fix reference leak when
 pm_runtime_get_sync fails
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Vignesh R <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20201201092924.112461-1-miaoqinglang@huawei.com>
 <20201201093143.113180-1-miaoqinglang@huawei.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <06932c6c-ee8e-0836-9a3c-db146737a2f7@ti.com>
Date:   Tue, 1 Dec 2020 18:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201093143.113180-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 01/12/2020 11:31, Qinglang Miao wrote:
> The PM reference count is not expected to be incremented on
> return in omap_i2c_probe() and omap_i2c_remove().
> 
> However, pm_runtime_get_sync will increment the PM reference
> count even failed. Forgetting to putting operation will result
> in a reference leak here. I Replace it with pm_runtime_resume_and_get
> to keep usage counter balanced.
> 
> What's more, error path 'err_free_mem' seems not like a proper
> name any more. So I change the name to err_disable_pm and move
> pm_runtime_disable below, for pm_runtime of 'pdev->dev' should
> be disabled when pm_runtime_resume_and_get fails.
> 
> Fixes: 3b0fb97c8dc4 ("I2C: OMAP: Handle error check for pm runtime")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-omap.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 12ac4212a..d4f6c6d60 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1404,9 +1404,9 @@ omap_i2c_probe(struct platform_device *pdev)
>   	pm_runtime_set_autosuspend_delay(omap->dev, OMAP_I2C_PM_TIMEOUT);
>   	pm_runtime_use_autosuspend(omap->dev);
>   
> -	r = pm_runtime_get_sync(omap->dev);
> +	r = pm_runtime_resume_and_get(omap->dev);
>   	if (r < 0)
> -		goto err_free_mem;
> +		goto err_disable_pm;
>   
>   	/*
>   	 * Read the Rev hi bit-[15:14] ie scheme this is 1 indicates ver2.
> @@ -1513,8 +1513,8 @@ omap_i2c_probe(struct platform_device *pdev)
>   	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
>   	pm_runtime_dont_use_autosuspend(omap->dev);
>   	pm_runtime_put_sync(omap->dev);
> +err_disable_pm:
>   	pm_runtime_disable(&pdev->dev);
> -err_free_mem:
>   
>   	return r;
>   }
> @@ -1525,7 +1525,7 @@ static int omap_i2c_remove(struct platform_device *pdev)
>   	int ret;
>   
>   	i2c_del_adapter(&omap->adapter);
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>   	if (ret < 0)
>   		return ret;
>   
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
