Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC4C605520
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Oct 2022 03:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiJTBpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 21:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiJTBph (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 21:45:37 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7BA16727B;
        Wed, 19 Oct 2022 18:45:36 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mt9MC0PQQzpVj1;
        Thu, 20 Oct 2022 09:42:15 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 09:45:33 +0800
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <yangyicong@hisilicon.com>,
        <robh+dt@kernel.org>, <robh@kernel.org>, <wsa@kernel.org>,
        <xuwei5@huawei.com>
Subject: Re: [PATCH next v6 1/2] i2c: hisi: Add initial device tree support
To:     Weilong Chen <chenweilong@huawei.com>
References: <20221018073012.309355-1-chenweilong@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <b18ac3f5-2b72-aaf6-c818-570c38003a3f@huawei.com>
Date:   Thu, 20 Oct 2022 09:45:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221018073012.309355-1-chenweilong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/10/18 15:30, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.
> 

Still looks good to me:

Acked-by: Yicong Yang <yangyicong@hisilicon.com>

> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v5:
> - Use hisilicon,i2c-ascend910 as compatible string. For more information about
>   the SoC at https://e.huawei.com/en/products/cloud-computing-dc/atlas/ascend-910
> Link: https://lore.kernel.org/linux-i2c/20220920072215.161331-1-chenweilong@huawei.com/
> 
> Change since v4:
> - Remove the protection for the headers for ACPI/OF
> Link: https://lore.kernel.org/lkml/20220909074842.281232-1-chenweilong@huawei.com/T/
> 
>  drivers/i2c/busses/Kconfig    |  2 +-
>  drivers/i2c/busses/i2c-hisi.c | 15 ++++++++++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 264e780ae32e..a2081c03f3c4 100644
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
> index 76c3d8f6fc3c..d58a6d2f1bc6 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2021 HiSilicon Technologies Co., Ltd.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
>  #include <linux/completion.h>
> @@ -13,6 +14,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/units.h>
> @@ -483,17 +485,28 @@ static int hisi_i2c_probe(struct platform_device *pdev)
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
> +#ifdef CONFIG_OF
> +static const struct of_device_id hisi_i2c_dts_ids[] = {
> +	{ .compatible = "hisilicon,i2c-ascend910", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
> +#endif
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
