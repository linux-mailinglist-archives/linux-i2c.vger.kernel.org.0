Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 015D259BE72
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 13:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbiHVL2r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 07:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbiHVL2q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 07:28:46 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDC113DD3;
        Mon, 22 Aug 2022 04:28:44 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MB96T0mQVznTgw;
        Mon, 22 Aug 2022 19:26:25 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 19:28:42 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>, <xuwei5@huawei.com>
Subject: Re: [PATCH next] i2c: i2c-hisi: Add support for initializing control
 module via DT
To:     Weilong Chen <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <wsa@kernel.org>
References: <20220822010031.97769-1-chenweilong@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <614d97d1-fee7-d8c8-761f-52e7d5d5c42b@huawei.com>
Date:   Mon, 22 Aug 2022 19:28:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220822010031.97769-1-chenweilong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Weilong,

Thanks for the patch.

It'll be more straightforward for me to make the subject as
"[PATCH] i2c: hisi: Add initial device tree support".

On 2022/8/22 9:00, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
>  drivers/i2c/busses/Kconfig    |  2 +-
>  drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 7284206b278b..6d0fdf48e97d 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -673,7 +673,7 @@ config I2C_HIGHLANDER
>  
>  config I2C_HISI
>  	tristate "HiSilicon I2C controller"
> -	depends on (ARM64 && ACPI) || COMPILE_TEST
> +	depends on ARM64 || COMPILE_TEST
>  	help
>  	  Say Y here if you want to have Hisilicon I2C controller support
>  	  available on the Kunpeng Server.
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index 76c3d8f6fc3c..cba9a6830b23 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -16,6 +16,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/units.h>
> +#include <linux/acpi.h>
> +#include <linux/of.h>
>  

The headers should be in alphabetical order.

>  #define HISI_I2C_FRAME_CTRL		0x0000
>  #define   HISI_I2C_FRAME_CTRL_SPEED_MODE	GENMASK(1, 0)
> @@ -483,17 +485,26 @@ static int hisi_i2c_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_ACPI
>  static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
>  	{ "HISI03D1", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);
> +#endif
> +
> +static const struct of_device_id hisi_i2c_dts_ids[] = {
> +	{ .compatible = "hisilicon,hisi-i2c", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
>  

This should be protected by CONFIG_OF as well, just like ACPI ids.
hisi_i2c_of_ids should be better according to the convention.

Thanks,
Yicong

>  static struct platform_driver hisi_i2c_driver = {
>  	.probe		= hisi_i2c_probe,
>  	.driver		= {
>  		.name	= "hisi-i2c",
> -		.acpi_match_table = hisi_i2c_acpi_ids,
> +		.acpi_match_table = ACPI_PTR(hisi_i2c_acpi_ids),
> +		.of_match_table = of_match_ptr(hisi_i2c_dts_ids),
>  	},
>  };
>  module_platform_driver(hisi_i2c_driver);
> 
