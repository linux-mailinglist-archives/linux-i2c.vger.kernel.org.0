Return-Path: <linux-i2c+bounces-7538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF99AE2D6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 12:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 092C21C21E02
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5BB1C4A37;
	Thu, 24 Oct 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/jxCsBg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F7F1B6D1F;
	Thu, 24 Oct 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766519; cv=none; b=VJ41T5/dPUEu8AztwgzqrbLdXgxrbTPmRIZ4/iiEom/OhFiFf4HIQ9AicanAakNAPXqF/Knk//j7r7oit3sTLyUPRqGkeIXfdEWETMWm7kiQmNHgENmcinmaE38NAb9BXnjuc6YStBo/4XiItFsYD1fXMNLInXC6EO2Lf4VxhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766519; c=relaxed/simple;
	bh=CkOAGRd26mLI67dmD/BaQdzbXEOWA3GpFBs26vS3Fj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoNG4ogaSZmj5L8JVBYIeHGrhKiUek4JT0GA2p3hNjLKph2MdiL7pcFYdqmGLeJDlbUEMQRMQ4jiaXMiv+rgtrqYWyxEN4dh31TXTvItLXzEMcx1A4i3EoTqoxhQR8rq36+Pp8Afac5oib6dYGA6c//JVUTVX+FLbjCjMrvQ/3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/jxCsBg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6862DC4CEC7;
	Thu, 24 Oct 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729766519;
	bh=CkOAGRd26mLI67dmD/BaQdzbXEOWA3GpFBs26vS3Fj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/jxCsBgDfMeAKjiuCwahGbBWnueVH7zNvbB1HbZAAC5BM6BjdVGigaXkQlXMTLDy
	 hHL9/CJGBsyYHj+D42jZ3sxiJzakW+naQGpCb5fv5UjquXyr9oBQ+b/reIjswHlPAk
	 lLPd7StIfrhrZlb78DiJwrvpSirqhtvPmr2J2olct9eTjv6POXFEuqDLTiP8lSVIun
	 HKAIdfa2mpnNUv0IdaCmrr+1c3ngJjYxP0LhW2J5vO5cnukFqXXePteFYtawXvLe3L
	 xlNLeRHzX/D4DR2txiWlsxL2rdp2Kg4kVUIpc++ymcWK0GYJq+8rqvNGLMp7SEXNom
	 hHdapvf8rIQRg==
Date: Thu, 24 Oct 2024 12:41:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 3/9] i2c: Add Nuvoton NCT6694 I2C support
Message-ID: <linka6lz5zpnaf64vmunrn2ezqts5gp5rsbwiaffm4v2mtnqyg@npxgcksgizrn>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-4-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-4-tmyu0@nuvoton.com>

Hi Ming,

...

> +static int __init nct6694_init(void)
> +{
> +	int err;
> +
> +	err = platform_driver_register(&nct6694_i2c_driver);
> +	if (!err) {
> +		if (err)
> +			platform_driver_unregister(&nct6694_i2c_driver);
> +	}
> +
> +	return err;
> +}
> +subsys_initcall(nct6694_init);
> +
> +static void __exit nct6694_exit(void)
> +{
> +	platform_driver_unregister(&nct6694_i2c_driver);
> +}
> +module_exit(nct6694_exit);

Have you thought about using auxiliary driver here?
(auxiliary_bus.h)

Thanks,
Andi

