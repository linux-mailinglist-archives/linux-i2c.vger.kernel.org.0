Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8DD1E2806
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 19:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388653AbgEZRLw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 13:11:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34082 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388373AbgEZRLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 13:11:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QHBR7T023360;
        Tue, 26 May 2020 12:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590513087;
        bh=m1vv9Pt36V9OFzJt77mhU06beHylBKTlUWKMo6h7jvg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=q7K9p7gtH4FKOXPZGY6fDMEer7TioRTs/2kO+uxhU7jAxWIa8u+JQh6ILXrq9iuIc
         TACd+26db6yeTkV4tLNqWdmyvkwLzTZiaCTldnYyJvqlfywETm5R6eKUkanHnFyH1q
         2QjN6HOiyHtUWorfhtQhyOhIJ/wD7so0WdYoTGVk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QHBRJ4073922
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 12:11:27 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 12:11:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 12:11:27 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QHBMh2021939;
        Tue, 26 May 2020 12:11:23 -0500
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_request_irq()
To:     Dejin Zheng <zhengdejin5@gmail.com>, <gregkh@linuxfoundation.org>,
        <rafael@kernel.org>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <michal.simek@xilinx.com>,
        <baruch@tkos.co.il>, <paul@crapouillou.net>,
        <khilman@baylibre.com>, <shawnguo@kernel.org>,
        <festevam@gmail.com>, <vz@mleia.com>, <heiko@sntech.de>,
        <linus.walleij@linaro.org>, <baohua@kernel.org>, <ardb@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
 <20200523145157.16257-2-zhengdejin5@gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c280f421-fadf-41ab-3227-6377906f2a1c@ti.com>
Date:   Tue, 26 May 2020 20:11:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200523145157.16257-2-zhengdejin5@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 23/05/2020 17:51, Dejin Zheng wrote:
> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right for the error handling
> of these two functions in some drivers. so provide this function
> to simplify the driver.
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
> 	- The patch content has not changed. just resend it by this discussion:
> 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
> 
>   drivers/base/platform.c         | 33 +++++++++++++++++++++++++++++++++
>   include/linux/platform_device.h |  4 ++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index c0d0a5490ac6..1d2fd1ea3bc5 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -275,6 +275,39 @@ int platform_irq_count(struct platform_device *dev)
>   }
>   EXPORT_SYMBOL_GPL(platform_irq_count);
>   
> +/**
> + * devm_platform_request_irq - get an irq and allocate an interrupt
> + *				line for a managed device
> + * @pdev: platform device
> + * @num: IRQ number index
> + * @irq: get an IRQ for a device if irq != NULL
> + * @handler: function to be called when the IRQ occurs
> + * @irqflags: interrupt type flags
> + * @devname: an ascii name for the claiming device, dev_name(dev) if NULL
> + * @dev_id: a cookie passed back to the handler function
> + *
> + * Return: zero on success, negative error number on failure.
> + */
> +int devm_platform_request_irq(struct platform_device *pdev, unsigned int num,
> +		unsigned int *irq, irq_handler_t handler,
> +		unsigned long irqflags, const char *devname, void *dev_id)
> +{
> +	int tmp_irq, ret;
> +
> +	tmp_irq = platform_get_irq(pdev, num);
> +	if (tmp_irq < 0)
> +		return tmp_irq;
> +
> +	ret = devm_request_irq(&pdev->dev, tmp_irq, handler, irqflags,
> +				devname, dev_id);
> +	if (ret < 0)
> +		dev_err(&pdev->dev, "can't request IRQ\n");
> +	else if (irq != NULL)
> +		*irq = tmp_irq;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_platform_request_irq);
> +
>   /**
>    * platform_get_resource_byname - get a resource for a device by name
>    * @dev: platform device
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 77a2aada106d..d94652deea5c 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -11,6 +11,7 @@
>   #define _PLATFORM_DEVICE_H_
>   
>   #include <linux/device.h>
> +#include <linux/interrupt.h>
>   
>   #define PLATFORM_DEVID_NONE	(-1)
>   #define PLATFORM_DEVID_AUTO	(-2)
> @@ -70,6 +71,9 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
>   extern int platform_get_irq(struct platform_device *, unsigned int);
>   extern int platform_get_irq_optional(struct platform_device *, unsigned int);
>   extern int platform_irq_count(struct platform_device *);
> +extern int devm_platform_request_irq(struct platform_device *pdev,
> +		unsigned int num, unsigned int *irq, irq_handler_t handler,
> +		unsigned long irqflags, const char *devname, void *dev_id);


it has to be documented in devres.rst

>   extern struct resource *platform_get_resource_byname(struct platform_device *,
>   						     unsigned int,
>   						     const char *);
> 



-- 
Best regards,
grygorii
