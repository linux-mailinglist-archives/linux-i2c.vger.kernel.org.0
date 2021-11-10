Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF6A44BDAC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 10:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhKJJTm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 10 Nov 2021 04:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhKJJTl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 04:19:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF68C061764
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 01:16:54 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkjir-0003mV-RL; Wed, 10 Nov 2021 10:16:49 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkjip-0003Jb-3d; Wed, 10 Nov 2021 10:16:47 +0100
Message-ID: <c7d73b7b21d3fda29c6c1cfbebd7b681e057e8cb.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] I2C: Add I2C driver for Sunplus SP7021
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Lh Kuo =?UTF-8?Q?=E9=83=AD=E5=8A=9B=E8=B1=AA?= 
        <lh.Kuo@sunplus.com>, "LH.Kuo" <lhjeff911@gmail.com>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "qinjian@cqplus1.com" <qinjian@cqplus1.com>,
        Wells Lu =?UTF-8?Q?=E5=91=82=E8=8A=B3=E9=A8=B0?= 
        <wells.lu@sunplus.com>
Date:   Wed, 10 Nov 2021 10:16:47 +0100
In-Reply-To: <af65896bb3d94afa9e296a428dcbd0e1@sphcmbx02.sunplus.com.tw>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
         <1636441166-8127-1-git-send-email-lh.kuo@sunplus.com>
         <1636441166-8127-2-git-send-email-lh.kuo@sunplus.com>
         <6d87acc51ed6fea6a93b92dbcc65f46a3c05ac35.camel@pengutronix.de>
         <af65896bb3d94afa9e296a428dcbd0e1@sphcmbx02.sunplus.com.tw>
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

Hi,

On Wed, 2021-11-10 at 05:37 +0000, Lh Kuo 郭力豪 wrote:
[...]
> > > +	/* dma alloc*/
> > > +	sp_i2c_dev_info->dma_vir_base = dma_alloc_coherent(&pdev->dev,
> > SP_BUFFER_SIZE,
> > > +					&sp_i2c_dev_info->dma_phy_base, GFP_ATOMIC);
> > > +	if (!sp_i2c_dev_info->dma_vir_base)
> > > +		goto free_dma;
> > 
> > Please fix your error paths, the driver shouldn't try to revert the action that
> > just failed.
> > 
> > Here you can use dmam_alloc_coherent() and just return -ENOMEM on error.
> > 
> I will make change as below  is it OK ?
> 
> 	/* dma alloc*/
> 	sp_i2c_dev_info->dma_vir_base = dmam_alloc_coherent(&pdev->dev, SP_BUFFER_SIZE,
> 					&sp_i2c_dev_info->dma_phy_base, GFP_ATOMIC);
> 	if (!sp_i2c_dev_info->dma_vir_base)
> 		return -ENOMEM;

Yes, this looks good to me. With this change, you can remove the
dma_free_coherent() calls below.

> > > +
> > > +	sp_i2c_dev_info->clk = devm_clk_get(dev, NULL);
> > > +
> > > +	if (IS_ERR(sp_i2c_dev_info->clk)) {
> > > +		ret = PTR_ERR(sp_i2c_dev_info->clk);
> > > +		dev_err(&pdev->dev, "failed to retrieve clk: %d\n", ret);
> > > +		goto err_clk_disable;
> > 
> > Then this could
> > 
> > 		return ret;
> > 
> > Better, use return dev_err_probe().
> > 
> 
> I will make change as below  is it OK ?
> 
> 	sp_i2c_dev_info->clk = devm_clk_get(dev, NULL);
> 
> 	if (IS_ERR(sp_i2c_dev_info->clk)) {
> 		return dev_err_probe(&pdev->dev, PTR_ERR(sp_i2c_dev_info->clk),
> 				     "Could not get clock\n");
> 	}

Yes.

> > > +	}
> > > +
> > > +	sp_i2c_dev_info->rstc = devm_reset_control_get_exclusive(dev, NULL);
> > > +
> > > +	if (IS_ERR(sp_i2c_dev_info->rstc)) {
> > > +		ret = PTR_ERR(sp_i2c_dev_info->rstc);
> > > +		dev_err(&pdev->dev, "failed to retrieve reset controller: %d\n", ret);
> > > +		goto err_clk_disable;
> > 
> > Same as above.
> > 
> 
> I will make change as below  is it OK ?
> 
> 	sp_i2c_dev_info->rstc = devm_reset_control_get_exclusive(dev, NULL);
> 
> 	if (IS_ERR(sp_i2c_dev_info->rstc)) {
> 		return dev_err_probe(&pdev->dev, PTR_ERR(sp_i2c_dev_info->rstc),
> 				     "Could not get clock\n");
> 	}

The error message should be "Could not get reset\n" instead.

> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(sp_i2c_dev_info->clk);
> > > +
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "failed to enable clk: %d\n", ret);
> > 
> > Consider using "%pe" and ERR_PTR(ret) to print the error name instead of a
> > number [1].
> > 
> > [1]
> > https://www.kernel.org/doc/html/latest/core-api/printk-formats.html?#error-p
> > ointers
> > 
> > > +		goto err_clk_disable;
> > 
> > 		return ret;
> > 
> 
> I will make change as below  is it OK ?
> 
> 	ret = clk_prepare_enable(sp_i2c_dev_info->clk);
> 
> 	if (ret) {
> 		dev_err(&pdev->dev, "failed to enable clk: %pe\n", ERR_PTR(ret));

Ok. Alternatively, you could also use dev_err_probe() as above.

> 		goto err_clk_disable;

Not ok. If clk_prepare_enable() did not succeed, do not call
clk_disable_unprepare(). return ret instead.

> 	}
> 
> > > +	}
> > > +
> > > +	ret = reset_control_deassert(sp_i2c_dev_info->rstc);
> > > +
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "failed to deassert reset line: %d\n", ret);

