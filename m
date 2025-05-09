Return-Path: <linux-i2c+bounces-10913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F4AB0B5C
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 09:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50D9D1C2301B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 07:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2043326FDB9;
	Fri,  9 May 2025 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VkSn/HC/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C5270ECE;
	Fri,  9 May 2025 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774790; cv=none; b=j5mQL8a177QVmiz13GlahOgdoEbfB9nbSh0o3pKRQ0UAh5sUyDSjxdsjJin9FpVMk5k0oGrIDcTCf3Qv08oZL7ZGsnpexec9meIjtnVoZ0DDRL5MOL1y1M3YhhOfFJXlZiME26+2u40fY0PfSJ5VUaXuDhexRz1Prq8Aby931WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774790; c=relaxed/simple;
	bh=8JI2CZf49Vns0Fcaw0E03b15sEgTn3bh0KK5uHLOevw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbqP+669IojlbegvGewiiNLSrOhcQuMiLWp8hvMEc49qwTRw/veYyt8wzky5mYkxTEGZcEbIVPeAg4fVjEFTUDWPTA31IfoxYCGXKhgZgkXo5PpcMHDoxypS8UrGg/R2/4Ozqd65R4DMRizA53Jcf34F7dm/2NU8Kr5Nzw2FaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VkSn/HC/; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DHtkumGVhQJEDDHtkusQSr; Fri, 09 May 2025 09:11:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746774717;
	bh=QbqpHgfWZdWoL+dxr51NWJP/ji7RrPcoN02Bo/D+aZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VkSn/HC/XS4DR2ial8Rge8vMEtVc8//o8TPeHpC7/LQRBIyoBhkq3UYGQc7kQHU0s
	 PwQix5eAtMFFW/U+luipETykyYq51MoKZNMmlNbD0EwIzzIONkC3noZg7G5oggD9Nl
	 HqdVKe8D3iIWcf5F7bK+vJtDy3fFm06ZwNKPPMz7iW5OVxCT1nUz4d9eOxas2cvRQ1
	 vWkRIh/Ob8/OMGdm6/AAgF0SaNjHwOidCcJtDgUURGTA8nDdHDFNS5CwuMzaV/1w9Y
	 HGmZw7JjT9Cgofleb+XWL6iScmXCJJeMZFlMn9+ywk2InIWqf82/LLHEnszG1PdmvG
	 oEoRkDfJjXtmA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 09 May 2025 09:11:57 +0200
