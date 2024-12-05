Return-Path: <linux-i2c+bounces-8347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933449E549D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 12:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B447280F05
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 11:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC122144A8;
	Thu,  5 Dec 2024 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieC3culD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04EC2139CF;
	Thu,  5 Dec 2024 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399626; cv=none; b=oi56lOzZUOgaYNrdEJrWCbnJcmeIEVPyaW2sF/p50PxKTSjaNBgRSesJdY7Kc0OOlXBS7YCeDvf9hXSOnWo6yjWOZUAVAkc/7sAur//yVWOqY3o5VntYwInc8ttghsaRxfW8xQdjHHm8q1nnG/6Q2Z7tT8V73rlL8ja2xdVFbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399626; c=relaxed/simple;
	bh=tSQQ66F4jeW5K1srmBU98kc4DpfJggoVb0IT3KWdT8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZqGRV7fbym4dmVIjgkJ9YDZhy4n9bAK8BBz7wUIRG3CZL4Vyx37Bo9Fh1O+J2JP+ArqV6JBefHUdviYLvL7hlsnLqpQaJfUjyxJmx3bsHUPL3JsomXymQKc40YahNjbRfvS7Q1rji0A/ySoPLuWUSU41zyEr5yqdocEvIwfzPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieC3culD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD39C4CED1;
	Thu,  5 Dec 2024 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733399626;
	bh=tSQQ66F4jeW5K1srmBU98kc4DpfJggoVb0IT3KWdT8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieC3culDSl2VwB3HHzWGwlkamj/WY1/e5j1mLUWW4S2mVZY/C+bwQMltWEIliycbU
	 duO3nwxyBS2rQeuoa6YAPdIIyRSEsr7ygvrAIJDwKTRrpfu0l6ESZJ/uwLVym94KNp
	 ok/4jBRqVfeFpAVGZdI08wbFFgm2KYnT/Dn4ReD8ARJ+6+c+J5CdIEsBipqUEdvusY
	 5GLl0yOyQJMwy/mBTvAYUIyXuHUtLjwK7ZPy1voFRC8GQRybdDp5vXATfF91XrP8/l
	 Il+6hFX3C7Ep/Bim+3oG3QgWJHAP8Pv7rqHw0BpdugQWiMTUip/z4hlLviAumJ59Jf
	 pFsBgM34RZwFA==
Date: Thu, 5 Dec 2024 12:53:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Message-ID: <6d6xgvuvu74hm5466xeovgr4qqkwxaxaoeemvfdty3dqnl4gjp@axlzm6mxnzkv>
References: <20241125142108.1613016-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142108.1613016-1-carlos.song@nxp.com>

Hi Carlos,

...

> +static int i2c_imx_suspend(struct device *dev)
> +{
> +	/*
> +	 * Some I2C devices may need I2C controller up during resume_noirq()
> +	 * or suspend_noirq(), if the controller is autosuspended, there is
> +	 * no way to wakeup it once runtime pm is disabled (in suspend_late()).
> +	 * When system resume, I2C controller will be available until runtime pm
> +	 * is enabled(in_resume_early()). But it is too late for some devices.
> +	 * Wakeup the controller in suspend() callback while runtime pm is enabled,
> +	 * I2C controller will be available until suspend_noirq() callback
> +	 * (pm_runtime_force_suspend()) is called. During the resume, I2C controller
> +	 * can be restored by resume_noirq() callback (pm_runtime_force_resume()).
> +	 * Then resume() callback enables autosuspend. It will make I2C controller
> +	 * available until system suspend_noirq() and from resume_noirq().
> +	 */

Just made some little adjustments to the comment above, please
let me know if they are fine:

	/*
	 * Some I2C devices may need the I2C controller to remain active
	 * during resume_noirq() or suspend_noirq(). If the controller is
	 * autosuspended, there is no way to wake it up once runtime PM is
	 * disabled (in suspend_late()).
	 *
	 * During system resume, the I2C controller will be available only
	 * after runtime PM is re-enabled (in resume_early()). However, this
	 * may be too late for some devices.
	 *
	 * Wake up the controller in the suspend() callback while runtime PM
	 * is still enabled. The I2C controller will remain available until
	 * the suspend_noirq() callback (pm_runtime_force_suspend()) is
	 * called. During resume, the I2C controller can be restored by the
	 * resume_noirq() callback (pm_runtime_force_resume()).
	 *
	 * Finally, the resume() callback re-enables autosuspend, ensuring
	 * the I2C controller remains available until the system enters
	 * suspend_noirq() and from resume_noirq().
	 */

If so, I will take it in.

Andi

> +	return pm_runtime_resume_and_get(dev);
> +}

