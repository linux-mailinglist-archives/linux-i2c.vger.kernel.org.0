Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85BD749382
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 04:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbjGFCJY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 22:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjGFCJX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 22:09:23 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9BBBE;
        Wed,  5 Jul 2023 19:09:21 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QxKcz5dTqz67HqD;
        Thu,  6 Jul 2023 10:05:55 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 03:09:17 +0100
Date:   Thu, 6 Jul 2023 10:09:13 +0800
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Elie Morisse <syniurge@gmail.com>,
        "Shyam Sundar S K" <shyam-sundar.s-k@amd.com>
Subject: Re: [PATCH 01/23] i2c: amd-mp2: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706100913.00007c4a@Huawei.com>
In-Reply-To: <20230705204314.89800-2-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
        <20230705204314.89800-2-paul@crapouillou.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.206.101]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed,  5 Jul 2023 22:42:52 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Note that the use of the UNIVERSAL_DEV_PM_OPS() macro was likely to be
> wrong, as it sets the same callbacks for the runtime-PM and system
> suspend/resume. This patch does not change this behaviour, but I suspect
> that it should be changed to use DEFINE_RUNTIME_DEV_PM_OPS() instead, as
> the current documentation for UNIVERSAL_DEV_PM_OPS() suggests.

I'd be tempted to leave this one alone because it'll be much harder
to spot that it's an ex UNIVERSAL_DEV_PM_OPS() that needs some thinking
about after this change.

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> Cc: Elie Morisse <syniurge@gmail.com>
> Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
> ---
>  drivers/i2c/busses/i2c-amd-mp2-pci.c  | 14 +++++---------
>  drivers/i2c/busses/i2c-amd-mp2-plat.c |  8 ++------
>  drivers/i2c/busses/i2c-amd-mp2.h      |  2 --
>  3 files changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index 143165300949..114fe329279a 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -382,7 +382,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
>  	amd_mp2_clear_reg(privdata);
>  }
>  
> -#ifdef CONFIG_PM
>  static int amd_mp2_pci_suspend(struct device *dev)
>  {
>  	struct pci_dev *pci_dev = to_pci_dev(dev);
> @@ -434,9 +433,10 @@ static int amd_mp2_pci_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static UNIVERSAL_DEV_PM_OPS(amd_mp2_pci_pm_ops, amd_mp2_pci_suspend,
> -			    amd_mp2_pci_resume, NULL);
> -#endif /* CONFIG_PM */
> +static const struct dev_pm_ops amd_mp2_pci_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(amd_mp2_pci_suspend, amd_mp2_pci_resume)
> +	RUNTIME_PM_OPS(amd_mp2_pci_suspend, amd_mp2_pci_resume, NULL)
> +};
>  
>  static const struct pci_device_id amd_mp2_pci_tbl[] = {
>  	{PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2)},
> @@ -449,11 +449,7 @@ static struct pci_driver amd_mp2_pci_driver = {
>  	.id_table	= amd_mp2_pci_tbl,
>  	.probe		= amd_mp2_pci_probe,
>  	.remove		= amd_mp2_pci_remove,
> -#ifdef CONFIG_PM
> -	.driver = {
> -		.pm	= &amd_mp2_pci_pm_ops,
> -	},
> -#endif
> +	.driver.pm	= pm_ptr(&amd_mp2_pci_pm_ops),
>  };
>  module_pci_driver(amd_mp2_pci_driver);
>  
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> index 112fe2bc5662..4c677aeaca29 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> @@ -183,7 +183,6 @@ static const struct i2c_algorithm i2c_amd_algorithm = {
>  	.functionality = i2c_amd_func,
>  };
>  
> -#ifdef CONFIG_PM
>  static int i2c_amd_suspend(struct amd_i2c_common *i2c_common)
>  {
>  	struct amd_i2c_dev *i2c_dev = amd_i2c_dev_common(i2c_common);
> @@ -198,7 +197,6 @@ static int i2c_amd_resume(struct amd_i2c_common *i2c_common)
>  
>  	return i2c_amd_enable_set(i2c_dev, true);
>  }
> -#endif
>  
>  static const u32 supported_speeds[] = {
>  	I2C_MAX_HIGH_SPEED_MODE_FREQ,
> @@ -276,10 +274,8 @@ static int i2c_amd_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, i2c_dev);
>  
>  	i2c_dev->common.cmd_completion = &i2c_amd_cmd_completion;
> -#ifdef CONFIG_PM
> -	i2c_dev->common.suspend = &i2c_amd_suspend;
> -	i2c_dev->common.resume = &i2c_amd_resume;
> -#endif
> +	i2c_dev->common.suspend = pm_ptr(&i2c_amd_suspend);
> +	i2c_dev->common.resume = pm_ptr(&i2c_amd_resume);
>  
>  	/* Register the adapter */
>  	amd_mp2_pm_runtime_get(mp2_dev);
> diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
> index 018a42de8b1e..40f3cdcc60aa 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2.h
> +++ b/drivers/i2c/busses/i2c-amd-mp2.h
> @@ -160,10 +160,8 @@ struct amd_i2c_common {
>  	enum speed_enum i2c_speed;
>  	u8 *dma_buf;
>  	dma_addr_t dma_addr;
> -#ifdef CONFIG_PM
>  	int (*suspend)(struct amd_i2c_common *i2c_common);
>  	int (*resume)(struct amd_i2c_common *i2c_common);
> -#endif /* CONFIG_PM */
>  };
>  
>  /**