X-ME-IP: 90.11.132.44
Message-ID: <fc126869-15f4-48f1-a44c-30c45f8dd2ec@wanadoo.fr>
Date: Fri, 9 May 2025 09:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 mlimonci@amd.com, krzk@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/04/2025 à 20:49, Pratap Nirujogi a écrit :
> The camera sensor is connected via ISP I2C bus in AMD SOC
> architectures. Add new I2C designware driver to support
> new camera sensors on AMD HW.
> 
> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> Co-developed-by: Bin Du <bin.du@amd.com>
> Signed-off-by: Bin Du <bin.du@amd.com>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
> Changes v1 -> v2:
> 
> * Remove dependency on exported symbol "isp_power_set()". Use pm_runtime ops to power on/off ISP controller.
> * Remove hardcoding adapter id to 99. Instead switched to use dynamically allocated adapter id.
> * Cleanup header files.
> * Replace subsys_initcall() with default module_init()
> * Update copyright header and license info.
> * Update MAINTAINERS details for i2c-designware-amdisp.c
> * Fix coding errors based on review feedback.
> 
>   MAINTAINERS                                |   7 +
>   drivers/i2c/busses/Kconfig                 |  10 +
>   drivers/i2c/busses/Makefile                |   1 +
>   drivers/i2c/busses/i2c-designware-amdisp.c | 205 +++++++++++++++++++++
>   4 files changed, 223 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f31aeb6b452e..65b6d985e1ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23519,6 +23519,13 @@ L:	linux-i2c@vger.kernel.org
>   S:	Supported
>   F:	drivers/i2c/busses/i2c-designware-*
>   
> +SYNOPSYS DESIGNWARE I2C DRIVER - AMDISP
> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
> +M:	Bin Du <bin.du@amd.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-designware-amdisp.c
> +
>   SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>   M:	Jaehoon Chung <jh80.chung@samsung.com>
>   L:	linux-mmc@vger.kernel.org
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 83c88c79afe2..adb2910525b1 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-designware-platform.
>   
> +config I2C_DESIGNWARE_AMDISP
> +	tristate "Synopsys DesignWare Platform for AMDISP"
> +	depends on I2C_DESIGNWARE_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  AMDISP Synopsys DesignWare I2C adapter.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called amd_isp_i2c_designware.
> +
>   config I2C_DESIGNWARE_AMDPSP
>   	bool "AMD PSP I2C semaphore support"
>   	depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index c1252e2b779e..04db855fdfd6 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
>   i2c-designware-platform-y 				:= i2c-designware-platdrv.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
>   i2c-designware-pci-y					:= i2c-designware-pcidrv.o
>   obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> new file mode 100644
> index 000000000000..ad6f08338124
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Based on Synopsys DesignWare I2C adapter driver.
> + *
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "i2c-designware-core.h"
> +
> +#define DRV_NAME		"amd_isp_i2c_designware"
> +#define AMD_ISP_I2C_INPUT_CLK	100 /* Mhz */
> +
> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *i2c_dev)
> +{
> +	pm_runtime_disable(i2c_dev->dev);
> +
> +	if (i2c_dev->shared_with_punit)
> +		pm_runtime_put_noidle(i2c_dev->dev);
> +}
> +
> +static inline u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *i2c_dev)
> +{
> +	return AMD_ISP_I2C_INPUT_CLK * 1000;
> +}
> +
> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
> +{
> +	struct dw_i2c_dev *isp_i2c_dev;
> +	struct i2c_adapter *adap;
> +	int ret;
> +
> +	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_i2c_dev), GFP_KERNEL);
> +	if (!isp_i2c_dev)
> +		return -ENOMEM;
> +	isp_i2c_dev->dev = &pdev->dev;
> +
> +	pdev->dev.init_name = DRV_NAME;
> +
> +	/*
> +	 * Use the polling mode to send/receive the data, because
> +	 * no IRQ connection from ISP I2C
> +	 */
> +	isp_i2c_dev->flags |= ACCESS_POLLING;
> +	platform_set_drvdata(pdev, isp_i2c_dev);
> +
> +	isp_i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(isp_i2c_dev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(isp_i2c_dev->base),
> +				     "failed to get IOMEM resource\n");
> +
> +	isp_i2c_dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
> +	ret = i2c_dw_fw_parse_and_configure(isp_i2c_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse i2c dw fwnode and configure\n");
> +
> +	i2c_dw_configure(isp_i2c_dev);
> +
> +	adap = &isp_i2c_dev->adapter;
> +	adap->owner = THIS_MODULE;
> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +	adap->dev.of_node = pdev->dev.of_node;
> +	/* use dynamically allocated adapter id */
> +	adap->nr = -1;
> +
> +	if (isp_i2c_dev->flags & ACCESS_NO_IRQ_SUSPEND)
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE);
> +	else
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE |
> +					DPM_FLAG_SMART_SUSPEND);
> +
> +	device_enable_async_suspend(&pdev->dev);
> +
> +	if (isp_i2c_dev->shared_with_punit)
> +		pm_runtime_get_noresume(&pdev->dev);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	ret = i2c_dw_probe(isp_i2c_dev);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "i2c_dw_probe failed\n");
> +		goto error_release_rpm;
> +	}
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	return 0;
> +
> +error_release_rpm:
> +	amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
> +	pm_runtime_put_sync(&pdev->dev);
> +	return ret;
> +}
> +
> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
> +{
> +	struct dw_i2c_dev *isp_i2c_dev = platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	i2c_del_adapter(&isp_i2c_dev->adapter);

Usually, this match a corresponding i2c_add_adapter().

For my own understaning, in which function/calls path is it hidden?
Is it needed here?

CJ


> +
> +	i2c_dw_disable(isp_i2c_dev);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +	amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
> +{
> +	/*
> +	 * If the ACPI companion device object is present for this device, it
> +	 * may be accessed during suspend and resume of other devices via I2C
> +	 * operation regions, so tell the PM core and middle layers to avoid
> +	 * skipping system suspend/resume callbacks for it in that case.
> +	 */
> +	return !has_acpi_companion(dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (i_dev->shared_with_punit)
> +		return 0;
> +
> +	i2c_dw_disable(i_dev);
> +	i2c_dw_prepare_clk(i_dev, false);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!i_dev)
> +		return -ENODEV;
> +
> +	ret = amd_isp_dw_i2c_plat_runtime_suspend(dev);
> +	if (!ret)
> +		i2c_mark_adapter_suspended(&i_dev->adapter);
> +
> +	return ret;
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (!i_dev)
> +		return -ENODEV;
> +
> +	if (!i_dev->shared_with_punit)
> +		i2c_dw_prepare_clk(i_dev, true);
> +	if (i_dev->init)
> +		i_dev->init(i_dev);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_dw_i2c_plat_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	amd_isp_dw_i2c_plat_runtime_resume(dev);
> +	i2c_mark_adapter_resumed(&i_dev->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
> +	.prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
> +	LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, amd_isp_dw_i2c_plat_resume)
> +	RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, amd_isp_dw_i2c_plat_runtime_resume, NULL)
> +};
> +
> +/* Work with hotplug and coldplug */
> +MODULE_ALIAS("platform:amd_isp_i2c_designware");
> +
> +static struct platform_driver amd_isp_dw_i2c_driver = {
> +	.probe = amd_isp_dw_i2c_plat_probe,
> +	.remove = amd_isp_dw_i2c_plat_remove,
> +	.driver		= {
> +		.name	= DRV_NAME,
> +		.pm	= pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
> +	},
> +};
> +module_platform_driver(amd_isp_dw_i2c_driver);
> +
> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
> +MODULE_IMPORT_NS("I2C_DW");
> +MODULE_IMPORT_NS("I2C_DW_COMMON");
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_LICENSE("GPL");


