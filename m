Return-Path: <linux-i2c+bounces-13752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DF2C014AE
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 15:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B416B505EA8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 13:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECE7314B8C;
	Thu, 23 Oct 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7Hx349t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945C314B84;
	Thu, 23 Oct 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225245; cv=none; b=piGtj0V5Ioi+iFaHUSlEiChOl9kpr1SPMzHLaxgJRV35Q96lhcV/3BRANdjIfgYRQGhOZgex7ORujRDyqpvOo7peEPNZwx/BCYIJbnRvPjUm3dJqWjkLz+XWuOcG7sYvZX2/EJPbk1oFo7okNM25HCDMe/UYusPdlfS3jTmleSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225245; c=relaxed/simple;
	bh=EGs1DZThEeB7T1bTJtu2VNgy+mH8lRG20Iswu4fXJbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NX1xkFM8MLLqqQih5LDr+3A8cDSXzl9FGGDqhVxXsceqIZuseP+DR+YezzjX/TmK1e2o/FWGdFOFJNtmCeXeV5gvDEn6tyoB4mMjG1xxiWkhYNlrA9dgvEsIKwfT53DcmAJGdndXx5AvD3vtkuvtzZmUqyWhxIf61gwGLwn2Fn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7Hx349t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C748C4CEF7;
	Thu, 23 Oct 2025 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225243;
	bh=EGs1DZThEeB7T1bTJtu2VNgy+mH8lRG20Iswu4fXJbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7Hx349trsWneBigD6xKiO6v0YXicg1MuJEYXO+cUmbK3iZbqRUa10G/T++X2fryo
	 pVXFlZE9+3PDLUGp6N//z4HE1bfOjWYD6dMpXBYKcSCD1BmmOu5ZFqlZQtSE67x8a3
	 AGxpF4b8umJSY4DX0A55FXG33qT+CFcQ5pQbO8wc5IgV59TSbLv+/SFI4XGvz80RrT
	 cBj/quGKLje80vCZJGa5d9HKeL95ktEjkewAzn70OduOUFF5V1O05N2fZ0qdRzm8yF
	 FVmC3taMoQAMJ3aLmH195PDB5Kye53f649to2WIkQdF4a2uXe6ZIptZ8Dh9PNHlgiC
	 4x0jdLtPdblJQ==
Date: Thu, 23 Oct 2025 15:14:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Lee Jones <lee@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v3 1/4] i2c: machxo2: new driver
Message-ID: <unkntq6gtw7bbunzjj6av7icf6u4kyhommxwqvyaiozaotyzrq@a2n3vzfmvvrg>
References: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>

Hi Matthias,

...

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index fedf5d31f9035..e270f7d9e0254 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -855,6 +855,16 @@ config I2C_LS2X
>  	  This driver can also be built as a module. If so, the module
>  	  will be called i2c-ls2x.
>  
> +config I2C_MACHXO2
> +	tristate "Lattice MachXO2 I2C Controller"
> +	select REGMAP_MMIO

do we need "depends on HAS_IOPORT" here?

> +	help
> +	  If you say yes to this option, support will be included for the
> +	  "Hardened I2C" controller found on the Lattice MachXO2 PLD family.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-machxo2.
> +

...

> +static enum hrtimer_restart machxo2_restart_timer(struct machxo2_i2c *i2c)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	if (!hrtimer_is_queued(&i2c->timer))
> +		hrtimer_forward_now(&i2c->timer, i2c->timer_wait);
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +
> +	/* Exponential backoff for timer */
> +	i2c->timer_wait *= 2;

you could use here

	i2c->timer_wait = ktime_add(i2c->timer_wait, i2c->timer_wait);

> +
> +	return HRTIMER_RESTART;
> +}

...

> +static int machxo2_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct machxo2_i2c *i2c = i2c_get_adapdata(adap);
> +
> +	machxo2_wait_not_busy(i2c, 1000, jiffies_to_usecs(adap->timeout) + 1);
> +
> +	dev_dbg(&adap->dev, "new msg: addr %02x, flags %x, nmsgs %d, len %d\n",
> +		msgs->addr, msgs->flags, num, msgs[0].len);
> +
> +	i2c->msg = msgs;
> +	i2c->pos = 0;
> +	i2c->nmsgs = num;
> +	i2c->error = 0;
> +	i2c->state = MACHXO2_I2C_STATE_START;
> +	/* Ensure that the hrtimer sees the state change */
> +	smp_wmb();
> +
> +	spin_lock_irq(&i2c->lock);

I would use here spin_lock_irq_irqsave()

> +	hrtimer_start(&i2c->timer, 0, HRTIMER_MODE_REL);

nitpick: '0' can be otherwise written as ktime_set(0, 0). Not
important, as you wish.

> +	spin_unlock_irq(&i2c->lock);
> +
> +	if (!wait_event_timeout(i2c->wait, i2c->state == MACHXO2_I2C_STATE_DONE,
> +				adap->timeout)) {

...

> +
> +	pdata = dev_get_platdata(&pdev->dev);
> +	if (!pdata || !pdata->clock_khz)
> +		return -EINVAL;
> +
> +	i2c->clock_khz = pdata->clock_khz;
> +	i2c->bus_khz = pdata->bus_khz;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (IS_ERR(res))
> +		return PTR_ERR(res);

platform_get_resource() returns "a pointer to the resource or
NULL on failure". So that you need to check for "!res" and return
-ENODEV in case.

Thanks,
Andi

> +
> +	if (!devm_request_region(&pdev->dev, res->start, resource_size(res),
> +				 pdev->name))
> +		return dev_err_probe(&pdev->dev, -EBUSY, "Can't get I/O resource.\n");
> +