Consider either changing this to %pe or use dev_err_probe(), for
consistency with the above error messages.

> > > +		goto err_reset_assert;
> > 
> > 		goto err_clk_disable;

This is required as well.

> > 
> > > +	}
> > > +
> > > +	init_waitqueue_head(&sp_i2c_dev_info->wait);
> > > +
> > > +	dev_mode = of_device_get_match_data(&pdev->dev);
> > > +	sp_i2c_dev_info->mode = dev_mode->mode;
> > > +	sp_i2c_dev_info->total_port = dev_mode->total_port;
> > > +	p_adap = &sp_i2c_dev_info->adap;
> > > +	sprintf(p_adap->name, "%s%d", SP_DEVICE_NAME, device_id);
> > > +	p_adap->algo = &sp_algorithm;
> > > +	p_adap->algo_data = sp_i2c_dev_info;
> > > +	p_adap->nr = device_id;
> > > +	p_adap->class = 0;
> > > +	p_adap->retries = 5;
> > > +	p_adap->dev.parent = &pdev->dev;
> > > +	p_adap->dev.of_node = pdev->dev.of_node;
> > > +
> > > +	ret = i2c_add_numbered_adapter(p_adap);
> > > +
> > > +	ret = _sp_i2cm_init(device_id, sp_i2c_dev_info);
> > > +	if (ret != 0) {
> > > +		dev_err(&pdev->dev, "i2c master %d init error\n", device_id);
> > > +		goto err_reset_assert;
> > 
> > This one is correct, but I'd also print ret.
> > 
> 
> I will make change as below  is it OK ?
> 
> 	ret = _sp_i2cm_init(device_id, sp_i2c_dev_info);
> 	if (ret != 0) {
> 		dev_err(&pdev->dev, "i2c master %d init error ret %d\n", device_id, ret);
> 		goto err_reset_assert;
> 	}

Yes, although I'd prefer a consistent style with the error messages
above. For example:

		dev_err(&pdev->dev, "i2c master %d init error: %pe\n", device_id, ERR_PTR(ret));

or

		dev_err_probe(&pdev->dev, ret, "i2c master %d init error", device_id);

> > > +	}
> > > +
> > > +	if (ret < 0)
> > > +		goto err_reset_assert;
> > > +	else
> > > +		platform_set_drvdata(pdev, sp_i2c_dev_info);
> > > +
> > > +	ret = request_irq(sp_i2c_dev_info->irq, _sp_i2cm_irqevent_handler,
> > IRQF_TRIGGER_HIGH,
> > > +				p_adap->name, sp_i2c_dev_info);
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "request irq fail !!\n");
> > > +		return I2C_ERR_REQUESET_IRQ;
> > 
> > Don't return non-standard error codes. This should return ret instead, but not
> > before going through the error cleanup path below. Also, consider using
> > devm_request_irq().
> > 
> 
> I will make change as below  is it OK ?
> 	ret = devm_request_irq(&pdev->dev, sp_i2c_dev_info->irq, _sp_i2cm_irqevent_handler,
> 		IRQF_TRIGGER_HIGH, p_adap->name, sp_i2c_dev_info);
> 	if (ret) {
> 		dev_err(&pdev->dev, "request irq fail !!\n");
> 		return ret;
> 	}

Yes. With this, you can remove the free_irq() call below.

regards
Philipp
