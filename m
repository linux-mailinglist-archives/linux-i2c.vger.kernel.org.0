Return-Path: <linux-i2c+bounces-9663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6040EA4A9D1
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 09:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4436E1898939
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379311D5141;
	Sat,  1 Mar 2025 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="BIpv6frY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC91C5F08;
	Sat,  1 Mar 2025 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740818513; cv=none; b=Mq0hOQYEkN4b//tNxemmvbJ13D/ubFrW7iuc3liRb/9iuSCTAl8HuwKQSW3Je6wTkZeYRxhlYyjyqP8SgepJUlnBk6qDry9YbgJ8aRd5hIoHCGNu4p3qh8xhYPeGGMCu+mWGT2jivCiJsF6leV/EUxvp17OXcgxexgzF3SDRpRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740818513; c=relaxed/simple;
	bh=hyGMjaCy0pWR20v7ekbd1Tp+Zi3qoeNBeGkBsEOxXGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QP/4ISRxLDgfEnCI6KFDT7uIQE03lj+fjuT+5y4NifEXGc17HO5i9sbCekzq812xXUJqYhy/C1Cvsdc15CxBLdQza/L6Q8930sKREVSJnRrK+53H7zjja2A/7UnPCamBEPbE7v0T1FosYCACmLkZGszHsKZo7NM4YG+1WUNbu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=BIpv6frY; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id oIGttGKEEZnsCoIGwtZKU8; Sat, 01 Mar 2025 09:32:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740817955;
	bh=7m4PNQDsKLWRcHgpSKTRP0ry4XHC/mLJcZUDtnQ7HfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=BIpv6frY5235g34dTbrUL3j0N46seTTGcLsynM9dCvrd8/rO5FcfFRDi4N9C1N+SH
	 5vKVVztuUAX1dDmnJJYUX3bJCIzoyntaZKhVNMfyqzywTyYFHPlN0vpuMk6L4620fg
	 aPdMtF1WYHUikJ7iRh7oYEzs24nbiprFFqTjI+eH8sPOXja8enjH5FgWSELIFwbN4Z
	 h8Prco+QTV8UB7NTPKUm/V3sogldvFoJzrKodqr70CmiaGdgrk9QZZ/be6kq0/+NpZ
	 6XgTdzoSioVm5hq0D7fWT5X/qonxlKhQ3U1puBjAMf7LouFhbItHnY7Omn5t8tc3RR
	 MoGnDnOEhG1AA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 01 Mar 2025 09:32:35 +0100
X-ME-IP: 90.11.132.44
Message-ID: <0c714314-c5b0-4815-9e74-47d2402e8852@wanadoo.fr>
Date: Sat, 1 Mar 2025 09:32:30 +0100
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
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/02/2025 à 17:45, Pratap Nirujogi a écrit :
> The camera sensor is connected via ISP I2C bus in AMD SOC
> architectures. Add new I2C designware driver to support
> new camera sensors on AMD HW.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

...

> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> new file mode 100644
> index 000000000000..dc90510a440b
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -0,0 +1,266 @@
> +/* SPDX-License-Identifier: MIT */

I think that this should be // comment style for SPDX-License-Identifier 
en c files.

> +/*
> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
> + *

...

> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
> +{
> +	struct i2c_adapter *adap;
> +	struct amd_isp_i2c_dev *isp_i2c_dev;
> +	struct dw_i2c_dev *dev;
> +	int ret;
> +
> +	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct amd_isp_i2c_dev),

sizeof(*isp_i2c_dev) maybe?

> +				   GFP_KERNEL);
> +	if (!isp_i2c_dev)
> +		return -ENOMEM;
> +
> +	dev = &isp_i2c_dev->dw_dev;
> +	dev->dev = &pdev->dev;
> +
> +	/**

Just /*

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

return dev_err_probe() would make code slightly simpler.

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

Unneeded { } in both branches.

> +
> +	device_enable_async_suspend(&pdev->dev);
> +
> +	/* The code below assumes runtime PM to be disabled. */
> +	WARN_ON(pm_runtime_enabled(&pdev->dev));
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

dev_err_probe() would make code slightly simpler.

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

Is it needed? (there is apparently no reset_control_deassert() in this 
driver)

> +}

...

> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
> +MODULE_LICENSE("GPL");

MIT is stated in SPDX-License-Identifier

> +MODULE_IMPORT_NS("I2C_DW");
> +MODULE_IMPORT_NS("I2C_DW_COMMON");
> +MODULE_LICENSE("GPL and additional rights");

Is it allowed to have several MODULE_LICENSE?

...

CJ

