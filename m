Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5265F3563D5
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 08:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345553AbhDGGTf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 02:19:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40480 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239344AbhDGGTf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 02:19:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1376J7GR104812;
        Wed, 7 Apr 2021 01:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617776347;
        bh=7mww6e63fRIePpdiNldtq4XKzkmLxpsYwNIvhwJ5GGM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CwlZW5QrIFJiYOTeuLI3aehtDO+hOT6lJiY6LyZtgP5yw+Vd/aDvVFl0RtfRk68n6
         qFYT4WMqzVg07HdtgNDMi1Redw6SYw9xW3pWjVJTT01Uvo1UlG8c12MBLZj52yq7M1
         KmymdDJCEvfsY9md6jfutORlfeyaUc8SW9sT8zSo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1376J7A3006462
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 01:19:07 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 01:19:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 01:19:06 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1376J4wN106058;
        Wed, 7 Apr 2021 01:19:04 -0500
Subject: Re: [PATCH] i2c: omap: Fix rumtime PM imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, <kjlu@umn.edu>
CC:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e2b5dc55-e084-c4e5-4eb0-749e2922a602@ti.com>
Date:   Wed, 7 Apr 2021 11:49:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/7/21 9:00 AM, Dinghao Liu wrote:
> pm_runtime_get_sync() will increase the rumtime PM counter
> even it returns an error. Thus a pairing decrement is needed
> to prevent refcount leak. Fix this by replacing this API with
> pm_runtime_resume_and_get(), which will not change the runtime
> PM counter on error.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---

Do we need a Fixes: tag to enable stable backports?

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

>  drivers/i2c/busses/i2c-omap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 12ac4212aded..c9ee0875a79d 100644
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
> 
