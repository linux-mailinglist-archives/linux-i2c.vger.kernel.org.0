Return-Path: <linux-i2c+bounces-8241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4C9DA409
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 09:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51181283E36
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981DD188904;
	Wed, 27 Nov 2024 08:38:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E290F15E5CA
	for <linux-i2c@vger.kernel.org>; Wed, 27 Nov 2024 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696717; cv=none; b=McEvhF/uBkJ1Xac5U1GGkaiYkigxvYrqFrA/lkTOkPPHW1CxWa/oEq9IYc4+B13KbR1b2oDHmDwQzz0RP+z4xb1e8kY4mo77+r1/mczNh05vEu89MJTT2AxskHQWDBowU1dXn/hGf6xalr76qD1GrnkHMFxU5dowFGsHlhoz+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696717; c=relaxed/simple;
	bh=NMJqt7tjMxUP5RlFgkUDy4ySoVz5/5LA4On5amqKGYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bI0T7Fg5Y6sD5lJ2ClkniAX5it2baj/z/slFsKrJtFh7FZbJWMYmWaBh+owEf12HleNE9z9DOwoLSj9lRmoD0cmYIG8SVOhm36tuTFjPy7CRGFChS++BI+a0+XczJgj8gi55NRjDeruEDHUg4SSUxVT5ejwKV9weWxxeo5b9NdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tGDZ2-0006i3-96; Wed, 27 Nov 2024 09:38:24 +0100
Message-ID: <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
Date: Wed, 27 Nov 2024 09:38:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
To: carlos.song@nxp.com, mkl@pengutronix.de, frank.li@nxp.com,
 o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241127083818.2108201-1-carlos.song@nxp.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241127083818.2108201-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hello Carlos,

On 27.11.24 09:38, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
> have not ready yet.
> 
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
> 
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.

Please try to address open questions before sending new versions of
the patch set. Otherwise, it's difficult to follow the conversation.

Did you see my question[1] on your v2:

| Wouldn't this break probe for all i2c-imx users who have CONFIG_IMX_SDMA
| disabled?
|
| Also I am wondering on what kernel version and what configuration
| (CONFIG_I2C_IMX=?, CONFIG_IMX_SDMA=?) you have that made you run into
| this situation.
|
| I'd have expected that with fw_devlink enabled, the I2C controller wouldn't
| be probed before the DMA provider is available.

[1]: https://lore.kernel.org/all/19a43db4-db5c-4638-9778-d94fb571a206@pengutronix.de/

Thanks,
Ahma

> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> Change for V4:
> - Output "Only use PIO mode" log in debug level when no DMA configure.
> Change for V3:
> - According to Marc's comment, remove error print when defer probe.
>   Add info log when DMA has not been enabled and add error log when
>   DMA error, both won't stuck the i2c adapter register, just for reminding,
>   i2c adapter is working only in PIO mode.
> Change for V2:
> - According to Frank's comments, wrap at 75 char and Simplify fix code
>   at i2c_imx_dma_request().
> - Use strict patch check, fix alignment warning at i2c_imx_dma_request()
> ---
>  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..b11d66d56c55 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
>  }
>  
>  /* Functions for DMA support */
> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> -						dma_addr_t phy_addr)
> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t phy_addr)
>  {
>  	struct imx_i2c_dma *dma;
>  	struct dma_slave_config dma_sconfig;
> -	struct device *dev = &i2c_imx->adapter.dev;
> +	struct device *dev = i2c_imx->adapter.dev.parent;
>  	int ret;
>  
>  	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>  	if (!dma)
> -		return;
> +		return -ENOMEM;
>  
>  	dma->chan_tx = dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
>  		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
>  
> -	return;
> +	return 0;
>  
>  fail_rx:
>  	dma_release_channel(dma->chan_rx);
> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  	dma_release_channel(dma->chan_tx);
>  fail_al:
>  	devm_kfree(dev, dma);
> +
> +	return ret;
>  }
>  
>  static void i2c_imx_dma_callback(void *arg)
> @@ -1803,6 +1804,23 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (ret == -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
>  
> +	/*
> +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> +	 * this platform, that is not a real error, so just remind "only
> +	 * PIO mode is used". If DMA is enabled, but meet error when request
> +	 * DMA channel, error should be showed in probe error log. PIO mode
> +	 * should be available regardless of DMA.
> +	 */
> +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto clk_notifier_unregister;
> +		else if (ret == -ENODEV)
> +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +		else
> +			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");
> +	}
> +
>  	/* Add I2C adapter */
>  	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
>  	if (ret < 0)
> @@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		i2c_imx->adapter.name);
>  	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
>  
> -	/* Init DMA config if supported */
> -	i2c_imx_dma_request(i2c_imx, phy_addr);
> -
>  	return 0;   /* Return OK */
>  
>  clk_notifier_unregister:


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

