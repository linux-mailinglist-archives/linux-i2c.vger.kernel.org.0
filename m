Return-Path: <linux-i2c+bounces-9664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC89A4AB33
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 14:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 584E37A6F27
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6A11DF277;
	Sat,  1 Mar 2025 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqkF2P85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E141DEFD4;
	Sat,  1 Mar 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835619; cv=none; b=oiNSXaGYbvAzD1x6UQgUjgyxcjdw18DSgQqBcH42lPmH3wLD0UTij6ofuHHIefpYWgOJJykn8d4Vm9CFVZQ7wxhfc36Hgn8H0Lo+tKOjo/InlYEi4mwX2BnOO91snZeVKDGSXmikpPRHOQfvbe2Tu3do0/FAK5BqsiOSsrYNUAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835619; c=relaxed/simple;
	bh=ZwTNgDBBxGJCBuitaW+0dpjojQHx4mloiV0Kr6EiR5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLUW03oPc204ZchxnqWdv8c4Y6+zxQ4A/jwLQ9kHa4wtcIqzNTv0k1V0akWwTAsSO2qTxwadfmL7G3KNlwv386XE8V6OCiUxJIr0+/CPfnNSN00eS6Tk0piBCGzypbnc2eLO+OGu4OQi45xeT9YD4bLpLbxusWRoAi8FWEu15Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqkF2P85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09629C4CEDD;
	Sat,  1 Mar 2025 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740835618;
	bh=ZwTNgDBBxGJCBuitaW+0dpjojQHx4mloiV0Kr6EiR5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IqkF2P85T62uujirrXkp2X+nerKvVdOcaKocoB+14OssavobLGVU+hTRjcSkbi1LK
	 zGKKhCqmpHMm91spJ5kT+lLDED/5lAyaoEP/7KW+mXTzUZljia0xTkMG75K8RWk2Fn
	 BR77Q9j7YpEt9yJPk7KDebnSrUFY9dawd6xuTzo+0PGP7/5O9yh/7e1kYN3Qg/fxVd
	 Lp+f5rEYVnL0D+97YiOVGjcGB8O42Rb1hVRu2NSZx1lqTC3F2n57lc1qoCxvsfbOrg
	 F70u3WSd83h9FkfJlngCUU63iwS5GXdziAdELkxV62inXxHhvnfP9sUcI3syfDC9pv
	 v4qyENOs2n2xQ==
Message-ID: <3b2c9842-8910-4ab1-84af-01013289c3b8@kernel.org>
Date: Sat, 1 Mar 2025 14:26:53 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2025 17:45, Pratap Nirujogi wrote:
>  config I2C_DESIGNWARE_AMDPSP
>  	bool "AMD PSP I2C semaphore support"
>  	depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1c2a4510abe4..cfe53038df69 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
>  i2c-designware-platform-y 				:= i2c-designware-platdrv.o
>  i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
>  i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>  obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
>  i2c-designware-pci-y					:= i2c-designware-pcidrv.o
>  obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> new file mode 100644
> index 000000000000..dc90510a440b
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -0,0 +1,266 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.

Don't add custom license boilerplate.


> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/suspend.h>
> +#include <linux/units.h>
> +
> +#include "i2c-designware-core.h"
> +#include "i2c-designware-amdisp.h"
> +
> +#define AMD_ISP_I2C_INPUT_CLK			100 //100 Mhz
> +
> +#define to_amd_isp_i2c_dev(dev) \
> +	((struct amd_isp_i2c_dev *)container_of(dev, struct amd_isp_i2c_dev, dw_dev))

Why do you need to cast? To drop const? That's poor coding.

> +
> +struct amd_isp_i2c_dev {
> +	struct dw_i2c_dev	dw_dev;
> +};
> +
> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
> +{
> +	pm_runtime_disable(dev->dev);
> +
> +	if (dev->shared_with_punit)
> +		pm_runtime_put_noidle(dev->dev);
> +}
> +
> +static u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *dev)
> +{
> +	return AMD_ISP_I2C_INPUT_CLK * 1000;
> +}
> +
> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
> +{
> +	struct i2c_adapter *adap;
> +	struct amd_isp_i2c_dev *isp_i2c_dev;
> +	struct dw_i2c_dev *dev;
> +	int ret;
> +
> +	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct amd_isp_i2c_dev),

