Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA64E1D8036
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 19:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgERRes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 13:34:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37858 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgERRes (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 13:34:48 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04IHYE2R024910;
        Mon, 18 May 2020 12:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589823254;
        bh=Qjkak8hZKljuAbNj3SzKadbkKVBCbSYsAFGNPjlT43I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=e3MtD1jcSwwIFlNTmMDvihFbeOYPhVuUl32uChY+1kMAXY5Kt8/SoPNEPjXEv99Be
         XpShpA+JJzYb2aLWuso0LHWGhCXC0w7mguy+ctJRVef8YG3ROyClPV2CoTWQpTlVvk
         NiN6aAqdZ+UeX+C19jqdcxQ9Xs920cynQOuiVvd4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04IHYErC063206
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 May 2020 12:34:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 12:34:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 12:34:14 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04IHY7u8020575;
        Mon, 18 May 2020 12:34:07 -0500
Subject: Re: [PATCH v1 2/2] i2c: busses: convert to
 devm_platform_request_irq()
To:     Dejin Zheng <zhengdejin5@gmail.com>, <gregkh@linuxfoundation.org>,
        <rafael@kernel.org>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <michal.simek@xilinx.com>,
        <baruch@tkos.co.il>, <wsa+renesas@sang-engineering.com>,
        <paul@crapouillou.net>, <khilman@baylibre.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <vz@mleia.com>,
        <slemieux.tyco@gmail.com>, <heiko@sntech.de>, <baohua@kernel.org>,
        <linus.walleij@linaro.org>, <ardb@kernel.org>,
        <radu_nicolae.pirea@upb.ro>, <zhouyanjie@wanyeetech.com>,
        <linux-i2c@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
References: <20200518155304.28639-1-zhengdejin5@gmail.com>
 <20200518155304.28639-3-zhengdejin5@gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c4f33036-1a88-1d75-c4ce-3024d2bf9bb1@ti.com>
Date:   Mon, 18 May 2020 20:34:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518155304.28639-3-zhengdejin5@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 18/05/2020 18:53, Dejin Zheng wrote:
> Use devm_platform_request_irq() to simplify code, and it contains
> platform_get_irq() and devm_request_irq().
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>   drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++-------------
>   drivers/i2c/busses/i2c-cadence.c   | 10 +++-------
>   drivers/i2c/busses/i2c-digicolor.c | 10 +++-------
>   drivers/i2c/busses/i2c-emev2.c     |  5 ++---
>   drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
>   drivers/i2c/busses/i2c-meson.c     | 13 ++++---------
>   drivers/i2c/busses/i2c-mxs.c       |  9 +++------
>   drivers/i2c/busses/i2c-pnx.c       |  9 ++-------
>   drivers/i2c/busses/i2c-rcar.c      |  9 +++------
>   drivers/i2c/busses/i2c-rk3x.c      | 14 +++-----------
>   drivers/i2c/busses/i2c-sirf.c      | 10 ++--------
>   drivers/i2c/busses/i2c-stu300.c    |  4 ++--
>   drivers/i2c/busses/i2c-synquacer.c | 12 +++---------
>   13 files changed, 35 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index ed5e1275ae46..f45acb47552a 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -818,20 +818,10 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
>   	       ISR_NOACK_MASK,
>   	       dev->base + ISR_OFFSET);
>   
> -	/* Get the interrupt number */
> -	dev->irq = platform_get_irq(pdev, 0);
> -	if (dev->irq < 0) {
> -		rc = dev->irq;
> -		goto probe_disable_clk;
> -	}
> -
> -	/* register the ISR handler */
> -	rc = devm_request_irq(&pdev->dev, dev->irq, bcm_kona_i2c_isr,
> -			      IRQF_SHARED, pdev->name, dev);
> -	if (rc) {
> -		dev_err(dev->device, "failed to request irq %i\n", dev->irq);
> +	rc = devm_platform_request_irq(pdev, 0, &dev->irq, bcm_kona_i2c_isr,
> +					IRQF_SHARED, pdev->name, dev);
> +	if (rc)
>   		goto probe_disable_clk;
> -	}
>   
>   	/* Enable the controller but leave it idle */
>   	bcm_kona_i2c_send_cmd_to_ctrl(dev, BCM_CMD_NOACTION);
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 4b72398af505..9ffae4d231dc 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1204,8 +1204,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(id->membase))
>   		return PTR_ERR(id->membase);
>   
> -	id->irq = platform_get_irq(pdev, 0);
> -


In many cases It is two strictly different steps
1) Request resource, including IRQ mapping and differed probe handling.
    It should be done as early as possible to avoid unnecessary initialization steps
    when resource (irq) is not ready,  and so avoid boot time increasing.
2) Actually request and enable IRQ, which, in many case, should be done late in probe
    when driver and HW are actually ready to handle IRQs.

here, for example, between this point

>   	id->adap.owner = THIS_MODULE;
>   	id->adap.dev.of_node = pdev->dev.of_node;
>   	id->adap.algo = &cdns_i2c_algo;
> @@ -1256,12 +1254,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   		goto err_clk_dis;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
> -				 DRIVER_NAME, id);
> -	if (ret) {
> -		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);

and this point the following happens:
  - devm_clk_get() can fail and cause probe defer
  - clk_prepare_enable()
  - pm_runtime_.. - pm init
  - cdns_i2c_.. - hw int

> +	ret = devm_platform_request_irq(pdev, 0, &id->irq, cdns_i2c_isr, 0,
> +					DRIVER_NAME, id);

and now platform_get_irq(), which can fail due to IRQ controller not ready,
and all above has to be reverted.

> +	if (ret)
>   		goto err_clk_dis;
> -	}
[...]

A bit risky optimization, especially for bulk changes.

-- 
Best regards,
grygorii
