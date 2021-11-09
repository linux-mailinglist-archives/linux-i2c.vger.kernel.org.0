Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E4D44AACA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 10:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhKIJub convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 9 Nov 2021 04:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242424AbhKIJub (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 04:50:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C781C061766
        for <linux-i2c@vger.kernel.org>; Tue,  9 Nov 2021 01:47:44 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkNj9-0001XH-6x; Tue, 09 Nov 2021 10:47:39 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkNj5-000VTx-Fl; Tue, 09 Nov 2021 10:47:35 +0100
Message-ID: <6d87acc51ed6fea6a93b92dbcc65f46a3c05ac35.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] I2C: Add I2C driver for Sunplus SP7021
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     "LH.Kuo" <lhjeff911@gmail.com>, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, wells.lu@sunplus.com,
        "LH.Kuo" <lh.kuo@sunplus.com>
Date:   Tue, 09 Nov 2021 10:47:35 +0100
In-Reply-To: <1636441166-8127-2-git-send-email-lh.kuo@sunplus.com>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
         <1636441166-8127-1-git-send-email-lh.kuo@sunplus.com>
         <1636441166-8127-2-git-send-email-lh.kuo@sunplus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2021-11-09 at 14:59 +0800, LH.Kuo wrote:
[...]
> +static int sp_i2c_probe(struct platform_device *pdev)
> +{
> +	struct sp_i2c_dev *sp_i2c_dev_info;
> +	struct i2c_adapter *p_adap;
> +	unsigned int i2c_clk_freq;
> +	int device_id = 0;
> +	int ret = I2C_SUCCESS;
> +	struct device *dev = &pdev->dev;
> +	const struct i2c_compatible *dev_mode;
> +
> +	if (pdev->dev.of_node) {
> +		pdev->id = of_alias_get_id(pdev->dev.of_node, "i2c");
> +		dev_err(&pdev->dev, "pdev->id=%d\n", pdev->id);
> +		device_id = pdev->id;
> +	}
> +
> +	sp_i2c_dev_info = devm_kzalloc(&pdev->dev, sizeof(*sp_i2c_dev_info), GFP_KERNEL);
> +	if (!sp_i2c_dev_info)
> +		return -ENOMEM;
> +
> +	if (!of_property_read_u32(pdev->dev.of_node, "clock-frequency", &i2c_clk_freq)) {
> +		dev_err(&pdev->dev, "clk_freq %d\n", i2c_clk_freq);
> +		sp_i2c_dev_info->i2c_clk_freq = i2c_clk_freq;
> +	} else {
> +		sp_i2c_dev_info->i2c_clk_freq = SP_I2C_FREQ*1000;
> +	}
> +
> +	sp_i2c_dev_info->dev = &pdev->dev;
> +
> +	ret = _sp_i2cm_get_resources(pdev, sp_i2c_dev_info);
> +	if (ret != I2C_SUCCESS) {
> +		dev_err(&pdev->dev, " get resources fail !\n");
> +		return ret;
> +	}
> +
> +	/* dma alloc*/
> +	sp_i2c_dev_info->dma_vir_base = dma_alloc_coherent(&pdev->dev, SP_BUFFER_SIZE,
> +					&sp_i2c_dev_info->dma_phy_base, GFP_ATOMIC);
> +	if (!sp_i2c_dev_info->dma_vir_base)
> +		goto free_dma;

Please fix your error paths, the driver shouldn't try to revert the
action that just failed.

Here you can use dmam_alloc_coherent() and just return -ENOMEM on error.

> +
> +	sp_i2c_dev_info->clk = devm_clk_get(dev, NULL);
> +
> +	if (IS_ERR(sp_i2c_dev_info->clk)) {
> +		ret = PTR_ERR(sp_i2c_dev_info->clk);
> +		dev_err(&pdev->dev, "failed to retrieve clk: %d\n", ret);
> +		goto err_clk_disable;

Then this could

		return ret;

Better, use return dev_err_probe().

> +	}
> +
> +	sp_i2c_dev_info->rstc = devm_reset_control_get_exclusive(dev, NULL);
> +
> +	if (IS_ERR(sp_i2c_dev_info->rstc)) {
> +		ret = PTR_ERR(sp_i2c_dev_info->rstc);
> +		dev_err(&pdev->dev, "failed to retrieve reset controller: %d\n", ret);
> +		goto err_clk_disable;

Same as above.

> +	}
> +
> +	ret = clk_prepare_enable(sp_i2c_dev_info->clk);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable clk: %d\n", ret);

Consider using "%pe" and ERR_PTR(ret) to print the error name instead of
a number [1].

[1] https://www.kernel.org/doc/html/latest/core-api/printk-formats.html?#error-pointers

> +		goto err_clk_disable;

		return ret;

> +	}
> +
> +	ret = reset_control_deassert(sp_i2c_dev_info->rstc);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to deassert reset line: %d\n", ret);
> +		goto err_reset_assert;

		goto err_clk_disable;

> +	}
> +
> +	init_waitqueue_head(&sp_i2c_dev_info->wait);
> +
> +	dev_mode = of_device_get_match_data(&pdev->dev);
> +	sp_i2c_dev_info->mode = dev_mode->mode;
> +	sp_i2c_dev_info->total_port = dev_mode->total_port;
> +	p_adap = &sp_i2c_dev_info->adap;
> +	sprintf(p_adap->name, "%s%d", SP_DEVICE_NAME, device_id);
> +	p_adap->algo = &sp_algorithm;
> +	p_adap->algo_data = sp_i2c_dev_info;
> +	p_adap->nr = device_id;
> +	p_adap->class = 0;
> +	p_adap->retries = 5;
> +	p_adap->dev.parent = &pdev->dev;
> +	p_adap->dev.of_node = pdev->dev.of_node;
> +
> +	ret = i2c_add_numbered_adapter(p_adap);
> +
> +	ret = _sp_i2cm_init(device_id, sp_i2c_dev_info);
> +	if (ret != 0) {
> +		dev_err(&pdev->dev, "i2c master %d init error\n", device_id);
> +		goto err_reset_assert;

This one is correct, but I'd also print ret.

> +	}
> +
> +	if (ret < 0)
> +		goto err_reset_assert;
> +	else
> +		platform_set_drvdata(pdev, sp_i2c_dev_info);
> +
> +	ret = request_irq(sp_i2c_dev_info->irq, _sp_i2cm_irqevent_handler, IRQF_TRIGGER_HIGH,
> +				p_adap->name, sp_i2c_dev_info);
> +	if (ret) {
> +		dev_err(&pdev->dev, "request irq fail !!\n");
> +		return I2C_ERR_REQUESET_IRQ;

Don't return non-standard error codes. This should return ret instead,
but not before going through the error cleanup path below. Also,
consider using devm_request_irq().

> +	}
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return ret;
> +
> +err_reset_assert:
> +	reset_control_assert(sp_i2c_dev_info->rstc);
> +err_clk_disable:
> +	clk_disable_unprepare(sp_i2c_dev_info->clk);
> +free_dma:
> +	dma_free_coherent(&pdev->dev, SP_BUFFER_SIZE,
> +			sp_i2c_dev_info->dma_vir_base, sp_i2c_dev_info->dma_phy_base);
> +
> +	return ret;
> +}

regards
Philipp
