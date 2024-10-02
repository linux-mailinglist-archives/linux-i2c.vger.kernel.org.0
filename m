Return-Path: <linux-i2c+bounces-7195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC0998E5C2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 00:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB42028436F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 22:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A578199932;
	Wed,  2 Oct 2024 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJnxKXWu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52714199385;
	Wed,  2 Oct 2024 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727906755; cv=none; b=Gkqw1ZPspYcczk3fuEUN+7uT2agi7+y+qmA+sJX83tNoiNKByI4877YbfJghyYTYQctaGmJkEejP79ixICJ4a3ecQfhowX45Km2fv332g3jUqa7gU+ZTLVzWSkAzRLMXwVeYMRWzhkAf4sTY5zlyq2KkamPi07+sAveqAKBN5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727906755; c=relaxed/simple;
	bh=9mQ3KLSxeEwOtUWpaQP4OvO0OQdJ0gYyYoE8h8h+j6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Of3F7X/V/uzwW4ICXcbqiqnGuPoc7O6vl7xW3xc8l57MzBtnr0lfxGVqxA5yiGZFLM/EV9Wf7kCwyA96+jvN81RBhDQIhlfNU7UMDx8TThkbFpqbABiaJTDJ99Yv1wv0u/LlAYQVTlL7EkAz2UgC4fZuCGPUIGKS73Etgonl9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJnxKXWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8465C4CEC2;
	Wed,  2 Oct 2024 22:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727906755;
	bh=9mQ3KLSxeEwOtUWpaQP4OvO0OQdJ0gYyYoE8h8h+j6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJnxKXWuiNREEg5rKLLUauQDmdMK+ZyVQmMe7Mc4Gz3U/76voyYWrEWf9An9c1Ryj
	 qTiXvQsvswZvXOJDCXZ/ayTsIodqKEKDMCtbhPhHqanRyijwFCjjPqIKaOvD9vTUZ+
	 QWdrt+OE6s9ToJ6cPcALIbZRmhdpU3bOnONoBSMZspvgjgI/W5TcDfRL2aej5t8fb6
	 o1H+1gcQMpGg+sqmSDGky1pmNDIkT7jXyeh3yk8T/SxKzY7Sb4Mz2a8OEiINozY8hw
	 Kq1YsuMAVXIQjactLSuRVlpSQzmJmucpz3hhu3ihzDcHi7RDpYjVu7lvgFaHzFLLEy
	 wVS7i9l/W6Yhw==
Date: Thu, 3 Oct 2024 00:05:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] i2c: imx-lpi2c: add target mode support
Message-ID: <evfhjmeblrucqta2jb74jwul7evqt25tbsxp46xrghytbr645d@t6rvyuriruax>
References: <20240912082413.435267-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912082413.435267-1-carlos.song@nxp.com>

Hi Carlos,

On Thu, Sep 12, 2024 at 04:24:13PM GMT, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> LPI2C support master controller and target controller enabled
> simultaneously. Both controllers share same SDA/SCL lines and

/same/the same/

> interrupt source but has separate control and status registers.

/separate/a separate/

> Even if target mode is enabled, LPI2C can still work normally
> as master controller at the same time.

It's not what happens in the irq handler, though (I left a
comment in irq handler).

> This patch supports basic target data read/write operations in
> 7-bit target address. LPI2C target mode can be enabled by using
> I2C slave backend. I2C slave backend behave like a standard I2C

/behave/behaves/

> client. For simple use and test, Linux I2C slave EEPROM backend
> can be used.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

...

> +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
> +
> +	if (lpi2c_imx->target) {
> +		u32 scr = readl(lpi2c_imx->base + LPI2C_SCR);
> +		u32 ssr = readl(lpi2c_imx->base + LPI2C_SSR);
> +		u32 sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
> +
> +		/* Target is enabled and trigger irq then enter target irq handler */

This sentence is a bit hard to understand, how about:

		/*
		 * The target is enabled and an interrupt has
		 * been triggered. Enter the target's irq handler.
		 */

> +		if ((scr & SCR_SEN) && sier_filter)
> +			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);

Can't the interrupt be generated by the master if
lpi2c_imx->target is assigned?

In the git log you are describing a different behavior.

> +	}
> +
> +	/* Otherwise triggered by master then handle irq in master handler */

Otherwise the interrupt has been triggered by the master. Enter
the master's irq handler.

