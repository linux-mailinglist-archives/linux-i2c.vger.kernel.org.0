Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10996FBEF1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjEIGCS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjEIGCS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:02:18 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DE7903C;
        Mon,  8 May 2023 23:02:16 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 349623HH037631;
        Tue, 9 May 2023 01:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1683612123;
        bh=VLvq1DVRP3d/8N1kPOoJcU1/Kl8DgJFQhslc54nl7lI=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=BXrK+uKExEV89NxoVZq6wZEGNGi7waIR+vJ1QTy9ATr2gsShCeeyzqPibsUhhwUkS
         4L7/LEk0skvzxniKqcvtSoFRriYPEJF69xr/wAwjzVmxFIFD2nrsm9VcTSzMEhLU6u
         QUjN6qgGIbIO0vJ/Nliovkkk+1W/kg8sWIE10np0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34962314032502
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 May 2023 01:02:03 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 01:02:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 01:02:03 -0500
Received: from [172.24.145.182] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 349620DA048439;
        Tue, 9 May 2023 01:02:01 -0500
Message-ID: <34d643ea-b608-c7a6-5895-493c7df8e9fd@ti.com>
Date:   Tue, 9 May 2023 11:32:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 48/89] i2c: omap: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <kernel@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-49-u.kleine-koenig@pengutronix.de>
From:   Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20230508205306.1474415-49-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 09/05/23 02:22, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-omap.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 4199f57a6bf2..58fd6fa3edf1 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1519,7 +1519,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> -static int omap_i2c_remove(struct platform_device *pdev)
> +static void omap_i2c_remove(struct platform_device *pdev)
>  {
>  	struct omap_i2c_dev	*omap = platform_get_drvdata(pdev);
>  	int ret;
> @@ -1535,8 +1535,6 @@ static int omap_i2c_remove(struct platform_device *pdev)
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused omap_i2c_runtime_suspend(struct device *dev)
> @@ -1588,7 +1586,7 @@ static const struct dev_pm_ops omap_i2c_pm_ops = {
>  
>  static struct platform_driver omap_i2c_driver = {
>  	.probe		= omap_i2c_probe,
> -	.remove		= omap_i2c_remove,
> +	.remove_new	= omap_i2c_remove,
>  	.driver		= {
>  		.name	= "omap_i2c",
>  		.pm	= &omap_i2c_pm_ops,


Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>


-- 
Regards
Vignesh
