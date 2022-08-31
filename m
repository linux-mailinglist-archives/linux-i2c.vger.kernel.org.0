Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190125A7A75
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Aug 2022 11:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiHaJov (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Aug 2022 05:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiHaJom (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Aug 2022 05:44:42 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF211CEB30;
        Wed, 31 Aug 2022 02:44:41 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHfKr1G4zzYd3s;
        Wed, 31 Aug 2022 17:40:16 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 17:44:39 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <xuwei5@huawei.com>
Subject: Re: [PATCH next v2 1/2] i2c: i2c-hisi: Add support for initializing
 control module via DT
To:     Weilong Chen <chenweilong@huawei.com>, <yangyicong@hisilicon.com>,
        <wsa@kernel.org>
References: <20220825092412.307052-1-chenweilong@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <2aa938d1-e61c-dd0f-dadc-e3c56e8770f3@huawei.com>
Date:   Wed, 31 Aug 2022 17:44:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220825092412.307052-1-chenweilong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

On 2022/8/25 17:24, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.
> 

My comments in v1 remain unresolved and they still apply.

https://lore.kernel.org/linux-i2c/614d97d1-fee7-d8c8-761f-52e7d5d5c42b@huawei.com/

Thanks.

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