> +	return lpi2c_imx_master_isr(lpi2c_imx);
> +}
> +
> +static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	u32 temp;
> +
> +	/* reset target module */
> +	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
> +	writel(0, lpi2c_imx->base + LPI2C_SCR);
> +
> +	/* Set target addr */

/addr/address/

> +	writel((lpi2c_imx->target->addr << 1), lpi2c_imx->base + LPI2C_SAMR);
> +
> +	writel(SCFGR1_RXSTALL | SCFGR1_TXDSTALL, lpi2c_imx->base + LPI2C_SCFGR1);
> +
> +	/*
> +	 * set SCFGR2: FILTSDA, FILTSCL and CLKHOLD
> +	 *
> +	 * FILTSCL/FILTSDA can eliminate signal skew. It should generally be
> +	 * set to the same value and should be set >= 50ns.
> +	 *
> +	 * CLKHOLD is only used when clock stretching is enabled, but it will
> +	 * extend the clock stretching to ensure there is an additional delay
> +	 * between the target driving SDA and the target releasing the SCL pin.
> +	 *
> +	 * CLKHOLD setting is crucial for lpi2c target. When master read data
> +	 * from target, if there is a delay caused by cpu idle, excessive load,
> +	 * or other delays between two bytes in one message transmission. so it
> +	 * will cause a short interval time between the driving SDA signal and

/transmission. so it will/transmittion, it will/

> +	 * releasing SCL signal. Lpi2c master will mistakenly think it is a stop

/Lpi2c/The lpi2c/

> +	 * signal resulting in an arbitration failure. This issue can be avoided
> +	 * by setting CLKHOLD.
> +	 *
> +	 * In order to ensure lpi2c function normally when the lpi2c speed is as
> +	 * low as 100kHz, CLKHOLD should be set 3 and it is also compatible with

/3/to 3/

> +	 * higher clock frequency like 400kHz and 1MHz.
> +	 */
> +	temp = SCFGR2_FILTSDA(2) | SCFGR2_FILTSCL(2) | SCFGR2_CLKHOLD(3);
> +	writel(temp, lpi2c_imx->base + LPI2C_SCFGR2);
> +
> +	/*
> +	 * Enable module:
> +	 * SCR_FILTEN can enable digital filter and output delay counter for LPI2C
> +	 * target mode. So SCR_FILTEN need be asserted when enable SDA/SCL FILTER
> +	 * and CLKHOLD.
> +	 */
> +	writel(SCR_SEN | SCR_FILTEN, lpi2c_imx->base + LPI2C_SCR);
> +
> +	/* Enable interrupt from i2c module */
> +	writel(SLAVE_INT_FLAG, lpi2c_imx->base + LPI2C_SIER);
> +}
> +
> +static int lpi2c_imx_reg_target(struct i2c_client *client)

lpi2c_imx_register_target as a name is a bit better, in my opinion

> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (lpi2c_imx->target)
> +		return -EBUSY;
> +
> +	lpi2c_imx->target = client;
> +
> +	ret = pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
> +	if (ret < 0) {
> +		dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c controller");
> +		return ret;
> +	}
> +
> +	lpi2c_imx_target_init(lpi2c_imx);
> +
> +	return 0;
> +}
> +
> +static int lpi2c_imx_unreg_target(struct i2c_client *client)

lpi2c_imx_unregister_target sounds better to me.

> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (!lpi2c_imx->target)
> +		return -EINVAL;
> +

...

> +static int lpi2c_suspend_noirq(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

This function can simply be:

   static int lpi2c_suspend_noirq(struct device *dev)
   {
   	return pm_runtime_force_suspend(dev);
   }

but I'm not strong for it, your choice.

> +}
> +
> +static int lpi2c_resume_noirq(struct device *dev)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If i2c module powered down in system suspend, register
> +	 * value will lose. So reinit target when system resume.
> +	 */

Can we re-write this to something like:

	/*
	 * If the I2C module powers down during system suspend,
	 * the register values will be lost. Therefore, reinitialize
	 * the target when the system resumes.
	 */

Thanks,
Andi

> +	if (lpi2c_imx->target)
> +		lpi2c_imx_target_init(lpi2c_imx);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops lpi2c_pm_ops = {
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				      pm_runtime_force_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
> +				      lpi2c_resume_noirq)
>  	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
>  			   lpi2c_runtime_resume, NULL)
>  };
> -- 
> 2.34.1
> 

