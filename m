Return-Path: <linux-i2c+bounces-8726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4099FCF2E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A96A1883437
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 23:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB80C1B6CF0;
	Thu, 26 Dec 2024 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwW+6ZCv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7B1946CC;
	Thu, 26 Dec 2024 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256489; cv=none; b=EYnLPtm0ECMixgSl9oKEdYQvJvhWLjDVPs0dwZKf8I6gnDy3sB5XRGov5pMDcDumAKDAMPRfFW+xdxNrZsMoGe5nLv0OpwLJub2VuD8OXrYQ7LWOgZI90e5IbBf+/uxV79Q5udhOzNi745dEqfmsAomlduDFJpPxiY8ZAScE/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256489; c=relaxed/simple;
	bh=Bwm4QLEVfk/HoEAKgZa0GS2tzYvtGxLw1NdG693YD0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFUVdbNmqq8JPje5oL6dmd/Qrz7vH2Zz4BZwes8fTCD0XKc6reSOQNeImneBFeoeO+UkHGfmmxhrRgI/trxmNH6k7I+rf8+evY3Oc1XPbnkDazIIK1kSvA6NRe3NsJ0Apk0SP0Rt5payToxK4suV20yajzks8CdgIO4fff5AqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwW+6ZCv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822B7C4CED1;
	Thu, 26 Dec 2024 23:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256486;
	bh=Bwm4QLEVfk/HoEAKgZa0GS2tzYvtGxLw1NdG693YD0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwW+6ZCvCaLMp0hmR9IXMFlv+VVQuv8lMBwW4taUgxYXohkl3UX5MPkIykroKIMr4
	 H9BeXyZES6n6q4Y8I6Be/UCPLxQvQXyxnCr4X13lYhKyR3ET80LJIkjZz+LVy+63Kw
	 B4TdJcpW+C4vNzJAxAZ0NT4SRfhlf5o0+ShyqmmJHxyqjJxqV590gE/NHrbRV+TKdz
	 Zg8EzD6E6xhZOirvLkODnXiI5YWGoxxpZyEXjqyHOJgXyRF0zc14bEjNh863ybzl8c
	 3tKaQ7Sv3ZcjGttJ3z3FZgYvEmcTERYRWWanzDYBz9KxzxgoTLkA2+RXVnm1ijUS5s
	 W5PMovmCA75gQ==
Date: Fri, 27 Dec 2024 00:41:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
Message-ID: <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
References: <20241211102337.37956-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211102337.37956-1-brgl@bgdev.pl>

Hi Bartosz,

...

>  struct davinci_i2c_dev {
>  	struct device           *dev;
>  	void __iomem		*base;
> @@ -132,13 +133,10 @@ struct davinci_i2c_dev {
>  #ifdef CONFIG_CPU_FREQ
>  	struct notifier_block	freq_transition;
>  #endif
> -	struct davinci_i2c_platform_data *pdata;
> -};
> -
> -/* default platform data to use if not supplied in the platform_device */
> -static struct davinci_i2c_platform_data davinci_i2c_platform_data_default = {
> -	.bus_freq	= 100,
> -	.bus_delay	= 0,

what happened to bus_delay?

...

> +	/* standard bus frequency (kHz) */
> +	unsigned int		bus_freq;
> +	/* Chip has a ICPFUNC register */
> +	bool			has_pfunc;
>  };

> -static struct i2c_bus_recovery_info davinci_i2c_gpio_recovery_info = {
> -	.recover_bus = i2c_generic_scl_recovery,
> -	.prepare_recovery = davinci_i2c_prepare_recovery,
> -	.unprepare_recovery = davinci_i2c_unprepare_recovery,
> -};
> -

what happened to the gpio_recovery_info?

Andi

