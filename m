Return-Path: <linux-i2c+bounces-4651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259C927F16
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 00:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F007B22C1A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 22:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9E61442F0;
	Thu,  4 Jul 2024 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkWnDiCs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A93F9C5;
	Thu,  4 Jul 2024 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720132966; cv=none; b=QO9PPQDyyQ+9fy6NoGaBjca5wC67rDkGCmUnaJzmL5PM7csMmbkBRuY0OJqxFoWd16JekQtBnW+51vT2srkz0gA3oL6SLulmHWM8HihBvqcTrBSa+Z9nh2IBWgiAtgf9tLJcChE+scevf0rrXDCXIHp0rSPqWMZkeWEOxWbP6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720132966; c=relaxed/simple;
	bh=CmVw1bey5YPzVe3/R6YwZS4suLuLgLxIa6Vt6CGJt+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD0Z5E8rXPVy8mhQJMzJvnkXZdksYjTt3jOJ1awfil0FyYpfQjG7O4RS1sITXzPSFaOxNIB4cTVvB0iYF/QvvP+bsFOTTh2dEYJD2+FDX0WVVbDLTg3/eGplYhShdvld9DYNJcxEzXbbwsBK6K0Sjb7ECu+wHazqT1VngjjsZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkWnDiCs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3F7C3277B;
	Thu,  4 Jul 2024 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720132965;
	bh=CmVw1bey5YPzVe3/R6YwZS4suLuLgLxIa6Vt6CGJt+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkWnDiCscmbcRWlsB8Ax2OTPnzy0xPe8Ek9d9deMA8u1qAmTmk4kMsELa0XH4k5Y2
	 /3ltzYt7y7y1ZHABbNWZ2rhpRtTaGHlSTm9/pgO9HaTGIJ0ZozQhG6f8QGk/ZAJoxm
	 +MRrzAgM/b44I2Xp270QxG9TH/W4u0lT8WyCS+wstfdMMfEIE0kJ4p4SxoAa8J4877
	 4pnZxYS378yKauqmJYSDKyQ0+xssHFQKlRHAUnCBpqk6aiMiTaiH0OIrfM82feRV4d
	 Z8jbaJSkg1sGoLzMBJfPVN9wgsF3MmqJXWzK8wTR9Ycsl3wGJM3f0O/tcEZFJCFVP/
	 ybCYnMKRrSe5A==
Date: Fri, 5 Jul 2024 00:42:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Message-ID: <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 83e4d5e14ab6..002b11b020fa 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>  	char *name;
>  };
>  
> +static const char * const riic_rpm_err_msg = "Failed to runtime resume";

Please, don't do this. Much clearer to write the message
explicitly.

> +
>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
>  {
>  	writeb(val, riic->base + riic->info->regs[offset]);
> @@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	struct riic_dev *riic = i2c_get_adapdata(adap);
>  	struct device *dev = adap->dev.parent;
>  	unsigned long time_left;
> -	int i;
> +	int i, ret;
>  	u8 start_bit;
>  
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);

In principle I like the error message to be always checked and I
will always approve it. Whenever there is a return value, even
when we are sure it's always '0', it needs to be checked.

I had lots of discussions in the past about this topic but I
haven't always found support. I'd love to have the ack from a
renesas maintainer here.

> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +		return ret;
> +	}
>  
>  	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
>  		riic->err = -EBUSY;

...

> @@ -498,11 +509,18 @@ static void riic_i2c_remove(struct platform_device *pdev)
>  {
>  	struct riic_dev *riic = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
> -	pm_runtime_get_sync(dev);
> -	riic_writeb(riic, 0, RIIC_ICIER);
> -	pm_runtime_put(dev);
>  	i2c_del_adapter(&riic->adapter);

You swapped the position of this. Please put the
i2c_del_adapter() at the end.

Thanks,
Andi

> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, riic_rpm_err_msg);
> +	} else {
> +		riic_writeb(riic, 0, RIIC_ICIER);
> +		pm_runtime_put(dev);
> +	}
> +
>  	pm_runtime_disable(dev);
>  }
>  
> -- 
> 2.39.2
> 