sizeof(*)

> +				   GFP_KERNEL);
> +	if (!isp_i2c_dev)
> +		return -ENOMEM;
> +
> +	dev = &isp_i2c_dev->dw_dev;
> +	dev->dev = &pdev->dev;
> +
> +	/**

Not a kerneldoc.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1. Most of these commands (checks or W=1
build) can build specific targets, like some directory, to narrow the
scope to only your code. The code here looks like it needs a fix. Feel
free to get in touch if the warning is not clear.

> +	 * Use the polling mode to send/receive the data, because
> +	 * no IRQ connection from ISP I2C
> +	 */
> +	dev->flags |= ACCESS_POLLING;
> +	platform_set_drvdata(pdev, dev);
> +
> +	dev->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dev->base))
> +		return PTR_ERR(dev->base);
> +
> +	ret = isp_power_set(true);
> +	if (ret) {
> +		dev_err(dev->dev, "unable to turn on the amdisp i2c power:%d\n", ret);

Syntax is return dev_err_probe()

> +		return ret;
> +	}
> +
> +	dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
> +	ret = i2c_dw_fw_parse_and_configure(dev);
> +	if (ret)
> +		goto exit;
> +
> +	i2c_dw_configure(dev);
> +
> +	adap = &dev->adapter;
> +	adap->owner = THIS_MODULE;
> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +	adap->dev.of_node = pdev->dev.of_node;
> +	/* arbitrary large number to avoid any conflicts */
> +	adap->nr = 99;
> +
> +	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE);
> +	} else {
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE |
> +					DPM_FLAG_SMART_SUSPEND);
> +	}
> +
> +	device_enable_async_suspend(&pdev->dev);
> +
> +	/* The code below assumes runtime PM to be disabled. */
> +	WARN_ON(pm_runtime_enabled(&pdev->dev));

And how it could be enabled? Drop or fix your driver.

> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +
> +	if (dev->shared_with_punit)
> +		pm_runtime_get_noresume(&pdev->dev);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = i2c_dw_probe(dev);
> +	if (ret) {
> +		dev_err(dev->dev, "i2c_dw_probe failed %d\n", ret);

Use dev_err_probe()

> +		goto exit_probe;
> +	}
> +
> +	isp_power_set(false);
> +	return ret;
> +
> +exit_probe:
> +	amd_isp_dw_i2c_plat_pm_cleanup(dev);
> +	isp_power_set(false);
> +exit:
> +	isp_power_set(false);
> +	return ret;
> +}
> +
> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
> +{
> +	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	i2c_del_adapter(&dev->adapter);
> +
> +	i2c_dw_disable(dev);
> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_put_sync(&pdev->dev);
> +	amd_isp_dw_i2c_plat_pm_cleanup(dev);
> +
> +	reset_control_assert(dev->rst);
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
> +
> +	i2c_mark_adapter_suspended(&i_dev->adapter);
> +
> +	return amd_isp_dw_i2c_plat_runtime_suspend(dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (!i_dev->shared_with_punit)
> +		i2c_dw_prepare_clk(i_dev, true);
> +
> +	i_dev->init(i_dev);
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
> +		.name	= "amd_isp_i2c_designware",
> +		.pm	= pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
> +	},
> +};
> +
> +static int __init amd_isp_dw_i2c_init_driver(void)
> +{
> +	return platform_driver_register(&amd_isp_dw_i2c_driver);
> +}
> +subsys_initcall(amd_isp_dw_i2c_init_driver);

Why this cannot be standard module initcall? This is ISP, not a critical
boot component.

> +
> +static void __exit amd_isp_dw_i2c_exit_driver(void)
> +{
> +	platform_driver_unregister(&amd_isp_dw_i2c_driver);
> +}
> +module_exit(amd_isp_dw_i2c_exit_driver);
> +
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("I2C_DW");
> +MODULE_IMPORT_NS("I2C_DW_COMMON");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.h b/drivers/i2c/busses/i2c-designware-amdisp.h
> new file mode 100644
> index 000000000000..f98661fdaedf
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.

Don't add custom license boilerplate.

> + */
> +
> +int isp_power_set(int on);


Best regards,
Krzysztof

